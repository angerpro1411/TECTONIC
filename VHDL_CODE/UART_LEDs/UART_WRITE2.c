#include <stdio.h>
#include <string.h>

// Linux headers
#include <fcntl.h> // Contains file controls like O_RDWR
#include <errno.h> // Error integer and strerror() function
#include <termios.h> // Contains POSIX terminal control definitions
#include <unistd.h> // write(), read(), close()


int main(){
	int fd;
	unsigned int data;
	struct termios options; 
	
	fd = open("/dev/ttyUSB1", O_RDWR | O_NDELAY | O_NOCTTY);
	if(fd < 0 ){
		perror("Error when opening serial port");
		return -1;
	}
	
	// Read current serial port setting 
	//tcgetattr(fd, &options);
	
	//options control flag for speed, bit
	//options.c_cflag = B9600 | CS8 | CLOCAL | CREAD; //baud rate 9600
	options.c_cflag = B115200 | CS8 | CLOCAL | CREAD;
	
	//ignore parity error
	options.c_iflag = IGNPAR;
	
	//output flag, and local flag
	options.c_oflag = 0;
	options.c_lflag = 0;
	
	//Apply the setting
	tcflush(fd, TCIFLUSH); //clear input buffer TCIOFLASH for clear in output
	tcsetattr(fd, TCSANOW, &options); //apply immediatedly setting
	
	
	
	//printf("Please enter the 8-bit data: 0x");
	//scanf("%x",&data);
	data = 0x01;
	while(1){
		
		printf("Data 0x%x will be send\n\r", data);
		write (fd, &data, 1);
		data <<=1;
		sleep(1);
		}	
	
	
	close(fd);
	return 0;
}
