.text
.p2align 2
.global gemm_kernel_opt_prefetch
.type gemm_kernel_opt_prefetch, %function

#define MAT_C               %rdi
#define MAT_A               %rsi
#define MAT_B               %r14
#define DIM_M               %rcx
#define DIM_N               %r8
#define DIM_K               %r9
#define loop_m              %r10
#define loop_k              %r11
#define loop_n              %r12
#define mat_elem_idx        %r13
#define prefetch_elem_idx   %r15

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
    xor loop_m, loop_m
    xor loop_k, loop_k
    xor loop_n, loop_n
.endm

.macro DO_GEMM
DO_LOOP_K:
    xor loop_m, loop_m
DO_LOOP_M:
    // 预取下一行的A矩阵数据
    mov loop_m, %rax
    add $1, %rax
    cmp DIM_M, %rax
    jge SKIP_PREFETCH_A_ROW
    mul DIM_K
    lea (MAT_A, %rax, 4), prefetch_elem_idx
    prefetcht0 (prefetch_elem_idx)
SKIP_PREFETCH_A_ROW:

    xor loop_n, loop_n
    
    // 加载当前A[m][k]
    mov loop_m, %rax
    mul DIM_K
    add loop_k, %rax
    flds (MAT_A, %rax, 4)

DO_LOOP_N:
    // 计算B的索引并预取
    mov loop_k, %rax
    mul DIM_N
    add loop_n, %rax
    mov %rax, mat_elem_idx
    
    // 预取下一个cache line的B数据
    add $8, %rax  // 假设cache line是32字节，预取后面8个float
    cmp DIM_N, %rax
    jge SKIP_PREFETCH_B
    prefetcht0 (MAT_B, %rax, 4)
SKIP_PREFETCH_B:

    // 加载并计算
    flds (MAT_B, mat_elem_idx, 4)
    fmul %st(1), %st(0)

    // 计算C的索引
    mov loop_m, %rax
    mul DIM_N
    add loop_n, %rax
    mov %rax, mat_elem_idx

    // 预取C的下一个cache line
    add $8, %rax
    cmp DIM_N, %rax
    jge SKIP_PREFETCH_C
    prefetcht0 (MAT_C, %rax, 4)
SKIP_PREFETCH_C:

    // 更新C[m][n]
    flds (MAT_C, mat_elem_idx, 4)
    faddp %st(1), %st(0)
    fstps (MAT_C, mat_elem_idx, 4)

    // 更新循环计数器
    add $1, loop_n
    cmp DIM_N, loop_n
    jl DO_LOOP_N

    fstp %st(0)

    add $1, loop_m
    cmp DIM_M, loop_m
    jl DO_LOOP_M

    add $1, loop_k
    cmp DIM_K, loop_k
    jl DO_LOOP_K
.endm

gemm_kernel_opt_prefetch:
    PUSHD
    GEMM_INIT
    DO_GEMM
    POPD
    ret