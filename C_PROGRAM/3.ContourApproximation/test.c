#include "stdio.h"
#include "stdlib.h"
#include <math.h>

//libraries for drawing plot
#include "pbPlots.h"
#include "supportLib.h"

//Define
#define MAX_VERTICES 5000
#define nb_pts 15


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
u8 drawPlot(Points p1[],u32 num_p1, Points p2[],u32 num_p2);

int main(){

    float espilon = 0.50;
    float dist;
    Points p[nb_pts] = {{0.1,0.3},{0.5,0.5},{0.9,1.2},{1.1,0.6},{1.5,0.5},{1.3,-0.1},{1.0,-0.2},{0.8,-0.8},{0.4,-1.0},{0.5,-0.5},{0.4,-0.2},{0.1,-0.2},{-0.3,0.2},{-0.9,0.7},{-0.1,1.2}};
    Points np[nb_pts];

    //copy p to np
    for (u16 i = 0; i < MAX_VERTICES; ++i){
        np[i] = p[i];
        if (i+1 >= nb_pts){
        	break;
        }
    }      


    printf("Size of p = %ld\n",sizeof(p)/8);
    printf("Original array of points is: \n");
    for (u32 i = 0; i < (sizeof(p)/8); ++i){
        
        printf("(%0.1f,%0.1f) ",p[i].x,p[i].y);
    }
    printf("\n");



    //first line calculated by first point and last point,
    //two important points that we must be kept.
    Lines l = LinearLine(np[0],np[nb_pts - 1]);

    //first lane mark at pos 0th
    u16 newLandMark = 0;    

    for(u16 fullIteration = 0;fullIteration < MAX_VERTICES; ++fullIteration){


    	//First point and last point always are kept.
        for(int i = newLandMark+1;i < MAX_VERTICES;++i){

        	//calculate new distance
        	dist = Distance_Point_Line(np[i],l);

            if (dist <= espilon){

            	//Erase the point got distance <= espilon by putting it equal to landMark
                np[i] = np[newLandMark];

                //In case that passes through all value => done algorithm
                if (i >= nb_pts - 2){
                    fullIteration = nb_pts - 1;//this code line uses to exit outer loop.
                    break;
                }
            }
            //No change that point, create newLandMark and new distance
            else{
            	//In case that passes through all value => Done algorithm
            	if(i >= nb_pts - 2){
            		fullIteration = nb_pts - 1;//this code line uses to exit outer loop.
            		break;
            	}

                l = LinearLine(np[i],np[nb_pts - 1]);
                newLandMark = i;
                break;                
            }
        }
    	//Next iteration is the last point of array, but we won't process it
    	if (fullIteration + 1 >=  nb_pts-1){
    		break;
    	}
    }

    //Reduce size of array


    //print value
    printf("New array of points is: \n");
    for (u32 i = 0; i < (sizeof(np)/8); ++i){
        if ( (np[i].x != np[i+1].x) && (np[i].y != np[i+1].y) ){    
            printf("(%0.1f,%0.1f) ",np[i].x,np[i].y);
        }
    }
    printf("\n");

    drawPlot(p,nb_pts,np,nb_pts);

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

u8 drawPlot(Points p1[],u32 num_p1, Points p2[],u32 num_p2){
    
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
		WriteToFile(pngdata, "example4_1.png");
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



