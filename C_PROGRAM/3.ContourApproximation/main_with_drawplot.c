#include "stdio.h"
#include <math.h>
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>

//libraries for drawing plot
#include "pbPlots.h"
#include "supportLib.h"


typedef unsigned int u32;
typedef unsigned char u8;
typedef unsigned short int u16;

typedef struct Points{
    float x;
    float y;
    float dist;
}Points;

typedef struct Lines{
    float a,b,c;
}Lines;

//function declarations
Lines LinearLine(Points FirstP, Points LastP);
float Distance_Point_Line(Points p,Lines l);
bool isDiffer(Points p1,Points p2);
u16 ContourApproximation(u16 nb_pts, Points* p, Points*np, float espilon);
u16 PointNbReduction(u16 nb_pts , Points*p);
u8 drawPlot(Points p1[],u32 num_p1, Points p2[],u32 num_p2, char textfile[20]);
void printArray(Points*p,Points*new_p,u16 newNbPoints);

void RandomArrayCreator(Points p0, u16 nb_pts, Points* p_array);
char NegativeOrPositive();
Points Axial_X_Symmetry(Points p);

int main(){

    srand(20);
    float espilon = 5.0;
    Points p[10] = {{0.1,0.3},{0.5,0.7},{0.9,1.2},{1.1,0.6},{1.5,0.5},{1.3,-0.1},{1.0,-0.4},{0.6,-0.8},{0.4,-1.0},{0.1,-0.2}};

    Points new_p[10];

    // Points p1[12] = {{0.1,0.3},{0.5,0.5},{0.9,1.2},{1.1,0.6},{1.5,0.5},{1.3,-0.1},{1.0,-0.2},{0.8,-0.8},{0.4,-1.0},{0.5,-0.5},{0.4, -0.2},{0.1,-0.2}};
    // Points new_p1[12];

    // Points p2[20] = {{-3.1,1},{-2.8,0.5},{-2.5,1.2},{-2.1,0.6},{-1.9,0.5},{-1.7,-0.1},{-1.6,-0.4},{-1.3,-0.8},{-1.0,-1.0},{-0.8,-0.2},
    //             {-0.5,0.0},{-0.2,0.2},{0.0,0.5},{0.4,0.7},{0.6,-0.4},{1.0,-0.1},{1.4,-1.0},{1.5,0.7},{1.8,0.3},{2.5,0.6}};    
    // Points new_p2[20];

    // Points p0,p_array[50],new_p_array[50];
    // p0.x = 0.3;
    // p0.y = 0.2;
    // RandomArrayCreator(p0,50,p_array);

    // ContourApproximation(50,p_array,new_p_array,espilon);
    // printArray(p_array,new_p_array,50);
    // drawPlot(p_array,50,new_p_array,50,"coordin50.png");   


    Points p1,p1_array[100],new_p1_array[100];
    p1.x = 0.3;
    p1.y = 0.2;
    RandomArrayCreator(p1,100,p1_array);

    ContourApproximation(100,p1_array,new_p1_array,espilon);
    printArray(p1_array,new_p1_array,100);
    drawPlot(p1_array,100,new_p1_array,100,"coordin100.png");  

    // ContourApproximation(10,p,new_p,espilon);
    // printArray(p,new_p,10);
    // drawPlot(p,10,new_p,10,"coordin0.png");

    // ContourApproximation(12,p1,new_p1,espilon);
    // printArray(p1,new_p1,12);
    // drawPlot(p1,12,new_p1,12,"coordin1.png");

    // ContourApproximation(20,p2,new_p2,espilon);
    // printArray(p2,new_p2,20);
    // drawPlot(p2,20,new_p2,20,"coordin2.png");    
    
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

u16 ContourApproximation(u16 nb_pts, Points* p,Points*np, float espilon){
    
    float dist;

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

u8 drawPlot(Points p1[],u32 num_p1, Points p2[],u32 num_p2, char*textfile){
    
    //get 4 array for drawing plot
    double xs[num_p1];
    double ys[num_p1];
    double xs2[num_p2];
    double ys2[num_p2];

    for(u32 i = 0;i<num_p1; ++i){
        xs[i] = p1[i].x;
        ys[i] = p1[i].y;
    }

    for(u32 i = 0;i<num_p2; ++i){
        xs2[i] = p2[i].x;
        ys2[i] = p2[i].y;
    }    

    _Bool success;
	StringReference *errorMessage;

	StartArenaAllocator();

	RGBABitmapImageReference *imageReference = CreateRGBABitmapImageReference();


	ScatterPlotSeries *series = GetDefaultScatterPlotSeriesSettings();
	series->xs = xs;
	series->xsLength = sizeof(xs)/sizeof(double);
	series->ys = ys;
	series->ysLength = sizeof(ys)/sizeof(double);
	series->linearInterpolation = true;
	series->pointType = L"solid";
	series->pointTypeLength = wcslen(series->lineType);
    series->lineThickness = 2;
	series->color = CreateRGBColor(1, 0, 0);

	ScatterPlotSeries *series2 = GetDefaultScatterPlotSeriesSettings();
	series2->xs = xs2;
	series2->xsLength = sizeof(xs2)/sizeof(double);
	series2->ys = ys2;
	series2->ysLength = sizeof(ys2)/sizeof(double);
	series2->linearInterpolation = true;
	series2->lineType = L"solid";
	series2->lineTypeLength = wcslen(series->lineType);
	series2->lineThickness = 2;
	series2->color = CreateRGBColor(0, 1, 0);

	ScatterPlotSettings *settings = GetDefaultScatterPlotSettings();
	settings->width = 600;
	settings->height = 400;
	settings->autoBoundaries = true;
	settings->autoPadding = true;
	settings->title = L"Contour Simplification";
	settings->titleLength = wcslen(settings->title);
	settings->xLabel = L"X-Axis";
	settings->xLabelLength = wcslen(settings->xLabel);
	settings->yLabel = L"Y-Axis";
	settings->yLabelLength = wcslen(settings->yLabel);
	ScatterPlotSeries *s [] = {series, series2};
	settings->scatterPlotSeries = s;
	settings->scatterPlotSeriesLength = 2;

	errorMessage = (StringReference *)malloc(sizeof(StringReference));
	success = DrawScatterPlotFromSettings(imageReference, settings, errorMessage);

	if(success){
		ByteArray *pngdata = ConvertToPNG(imageReference->image);
		WriteToFile(pngdata, textfile);
		DeleteImage(imageReference->image);
	}else{
		fprintf(stderr, "Error: ");
		for(int i = 0; i < errorMessage->stringLength; i++){
			fprintf(stderr, "%c", errorMessage->string[i]);
		}
		fprintf(stderr, "\n");
	}

	FreeAllocations();
    return success ? 0 : 1;
}

// void printArray(Points*p,Points*new_p,u16 newNbPoints){
//     printf("Size of p = %ld\n",sizeof(p)/8);
//     printf("Original array of points is: \n");
//     for (u16 i = 0; i < (sizeof(p)/8); ++i){
        
//         printf("(%0.1f,%0.1f) ",p[i].x,p[i].y);
//     }
//     printf("\n");

//     printf("Size of new_p = %d\n",newNbPoints);
//     printf("New array of points is: \n");
//     for (u16 i = 0; i < newNbPoints; ++i){
        
//         printf("(%0.1f,%0.1f) ",new_p[i].x,new_p[i].y);
//     }
//     printf("\n");
// }

void printArray(Points*p,Points*new_p,u16 nb_pts){

    printf("Original array of points is: \n");
    for (u16 i = 0; i < nb_pts; ++i){
        
        printf("(%0.1f,%0.1f) ",p[i].x,p[i].y);
    }
    printf("\n");

    printf("New array of points is: \n");
    for (u16 i = 0; i < nb_pts; ++i){
        
        printf("(%0.1f,%0.1f) ",new_p[i].x,new_p[i].y);
    }
    printf("\n");
}


void RandomArrayCreator(Points p0, u16 nb_pts, Points* p_array){
    
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