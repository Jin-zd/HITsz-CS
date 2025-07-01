.data
	.string "cabaa$"
	.string "abab"
.macro push %a
	addi	sp, sp, -4
	sw 	%a, 0(sp) 
.end_macro

.macro pop %a
	lw 	%a, 0(sp) 
	addi	sp, sp, 4
.end_macro

.text
.globl _start

_start:
	lui a2, 0x10010
	addi a3, a2, 7
	ori a4, zero, 6
	ori a5, zero, 4
	jal ra, find_substr 
	
	ori a7, zero, 0x1
	ecall
	
	ori a7, zero, 0xa
	ecall
	
find_substr:
	push s1
	addi s1, zero, -1
	ori t1, zero, 0x0
	outer_loop: 
		bge t1, a4, loop_exit
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
			add s1, zero, t1
			jal zero, break
			outer_if:
				addi t2, t2, 0x1
				jal zero, inner_loop
		break:
			pop s3
			pop s2
			addi t6, zero, -1
			bne s1, t6, loop_exit
			addi t1, t1, 0x1
			jal zero, outer_loop
	loop_exit:
		add a0, zero, s1
		pop s1
		jalr zero, 0(ra)

	
	 
