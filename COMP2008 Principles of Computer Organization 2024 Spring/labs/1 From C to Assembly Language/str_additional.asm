.data 
	.string " "
.macro push %a
	addi	sp, sp, -4
	sw 	%a, 0(sp) 
.end_macro

.macro pop %a
	lw 	%a, 0(sp) 
	addi	sp, sp, 4
.end_macro

.macro scan_int
	ori a7, zero, 0x5
	ecall
.end_macro 

.macro scan_char %a
	lui a1, 0xfffff
	ori a1, zero, 0xff
	or a0, zero, %a
	ori a7, zero, 0x8
	ecall
.end_macro 

.text
.globl _start

_start:
	lui a2, 0x10010
	ori a2, a2, 0x004
	scan_char a2
	or a1, zero, a2
	jal, ra, str_len
	or a4, zero, a0
	addi a0, a0, 0x1
	add a3, a2, a0

	scan_char a3
	or a1, zero, a3
	jal, ra, str_len
	or a5, zero, a0
	jal ra, find_substr 
	
	lui t1, 0x10010
	ori t1, t1, 0xa0
	add t2, zero, zero
	lui t4, 0x10
	addi t4, t4, 0xffffffff
	sub t0, a4, a5
	addi t0, t0, 0x1
	or t6, zero, zero
	loop:
	bge t2, t0, all_exit
	lhu t3, 0(t1)
	addi t1, t1, 0x2
	addi t2, t2, 0x1
	beq t3, t4, loop
	or a0, zero, t3
	ori a7, zero, 0x1
	ecall
	lui a0, 0x10010
	ori a7, zero, 0x4
	ecall
	addi t6, t6, 0x1
	jal zero, loop
	
	all_exit:
	bne t6, zero, last_exit
	ori a0, zero, -1
	ori a7, zero, 0x1
	ecall
	last_exit: 
	ori a7, zero, 0xa
	ecall
	
	
find_substr:
	push s1
	lui s1, 0x10010
	ori s1, s1, 0xa0
	ori t1, zero, 0x0
	outer_loop: 
		bge t1, a4, loop_exit
		slli t3, t1, 0x1
		add t2, s1, t3
		addi t6, zero, -1
		sh t6, 0(t2)
		ori t2, zero, 0x0
		inner_loop:
			bge t2, a5, outer_loop
			add t3, t1, t2
			add t3, t3, a2
			add t4, t2, a3
			push s2
			push s3
			lbu s2, 0(t3)
			lbu s3, 0(t4)
			bne s2, s3, break
			ori t5, zero, 0x1
			sub t5, a5, t5
			bne t2, t5, outer_if
			add t6, zero, t1
			jal zero, break
			outer_if:
				addi t2, t2, 0x1
				jal zero, inner_loop
		break:
			pop s3
			pop s2
			slli t3, t1, 0x1
			add t2, s1, t3
			sh t6, 0(t2)
			addi t1, t1, 0x1
			jal zero, outer_loop
	loop_exit:
		add a0, zero, s1
		pop s1
		jalr zero, 0(ra)

str_len:
	or t1, zero, zero
	push s1
	push s2
	ori s2, zero, 0x0a
	len_loop:
	add t2, t1, a1
	lb s1, 0(t2)
	addi t1, t1, 0x1
	bne s1, s2, len_loop
	addi a0, t1, -1
	pop s2
	pop s1
	jalr zero, 0(ra)
	
	 
