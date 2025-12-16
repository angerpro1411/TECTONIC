#include <stdbool.h>
#include "contour_approximation.h"


inline Lines LinearLine(Points FirstP, Points LastP){

    //straight line has a form ax+by+c = 0;
    Lines L1;
    float inverse = 1/(FirstP.x - LastP.x);

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
        L1.a = -(FirstP.y - LastP.y)*inverse;
        L1.c = -(FirstP.y) - L1.a*FirstP.x; 
    }

    return L1;
}

float Distance_Point_Line(Points p,Lines l){
    float dist = 0;
    float temp = l.a*p.x + l.b*p.y + l.c;
    double sum_of_squares = (l.a*l.a + l.b*l.b);
    if (temp >= 0)
        dist = temp / sqrt(sum_of_squares);
    else
        dist = -temp / sqrt(sum_of_squares);
    return (float)dist;
}

//Born to avoid square-root
inline float Distance_Point_Line_Square(Points p,Lines l){
    float dist_square = 0;
    float temp = l.a*p.x + l.b*p.y + l.c;
    double inverse_sum_of_squares = 1/(l.a*l.a + l.b*l.b);

    dist_square = (temp*temp)*inverse_sum_of_squares;

    return (float)dist_square;
}

u16 ContourApproximation(u16 nb_pts, Points p[MAX_VERTICES],Points new_p[MAX_VERTICES], float espilon){
    float espilon_square = espilon*espilon;
    float dist_square;
#pragma HLS ARRAY_PARTITION variable=new_p type=complete
    //first line calculated by first point and last point,
    //two important points that we must be kept.
    Lines l = LinearLine(p[0],p[nb_pts - 1]);
    //first lane mark at pos 0th
    u16 newLandMark = 0;
    	//First point and last point always are kept.
    	CHECK_DISTANCE_LOOP:
        for(u16 i = 1;i < MAX_VERTICES;++i){
#pragma HLS UNROLL
			//calculate new distance
			dist_square = Distance_Point_Line_Square(p[i],l);
			if (dist_square <= espilon_square){
				//Erase the point got distance <= espilon by putting it equal to landMark
				p[i] = p[newLandMark];}
			//dist > espilon
			else{
				//No change that point, create newLandMark and new distance
				l = LinearLine(p[i],p[nb_pts - 1]);
				newLandMark = i;}
			//In case that passes through all value => Done algorithm
			if(i+1 == nb_pts - 1){
				break;}}
    //calculate the new number of points after reduction
    u16 nb_pts_reduce = PointNbReduction(nb_pts,p);
    //Write back new point to old array
    u16 newcnt = 0;
	WRITE_BACK:
	for(u16 i = 0; i < MAX_VERTICES; ++i){
#pragma HLS PIPELINE
		if(isDiffer(p[i],p[i+1])){
			new_p[newcnt] = p[i];
			newcnt++;}
		if (i+1 == nb_pts-1){
			break;}}
	//write the last point.
	new_p[newcnt] = p[nb_pts-1];
    return nb_pts_reduce;}

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
    CHECK_DIFFER_LOOP:
    for(u16 i = 0; i < MAX_VERTICES; ++i){
#pragma HLS PIPELINE
        if(isDiffer(p[i],p[i+1])){
            ++nb_pts_reduce;
        }
        if (i+1 == nb_pts-1)
        	break;
    }

    //With n times that we met different condition, we need to have n+1 number diffrent from each other.
    //For example, given an array 1,2,3,4,5, we will meet different condition 4 times, and we have 5 numbers instead.
    nb_pts_reduce++;

    return nb_pts_reduce;
}


