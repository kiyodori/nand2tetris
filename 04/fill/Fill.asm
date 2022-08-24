// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// $ tools/Assembler.sh projects/04/fill/Fill.asm

(LOOP)
    @SCREEN // 画面の左端
    D=A
    @i // 位置を保持する
    M=D

    @24575 // 画面の端
    D=A
    @max
    M=D

    @KBD // キーボード
    D=M
    @BLACK // if KBD != 0 then goto BLACK
    D;JGT
(WHITE)
    // 端まで来たらLOOPに戻る
    @i
    D=M // D = i
    @max // 画面の右端
    D=M-D // D = M[max] - i
    @LOOP
    D;JLT

    // 白く塗りつぶす
    @i // 位置を取得する
    D=M // D = M[i]
    A=M // A = M[i]
    M=0 // // M[現在位置] = 0
    @i // 順番を +1 する
    M=D+1 // i++
    @WHITE
    0;JMP
(BLACK)
    // 端まで来たらLOOPに戻る
    @i
    D=M // D = i
    @max // 画面の右端
    D=M-D // D = M[max] - i
    @LOOP
    D;JLT

    // 黒く塗りつぶす
    @i // 位置を取得する
    D=M // D = M[i]
    A=M // A = M[i]
    M=-1 // M[現在位置] = -1
    @i // 順番を +1 する
    M=D+1 // i++
    @BLACK
    0;JMP
