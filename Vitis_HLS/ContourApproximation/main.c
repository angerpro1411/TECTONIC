#include "stdio.h"
#include <math.h>
#include <stdbool.h>

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
u16 ContourApproximation(u16 nb_pts, Points* p, float espilon);
u16 PointNbReduction(u16 nb_pts , Points*p);

int main(){

    float espilon = 0.50;
    Points p[10] = {{0.1,0.3},{0.5,0.7},{0.9,1.2},{1.1,0.6},{1.5,0.5},{1.3,-0.1},{1.0,-0.4},{0.6,-0.8},{0.4,-1.0},{0.1,-0.2}};

    printf("Size of p = %ld\n",sizeof(p)/8);
    printf("Original array of points is: \n");
    for (u16 i = 0; i < (sizeof(p)/8); ++i){
        
        printf("(%0.1f,%0.1f) ",p[i].x,p[i].y);
    }
    printf("\n");

    u16 newNbPoints = ContourApproximation(10,p,espilon);

    printf("Size of new_p = %d\n",newNbPoints);
    printf("New array of points is: \n");
    for (u16 i = 0; i < newNbPoints; ++i){
        
        printf("(%0.1f,%0.1f) ",p[i].x,p[i].y);
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

u16 ContourApproximation(u16 nb_pts, Points* p, float espilon){
    
    float dist;
    Points np[nb_pts];

    //copy p to np
    for (u16 i = 0; i < nb_pts; ++i){   
        np[i] = p[i];
    }    


    //first line calculated by first point and last point,
    //two important points that we must be kept.
    Lines l = LinearLine(np[0],np[nb_pts - 1]);

    //first lane mark at pos 0th
    u16 newLandMark = 0;    

    for(u16 fullIteration = 0;fullIteration < nb_pts - 1; ++fullIteration){
        //First point and last point always are kept.
        for(int i = newLandMark+1;i < nb_pts-1;++i){
            dist = Distance_Point_Line(np[i],l);
            if (dist <= espilon){
                np[i] = np[newLandMark];
                //in case that passes through all value => done algorithm
                if (i == nb_pts - 2){
                    fullIteration = nb_pts - 1;//this code line uses to exit outer loop.
                }
            }
            else{
                l = LinearLine(np[i],np[nb_pts - 1]);
                newLandMark = i;
                break;                
            }
        }
    }

    //calculate the new number of points after reduction
    u16 nb_pts_reduce = PointNbReduction(nb_pts,np);

    //Write back new point to old array
    u16 newcnt = 0;
    for(u16 i = 0; i < nb_pts-1; ++i){
        if(isDiffer(np[i],np[i+1])){
            p[newcnt] = np[i];
            p[++newcnt] = np[i+1];
        }
    }

    return nb_pts_reduce;
}

bool isDiffer(Points p1,Points p2){
    if ( (p1.x == p2.x) && (p1.y == p2.y) ){
        return 0;
    }
    else 
        return 1;
}

u16 PointNbReduction(u16 nb_pts , Points*p){
    //We have the first point and the last point were kept
    u16 nb_pts_reduce = 0;

    //Calculate the number of different between 1th number and Nth number
    for(u16 i = 0; i < nb_pts-1; ++i){
        if(isDiffer(p[i],p[i+1])){
            ++nb_pts_reduce;
        }
    }

    //With n times that we met different condition, we need to have n+1 number diffrent from each other.
    //For example, given an array 1,2,3,4,5, we will meet different condition 4 times, and we have 5 numbers instead.
    nb_pts_reduce++;

    return nb_pts_reduce;
}