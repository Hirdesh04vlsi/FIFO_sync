# 🚀 Synchronous FIFO (Verilog) Project

This repository contains a **Verilog implementation of a Synchronous FIFO** with testbench and diagrams.  
The design is simple, parameterized, and easy to extend.

## 📂 Repository Structure
```
verilog_fifo_repo/
│── src/        # Verilog source code
│   ├── sync_fifo.v
│   └── tb_sync_fifo.v
│── docs/       # Documentation
│── images/     # Block diagrams & visuals
│── README.md   # Project overview
```

## 📘 About FIFO
- A **FIFO (First-In First-Out)** is a memory buffer where the first data written is the first to be read.  
- It is widely used in digital systems for buffering and data synchronization.

### ✅ Synchronous FIFO
- Single clock domain  
- Read and Write operations occur on the **same clock**  
- Simple design, widely used inside processors and small buffers  

### ⚡ Asynchronous FIFO
- Different **read and write clocks**  
- Used in **Clock Domain Crossing (CDC)**  
- More complex, requires **Gray counters** and synchronization techniques  

## 🔧 Applications of FIFO
- Data buffering in CPUs, GPUs, DSPs  
- Networking devices (routers, switches)  
- CDC (Clock Domain Crossing) in SoCs  
- Audio/Video streaming pipelines  

## 📊 Block Diagram
![FIFO Block Diagram]("C:\Users\hp\Downloads\maxresdefault-Photoroom.png")

## 🔬 Waveform Example
(Simulated using **GTKWave**)
![FIFO Simulation]("C:\Users\hp\OneDrive\Pictures\Screenshots\Screenshot 2025-09-02 230622.png")

---
✍️ Author: Hirdesh Pamnani  
