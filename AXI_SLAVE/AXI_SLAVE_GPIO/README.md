# Experience 1 :  baremetal + FPGA Axi Lite LEDS
## 1.a. Design with Vitis(PS design and compiler application)
### Objective
- Integrate my AXI_LITE_SLAVE with Zedboard's peripherals, particularly Leds and SWs and use PS(ARMa9 processor) to control Leds and read SW's status(0/1).
- All files are used here inside AXI_SLAVE and AXI_SLAVE_GPIO. 

### Create new project Vivado
- **Go to Vivado** -> Create Project
- **Create a New Vivado Project** -> Next
- **Project Name**: AXI_Leds_SW, [v]Create project subdirectory, -> Next
- **Project Type**: RTL Project -> Next
- **Add Sources** :Target language: VHDL, download and add "**_AXI_LITE_SLAVE_LEDs_SWITCHES.vhd_**" -> Next
- **Add Constraints** : download and add **_Zedboard_master.xdc_** -> Next
- **Default Part** : -> **Boards**, select Zedboard -> Next
> Note: If u haven't found Zedboard at **Default Part**. It means you haven't installed it, search google "how to add Zedboard to Vivado digilent".
- **New Project Summary** -> Finish


### Block design under Vivado
- Inside **Flow Navigator** window -> **_Create Block Design_** -> Design name:IntegratedZynQ_AXI -> Ok
- Inside **Diagram** window, right click **Add IP**, find **_ZynQ7 Processing System_**
- Go back to **Sources** tab, right click into **AXI_LITE_SLAVE_LEDs_SWITCHES(RTL)** -> Add Module to Block Design
- Go back to **Diagram** window, click on green suggestion(**Recommended**) of Xilinx: **Run Block Automation** and **run Connection Automation**
> In fact Xilinx will add more two blocks, one is Processor System Reset(controlling reset signal, global async reset anh one reset ) and another is AXI Interconnect(use to connect various master AXI and slave AXI). You can direct connect ZynQ Master AXI with our Slave_AXI, but in case that don't have much debug experience in Block Design, we will be lost and won't be able to reach the objective.
- On our AXI_SLAVE component, right click on port LEDS-> Make External. Then do the same on port SW.
- Your Block Design should be like this : easier to continue.
![image](https://github.com/angerpro1411/TECTONIC/assets/166725219/52e2979d-0109-4c3a-8c21-f8ad5f215770)
- Press F6 to Validate Design, maybe the first time, it will have Critical Warning, base on Digilent (https://digilent.com/reference/programmable-logic/guides/vivado-validate-block-design#:~:text=Click%20the%20Validate%20Design%20button%20%28%29%20in%20the,can%20be%20ignored%2C%20as%20can%20some%20Critical%20Warnings.)
- This warning is ignorable then press second time, it will validate this warning. If there are still warnings, so maybe you got problem in design. You should check back all steps.
- Go back to **Sources** tab, right-click at **IntegratedZynQ_AXI(IntegratedZynQ_AXI.bd)** -> Create HDL Wrapper -> Let Vivado manage wrapper and auto-update -> OK
- Right-click at **IntegratedZynQ_AXI(STRUCTURE)** -> Set as Top
- Right-click at **IntegratedZynQ_AXI_i : IntegratedZynQ_AXI(IntegratedZynQ_AXI.bd)** (.bd file, if haven't found, extend the wrapper) -> Generate Output Products -> Generate.
- Inside **Flow Navigator** window -> Generate Bitstream(you can choose maximum jobs, faster - that is number of cores-threads inside your PC's processor) and wait. If Vivado succeeds in generate bitstream -> click Cancel.
> If you fail this step, read thourgh the critical warning and error. Sometimes it comes from **Physical Constraint** inside constraint file that you added at these first steps. You should check your SW and LEDs name that correspond to their name in "Constraint.xdc file". Name sometimes are important if it doesn't match, Vivado can not understand your real connection in FPGA board.
- Inside **Flow Navigator** window, Open Hardware Manager - Open Target(Make sure your FPGA is fully connected to your PC, with Zedboard we need 2 connections, one for UART, second for program board). If everything works well, you will see your board display on the Vivado screen.
- Inside Toolbar: File -> Export -> Export Hardware [v] Inlcude Bitstream -> Finish.

### Vitis controls PS
- Inside Toolbar: Tools -> Launch Vitis IDE. Create a folder name workspace, or if it already existed, create a folder AXI_SW and choose it. Put your workpath into **Workspace** -> Launch.
- Now we totally work with Vitis(old is SDK).
- Create Application Project -> Next -> in the Platform tab, choose **Create a new platform from hardware(XSA)** , Browse, go to your project file. You will see your XSA file inside.
> In case you haven't found it, it means maybe you Export hardware at the wrong destination. Go back Vivado and re-do it, but make sure the destination path is correct.
- If no error, ceate Application project name: AXI_LEDs_SW -> Next -> Choose an example Hello World project -> Finish.
- Inside **Exporer** window, extend **_src_** then lef-click at **helloworld.c**
- First check UART and download connection between Zedboard and PC. Open terminal.
> If you haven't installed minicom, you need root permission to communicate.
```
#skip if already installed minicom
sudo apt-get install minicom

minicom -D /dev/ttyACM0 -b 115200
```
- Go back to Vitis, at the Explorer small window, right-click at **AXI_Leds_SWs_system[...wrapper]** -> Build Project, if it has error, check your connection,cables. Then right-click again -> Run as > Launch Hardware. If you see "Hello world" on minicom window, it means no connection problem.
- Now we ready to program the PS part(processor). Change the content of helloworld.c to Test_regis.c. The purpose of program is write 8-bit to Register00 and Register03, then Zedboard Led will display the result as (Register00 and Register03) and also read the 8-bit SW value, print in to terminal.
- Do the same step as right-click at **AXI_Leds_SWs_system[...wrapper]** -> Build Project, if it has error, check your connection,cables. Then right-click again -> Run as > Launch Hardware. Now you can use PS to control PL through minicom terminal.

> Feel free to change the .c code after fully understand how the code works.
> If any error happends after copy test_regis.c into helloword.c, it only comes from FPGA_BASE_ADDRESS, if you know where it is inside Vitis, that oke. But unless, go back Vivado, **Open Block Design**, go to **Address Editor**, you can see FPGA_BASE_ADDRESS over there. Normally it is 0x4000_0000, but sometimes it is different.
> You even can change the VHDL file if you don't want LEDs = register00 and register03(bitwise operation). I write code at the near the last line of AXI_LITE_SLAVE..vhd file.

![image](https://github.com/angerpro1411/TECTONIC/assets/166725219/2ea97e69-0574-4403-8fe2-b3c3883e8b52)
> Change the code, it means you need to update IP and re-do every steps exept create project.

##Conclusion
We already passed all steps to integrate AXI_LITE_SLAVE IP to control Leds also read SW's status. Pass through basic create Block Design and use Vitis to boot our system to ZYNQ7.

