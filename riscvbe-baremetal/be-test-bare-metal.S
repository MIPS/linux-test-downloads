/*
 * Copyright (c) 2025 MIPS
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

#define UART_BASE 0x10000000

        .section .text
        .globl _start
_start:
        li      a0, UART_BASE

        li      t0, 'E'
        sb      t0, 0(a0)
        li      t0, 'N'
        sb      t0, 0(a0)
        li      t0, 'D'
        sb      t0, 0(a0)
        li      t0, 'I'
        sb      t0, 0(a0)
        li      t0, 'A'
        sb      t0, 0(a0)
        li      t0, 'N'
        sb      t0, 0(a0)
        li      t0, ':'
        sb      t0, 0(a0)
        li      t0, ' '
        sb      t0, 0(a0)

        li      t0, 0x01020304
        addi    sp, sp, -16
        sw      t0, 0(sp)
        lbu     t1, 0(sp)
        addi    sp, sp, 16

        li      t2, 0x01
        beq     t1, t2, .Lbig_endian

        li      t0, 'L'
        sb      t0, 0(a0)
        li      t0, 'E'
        sb      t0, 0(a0)
        j       .Ldone

.Lbig_endian:
        li      t0, 'B'
        sb      t0, 0(a0)
        li      t0, 'E'
        sb      t0, 0(a0)

.Ldone:
        li      t0, '\n'
        sb      t0, 0(a0)

.Lhalt:
        wfi
        j       .Lhalt
