#include <math.h>
#include <stdbool.h>

#define MAX_VERTICES 250

typedef unsigned int u32;
typedef unsigned char u8;
typedef unsigned short int u16;

typedef struct Points{
    float x;
    float y;
}Points;

typedef struct Lines{
    float a,b,c;
}Lines;

//function declarations
Lines LinearLine(Points FirstP, Points LastP);
float Distance_Point_Line(Points p,Lines l);
bool isDiffer(Points p1,Points p2);
//u16 ContourApproximation(u16 nb_pts, Points* p, float espilon);

u16 ContourApproximation(u16 nb_pts, Points p[MAX_VERTICES],Points new_p[MAX_VERTICES], float espilon);

u16 PointNbReduction(u16 nb_pts , Points*p);
float Distance_Point_Line_Square(Points p,Lines l);
