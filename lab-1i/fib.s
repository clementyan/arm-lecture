	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5,r6,r7,lr}
	mov r3,#-1	@previous
	mov r4,#1	@result
	mov r5,#0	@i
	mov r7,#0	@sum
.L6:
	subs r6,r0,r5	@r6=x-i
	blt .L5		@x-i<0 跳至L5，否則往下執行
	adds r7,r4,r3	@sum=result+previous
	mov r3,r4	@previous=resullt
	mov r4,r7	@result=sum
	add r5,r5,#1	@i++
	b .L6		@無條件跳至L6

.L5:
	mov r0,r4	@r0=sum
	pop {r3,r4,r5,r6,r7,pc}

	.size fibonacci, .-fibonacci
	.end
