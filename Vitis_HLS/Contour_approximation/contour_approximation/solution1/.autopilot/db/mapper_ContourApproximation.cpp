#include "hls_signal_handler.h"
#include <algorithm>
#include <cassert>
#include <fstream>
#include <iostream>
#include <list>
#include <map>
#include <vector>
#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"
using namespace std;

namespace hls::sim
{
  template<size_t n>
  struct Byte {
    unsigned char a[n];

    Byte()
    {
      for (size_t i = 0; i < n; ++i) {
        a[i] = 0;
      }
    }

    template<typename T>
    Byte<n>& operator= (const T &val)
    {
      std::memcpy(a, &val, n);
      return *this;
    }
  };

  struct SimException : public std::exception {
    const std::string msg;
    const size_t line;
    SimException(const std::string &msg, const size_t line)
      : msg(msg), line(line)
    {
    }
  };

  void errExit(const size_t line, const std::string &msg)
  {
    std::string s;
    s += "ERROR";
//  s += '(';
//  s += __FILE__;
//  s += ":";
//  s += std::to_string(line);
//  s += ')';
    s += ": ";
    s += msg;
    s += "\n";
    fputs(s.c_str(), stderr);
    exit(1);
  }
}


namespace hls::sim
{
  template<size_t n>
  void move(void* to, void* from)
  {
    auto t = (hls::stream<ap_uint<n>>*)to;
    auto f = (hls::stream<ap_uint<n>>*)from;
    while (!f->empty()) {
      t->write(f->read());
    }
  }

  template<size_t n>
  void task_move(void* to, void* from)
  {
    auto t = (hls::stream<ap_uint<n>>*)to;
    auto f = (hls::stream<ap_uint<n>>*)from;
    std::thread(
      [=] () { while (true) { t->write(f->read()); } }
    ).detach();
  }

  template<typename A, typename K, typename S, typename U, typename L, typename I, typename E>
  struct MoveAXIS
  {
    struct ST { A data; K keep; S strb; U user; L last; I id; E dest; };

    static void toSC(void* data, void* keep, void* strb, void* user, void* last, void* id, void* dest, void* axis)
    {
      ST st;
      ((hls::stream<ST>*)axis)->read(st);
      ((hls::stream<A>*)data)->write(st.data);
      ((hls::stream<K>*)keep)->write(st.keep);
      ((hls::stream<S>*)strb)->write(st.strb);
      ((hls::stream<U>*)user)->write(st.user);
      ((hls::stream<L>*)last)->write(st.last);
      ((hls::stream<I>*)id)->write(st.id);
      ((hls::stream<E>*)dest)->write(st.dest);
    }

    static void fromSC(void* data, void* keep, void* strb, void* user, void* last, void* id, void* dest, void* axis)
    {
      ST st;
      ((hls::stream<A>*)data)->read(st.data);
      ((hls::stream<K>*)keep)->read(st.keep);
      ((hls::stream<S>*)strb)->read(st.strb);
      ((hls::stream<U>*)user)->read(st.user);
      ((hls::stream<L>*)last)->read(st.last);
      ((hls::stream<I>*)id)->read(st.id);
      ((hls::stream<E>*)dest)->read(st.dest);
      ((hls::stream<ST>*)axis)->write(st);
    }
  };

  template<size_t sdata, size_t skeep, size_t sstrb, size_t suser,
           size_t slast, size_t sid, size_t sdest>
  void move_to_SC(void* data, void* keep, void* strb, void* user, void* last,
                  void* id, void* dest, void* axis)
  {
    typedef MoveAXIS<ap_uint<sdata>, ap_uint<skeep>, ap_uint<sstrb>,
                     ap_uint<suser>, ap_uint<slast>, ap_uint<sid>,
                     ap_uint<sdest>> M;
    while (!((hls::stream<typename M::ST>*)axis)->empty()) {
      M::toSC(data, keep, strb, user, last, id, dest, axis);
    }
  }

