.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.30.0 */

/* Handwritten function */
glabel __osDisableInt
/* F464E0 8026ACB0 40086000 */  mfc0       $t0, $12 /* handwritten instruction */
/* F464E4 8026ACB4 2401FFFE */  addiu      $at, $zero, -0x2
/* F464E8 8026ACB8 01014824 */  and        $t1, $t0, $at
/* F464EC 8026ACBC 40896000 */  mtc0       $t1, $12 /* handwritten instruction */
/* F464F0 8026ACC0 31020001 */  andi       $v0, $t0, 0x1
/* F464F4 8026ACC4 00000000 */  nop
/* F464F8 8026ACC8 03E00008 */  jr         $ra
/* F464FC 8026ACCC 00000000 */   nop
endlabel __osDisableInt
.size __osDisableInt, . - __osDisableInt

/* Handwritten function */
glabel __osRestoreInt
/* F46500 8026ACD0 40086000 */  mfc0       $t0, $12 /* handwritten instruction */
/* F46504 8026ACD4 01044025 */  or         $t0, $t0, $a0
/* F46508 8026ACD8 40886000 */  mtc0       $t0, $12 /* handwritten instruction */
/* F4650C 8026ACDC 00000000 */  nop
/* F46510 8026ACE0 00000000 */  nop
/* F46514 8026ACE4 03E00008 */  jr         $ra
/* F46518 8026ACE8 00000000 */   nop
/* F4651C 8026ACEC 00000000 */  nop
endlabel __osRestoreInt
.size __osRestoreInt, . - __osRestoreInt
