.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.30.0 */

/* Handwritten function */
glabel __osDisableInt
/* 4BC0 80003FC0 40086000 */  mfc0       $t0, $12 /* handwritten instruction */
/* 4BC4 80003FC4 2401FFFE */  addiu      $at, $zero, -0x2
/* 4BC8 80003FC8 01014824 */  and        $t1, $t0, $at
/* 4BCC 80003FCC 40896000 */  mtc0       $t1, $12 /* handwritten instruction */
/* 4BD0 80003FD0 31020001 */  andi       $v0, $t0, 0x1
/* 4BD4 80003FD4 00000000 */  nop
/* 4BD8 80003FD8 03E00008 */  jr         $ra
/* 4BDC 80003FDC 00000000 */   nop
endlabel __osDisableInt
.size __osDisableInt, . - __osDisableInt

/* Handwritten function */
glabel __osRestoreInt
/* 4BE0 80003FE0 40086000 */  mfc0       $t0, $12 /* handwritten instruction */
/* 4BE4 80003FE4 01044025 */  or         $t0, $t0, $a0
/* 4BE8 80003FE8 40886000 */  mtc0       $t0, $12 /* handwritten instruction */
/* 4BEC 80003FEC 00000000 */  nop
/* 4BF0 80003FF0 00000000 */  nop
/* 4BF4 80003FF4 03E00008 */  jr         $ra
/* 4BF8 80003FF8 00000000 */   nop
/* 4BFC 80003FFC 00000000 */  nop
endlabel __osRestoreInt
.size __osRestoreInt, . - __osRestoreInt