  template<size_t sdata, size_t skeep, size_t sstrb, size_t suser,
           size_t slast, size_t sid, size_t sdest>
  void task_move_to_SC(void* data, void* keep, void* strb, void* user, void* last,
                       void* id, void* dest, void* axis)
  {
    typedef MoveAXIS<ap_uint<sdata>, ap_uint<skeep>, ap_uint<sstrb>,
                     ap_uint<suser>, ap_uint<slast>, ap_uint<sid>,
                     ap_uint<sdest>> M;
    std::thread(
      [=] () { while (true) M::toSC(data, keep, strb, user, last, id, dest, axis); }
    ).detach();
  }

  template<size_t sdata, size_t skeep, size_t sstrb, size_t suser,
           size_t slast, size_t sid, size_t sdest>
  void move_from_SC(void* axis, void* data, void* keep, void* strb, void* user, void* last,
                    void* id, void* dest)
  {
    typedef MoveAXIS<ap_uint<sdata>, ap_uint<skeep>, ap_uint<sstrb>,
                     ap_uint<suser>, ap_uint<slast>, ap_uint<sid>,
                     ap_uint<sdest>> M;
    while (!((hls::stream<ap_uint<sdata>>*)data)->empty()) {
      M::fromSC(data, keep, strb, user, last, id, dest, axis);
    }
  }

  template<size_t sdata, size_t skeep, size_t sstrb, size_t suser,
           size_t slast, size_t sid, size_t sdest>
  void task_move_from_SC(void* axis, void* data, void* keep, void* strb, void* user, void* last,
                         void* id, void* dest)
  {
    typedef MoveAXIS<ap_uint<sdata>, ap_uint<skeep>, ap_uint<sstrb>,
                     ap_uint<suser>, ap_uint<slast>, ap_uint<sid>,
                     ap_uint<sdest>> M;
    std::thread(
      [=] () { while (true) M::fromSC(data, keep, strb, user, last, id, dest, axis); }
    ).detach();
  }
}


