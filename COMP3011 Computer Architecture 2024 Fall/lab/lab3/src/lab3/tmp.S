.text;
.p2align 2;
.global gemm_kernel_opt_avx;
.type gemm_kernel_opt_avx, %function;

#define     AVX_REG_BYTE_WIDTH  32

#define     MAT_C               %rdi
#define     MAT_A               %rsi
#define     MAT_B               %r13
#define     DIM_M               %rcx
#define     DIM_N               %r8
#define     DIM_K               %r9
#define     loop_m              %r10
#define     loop_k              %r11
#define     loop_n              %r12
#define     mat_elem_idx        %r14
#define     temp_reg            %r15

// AVX registers used in computation
#define     mat_c0_0_8           %ymm0
#define     mat_c0_8_16          %ymm1
#define     mat_c0_16_24         %ymm2
#define     mat_c0_24_32         %ymm3
#define     mat_c1_0_8           %ymm4
#define     mat_c1_8_16          %ymm5
#define     mat_c1_16_24         %ymm6
#define     mat_c1_24_32         %ymm7
#define     mat_a0_0_8           %ymm8
#define     mat_a1_0_8           %ymm9
#define     mat_b0_0_8           %ymm10
#define     mat_b0_8_16          %ymm11
#define     mat_b0_16_24         %ymm12
#define     mat_b0_24_32         %ymm13

.macro PUSHD
    push %rax
    push %rbx
    push %rcx
    push %rdx
    push %rsi
    push %rdi
    push %rbp
    push %r8
    push %r9
    push %r10
    push %r11
    push %r12
    push %r13
    push %r14
    push %r15
.endm

.macro POPD
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    pop %r11
    pop %r10
    pop %r9
    pop %r8
    pop %rbp
    pop %rdi
    pop %rsi
    pop %rdx
    pop %rcx
    pop %rbx
    pop %rax
.endm

.macro GEMM_INIT
    mov %rdx, MAT_B
.endm

.macro LOAD_MAT_A
    // Load A[m][k]
    mov loop_m, %rax
    mul DIM_K
    mov %rax, temp_reg
    add loop_k, temp_reg

    mov temp_reg, mat_elem_idx
    shl $2, mat_elem_idx

    vbroadcastss (MAT_A, mat_elem_idx), mat_a0_0_8

    // Load A[m+1][k]
    mov loop_m, %rax
    add $1, %rax               // Move to next row
    mul DIM_K
    mov %rax, temp_reg
    add loop_k, temp_reg

    mov temp_reg, mat_elem_idx
    shl $2, mat_elem_idx
    
    vbroadcastss (MAT_A, mat_elem_idx), mat_a1_0_8
.endm

.macro LOAD_MAT_B
    // Calculate base address for B[k][n]
    mov loop_k, %rax
    mul DIM_N
    mov %rax, temp_reg
    add loop_n, temp_reg
    
    mov temp_reg, mat_elem_idx
    shl $2, mat_elem_idx

    // Load B[k][n:n+32] in 8-float chunks
    vmovups (MAT_B, mat_elem_idx), mat_b0_0_8
    vmovups 32(MAT_B, mat_elem_idx), mat_b0_8_16
    vmovups 64(MAT_B, mat_elem_idx), mat_b0_16_24
    vmovups 96(MAT_B, mat_elem_idx), mat_b0_24_32
.endm

.macro LOAD_MAT_C
    mov loop_m, %rax
    mul DIM_N
    mov %rax, temp_reg
    add loop_n, temp_reg

    // Load C[m][n:n+32]
    mov temp_reg, mat_elem_idx
    shl $2, mat_elem_idx

    vmovups (MAT_C, mat_elem_idx), mat_c0_0_8
    vmovups 32(MAT_C, mat_elem_idx), mat_c0_8_16
    vmovups 64(MAT_C, mat_elem_idx), mat_c0_16_24
    vmovups 96(MAT_C, mat_elem_idx), mat_c0_24_32

    // Load C[m+1][n:n+32]
    mov temp_reg, mat_elem_idx
    add DIM_N, mat_elem_idx
    shl $2, mat_elem_idx

    vmovups (MAT_C, mat_elem_idx), mat_c1_0_8
    vmovups 32(MAT_C, mat_elem_idx), mat_c1_8_16
    vmovups 64(MAT_C, mat_elem_idx), mat_c1_16_24
    vmovups 96(MAT_C, mat_elem_idx), mat_c1_24_32
.endm

.macro STORE_MAT_C
    mov loop_m, %rax
    mul DIM_N
    mov %rax, temp_reg
    add loop_n, temp_reg

    // Store C[m][n:n+32]
    mov temp_reg, mat_elem_idx
    shl $2, mat_elem_idx

    vmovups mat_c0_0_8, (MAT_C, mat_elem_idx)
    vmovups mat_c0_8_16, 32(MAT_C, mat_elem_idx)
    vmovups mat_c0_16_24, 64(MAT_C, mat_elem_idx)
    vmovups mat_c0_24_32, 96(MAT_C, mat_elem_idx)

    // Store C[m+1][n:n+32]
    mov temp_reg, mat_elem_idx
    add DIM_N, mat_elem_idx
    shl $2, mat_elem_idx

    vmovups mat_c1_0_8, (MAT_C, mat_elem_idx)
    vmovups mat_c1_8_16, 32(MAT_C, mat_elem_idx)
    vmovups mat_c1_16_24, 64(MAT_C, mat_elem_idx)
    vmovups mat_c1_24_32, 96(MAT_C, mat_elem_idx)
.endm

.macro DO_COMPUTE
    // Compute first row: C[m][n:n+32] += A[m][k] * B[k][n:n+32]
    vfmadd231ps mat_b0_0_8, mat_a0_0_8, mat_c0_0_8
    vfmadd231ps mat_b0_8_16, mat_a0_0_8, mat_c0_8_16
    vfmadd231ps mat_b0_16_24, mat_a0_0_8, mat_c0_16_24
    vfmadd231ps mat_b0_24_32, mat_a0_0_8, mat_c0_24_32

    // Compute second row: C[m+1][n:n+32] += A[m+1][k] * B[k][n:n+32]
    vfmadd231ps mat_b0_0_8, mat_a1_0_8, mat_c1_0_8
    vfmadd231ps mat_b0_8_16, mat_a1_0_8, mat_c1_8_16
    vfmadd231ps mat_b0_16_24, mat_a1_0_8, mat_c1_16_24
    vfmadd231ps mat_b0_24_32, mat_a1_0_8, mat_c1_24_32
.endm


.macro DO_GEMM
    xor loop_n, loop_n
DO_LOOP_N:

    xor loop_m, loop_m
DO_LOOP_M:
    // 装载矩阵C的数据
    LOAD_MAT_C

    xor loop_k, loop_k
DO_LOOP_K:
    // 装载矩阵A和矩阵B分块的数据
    LOAD_MAT_A
    LOAD_MAT_B

    DO_COMPUTE

    add $1, loop_k              // kr=1
    cmp DIM_K, loop_k
    jl DO_LOOP_K

    // 保存结果
    STORE_MAT_C

    add $2, loop_m              // mr=2
    cmp DIM_M, loop_m
    jl DO_LOOP_M

    add $32, loop_n             // nr=32
    cmp DIM_N, loop_n
    jl DO_LOOP_N

.endm



gemm_kernel_opt_avx:
    PUSHD
    GEMM_INIT
    DO_GEMM
    POPD
    ret