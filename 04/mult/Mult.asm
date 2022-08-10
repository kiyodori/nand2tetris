// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Translates .asm to .hack
// tools/Assembler.sh projects/04/mult/Mult.asm

// Put your code here.

// 掛け算をループでやる

    @R2
    M=0 // M[R2] = 0
    @i
    M=1 // M[i] = 1
(LOOP)
    @i
    D=M // D = i
    @R1
    D=D-M // D = i - R1
    @END
    D;JGT // if i - R2 > 0 then goto @END
    @R0
    D=M // D = R0
    @R2
    M=D+M // D = R0 + M[R2]
    @i
    M=M+1 // M[i]++
    @LOOP
    0;JMP
(END)
    @END
    0;JMP
