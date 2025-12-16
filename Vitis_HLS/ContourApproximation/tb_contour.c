#include <stdio.h>
#include <stdlib.h>
#include "contour_approximation.h"
#include <time.h>

void RandomArrayCreator(Points p0, u16 nb_pts, Points* p_array);
char NegativeOrPositive();
Points Axial_X_Symmetry(Points p);

int main(){

#pragma HLS INTERFACE mode=s_axilite depth=100 port=p_100

    float espilon = 0.50;
    Points p[10] = {{0.1,0.3},{0.5,0.7},{0.9,1.2},{1.1,0.6},{1.5,0.5},{1.3,-0.1},{1.0,-0.4},{0.6,-0.8},{0.4,-1.0},{0.1,-0.2}};
//
//    Points p1[20] = {{0.1,0.3},{0.5,0.7},{0.9,1.2},{1.1,0.6},{1.5,0.5},{1.3,-0.1},{1.0,-0.4},{0.6,-0.8},{0.4,-1.0},{0.1,-0.2},
//    		{-0.5,0.0},{-0.8,0.2},{-1.0,0.5},{0.5,0.7},{1.0,-0.4},{1.3,-0.1},{0.4,-1.0},{0.5,0.7},{0.1,0.3},{1.1,0.6}};
//
//    Points result_p[20];


    //Create enviroment for n points
    //New_p uses to store new array.
//    Points p_50[50],new_p_50[50];
    Points p_100[100],new_p_100[100];
//    Points p_1000[1000],new_p_1000[1000];
//    Points p_10000[10000],new_p_10000[10000];

//    RandomArrayCreator(p[0],50,p_50);
//
//    u16 newNbPoints = ContourApproximation(50,p_50,new_p_50,espilon);
//
//    printf("Size of new_p = %d\n",newNbPoints);
//    printf("New array of points is: \n");
//    for (u16 i = 0; i < newNbPoints; ++i){
//
//        printf("(%0.1f,%0.1f) ",new_p_50[i].x,new_p_50[i].y);
//    }
//    printf("\n");

	RandomArrayCreator(p[0],100,p_100);
    u16 newNbPoints = ContourApproximation(100,p_100,new_p_100,espilon);

    printf("Size of new_p = %d\n",newNbPoints);
    printf("New array of points is: \n");
    for (u16 i = 0; i < newNbPoints; ++i){

        printf("(%0.1f,%0.1f) ",new_p_100[i].x,new_p_100[i].y);
    }
    printf("\n");

     // for 20 points
//    u16 newNbPoints = ContourApproximation(20,p1,result_p,espilon);
//
//    printf("Size of new_p = %d\n",newNbPoints);
//    printf("New array of points is: \n");
//    for (u16 i = 0; i < newNbPoints; ++i){
//
//        printf("(%0.1f,%0.1f) ",result_p[i].x,result_p[i].y);
//    }
//    printf("\n");




    return 0;
}

void RandomArrayCreator(Points p0, u16 nb_pts, Points p_array[50]){

    u8 upperBound_y = 50;
    u8 lowerBound_y = 2;

    u8 upperBound_x = 7;
    u8 lowerBound_x = 3;

    p_array[0] = p0;

    for(u16 i=1; i< nb_pts/2;++i){
        p_array[i].x = p_array[i-1].x + ((float)(rand() %(upperBound_x-lowerBound_x+1) + lowerBound_x)/10);
        p_array[i].y = p_array[i-1].y + NegativeOrPositive()*((float)(rand() %(upperBound_y-lowerBound_y+1) + lowerBound_y)/10);
    }

    for(u16 i=nb_pts/2;i<nb_pts;i++){
        p_array[i] = Axial_X_Symmetry(p_array[nb_pts-1-i]);
    }
}

char NegativeOrPositive(){
    // srand(time(NULL));
    if(rand()%2){
        return -1;
    }
    else
        return 1;
}

Points Axial_X_Symmetry(Points p){
    Points inverseY_p;
    inverseY_p.x = p.x;
    inverseY_p.y = -p.y;

    return inverseY_p;
}

