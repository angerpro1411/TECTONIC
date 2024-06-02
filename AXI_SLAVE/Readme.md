_**1. The raw one is AXI_LITE_SLAVE_OFFICIAL.vhd without modify. Fell free to use it.**_
- The last one who works to test and synthesizable is AXI_LITE_SLAVE_First_version. This one is modified from my_AXI_SLAVE. 
- The problem of my_AXI_SLAVE is that works with VHDL2008 and VIVADO of Xilinx doesn't support synthezise VHDL2008, so it is impossible to create IP and testing after RTL code.
- Target is Zedboard-Zynq7000
- Refer 2 videos in Youtube to know how to create Block Design with Axi lite slave and how to manage it Vitis:
- https://www.youtube.com/watch?v=XtvVfjIm9Xw
- https://www.youtube.com/watch?v=cQ8-_SeYGUQ

_**2. How to design AXI-Lite-Slave.**_
- First of all,learn about Handshake signals based on Valid and Ready:
- Handshake Process :

All five transaction channels use the same VALID/READY handshake process to transfer address, data, and control information. This two-way flow control machanism means both the master and slave can control the rate at which the information moves between master and slave. The information source generates the VALID signal to indicate when the address, data or control information is available. The information destination generates the READY signal to indicate that it can accept the information. The handshake completes if both VALID and READY signals in a channel are asserted during a rising clock edge.

  2.1. AXI4-Lite Write Transaction :
![image](https://github.com/angerpro1411/TECTONIC/assets/166725219/04812dd1-c3cc-4de9-8c3f-cbf3a742af33)

- Below, the sequence for an AXI4-Lite write is shown:
- A description of the events in figure 4 follows:

    1. The Master puts an address on the Write Address channel and data on the Write data channel. At the same time it asserts AWVALID and WVALID indicating the address and data on the respective channels is valid. BREADY is also asserted by the Master, indicating it is ready to receive a response.
    2. The Slave asserts AWREADY and WREADY on the Write Address and Write Data channels, respectively.
    3. Since Valid and Ready signals are present on both the Write Address and Write Data channels, the handshakes on those channels occur and the associated Valid and Ready signals can be deasserted. (After both handshakes occur, the slave has the write address and data)
    4. The Slave asserts BVALID, indicating there is a valid reponse on the Write response channel. (in this case the response is 2’b00, that being ‘OKAY’).
    5. The next rising clock edge completes the transaction, with both the Ready and Valid signals on the write response channel high.

Note: The Handshakes on the Write Address and Write Data channel do not neccessarily occur simultaneously (as they do in the shown transaction). However, the AXI4 specification states that both must occur before the slave can send a write reponse. Both Write Address and Write Data handshakes can occur independently or simultaneously and no order is enforced, only that both must occur to complete the transaction.

  2.1.1. Design Explaincation.
- Based on the description, we can see   



  2.2. AXI Lite Read transaction :
![image](https://github.com/angerpro1411/TECTONIC/assets/166725219/55714093-0870-4bfb-b601-8fe1be3fdd81)

- Below, the sequence for an AXI4-Lite read is shown:
- A description of the events in figure 3 follows:

    1. The Master puts an address on the Read Address channel as well as asserting ARVALID,indicating the address is valid, and RREADY, indicating the master is ready to receive data from the slave.
    2. The Slave asserts ARREADY, indicating that it is ready to receive the address on the bus.
    3. Since both ARVALID and ARREADY are asserted, on the next rising clock edge the handshake occurs, after this the master and slave deassert ARVALID and the ARREADY, respectively. (At this point, the slave has received the requested address).
    4. The Slave puts the requested data on the Read Data channel and asserts RVALID, indicating the data in the channel is valid. The slave can also put a response on RRESP, though this does not occur here.
    5. Since both RREADY and RVALID are asserted, the next rising clock edge completes the transaction. RREADY and RVALID can now be deasserted.


