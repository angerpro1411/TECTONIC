# Object Detection Project

> Note : This file only contain script for running project

## Launch Vivado
The objective of launching vivado script to have .xsa - hardware description andbitstream inside. 
```
# Launch vivado script
./launchVivado.sh
```

## Launch Vitis
We can try with different image by passing image.bmp at the first argument of the command. If no argument, it will use the last data, if there are more than one argument -> error, file doesn't exist -> error.
Remember that image we use have 320x240 resolution.
```
# Launch Vitis script with ONLY ONE argument
./launchVitis.sh red_green_image.bmp
```
