	.text
	.global multiply
multiply:
	mul R0, R1, R0		@R0=R1*RS
	bx lr			@pc=lr & 0xfffffffe, T=lr[0]
	nop			@mov r8,r8
	.type multiply, function
	.size multipy, .-multiply

	.global multiplyadd
multiplyadd:
	mla r0, r0, r1, r2	@r0=r0*r1+r2
	bx lr
	nop
	.type multiplyadd, function
	.size multiplyadd, .-multiplyadd
	
	.global multiplysub
multiplysub:
	mls r0, r0, r1, r2	@r0=r0*r1-r2
	bx lr
	nop
	.type multiplysub, function
	.size multiplysub, .-multiplysub
	.end
