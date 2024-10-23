#include "stdio.h"
#include "stdlib.h"
#include <math.h>

//libraries for drawing plot
#include "pbPlots.h"
#include "supportLib.h"

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

int main(){

    float espilon = 0.50;
    Lines l;
    float dist;
    Points p[10] = {{0.1,0.3},{0.5,0.7},{0.9,1.2},{1.1,0.6},{1.5,0.5},{1.3,-0.1},{1.0,-0.4},{0.6,-0.8},{0.4,-1.0},{0.1,-0.2}};
    u32 newLandMark;

    printf("Size of p = %ld\n",sizeof(p)/8);
    printf("Original array of points is: \n");
    for (u32 i = 0; i < (sizeof(p)/8); ++i){
        
        printf("(%0.1f,%0.1f) ",p[i].x,p[i].y);
    }
    printf("\n");



    //first line calculated
    l = LinearLine(p[0],p[9]);
    // printf("a = %f, b = %f, c = %f\n",l.a,l.b,l.c);
    // printf("distance between lines and p1 is : %f\n",Distance_Point_Line(p[1],l));

    //first lane mark
    newLandMark = 0;
    
    for(u32 fullIteration = 0;fullIteration < (sizeof(p)/8 - 1); fullIteration++){
        //First point and last point always are kept.
        for(int i = newLandMark+1;i<(sizeof(p)/8-1);++i){
            dist = Distance_Point_Line(p[i],l);
            if (dist <= espilon){
                p[i] = p[newLandMark];
                //in case that passes through all value => done algorithm
                if (i == (sizeof(p)/8-2)){
                    fullIteration = (sizeof(p)/8 - 1);//this code line uses to exit outer loop.
                }
            }
            else{
                l = LinearLine(p[i],p[9]);
                newLandMark = i;
                break;                
            }
        }
    }

    //Reduce size of array


    //print value
    printf("New array of points is: \n");
    for (u32 i = 0; i < (sizeof(p)/8); ++i){
        if ( (p[i].x != p[i+1].x) && (p[i].y != p[i+1].y) ){    
            printf("(%0.1f,%0.1f) ",p[i].x,p[i].y);
        }
    }
    printf("\n");

    return 0;
}

Lines LinearLine(Points FirstP, Points LastP){

    //straight line has a form ax+by+c = 0;
    Lines L1;

    //straight line is in form x = k;
    if (FirstP.x == LastP.x){
        L1.a = 1;
        L1.b = 0;
        L1.c = 0 - FirstP.x;
    }
    //straight line is in form y = k;
    else if(FirstP.y == LastP.y){
        L1.a = 0;
        L1.b = 1;
        L1.c = 0 - FirstP.y;
    }
    //straight line is in form y = ax + c
    else{
        L1.b = 1;
        L1.a = -(FirstP.y - LastP.y)/(FirstP.x - LastP.x);
        L1.c = -(FirstP.y) - L1.a*FirstP.x; 
    }

    return L1;
}

float Distance_Point_Line(Points p,Lines l){
    float dist = 0;
    float temp = l.a*p.x + l.b*p.y + l.c;  
    if (temp >= 0)
        dist = temp / sqrt((double)(l.a*l.a + l.b*l.b));
    else
        dist = -temp / sqrt((double)(l.a*l.a + l.b*l.b));
    return (float)dist;
}