namespace hls::sim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    static const size_t total = 1<<10;
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(total)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    if (dynamic) {
      if (++static_cast<DBuffer*>(bufs.front())->ufree == DBuffer::total) {
        if (bufs.size() > 1) {
          bufs.pop_front();
          front = bufs.front()->first;
        } else {
          front = back = bufs.front()->first;
        }
      }
    }
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
using hls::sim::Byte;
extern "C" short ContourApproximation(short, Byte<8>*, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, float);
extern "C" short apatb_ContourApproximation_hw(short __xlx_apatb_param_nb_pts, volatile void * __xlx_apatb_param_p, volatile void * __xlx_apatb_param_new_p_0, volatile void * __xlx_apatb_param_new_p_1, volatile void * __xlx_apatb_param_new_p_2, volatile void * __xlx_apatb_param_new_p_3, volatile void * __xlx_apatb_param_new_p_4, volatile void * __xlx_apatb_param_new_p_5, volatile void * __xlx_apatb_param_new_p_6, volatile void * __xlx_apatb_param_new_p_7, volatile void * __xlx_apatb_param_new_p_8, volatile void * __xlx_apatb_param_new_p_9, volatile void * __xlx_apatb_param_new_p_10, volatile void * __xlx_apatb_param_new_p_11, volatile void * __xlx_apatb_param_new_p_12, volatile void * __xlx_apatb_param_new_p_13, volatile void * __xlx_apatb_param_new_p_14, volatile void * __xlx_apatb_param_new_p_15, volatile void * __xlx_apatb_param_new_p_16, volatile void * __xlx_apatb_param_new_p_17, volatile void * __xlx_apatb_param_new_p_18, volatile void * __xlx_apatb_param_new_p_19, volatile void * __xlx_apatb_param_new_p_20, volatile void * __xlx_apatb_param_new_p_21, volatile void * __xlx_apatb_param_new_p_22, volatile void * __xlx_apatb_param_new_p_23, volatile void * __xlx_apatb_param_new_p_24, volatile void * __xlx_apatb_param_new_p_25, volatile void * __xlx_apatb_param_new_p_26, volatile void * __xlx_apatb_param_new_p_27, volatile void * __xlx_apatb_param_new_p_28, volatile void * __xlx_apatb_param_new_p_29, volatile void * __xlx_apatb_param_new_p_30, volatile void * __xlx_apatb_param_new_p_31, volatile void * __xlx_apatb_param_new_p_32, volatile void * __xlx_apatb_param_new_p_33, volatile void * __xlx_apatb_param_new_p_34, volatile void * __xlx_apatb_param_new_p_35, volatile void * __xlx_apatb_param_new_p_36, volatile void * __xlx_apatb_param_new_p_37, volatile void * __xlx_apatb_param_new_p_38, volatile void * __xlx_apatb_param_new_p_39, volatile void * __xlx_apatb_param_new_p_40, volatile void * __xlx_apatb_param_new_p_41, volatile void * __xlx_apatb_param_new_p_42, volatile void * __xlx_apatb_param_new_p_43, volatile void * __xlx_apatb_param_new_p_44, volatile void * __xlx_apatb_param_new_p_45, volatile void * __xlx_apatb_param_new_p_46, volatile void * __xlx_apatb_param_new_p_47, volatile void * __xlx_apatb_param_new_p_48, volatile void * __xlx_apatb_param_new_p_49, volatile void * __xlx_apatb_param_new_p_50, volatile void * __xlx_apatb_param_new_p_51, volatile void * __xlx_apatb_param_new_p_52, volatile void * __xlx_apatb_param_new_p_53, volatile void * __xlx_apatb_param_new_p_54, volatile void * __xlx_apatb_param_new_p_55, volatile void * __xlx_apatb_param_new_p_56, volatile void * __xlx_apatb_param_new_p_57, volatile void * __xlx_apatb_param_new_p_58, volatile void * __xlx_apatb_param_new_p_59, volatile void * __xlx_apatb_param_new_p_60, volatile void * __xlx_apatb_param_new_p_61, volatile void * __xlx_apatb_param_new_p_62, volatile void * __xlx_apatb_param_new_p_63, volatile void * __xlx_apatb_param_new_p_64, volatile void * __xlx_apatb_param_new_p_65, volatile void * __xlx_apatb_param_new_p_66, volatile void * __xlx_apatb_param_new_p_67, volatile void * __xlx_apatb_param_new_p_68, volatile void * __xlx_apatb_param_new_p_69, volatile void * __xlx_apatb_param_new_p_70, volatile void * __xlx_apatb_param_new_p_71, volatile void * __xlx_apatb_param_new_p_72, volatile void * __xlx_apatb_param_new_p_73, volatile void * __xlx_apatb_param_new_p_74, volatile void * __xlx_apatb_param_new_p_75, volatile void * __xlx_apatb_param_new_p_76, volatile void * __xlx_apatb_param_new_p_77, volatile void * __xlx_apatb_param_new_p_78, volatile void * __xlx_apatb_param_new_p_79, volatile void * __xlx_apatb_param_new_p_80, volatile void * __xlx_apatb_param_new_p_81, volatile void * __xlx_apatb_param_new_p_82, volatile void * __xlx_apatb_param_new_p_83, volatile void * __xlx_apatb_param_new_p_84, volatile void * __xlx_apatb_param_new_p_85, volatile void * __xlx_apatb_param_new_p_86, volatile void * __xlx_apatb_param_new_p_87, volatile void * __xlx_apatb_param_new_p_88, volatile void * __xlx_apatb_param_new_p_89, volatile void * __xlx_apatb_param_new_p_90, volatile void * __xlx_apatb_param_new_p_91, volatile void * __xlx_apatb_param_new_p_92, volatile void * __xlx_apatb_param_new_p_93, volatile void * __xlx_apatb_param_new_p_94, volatile void * __xlx_apatb_param_new_p_95, volatile void * __xlx_apatb_param_new_p_96, volatile void * __xlx_apatb_param_new_p_97, volatile void * __xlx_apatb_param_new_p_98, volatile void * __xlx_apatb_param_new_p_99, volatile void * __xlx_apatb_param_new_p_100, volatile void * __xlx_apatb_param_new_p_101, volatile void * __xlx_apatb_param_new_p_102, volatile void * __xlx_apatb_param_new_p_103, volatile void * __xlx_apatb_param_new_p_104, volatile void * __xlx_apatb_param_new_p_105, volatile void * __xlx_apatb_param_new_p_106, volatile void * __xlx_apatb_param_new_p_107, volatile void * __xlx_apatb_param_new_p_108, volatile void * __xlx_apatb_param_new_p_109, volatile void * __xlx_apatb_param_new_p_110, volatile void * __xlx_apatb_param_new_p_111, volatile void * __xlx_apatb_param_new_p_112, volatile void * __xlx_apatb_param_new_p_113, volatile void * __xlx_apatb_param_new_p_114, volatile void * __xlx_apatb_param_new_p_115, volatile void * __xlx_apatb_param_new_p_116, volatile void * __xlx_apatb_param_new_p_117, volatile void * __xlx_apatb_param_new_p_118, volatile void * __xlx_apatb_param_new_p_119, volatile void * __xlx_apatb_param_new_p_120, volatile void * __xlx_apatb_param_new_p_121, volatile void * __xlx_apatb_param_new_p_122, volatile void * __xlx_apatb_param_new_p_123, volatile void * __xlx_apatb_param_new_p_124, volatile void * __xlx_apatb_param_new_p_125, volatile void * __xlx_apatb_param_new_p_126, volatile void * __xlx_apatb_param_new_p_127, volatile void * __xlx_apatb_param_new_p_128, volatile void * __xlx_apatb_param_new_p_129, volatile void * __xlx_apatb_param_new_p_130, volatile void * __xlx_apatb_param_new_p_131, volatile void * __xlx_apatb_param_new_p_132, volatile void * __xlx_apatb_param_new_p_133, volatile void * __xlx_apatb_param_new_p_134, volatile void * __xlx_apatb_param_new_p_135, volatile void * __xlx_apatb_param_new_p_136, volatile void * __xlx_apatb_param_new_p_137, volatile void * __xlx_apatb_param_new_p_138, volatile void * __xlx_apatb_param_new_p_139, volatile void * __xlx_apatb_param_new_p_140, volatile void * __xlx_apatb_param_new_p_141, volatile void * __xlx_apatb_param_new_p_142, volatile void * __xlx_apatb_param_new_p_143, volatile void * __xlx_apatb_param_new_p_144, volatile void * __xlx_apatb_param_new_p_145, volatile void * __xlx_apatb_param_new_p_146, volatile void * __xlx_apatb_param_new_p_147, volatile void * __xlx_apatb_param_new_p_148, volatile void * __xlx_apatb_param_new_p_149, volatile void * __xlx_apatb_param_new_p_150, volatile void * __xlx_apatb_param_new_p_151, volatile void * __xlx_apatb_param_new_p_152, volatile void * __xlx_apatb_param_new_p_153, volatile void * __xlx_apatb_param_new_p_154, volatile void * __xlx_apatb_param_new_p_155, volatile void * __xlx_apatb_param_new_p_156, volatile void * __xlx_apatb_param_new_p_157, volatile void * __xlx_apatb_param_new_p_158, volatile void * __xlx_apatb_param_new_p_159, volatile void * __xlx_apatb_param_new_p_160, volatile void * __xlx_apatb_param_new_p_161, volatile void * __xlx_apatb_param_new_p_162, volatile void * __xlx_apatb_param_new_p_163, volatile void * __xlx_apatb_param_new_p_164, volatile void * __xlx_apatb_param_new_p_165, volatile void * __xlx_apatb_param_new_p_166, volatile void * __xlx_apatb_param_new_p_167, volatile void * __xlx_apatb_param_new_p_168, volatile void * __xlx_apatb_param_new_p_169, volatile void * __xlx_apatb_param_new_p_170, volatile void * __xlx_apatb_param_new_p_171, volatile void * __xlx_apatb_param_new_p_172, volatile void * __xlx_apatb_param_new_p_173, volatile void * __xlx_apatb_param_new_p_174, volatile void * __xlx_apatb_param_new_p_175, volatile void * __xlx_apatb_param_new_p_176, volatile void * __xlx_apatb_param_new_p_177, volatile void * __xlx_apatb_param_new_p_178, volatile void * __xlx_apatb_param_new_p_179, volatile void * __xlx_apatb_param_new_p_180, volatile void * __xlx_apatb_param_new_p_181, volatile void * __xlx_apatb_param_new_p_182, volatile void * __xlx_apatb_param_new_p_183, volatile void * __xlx_apatb_param_new_p_184, volatile void * __xlx_apatb_param_new_p_185, volatile void * __xlx_apatb_param_new_p_186, volatile void * __xlx_apatb_param_new_p_187, volatile void * __xlx_apatb_param_new_p_188, volatile void * __xlx_apatb_param_new_p_189, volatile void * __xlx_apatb_param_new_p_190, volatile void * __xlx_apatb_param_new_p_191, volatile void * __xlx_apatb_param_new_p_192, volatile void * __xlx_apatb_param_new_p_193, volatile void * __xlx_apatb_param_new_p_194, volatile void * __xlx_apatb_param_new_p_195, volatile void * __xlx_apatb_param_new_p_196, volatile void * __xlx_apatb_param_new_p_197, volatile void * __xlx_apatb_param_new_p_198, volatile void * __xlx_apatb_param_new_p_199, volatile void * __xlx_apatb_param_new_p_200, volatile void * __xlx_apatb_param_new_p_201, volatile void * __xlx_apatb_param_new_p_202, volatile void * __xlx_apatb_param_new_p_203, volatile void * __xlx_apatb_param_new_p_204, volatile void * __xlx_apatb_param_new_p_205, volatile void * __xlx_apatb_param_new_p_206, volatile void * __xlx_apatb_param_new_p_207, volatile void * __xlx_apatb_param_new_p_208, volatile void * __xlx_apatb_param_new_p_209, volatile void * __xlx_apatb_param_new_p_210, volatile void * __xlx_apatb_param_new_p_211, volatile void * __xlx_apatb_param_new_p_212, volatile void * __xlx_apatb_param_new_p_213, volatile void * __xlx_apatb_param_new_p_214, volatile void * __xlx_apatb_param_new_p_215, volatile void * __xlx_apatb_param_new_p_216, volatile void * __xlx_apatb_param_new_p_217, volatile void * __xlx_apatb_param_new_p_218, volatile void * __xlx_apatb_param_new_p_219, volatile void * __xlx_apatb_param_new_p_220, volatile void * __xlx_apatb_param_new_p_221, volatile void * __xlx_apatb_param_new_p_222, volatile void * __xlx_apatb_param_new_p_223, volatile void * __xlx_apatb_param_new_p_224, volatile void * __xlx_apatb_param_new_p_225, volatile void * __xlx_apatb_param_new_p_226, volatile void * __xlx_apatb_param_new_p_227, volatile void * __xlx_apatb_param_new_p_228, volatile void * __xlx_apatb_param_new_p_229, volatile void * __xlx_apatb_param_new_p_230, volatile void * __xlx_apatb_param_new_p_231, volatile void * __xlx_apatb_param_new_p_232, volatile void * __xlx_apatb_param_new_p_233, volatile void * __xlx_apatb_param_new_p_234, volatile void * __xlx_apatb_param_new_p_235, volatile void * __xlx_apatb_param_new_p_236, volatile void * __xlx_apatb_param_new_p_237, volatile void * __xlx_apatb_param_new_p_238, volatile void * __xlx_apatb_param_new_p_239, volatile void * __xlx_apatb_param_new_p_240, volatile void * __xlx_apatb_param_new_p_241, volatile void * __xlx_apatb_param_new_p_242, volatile void * __xlx_apatb_param_new_p_243, volatile void * __xlx_apatb_param_new_p_244, volatile void * __xlx_apatb_param_new_p_245, volatile void * __xlx_apatb_param_new_p_246, volatile void * __xlx_apatb_param_new_p_247, volatile void * __xlx_apatb_param_new_p_248, volatile void * __xlx_apatb_param_new_p_249, float __xlx_apatb_param_espilon) {
using hls::sim::createStream;
  // Collect __xlx_p__tmp_vec
std::vector<Byte<8>> __xlx_p__tmp_vec;
for (size_t i = 0; i < 250; ++i){
__xlx_p__tmp_vec.push_back(((Byte<8>*)__xlx_apatb_param_p)[i]);
}
  int __xlx_size_param_p = 250;
  int __xlx_offset_param_p = 0;
  int __xlx_offset_byte_param_p = 0*8;
  // DUT call
  short ap_return = ContourApproximation(__xlx_apatb_param_nb_pts, __xlx_p__tmp_vec.data(), __xlx_apatb_param_new_p_0, __xlx_apatb_param_new_p_1, __xlx_apatb_param_new_p_2, __xlx_apatb_param_new_p_3, __xlx_apatb_param_new_p_4, __xlx_apatb_param_new_p_5, __xlx_apatb_param_new_p_6, __xlx_apatb_param_new_p_7, __xlx_apatb_param_new_p_8, __xlx_apatb_param_new_p_9, __xlx_apatb_param_new_p_10, __xlx_apatb_param_new_p_11, __xlx_apatb_param_new_p_12, __xlx_apatb_param_new_p_13, __xlx_apatb_param_new_p_14, __xlx_apatb_param_new_p_15, __xlx_apatb_param_new_p_16, __xlx_apatb_param_new_p_17, __xlx_apatb_param_new_p_18, __xlx_apatb_param_new_p_19, __xlx_apatb_param_new_p_20, __xlx_apatb_param_new_p_21, __xlx_apatb_param_new_p_22, __xlx_apatb_param_new_p_23, __xlx_apatb_param_new_p_24, __xlx_apatb_param_new_p_25, __xlx_apatb_param_new_p_26, __xlx_apatb_param_new_p_27, __xlx_apatb_param_new_p_28, __xlx_apatb_param_new_p_29, __xlx_apatb_param_new_p_30, __xlx_apatb_param_new_p_31, __xlx_apatb_param_new_p_32, __xlx_apatb_param_new_p_33, __xlx_apatb_param_new_p_34, __xlx_apatb_param_new_p_35, __xlx_apatb_param_new_p_36, __xlx_apatb_param_new_p_37, __xlx_apatb_param_new_p_38, __xlx_apatb_param_new_p_39, __xlx_apatb_param_new_p_40, __xlx_apatb_param_new_p_41, __xlx_apatb_param_new_p_42, __xlx_apatb_param_new_p_43, __xlx_apatb_param_new_p_44, __xlx_apatb_param_new_p_45, __xlx_apatb_param_new_p_46, __xlx_apatb_param_new_p_47, __xlx_apatb_param_new_p_48, __xlx_apatb_param_new_p_49, __xlx_apatb_param_new_p_50, __xlx_apatb_param_new_p_51, __xlx_apatb_param_new_p_52, __xlx_apatb_param_new_p_53, __xlx_apatb_param_new_p_54, __xlx_apatb_param_new_p_55, __xlx_apatb_param_new_p_56, __xlx_apatb_param_new_p_57, __xlx_apatb_param_new_p_58, __xlx_apatb_param_new_p_59, __xlx_apatb_param_new_p_60, __xlx_apatb_param_new_p_61, __xlx_apatb_param_new_p_62, __xlx_apatb_param_new_p_63, __xlx_apatb_param_new_p_64, __xlx_apatb_param_new_p_65, __xlx_apatb_param_new_p_66, __xlx_apatb_param_new_p_67, __xlx_apatb_param_new_p_68, __xlx_apatb_param_new_p_69, __xlx_apatb_param_new_p_70, __xlx_apatb_param_new_p_71, __xlx_apatb_param_new_p_72, __xlx_apatb_param_new_p_73, __xlx_apatb_param_new_p_74, __xlx_apatb_param_new_p_75, __xlx_apatb_param_new_p_76, __xlx_apatb_param_new_p_77, __xlx_apatb_param_new_p_78, __xlx_apatb_param_new_p_79, __xlx_apatb_param_new_p_80, __xlx_apatb_param_new_p_81, __xlx_apatb_param_new_p_82, __xlx_apatb_param_new_p_83, __xlx_apatb_param_new_p_84, __xlx_apatb_param_new_p_85, __xlx_apatb_param_new_p_86, __xlx_apatb_param_new_p_87, __xlx_apatb_param_new_p_88, __xlx_apatb_param_new_p_89, __xlx_apatb_param_new_p_90, __xlx_apatb_param_new_p_91, __xlx_apatb_param_new_p_92, __xlx_apatb_param_new_p_93, __xlx_apatb_param_new_p_94, __xlx_apatb_param_new_p_95, __xlx_apatb_param_new_p_96, __xlx_apatb_param_new_p_97, __xlx_apatb_param_new_p_98, __xlx_apatb_param_new_p_99, __xlx_apatb_param_new_p_100, __xlx_apatb_param_new_p_101, __xlx_apatb_param_new_p_102, __xlx_apatb_param_new_p_103, __xlx_apatb_param_new_p_104, __xlx_apatb_param_new_p_105, __xlx_apatb_param_new_p_106, __xlx_apatb_param_new_p_107, __xlx_apatb_param_new_p_108, __xlx_apatb_param_new_p_109, __xlx_apatb_param_new_p_110, __xlx_apatb_param_new_p_111, __xlx_apatb_param_new_p_112, __xlx_apatb_param_new_p_113, __xlx_apatb_param_new_p_114, __xlx_apatb_param_new_p_115, __xlx_apatb_param_new_p_116, __xlx_apatb_param_new_p_117, __xlx_apatb_param_new_p_118, __xlx_apatb_param_new_p_119, __xlx_apatb_param_new_p_120, __xlx_apatb_param_new_p_121, __xlx_apatb_param_new_p_122, __xlx_apatb_param_new_p_123, __xlx_apatb_param_new_p_124, __xlx_apatb_param_new_p_125, __xlx_apatb_param_new_p_126, __xlx_apatb_param_new_p_127, __xlx_apatb_param_new_p_128, __xlx_apatb_param_new_p_129, __xlx_apatb_param_new_p_130, __xlx_apatb_param_new_p_131, __xlx_apatb_param_new_p_132, __xlx_apatb_param_new_p_133, __xlx_apatb_param_new_p_134, __xlx_apatb_param_new_p_135, __xlx_apatb_param_new_p_136, __xlx_apatb_param_new_p_137, __xlx_apatb_param_new_p_138, __xlx_apatb_param_new_p_139, __xlx_apatb_param_new_p_140, __xlx_apatb_param_new_p_141, __xlx_apatb_param_new_p_142, __xlx_apatb_param_new_p_143, __xlx_apatb_param_new_p_144, __xlx_apatb_param_new_p_145, __xlx_apatb_param_new_p_146, __xlx_apatb_param_new_p_147, __xlx_apatb_param_new_p_148, __xlx_apatb_param_new_p_149, __xlx_apatb_param_new_p_150, __xlx_apatb_param_new_p_151, __xlx_apatb_param_new_p_152, __xlx_apatb_param_new_p_153, __xlx_apatb_param_new_p_154, __xlx_apatb_param_new_p_155, __xlx_apatb_param_new_p_156, __xlx_apatb_param_new_p_157, __xlx_apatb_param_new_p_158, __xlx_apatb_param_new_p_159, __xlx_apatb_param_new_p_160, __xlx_apatb_param_new_p_161, __xlx_apatb_param_new_p_162, __xlx_apatb_param_new_p_163, __xlx_apatb_param_new_p_164, __xlx_apatb_param_new_p_165, __xlx_apatb_param_new_p_166, __xlx_apatb_param_new_p_167, __xlx_apatb_param_new_p_168, __xlx_apatb_param_new_p_169, __xlx_apatb_param_new_p_170, __xlx_apatb_param_new_p_171, __xlx_apatb_param_new_p_172, __xlx_apatb_param_new_p_173, __xlx_apatb_param_new_p_174, __xlx_apatb_param_new_p_175, __xlx_apatb_param_new_p_176, __xlx_apatb_param_new_p_177, __xlx_apatb_param_new_p_178, __xlx_apatb_param_new_p_179, __xlx_apatb_param_new_p_180, __xlx_apatb_param_new_p_181, __xlx_apatb_param_new_p_182, __xlx_apatb_param_new_p_183, __xlx_apatb_param_new_p_184, __xlx_apatb_param_new_p_185, __xlx_apatb_param_new_p_186, __xlx_apatb_param_new_p_187, __xlx_apatb_param_new_p_188, __xlx_apatb_param_new_p_189, __xlx_apatb_param_new_p_190, __xlx_apatb_param_new_p_191, __xlx_apatb_param_new_p_192, __xlx_apatb_param_new_p_193, __xlx_apatb_param_new_p_194, __xlx_apatb_param_new_p_195, __xlx_apatb_param_new_p_196, __xlx_apatb_param_new_p_197, __xlx_apatb_param_new_p_198, __xlx_apatb_param_new_p_199, __xlx_apatb_param_new_p_200, __xlx_apatb_param_new_p_201, __xlx_apatb_param_new_p_202, __xlx_apatb_param_new_p_203, __xlx_apatb_param_new_p_204, __xlx_apatb_param_new_p_205, __xlx_apatb_param_new_p_206, __xlx_apatb_param_new_p_207, __xlx_apatb_param_new_p_208, __xlx_apatb_param_new_p_209, __xlx_apatb_param_new_p_210, __xlx_apatb_param_new_p_211, __xlx_apatb_param_new_p_212, __xlx_apatb_param_new_p_213, __xlx_apatb_param_new_p_214, __xlx_apatb_param_new_p_215, __xlx_apatb_param_new_p_216, __xlx_apatb_param_new_p_217, __xlx_apatb_param_new_p_218, __xlx_apatb_param_new_p_219, __xlx_apatb_param_new_p_220, __xlx_apatb_param_new_p_221, __xlx_apatb_param_new_p_222, __xlx_apatb_param_new_p_223, __xlx_apatb_param_new_p_224, __xlx_apatb_param_new_p_225, __xlx_apatb_param_new_p_226, __xlx_apatb_param_new_p_227, __xlx_apatb_param_new_p_228, __xlx_apatb_param_new_p_229, __xlx_apatb_param_new_p_230, __xlx_apatb_param_new_p_231, __xlx_apatb_param_new_p_232, __xlx_apatb_param_new_p_233, __xlx_apatb_param_new_p_234, __xlx_apatb_param_new_p_235, __xlx_apatb_param_new_p_236, __xlx_apatb_param_new_p_237, __xlx_apatb_param_new_p_238, __xlx_apatb_param_new_p_239, __xlx_apatb_param_new_p_240, __xlx_apatb_param_new_p_241, __xlx_apatb_param_new_p_242, __xlx_apatb_param_new_p_243, __xlx_apatb_param_new_p_244, __xlx_apatb_param_new_p_245, __xlx_apatb_param_new_p_246, __xlx_apatb_param_new_p_247, __xlx_apatb_param_new_p_248, __xlx_apatb_param_new_p_249, __xlx_apatb_param_espilon);
// print __xlx_apatb_param_p
for (size_t i = 0; i < __xlx_size_param_p; ++i) {
((Byte<8>*)__xlx_apatb_param_p)[i] = __xlx_p__tmp_vec[__xlx_offset_param_p+i];
}
return ap_return;
}
