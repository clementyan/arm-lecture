	.syntax unified
	.arch armv7-a
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfpv3-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"example1.c"
	.text
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}	@將r7與lr(link address=r14)放入堆疊區（當進入副程式時，呼叫副程式的下一個指令PC值會存入lr，先存r7再存lr，SP遞減）
	sub	sp, sp, #16	@sp=sp-16
	add	r7, sp, #0	@r7=sp+0
	movs	r3, #10		@r3=10 並更新CPSR值
	str	r3, [r7, #12]	@將r3的值存入r7的值加上12後的記憶體位址空間
	movs	r3, #12		@r3=12 並更新CPSR值
	str	r3, [r7, #8]	@將r3的值存入r7的值加上8後的記憶體位址空間
	ldr	r0, [r7, #12]	@r7的值加上12後的記憶體位址所指向的值載入r0
	ldr	r1, [r7, #8]	@r7的值加上8後的記憶體位址所指向的值載入r0
	bl	add		@跳躍至add標記，並把下一列指令的pc值存入lr
	str	r0, [r7, #4]	@
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.align	2
	.global	add
	.thumb
	.thumb_func
	.type	add, %function
add:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}		@將r7的值存入堆疊中
	sub	sp, sp, #12	@sp=sp-12
	add	r7, sp, #0	@r7=sp+0
	str	r0, [r7, #4]	
	str	r1, [r7]
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	add	r3, r3, r2	@r3=r3+r2
	mov	r0, r3
	adds	r7, r7, #12	@r7=r7+12 並更新CPSR
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4	@先將sp內的值載入r7，再sp=sp+4
	bx	lr		@跳躍至lr
	.size	add, .-add
	.ident	"GCC: (Debian 4.9.1-19) 4.9.1"
	.section	.note.GNU-stack,"",%progbits
