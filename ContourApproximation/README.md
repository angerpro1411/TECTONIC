# CONTOUR APPROXIMATION based on Douglas–Peucker algorithm in C <br/>
- Links :
  * How to draw plots in C: https://github.com/InductiveComputerScience/pbPlots/blob/master/C/example4.c             
    - Video to show : https://www.youtube.com/watch?v=I_xFjVfmRWE&t=4s
  * The definion of Douglas–Peucker algorithm on wiki: https://en.wikipedia.org/wiki/Ramer%E2%80%93Douglas%E2%80%93Peucker_algorithm
  * Scientific paper using the algorithm : A method for simplifying ship trajectory based on improved Douglas–Peucker algorithm
  * A website for playing with this algorithm : https://cartography-playground.gitlab.io/playgrounds/douglas-peucker-algorithm/
- C libraries:
   * pbPlot.h and supportLib.h are used to drawing plot.
   * math.h for square-root (adding -lm in script)
- Files explaination:
   * drawplot.c for testing pbPlot libraries -> create plot and function graph
   * main.c : main program with purpose using HLS(high level synthesis)
   * test.c : main program + pbPlot libraries -> implementation algorithm and display visually before-after function graph.
- Running 
```
gcc drawplot.c pbPlots.c supportLib.c -lm
# automatic create an execution file named a.out(ubuntu)
./a.out
```
>
> check file named example4.png, we can see it under: 
> ![example4](https://github.com/user-attachments/assets/4bde98db-1bb3-49c0-bb93-7b9b3dc5643b)
>

```
gcc main.c pbPlots.c supportLib.c -lm
# automatic create an execution file named a.out(ubuntu)
./a.out
```
We can see the result in terminal like:
>
> Size of p = 10                                                                                              <br/>
> Original array of points is: <br/>
>(0.1,0.3) (0.5,0.7) (0.9,1.2) (1.1,0.6) (1.5,0.5) (1.3,-0.1) (1.0,-0.4) (0.6,-0.8) (0.4,-1.0) (0.1,-0.2) <br/> 
> New array of points is: <br/>
> (0.1,0.3) (0.9,1.2) (1.5,0.5) (1.0,-0.4) (0.4,-1.0) (0.1,-0.2) <br/>
>

```
gcc test.c pbPlots.c supportLib.c -lm
# automatic create an execution file named a.out(ubuntu)
./a.out
```
>
> check file named example4.png, we can see it under: 
> ![example4](https://github.com/user-attachments/assets/d08791cf-0a3b-4bc6-82db-10d19f5f370f)
>
