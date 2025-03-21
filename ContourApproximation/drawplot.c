// #include "pbPlots.h"
// #include "supportLib.h"

// int main(){
//     double x1[] = {-1, -2, -3, 5, 3, 4};
//     double y1[] = {2, 0, 3, 5, 1, 4};

//     double x2[] = {-1,-5,2,3,5,4};
//     double y2[] = {-2, 4, 3, 6, 4, 2};

// 	ScatterPlotSeries *series = GetDefaultScatterPlotSeriesSettings();
// 	series->xs = x1;
// 	series->xsLength = 5;
// 	series->ys = y1;
// 	series->ysLength = 5;
// 	series->linearInterpolation = true;
// 	series->lineType = L"solid";
// 	series->lineTypeLength = wcslen(series->lineType);
// 	series->lineThickness = 2;
// 	series->color = CreateRGBColor(1, 0, 0);

//     ScatterPlotSeries *series2 = GetDefaultScatterPlotSeriesSettings();
// 	series2->xs = x2;
// 	series2->xsLength = sizeof(x2)/sizeof(double);
// 	series2->ys = y2;
// 	series2->ysLength = sizeof(y2)/sizeof(double);
// 	series2->linearInterpolation = true;
// 	series2->lineType = L"solid";
// 	series2->lineTypeLength = wcslen(series->lineType);
// 	series2->lineThickness = 2;
// 	series2->color = CreateRGBColor(0, 0, 1);

// 	ScatterPlotSettings *settings = GetDefaultScatterPlotSettings();
// 	settings->width = 600;
// 	settings->height = 400;
// 	settings->autoBoundaries = true;
// 	settings->autoPadding = true;
// 	settings->title = L"";
// 	settings->titleLength = wcslen(settings->title);
// 	settings->xLabel = L"X axis";
// 	settings->xLabelLength = wcslen(settings->xLabel);
// 	settings->yLabel = L"Y axis";
// 	settings->yLabelLength = wcslen(settings->yLabel);
// 	ScatterPlotSeries *s [] = {series};
// 	settings->scatterPlotSeries = s;
// 	settings->scatterPlotSeriesLength = 2;

//     RGBABitmapImageReference *imageRef = CreateRGBABitmapImageReference();
//     StringReference *errorMessage = CreateStringReference(L"",0);
//     DrawScatterPlotFromSettings(imageRef,settings,errorMessage);

//     // DrawScatterPlot(imageRef,600,400,x1,6,y1,6,errorMessage);
//     // DrawScatterPlot(imageRef,600,400,x2,6,y2,6,errorMessage);

//     ByteArray *pngData = ConvertToPNG(imageRef->image);
//     WriteToFile(pngData, "example1.png");

// }


#include "pbPlots.h"
#include "supportLib.h"

int main(){
	_Bool success;
	StringReference *errorMessage;

	StartArenaAllocator();

	RGBABitmapImageReference *imageReference = CreateRGBABitmapImageReference();

	// double xs [] = {20.1, 7.1, 16.1, 14.9, 16.7, 8.8, 9.7, 10.3, 22, 16.2, 12.1, 10.3, 14.5, 12.4, 9.6, 12.2, 10.8, 14.7, 19.7, 11.2, 10.1, 11, 12.2, 9.2, 23.5, 9.4, 15.3, 9.6, 11.1, 5.3, 7.8, 25.3, 16.5, 12.6, 12, 11.5, 17.1, 11.2, 12.2, 10.6, 19.9, 14.5, 15.5, 17.4, 8.4, 10.3, 10.2, 12.5, 16.7, 8.5, 12.2};
	// double ys [] = {31.5, 18.9, 35, 31.6, 22.6, 26.2, 14.1, 24.7, 44.8, 23.2, 31.4, 17.7, 18.4, 23.4, 22.6, 16.4, 21.4, 26.5, 31.7, 11.9, 20, 12.5, 18, 14.2, 37.6, 22.2, 17.8, 18.3, 28, 8.1, 14.7, 37.8, 15.7, 28.6, 11.7, 20.1, 30.1, 18.2, 17.2, 19.6, 29.2, 17.3, 28.2, 38.2, 17.8, 10.4, 19, 16.8, 21.5, 15.9, 17.7};

	// double xs2 [] = {5, 25};
	// double ys2 [] = {12, 39};

    double xs[] = {-1, -2, -3, 5, 3, 4};
    double ys[] = {2, 0, 3, 5, 1, 4};

    double xs2[] = {-1,-5,2,3,5,4};
    double ys2[] = {-2, 4, 3, 6, 4, 2};

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
	series2->color = CreateRGBColor(0, 0, 1);

	ScatterPlotSettings *settings = GetDefaultScatterPlotSettings();
	settings->width = 600;
	settings->height = 400;
	settings->autoBoundaries = true;
	settings->autoPadding = true;
	settings->title = L"";
	settings->titleLength = wcslen(settings->title);
	settings->xLabel = L"";
	settings->xLabelLength = wcslen(settings->xLabel);
	settings->yLabel = L"";
	settings->yLabelLength = wcslen(settings->yLabel);
	ScatterPlotSeries *s [] = {series, series2};
	settings->scatterPlotSeries = s;
	settings->scatterPlotSeriesLength = 2;

	errorMessage = (StringReference *)malloc(sizeof(StringReference));
	success = DrawScatterPlotFromSettings(imageReference, settings, errorMessage);

	if(success){
		ByteArray *pngdata = ConvertToPNG(imageReference->image);
		WriteToFile(pngdata, "example4.png");
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