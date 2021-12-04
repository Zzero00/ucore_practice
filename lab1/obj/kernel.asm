
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	53                   	push   %ebx
  100008:	83 ec 14             	sub    $0x14,%esp
  10000b:	e8 94 02 00 00       	call   1002a4 <__x86.get_pc_thunk.bx>
  100010:	81 c3 40 f9 00 00    	add    $0xf940,%ebx
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100016:	c7 c0 c0 0d 11 00    	mov    $0x110dc0,%eax
  10001c:	89 c2                	mov    %eax,%edx
  10001e:	c7 c0 50 f9 10 00    	mov    $0x10f950,%eax
  100024:	29 c2                	sub    %eax,%edx
  100026:	89 d0                	mov    %edx,%eax
  100028:	83 ec 04             	sub    $0x4,%esp
  10002b:	50                   	push   %eax
  10002c:	6a 00                	push   $0x0
  10002e:	c7 c0 50 f9 10 00    	mov    $0x10f950,%eax
  100034:	50                   	push   %eax
  100035:	e8 48 2e 00 00       	call   102e82 <memset>
  10003a:	83 c4 10             	add    $0x10,%esp

    cons_init();                // init the console
  10003d:	e8 d4 16 00 00       	call   101716 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100042:	8d 83 88 3d ff ff    	lea    -0xc278(%ebx),%eax
  100048:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("%s\n\n", message);
  10004b:	83 ec 08             	sub    $0x8,%esp
  10004e:	ff 75 f4             	pushl  -0xc(%ebp)
  100051:	8d 83 a4 3d ff ff    	lea    -0xc25c(%ebx),%eax
  100057:	50                   	push   %eax
  100058:	e8 c2 02 00 00       	call   10031f <cprintf>
  10005d:	83 c4 10             	add    $0x10,%esp

    print_kerninfo();
  100060:	e8 d6 09 00 00       	call   100a3b <print_kerninfo>

    grade_backtrace();
  100065:	e8 a4 00 00 00       	call   10010e <grade_backtrace>

    pmm_init();                 // init physical memory management
  10006a:	e8 4d 2a 00 00       	call   102abc <pmm_init>

    pic_init();                 // init interrupt controller
  10006f:	e8 09 18 00 00       	call   10187d <pic_init>
    idt_init();                 // init interrupt descriptor table
  100074:	e8 bf 19 00 00       	call   101a38 <idt_init>

    clock_init();               // init clock interrupt
  100079:	e8 05 0e 00 00       	call   100e83 <clock_init>
    intr_enable();              // enable irq interrupt
  10007e:	e8 58 19 00 00       	call   1019db <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  100083:	eb fe                	jmp    100083 <kern_init+0x83>

00100085 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100085:	f3 0f 1e fb          	endbr32 
  100089:	55                   	push   %ebp
  10008a:	89 e5                	mov    %esp,%ebp
  10008c:	53                   	push   %ebx
  10008d:	83 ec 04             	sub    $0x4,%esp
  100090:	e8 0b 02 00 00       	call   1002a0 <__x86.get_pc_thunk.ax>
  100095:	05 bb f8 00 00       	add    $0xf8bb,%eax
    mon_backtrace(0, NULL, NULL);
  10009a:	83 ec 04             	sub    $0x4,%esp
  10009d:	6a 00                	push   $0x0
  10009f:	6a 00                	push   $0x0
  1000a1:	6a 00                	push   $0x0
  1000a3:	89 c3                	mov    %eax,%ebx
  1000a5:	e8 b2 0d 00 00       	call   100e5c <mon_backtrace>
  1000aa:	83 c4 10             	add    $0x10,%esp
}
  1000ad:	90                   	nop
  1000ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000b1:	c9                   	leave  
  1000b2:	c3                   	ret    

001000b3 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  1000b3:	f3 0f 1e fb          	endbr32 
  1000b7:	55                   	push   %ebp
  1000b8:	89 e5                	mov    %esp,%ebp
  1000ba:	53                   	push   %ebx
  1000bb:	83 ec 04             	sub    $0x4,%esp
  1000be:	e8 dd 01 00 00       	call   1002a0 <__x86.get_pc_thunk.ax>
  1000c3:	05 8d f8 00 00       	add    $0xf88d,%eax
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000c8:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000ce:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d4:	51                   	push   %ecx
  1000d5:	52                   	push   %edx
  1000d6:	53                   	push   %ebx
  1000d7:	50                   	push   %eax
  1000d8:	e8 a8 ff ff ff       	call   100085 <grade_backtrace2>
  1000dd:	83 c4 10             	add    $0x10,%esp
}
  1000e0:	90                   	nop
  1000e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1000e4:	c9                   	leave  
  1000e5:	c3                   	ret    

001000e6 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000e6:	f3 0f 1e fb          	endbr32 
  1000ea:	55                   	push   %ebp
  1000eb:	89 e5                	mov    %esp,%ebp
  1000ed:	83 ec 08             	sub    $0x8,%esp
  1000f0:	e8 ab 01 00 00       	call   1002a0 <__x86.get_pc_thunk.ax>
  1000f5:	05 5b f8 00 00       	add    $0xf85b,%eax
    grade_backtrace1(arg0, arg2);
  1000fa:	83 ec 08             	sub    $0x8,%esp
  1000fd:	ff 75 10             	pushl  0x10(%ebp)
  100100:	ff 75 08             	pushl  0x8(%ebp)
  100103:	e8 ab ff ff ff       	call   1000b3 <grade_backtrace1>
  100108:	83 c4 10             	add    $0x10,%esp
}
  10010b:	90                   	nop
  10010c:	c9                   	leave  
  10010d:	c3                   	ret    

0010010e <grade_backtrace>:

void
grade_backtrace(void) {
  10010e:	f3 0f 1e fb          	endbr32 
  100112:	55                   	push   %ebp
  100113:	89 e5                	mov    %esp,%ebp
  100115:	83 ec 08             	sub    $0x8,%esp
  100118:	e8 83 01 00 00       	call   1002a0 <__x86.get_pc_thunk.ax>
  10011d:	05 33 f8 00 00       	add    $0xf833,%eax
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  100122:	8d 80 b0 06 ff ff    	lea    -0xf950(%eax),%eax
  100128:	83 ec 04             	sub    $0x4,%esp
  10012b:	68 00 00 ff ff       	push   $0xffff0000
  100130:	50                   	push   %eax
  100131:	6a 00                	push   $0x0
  100133:	e8 ae ff ff ff       	call   1000e6 <grade_backtrace0>
  100138:	83 c4 10             	add    $0x10,%esp
}
  10013b:	90                   	nop
  10013c:	c9                   	leave  
  10013d:	c3                   	ret    

0010013e <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  10013e:	f3 0f 1e fb          	endbr32 
  100142:	55                   	push   %ebp
  100143:	89 e5                	mov    %esp,%ebp
  100145:	53                   	push   %ebx
  100146:	83 ec 14             	sub    $0x14,%esp
  100149:	e8 56 01 00 00       	call   1002a4 <__x86.get_pc_thunk.bx>
  10014e:	81 c3 02 f8 00 00    	add    $0xf802,%ebx
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100154:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100157:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10015a:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10015d:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100160:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100164:	0f b7 c0             	movzwl %ax,%eax
  100167:	83 e0 03             	and    $0x3,%eax
  10016a:	89 c2                	mov    %eax,%edx
  10016c:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  100172:	83 ec 04             	sub    $0x4,%esp
  100175:	52                   	push   %edx
  100176:	50                   	push   %eax
  100177:	8d 83 a9 3d ff ff    	lea    -0xc257(%ebx),%eax
  10017d:	50                   	push   %eax
  10017e:	e8 9c 01 00 00       	call   10031f <cprintf>
  100183:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  cs = %x\n", round, reg1);
  100186:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10018a:	0f b7 d0             	movzwl %ax,%edx
  10018d:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  100193:	83 ec 04             	sub    $0x4,%esp
  100196:	52                   	push   %edx
  100197:	50                   	push   %eax
  100198:	8d 83 b7 3d ff ff    	lea    -0xc249(%ebx),%eax
  10019e:	50                   	push   %eax
  10019f:	e8 7b 01 00 00       	call   10031f <cprintf>
  1001a4:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ds = %x\n", round, reg2);
  1001a7:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  1001ab:	0f b7 d0             	movzwl %ax,%edx
  1001ae:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  1001b4:	83 ec 04             	sub    $0x4,%esp
  1001b7:	52                   	push   %edx
  1001b8:	50                   	push   %eax
  1001b9:	8d 83 c5 3d ff ff    	lea    -0xc23b(%ebx),%eax
  1001bf:	50                   	push   %eax
  1001c0:	e8 5a 01 00 00       	call   10031f <cprintf>
  1001c5:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  es = %x\n", round, reg3);
  1001c8:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  1001cc:	0f b7 d0             	movzwl %ax,%edx
  1001cf:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  1001d5:	83 ec 04             	sub    $0x4,%esp
  1001d8:	52                   	push   %edx
  1001d9:	50                   	push   %eax
  1001da:	8d 83 d3 3d ff ff    	lea    -0xc22d(%ebx),%eax
  1001e0:	50                   	push   %eax
  1001e1:	e8 39 01 00 00       	call   10031f <cprintf>
  1001e6:	83 c4 10             	add    $0x10,%esp
    cprintf("%d:  ss = %x\n", round, reg4);
  1001e9:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001ed:	0f b7 d0             	movzwl %ax,%edx
  1001f0:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  1001f6:	83 ec 04             	sub    $0x4,%esp
  1001f9:	52                   	push   %edx
  1001fa:	50                   	push   %eax
  1001fb:	8d 83 e1 3d ff ff    	lea    -0xc21f(%ebx),%eax
  100201:	50                   	push   %eax
  100202:	e8 18 01 00 00       	call   10031f <cprintf>
  100207:	83 c4 10             	add    $0x10,%esp
    round ++;
  10020a:	8b 83 70 01 00 00    	mov    0x170(%ebx),%eax
  100210:	83 c0 01             	add    $0x1,%eax
  100213:	89 83 70 01 00 00    	mov    %eax,0x170(%ebx)
}
  100219:	90                   	nop
  10021a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10021d:	c9                   	leave  
  10021e:	c3                   	ret    

0010021f <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  10021f:	f3 0f 1e fb          	endbr32 
  100223:	55                   	push   %ebp
  100224:	89 e5                	mov    %esp,%ebp
  100226:	e8 75 00 00 00       	call   1002a0 <__x86.get_pc_thunk.ax>
  10022b:	05 25 f7 00 00       	add    $0xf725,%eax
    //LAB1 CHALLENGE 1 : TODO
}
  100230:	90                   	nop
  100231:	5d                   	pop    %ebp
  100232:	c3                   	ret    

00100233 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  100233:	f3 0f 1e fb          	endbr32 
  100237:	55                   	push   %ebp
  100238:	89 e5                	mov    %esp,%ebp
  10023a:	e8 61 00 00 00       	call   1002a0 <__x86.get_pc_thunk.ax>
  10023f:	05 11 f7 00 00       	add    $0xf711,%eax
    //LAB1 CHALLENGE 1 :  TODO
}
  100244:	90                   	nop
  100245:	5d                   	pop    %ebp
  100246:	c3                   	ret    

00100247 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  100247:	f3 0f 1e fb          	endbr32 
  10024b:	55                   	push   %ebp
  10024c:	89 e5                	mov    %esp,%ebp
  10024e:	53                   	push   %ebx
  10024f:	83 ec 04             	sub    $0x4,%esp
  100252:	e8 4d 00 00 00       	call   1002a4 <__x86.get_pc_thunk.bx>
  100257:	81 c3 f9 f6 00 00    	add    $0xf6f9,%ebx
    lab1_print_cur_status();
  10025d:	e8 dc fe ff ff       	call   10013e <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  100262:	83 ec 0c             	sub    $0xc,%esp
  100265:	8d 83 f0 3d ff ff    	lea    -0xc210(%ebx),%eax
  10026b:	50                   	push   %eax
  10026c:	e8 ae 00 00 00       	call   10031f <cprintf>
  100271:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_user();
  100274:	e8 a6 ff ff ff       	call   10021f <lab1_switch_to_user>
    lab1_print_cur_status();
  100279:	e8 c0 fe ff ff       	call   10013e <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10027e:	83 ec 0c             	sub    $0xc,%esp
  100281:	8d 83 10 3e ff ff    	lea    -0xc1f0(%ebx),%eax
  100287:	50                   	push   %eax
  100288:	e8 92 00 00 00       	call   10031f <cprintf>
  10028d:	83 c4 10             	add    $0x10,%esp
    lab1_switch_to_kernel();
  100290:	e8 9e ff ff ff       	call   100233 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100295:	e8 a4 fe ff ff       	call   10013e <lab1_print_cur_status>
}
  10029a:	90                   	nop
  10029b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10029e:	c9                   	leave  
  10029f:	c3                   	ret    

001002a0 <__x86.get_pc_thunk.ax>:
  1002a0:	8b 04 24             	mov    (%esp),%eax
  1002a3:	c3                   	ret    

001002a4 <__x86.get_pc_thunk.bx>:
  1002a4:	8b 1c 24             	mov    (%esp),%ebx
  1002a7:	c3                   	ret    

001002a8 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002a8:	f3 0f 1e fb          	endbr32 
  1002ac:	55                   	push   %ebp
  1002ad:	89 e5                	mov    %esp,%ebp
  1002af:	53                   	push   %ebx
  1002b0:	83 ec 04             	sub    $0x4,%esp
  1002b3:	e8 e8 ff ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  1002b8:	05 98 f6 00 00       	add    $0xf698,%eax
    cons_putc(c);
  1002bd:	83 ec 0c             	sub    $0xc,%esp
  1002c0:	ff 75 08             	pushl  0x8(%ebp)
  1002c3:	89 c3                	mov    %eax,%ebx
  1002c5:	e8 7d 14 00 00       	call   101747 <cons_putc>
  1002ca:	83 c4 10             	add    $0x10,%esp
    (*cnt) ++;
  1002cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d0:	8b 00                	mov    (%eax),%eax
  1002d2:	8d 50 01             	lea    0x1(%eax),%edx
  1002d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d8:	89 10                	mov    %edx,(%eax)
}
  1002da:	90                   	nop
  1002db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1002de:	c9                   	leave  
  1002df:	c3                   	ret    

001002e0 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002e0:	f3 0f 1e fb          	endbr32 
  1002e4:	55                   	push   %ebp
  1002e5:	89 e5                	mov    %esp,%ebp
  1002e7:	53                   	push   %ebx
  1002e8:	83 ec 14             	sub    $0x14,%esp
  1002eb:	e8 b0 ff ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  1002f0:	05 60 f6 00 00       	add    $0xf660,%eax
    int cnt = 0;
  1002f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002fc:	ff 75 0c             	pushl  0xc(%ebp)
  1002ff:	ff 75 08             	pushl  0x8(%ebp)
  100302:	8d 55 f4             	lea    -0xc(%ebp),%edx
  100305:	52                   	push   %edx
  100306:	8d 90 58 09 ff ff    	lea    -0xf6a8(%eax),%edx
  10030c:	52                   	push   %edx
  10030d:	89 c3                	mov    %eax,%ebx
  10030f:	e8 15 2f 00 00       	call   103229 <vprintfmt>
  100314:	83 c4 10             	add    $0x10,%esp
    return cnt;
  100317:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10031a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10031d:	c9                   	leave  
  10031e:	c3                   	ret    

0010031f <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10031f:	f3 0f 1e fb          	endbr32 
  100323:	55                   	push   %ebp
  100324:	89 e5                	mov    %esp,%ebp
  100326:	83 ec 18             	sub    $0x18,%esp
  100329:	e8 72 ff ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  10032e:	05 22 f6 00 00       	add    $0xf622,%eax
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100333:	8d 45 0c             	lea    0xc(%ebp),%eax
  100336:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100339:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10033c:	83 ec 08             	sub    $0x8,%esp
  10033f:	50                   	push   %eax
  100340:	ff 75 08             	pushl  0x8(%ebp)
  100343:	e8 98 ff ff ff       	call   1002e0 <vcprintf>
  100348:	83 c4 10             	add    $0x10,%esp
  10034b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10034e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100351:	c9                   	leave  
  100352:	c3                   	ret    

00100353 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100353:	f3 0f 1e fb          	endbr32 
  100357:	55                   	push   %ebp
  100358:	89 e5                	mov    %esp,%ebp
  10035a:	53                   	push   %ebx
  10035b:	83 ec 04             	sub    $0x4,%esp
  10035e:	e8 3d ff ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  100363:	05 ed f5 00 00       	add    $0xf5ed,%eax
    cons_putc(c);
  100368:	83 ec 0c             	sub    $0xc,%esp
  10036b:	ff 75 08             	pushl  0x8(%ebp)
  10036e:	89 c3                	mov    %eax,%ebx
  100370:	e8 d2 13 00 00       	call   101747 <cons_putc>
  100375:	83 c4 10             	add    $0x10,%esp
}
  100378:	90                   	nop
  100379:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10037c:	c9                   	leave  
  10037d:	c3                   	ret    

0010037e <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10037e:	f3 0f 1e fb          	endbr32 
  100382:	55                   	push   %ebp
  100383:	89 e5                	mov    %esp,%ebp
  100385:	83 ec 18             	sub    $0x18,%esp
  100388:	e8 13 ff ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  10038d:	05 c3 f5 00 00       	add    $0xf5c3,%eax
    int cnt = 0;
  100392:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100399:	eb 14                	jmp    1003af <cputs+0x31>
        cputch(c, &cnt);
  10039b:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10039f:	83 ec 08             	sub    $0x8,%esp
  1003a2:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1003a5:	52                   	push   %edx
  1003a6:	50                   	push   %eax
  1003a7:	e8 fc fe ff ff       	call   1002a8 <cputch>
  1003ac:	83 c4 10             	add    $0x10,%esp
    while ((c = *str ++) != '\0') {
  1003af:	8b 45 08             	mov    0x8(%ebp),%eax
  1003b2:	8d 50 01             	lea    0x1(%eax),%edx
  1003b5:	89 55 08             	mov    %edx,0x8(%ebp)
  1003b8:	0f b6 00             	movzbl (%eax),%eax
  1003bb:	88 45 f7             	mov    %al,-0x9(%ebp)
  1003be:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1003c2:	75 d7                	jne    10039b <cputs+0x1d>
    }
    cputch('\n', &cnt);
  1003c4:	83 ec 08             	sub    $0x8,%esp
  1003c7:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1003ca:	50                   	push   %eax
  1003cb:	6a 0a                	push   $0xa
  1003cd:	e8 d6 fe ff ff       	call   1002a8 <cputch>
  1003d2:	83 c4 10             	add    $0x10,%esp
    return cnt;
  1003d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003d8:	c9                   	leave  
  1003d9:	c3                   	ret    

001003da <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003da:	f3 0f 1e fb          	endbr32 
  1003de:	55                   	push   %ebp
  1003df:	89 e5                	mov    %esp,%ebp
  1003e1:	53                   	push   %ebx
  1003e2:	83 ec 14             	sub    $0x14,%esp
  1003e5:	e8 ba fe ff ff       	call   1002a4 <__x86.get_pc_thunk.bx>
  1003ea:	81 c3 66 f5 00 00    	add    $0xf566,%ebx
    int c;
    while ((c = cons_getc()) == 0)
  1003f0:	90                   	nop
  1003f1:	e8 7f 13 00 00       	call   101775 <cons_getc>
  1003f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003fd:	74 f2                	je     1003f1 <getchar+0x17>
        /* do nothing */;
    return c;
  1003ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100402:	83 c4 14             	add    $0x14,%esp
  100405:	5b                   	pop    %ebx
  100406:	5d                   	pop    %ebp
  100407:	c3                   	ret    

00100408 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100408:	f3 0f 1e fb          	endbr32 
  10040c:	55                   	push   %ebp
  10040d:	89 e5                	mov    %esp,%ebp
  10040f:	53                   	push   %ebx
  100410:	83 ec 14             	sub    $0x14,%esp
  100413:	e8 8c fe ff ff       	call   1002a4 <__x86.get_pc_thunk.bx>
  100418:	81 c3 38 f5 00 00    	add    $0xf538,%ebx
    if (prompt != NULL) {
  10041e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100422:	74 15                	je     100439 <readline+0x31>
        cprintf("%s", prompt);
  100424:	83 ec 08             	sub    $0x8,%esp
  100427:	ff 75 08             	pushl  0x8(%ebp)
  10042a:	8d 83 2f 3e ff ff    	lea    -0xc1d1(%ebx),%eax
  100430:	50                   	push   %eax
  100431:	e8 e9 fe ff ff       	call   10031f <cprintf>
  100436:	83 c4 10             	add    $0x10,%esp
    }
    int i = 0, c;
  100439:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100440:	e8 95 ff ff ff       	call   1003da <getchar>
  100445:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100448:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10044c:	79 0a                	jns    100458 <readline+0x50>
            return NULL;
  10044e:	b8 00 00 00 00       	mov    $0x0,%eax
  100453:	e9 87 00 00 00       	jmp    1004df <readline+0xd7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100458:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10045c:	7e 2c                	jle    10048a <readline+0x82>
  10045e:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100465:	7f 23                	jg     10048a <readline+0x82>
            cputchar(c);
  100467:	83 ec 0c             	sub    $0xc,%esp
  10046a:	ff 75 f0             	pushl  -0x10(%ebp)
  10046d:	e8 e1 fe ff ff       	call   100353 <cputchar>
  100472:	83 c4 10             	add    $0x10,%esp
            buf[i ++] = c;
  100475:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100478:	8d 50 01             	lea    0x1(%eax),%edx
  10047b:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10047e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100481:	88 94 03 90 01 00 00 	mov    %dl,0x190(%ebx,%eax,1)
  100488:	eb 50                	jmp    1004da <readline+0xd2>
        }
        else if (c == '\b' && i > 0) {
  10048a:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10048e:	75 1a                	jne    1004aa <readline+0xa2>
  100490:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100494:	7e 14                	jle    1004aa <readline+0xa2>
            cputchar(c);
  100496:	83 ec 0c             	sub    $0xc,%esp
  100499:	ff 75 f0             	pushl  -0x10(%ebp)
  10049c:	e8 b2 fe ff ff       	call   100353 <cputchar>
  1004a1:	83 c4 10             	add    $0x10,%esp
            i --;
  1004a4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1004a8:	eb 30                	jmp    1004da <readline+0xd2>
        }
        else if (c == '\n' || c == '\r') {
  1004aa:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1004ae:	74 06                	je     1004b6 <readline+0xae>
  1004b0:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1004b4:	75 8a                	jne    100440 <readline+0x38>
            cputchar(c);
  1004b6:	83 ec 0c             	sub    $0xc,%esp
  1004b9:	ff 75 f0             	pushl  -0x10(%ebp)
  1004bc:	e8 92 fe ff ff       	call   100353 <cputchar>
  1004c1:	83 c4 10             	add    $0x10,%esp
            buf[i] = '\0';
  1004c4:	8d 93 90 01 00 00    	lea    0x190(%ebx),%edx
  1004ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004cd:	01 d0                	add    %edx,%eax
  1004cf:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1004d2:	8d 83 90 01 00 00    	lea    0x190(%ebx),%eax
  1004d8:	eb 05                	jmp    1004df <readline+0xd7>
        c = getchar();
  1004da:	e9 61 ff ff ff       	jmp    100440 <readline+0x38>
        }
    }
}
  1004df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1004e2:	c9                   	leave  
  1004e3:	c3                   	ret    

001004e4 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1004e4:	f3 0f 1e fb          	endbr32 
  1004e8:	55                   	push   %ebp
  1004e9:	89 e5                	mov    %esp,%ebp
  1004eb:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1004ee:	a1 e0 fe 10 00       	mov    0x10fee0,%eax
  1004f3:	85 c0                	test   %eax,%eax
  1004f5:	75 5b                	jne    100552 <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  1004f7:	c7 05 e0 fe 10 00 01 	movl   $0x1,0x10fee0
  1004fe:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100501:	8d 45 14             	lea    0x14(%ebp),%eax
  100504:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100507:	8b 45 0c             	mov    0xc(%ebp),%eax
  10050a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10050e:	8b 45 08             	mov    0x8(%ebp),%eax
  100511:	89 44 24 04          	mov    %eax,0x4(%esp)
  100515:	c7 04 24 82 37 10 00 	movl   $0x103782,(%esp)
  10051c:	e8 fe fd ff ff       	call   10031f <cprintf>
    vcprintf(fmt, ap);
  100521:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100524:	89 44 24 04          	mov    %eax,0x4(%esp)
  100528:	8b 45 10             	mov    0x10(%ebp),%eax
  10052b:	89 04 24             	mov    %eax,(%esp)
  10052e:	e8 ad fd ff ff       	call   1002e0 <vcprintf>
    cprintf("\n");
  100533:	c7 04 24 9e 37 10 00 	movl   $0x10379e,(%esp)
  10053a:	e8 e0 fd ff ff       	call   10031f <cprintf>
    
    cprintf("stack trackback:\n");
  10053f:	c7 04 24 a0 37 10 00 	movl   $0x1037a0,(%esp)
  100546:	e8 d4 fd ff ff       	call   10031f <cprintf>
    print_stackframe();
  10054b:	e8 3d 06 00 00       	call   100b8d <print_stackframe>
  100550:	eb 01                	jmp    100553 <__panic+0x6f>
        goto panic_dead;
  100552:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  100553:	e8 99 14 00 00       	call   1019f1 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100558:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10055f:	e8 d2 07 00 00       	call   100d36 <kmonitor>
  100564:	eb f2                	jmp    100558 <__panic+0x74>

00100566 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100566:	f3 0f 1e fb          	endbr32 
  10056a:	55                   	push   %ebp
  10056b:	89 e5                	mov    %esp,%ebp
  10056d:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100570:	8d 45 14             	lea    0x14(%ebp),%eax
  100573:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100576:	8b 45 0c             	mov    0xc(%ebp),%eax
  100579:	89 44 24 08          	mov    %eax,0x8(%esp)
  10057d:	8b 45 08             	mov    0x8(%ebp),%eax
  100580:	89 44 24 04          	mov    %eax,0x4(%esp)
  100584:	c7 04 24 b2 37 10 00 	movl   $0x1037b2,(%esp)
  10058b:	e8 8f fd ff ff       	call   10031f <cprintf>
    vcprintf(fmt, ap);
  100590:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100593:	89 44 24 04          	mov    %eax,0x4(%esp)
  100597:	8b 45 10             	mov    0x10(%ebp),%eax
  10059a:	89 04 24             	mov    %eax,(%esp)
  10059d:	e8 3e fd ff ff       	call   1002e0 <vcprintf>
    cprintf("\n");
  1005a2:	c7 04 24 9e 37 10 00 	movl   $0x10379e,(%esp)
  1005a9:	e8 71 fd ff ff       	call   10031f <cprintf>
    va_end(ap);
}
  1005ae:	90                   	nop
  1005af:	c9                   	leave  
  1005b0:	c3                   	ret    

001005b1 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1005b1:	f3 0f 1e fb          	endbr32 
  1005b5:	55                   	push   %ebp
  1005b6:	89 e5                	mov    %esp,%ebp
    return is_panic;
  1005b8:	a1 e0 fe 10 00       	mov    0x10fee0,%eax
}
  1005bd:	5d                   	pop    %ebp
  1005be:	c3                   	ret    

001005bf <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1005bf:	f3 0f 1e fb          	endbr32 
  1005c3:	55                   	push   %ebp
  1005c4:	89 e5                	mov    %esp,%ebp
  1005c6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1005c9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005cc:	8b 00                	mov    (%eax),%eax
  1005ce:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1005d1:	8b 45 10             	mov    0x10(%ebp),%eax
  1005d4:	8b 00                	mov    (%eax),%eax
  1005d6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1005e0:	e9 ca 00 00 00       	jmp    1006af <stab_binsearch+0xf0>
        int true_m = (l + r) / 2, m = true_m;
  1005e5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1005eb:	01 d0                	add    %edx,%eax
  1005ed:	89 c2                	mov    %eax,%edx
  1005ef:	c1 ea 1f             	shr    $0x1f,%edx
  1005f2:	01 d0                	add    %edx,%eax
  1005f4:	d1 f8                	sar    %eax
  1005f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1005f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1005fc:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1005ff:	eb 03                	jmp    100604 <stab_binsearch+0x45>
            m --;
  100601:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100604:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100607:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10060a:	7c 1f                	jl     10062b <stab_binsearch+0x6c>
  10060c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10060f:	89 d0                	mov    %edx,%eax
  100611:	01 c0                	add    %eax,%eax
  100613:	01 d0                	add    %edx,%eax
  100615:	c1 e0 02             	shl    $0x2,%eax
  100618:	89 c2                	mov    %eax,%edx
  10061a:	8b 45 08             	mov    0x8(%ebp),%eax
  10061d:	01 d0                	add    %edx,%eax
  10061f:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100623:	0f b6 c0             	movzbl %al,%eax
  100626:	39 45 14             	cmp    %eax,0x14(%ebp)
  100629:	75 d6                	jne    100601 <stab_binsearch+0x42>
        }
        if (m < l) {    // no match in [l, m]
  10062b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10062e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100631:	7d 09                	jge    10063c <stab_binsearch+0x7d>
            l = true_m + 1;
  100633:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100636:	40                   	inc    %eax
  100637:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10063a:	eb 73                	jmp    1006af <stab_binsearch+0xf0>
        }

        // actual binary search
        any_matches = 1;
  10063c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100643:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100646:	89 d0                	mov    %edx,%eax
  100648:	01 c0                	add    %eax,%eax
  10064a:	01 d0                	add    %edx,%eax
  10064c:	c1 e0 02             	shl    $0x2,%eax
  10064f:	89 c2                	mov    %eax,%edx
  100651:	8b 45 08             	mov    0x8(%ebp),%eax
  100654:	01 d0                	add    %edx,%eax
  100656:	8b 40 08             	mov    0x8(%eax),%eax
  100659:	39 45 18             	cmp    %eax,0x18(%ebp)
  10065c:	76 11                	jbe    10066f <stab_binsearch+0xb0>
            *region_left = m;
  10065e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100661:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100664:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100666:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100669:	40                   	inc    %eax
  10066a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10066d:	eb 40                	jmp    1006af <stab_binsearch+0xf0>
        } else if (stabs[m].n_value > addr) {
  10066f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100672:	89 d0                	mov    %edx,%eax
  100674:	01 c0                	add    %eax,%eax
  100676:	01 d0                	add    %edx,%eax
  100678:	c1 e0 02             	shl    $0x2,%eax
  10067b:	89 c2                	mov    %eax,%edx
  10067d:	8b 45 08             	mov    0x8(%ebp),%eax
  100680:	01 d0                	add    %edx,%eax
  100682:	8b 40 08             	mov    0x8(%eax),%eax
  100685:	39 45 18             	cmp    %eax,0x18(%ebp)
  100688:	73 14                	jae    10069e <stab_binsearch+0xdf>
            *region_right = m - 1;
  10068a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10068d:	8d 50 ff             	lea    -0x1(%eax),%edx
  100690:	8b 45 10             	mov    0x10(%ebp),%eax
  100693:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100695:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100698:	48                   	dec    %eax
  100699:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10069c:	eb 11                	jmp    1006af <stab_binsearch+0xf0>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10069e:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a1:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1006a4:	89 10                	mov    %edx,(%eax)
            l = m;
  1006a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1006ac:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1006af:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1006b2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1006b5:	0f 8e 2a ff ff ff    	jle    1005e5 <stab_binsearch+0x26>
        }
    }

    if (!any_matches) {
  1006bb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1006bf:	75 0f                	jne    1006d0 <stab_binsearch+0x111>
        *region_right = *region_left - 1;
  1006c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c4:	8b 00                	mov    (%eax),%eax
  1006c6:	8d 50 ff             	lea    -0x1(%eax),%edx
  1006c9:	8b 45 10             	mov    0x10(%ebp),%eax
  1006cc:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1006ce:	eb 3e                	jmp    10070e <stab_binsearch+0x14f>
        l = *region_right;
  1006d0:	8b 45 10             	mov    0x10(%ebp),%eax
  1006d3:	8b 00                	mov    (%eax),%eax
  1006d5:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1006d8:	eb 03                	jmp    1006dd <stab_binsearch+0x11e>
  1006da:	ff 4d fc             	decl   -0x4(%ebp)
  1006dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006e0:	8b 00                	mov    (%eax),%eax
  1006e2:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1006e5:	7e 1f                	jle    100706 <stab_binsearch+0x147>
  1006e7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1006ea:	89 d0                	mov    %edx,%eax
  1006ec:	01 c0                	add    %eax,%eax
  1006ee:	01 d0                	add    %edx,%eax
  1006f0:	c1 e0 02             	shl    $0x2,%eax
  1006f3:	89 c2                	mov    %eax,%edx
  1006f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1006f8:	01 d0                	add    %edx,%eax
  1006fa:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1006fe:	0f b6 c0             	movzbl %al,%eax
  100701:	39 45 14             	cmp    %eax,0x14(%ebp)
  100704:	75 d4                	jne    1006da <stab_binsearch+0x11b>
        *region_left = l;
  100706:	8b 45 0c             	mov    0xc(%ebp),%eax
  100709:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10070c:	89 10                	mov    %edx,(%eax)
}
  10070e:	90                   	nop
  10070f:	c9                   	leave  
  100710:	c3                   	ret    

00100711 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100711:	f3 0f 1e fb          	endbr32 
  100715:	55                   	push   %ebp
  100716:	89 e5                	mov    %esp,%ebp
  100718:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10071b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10071e:	c7 00 d0 37 10 00    	movl   $0x1037d0,(%eax)
    info->eip_line = 0;
  100724:	8b 45 0c             	mov    0xc(%ebp),%eax
  100727:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10072e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100731:	c7 40 08 d0 37 10 00 	movl   $0x1037d0,0x8(%eax)
    info->eip_fn_namelen = 9;
  100738:	8b 45 0c             	mov    0xc(%ebp),%eax
  10073b:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100742:	8b 45 0c             	mov    0xc(%ebp),%eax
  100745:	8b 55 08             	mov    0x8(%ebp),%edx
  100748:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10074b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10074e:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100755:	c7 45 f4 3c 3f 10 00 	movl   $0x103f3c,-0xc(%ebp)
    stab_end = __STAB_END__;
  10075c:	c7 45 f0 54 c9 10 00 	movl   $0x10c954,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100763:	c7 45 ec 55 c9 10 00 	movl   $0x10c955,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10076a:	c7 45 e8 22 ea 10 00 	movl   $0x10ea22,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100771:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100774:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100777:	76 0b                	jbe    100784 <debuginfo_eip+0x73>
  100779:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10077c:	48                   	dec    %eax
  10077d:	0f b6 00             	movzbl (%eax),%eax
  100780:	84 c0                	test   %al,%al
  100782:	74 0a                	je     10078e <debuginfo_eip+0x7d>
        return -1;
  100784:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100789:	e9 ab 02 00 00       	jmp    100a39 <debuginfo_eip+0x328>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  10078e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100795:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100798:	2b 45 f4             	sub    -0xc(%ebp),%eax
  10079b:	c1 f8 02             	sar    $0x2,%eax
  10079e:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1007a4:	48                   	dec    %eax
  1007a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1007a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1007ab:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007af:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1007b6:	00 
  1007b7:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1007ba:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007be:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1007c1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007c8:	89 04 24             	mov    %eax,(%esp)
  1007cb:	e8 ef fd ff ff       	call   1005bf <stab_binsearch>
    if (lfile == 0)
  1007d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007d3:	85 c0                	test   %eax,%eax
  1007d5:	75 0a                	jne    1007e1 <debuginfo_eip+0xd0>
        return -1;
  1007d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007dc:	e9 58 02 00 00       	jmp    100a39 <debuginfo_eip+0x328>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1007e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007e4:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1007e7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007ea:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1007ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1007f0:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007f4:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1007fb:	00 
  1007fc:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1007ff:	89 44 24 08          	mov    %eax,0x8(%esp)
  100803:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100806:	89 44 24 04          	mov    %eax,0x4(%esp)
  10080a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10080d:	89 04 24             	mov    %eax,(%esp)
  100810:	e8 aa fd ff ff       	call   1005bf <stab_binsearch>

    if (lfun <= rfun) {
  100815:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100818:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10081b:	39 c2                	cmp    %eax,%edx
  10081d:	7f 78                	jg     100897 <debuginfo_eip+0x186>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10081f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100822:	89 c2                	mov    %eax,%edx
  100824:	89 d0                	mov    %edx,%eax
  100826:	01 c0                	add    %eax,%eax
  100828:	01 d0                	add    %edx,%eax
  10082a:	c1 e0 02             	shl    $0x2,%eax
  10082d:	89 c2                	mov    %eax,%edx
  10082f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100832:	01 d0                	add    %edx,%eax
  100834:	8b 10                	mov    (%eax),%edx
  100836:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100839:	2b 45 ec             	sub    -0x14(%ebp),%eax
  10083c:	39 c2                	cmp    %eax,%edx
  10083e:	73 22                	jae    100862 <debuginfo_eip+0x151>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100840:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100843:	89 c2                	mov    %eax,%edx
  100845:	89 d0                	mov    %edx,%eax
  100847:	01 c0                	add    %eax,%eax
  100849:	01 d0                	add    %edx,%eax
  10084b:	c1 e0 02             	shl    $0x2,%eax
  10084e:	89 c2                	mov    %eax,%edx
  100850:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100853:	01 d0                	add    %edx,%eax
  100855:	8b 10                	mov    (%eax),%edx
  100857:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10085a:	01 c2                	add    %eax,%edx
  10085c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10085f:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100862:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100865:	89 c2                	mov    %eax,%edx
  100867:	89 d0                	mov    %edx,%eax
  100869:	01 c0                	add    %eax,%eax
  10086b:	01 d0                	add    %edx,%eax
  10086d:	c1 e0 02             	shl    $0x2,%eax
  100870:	89 c2                	mov    %eax,%edx
  100872:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100875:	01 d0                	add    %edx,%eax
  100877:	8b 50 08             	mov    0x8(%eax),%edx
  10087a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10087d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100880:	8b 45 0c             	mov    0xc(%ebp),%eax
  100883:	8b 40 10             	mov    0x10(%eax),%eax
  100886:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100889:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10088c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10088f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100892:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100895:	eb 15                	jmp    1008ac <debuginfo_eip+0x19b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100897:	8b 45 0c             	mov    0xc(%ebp),%eax
  10089a:	8b 55 08             	mov    0x8(%ebp),%edx
  10089d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1008a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1008a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1008a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1008a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1008ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008af:	8b 40 08             	mov    0x8(%eax),%eax
  1008b2:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1008b9:	00 
  1008ba:	89 04 24             	mov    %eax,(%esp)
  1008bd:	e8 18 24 00 00       	call   102cda <strfind>
  1008c2:	8b 55 0c             	mov    0xc(%ebp),%edx
  1008c5:	8b 52 08             	mov    0x8(%edx),%edx
  1008c8:	29 d0                	sub    %edx,%eax
  1008ca:	89 c2                	mov    %eax,%edx
  1008cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008cf:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1008d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1008d5:	89 44 24 10          	mov    %eax,0x10(%esp)
  1008d9:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1008e0:	00 
  1008e1:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1008e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1008e8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1008eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008f2:	89 04 24             	mov    %eax,(%esp)
  1008f5:	e8 c5 fc ff ff       	call   1005bf <stab_binsearch>
    if (lline <= rline) {
  1008fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100900:	39 c2                	cmp    %eax,%edx
  100902:	7f 23                	jg     100927 <debuginfo_eip+0x216>
        info->eip_line = stabs[rline].n_desc;
  100904:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100907:	89 c2                	mov    %eax,%edx
  100909:	89 d0                	mov    %edx,%eax
  10090b:	01 c0                	add    %eax,%eax
  10090d:	01 d0                	add    %edx,%eax
  10090f:	c1 e0 02             	shl    $0x2,%eax
  100912:	89 c2                	mov    %eax,%edx
  100914:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100917:	01 d0                	add    %edx,%eax
  100919:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10091d:	89 c2                	mov    %eax,%edx
  10091f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100922:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100925:	eb 11                	jmp    100938 <debuginfo_eip+0x227>
        return -1;
  100927:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10092c:	e9 08 01 00 00       	jmp    100a39 <debuginfo_eip+0x328>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100931:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100934:	48                   	dec    %eax
  100935:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100938:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10093b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10093e:	39 c2                	cmp    %eax,%edx
  100940:	7c 56                	jl     100998 <debuginfo_eip+0x287>
           && stabs[lline].n_type != N_SOL
  100942:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100945:	89 c2                	mov    %eax,%edx
  100947:	89 d0                	mov    %edx,%eax
  100949:	01 c0                	add    %eax,%eax
  10094b:	01 d0                	add    %edx,%eax
  10094d:	c1 e0 02             	shl    $0x2,%eax
  100950:	89 c2                	mov    %eax,%edx
  100952:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100955:	01 d0                	add    %edx,%eax
  100957:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10095b:	3c 84                	cmp    $0x84,%al
  10095d:	74 39                	je     100998 <debuginfo_eip+0x287>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10095f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100962:	89 c2                	mov    %eax,%edx
  100964:	89 d0                	mov    %edx,%eax
  100966:	01 c0                	add    %eax,%eax
  100968:	01 d0                	add    %edx,%eax
  10096a:	c1 e0 02             	shl    $0x2,%eax
  10096d:	89 c2                	mov    %eax,%edx
  10096f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100972:	01 d0                	add    %edx,%eax
  100974:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100978:	3c 64                	cmp    $0x64,%al
  10097a:	75 b5                	jne    100931 <debuginfo_eip+0x220>
  10097c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10097f:	89 c2                	mov    %eax,%edx
  100981:	89 d0                	mov    %edx,%eax
  100983:	01 c0                	add    %eax,%eax
  100985:	01 d0                	add    %edx,%eax
  100987:	c1 e0 02             	shl    $0x2,%eax
  10098a:	89 c2                	mov    %eax,%edx
  10098c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10098f:	01 d0                	add    %edx,%eax
  100991:	8b 40 08             	mov    0x8(%eax),%eax
  100994:	85 c0                	test   %eax,%eax
  100996:	74 99                	je     100931 <debuginfo_eip+0x220>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100998:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10099b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10099e:	39 c2                	cmp    %eax,%edx
  1009a0:	7c 42                	jl     1009e4 <debuginfo_eip+0x2d3>
  1009a2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1009a5:	89 c2                	mov    %eax,%edx
  1009a7:	89 d0                	mov    %edx,%eax
  1009a9:	01 c0                	add    %eax,%eax
  1009ab:	01 d0                	add    %edx,%eax
  1009ad:	c1 e0 02             	shl    $0x2,%eax
  1009b0:	89 c2                	mov    %eax,%edx
  1009b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009b5:	01 d0                	add    %edx,%eax
  1009b7:	8b 10                	mov    (%eax),%edx
  1009b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009bc:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1009bf:	39 c2                	cmp    %eax,%edx
  1009c1:	73 21                	jae    1009e4 <debuginfo_eip+0x2d3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1009c3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1009c6:	89 c2                	mov    %eax,%edx
  1009c8:	89 d0                	mov    %edx,%eax
  1009ca:	01 c0                	add    %eax,%eax
  1009cc:	01 d0                	add    %edx,%eax
  1009ce:	c1 e0 02             	shl    $0x2,%eax
  1009d1:	89 c2                	mov    %eax,%edx
  1009d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009d6:	01 d0                	add    %edx,%eax
  1009d8:	8b 10                	mov    (%eax),%edx
  1009da:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009dd:	01 c2                	add    %eax,%edx
  1009df:	8b 45 0c             	mov    0xc(%ebp),%eax
  1009e2:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1009e4:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1009e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1009ea:	39 c2                	cmp    %eax,%edx
  1009ec:	7d 46                	jge    100a34 <debuginfo_eip+0x323>
        for (lline = lfun + 1;
  1009ee:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009f1:	40                   	inc    %eax
  1009f2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1009f5:	eb 16                	jmp    100a0d <debuginfo_eip+0x2fc>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1009f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1009fa:	8b 40 14             	mov    0x14(%eax),%eax
  1009fd:	8d 50 01             	lea    0x1(%eax),%edx
  100a00:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a03:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100a06:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100a09:	40                   	inc    %eax
  100a0a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100a0d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100a10:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  100a13:	39 c2                	cmp    %eax,%edx
  100a15:	7d 1d                	jge    100a34 <debuginfo_eip+0x323>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100a17:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100a1a:	89 c2                	mov    %eax,%edx
  100a1c:	89 d0                	mov    %edx,%eax
  100a1e:	01 c0                	add    %eax,%eax
  100a20:	01 d0                	add    %edx,%eax
  100a22:	c1 e0 02             	shl    $0x2,%eax
  100a25:	89 c2                	mov    %eax,%edx
  100a27:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a2a:	01 d0                	add    %edx,%eax
  100a2c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100a30:	3c a0                	cmp    $0xa0,%al
  100a32:	74 c3                	je     1009f7 <debuginfo_eip+0x2e6>
        }
    }
    return 0;
  100a34:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100a39:	c9                   	leave  
  100a3a:	c3                   	ret    

00100a3b <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100a3b:	f3 0f 1e fb          	endbr32 
  100a3f:	55                   	push   %ebp
  100a40:	89 e5                	mov    %esp,%ebp
  100a42:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100a45:	c7 04 24 da 37 10 00 	movl   $0x1037da,(%esp)
  100a4c:	e8 ce f8 ff ff       	call   10031f <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100a51:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100a58:	00 
  100a59:	c7 04 24 f3 37 10 00 	movl   $0x1037f3,(%esp)
  100a60:	e8 ba f8 ff ff       	call   10031f <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100a65:	c7 44 24 04 d8 36 10 	movl   $0x1036d8,0x4(%esp)
  100a6c:	00 
  100a6d:	c7 04 24 0b 38 10 00 	movl   $0x10380b,(%esp)
  100a74:	e8 a6 f8 ff ff       	call   10031f <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100a79:	c7 44 24 04 50 f9 10 	movl   $0x10f950,0x4(%esp)
  100a80:	00 
  100a81:	c7 04 24 23 38 10 00 	movl   $0x103823,(%esp)
  100a88:	e8 92 f8 ff ff       	call   10031f <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100a8d:	c7 44 24 04 c0 0d 11 	movl   $0x110dc0,0x4(%esp)
  100a94:	00 
  100a95:	c7 04 24 3b 38 10 00 	movl   $0x10383b,(%esp)
  100a9c:	e8 7e f8 ff ff       	call   10031f <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100aa1:	b8 c0 0d 11 00       	mov    $0x110dc0,%eax
  100aa6:	2d 00 00 10 00       	sub    $0x100000,%eax
  100aab:	05 ff 03 00 00       	add    $0x3ff,%eax
  100ab0:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  100ab6:	85 c0                	test   %eax,%eax
  100ab8:	0f 48 c2             	cmovs  %edx,%eax
  100abb:	c1 f8 0a             	sar    $0xa,%eax
  100abe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ac2:	c7 04 24 54 38 10 00 	movl   $0x103854,(%esp)
  100ac9:	e8 51 f8 ff ff       	call   10031f <cprintf>
}
  100ace:	90                   	nop
  100acf:	c9                   	leave  
  100ad0:	c3                   	ret    

00100ad1 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100ad1:	f3 0f 1e fb          	endbr32 
  100ad5:	55                   	push   %ebp
  100ad6:	89 e5                	mov    %esp,%ebp
  100ad8:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  100ade:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100ae1:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ae5:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae8:	89 04 24             	mov    %eax,(%esp)
  100aeb:	e8 21 fc ff ff       	call   100711 <debuginfo_eip>
  100af0:	85 c0                	test   %eax,%eax
  100af2:	74 15                	je     100b09 <print_debuginfo+0x38>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100af4:	8b 45 08             	mov    0x8(%ebp),%eax
  100af7:	89 44 24 04          	mov    %eax,0x4(%esp)
  100afb:	c7 04 24 7e 38 10 00 	movl   $0x10387e,(%esp)
  100b02:	e8 18 f8 ff ff       	call   10031f <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100b07:	eb 6c                	jmp    100b75 <print_debuginfo+0xa4>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100b09:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b10:	eb 1b                	jmp    100b2d <print_debuginfo+0x5c>
            fnname[j] = info.eip_fn_name[j];
  100b12:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100b15:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b18:	01 d0                	add    %edx,%eax
  100b1a:	0f b6 10             	movzbl (%eax),%edx
  100b1d:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100b23:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b26:	01 c8                	add    %ecx,%eax
  100b28:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100b2a:	ff 45 f4             	incl   -0xc(%ebp)
  100b2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100b30:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100b33:	7c dd                	jl     100b12 <print_debuginfo+0x41>
        fnname[j] = '\0';
  100b35:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100b3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3e:	01 d0                	add    %edx,%eax
  100b40:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100b43:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100b46:	8b 55 08             	mov    0x8(%ebp),%edx
  100b49:	89 d1                	mov    %edx,%ecx
  100b4b:	29 c1                	sub    %eax,%ecx
  100b4d:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100b50:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b53:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100b57:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100b5d:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100b61:	89 54 24 08          	mov    %edx,0x8(%esp)
  100b65:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b69:	c7 04 24 9a 38 10 00 	movl   $0x10389a,(%esp)
  100b70:	e8 aa f7 ff ff       	call   10031f <cprintf>
}
  100b75:	90                   	nop
  100b76:	c9                   	leave  
  100b77:	c3                   	ret    

00100b78 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100b78:	f3 0f 1e fb          	endbr32 
  100b7c:	55                   	push   %ebp
  100b7d:	89 e5                	mov    %esp,%ebp
  100b7f:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100b82:	8b 45 04             	mov    0x4(%ebp),%eax
  100b85:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100b88:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100b8b:	c9                   	leave  
  100b8c:	c3                   	ret    

00100b8d <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100b8d:	f3 0f 1e fb          	endbr32 
  100b91:	55                   	push   %ebp
  100b92:	89 e5                	mov    %esp,%ebp
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
}
  100b94:	90                   	nop
  100b95:	5d                   	pop    %ebp
  100b96:	c3                   	ret    

00100b97 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b97:	f3 0f 1e fb          	endbr32 
  100b9b:	55                   	push   %ebp
  100b9c:	89 e5                	mov    %esp,%ebp
  100b9e:	53                   	push   %ebx
  100b9f:	83 ec 14             	sub    $0x14,%esp
  100ba2:	e8 fd f6 ff ff       	call   1002a4 <__x86.get_pc_thunk.bx>
  100ba7:	81 c3 a9 ed 00 00    	add    $0xeda9,%ebx
    int argc = 0;
  100bad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100bb4:	eb 0c                	jmp    100bc2 <parse+0x2b>
            *buf ++ = '\0';
  100bb6:	8b 45 08             	mov    0x8(%ebp),%eax
  100bb9:	8d 50 01             	lea    0x1(%eax),%edx
  100bbc:	89 55 08             	mov    %edx,0x8(%ebp)
  100bbf:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100bc2:	8b 45 08             	mov    0x8(%ebp),%eax
  100bc5:	0f b6 00             	movzbl (%eax),%eax
  100bc8:	84 c0                	test   %al,%al
  100bca:	74 20                	je     100bec <parse+0x55>
  100bcc:	8b 45 08             	mov    0x8(%ebp),%eax
  100bcf:	0f b6 00             	movzbl (%eax),%eax
  100bd2:	0f be c0             	movsbl %al,%eax
  100bd5:	83 ec 08             	sub    $0x8,%esp
  100bd8:	50                   	push   %eax
  100bd9:	8d 83 dc 3f ff ff    	lea    -0xc024(%ebx),%eax
  100bdf:	50                   	push   %eax
  100be0:	e8 b4 20 00 00       	call   102c99 <strchr>
  100be5:	83 c4 10             	add    $0x10,%esp
  100be8:	85 c0                	test   %eax,%eax
  100bea:	75 ca                	jne    100bb6 <parse+0x1f>
        }
        if (*buf == '\0') {
  100bec:	8b 45 08             	mov    0x8(%ebp),%eax
  100bef:	0f b6 00             	movzbl (%eax),%eax
  100bf2:	84 c0                	test   %al,%al
  100bf4:	74 69                	je     100c5f <parse+0xc8>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100bf6:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100bfa:	75 14                	jne    100c10 <parse+0x79>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100bfc:	83 ec 08             	sub    $0x8,%esp
  100bff:	6a 10                	push   $0x10
  100c01:	8d 83 e1 3f ff ff    	lea    -0xc01f(%ebx),%eax
  100c07:	50                   	push   %eax
  100c08:	e8 12 f7 ff ff       	call   10031f <cprintf>
  100c0d:	83 c4 10             	add    $0x10,%esp
        }
        argv[argc ++] = buf;
  100c10:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c13:	8d 50 01             	lea    0x1(%eax),%edx
  100c16:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100c19:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100c20:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c23:	01 c2                	add    %eax,%edx
  100c25:	8b 45 08             	mov    0x8(%ebp),%eax
  100c28:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100c2a:	eb 04                	jmp    100c30 <parse+0x99>
            buf ++;
  100c2c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100c30:	8b 45 08             	mov    0x8(%ebp),%eax
  100c33:	0f b6 00             	movzbl (%eax),%eax
  100c36:	84 c0                	test   %al,%al
  100c38:	74 88                	je     100bc2 <parse+0x2b>
  100c3a:	8b 45 08             	mov    0x8(%ebp),%eax
  100c3d:	0f b6 00             	movzbl (%eax),%eax
  100c40:	0f be c0             	movsbl %al,%eax
  100c43:	83 ec 08             	sub    $0x8,%esp
  100c46:	50                   	push   %eax
  100c47:	8d 83 dc 3f ff ff    	lea    -0xc024(%ebx),%eax
  100c4d:	50                   	push   %eax
  100c4e:	e8 46 20 00 00       	call   102c99 <strchr>
  100c53:	83 c4 10             	add    $0x10,%esp
  100c56:	85 c0                	test   %eax,%eax
  100c58:	74 d2                	je     100c2c <parse+0x95>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100c5a:	e9 63 ff ff ff       	jmp    100bc2 <parse+0x2b>
            break;
  100c5f:	90                   	nop
        }
    }
    return argc;
  100c60:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100c63:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c66:	c9                   	leave  
  100c67:	c3                   	ret    

00100c68 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100c68:	f3 0f 1e fb          	endbr32 
  100c6c:	55                   	push   %ebp
  100c6d:	89 e5                	mov    %esp,%ebp
  100c6f:	56                   	push   %esi
  100c70:	53                   	push   %ebx
  100c71:	83 ec 50             	sub    $0x50,%esp
  100c74:	e8 2b f6 ff ff       	call   1002a4 <__x86.get_pc_thunk.bx>
  100c79:	81 c3 d7 ec 00 00    	add    $0xecd7,%ebx
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100c7f:	83 ec 08             	sub    $0x8,%esp
  100c82:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c85:	50                   	push   %eax
  100c86:	ff 75 08             	pushl  0x8(%ebp)
  100c89:	e8 09 ff ff ff       	call   100b97 <parse>
  100c8e:	83 c4 10             	add    $0x10,%esp
  100c91:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c94:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c98:	75 0a                	jne    100ca4 <runcmd+0x3c>
        return 0;
  100c9a:	b8 00 00 00 00       	mov    $0x0,%eax
  100c9f:	e9 8b 00 00 00       	jmp    100d2f <runcmd+0xc7>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100ca4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100cab:	eb 5f                	jmp    100d0c <runcmd+0xa4>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100cad:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100cb0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cb3:	8d b3 10 00 00 00    	lea    0x10(%ebx),%esi
  100cb9:	89 d0                	mov    %edx,%eax
  100cbb:	01 c0                	add    %eax,%eax
  100cbd:	01 d0                	add    %edx,%eax
  100cbf:	c1 e0 02             	shl    $0x2,%eax
  100cc2:	01 f0                	add    %esi,%eax
  100cc4:	8b 00                	mov    (%eax),%eax
  100cc6:	83 ec 08             	sub    $0x8,%esp
  100cc9:	51                   	push   %ecx
  100cca:	50                   	push   %eax
  100ccb:	e8 0e 1f 00 00       	call   102bde <strcmp>
  100cd0:	83 c4 10             	add    $0x10,%esp
  100cd3:	85 c0                	test   %eax,%eax
  100cd5:	75 31                	jne    100d08 <runcmd+0xa0>
            return commands[i].func(argc - 1, argv + 1, tf);
  100cd7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cda:	8d 8b 18 00 00 00    	lea    0x18(%ebx),%ecx
  100ce0:	89 d0                	mov    %edx,%eax
  100ce2:	01 c0                	add    %eax,%eax
  100ce4:	01 d0                	add    %edx,%eax
  100ce6:	c1 e0 02             	shl    $0x2,%eax
  100ce9:	01 c8                	add    %ecx,%eax
  100ceb:	8b 10                	mov    (%eax),%edx
  100ced:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100cf0:	83 c0 04             	add    $0x4,%eax
  100cf3:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100cf6:	83 e9 01             	sub    $0x1,%ecx
  100cf9:	83 ec 04             	sub    $0x4,%esp
  100cfc:	ff 75 0c             	pushl  0xc(%ebp)
  100cff:	50                   	push   %eax
  100d00:	51                   	push   %ecx
  100d01:	ff d2                	call   *%edx
  100d03:	83 c4 10             	add    $0x10,%esp
  100d06:	eb 27                	jmp    100d2f <runcmd+0xc7>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d08:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100d0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d0f:	83 f8 02             	cmp    $0x2,%eax
  100d12:	76 99                	jbe    100cad <runcmd+0x45>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100d14:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100d17:	83 ec 08             	sub    $0x8,%esp
  100d1a:	50                   	push   %eax
  100d1b:	8d 83 ff 3f ff ff    	lea    -0xc001(%ebx),%eax
  100d21:	50                   	push   %eax
  100d22:	e8 f8 f5 ff ff       	call   10031f <cprintf>
  100d27:	83 c4 10             	add    $0x10,%esp
    return 0;
  100d2a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d2f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100d32:	5b                   	pop    %ebx
  100d33:	5e                   	pop    %esi
  100d34:	5d                   	pop    %ebp
  100d35:	c3                   	ret    

00100d36 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100d36:	f3 0f 1e fb          	endbr32 
  100d3a:	55                   	push   %ebp
  100d3b:	89 e5                	mov    %esp,%ebp
  100d3d:	53                   	push   %ebx
  100d3e:	83 ec 14             	sub    $0x14,%esp
  100d41:	e8 5e f5 ff ff       	call   1002a4 <__x86.get_pc_thunk.bx>
  100d46:	81 c3 0a ec 00 00    	add    $0xec0a,%ebx
    cprintf("Welcome to the kernel debug monitor!!\n");
  100d4c:	83 ec 0c             	sub    $0xc,%esp
  100d4f:	8d 83 18 40 ff ff    	lea    -0xbfe8(%ebx),%eax
  100d55:	50                   	push   %eax
  100d56:	e8 c4 f5 ff ff       	call   10031f <cprintf>
  100d5b:	83 c4 10             	add    $0x10,%esp
    cprintf("Type 'help' for a list of commands.\n");
  100d5e:	83 ec 0c             	sub    $0xc,%esp
  100d61:	8d 83 40 40 ff ff    	lea    -0xbfc0(%ebx),%eax
  100d67:	50                   	push   %eax
  100d68:	e8 b2 f5 ff ff       	call   10031f <cprintf>
  100d6d:	83 c4 10             	add    $0x10,%esp

    if (tf != NULL) {
  100d70:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100d74:	74 0e                	je     100d84 <kmonitor+0x4e>
        print_trapframe(tf);
  100d76:	83 ec 0c             	sub    $0xc,%esp
  100d79:	ff 75 08             	pushl  0x8(%ebp)
  100d7c:	e8 30 0d 00 00       	call   101ab1 <print_trapframe>
  100d81:	83 c4 10             	add    $0x10,%esp
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100d84:	83 ec 0c             	sub    $0xc,%esp
  100d87:	8d 83 65 40 ff ff    	lea    -0xbf9b(%ebx),%eax
  100d8d:	50                   	push   %eax
  100d8e:	e8 75 f6 ff ff       	call   100408 <readline>
  100d93:	83 c4 10             	add    $0x10,%esp
  100d96:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d99:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d9d:	74 e5                	je     100d84 <kmonitor+0x4e>
            if (runcmd(buf, tf) < 0) {
  100d9f:	83 ec 08             	sub    $0x8,%esp
  100da2:	ff 75 08             	pushl  0x8(%ebp)
  100da5:	ff 75 f4             	pushl  -0xc(%ebp)
  100da8:	e8 bb fe ff ff       	call   100c68 <runcmd>
  100dad:	83 c4 10             	add    $0x10,%esp
  100db0:	85 c0                	test   %eax,%eax
  100db2:	78 02                	js     100db6 <kmonitor+0x80>
        if ((buf = readline("K> ")) != NULL) {
  100db4:	eb ce                	jmp    100d84 <kmonitor+0x4e>
                break;
  100db6:	90                   	nop
            }
        }
    }
}
  100db7:	90                   	nop
  100db8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100dbb:	c9                   	leave  
  100dbc:	c3                   	ret    

00100dbd <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100dbd:	f3 0f 1e fb          	endbr32 
  100dc1:	55                   	push   %ebp
  100dc2:	89 e5                	mov    %esp,%ebp
  100dc4:	56                   	push   %esi
  100dc5:	53                   	push   %ebx
  100dc6:	83 ec 10             	sub    $0x10,%esp
  100dc9:	e8 d6 f4 ff ff       	call   1002a4 <__x86.get_pc_thunk.bx>
  100dce:	81 c3 82 eb 00 00    	add    $0xeb82,%ebx
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100dd4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100ddb:	eb 44                	jmp    100e21 <mon_help+0x64>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100ddd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100de0:	8d 8b 14 00 00 00    	lea    0x14(%ebx),%ecx
  100de6:	89 d0                	mov    %edx,%eax
  100de8:	01 c0                	add    %eax,%eax
  100dea:	01 d0                	add    %edx,%eax
  100dec:	c1 e0 02             	shl    $0x2,%eax
  100def:	01 c8                	add    %ecx,%eax
  100df1:	8b 08                	mov    (%eax),%ecx
  100df3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100df6:	8d b3 10 00 00 00    	lea    0x10(%ebx),%esi
  100dfc:	89 d0                	mov    %edx,%eax
  100dfe:	01 c0                	add    %eax,%eax
  100e00:	01 d0                	add    %edx,%eax
  100e02:	c1 e0 02             	shl    $0x2,%eax
  100e05:	01 f0                	add    %esi,%eax
  100e07:	8b 00                	mov    (%eax),%eax
  100e09:	83 ec 04             	sub    $0x4,%esp
  100e0c:	51                   	push   %ecx
  100e0d:	50                   	push   %eax
  100e0e:	8d 83 69 40 ff ff    	lea    -0xbf97(%ebx),%eax
  100e14:	50                   	push   %eax
  100e15:	e8 05 f5 ff ff       	call   10031f <cprintf>
  100e1a:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < NCOMMANDS; i ++) {
  100e1d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100e21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e24:	83 f8 02             	cmp    $0x2,%eax
  100e27:	76 b4                	jbe    100ddd <mon_help+0x20>
    }
    return 0;
  100e29:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100e2e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100e31:	5b                   	pop    %ebx
  100e32:	5e                   	pop    %esi
  100e33:	5d                   	pop    %ebp
  100e34:	c3                   	ret    

00100e35 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100e35:	f3 0f 1e fb          	endbr32 
  100e39:	55                   	push   %ebp
  100e3a:	89 e5                	mov    %esp,%ebp
  100e3c:	53                   	push   %ebx
  100e3d:	83 ec 04             	sub    $0x4,%esp
  100e40:	e8 5b f4 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  100e45:	05 0b eb 00 00       	add    $0xeb0b,%eax
    print_kerninfo();
  100e4a:	89 c3                	mov    %eax,%ebx
  100e4c:	e8 ea fb ff ff       	call   100a3b <print_kerninfo>
    return 0;
  100e51:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100e56:	83 c4 04             	add    $0x4,%esp
  100e59:	5b                   	pop    %ebx
  100e5a:	5d                   	pop    %ebp
  100e5b:	c3                   	ret    

00100e5c <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100e5c:	f3 0f 1e fb          	endbr32 
  100e60:	55                   	push   %ebp
  100e61:	89 e5                	mov    %esp,%ebp
  100e63:	53                   	push   %ebx
  100e64:	83 ec 04             	sub    $0x4,%esp
  100e67:	e8 34 f4 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  100e6c:	05 e4 ea 00 00       	add    $0xeae4,%eax
    print_stackframe();
  100e71:	89 c3                	mov    %eax,%ebx
  100e73:	e8 15 fd ff ff       	call   100b8d <print_stackframe>
    return 0;
  100e78:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100e7d:	83 c4 04             	add    $0x4,%esp
  100e80:	5b                   	pop    %ebx
  100e81:	5d                   	pop    %ebp
  100e82:	c3                   	ret    

00100e83 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100e83:	f3 0f 1e fb          	endbr32 
  100e87:	55                   	push   %ebp
  100e88:	89 e5                	mov    %esp,%ebp
  100e8a:	53                   	push   %ebx
  100e8b:	83 ec 14             	sub    $0x14,%esp
  100e8e:	e8 11 f4 ff ff       	call   1002a4 <__x86.get_pc_thunk.bx>
  100e93:	81 c3 bd ea 00 00    	add    $0xeabd,%ebx
  100e99:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100e9f:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ea3:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ea7:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100eab:	ee                   	out    %al,(%dx)
}
  100eac:	90                   	nop
  100ead:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100eb3:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eb7:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100ebb:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100ebf:	ee                   	out    %al,(%dx)
}
  100ec0:	90                   	nop
  100ec1:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100ec7:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ecb:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100ecf:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ed3:	ee                   	out    %al,(%dx)
}
  100ed4:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100ed5:	c7 c0 a8 09 11 00    	mov    $0x1109a8,%eax
  100edb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

    cprintf("++ setup timer interrupts\n");
  100ee1:	83 ec 0c             	sub    $0xc,%esp
  100ee4:	8d 83 72 40 ff ff    	lea    -0xbf8e(%ebx),%eax
  100eea:	50                   	push   %eax
  100eeb:	e8 2f f4 ff ff       	call   10031f <cprintf>
  100ef0:	83 c4 10             	add    $0x10,%esp
    pic_enable(IRQ_TIMER);
  100ef3:	83 ec 0c             	sub    $0xc,%esp
  100ef6:	6a 00                	push   $0x0
  100ef8:	e8 43 09 00 00       	call   101840 <pic_enable>
  100efd:	83 c4 10             	add    $0x10,%esp
}
  100f00:	90                   	nop
  100f01:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100f04:	c9                   	leave  
  100f05:	c3                   	ret    

00100f06 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100f06:	f3 0f 1e fb          	endbr32 
  100f0a:	55                   	push   %ebp
  100f0b:	89 e5                	mov    %esp,%ebp
  100f0d:	83 ec 10             	sub    $0x10,%esp
  100f10:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f16:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f1a:	89 c2                	mov    %eax,%edx
  100f1c:	ec                   	in     (%dx),%al
  100f1d:	88 45 f1             	mov    %al,-0xf(%ebp)
  100f20:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100f26:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100f2a:	89 c2                	mov    %eax,%edx
  100f2c:	ec                   	in     (%dx),%al
  100f2d:	88 45 f5             	mov    %al,-0xb(%ebp)
  100f30:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100f36:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100f3a:	89 c2                	mov    %eax,%edx
  100f3c:	ec                   	in     (%dx),%al
  100f3d:	88 45 f9             	mov    %al,-0x7(%ebp)
  100f40:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100f46:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100f4a:	89 c2                	mov    %eax,%edx
  100f4c:	ec                   	in     (%dx),%al
  100f4d:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100f50:	90                   	nop
  100f51:	c9                   	leave  
  100f52:	c3                   	ret    

00100f53 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100f53:	f3 0f 1e fb          	endbr32 
  100f57:	55                   	push   %ebp
  100f58:	89 e5                	mov    %esp,%ebp
  100f5a:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100f5d:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100f64:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f67:	0f b7 00             	movzwl (%eax),%eax
  100f6a:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100f6e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f71:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100f76:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f79:	0f b7 00             	movzwl (%eax),%eax
  100f7c:	0f b7 c0             	movzwl %ax,%eax
  100f7f:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100f84:	74 12                	je     100f98 <cga_init+0x45>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100f86:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100f8d:	66 c7 05 06 ff 10 00 	movw   $0x3b4,0x10ff06
  100f94:	b4 03 
  100f96:	eb 13                	jmp    100fab <cga_init+0x58>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100f98:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f9b:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100f9f:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100fa2:	66 c7 05 06 ff 10 00 	movw   $0x3d4,0x10ff06
  100fa9:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100fab:	0f b7 05 06 ff 10 00 	movzwl 0x10ff06,%eax
  100fb2:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100fb6:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fba:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fbe:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fc2:	ee                   	out    %al,(%dx)
}
  100fc3:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100fc4:	0f b7 05 06 ff 10 00 	movzwl 0x10ff06,%eax
  100fcb:	40                   	inc    %eax
  100fcc:	0f b7 c0             	movzwl %ax,%eax
  100fcf:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fd3:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100fd7:	89 c2                	mov    %eax,%edx
  100fd9:	ec                   	in     (%dx),%al
  100fda:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100fdd:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100fe1:	0f b6 c0             	movzbl %al,%eax
  100fe4:	c1 e0 08             	shl    $0x8,%eax
  100fe7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100fea:	0f b7 05 06 ff 10 00 	movzwl 0x10ff06,%eax
  100ff1:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100ff5:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ff9:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ffd:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101001:	ee                   	out    %al,(%dx)
}
  101002:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  101003:	0f b7 05 06 ff 10 00 	movzwl 0x10ff06,%eax
  10100a:	40                   	inc    %eax
  10100b:	0f b7 c0             	movzwl %ax,%eax
  10100e:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101012:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  101016:	89 c2                	mov    %eax,%edx
  101018:	ec                   	in     (%dx),%al
  101019:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  10101c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101020:	0f b6 c0             	movzbl %al,%eax
  101023:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  101026:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101029:	a3 00 ff 10 00       	mov    %eax,0x10ff00
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  10102e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101031:	0f b7 c0             	movzwl %ax,%eax
  101034:	66 a3 04 ff 10 00    	mov    %ax,0x10ff04
}
  10103a:	90                   	nop
  10103b:	c9                   	leave  
  10103c:	c3                   	ret    

0010103d <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  10103d:	f3 0f 1e fb          	endbr32 
  101041:	55                   	push   %ebp
  101042:	89 e5                	mov    %esp,%ebp
  101044:	83 ec 48             	sub    $0x48,%esp
  101047:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  10104d:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101051:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101055:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101059:	ee                   	out    %al,(%dx)
}
  10105a:	90                   	nop
  10105b:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  101061:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101065:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101069:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10106d:	ee                   	out    %al,(%dx)
}
  10106e:	90                   	nop
  10106f:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  101075:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101079:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10107d:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101081:	ee                   	out    %al,(%dx)
}
  101082:	90                   	nop
  101083:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  101089:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10108d:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101091:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101095:	ee                   	out    %al,(%dx)
}
  101096:	90                   	nop
  101097:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  10109d:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010a1:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1010a5:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  1010a9:	ee                   	out    %al,(%dx)
}
  1010aa:	90                   	nop
  1010ab:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  1010b1:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010b5:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1010b9:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1010bd:	ee                   	out    %al,(%dx)
}
  1010be:	90                   	nop
  1010bf:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  1010c5:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010c9:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1010cd:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1010d1:	ee                   	out    %al,(%dx)
}
  1010d2:	90                   	nop
  1010d3:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1010d9:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  1010dd:	89 c2                	mov    %eax,%edx
  1010df:	ec                   	in     (%dx),%al
  1010e0:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  1010e3:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  1010e7:	3c ff                	cmp    $0xff,%al
  1010e9:	0f 95 c0             	setne  %al
  1010ec:	0f b6 c0             	movzbl %al,%eax
  1010ef:	a3 08 ff 10 00       	mov    %eax,0x10ff08
  1010f4:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1010fa:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  1010fe:	89 c2                	mov    %eax,%edx
  101100:	ec                   	in     (%dx),%al
  101101:	88 45 f1             	mov    %al,-0xf(%ebp)
  101104:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10110a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10110e:	89 c2                	mov    %eax,%edx
  101110:	ec                   	in     (%dx),%al
  101111:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101114:	a1 08 ff 10 00       	mov    0x10ff08,%eax
  101119:	85 c0                	test   %eax,%eax
  10111b:	74 0c                	je     101129 <serial_init+0xec>
        pic_enable(IRQ_COM1);
  10111d:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101124:	e8 17 07 00 00       	call   101840 <pic_enable>
    }
}
  101129:	90                   	nop
  10112a:	c9                   	leave  
  10112b:	c3                   	ret    

0010112c <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  10112c:	f3 0f 1e fb          	endbr32 
  101130:	55                   	push   %ebp
  101131:	89 e5                	mov    %esp,%ebp
  101133:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101136:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10113d:	eb 08                	jmp    101147 <lpt_putc_sub+0x1b>
        delay();
  10113f:	e8 c2 fd ff ff       	call   100f06 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101144:	ff 45 fc             	incl   -0x4(%ebp)
  101147:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  10114d:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101151:	89 c2                	mov    %eax,%edx
  101153:	ec                   	in     (%dx),%al
  101154:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101157:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10115b:	84 c0                	test   %al,%al
  10115d:	78 09                	js     101168 <lpt_putc_sub+0x3c>
  10115f:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101166:	7e d7                	jle    10113f <lpt_putc_sub+0x13>
    }
    outb(LPTPORT + 0, c);
  101168:	8b 45 08             	mov    0x8(%ebp),%eax
  10116b:	0f b6 c0             	movzbl %al,%eax
  10116e:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101174:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101177:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10117b:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10117f:	ee                   	out    %al,(%dx)
}
  101180:	90                   	nop
  101181:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101187:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10118b:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10118f:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101193:	ee                   	out    %al,(%dx)
}
  101194:	90                   	nop
  101195:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  10119b:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10119f:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1011a3:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1011a7:	ee                   	out    %al,(%dx)
}
  1011a8:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1011a9:	90                   	nop
  1011aa:	c9                   	leave  
  1011ab:	c3                   	ret    

001011ac <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1011ac:	f3 0f 1e fb          	endbr32 
  1011b0:	55                   	push   %ebp
  1011b1:	89 e5                	mov    %esp,%ebp
  1011b3:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1011b6:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1011ba:	74 0d                	je     1011c9 <lpt_putc+0x1d>
        lpt_putc_sub(c);
  1011bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1011bf:	89 04 24             	mov    %eax,(%esp)
  1011c2:	e8 65 ff ff ff       	call   10112c <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1011c7:	eb 24                	jmp    1011ed <lpt_putc+0x41>
        lpt_putc_sub('\b');
  1011c9:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1011d0:	e8 57 ff ff ff       	call   10112c <lpt_putc_sub>
        lpt_putc_sub(' ');
  1011d5:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1011dc:	e8 4b ff ff ff       	call   10112c <lpt_putc_sub>
        lpt_putc_sub('\b');
  1011e1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1011e8:	e8 3f ff ff ff       	call   10112c <lpt_putc_sub>
}
  1011ed:	90                   	nop
  1011ee:	c9                   	leave  
  1011ef:	c3                   	ret    

001011f0 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  1011f0:	f3 0f 1e fb          	endbr32 
  1011f4:	55                   	push   %ebp
  1011f5:	89 e5                	mov    %esp,%ebp
  1011f7:	53                   	push   %ebx
  1011f8:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  1011fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1011fe:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101203:	85 c0                	test   %eax,%eax
  101205:	75 07                	jne    10120e <cga_putc+0x1e>
        c |= 0x0700;
  101207:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10120e:	8b 45 08             	mov    0x8(%ebp),%eax
  101211:	0f b6 c0             	movzbl %al,%eax
  101214:	83 f8 0d             	cmp    $0xd,%eax
  101217:	74 72                	je     10128b <cga_putc+0x9b>
  101219:	83 f8 0d             	cmp    $0xd,%eax
  10121c:	0f 8f a3 00 00 00    	jg     1012c5 <cga_putc+0xd5>
  101222:	83 f8 08             	cmp    $0x8,%eax
  101225:	74 0a                	je     101231 <cga_putc+0x41>
  101227:	83 f8 0a             	cmp    $0xa,%eax
  10122a:	74 4c                	je     101278 <cga_putc+0x88>
  10122c:	e9 94 00 00 00       	jmp    1012c5 <cga_putc+0xd5>
    case '\b':
        if (crt_pos > 0) {
  101231:	0f b7 05 04 ff 10 00 	movzwl 0x10ff04,%eax
  101238:	85 c0                	test   %eax,%eax
  10123a:	0f 84 af 00 00 00    	je     1012ef <cga_putc+0xff>
            crt_pos --;
  101240:	0f b7 05 04 ff 10 00 	movzwl 0x10ff04,%eax
  101247:	48                   	dec    %eax
  101248:	0f b7 c0             	movzwl %ax,%eax
  10124b:	66 a3 04 ff 10 00    	mov    %ax,0x10ff04
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101251:	8b 45 08             	mov    0x8(%ebp),%eax
  101254:	98                   	cwtl   
  101255:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10125a:	98                   	cwtl   
  10125b:	83 c8 20             	or     $0x20,%eax
  10125e:	98                   	cwtl   
  10125f:	8b 15 00 ff 10 00    	mov    0x10ff00,%edx
  101265:	0f b7 0d 04 ff 10 00 	movzwl 0x10ff04,%ecx
  10126c:	01 c9                	add    %ecx,%ecx
  10126e:	01 ca                	add    %ecx,%edx
  101270:	0f b7 c0             	movzwl %ax,%eax
  101273:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101276:	eb 77                	jmp    1012ef <cga_putc+0xff>
    case '\n':
        crt_pos += CRT_COLS;
  101278:	0f b7 05 04 ff 10 00 	movzwl 0x10ff04,%eax
  10127f:	83 c0 50             	add    $0x50,%eax
  101282:	0f b7 c0             	movzwl %ax,%eax
  101285:	66 a3 04 ff 10 00    	mov    %ax,0x10ff04
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10128b:	0f b7 1d 04 ff 10 00 	movzwl 0x10ff04,%ebx
  101292:	0f b7 0d 04 ff 10 00 	movzwl 0x10ff04,%ecx
  101299:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  10129e:	89 c8                	mov    %ecx,%eax
  1012a0:	f7 e2                	mul    %edx
  1012a2:	c1 ea 06             	shr    $0x6,%edx
  1012a5:	89 d0                	mov    %edx,%eax
  1012a7:	c1 e0 02             	shl    $0x2,%eax
  1012aa:	01 d0                	add    %edx,%eax
  1012ac:	c1 e0 04             	shl    $0x4,%eax
  1012af:	29 c1                	sub    %eax,%ecx
  1012b1:	89 c8                	mov    %ecx,%eax
  1012b3:	0f b7 c0             	movzwl %ax,%eax
  1012b6:	29 c3                	sub    %eax,%ebx
  1012b8:	89 d8                	mov    %ebx,%eax
  1012ba:	0f b7 c0             	movzwl %ax,%eax
  1012bd:	66 a3 04 ff 10 00    	mov    %ax,0x10ff04
        break;
  1012c3:	eb 2b                	jmp    1012f0 <cga_putc+0x100>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1012c5:	8b 0d 00 ff 10 00    	mov    0x10ff00,%ecx
  1012cb:	0f b7 05 04 ff 10 00 	movzwl 0x10ff04,%eax
  1012d2:	8d 50 01             	lea    0x1(%eax),%edx
  1012d5:	0f b7 d2             	movzwl %dx,%edx
  1012d8:	66 89 15 04 ff 10 00 	mov    %dx,0x10ff04
  1012df:	01 c0                	add    %eax,%eax
  1012e1:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1012e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1012e7:	0f b7 c0             	movzwl %ax,%eax
  1012ea:	66 89 02             	mov    %ax,(%edx)
        break;
  1012ed:	eb 01                	jmp    1012f0 <cga_putc+0x100>
        break;
  1012ef:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1012f0:	0f b7 05 04 ff 10 00 	movzwl 0x10ff04,%eax
  1012f7:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  1012fc:	76 5d                	jbe    10135b <cga_putc+0x16b>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1012fe:	a1 00 ff 10 00       	mov    0x10ff00,%eax
  101303:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101309:	a1 00 ff 10 00       	mov    0x10ff00,%eax
  10130e:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101315:	00 
  101316:	89 54 24 04          	mov    %edx,0x4(%esp)
  10131a:	89 04 24             	mov    %eax,(%esp)
  10131d:	e8 ad 1b 00 00       	call   102ecf <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101322:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101329:	eb 14                	jmp    10133f <cga_putc+0x14f>
            crt_buf[i] = 0x0700 | ' ';
  10132b:	a1 00 ff 10 00       	mov    0x10ff00,%eax
  101330:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101333:	01 d2                	add    %edx,%edx
  101335:	01 d0                	add    %edx,%eax
  101337:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10133c:	ff 45 f4             	incl   -0xc(%ebp)
  10133f:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101346:	7e e3                	jle    10132b <cga_putc+0x13b>
        }
        crt_pos -= CRT_COLS;
  101348:	0f b7 05 04 ff 10 00 	movzwl 0x10ff04,%eax
  10134f:	83 e8 50             	sub    $0x50,%eax
  101352:	0f b7 c0             	movzwl %ax,%eax
  101355:	66 a3 04 ff 10 00    	mov    %ax,0x10ff04
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10135b:	0f b7 05 06 ff 10 00 	movzwl 0x10ff06,%eax
  101362:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101366:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10136a:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10136e:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101372:	ee                   	out    %al,(%dx)
}
  101373:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101374:	0f b7 05 04 ff 10 00 	movzwl 0x10ff04,%eax
  10137b:	c1 e8 08             	shr    $0x8,%eax
  10137e:	0f b7 c0             	movzwl %ax,%eax
  101381:	0f b6 c0             	movzbl %al,%eax
  101384:	0f b7 15 06 ff 10 00 	movzwl 0x10ff06,%edx
  10138b:	42                   	inc    %edx
  10138c:	0f b7 d2             	movzwl %dx,%edx
  10138f:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101393:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101396:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10139a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10139e:	ee                   	out    %al,(%dx)
}
  10139f:	90                   	nop
    outb(addr_6845, 15);
  1013a0:	0f b7 05 06 ff 10 00 	movzwl 0x10ff06,%eax
  1013a7:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1013ab:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1013af:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1013b3:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1013b7:	ee                   	out    %al,(%dx)
}
  1013b8:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1013b9:	0f b7 05 04 ff 10 00 	movzwl 0x10ff04,%eax
  1013c0:	0f b6 c0             	movzbl %al,%eax
  1013c3:	0f b7 15 06 ff 10 00 	movzwl 0x10ff06,%edx
  1013ca:	42                   	inc    %edx
  1013cb:	0f b7 d2             	movzwl %dx,%edx
  1013ce:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  1013d2:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1013d5:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1013d9:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1013dd:	ee                   	out    %al,(%dx)
}
  1013de:	90                   	nop
}
  1013df:	90                   	nop
  1013e0:	83 c4 34             	add    $0x34,%esp
  1013e3:	5b                   	pop    %ebx
  1013e4:	5d                   	pop    %ebp
  1013e5:	c3                   	ret    

001013e6 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1013e6:	f3 0f 1e fb          	endbr32 
  1013ea:	55                   	push   %ebp
  1013eb:	89 e5                	mov    %esp,%ebp
  1013ed:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1013f0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1013f7:	eb 08                	jmp    101401 <serial_putc_sub+0x1b>
        delay();
  1013f9:	e8 08 fb ff ff       	call   100f06 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1013fe:	ff 45 fc             	incl   -0x4(%ebp)
  101401:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101407:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10140b:	89 c2                	mov    %eax,%edx
  10140d:	ec                   	in     (%dx),%al
  10140e:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101411:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101415:	0f b6 c0             	movzbl %al,%eax
  101418:	83 e0 20             	and    $0x20,%eax
  10141b:	85 c0                	test   %eax,%eax
  10141d:	75 09                	jne    101428 <serial_putc_sub+0x42>
  10141f:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101426:	7e d1                	jle    1013f9 <serial_putc_sub+0x13>
    }
    outb(COM1 + COM_TX, c);
  101428:	8b 45 08             	mov    0x8(%ebp),%eax
  10142b:	0f b6 c0             	movzbl %al,%eax
  10142e:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101434:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101437:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10143b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10143f:	ee                   	out    %al,(%dx)
}
  101440:	90                   	nop
}
  101441:	90                   	nop
  101442:	c9                   	leave  
  101443:	c3                   	ret    

00101444 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101444:	f3 0f 1e fb          	endbr32 
  101448:	55                   	push   %ebp
  101449:	89 e5                	mov    %esp,%ebp
  10144b:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10144e:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101452:	74 0d                	je     101461 <serial_putc+0x1d>
        serial_putc_sub(c);
  101454:	8b 45 08             	mov    0x8(%ebp),%eax
  101457:	89 04 24             	mov    %eax,(%esp)
  10145a:	e8 87 ff ff ff       	call   1013e6 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  10145f:	eb 24                	jmp    101485 <serial_putc+0x41>
        serial_putc_sub('\b');
  101461:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101468:	e8 79 ff ff ff       	call   1013e6 <serial_putc_sub>
        serial_putc_sub(' ');
  10146d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101474:	e8 6d ff ff ff       	call   1013e6 <serial_putc_sub>
        serial_putc_sub('\b');
  101479:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101480:	e8 61 ff ff ff       	call   1013e6 <serial_putc_sub>
}
  101485:	90                   	nop
  101486:	c9                   	leave  
  101487:	c3                   	ret    

00101488 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101488:	f3 0f 1e fb          	endbr32 
  10148c:	55                   	push   %ebp
  10148d:	89 e5                	mov    %esp,%ebp
  10148f:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101492:	eb 33                	jmp    1014c7 <cons_intr+0x3f>
        if (c != 0) {
  101494:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101498:	74 2d                	je     1014c7 <cons_intr+0x3f>
            cons.buf[cons.wpos ++] = c;
  10149a:	a1 24 01 11 00       	mov    0x110124,%eax
  10149f:	8d 50 01             	lea    0x1(%eax),%edx
  1014a2:	89 15 24 01 11 00    	mov    %edx,0x110124
  1014a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1014ab:	88 90 20 ff 10 00    	mov    %dl,0x10ff20(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1014b1:	a1 24 01 11 00       	mov    0x110124,%eax
  1014b6:	3d 00 02 00 00       	cmp    $0x200,%eax
  1014bb:	75 0a                	jne    1014c7 <cons_intr+0x3f>
                cons.wpos = 0;
  1014bd:	c7 05 24 01 11 00 00 	movl   $0x0,0x110124
  1014c4:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1014c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1014ca:	ff d0                	call   *%eax
  1014cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1014cf:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1014d3:	75 bf                	jne    101494 <cons_intr+0xc>
            }
        }
    }
}
  1014d5:	90                   	nop
  1014d6:	90                   	nop
  1014d7:	c9                   	leave  
  1014d8:	c3                   	ret    

001014d9 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1014d9:	f3 0f 1e fb          	endbr32 
  1014dd:	55                   	push   %ebp
  1014de:	89 e5                	mov    %esp,%ebp
  1014e0:	83 ec 10             	sub    $0x10,%esp
  1014e3:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014e9:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1014ed:	89 c2                	mov    %eax,%edx
  1014ef:	ec                   	in     (%dx),%al
  1014f0:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1014f3:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1014f7:	0f b6 c0             	movzbl %al,%eax
  1014fa:	83 e0 01             	and    $0x1,%eax
  1014fd:	85 c0                	test   %eax,%eax
  1014ff:	75 07                	jne    101508 <serial_proc_data+0x2f>
        return -1;
  101501:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101506:	eb 2a                	jmp    101532 <serial_proc_data+0x59>
  101508:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10150e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101512:	89 c2                	mov    %eax,%edx
  101514:	ec                   	in     (%dx),%al
  101515:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101518:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10151c:	0f b6 c0             	movzbl %al,%eax
  10151f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101522:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101526:	75 07                	jne    10152f <serial_proc_data+0x56>
        c = '\b';
  101528:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10152f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101532:	c9                   	leave  
  101533:	c3                   	ret    

00101534 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101534:	f3 0f 1e fb          	endbr32 
  101538:	55                   	push   %ebp
  101539:	89 e5                	mov    %esp,%ebp
  10153b:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10153e:	a1 08 ff 10 00       	mov    0x10ff08,%eax
  101543:	85 c0                	test   %eax,%eax
  101545:	74 0c                	je     101553 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101547:	c7 04 24 d9 14 10 00 	movl   $0x1014d9,(%esp)
  10154e:	e8 35 ff ff ff       	call   101488 <cons_intr>
    }
}
  101553:	90                   	nop
  101554:	c9                   	leave  
  101555:	c3                   	ret    

00101556 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101556:	f3 0f 1e fb          	endbr32 
  10155a:	55                   	push   %ebp
  10155b:	89 e5                	mov    %esp,%ebp
  10155d:	83 ec 38             	sub    $0x38,%esp
  101560:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101566:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101569:	89 c2                	mov    %eax,%edx
  10156b:	ec                   	in     (%dx),%al
  10156c:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  10156f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101573:	0f b6 c0             	movzbl %al,%eax
  101576:	83 e0 01             	and    $0x1,%eax
  101579:	85 c0                	test   %eax,%eax
  10157b:	75 0a                	jne    101587 <kbd_proc_data+0x31>
        return -1;
  10157d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101582:	e9 56 01 00 00       	jmp    1016dd <kbd_proc_data+0x187>
  101587:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10158d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101590:	89 c2                	mov    %eax,%edx
  101592:	ec                   	in     (%dx),%al
  101593:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101596:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  10159a:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10159d:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1015a1:	75 17                	jne    1015ba <kbd_proc_data+0x64>
        // E0 escape character
        shift |= E0ESC;
  1015a3:	a1 28 01 11 00       	mov    0x110128,%eax
  1015a8:	83 c8 40             	or     $0x40,%eax
  1015ab:	a3 28 01 11 00       	mov    %eax,0x110128
        return 0;
  1015b0:	b8 00 00 00 00       	mov    $0x0,%eax
  1015b5:	e9 23 01 00 00       	jmp    1016dd <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1015ba:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1015be:	84 c0                	test   %al,%al
  1015c0:	79 45                	jns    101607 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1015c2:	a1 28 01 11 00       	mov    0x110128,%eax
  1015c7:	83 e0 40             	and    $0x40,%eax
  1015ca:	85 c0                	test   %eax,%eax
  1015cc:	75 08                	jne    1015d6 <kbd_proc_data+0x80>
  1015ce:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1015d2:	24 7f                	and    $0x7f,%al
  1015d4:	eb 04                	jmp    1015da <kbd_proc_data+0x84>
  1015d6:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1015da:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1015dd:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1015e1:	0f b6 80 00 f0 10 00 	movzbl 0x10f000(%eax),%eax
  1015e8:	0c 40                	or     $0x40,%al
  1015ea:	0f b6 c0             	movzbl %al,%eax
  1015ed:	f7 d0                	not    %eax
  1015ef:	89 c2                	mov    %eax,%edx
  1015f1:	a1 28 01 11 00       	mov    0x110128,%eax
  1015f6:	21 d0                	and    %edx,%eax
  1015f8:	a3 28 01 11 00       	mov    %eax,0x110128
        return 0;
  1015fd:	b8 00 00 00 00       	mov    $0x0,%eax
  101602:	e9 d6 00 00 00       	jmp    1016dd <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101607:	a1 28 01 11 00       	mov    0x110128,%eax
  10160c:	83 e0 40             	and    $0x40,%eax
  10160f:	85 c0                	test   %eax,%eax
  101611:	74 11                	je     101624 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101613:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101617:	a1 28 01 11 00       	mov    0x110128,%eax
  10161c:	83 e0 bf             	and    $0xffffffbf,%eax
  10161f:	a3 28 01 11 00       	mov    %eax,0x110128
    }

    shift |= shiftcode[data];
  101624:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101628:	0f b6 80 00 f0 10 00 	movzbl 0x10f000(%eax),%eax
  10162f:	0f b6 d0             	movzbl %al,%edx
  101632:	a1 28 01 11 00       	mov    0x110128,%eax
  101637:	09 d0                	or     %edx,%eax
  101639:	a3 28 01 11 00       	mov    %eax,0x110128
    shift ^= togglecode[data];
  10163e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101642:	0f b6 80 00 f1 10 00 	movzbl 0x10f100(%eax),%eax
  101649:	0f b6 d0             	movzbl %al,%edx
  10164c:	a1 28 01 11 00       	mov    0x110128,%eax
  101651:	31 d0                	xor    %edx,%eax
  101653:	a3 28 01 11 00       	mov    %eax,0x110128

    c = charcode[shift & (CTL | SHIFT)][data];
  101658:	a1 28 01 11 00       	mov    0x110128,%eax
  10165d:	83 e0 03             	and    $0x3,%eax
  101660:	8b 14 85 00 f5 10 00 	mov    0x10f500(,%eax,4),%edx
  101667:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10166b:	01 d0                	add    %edx,%eax
  10166d:	0f b6 00             	movzbl (%eax),%eax
  101670:	0f b6 c0             	movzbl %al,%eax
  101673:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101676:	a1 28 01 11 00       	mov    0x110128,%eax
  10167b:	83 e0 08             	and    $0x8,%eax
  10167e:	85 c0                	test   %eax,%eax
  101680:	74 22                	je     1016a4 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  101682:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101686:	7e 0c                	jle    101694 <kbd_proc_data+0x13e>
  101688:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  10168c:	7f 06                	jg     101694 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  10168e:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101692:	eb 10                	jmp    1016a4 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  101694:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101698:	7e 0a                	jle    1016a4 <kbd_proc_data+0x14e>
  10169a:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10169e:	7f 04                	jg     1016a4 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1016a0:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1016a4:	a1 28 01 11 00       	mov    0x110128,%eax
  1016a9:	f7 d0                	not    %eax
  1016ab:	83 e0 06             	and    $0x6,%eax
  1016ae:	85 c0                	test   %eax,%eax
  1016b0:	75 28                	jne    1016da <kbd_proc_data+0x184>
  1016b2:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1016b9:	75 1f                	jne    1016da <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1016bb:	c7 04 24 dd 39 10 00 	movl   $0x1039dd,(%esp)
  1016c2:	e8 58 ec ff ff       	call   10031f <cprintf>
  1016c7:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1016cd:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016d1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1016d5:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1016d8:	ee                   	out    %al,(%dx)
}
  1016d9:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1016da:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1016dd:	c9                   	leave  
  1016de:	c3                   	ret    

001016df <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1016df:	f3 0f 1e fb          	endbr32 
  1016e3:	55                   	push   %ebp
  1016e4:	89 e5                	mov    %esp,%ebp
  1016e6:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  1016e9:	c7 04 24 56 15 10 00 	movl   $0x101556,(%esp)
  1016f0:	e8 93 fd ff ff       	call   101488 <cons_intr>
}
  1016f5:	90                   	nop
  1016f6:	c9                   	leave  
  1016f7:	c3                   	ret    

001016f8 <kbd_init>:

static void
kbd_init(void) {
  1016f8:	f3 0f 1e fb          	endbr32 
  1016fc:	55                   	push   %ebp
  1016fd:	89 e5                	mov    %esp,%ebp
  1016ff:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101702:	e8 d8 ff ff ff       	call   1016df <kbd_intr>
    pic_enable(IRQ_KBD);
  101707:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10170e:	e8 2d 01 00 00       	call   101840 <pic_enable>
}
  101713:	90                   	nop
  101714:	c9                   	leave  
  101715:	c3                   	ret    

00101716 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101716:	f3 0f 1e fb          	endbr32 
  10171a:	55                   	push   %ebp
  10171b:	89 e5                	mov    %esp,%ebp
  10171d:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101720:	e8 2e f8 ff ff       	call   100f53 <cga_init>
    serial_init();
  101725:	e8 13 f9 ff ff       	call   10103d <serial_init>
    kbd_init();
  10172a:	e8 c9 ff ff ff       	call   1016f8 <kbd_init>
    if (!serial_exists) {
  10172f:	a1 08 ff 10 00       	mov    0x10ff08,%eax
  101734:	85 c0                	test   %eax,%eax
  101736:	75 0c                	jne    101744 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101738:	c7 04 24 e9 39 10 00 	movl   $0x1039e9,(%esp)
  10173f:	e8 db eb ff ff       	call   10031f <cprintf>
    }
}
  101744:	90                   	nop
  101745:	c9                   	leave  
  101746:	c3                   	ret    

00101747 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101747:	f3 0f 1e fb          	endbr32 
  10174b:	55                   	push   %ebp
  10174c:	89 e5                	mov    %esp,%ebp
  10174e:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101751:	8b 45 08             	mov    0x8(%ebp),%eax
  101754:	89 04 24             	mov    %eax,(%esp)
  101757:	e8 50 fa ff ff       	call   1011ac <lpt_putc>
    cga_putc(c);
  10175c:	8b 45 08             	mov    0x8(%ebp),%eax
  10175f:	89 04 24             	mov    %eax,(%esp)
  101762:	e8 89 fa ff ff       	call   1011f0 <cga_putc>
    serial_putc(c);
  101767:	8b 45 08             	mov    0x8(%ebp),%eax
  10176a:	89 04 24             	mov    %eax,(%esp)
  10176d:	e8 d2 fc ff ff       	call   101444 <serial_putc>
}
  101772:	90                   	nop
  101773:	c9                   	leave  
  101774:	c3                   	ret    

00101775 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101775:	f3 0f 1e fb          	endbr32 
  101779:	55                   	push   %ebp
  10177a:	89 e5                	mov    %esp,%ebp
  10177c:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  10177f:	e8 b0 fd ff ff       	call   101534 <serial_intr>
    kbd_intr();
  101784:	e8 56 ff ff ff       	call   1016df <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  101789:	8b 15 20 01 11 00    	mov    0x110120,%edx
  10178f:	a1 24 01 11 00       	mov    0x110124,%eax
  101794:	39 c2                	cmp    %eax,%edx
  101796:	74 36                	je     1017ce <cons_getc+0x59>
        c = cons.buf[cons.rpos ++];
  101798:	a1 20 01 11 00       	mov    0x110120,%eax
  10179d:	8d 50 01             	lea    0x1(%eax),%edx
  1017a0:	89 15 20 01 11 00    	mov    %edx,0x110120
  1017a6:	0f b6 80 20 ff 10 00 	movzbl 0x10ff20(%eax),%eax
  1017ad:	0f b6 c0             	movzbl %al,%eax
  1017b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1017b3:	a1 20 01 11 00       	mov    0x110120,%eax
  1017b8:	3d 00 02 00 00       	cmp    $0x200,%eax
  1017bd:	75 0a                	jne    1017c9 <cons_getc+0x54>
            cons.rpos = 0;
  1017bf:	c7 05 20 01 11 00 00 	movl   $0x0,0x110120
  1017c6:	00 00 00 
        }
        return c;
  1017c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1017cc:	eb 05                	jmp    1017d3 <cons_getc+0x5e>
    }
    return 0;
  1017ce:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1017d3:	c9                   	leave  
  1017d4:	c3                   	ret    

001017d5 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1017d5:	f3 0f 1e fb          	endbr32 
  1017d9:	55                   	push   %ebp
  1017da:	89 e5                	mov    %esp,%ebp
  1017dc:	83 ec 14             	sub    $0x14,%esp
  1017df:	e8 bc ea ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  1017e4:	05 6c e1 00 00       	add    $0xe16c,%eax
  1017e9:	8b 55 08             	mov    0x8(%ebp),%edx
  1017ec:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
    irq_mask = mask;
  1017f0:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  1017f4:	66 89 90 c0 fb ff ff 	mov    %dx,-0x440(%eax)
    if (did_init) {
  1017fb:	8b 80 dc 07 00 00    	mov    0x7dc(%eax),%eax
  101801:	85 c0                	test   %eax,%eax
  101803:	74 38                	je     10183d <pic_setmask+0x68>
        outb(IO_PIC1 + 1, mask);
  101805:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101809:	0f b6 c0             	movzbl %al,%eax
  10180c:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101812:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101815:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101819:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10181d:	ee                   	out    %al,(%dx)
}
  10181e:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  10181f:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101823:	66 c1 e8 08          	shr    $0x8,%ax
  101827:	0f b6 c0             	movzbl %al,%eax
  10182a:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101830:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101833:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101837:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10183b:	ee                   	out    %al,(%dx)
}
  10183c:	90                   	nop
    }
}
  10183d:	90                   	nop
  10183e:	c9                   	leave  
  10183f:	c3                   	ret    

00101840 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101840:	f3 0f 1e fb          	endbr32 
  101844:	55                   	push   %ebp
  101845:	89 e5                	mov    %esp,%ebp
  101847:	53                   	push   %ebx
  101848:	e8 53 ea ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  10184d:	05 03 e1 00 00       	add    $0xe103,%eax
    pic_setmask(irq_mask & ~(1 << irq));
  101852:	8b 55 08             	mov    0x8(%ebp),%edx
  101855:	bb 01 00 00 00       	mov    $0x1,%ebx
  10185a:	89 d1                	mov    %edx,%ecx
  10185c:	d3 e3                	shl    %cl,%ebx
  10185e:	89 da                	mov    %ebx,%edx
  101860:	f7 d2                	not    %edx
  101862:	0f b7 80 c0 fb ff ff 	movzwl -0x440(%eax),%eax
  101869:	21 d0                	and    %edx,%eax
  10186b:	0f b7 c0             	movzwl %ax,%eax
  10186e:	50                   	push   %eax
  10186f:	e8 61 ff ff ff       	call   1017d5 <pic_setmask>
  101874:	83 c4 04             	add    $0x4,%esp
}
  101877:	90                   	nop
  101878:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10187b:	c9                   	leave  
  10187c:	c3                   	ret    

0010187d <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10187d:	f3 0f 1e fb          	endbr32 
  101881:	55                   	push   %ebp
  101882:	89 e5                	mov    %esp,%ebp
  101884:	83 ec 40             	sub    $0x40,%esp
  101887:	e8 4b 01 00 00       	call   1019d7 <__x86.get_pc_thunk.cx>
  10188c:	81 c1 c4 e0 00 00    	add    $0xe0c4,%ecx
    did_init = 1;
  101892:	c7 81 dc 07 00 00 01 	movl   $0x1,0x7dc(%ecx)
  101899:	00 00 00 
  10189c:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1018a2:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018a6:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1018aa:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1018ae:	ee                   	out    %al,(%dx)
}
  1018af:	90                   	nop
  1018b0:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1018b6:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018ba:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1018be:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1018c2:	ee                   	out    %al,(%dx)
}
  1018c3:	90                   	nop
  1018c4:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1018ca:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018ce:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1018d2:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1018d6:	ee                   	out    %al,(%dx)
}
  1018d7:	90                   	nop
  1018d8:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1018de:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018e2:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1018e6:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1018ea:	ee                   	out    %al,(%dx)
}
  1018eb:	90                   	nop
  1018ec:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  1018f2:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018f6:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1018fa:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  1018fe:	ee                   	out    %al,(%dx)
}
  1018ff:	90                   	nop
  101900:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101906:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10190a:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  10190e:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101912:	ee                   	out    %al,(%dx)
}
  101913:	90                   	nop
  101914:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  10191a:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10191e:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101922:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101926:	ee                   	out    %al,(%dx)
}
  101927:	90                   	nop
  101928:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  10192e:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101932:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101936:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10193a:	ee                   	out    %al,(%dx)
}
  10193b:	90                   	nop
  10193c:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101942:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101946:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10194a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10194e:	ee                   	out    %al,(%dx)
}
  10194f:	90                   	nop
  101950:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101956:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10195a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10195e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101962:	ee                   	out    %al,(%dx)
}
  101963:	90                   	nop
  101964:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  10196a:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10196e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101972:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101976:	ee                   	out    %al,(%dx)
}
  101977:	90                   	nop
  101978:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  10197e:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101982:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101986:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10198a:	ee                   	out    %al,(%dx)
}
  10198b:	90                   	nop
  10198c:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101992:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101996:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10199a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10199e:	ee                   	out    %al,(%dx)
}
  10199f:	90                   	nop
  1019a0:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1019a6:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1019aa:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1019ae:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1019b2:	ee                   	out    %al,(%dx)
}
  1019b3:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1019b4:	0f b7 81 c0 fb ff ff 	movzwl -0x440(%ecx),%eax
  1019bb:	66 83 f8 ff          	cmp    $0xffff,%ax
  1019bf:	74 13                	je     1019d4 <pic_init+0x157>
        pic_setmask(irq_mask);
  1019c1:	0f b7 81 c0 fb ff ff 	movzwl -0x440(%ecx),%eax
  1019c8:	0f b7 c0             	movzwl %ax,%eax
  1019cb:	50                   	push   %eax
  1019cc:	e8 04 fe ff ff       	call   1017d5 <pic_setmask>
  1019d1:	83 c4 04             	add    $0x4,%esp
    }
}
  1019d4:	90                   	nop
  1019d5:	c9                   	leave  
  1019d6:	c3                   	ret    

001019d7 <__x86.get_pc_thunk.cx>:
  1019d7:	8b 0c 24             	mov    (%esp),%ecx
  1019da:	c3                   	ret    

001019db <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1019db:	f3 0f 1e fb          	endbr32 
  1019df:	55                   	push   %ebp
  1019e0:	89 e5                	mov    %esp,%ebp
  1019e2:	e8 b9 e8 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  1019e7:	05 69 df 00 00       	add    $0xdf69,%eax
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1019ec:	fb                   	sti    
}
  1019ed:	90                   	nop
    sti();
}
  1019ee:	90                   	nop
  1019ef:	5d                   	pop    %ebp
  1019f0:	c3                   	ret    

001019f1 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1019f1:	f3 0f 1e fb          	endbr32 
  1019f5:	55                   	push   %ebp
  1019f6:	89 e5                	mov    %esp,%ebp
  1019f8:	e8 a3 e8 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  1019fd:	05 53 df 00 00       	add    $0xdf53,%eax

static inline void
cli(void) {
    asm volatile ("cli");
  101a02:	fa                   	cli    
}
  101a03:	90                   	nop
    cli();
}
  101a04:	90                   	nop
  101a05:	5d                   	pop    %ebp
  101a06:	c3                   	ret    

00101a07 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101a07:	f3 0f 1e fb          	endbr32 
  101a0b:	55                   	push   %ebp
  101a0c:	89 e5                	mov    %esp,%ebp
  101a0e:	53                   	push   %ebx
  101a0f:	83 ec 04             	sub    $0x4,%esp
  101a12:	e8 89 e8 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  101a17:	05 39 df 00 00       	add    $0xdf39,%eax
    cprintf("%d ticks\n",TICK_NUM);
  101a1c:	83 ec 08             	sub    $0x8,%esp
  101a1f:	6a 64                	push   $0x64
  101a21:	8d 90 b7 40 ff ff    	lea    -0xbf49(%eax),%edx
  101a27:	52                   	push   %edx
  101a28:	89 c3                	mov    %eax,%ebx
  101a2a:	e8 f0 e8 ff ff       	call   10031f <cprintf>
  101a2f:	83 c4 10             	add    $0x10,%esp
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101a32:	90                   	nop
  101a33:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101a36:	c9                   	leave  
  101a37:	c3                   	ret    

00101a38 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101a38:	f3 0f 1e fb          	endbr32 
  101a3c:	55                   	push   %ebp
  101a3d:	89 e5                	mov    %esp,%ebp
  101a3f:	e8 5c e8 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  101a44:	05 0c df 00 00       	add    $0xdf0c,%eax
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  101a49:	90                   	nop
  101a4a:	5d                   	pop    %ebp
  101a4b:	c3                   	ret    

00101a4c <trapname>:

static const char *
trapname(int trapno) {
  101a4c:	f3 0f 1e fb          	endbr32 
  101a50:	55                   	push   %ebp
  101a51:	89 e5                	mov    %esp,%ebp
  101a53:	e8 48 e8 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  101a58:	05 f8 de 00 00       	add    $0xdef8,%eax
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101a5d:	8b 55 08             	mov    0x8(%ebp),%edx
  101a60:	83 fa 13             	cmp    $0x13,%edx
  101a63:	77 0c                	ja     101a71 <trapname+0x25>
        return excnames[trapno];
  101a65:	8b 55 08             	mov    0x8(%ebp),%edx
  101a68:	8b 84 90 f0 00 00 00 	mov    0xf0(%eax,%edx,4),%eax
  101a6f:	eb 1a                	jmp    101a8b <trapname+0x3f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101a71:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101a75:	7e 0e                	jle    101a85 <trapname+0x39>
  101a77:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101a7b:	7f 08                	jg     101a85 <trapname+0x39>
        return "Hardware Interrupt";
  101a7d:	8d 80 c1 40 ff ff    	lea    -0xbf3f(%eax),%eax
  101a83:	eb 06                	jmp    101a8b <trapname+0x3f>
    }
    return "(unknown trap)";
  101a85:	8d 80 d4 40 ff ff    	lea    -0xbf2c(%eax),%eax
}
  101a8b:	5d                   	pop    %ebp
  101a8c:	c3                   	ret    

00101a8d <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101a8d:	f3 0f 1e fb          	endbr32 
  101a91:	55                   	push   %ebp
  101a92:	89 e5                	mov    %esp,%ebp
  101a94:	e8 07 e8 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  101a99:	05 b7 de 00 00       	add    $0xdeb7,%eax
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101a9e:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa1:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101aa5:	66 83 f8 08          	cmp    $0x8,%ax
  101aa9:	0f 94 c0             	sete   %al
  101aac:	0f b6 c0             	movzbl %al,%eax
}
  101aaf:	5d                   	pop    %ebp
  101ab0:	c3                   	ret    

00101ab1 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101ab1:	f3 0f 1e fb          	endbr32 
  101ab5:	55                   	push   %ebp
  101ab6:	89 e5                	mov    %esp,%ebp
  101ab8:	53                   	push   %ebx
  101ab9:	83 ec 14             	sub    $0x14,%esp
  101abc:	e8 e3 e7 ff ff       	call   1002a4 <__x86.get_pc_thunk.bx>
  101ac1:	81 c3 8f de 00 00    	add    $0xde8f,%ebx
    cprintf("trapframe at %p\n", tf);
  101ac7:	83 ec 08             	sub    $0x8,%esp
  101aca:	ff 75 08             	pushl  0x8(%ebp)
  101acd:	8d 83 15 41 ff ff    	lea    -0xbeeb(%ebx),%eax
  101ad3:	50                   	push   %eax
  101ad4:	e8 46 e8 ff ff       	call   10031f <cprintf>
  101ad9:	83 c4 10             	add    $0x10,%esp
    print_regs(&tf->tf_regs);
  101adc:	8b 45 08             	mov    0x8(%ebp),%eax
  101adf:	83 ec 0c             	sub    $0xc,%esp
  101ae2:	50                   	push   %eax
  101ae3:	e8 d1 01 00 00       	call   101cb9 <print_regs>
  101ae8:	83 c4 10             	add    $0x10,%esp
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101aeb:	8b 45 08             	mov    0x8(%ebp),%eax
  101aee:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101af2:	0f b7 c0             	movzwl %ax,%eax
  101af5:	83 ec 08             	sub    $0x8,%esp
  101af8:	50                   	push   %eax
  101af9:	8d 83 26 41 ff ff    	lea    -0xbeda(%ebx),%eax
  101aff:	50                   	push   %eax
  101b00:	e8 1a e8 ff ff       	call   10031f <cprintf>
  101b05:	83 c4 10             	add    $0x10,%esp
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101b08:	8b 45 08             	mov    0x8(%ebp),%eax
  101b0b:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101b0f:	0f b7 c0             	movzwl %ax,%eax
  101b12:	83 ec 08             	sub    $0x8,%esp
  101b15:	50                   	push   %eax
  101b16:	8d 83 39 41 ff ff    	lea    -0xbec7(%ebx),%eax
  101b1c:	50                   	push   %eax
  101b1d:	e8 fd e7 ff ff       	call   10031f <cprintf>
  101b22:	83 c4 10             	add    $0x10,%esp
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101b25:	8b 45 08             	mov    0x8(%ebp),%eax
  101b28:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101b2c:	0f b7 c0             	movzwl %ax,%eax
  101b2f:	83 ec 08             	sub    $0x8,%esp
  101b32:	50                   	push   %eax
  101b33:	8d 83 4c 41 ff ff    	lea    -0xbeb4(%ebx),%eax
  101b39:	50                   	push   %eax
  101b3a:	e8 e0 e7 ff ff       	call   10031f <cprintf>
  101b3f:	83 c4 10             	add    $0x10,%esp
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101b42:	8b 45 08             	mov    0x8(%ebp),%eax
  101b45:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101b49:	0f b7 c0             	movzwl %ax,%eax
  101b4c:	83 ec 08             	sub    $0x8,%esp
  101b4f:	50                   	push   %eax
  101b50:	8d 83 5f 41 ff ff    	lea    -0xbea1(%ebx),%eax
  101b56:	50                   	push   %eax
  101b57:	e8 c3 e7 ff ff       	call   10031f <cprintf>
  101b5c:	83 c4 10             	add    $0x10,%esp
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101b5f:	8b 45 08             	mov    0x8(%ebp),%eax
  101b62:	8b 40 30             	mov    0x30(%eax),%eax
  101b65:	83 ec 0c             	sub    $0xc,%esp
  101b68:	50                   	push   %eax
  101b69:	e8 de fe ff ff       	call   101a4c <trapname>
  101b6e:	83 c4 10             	add    $0x10,%esp
  101b71:	8b 55 08             	mov    0x8(%ebp),%edx
  101b74:	8b 52 30             	mov    0x30(%edx),%edx
  101b77:	83 ec 04             	sub    $0x4,%esp
  101b7a:	50                   	push   %eax
  101b7b:	52                   	push   %edx
  101b7c:	8d 83 72 41 ff ff    	lea    -0xbe8e(%ebx),%eax
  101b82:	50                   	push   %eax
  101b83:	e8 97 e7 ff ff       	call   10031f <cprintf>
  101b88:	83 c4 10             	add    $0x10,%esp
    cprintf("  err  0x%08x\n", tf->tf_err);
  101b8b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b8e:	8b 40 34             	mov    0x34(%eax),%eax
  101b91:	83 ec 08             	sub    $0x8,%esp
  101b94:	50                   	push   %eax
  101b95:	8d 83 84 41 ff ff    	lea    -0xbe7c(%ebx),%eax
  101b9b:	50                   	push   %eax
  101b9c:	e8 7e e7 ff ff       	call   10031f <cprintf>
  101ba1:	83 c4 10             	add    $0x10,%esp
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101ba4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba7:	8b 40 38             	mov    0x38(%eax),%eax
  101baa:	83 ec 08             	sub    $0x8,%esp
  101bad:	50                   	push   %eax
  101bae:	8d 83 93 41 ff ff    	lea    -0xbe6d(%ebx),%eax
  101bb4:	50                   	push   %eax
  101bb5:	e8 65 e7 ff ff       	call   10031f <cprintf>
  101bba:	83 c4 10             	add    $0x10,%esp
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101bbd:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc0:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bc4:	0f b7 c0             	movzwl %ax,%eax
  101bc7:	83 ec 08             	sub    $0x8,%esp
  101bca:	50                   	push   %eax
  101bcb:	8d 83 a2 41 ff ff    	lea    -0xbe5e(%ebx),%eax
  101bd1:	50                   	push   %eax
  101bd2:	e8 48 e7 ff ff       	call   10031f <cprintf>
  101bd7:	83 c4 10             	add    $0x10,%esp
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101bda:	8b 45 08             	mov    0x8(%ebp),%eax
  101bdd:	8b 40 40             	mov    0x40(%eax),%eax
  101be0:	83 ec 08             	sub    $0x8,%esp
  101be3:	50                   	push   %eax
  101be4:	8d 83 b5 41 ff ff    	lea    -0xbe4b(%ebx),%eax
  101bea:	50                   	push   %eax
  101beb:	e8 2f e7 ff ff       	call   10031f <cprintf>
  101bf0:	83 c4 10             	add    $0x10,%esp

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101bf3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101bfa:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101c01:	eb 41                	jmp    101c44 <print_trapframe+0x193>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101c03:	8b 45 08             	mov    0x8(%ebp),%eax
  101c06:	8b 50 40             	mov    0x40(%eax),%edx
  101c09:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c0c:	21 d0                	and    %edx,%eax
  101c0e:	85 c0                	test   %eax,%eax
  101c10:	74 2b                	je     101c3d <print_trapframe+0x18c>
  101c12:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c15:	8b 84 83 70 00 00 00 	mov    0x70(%ebx,%eax,4),%eax
  101c1c:	85 c0                	test   %eax,%eax
  101c1e:	74 1d                	je     101c3d <print_trapframe+0x18c>
            cprintf("%s,", IA32flags[i]);
  101c20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c23:	8b 84 83 70 00 00 00 	mov    0x70(%ebx,%eax,4),%eax
  101c2a:	83 ec 08             	sub    $0x8,%esp
  101c2d:	50                   	push   %eax
  101c2e:	8d 83 c4 41 ff ff    	lea    -0xbe3c(%ebx),%eax
  101c34:	50                   	push   %eax
  101c35:	e8 e5 e6 ff ff       	call   10031f <cprintf>
  101c3a:	83 c4 10             	add    $0x10,%esp
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c3d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101c41:	d1 65 f0             	shll   -0x10(%ebp)
  101c44:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c47:	83 f8 17             	cmp    $0x17,%eax
  101c4a:	76 b7                	jbe    101c03 <print_trapframe+0x152>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101c4c:	8b 45 08             	mov    0x8(%ebp),%eax
  101c4f:	8b 40 40             	mov    0x40(%eax),%eax
  101c52:	c1 e8 0c             	shr    $0xc,%eax
  101c55:	83 e0 03             	and    $0x3,%eax
  101c58:	83 ec 08             	sub    $0x8,%esp
  101c5b:	50                   	push   %eax
  101c5c:	8d 83 c8 41 ff ff    	lea    -0xbe38(%ebx),%eax
  101c62:	50                   	push   %eax
  101c63:	e8 b7 e6 ff ff       	call   10031f <cprintf>
  101c68:	83 c4 10             	add    $0x10,%esp

    if (!trap_in_kernel(tf)) {
  101c6b:	83 ec 0c             	sub    $0xc,%esp
  101c6e:	ff 75 08             	pushl  0x8(%ebp)
  101c71:	e8 17 fe ff ff       	call   101a8d <trap_in_kernel>
  101c76:	83 c4 10             	add    $0x10,%esp
  101c79:	85 c0                	test   %eax,%eax
  101c7b:	75 36                	jne    101cb3 <print_trapframe+0x202>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101c7d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c80:	8b 40 44             	mov    0x44(%eax),%eax
  101c83:	83 ec 08             	sub    $0x8,%esp
  101c86:	50                   	push   %eax
  101c87:	8d 83 d1 41 ff ff    	lea    -0xbe2f(%ebx),%eax
  101c8d:	50                   	push   %eax
  101c8e:	e8 8c e6 ff ff       	call   10031f <cprintf>
  101c93:	83 c4 10             	add    $0x10,%esp
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101c96:	8b 45 08             	mov    0x8(%ebp),%eax
  101c99:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c9d:	0f b7 c0             	movzwl %ax,%eax
  101ca0:	83 ec 08             	sub    $0x8,%esp
  101ca3:	50                   	push   %eax
  101ca4:	8d 83 e0 41 ff ff    	lea    -0xbe20(%ebx),%eax
  101caa:	50                   	push   %eax
  101cab:	e8 6f e6 ff ff       	call   10031f <cprintf>
  101cb0:	83 c4 10             	add    $0x10,%esp
    }
}
  101cb3:	90                   	nop
  101cb4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101cb7:	c9                   	leave  
  101cb8:	c3                   	ret    

00101cb9 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101cb9:	f3 0f 1e fb          	endbr32 
  101cbd:	55                   	push   %ebp
  101cbe:	89 e5                	mov    %esp,%ebp
  101cc0:	53                   	push   %ebx
  101cc1:	83 ec 04             	sub    $0x4,%esp
  101cc4:	e8 db e5 ff ff       	call   1002a4 <__x86.get_pc_thunk.bx>
  101cc9:	81 c3 87 dc 00 00    	add    $0xdc87,%ebx
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101ccf:	8b 45 08             	mov    0x8(%ebp),%eax
  101cd2:	8b 00                	mov    (%eax),%eax
  101cd4:	83 ec 08             	sub    $0x8,%esp
  101cd7:	50                   	push   %eax
  101cd8:	8d 83 f3 41 ff ff    	lea    -0xbe0d(%ebx),%eax
  101cde:	50                   	push   %eax
  101cdf:	e8 3b e6 ff ff       	call   10031f <cprintf>
  101ce4:	83 c4 10             	add    $0x10,%esp
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101ce7:	8b 45 08             	mov    0x8(%ebp),%eax
  101cea:	8b 40 04             	mov    0x4(%eax),%eax
  101ced:	83 ec 08             	sub    $0x8,%esp
  101cf0:	50                   	push   %eax
  101cf1:	8d 83 02 42 ff ff    	lea    -0xbdfe(%ebx),%eax
  101cf7:	50                   	push   %eax
  101cf8:	e8 22 e6 ff ff       	call   10031f <cprintf>
  101cfd:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101d00:	8b 45 08             	mov    0x8(%ebp),%eax
  101d03:	8b 40 08             	mov    0x8(%eax),%eax
  101d06:	83 ec 08             	sub    $0x8,%esp
  101d09:	50                   	push   %eax
  101d0a:	8d 83 11 42 ff ff    	lea    -0xbdef(%ebx),%eax
  101d10:	50                   	push   %eax
  101d11:	e8 09 e6 ff ff       	call   10031f <cprintf>
  101d16:	83 c4 10             	add    $0x10,%esp
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101d19:	8b 45 08             	mov    0x8(%ebp),%eax
  101d1c:	8b 40 0c             	mov    0xc(%eax),%eax
  101d1f:	83 ec 08             	sub    $0x8,%esp
  101d22:	50                   	push   %eax
  101d23:	8d 83 20 42 ff ff    	lea    -0xbde0(%ebx),%eax
  101d29:	50                   	push   %eax
  101d2a:	e8 f0 e5 ff ff       	call   10031f <cprintf>
  101d2f:	83 c4 10             	add    $0x10,%esp
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101d32:	8b 45 08             	mov    0x8(%ebp),%eax
  101d35:	8b 40 10             	mov    0x10(%eax),%eax
  101d38:	83 ec 08             	sub    $0x8,%esp
  101d3b:	50                   	push   %eax
  101d3c:	8d 83 2f 42 ff ff    	lea    -0xbdd1(%ebx),%eax
  101d42:	50                   	push   %eax
  101d43:	e8 d7 e5 ff ff       	call   10031f <cprintf>
  101d48:	83 c4 10             	add    $0x10,%esp
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101d4b:	8b 45 08             	mov    0x8(%ebp),%eax
  101d4e:	8b 40 14             	mov    0x14(%eax),%eax
  101d51:	83 ec 08             	sub    $0x8,%esp
  101d54:	50                   	push   %eax
  101d55:	8d 83 3e 42 ff ff    	lea    -0xbdc2(%ebx),%eax
  101d5b:	50                   	push   %eax
  101d5c:	e8 be e5 ff ff       	call   10031f <cprintf>
  101d61:	83 c4 10             	add    $0x10,%esp
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101d64:	8b 45 08             	mov    0x8(%ebp),%eax
  101d67:	8b 40 18             	mov    0x18(%eax),%eax
  101d6a:	83 ec 08             	sub    $0x8,%esp
  101d6d:	50                   	push   %eax
  101d6e:	8d 83 4d 42 ff ff    	lea    -0xbdb3(%ebx),%eax
  101d74:	50                   	push   %eax
  101d75:	e8 a5 e5 ff ff       	call   10031f <cprintf>
  101d7a:	83 c4 10             	add    $0x10,%esp
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101d7d:	8b 45 08             	mov    0x8(%ebp),%eax
  101d80:	8b 40 1c             	mov    0x1c(%eax),%eax
  101d83:	83 ec 08             	sub    $0x8,%esp
  101d86:	50                   	push   %eax
  101d87:	8d 83 5c 42 ff ff    	lea    -0xbda4(%ebx),%eax
  101d8d:	50                   	push   %eax
  101d8e:	e8 8c e5 ff ff       	call   10031f <cprintf>
  101d93:	83 c4 10             	add    $0x10,%esp
}
  101d96:	90                   	nop
  101d97:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101d9a:	c9                   	leave  
  101d9b:	c3                   	ret    

00101d9c <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101d9c:	f3 0f 1e fb          	endbr32 
  101da0:	55                   	push   %ebp
  101da1:	89 e5                	mov    %esp,%ebp
  101da3:	53                   	push   %ebx
  101da4:	83 ec 14             	sub    $0x14,%esp
  101da7:	e8 f8 e4 ff ff       	call   1002a4 <__x86.get_pc_thunk.bx>
  101dac:	81 c3 a4 db 00 00    	add    $0xdba4,%ebx
    char c;

    switch (tf->tf_trapno) {
  101db2:	8b 45 08             	mov    0x8(%ebp),%eax
  101db5:	8b 40 30             	mov    0x30(%eax),%eax
  101db8:	83 f8 79             	cmp    $0x79,%eax
  101dbb:	0f 87 98 00 00 00    	ja     101e59 <trap_dispatch+0xbd>
  101dc1:	83 f8 78             	cmp    $0x78,%eax
  101dc4:	73 78                	jae    101e3e <trap_dispatch+0xa2>
  101dc6:	83 f8 2f             	cmp    $0x2f,%eax
  101dc9:	0f 87 8a 00 00 00    	ja     101e59 <trap_dispatch+0xbd>
  101dcf:	83 f8 2e             	cmp    $0x2e,%eax
  101dd2:	0f 83 bb 00 00 00    	jae    101e93 <trap_dispatch+0xf7>
  101dd8:	83 f8 24             	cmp    $0x24,%eax
  101ddb:	74 15                	je     101df2 <trap_dispatch+0x56>
  101ddd:	83 f8 24             	cmp    $0x24,%eax
  101de0:	77 77                	ja     101e59 <trap_dispatch+0xbd>
  101de2:	83 f8 20             	cmp    $0x20,%eax
  101de5:	0f 84 ab 00 00 00    	je     101e96 <trap_dispatch+0xfa>
  101deb:	83 f8 21             	cmp    $0x21,%eax
  101dee:	74 28                	je     101e18 <trap_dispatch+0x7c>
  101df0:	eb 67                	jmp    101e59 <trap_dispatch+0xbd>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101df2:	e8 7e f9 ff ff       	call   101775 <cons_getc>
  101df7:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101dfa:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101dfe:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e02:	83 ec 04             	sub    $0x4,%esp
  101e05:	52                   	push   %edx
  101e06:	50                   	push   %eax
  101e07:	8d 83 6b 42 ff ff    	lea    -0xbd95(%ebx),%eax
  101e0d:	50                   	push   %eax
  101e0e:	e8 0c e5 ff ff       	call   10031f <cprintf>
  101e13:	83 c4 10             	add    $0x10,%esp
        break;
  101e16:	eb 7f                	jmp    101e97 <trap_dispatch+0xfb>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101e18:	e8 58 f9 ff ff       	call   101775 <cons_getc>
  101e1d:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101e20:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101e24:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e28:	83 ec 04             	sub    $0x4,%esp
  101e2b:	52                   	push   %edx
  101e2c:	50                   	push   %eax
  101e2d:	8d 83 7d 42 ff ff    	lea    -0xbd83(%ebx),%eax
  101e33:	50                   	push   %eax
  101e34:	e8 e6 e4 ff ff       	call   10031f <cprintf>
  101e39:	83 c4 10             	add    $0x10,%esp
        break;
  101e3c:	eb 59                	jmp    101e97 <trap_dispatch+0xfb>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101e3e:	83 ec 04             	sub    $0x4,%esp
  101e41:	8d 83 8c 42 ff ff    	lea    -0xbd74(%ebx),%eax
  101e47:	50                   	push   %eax
  101e48:	68 a2 00 00 00       	push   $0xa2
  101e4d:	8d 83 9c 42 ff ff    	lea    -0xbd64(%ebx),%eax
  101e53:	50                   	push   %eax
  101e54:	e8 8b e6 ff ff       	call   1004e4 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e59:	8b 45 08             	mov    0x8(%ebp),%eax
  101e5c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e60:	0f b7 c0             	movzwl %ax,%eax
  101e63:	83 e0 03             	and    $0x3,%eax
  101e66:	85 c0                	test   %eax,%eax
  101e68:	75 2d                	jne    101e97 <trap_dispatch+0xfb>
            print_trapframe(tf);
  101e6a:	83 ec 0c             	sub    $0xc,%esp
  101e6d:	ff 75 08             	pushl  0x8(%ebp)
  101e70:	e8 3c fc ff ff       	call   101ab1 <print_trapframe>
  101e75:	83 c4 10             	add    $0x10,%esp
            panic("unexpected trap in kernel.\n");
  101e78:	83 ec 04             	sub    $0x4,%esp
  101e7b:	8d 83 ad 42 ff ff    	lea    -0xbd53(%ebx),%eax
  101e81:	50                   	push   %eax
  101e82:	68 ac 00 00 00       	push   $0xac
  101e87:	8d 83 9c 42 ff ff    	lea    -0xbd64(%ebx),%eax
  101e8d:	50                   	push   %eax
  101e8e:	e8 51 e6 ff ff       	call   1004e4 <__panic>
        break;
  101e93:	90                   	nop
  101e94:	eb 01                	jmp    101e97 <trap_dispatch+0xfb>
        break;
  101e96:	90                   	nop
        }
    }
}
  101e97:	90                   	nop
  101e98:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  101e9b:	c9                   	leave  
  101e9c:	c3                   	ret    

00101e9d <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101e9d:	f3 0f 1e fb          	endbr32 
  101ea1:	55                   	push   %ebp
  101ea2:	89 e5                	mov    %esp,%ebp
  101ea4:	83 ec 08             	sub    $0x8,%esp
  101ea7:	e8 f4 e3 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  101eac:	05 a4 da 00 00       	add    $0xdaa4,%eax
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101eb1:	83 ec 0c             	sub    $0xc,%esp
  101eb4:	ff 75 08             	pushl  0x8(%ebp)
  101eb7:	e8 e0 fe ff ff       	call   101d9c <trap_dispatch>
  101ebc:	83 c4 10             	add    $0x10,%esp
}
  101ebf:	90                   	nop
  101ec0:	c9                   	leave  
  101ec1:	c3                   	ret    

00101ec2 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101ec2:	6a 00                	push   $0x0
  pushl $0
  101ec4:	6a 00                	push   $0x0
  jmp __alltraps
  101ec6:	e9 69 0a 00 00       	jmp    102934 <__alltraps>

00101ecb <vector1>:
.globl vector1
vector1:
  pushl $0
  101ecb:	6a 00                	push   $0x0
  pushl $1
  101ecd:	6a 01                	push   $0x1
  jmp __alltraps
  101ecf:	e9 60 0a 00 00       	jmp    102934 <__alltraps>

00101ed4 <vector2>:
.globl vector2
vector2:
  pushl $0
  101ed4:	6a 00                	push   $0x0
  pushl $2
  101ed6:	6a 02                	push   $0x2
  jmp __alltraps
  101ed8:	e9 57 0a 00 00       	jmp    102934 <__alltraps>

00101edd <vector3>:
.globl vector3
vector3:
  pushl $0
  101edd:	6a 00                	push   $0x0
  pushl $3
  101edf:	6a 03                	push   $0x3
  jmp __alltraps
  101ee1:	e9 4e 0a 00 00       	jmp    102934 <__alltraps>

00101ee6 <vector4>:
.globl vector4
vector4:
  pushl $0
  101ee6:	6a 00                	push   $0x0
  pushl $4
  101ee8:	6a 04                	push   $0x4
  jmp __alltraps
  101eea:	e9 45 0a 00 00       	jmp    102934 <__alltraps>

00101eef <vector5>:
.globl vector5
vector5:
  pushl $0
  101eef:	6a 00                	push   $0x0
  pushl $5
  101ef1:	6a 05                	push   $0x5
  jmp __alltraps
  101ef3:	e9 3c 0a 00 00       	jmp    102934 <__alltraps>

00101ef8 <vector6>:
.globl vector6
vector6:
  pushl $0
  101ef8:	6a 00                	push   $0x0
  pushl $6
  101efa:	6a 06                	push   $0x6
  jmp __alltraps
  101efc:	e9 33 0a 00 00       	jmp    102934 <__alltraps>

00101f01 <vector7>:
.globl vector7
vector7:
  pushl $0
  101f01:	6a 00                	push   $0x0
  pushl $7
  101f03:	6a 07                	push   $0x7
  jmp __alltraps
  101f05:	e9 2a 0a 00 00       	jmp    102934 <__alltraps>

00101f0a <vector8>:
.globl vector8
vector8:
  pushl $8
  101f0a:	6a 08                	push   $0x8
  jmp __alltraps
  101f0c:	e9 23 0a 00 00       	jmp    102934 <__alltraps>

00101f11 <vector9>:
.globl vector9
vector9:
  pushl $0
  101f11:	6a 00                	push   $0x0
  pushl $9
  101f13:	6a 09                	push   $0x9
  jmp __alltraps
  101f15:	e9 1a 0a 00 00       	jmp    102934 <__alltraps>

00101f1a <vector10>:
.globl vector10
vector10:
  pushl $10
  101f1a:	6a 0a                	push   $0xa
  jmp __alltraps
  101f1c:	e9 13 0a 00 00       	jmp    102934 <__alltraps>

00101f21 <vector11>:
.globl vector11
vector11:
  pushl $11
  101f21:	6a 0b                	push   $0xb
  jmp __alltraps
  101f23:	e9 0c 0a 00 00       	jmp    102934 <__alltraps>

00101f28 <vector12>:
.globl vector12
vector12:
  pushl $12
  101f28:	6a 0c                	push   $0xc
  jmp __alltraps
  101f2a:	e9 05 0a 00 00       	jmp    102934 <__alltraps>

00101f2f <vector13>:
.globl vector13
vector13:
  pushl $13
  101f2f:	6a 0d                	push   $0xd
  jmp __alltraps
  101f31:	e9 fe 09 00 00       	jmp    102934 <__alltraps>

00101f36 <vector14>:
.globl vector14
vector14:
  pushl $14
  101f36:	6a 0e                	push   $0xe
  jmp __alltraps
  101f38:	e9 f7 09 00 00       	jmp    102934 <__alltraps>

00101f3d <vector15>:
.globl vector15
vector15:
  pushl $0
  101f3d:	6a 00                	push   $0x0
  pushl $15
  101f3f:	6a 0f                	push   $0xf
  jmp __alltraps
  101f41:	e9 ee 09 00 00       	jmp    102934 <__alltraps>

00101f46 <vector16>:
.globl vector16
vector16:
  pushl $0
  101f46:	6a 00                	push   $0x0
  pushl $16
  101f48:	6a 10                	push   $0x10
  jmp __alltraps
  101f4a:	e9 e5 09 00 00       	jmp    102934 <__alltraps>

00101f4f <vector17>:
.globl vector17
vector17:
  pushl $17
  101f4f:	6a 11                	push   $0x11
  jmp __alltraps
  101f51:	e9 de 09 00 00       	jmp    102934 <__alltraps>

00101f56 <vector18>:
.globl vector18
vector18:
  pushl $0
  101f56:	6a 00                	push   $0x0
  pushl $18
  101f58:	6a 12                	push   $0x12
  jmp __alltraps
  101f5a:	e9 d5 09 00 00       	jmp    102934 <__alltraps>

00101f5f <vector19>:
.globl vector19
vector19:
  pushl $0
  101f5f:	6a 00                	push   $0x0
  pushl $19
  101f61:	6a 13                	push   $0x13
  jmp __alltraps
  101f63:	e9 cc 09 00 00       	jmp    102934 <__alltraps>

00101f68 <vector20>:
.globl vector20
vector20:
  pushl $0
  101f68:	6a 00                	push   $0x0
  pushl $20
  101f6a:	6a 14                	push   $0x14
  jmp __alltraps
  101f6c:	e9 c3 09 00 00       	jmp    102934 <__alltraps>

00101f71 <vector21>:
.globl vector21
vector21:
  pushl $0
  101f71:	6a 00                	push   $0x0
  pushl $21
  101f73:	6a 15                	push   $0x15
  jmp __alltraps
  101f75:	e9 ba 09 00 00       	jmp    102934 <__alltraps>

00101f7a <vector22>:
.globl vector22
vector22:
  pushl $0
  101f7a:	6a 00                	push   $0x0
  pushl $22
  101f7c:	6a 16                	push   $0x16
  jmp __alltraps
  101f7e:	e9 b1 09 00 00       	jmp    102934 <__alltraps>

00101f83 <vector23>:
.globl vector23
vector23:
  pushl $0
  101f83:	6a 00                	push   $0x0
  pushl $23
  101f85:	6a 17                	push   $0x17
  jmp __alltraps
  101f87:	e9 a8 09 00 00       	jmp    102934 <__alltraps>

00101f8c <vector24>:
.globl vector24
vector24:
  pushl $0
  101f8c:	6a 00                	push   $0x0
  pushl $24
  101f8e:	6a 18                	push   $0x18
  jmp __alltraps
  101f90:	e9 9f 09 00 00       	jmp    102934 <__alltraps>

00101f95 <vector25>:
.globl vector25
vector25:
  pushl $0
  101f95:	6a 00                	push   $0x0
  pushl $25
  101f97:	6a 19                	push   $0x19
  jmp __alltraps
  101f99:	e9 96 09 00 00       	jmp    102934 <__alltraps>

00101f9e <vector26>:
.globl vector26
vector26:
  pushl $0
  101f9e:	6a 00                	push   $0x0
  pushl $26
  101fa0:	6a 1a                	push   $0x1a
  jmp __alltraps
  101fa2:	e9 8d 09 00 00       	jmp    102934 <__alltraps>

00101fa7 <vector27>:
.globl vector27
vector27:
  pushl $0
  101fa7:	6a 00                	push   $0x0
  pushl $27
  101fa9:	6a 1b                	push   $0x1b
  jmp __alltraps
  101fab:	e9 84 09 00 00       	jmp    102934 <__alltraps>

00101fb0 <vector28>:
.globl vector28
vector28:
  pushl $0
  101fb0:	6a 00                	push   $0x0
  pushl $28
  101fb2:	6a 1c                	push   $0x1c
  jmp __alltraps
  101fb4:	e9 7b 09 00 00       	jmp    102934 <__alltraps>

00101fb9 <vector29>:
.globl vector29
vector29:
  pushl $0
  101fb9:	6a 00                	push   $0x0
  pushl $29
  101fbb:	6a 1d                	push   $0x1d
  jmp __alltraps
  101fbd:	e9 72 09 00 00       	jmp    102934 <__alltraps>

00101fc2 <vector30>:
.globl vector30
vector30:
  pushl $0
  101fc2:	6a 00                	push   $0x0
  pushl $30
  101fc4:	6a 1e                	push   $0x1e
  jmp __alltraps
  101fc6:	e9 69 09 00 00       	jmp    102934 <__alltraps>

00101fcb <vector31>:
.globl vector31
vector31:
  pushl $0
  101fcb:	6a 00                	push   $0x0
  pushl $31
  101fcd:	6a 1f                	push   $0x1f
  jmp __alltraps
  101fcf:	e9 60 09 00 00       	jmp    102934 <__alltraps>

00101fd4 <vector32>:
.globl vector32
vector32:
  pushl $0
  101fd4:	6a 00                	push   $0x0
  pushl $32
  101fd6:	6a 20                	push   $0x20
  jmp __alltraps
  101fd8:	e9 57 09 00 00       	jmp    102934 <__alltraps>

00101fdd <vector33>:
.globl vector33
vector33:
  pushl $0
  101fdd:	6a 00                	push   $0x0
  pushl $33
  101fdf:	6a 21                	push   $0x21
  jmp __alltraps
  101fe1:	e9 4e 09 00 00       	jmp    102934 <__alltraps>

00101fe6 <vector34>:
.globl vector34
vector34:
  pushl $0
  101fe6:	6a 00                	push   $0x0
  pushl $34
  101fe8:	6a 22                	push   $0x22
  jmp __alltraps
  101fea:	e9 45 09 00 00       	jmp    102934 <__alltraps>

00101fef <vector35>:
.globl vector35
vector35:
  pushl $0
  101fef:	6a 00                	push   $0x0
  pushl $35
  101ff1:	6a 23                	push   $0x23
  jmp __alltraps
  101ff3:	e9 3c 09 00 00       	jmp    102934 <__alltraps>

00101ff8 <vector36>:
.globl vector36
vector36:
  pushl $0
  101ff8:	6a 00                	push   $0x0
  pushl $36
  101ffa:	6a 24                	push   $0x24
  jmp __alltraps
  101ffc:	e9 33 09 00 00       	jmp    102934 <__alltraps>

00102001 <vector37>:
.globl vector37
vector37:
  pushl $0
  102001:	6a 00                	push   $0x0
  pushl $37
  102003:	6a 25                	push   $0x25
  jmp __alltraps
  102005:	e9 2a 09 00 00       	jmp    102934 <__alltraps>

0010200a <vector38>:
.globl vector38
vector38:
  pushl $0
  10200a:	6a 00                	push   $0x0
  pushl $38
  10200c:	6a 26                	push   $0x26
  jmp __alltraps
  10200e:	e9 21 09 00 00       	jmp    102934 <__alltraps>

00102013 <vector39>:
.globl vector39
vector39:
  pushl $0
  102013:	6a 00                	push   $0x0
  pushl $39
  102015:	6a 27                	push   $0x27
  jmp __alltraps
  102017:	e9 18 09 00 00       	jmp    102934 <__alltraps>

0010201c <vector40>:
.globl vector40
vector40:
  pushl $0
  10201c:	6a 00                	push   $0x0
  pushl $40
  10201e:	6a 28                	push   $0x28
  jmp __alltraps
  102020:	e9 0f 09 00 00       	jmp    102934 <__alltraps>

00102025 <vector41>:
.globl vector41
vector41:
  pushl $0
  102025:	6a 00                	push   $0x0
  pushl $41
  102027:	6a 29                	push   $0x29
  jmp __alltraps
  102029:	e9 06 09 00 00       	jmp    102934 <__alltraps>

0010202e <vector42>:
.globl vector42
vector42:
  pushl $0
  10202e:	6a 00                	push   $0x0
  pushl $42
  102030:	6a 2a                	push   $0x2a
  jmp __alltraps
  102032:	e9 fd 08 00 00       	jmp    102934 <__alltraps>

00102037 <vector43>:
.globl vector43
vector43:
  pushl $0
  102037:	6a 00                	push   $0x0
  pushl $43
  102039:	6a 2b                	push   $0x2b
  jmp __alltraps
  10203b:	e9 f4 08 00 00       	jmp    102934 <__alltraps>

00102040 <vector44>:
.globl vector44
vector44:
  pushl $0
  102040:	6a 00                	push   $0x0
  pushl $44
  102042:	6a 2c                	push   $0x2c
  jmp __alltraps
  102044:	e9 eb 08 00 00       	jmp    102934 <__alltraps>

00102049 <vector45>:
.globl vector45
vector45:
  pushl $0
  102049:	6a 00                	push   $0x0
  pushl $45
  10204b:	6a 2d                	push   $0x2d
  jmp __alltraps
  10204d:	e9 e2 08 00 00       	jmp    102934 <__alltraps>

00102052 <vector46>:
.globl vector46
vector46:
  pushl $0
  102052:	6a 00                	push   $0x0
  pushl $46
  102054:	6a 2e                	push   $0x2e
  jmp __alltraps
  102056:	e9 d9 08 00 00       	jmp    102934 <__alltraps>

0010205b <vector47>:
.globl vector47
vector47:
  pushl $0
  10205b:	6a 00                	push   $0x0
  pushl $47
  10205d:	6a 2f                	push   $0x2f
  jmp __alltraps
  10205f:	e9 d0 08 00 00       	jmp    102934 <__alltraps>

00102064 <vector48>:
.globl vector48
vector48:
  pushl $0
  102064:	6a 00                	push   $0x0
  pushl $48
  102066:	6a 30                	push   $0x30
  jmp __alltraps
  102068:	e9 c7 08 00 00       	jmp    102934 <__alltraps>

0010206d <vector49>:
.globl vector49
vector49:
  pushl $0
  10206d:	6a 00                	push   $0x0
  pushl $49
  10206f:	6a 31                	push   $0x31
  jmp __alltraps
  102071:	e9 be 08 00 00       	jmp    102934 <__alltraps>

00102076 <vector50>:
.globl vector50
vector50:
  pushl $0
  102076:	6a 00                	push   $0x0
  pushl $50
  102078:	6a 32                	push   $0x32
  jmp __alltraps
  10207a:	e9 b5 08 00 00       	jmp    102934 <__alltraps>

0010207f <vector51>:
.globl vector51
vector51:
  pushl $0
  10207f:	6a 00                	push   $0x0
  pushl $51
  102081:	6a 33                	push   $0x33
  jmp __alltraps
  102083:	e9 ac 08 00 00       	jmp    102934 <__alltraps>

00102088 <vector52>:
.globl vector52
vector52:
  pushl $0
  102088:	6a 00                	push   $0x0
  pushl $52
  10208a:	6a 34                	push   $0x34
  jmp __alltraps
  10208c:	e9 a3 08 00 00       	jmp    102934 <__alltraps>

00102091 <vector53>:
.globl vector53
vector53:
  pushl $0
  102091:	6a 00                	push   $0x0
  pushl $53
  102093:	6a 35                	push   $0x35
  jmp __alltraps
  102095:	e9 9a 08 00 00       	jmp    102934 <__alltraps>

0010209a <vector54>:
.globl vector54
vector54:
  pushl $0
  10209a:	6a 00                	push   $0x0
  pushl $54
  10209c:	6a 36                	push   $0x36
  jmp __alltraps
  10209e:	e9 91 08 00 00       	jmp    102934 <__alltraps>

001020a3 <vector55>:
.globl vector55
vector55:
  pushl $0
  1020a3:	6a 00                	push   $0x0
  pushl $55
  1020a5:	6a 37                	push   $0x37
  jmp __alltraps
  1020a7:	e9 88 08 00 00       	jmp    102934 <__alltraps>

001020ac <vector56>:
.globl vector56
vector56:
  pushl $0
  1020ac:	6a 00                	push   $0x0
  pushl $56
  1020ae:	6a 38                	push   $0x38
  jmp __alltraps
  1020b0:	e9 7f 08 00 00       	jmp    102934 <__alltraps>

001020b5 <vector57>:
.globl vector57
vector57:
  pushl $0
  1020b5:	6a 00                	push   $0x0
  pushl $57
  1020b7:	6a 39                	push   $0x39
  jmp __alltraps
  1020b9:	e9 76 08 00 00       	jmp    102934 <__alltraps>

001020be <vector58>:
.globl vector58
vector58:
  pushl $0
  1020be:	6a 00                	push   $0x0
  pushl $58
  1020c0:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020c2:	e9 6d 08 00 00       	jmp    102934 <__alltraps>

001020c7 <vector59>:
.globl vector59
vector59:
  pushl $0
  1020c7:	6a 00                	push   $0x0
  pushl $59
  1020c9:	6a 3b                	push   $0x3b
  jmp __alltraps
  1020cb:	e9 64 08 00 00       	jmp    102934 <__alltraps>

001020d0 <vector60>:
.globl vector60
vector60:
  pushl $0
  1020d0:	6a 00                	push   $0x0
  pushl $60
  1020d2:	6a 3c                	push   $0x3c
  jmp __alltraps
  1020d4:	e9 5b 08 00 00       	jmp    102934 <__alltraps>

001020d9 <vector61>:
.globl vector61
vector61:
  pushl $0
  1020d9:	6a 00                	push   $0x0
  pushl $61
  1020db:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020dd:	e9 52 08 00 00       	jmp    102934 <__alltraps>

001020e2 <vector62>:
.globl vector62
vector62:
  pushl $0
  1020e2:	6a 00                	push   $0x0
  pushl $62
  1020e4:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020e6:	e9 49 08 00 00       	jmp    102934 <__alltraps>

001020eb <vector63>:
.globl vector63
vector63:
  pushl $0
  1020eb:	6a 00                	push   $0x0
  pushl $63
  1020ed:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020ef:	e9 40 08 00 00       	jmp    102934 <__alltraps>

001020f4 <vector64>:
.globl vector64
vector64:
  pushl $0
  1020f4:	6a 00                	push   $0x0
  pushl $64
  1020f6:	6a 40                	push   $0x40
  jmp __alltraps
  1020f8:	e9 37 08 00 00       	jmp    102934 <__alltraps>

001020fd <vector65>:
.globl vector65
vector65:
  pushl $0
  1020fd:	6a 00                	push   $0x0
  pushl $65
  1020ff:	6a 41                	push   $0x41
  jmp __alltraps
  102101:	e9 2e 08 00 00       	jmp    102934 <__alltraps>

00102106 <vector66>:
.globl vector66
vector66:
  pushl $0
  102106:	6a 00                	push   $0x0
  pushl $66
  102108:	6a 42                	push   $0x42
  jmp __alltraps
  10210a:	e9 25 08 00 00       	jmp    102934 <__alltraps>

0010210f <vector67>:
.globl vector67
vector67:
  pushl $0
  10210f:	6a 00                	push   $0x0
  pushl $67
  102111:	6a 43                	push   $0x43
  jmp __alltraps
  102113:	e9 1c 08 00 00       	jmp    102934 <__alltraps>

00102118 <vector68>:
.globl vector68
vector68:
  pushl $0
  102118:	6a 00                	push   $0x0
  pushl $68
  10211a:	6a 44                	push   $0x44
  jmp __alltraps
  10211c:	e9 13 08 00 00       	jmp    102934 <__alltraps>

00102121 <vector69>:
.globl vector69
vector69:
  pushl $0
  102121:	6a 00                	push   $0x0
  pushl $69
  102123:	6a 45                	push   $0x45
  jmp __alltraps
  102125:	e9 0a 08 00 00       	jmp    102934 <__alltraps>

0010212a <vector70>:
.globl vector70
vector70:
  pushl $0
  10212a:	6a 00                	push   $0x0
  pushl $70
  10212c:	6a 46                	push   $0x46
  jmp __alltraps
  10212e:	e9 01 08 00 00       	jmp    102934 <__alltraps>

00102133 <vector71>:
.globl vector71
vector71:
  pushl $0
  102133:	6a 00                	push   $0x0
  pushl $71
  102135:	6a 47                	push   $0x47
  jmp __alltraps
  102137:	e9 f8 07 00 00       	jmp    102934 <__alltraps>

0010213c <vector72>:
.globl vector72
vector72:
  pushl $0
  10213c:	6a 00                	push   $0x0
  pushl $72
  10213e:	6a 48                	push   $0x48
  jmp __alltraps
  102140:	e9 ef 07 00 00       	jmp    102934 <__alltraps>

00102145 <vector73>:
.globl vector73
vector73:
  pushl $0
  102145:	6a 00                	push   $0x0
  pushl $73
  102147:	6a 49                	push   $0x49
  jmp __alltraps
  102149:	e9 e6 07 00 00       	jmp    102934 <__alltraps>

0010214e <vector74>:
.globl vector74
vector74:
  pushl $0
  10214e:	6a 00                	push   $0x0
  pushl $74
  102150:	6a 4a                	push   $0x4a
  jmp __alltraps
  102152:	e9 dd 07 00 00       	jmp    102934 <__alltraps>

00102157 <vector75>:
.globl vector75
vector75:
  pushl $0
  102157:	6a 00                	push   $0x0
  pushl $75
  102159:	6a 4b                	push   $0x4b
  jmp __alltraps
  10215b:	e9 d4 07 00 00       	jmp    102934 <__alltraps>

00102160 <vector76>:
.globl vector76
vector76:
  pushl $0
  102160:	6a 00                	push   $0x0
  pushl $76
  102162:	6a 4c                	push   $0x4c
  jmp __alltraps
  102164:	e9 cb 07 00 00       	jmp    102934 <__alltraps>

00102169 <vector77>:
.globl vector77
vector77:
  pushl $0
  102169:	6a 00                	push   $0x0
  pushl $77
  10216b:	6a 4d                	push   $0x4d
  jmp __alltraps
  10216d:	e9 c2 07 00 00       	jmp    102934 <__alltraps>

00102172 <vector78>:
.globl vector78
vector78:
  pushl $0
  102172:	6a 00                	push   $0x0
  pushl $78
  102174:	6a 4e                	push   $0x4e
  jmp __alltraps
  102176:	e9 b9 07 00 00       	jmp    102934 <__alltraps>

0010217b <vector79>:
.globl vector79
vector79:
  pushl $0
  10217b:	6a 00                	push   $0x0
  pushl $79
  10217d:	6a 4f                	push   $0x4f
  jmp __alltraps
  10217f:	e9 b0 07 00 00       	jmp    102934 <__alltraps>

00102184 <vector80>:
.globl vector80
vector80:
  pushl $0
  102184:	6a 00                	push   $0x0
  pushl $80
  102186:	6a 50                	push   $0x50
  jmp __alltraps
  102188:	e9 a7 07 00 00       	jmp    102934 <__alltraps>

0010218d <vector81>:
.globl vector81
vector81:
  pushl $0
  10218d:	6a 00                	push   $0x0
  pushl $81
  10218f:	6a 51                	push   $0x51
  jmp __alltraps
  102191:	e9 9e 07 00 00       	jmp    102934 <__alltraps>

00102196 <vector82>:
.globl vector82
vector82:
  pushl $0
  102196:	6a 00                	push   $0x0
  pushl $82
  102198:	6a 52                	push   $0x52
  jmp __alltraps
  10219a:	e9 95 07 00 00       	jmp    102934 <__alltraps>

0010219f <vector83>:
.globl vector83
vector83:
  pushl $0
  10219f:	6a 00                	push   $0x0
  pushl $83
  1021a1:	6a 53                	push   $0x53
  jmp __alltraps
  1021a3:	e9 8c 07 00 00       	jmp    102934 <__alltraps>

001021a8 <vector84>:
.globl vector84
vector84:
  pushl $0
  1021a8:	6a 00                	push   $0x0
  pushl $84
  1021aa:	6a 54                	push   $0x54
  jmp __alltraps
  1021ac:	e9 83 07 00 00       	jmp    102934 <__alltraps>

001021b1 <vector85>:
.globl vector85
vector85:
  pushl $0
  1021b1:	6a 00                	push   $0x0
  pushl $85
  1021b3:	6a 55                	push   $0x55
  jmp __alltraps
  1021b5:	e9 7a 07 00 00       	jmp    102934 <__alltraps>

001021ba <vector86>:
.globl vector86
vector86:
  pushl $0
  1021ba:	6a 00                	push   $0x0
  pushl $86
  1021bc:	6a 56                	push   $0x56
  jmp __alltraps
  1021be:	e9 71 07 00 00       	jmp    102934 <__alltraps>

001021c3 <vector87>:
.globl vector87
vector87:
  pushl $0
  1021c3:	6a 00                	push   $0x0
  pushl $87
  1021c5:	6a 57                	push   $0x57
  jmp __alltraps
  1021c7:	e9 68 07 00 00       	jmp    102934 <__alltraps>

001021cc <vector88>:
.globl vector88
vector88:
  pushl $0
  1021cc:	6a 00                	push   $0x0
  pushl $88
  1021ce:	6a 58                	push   $0x58
  jmp __alltraps
  1021d0:	e9 5f 07 00 00       	jmp    102934 <__alltraps>

001021d5 <vector89>:
.globl vector89
vector89:
  pushl $0
  1021d5:	6a 00                	push   $0x0
  pushl $89
  1021d7:	6a 59                	push   $0x59
  jmp __alltraps
  1021d9:	e9 56 07 00 00       	jmp    102934 <__alltraps>

001021de <vector90>:
.globl vector90
vector90:
  pushl $0
  1021de:	6a 00                	push   $0x0
  pushl $90
  1021e0:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021e2:	e9 4d 07 00 00       	jmp    102934 <__alltraps>

001021e7 <vector91>:
.globl vector91
vector91:
  pushl $0
  1021e7:	6a 00                	push   $0x0
  pushl $91
  1021e9:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021eb:	e9 44 07 00 00       	jmp    102934 <__alltraps>

001021f0 <vector92>:
.globl vector92
vector92:
  pushl $0
  1021f0:	6a 00                	push   $0x0
  pushl $92
  1021f2:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021f4:	e9 3b 07 00 00       	jmp    102934 <__alltraps>

001021f9 <vector93>:
.globl vector93
vector93:
  pushl $0
  1021f9:	6a 00                	push   $0x0
  pushl $93
  1021fb:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021fd:	e9 32 07 00 00       	jmp    102934 <__alltraps>

00102202 <vector94>:
.globl vector94
vector94:
  pushl $0
  102202:	6a 00                	push   $0x0
  pushl $94
  102204:	6a 5e                	push   $0x5e
  jmp __alltraps
  102206:	e9 29 07 00 00       	jmp    102934 <__alltraps>

0010220b <vector95>:
.globl vector95
vector95:
  pushl $0
  10220b:	6a 00                	push   $0x0
  pushl $95
  10220d:	6a 5f                	push   $0x5f
  jmp __alltraps
  10220f:	e9 20 07 00 00       	jmp    102934 <__alltraps>

00102214 <vector96>:
.globl vector96
vector96:
  pushl $0
  102214:	6a 00                	push   $0x0
  pushl $96
  102216:	6a 60                	push   $0x60
  jmp __alltraps
  102218:	e9 17 07 00 00       	jmp    102934 <__alltraps>

0010221d <vector97>:
.globl vector97
vector97:
  pushl $0
  10221d:	6a 00                	push   $0x0
  pushl $97
  10221f:	6a 61                	push   $0x61
  jmp __alltraps
  102221:	e9 0e 07 00 00       	jmp    102934 <__alltraps>

00102226 <vector98>:
.globl vector98
vector98:
  pushl $0
  102226:	6a 00                	push   $0x0
  pushl $98
  102228:	6a 62                	push   $0x62
  jmp __alltraps
  10222a:	e9 05 07 00 00       	jmp    102934 <__alltraps>

0010222f <vector99>:
.globl vector99
vector99:
  pushl $0
  10222f:	6a 00                	push   $0x0
  pushl $99
  102231:	6a 63                	push   $0x63
  jmp __alltraps
  102233:	e9 fc 06 00 00       	jmp    102934 <__alltraps>

00102238 <vector100>:
.globl vector100
vector100:
  pushl $0
  102238:	6a 00                	push   $0x0
  pushl $100
  10223a:	6a 64                	push   $0x64
  jmp __alltraps
  10223c:	e9 f3 06 00 00       	jmp    102934 <__alltraps>

00102241 <vector101>:
.globl vector101
vector101:
  pushl $0
  102241:	6a 00                	push   $0x0
  pushl $101
  102243:	6a 65                	push   $0x65
  jmp __alltraps
  102245:	e9 ea 06 00 00       	jmp    102934 <__alltraps>

0010224a <vector102>:
.globl vector102
vector102:
  pushl $0
  10224a:	6a 00                	push   $0x0
  pushl $102
  10224c:	6a 66                	push   $0x66
  jmp __alltraps
  10224e:	e9 e1 06 00 00       	jmp    102934 <__alltraps>

00102253 <vector103>:
.globl vector103
vector103:
  pushl $0
  102253:	6a 00                	push   $0x0
  pushl $103
  102255:	6a 67                	push   $0x67
  jmp __alltraps
  102257:	e9 d8 06 00 00       	jmp    102934 <__alltraps>

0010225c <vector104>:
.globl vector104
vector104:
  pushl $0
  10225c:	6a 00                	push   $0x0
  pushl $104
  10225e:	6a 68                	push   $0x68
  jmp __alltraps
  102260:	e9 cf 06 00 00       	jmp    102934 <__alltraps>

00102265 <vector105>:
.globl vector105
vector105:
  pushl $0
  102265:	6a 00                	push   $0x0
  pushl $105
  102267:	6a 69                	push   $0x69
  jmp __alltraps
  102269:	e9 c6 06 00 00       	jmp    102934 <__alltraps>

0010226e <vector106>:
.globl vector106
vector106:
  pushl $0
  10226e:	6a 00                	push   $0x0
  pushl $106
  102270:	6a 6a                	push   $0x6a
  jmp __alltraps
  102272:	e9 bd 06 00 00       	jmp    102934 <__alltraps>

00102277 <vector107>:
.globl vector107
vector107:
  pushl $0
  102277:	6a 00                	push   $0x0
  pushl $107
  102279:	6a 6b                	push   $0x6b
  jmp __alltraps
  10227b:	e9 b4 06 00 00       	jmp    102934 <__alltraps>

00102280 <vector108>:
.globl vector108
vector108:
  pushl $0
  102280:	6a 00                	push   $0x0
  pushl $108
  102282:	6a 6c                	push   $0x6c
  jmp __alltraps
  102284:	e9 ab 06 00 00       	jmp    102934 <__alltraps>

00102289 <vector109>:
.globl vector109
vector109:
  pushl $0
  102289:	6a 00                	push   $0x0
  pushl $109
  10228b:	6a 6d                	push   $0x6d
  jmp __alltraps
  10228d:	e9 a2 06 00 00       	jmp    102934 <__alltraps>

00102292 <vector110>:
.globl vector110
vector110:
  pushl $0
  102292:	6a 00                	push   $0x0
  pushl $110
  102294:	6a 6e                	push   $0x6e
  jmp __alltraps
  102296:	e9 99 06 00 00       	jmp    102934 <__alltraps>

0010229b <vector111>:
.globl vector111
vector111:
  pushl $0
  10229b:	6a 00                	push   $0x0
  pushl $111
  10229d:	6a 6f                	push   $0x6f
  jmp __alltraps
  10229f:	e9 90 06 00 00       	jmp    102934 <__alltraps>

001022a4 <vector112>:
.globl vector112
vector112:
  pushl $0
  1022a4:	6a 00                	push   $0x0
  pushl $112
  1022a6:	6a 70                	push   $0x70
  jmp __alltraps
  1022a8:	e9 87 06 00 00       	jmp    102934 <__alltraps>

001022ad <vector113>:
.globl vector113
vector113:
  pushl $0
  1022ad:	6a 00                	push   $0x0
  pushl $113
  1022af:	6a 71                	push   $0x71
  jmp __alltraps
  1022b1:	e9 7e 06 00 00       	jmp    102934 <__alltraps>

001022b6 <vector114>:
.globl vector114
vector114:
  pushl $0
  1022b6:	6a 00                	push   $0x0
  pushl $114
  1022b8:	6a 72                	push   $0x72
  jmp __alltraps
  1022ba:	e9 75 06 00 00       	jmp    102934 <__alltraps>

001022bf <vector115>:
.globl vector115
vector115:
  pushl $0
  1022bf:	6a 00                	push   $0x0
  pushl $115
  1022c1:	6a 73                	push   $0x73
  jmp __alltraps
  1022c3:	e9 6c 06 00 00       	jmp    102934 <__alltraps>

001022c8 <vector116>:
.globl vector116
vector116:
  pushl $0
  1022c8:	6a 00                	push   $0x0
  pushl $116
  1022ca:	6a 74                	push   $0x74
  jmp __alltraps
  1022cc:	e9 63 06 00 00       	jmp    102934 <__alltraps>

001022d1 <vector117>:
.globl vector117
vector117:
  pushl $0
  1022d1:	6a 00                	push   $0x0
  pushl $117
  1022d3:	6a 75                	push   $0x75
  jmp __alltraps
  1022d5:	e9 5a 06 00 00       	jmp    102934 <__alltraps>

001022da <vector118>:
.globl vector118
vector118:
  pushl $0
  1022da:	6a 00                	push   $0x0
  pushl $118
  1022dc:	6a 76                	push   $0x76
  jmp __alltraps
  1022de:	e9 51 06 00 00       	jmp    102934 <__alltraps>

001022e3 <vector119>:
.globl vector119
vector119:
  pushl $0
  1022e3:	6a 00                	push   $0x0
  pushl $119
  1022e5:	6a 77                	push   $0x77
  jmp __alltraps
  1022e7:	e9 48 06 00 00       	jmp    102934 <__alltraps>

001022ec <vector120>:
.globl vector120
vector120:
  pushl $0
  1022ec:	6a 00                	push   $0x0
  pushl $120
  1022ee:	6a 78                	push   $0x78
  jmp __alltraps
  1022f0:	e9 3f 06 00 00       	jmp    102934 <__alltraps>

001022f5 <vector121>:
.globl vector121
vector121:
  pushl $0
  1022f5:	6a 00                	push   $0x0
  pushl $121
  1022f7:	6a 79                	push   $0x79
  jmp __alltraps
  1022f9:	e9 36 06 00 00       	jmp    102934 <__alltraps>

001022fe <vector122>:
.globl vector122
vector122:
  pushl $0
  1022fe:	6a 00                	push   $0x0
  pushl $122
  102300:	6a 7a                	push   $0x7a
  jmp __alltraps
  102302:	e9 2d 06 00 00       	jmp    102934 <__alltraps>

00102307 <vector123>:
.globl vector123
vector123:
  pushl $0
  102307:	6a 00                	push   $0x0
  pushl $123
  102309:	6a 7b                	push   $0x7b
  jmp __alltraps
  10230b:	e9 24 06 00 00       	jmp    102934 <__alltraps>

00102310 <vector124>:
.globl vector124
vector124:
  pushl $0
  102310:	6a 00                	push   $0x0
  pushl $124
  102312:	6a 7c                	push   $0x7c
  jmp __alltraps
  102314:	e9 1b 06 00 00       	jmp    102934 <__alltraps>

00102319 <vector125>:
.globl vector125
vector125:
  pushl $0
  102319:	6a 00                	push   $0x0
  pushl $125
  10231b:	6a 7d                	push   $0x7d
  jmp __alltraps
  10231d:	e9 12 06 00 00       	jmp    102934 <__alltraps>

00102322 <vector126>:
.globl vector126
vector126:
  pushl $0
  102322:	6a 00                	push   $0x0
  pushl $126
  102324:	6a 7e                	push   $0x7e
  jmp __alltraps
  102326:	e9 09 06 00 00       	jmp    102934 <__alltraps>

0010232b <vector127>:
.globl vector127
vector127:
  pushl $0
  10232b:	6a 00                	push   $0x0
  pushl $127
  10232d:	6a 7f                	push   $0x7f
  jmp __alltraps
  10232f:	e9 00 06 00 00       	jmp    102934 <__alltraps>

00102334 <vector128>:
.globl vector128
vector128:
  pushl $0
  102334:	6a 00                	push   $0x0
  pushl $128
  102336:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10233b:	e9 f4 05 00 00       	jmp    102934 <__alltraps>

00102340 <vector129>:
.globl vector129
vector129:
  pushl $0
  102340:	6a 00                	push   $0x0
  pushl $129
  102342:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102347:	e9 e8 05 00 00       	jmp    102934 <__alltraps>

0010234c <vector130>:
.globl vector130
vector130:
  pushl $0
  10234c:	6a 00                	push   $0x0
  pushl $130
  10234e:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102353:	e9 dc 05 00 00       	jmp    102934 <__alltraps>

00102358 <vector131>:
.globl vector131
vector131:
  pushl $0
  102358:	6a 00                	push   $0x0
  pushl $131
  10235a:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10235f:	e9 d0 05 00 00       	jmp    102934 <__alltraps>

00102364 <vector132>:
.globl vector132
vector132:
  pushl $0
  102364:	6a 00                	push   $0x0
  pushl $132
  102366:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10236b:	e9 c4 05 00 00       	jmp    102934 <__alltraps>

00102370 <vector133>:
.globl vector133
vector133:
  pushl $0
  102370:	6a 00                	push   $0x0
  pushl $133
  102372:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102377:	e9 b8 05 00 00       	jmp    102934 <__alltraps>

0010237c <vector134>:
.globl vector134
vector134:
  pushl $0
  10237c:	6a 00                	push   $0x0
  pushl $134
  10237e:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102383:	e9 ac 05 00 00       	jmp    102934 <__alltraps>

00102388 <vector135>:
.globl vector135
vector135:
  pushl $0
  102388:	6a 00                	push   $0x0
  pushl $135
  10238a:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10238f:	e9 a0 05 00 00       	jmp    102934 <__alltraps>

00102394 <vector136>:
.globl vector136
vector136:
  pushl $0
  102394:	6a 00                	push   $0x0
  pushl $136
  102396:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10239b:	e9 94 05 00 00       	jmp    102934 <__alltraps>

001023a0 <vector137>:
.globl vector137
vector137:
  pushl $0
  1023a0:	6a 00                	push   $0x0
  pushl $137
  1023a2:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1023a7:	e9 88 05 00 00       	jmp    102934 <__alltraps>

001023ac <vector138>:
.globl vector138
vector138:
  pushl $0
  1023ac:	6a 00                	push   $0x0
  pushl $138
  1023ae:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1023b3:	e9 7c 05 00 00       	jmp    102934 <__alltraps>

001023b8 <vector139>:
.globl vector139
vector139:
  pushl $0
  1023b8:	6a 00                	push   $0x0
  pushl $139
  1023ba:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1023bf:	e9 70 05 00 00       	jmp    102934 <__alltraps>

001023c4 <vector140>:
.globl vector140
vector140:
  pushl $0
  1023c4:	6a 00                	push   $0x0
  pushl $140
  1023c6:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1023cb:	e9 64 05 00 00       	jmp    102934 <__alltraps>

001023d0 <vector141>:
.globl vector141
vector141:
  pushl $0
  1023d0:	6a 00                	push   $0x0
  pushl $141
  1023d2:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1023d7:	e9 58 05 00 00       	jmp    102934 <__alltraps>

001023dc <vector142>:
.globl vector142
vector142:
  pushl $0
  1023dc:	6a 00                	push   $0x0
  pushl $142
  1023de:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023e3:	e9 4c 05 00 00       	jmp    102934 <__alltraps>

001023e8 <vector143>:
.globl vector143
vector143:
  pushl $0
  1023e8:	6a 00                	push   $0x0
  pushl $143
  1023ea:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023ef:	e9 40 05 00 00       	jmp    102934 <__alltraps>

001023f4 <vector144>:
.globl vector144
vector144:
  pushl $0
  1023f4:	6a 00                	push   $0x0
  pushl $144
  1023f6:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023fb:	e9 34 05 00 00       	jmp    102934 <__alltraps>

00102400 <vector145>:
.globl vector145
vector145:
  pushl $0
  102400:	6a 00                	push   $0x0
  pushl $145
  102402:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102407:	e9 28 05 00 00       	jmp    102934 <__alltraps>

0010240c <vector146>:
.globl vector146
vector146:
  pushl $0
  10240c:	6a 00                	push   $0x0
  pushl $146
  10240e:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102413:	e9 1c 05 00 00       	jmp    102934 <__alltraps>

00102418 <vector147>:
.globl vector147
vector147:
  pushl $0
  102418:	6a 00                	push   $0x0
  pushl $147
  10241a:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10241f:	e9 10 05 00 00       	jmp    102934 <__alltraps>

00102424 <vector148>:
.globl vector148
vector148:
  pushl $0
  102424:	6a 00                	push   $0x0
  pushl $148
  102426:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10242b:	e9 04 05 00 00       	jmp    102934 <__alltraps>

00102430 <vector149>:
.globl vector149
vector149:
  pushl $0
  102430:	6a 00                	push   $0x0
  pushl $149
  102432:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102437:	e9 f8 04 00 00       	jmp    102934 <__alltraps>

0010243c <vector150>:
.globl vector150
vector150:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $150
  10243e:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102443:	e9 ec 04 00 00       	jmp    102934 <__alltraps>

00102448 <vector151>:
.globl vector151
vector151:
  pushl $0
  102448:	6a 00                	push   $0x0
  pushl $151
  10244a:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10244f:	e9 e0 04 00 00       	jmp    102934 <__alltraps>

00102454 <vector152>:
.globl vector152
vector152:
  pushl $0
  102454:	6a 00                	push   $0x0
  pushl $152
  102456:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10245b:	e9 d4 04 00 00       	jmp    102934 <__alltraps>

00102460 <vector153>:
.globl vector153
vector153:
  pushl $0
  102460:	6a 00                	push   $0x0
  pushl $153
  102462:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102467:	e9 c8 04 00 00       	jmp    102934 <__alltraps>

0010246c <vector154>:
.globl vector154
vector154:
  pushl $0
  10246c:	6a 00                	push   $0x0
  pushl $154
  10246e:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102473:	e9 bc 04 00 00       	jmp    102934 <__alltraps>

00102478 <vector155>:
.globl vector155
vector155:
  pushl $0
  102478:	6a 00                	push   $0x0
  pushl $155
  10247a:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10247f:	e9 b0 04 00 00       	jmp    102934 <__alltraps>

00102484 <vector156>:
.globl vector156
vector156:
  pushl $0
  102484:	6a 00                	push   $0x0
  pushl $156
  102486:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10248b:	e9 a4 04 00 00       	jmp    102934 <__alltraps>

00102490 <vector157>:
.globl vector157
vector157:
  pushl $0
  102490:	6a 00                	push   $0x0
  pushl $157
  102492:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102497:	e9 98 04 00 00       	jmp    102934 <__alltraps>

0010249c <vector158>:
.globl vector158
vector158:
  pushl $0
  10249c:	6a 00                	push   $0x0
  pushl $158
  10249e:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1024a3:	e9 8c 04 00 00       	jmp    102934 <__alltraps>

001024a8 <vector159>:
.globl vector159
vector159:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $159
  1024aa:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1024af:	e9 80 04 00 00       	jmp    102934 <__alltraps>

001024b4 <vector160>:
.globl vector160
vector160:
  pushl $0
  1024b4:	6a 00                	push   $0x0
  pushl $160
  1024b6:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1024bb:	e9 74 04 00 00       	jmp    102934 <__alltraps>

001024c0 <vector161>:
.globl vector161
vector161:
  pushl $0
  1024c0:	6a 00                	push   $0x0
  pushl $161
  1024c2:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024c7:	e9 68 04 00 00       	jmp    102934 <__alltraps>

001024cc <vector162>:
.globl vector162
vector162:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $162
  1024ce:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1024d3:	e9 5c 04 00 00       	jmp    102934 <__alltraps>

001024d8 <vector163>:
.globl vector163
vector163:
  pushl $0
  1024d8:	6a 00                	push   $0x0
  pushl $163
  1024da:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024df:	e9 50 04 00 00       	jmp    102934 <__alltraps>

001024e4 <vector164>:
.globl vector164
vector164:
  pushl $0
  1024e4:	6a 00                	push   $0x0
  pushl $164
  1024e6:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024eb:	e9 44 04 00 00       	jmp    102934 <__alltraps>

001024f0 <vector165>:
.globl vector165
vector165:
  pushl $0
  1024f0:	6a 00                	push   $0x0
  pushl $165
  1024f2:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024f7:	e9 38 04 00 00       	jmp    102934 <__alltraps>

001024fc <vector166>:
.globl vector166
vector166:
  pushl $0
  1024fc:	6a 00                	push   $0x0
  pushl $166
  1024fe:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102503:	e9 2c 04 00 00       	jmp    102934 <__alltraps>

00102508 <vector167>:
.globl vector167
vector167:
  pushl $0
  102508:	6a 00                	push   $0x0
  pushl $167
  10250a:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  10250f:	e9 20 04 00 00       	jmp    102934 <__alltraps>

00102514 <vector168>:
.globl vector168
vector168:
  pushl $0
  102514:	6a 00                	push   $0x0
  pushl $168
  102516:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10251b:	e9 14 04 00 00       	jmp    102934 <__alltraps>

00102520 <vector169>:
.globl vector169
vector169:
  pushl $0
  102520:	6a 00                	push   $0x0
  pushl $169
  102522:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102527:	e9 08 04 00 00       	jmp    102934 <__alltraps>

0010252c <vector170>:
.globl vector170
vector170:
  pushl $0
  10252c:	6a 00                	push   $0x0
  pushl $170
  10252e:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102533:	e9 fc 03 00 00       	jmp    102934 <__alltraps>

00102538 <vector171>:
.globl vector171
vector171:
  pushl $0
  102538:	6a 00                	push   $0x0
  pushl $171
  10253a:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10253f:	e9 f0 03 00 00       	jmp    102934 <__alltraps>

00102544 <vector172>:
.globl vector172
vector172:
  pushl $0
  102544:	6a 00                	push   $0x0
  pushl $172
  102546:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10254b:	e9 e4 03 00 00       	jmp    102934 <__alltraps>

00102550 <vector173>:
.globl vector173
vector173:
  pushl $0
  102550:	6a 00                	push   $0x0
  pushl $173
  102552:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102557:	e9 d8 03 00 00       	jmp    102934 <__alltraps>

0010255c <vector174>:
.globl vector174
vector174:
  pushl $0
  10255c:	6a 00                	push   $0x0
  pushl $174
  10255e:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102563:	e9 cc 03 00 00       	jmp    102934 <__alltraps>

00102568 <vector175>:
.globl vector175
vector175:
  pushl $0
  102568:	6a 00                	push   $0x0
  pushl $175
  10256a:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10256f:	e9 c0 03 00 00       	jmp    102934 <__alltraps>

00102574 <vector176>:
.globl vector176
vector176:
  pushl $0
  102574:	6a 00                	push   $0x0
  pushl $176
  102576:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10257b:	e9 b4 03 00 00       	jmp    102934 <__alltraps>

00102580 <vector177>:
.globl vector177
vector177:
  pushl $0
  102580:	6a 00                	push   $0x0
  pushl $177
  102582:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102587:	e9 a8 03 00 00       	jmp    102934 <__alltraps>

0010258c <vector178>:
.globl vector178
vector178:
  pushl $0
  10258c:	6a 00                	push   $0x0
  pushl $178
  10258e:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102593:	e9 9c 03 00 00       	jmp    102934 <__alltraps>

00102598 <vector179>:
.globl vector179
vector179:
  pushl $0
  102598:	6a 00                	push   $0x0
  pushl $179
  10259a:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10259f:	e9 90 03 00 00       	jmp    102934 <__alltraps>

001025a4 <vector180>:
.globl vector180
vector180:
  pushl $0
  1025a4:	6a 00                	push   $0x0
  pushl $180
  1025a6:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1025ab:	e9 84 03 00 00       	jmp    102934 <__alltraps>

001025b0 <vector181>:
.globl vector181
vector181:
  pushl $0
  1025b0:	6a 00                	push   $0x0
  pushl $181
  1025b2:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1025b7:	e9 78 03 00 00       	jmp    102934 <__alltraps>

001025bc <vector182>:
.globl vector182
vector182:
  pushl $0
  1025bc:	6a 00                	push   $0x0
  pushl $182
  1025be:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025c3:	e9 6c 03 00 00       	jmp    102934 <__alltraps>

001025c8 <vector183>:
.globl vector183
vector183:
  pushl $0
  1025c8:	6a 00                	push   $0x0
  pushl $183
  1025ca:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1025cf:	e9 60 03 00 00       	jmp    102934 <__alltraps>

001025d4 <vector184>:
.globl vector184
vector184:
  pushl $0
  1025d4:	6a 00                	push   $0x0
  pushl $184
  1025d6:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025db:	e9 54 03 00 00       	jmp    102934 <__alltraps>

001025e0 <vector185>:
.globl vector185
vector185:
  pushl $0
  1025e0:	6a 00                	push   $0x0
  pushl $185
  1025e2:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025e7:	e9 48 03 00 00       	jmp    102934 <__alltraps>

001025ec <vector186>:
.globl vector186
vector186:
  pushl $0
  1025ec:	6a 00                	push   $0x0
  pushl $186
  1025ee:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025f3:	e9 3c 03 00 00       	jmp    102934 <__alltraps>

001025f8 <vector187>:
.globl vector187
vector187:
  pushl $0
  1025f8:	6a 00                	push   $0x0
  pushl $187
  1025fa:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025ff:	e9 30 03 00 00       	jmp    102934 <__alltraps>

00102604 <vector188>:
.globl vector188
vector188:
  pushl $0
  102604:	6a 00                	push   $0x0
  pushl $188
  102606:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10260b:	e9 24 03 00 00       	jmp    102934 <__alltraps>

00102610 <vector189>:
.globl vector189
vector189:
  pushl $0
  102610:	6a 00                	push   $0x0
  pushl $189
  102612:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102617:	e9 18 03 00 00       	jmp    102934 <__alltraps>

0010261c <vector190>:
.globl vector190
vector190:
  pushl $0
  10261c:	6a 00                	push   $0x0
  pushl $190
  10261e:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102623:	e9 0c 03 00 00       	jmp    102934 <__alltraps>

00102628 <vector191>:
.globl vector191
vector191:
  pushl $0
  102628:	6a 00                	push   $0x0
  pushl $191
  10262a:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10262f:	e9 00 03 00 00       	jmp    102934 <__alltraps>

00102634 <vector192>:
.globl vector192
vector192:
  pushl $0
  102634:	6a 00                	push   $0x0
  pushl $192
  102636:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10263b:	e9 f4 02 00 00       	jmp    102934 <__alltraps>

00102640 <vector193>:
.globl vector193
vector193:
  pushl $0
  102640:	6a 00                	push   $0x0
  pushl $193
  102642:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102647:	e9 e8 02 00 00       	jmp    102934 <__alltraps>

0010264c <vector194>:
.globl vector194
vector194:
  pushl $0
  10264c:	6a 00                	push   $0x0
  pushl $194
  10264e:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102653:	e9 dc 02 00 00       	jmp    102934 <__alltraps>

00102658 <vector195>:
.globl vector195
vector195:
  pushl $0
  102658:	6a 00                	push   $0x0
  pushl $195
  10265a:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10265f:	e9 d0 02 00 00       	jmp    102934 <__alltraps>

00102664 <vector196>:
.globl vector196
vector196:
  pushl $0
  102664:	6a 00                	push   $0x0
  pushl $196
  102666:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10266b:	e9 c4 02 00 00       	jmp    102934 <__alltraps>

00102670 <vector197>:
.globl vector197
vector197:
  pushl $0
  102670:	6a 00                	push   $0x0
  pushl $197
  102672:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102677:	e9 b8 02 00 00       	jmp    102934 <__alltraps>

0010267c <vector198>:
.globl vector198
vector198:
  pushl $0
  10267c:	6a 00                	push   $0x0
  pushl $198
  10267e:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102683:	e9 ac 02 00 00       	jmp    102934 <__alltraps>

00102688 <vector199>:
.globl vector199
vector199:
  pushl $0
  102688:	6a 00                	push   $0x0
  pushl $199
  10268a:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10268f:	e9 a0 02 00 00       	jmp    102934 <__alltraps>

00102694 <vector200>:
.globl vector200
vector200:
  pushl $0
  102694:	6a 00                	push   $0x0
  pushl $200
  102696:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10269b:	e9 94 02 00 00       	jmp    102934 <__alltraps>

001026a0 <vector201>:
.globl vector201
vector201:
  pushl $0
  1026a0:	6a 00                	push   $0x0
  pushl $201
  1026a2:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1026a7:	e9 88 02 00 00       	jmp    102934 <__alltraps>

001026ac <vector202>:
.globl vector202
vector202:
  pushl $0
  1026ac:	6a 00                	push   $0x0
  pushl $202
  1026ae:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1026b3:	e9 7c 02 00 00       	jmp    102934 <__alltraps>

001026b8 <vector203>:
.globl vector203
vector203:
  pushl $0
  1026b8:	6a 00                	push   $0x0
  pushl $203
  1026ba:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1026bf:	e9 70 02 00 00       	jmp    102934 <__alltraps>

001026c4 <vector204>:
.globl vector204
vector204:
  pushl $0
  1026c4:	6a 00                	push   $0x0
  pushl $204
  1026c6:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1026cb:	e9 64 02 00 00       	jmp    102934 <__alltraps>

001026d0 <vector205>:
.globl vector205
vector205:
  pushl $0
  1026d0:	6a 00                	push   $0x0
  pushl $205
  1026d2:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1026d7:	e9 58 02 00 00       	jmp    102934 <__alltraps>

001026dc <vector206>:
.globl vector206
vector206:
  pushl $0
  1026dc:	6a 00                	push   $0x0
  pushl $206
  1026de:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026e3:	e9 4c 02 00 00       	jmp    102934 <__alltraps>

001026e8 <vector207>:
.globl vector207
vector207:
  pushl $0
  1026e8:	6a 00                	push   $0x0
  pushl $207
  1026ea:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026ef:	e9 40 02 00 00       	jmp    102934 <__alltraps>

001026f4 <vector208>:
.globl vector208
vector208:
  pushl $0
  1026f4:	6a 00                	push   $0x0
  pushl $208
  1026f6:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026fb:	e9 34 02 00 00       	jmp    102934 <__alltraps>

00102700 <vector209>:
.globl vector209
vector209:
  pushl $0
  102700:	6a 00                	push   $0x0
  pushl $209
  102702:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102707:	e9 28 02 00 00       	jmp    102934 <__alltraps>

0010270c <vector210>:
.globl vector210
vector210:
  pushl $0
  10270c:	6a 00                	push   $0x0
  pushl $210
  10270e:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102713:	e9 1c 02 00 00       	jmp    102934 <__alltraps>

00102718 <vector211>:
.globl vector211
vector211:
  pushl $0
  102718:	6a 00                	push   $0x0
  pushl $211
  10271a:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10271f:	e9 10 02 00 00       	jmp    102934 <__alltraps>

00102724 <vector212>:
.globl vector212
vector212:
  pushl $0
  102724:	6a 00                	push   $0x0
  pushl $212
  102726:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10272b:	e9 04 02 00 00       	jmp    102934 <__alltraps>

00102730 <vector213>:
.globl vector213
vector213:
  pushl $0
  102730:	6a 00                	push   $0x0
  pushl $213
  102732:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102737:	e9 f8 01 00 00       	jmp    102934 <__alltraps>

0010273c <vector214>:
.globl vector214
vector214:
  pushl $0
  10273c:	6a 00                	push   $0x0
  pushl $214
  10273e:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102743:	e9 ec 01 00 00       	jmp    102934 <__alltraps>

00102748 <vector215>:
.globl vector215
vector215:
  pushl $0
  102748:	6a 00                	push   $0x0
  pushl $215
  10274a:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10274f:	e9 e0 01 00 00       	jmp    102934 <__alltraps>

00102754 <vector216>:
.globl vector216
vector216:
  pushl $0
  102754:	6a 00                	push   $0x0
  pushl $216
  102756:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10275b:	e9 d4 01 00 00       	jmp    102934 <__alltraps>

00102760 <vector217>:
.globl vector217
vector217:
  pushl $0
  102760:	6a 00                	push   $0x0
  pushl $217
  102762:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102767:	e9 c8 01 00 00       	jmp    102934 <__alltraps>

0010276c <vector218>:
.globl vector218
vector218:
  pushl $0
  10276c:	6a 00                	push   $0x0
  pushl $218
  10276e:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102773:	e9 bc 01 00 00       	jmp    102934 <__alltraps>

00102778 <vector219>:
.globl vector219
vector219:
  pushl $0
  102778:	6a 00                	push   $0x0
  pushl $219
  10277a:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10277f:	e9 b0 01 00 00       	jmp    102934 <__alltraps>

00102784 <vector220>:
.globl vector220
vector220:
  pushl $0
  102784:	6a 00                	push   $0x0
  pushl $220
  102786:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10278b:	e9 a4 01 00 00       	jmp    102934 <__alltraps>

00102790 <vector221>:
.globl vector221
vector221:
  pushl $0
  102790:	6a 00                	push   $0x0
  pushl $221
  102792:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102797:	e9 98 01 00 00       	jmp    102934 <__alltraps>

0010279c <vector222>:
.globl vector222
vector222:
  pushl $0
  10279c:	6a 00                	push   $0x0
  pushl $222
  10279e:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1027a3:	e9 8c 01 00 00       	jmp    102934 <__alltraps>

001027a8 <vector223>:
.globl vector223
vector223:
  pushl $0
  1027a8:	6a 00                	push   $0x0
  pushl $223
  1027aa:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1027af:	e9 80 01 00 00       	jmp    102934 <__alltraps>

001027b4 <vector224>:
.globl vector224
vector224:
  pushl $0
  1027b4:	6a 00                	push   $0x0
  pushl $224
  1027b6:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1027bb:	e9 74 01 00 00       	jmp    102934 <__alltraps>

001027c0 <vector225>:
.globl vector225
vector225:
  pushl $0
  1027c0:	6a 00                	push   $0x0
  pushl $225
  1027c2:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027c7:	e9 68 01 00 00       	jmp    102934 <__alltraps>

001027cc <vector226>:
.globl vector226
vector226:
  pushl $0
  1027cc:	6a 00                	push   $0x0
  pushl $226
  1027ce:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1027d3:	e9 5c 01 00 00       	jmp    102934 <__alltraps>

001027d8 <vector227>:
.globl vector227
vector227:
  pushl $0
  1027d8:	6a 00                	push   $0x0
  pushl $227
  1027da:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027df:	e9 50 01 00 00       	jmp    102934 <__alltraps>

001027e4 <vector228>:
.globl vector228
vector228:
  pushl $0
  1027e4:	6a 00                	push   $0x0
  pushl $228
  1027e6:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027eb:	e9 44 01 00 00       	jmp    102934 <__alltraps>

001027f0 <vector229>:
.globl vector229
vector229:
  pushl $0
  1027f0:	6a 00                	push   $0x0
  pushl $229
  1027f2:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027f7:	e9 38 01 00 00       	jmp    102934 <__alltraps>

001027fc <vector230>:
.globl vector230
vector230:
  pushl $0
  1027fc:	6a 00                	push   $0x0
  pushl $230
  1027fe:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102803:	e9 2c 01 00 00       	jmp    102934 <__alltraps>

00102808 <vector231>:
.globl vector231
vector231:
  pushl $0
  102808:	6a 00                	push   $0x0
  pushl $231
  10280a:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  10280f:	e9 20 01 00 00       	jmp    102934 <__alltraps>

00102814 <vector232>:
.globl vector232
vector232:
  pushl $0
  102814:	6a 00                	push   $0x0
  pushl $232
  102816:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10281b:	e9 14 01 00 00       	jmp    102934 <__alltraps>

00102820 <vector233>:
.globl vector233
vector233:
  pushl $0
  102820:	6a 00                	push   $0x0
  pushl $233
  102822:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102827:	e9 08 01 00 00       	jmp    102934 <__alltraps>

0010282c <vector234>:
.globl vector234
vector234:
  pushl $0
  10282c:	6a 00                	push   $0x0
  pushl $234
  10282e:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102833:	e9 fc 00 00 00       	jmp    102934 <__alltraps>

00102838 <vector235>:
.globl vector235
vector235:
  pushl $0
  102838:	6a 00                	push   $0x0
  pushl $235
  10283a:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10283f:	e9 f0 00 00 00       	jmp    102934 <__alltraps>

00102844 <vector236>:
.globl vector236
vector236:
  pushl $0
  102844:	6a 00                	push   $0x0
  pushl $236
  102846:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10284b:	e9 e4 00 00 00       	jmp    102934 <__alltraps>

00102850 <vector237>:
.globl vector237
vector237:
  pushl $0
  102850:	6a 00                	push   $0x0
  pushl $237
  102852:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102857:	e9 d8 00 00 00       	jmp    102934 <__alltraps>

0010285c <vector238>:
.globl vector238
vector238:
  pushl $0
  10285c:	6a 00                	push   $0x0
  pushl $238
  10285e:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102863:	e9 cc 00 00 00       	jmp    102934 <__alltraps>

00102868 <vector239>:
.globl vector239
vector239:
  pushl $0
  102868:	6a 00                	push   $0x0
  pushl $239
  10286a:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10286f:	e9 c0 00 00 00       	jmp    102934 <__alltraps>

00102874 <vector240>:
.globl vector240
vector240:
  pushl $0
  102874:	6a 00                	push   $0x0
  pushl $240
  102876:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10287b:	e9 b4 00 00 00       	jmp    102934 <__alltraps>

00102880 <vector241>:
.globl vector241
vector241:
  pushl $0
  102880:	6a 00                	push   $0x0
  pushl $241
  102882:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102887:	e9 a8 00 00 00       	jmp    102934 <__alltraps>

0010288c <vector242>:
.globl vector242
vector242:
  pushl $0
  10288c:	6a 00                	push   $0x0
  pushl $242
  10288e:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102893:	e9 9c 00 00 00       	jmp    102934 <__alltraps>

00102898 <vector243>:
.globl vector243
vector243:
  pushl $0
  102898:	6a 00                	push   $0x0
  pushl $243
  10289a:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10289f:	e9 90 00 00 00       	jmp    102934 <__alltraps>

001028a4 <vector244>:
.globl vector244
vector244:
  pushl $0
  1028a4:	6a 00                	push   $0x0
  pushl $244
  1028a6:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1028ab:	e9 84 00 00 00       	jmp    102934 <__alltraps>

001028b0 <vector245>:
.globl vector245
vector245:
  pushl $0
  1028b0:	6a 00                	push   $0x0
  pushl $245
  1028b2:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1028b7:	e9 78 00 00 00       	jmp    102934 <__alltraps>

001028bc <vector246>:
.globl vector246
vector246:
  pushl $0
  1028bc:	6a 00                	push   $0x0
  pushl $246
  1028be:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028c3:	e9 6c 00 00 00       	jmp    102934 <__alltraps>

001028c8 <vector247>:
.globl vector247
vector247:
  pushl $0
  1028c8:	6a 00                	push   $0x0
  pushl $247
  1028ca:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1028cf:	e9 60 00 00 00       	jmp    102934 <__alltraps>

001028d4 <vector248>:
.globl vector248
vector248:
  pushl $0
  1028d4:	6a 00                	push   $0x0
  pushl $248
  1028d6:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028db:	e9 54 00 00 00       	jmp    102934 <__alltraps>

001028e0 <vector249>:
.globl vector249
vector249:
  pushl $0
  1028e0:	6a 00                	push   $0x0
  pushl $249
  1028e2:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028e7:	e9 48 00 00 00       	jmp    102934 <__alltraps>

001028ec <vector250>:
.globl vector250
vector250:
  pushl $0
  1028ec:	6a 00                	push   $0x0
  pushl $250
  1028ee:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028f3:	e9 3c 00 00 00       	jmp    102934 <__alltraps>

001028f8 <vector251>:
.globl vector251
vector251:
  pushl $0
  1028f8:	6a 00                	push   $0x0
  pushl $251
  1028fa:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028ff:	e9 30 00 00 00       	jmp    102934 <__alltraps>

00102904 <vector252>:
.globl vector252
vector252:
  pushl $0
  102904:	6a 00                	push   $0x0
  pushl $252
  102906:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10290b:	e9 24 00 00 00       	jmp    102934 <__alltraps>

00102910 <vector253>:
.globl vector253
vector253:
  pushl $0
  102910:	6a 00                	push   $0x0
  pushl $253
  102912:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102917:	e9 18 00 00 00       	jmp    102934 <__alltraps>

0010291c <vector254>:
.globl vector254
vector254:
  pushl $0
  10291c:	6a 00                	push   $0x0
  pushl $254
  10291e:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102923:	e9 0c 00 00 00       	jmp    102934 <__alltraps>

00102928 <vector255>:
.globl vector255
vector255:
  pushl $0
  102928:	6a 00                	push   $0x0
  pushl $255
  10292a:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10292f:	e9 00 00 00 00       	jmp    102934 <__alltraps>

00102934 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102934:	1e                   	push   %ds
    pushl %es
  102935:	06                   	push   %es
    pushl %fs
  102936:	0f a0                	push   %fs
    pushl %gs
  102938:	0f a8                	push   %gs
    pushal
  10293a:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  10293b:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102940:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102942:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102944:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102945:	e8 53 f5 ff ff       	call   101e9d <trap>

    # pop the pushed stack pointer
    popl %esp
  10294a:	5c                   	pop    %esp

0010294b <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  10294b:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  10294c:	0f a9                	pop    %gs
    popl %fs
  10294e:	0f a1                	pop    %fs
    popl %es
  102950:	07                   	pop    %es
    popl %ds
  102951:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102952:	83 c4 08             	add    $0x8,%esp
    iret
  102955:	cf                   	iret   

00102956 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102956:	55                   	push   %ebp
  102957:	89 e5                	mov    %esp,%ebp
  102959:	e8 42 d9 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  10295e:	05 f2 cf 00 00       	add    $0xcff2,%eax
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102963:	8b 45 08             	mov    0x8(%ebp),%eax
  102966:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102969:	b8 23 00 00 00       	mov    $0x23,%eax
  10296e:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102970:	b8 23 00 00 00       	mov    $0x23,%eax
  102975:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102977:	b8 10 00 00 00       	mov    $0x10,%eax
  10297c:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  10297e:	b8 10 00 00 00       	mov    $0x10,%eax
  102983:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102985:	b8 10 00 00 00       	mov    $0x10,%eax
  10298a:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  10298c:	ea 93 29 10 00 08 00 	ljmp   $0x8,$0x102993
}
  102993:	90                   	nop
  102994:	5d                   	pop    %ebp
  102995:	c3                   	ret    

00102996 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102996:	f3 0f 1e fb          	endbr32 
  10299a:	55                   	push   %ebp
  10299b:	89 e5                	mov    %esp,%ebp
  10299d:	83 ec 10             	sub    $0x10,%esp
  1029a0:	e8 fb d8 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  1029a5:	05 ab cf 00 00       	add    $0xcfab,%eax
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1029aa:	c7 c2 c0 09 11 00    	mov    $0x1109c0,%edx
  1029b0:	81 c2 00 04 00 00    	add    $0x400,%edx
  1029b6:	89 90 f4 0f 00 00    	mov    %edx,0xff4(%eax)
    ts.ts_ss0 = KERNEL_DS;
  1029bc:	66 c7 80 f8 0f 00 00 	movw   $0x10,0xff8(%eax)
  1029c3:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1029c5:	66 c7 80 f8 ff ff ff 	movw   $0x68,-0x8(%eax)
  1029cc:	68 00 
  1029ce:	8d 90 f0 0f 00 00    	lea    0xff0(%eax),%edx
  1029d4:	66 89 90 fa ff ff ff 	mov    %dx,-0x6(%eax)
  1029db:	8d 90 f0 0f 00 00    	lea    0xff0(%eax),%edx
  1029e1:	c1 ea 10             	shr    $0x10,%edx
  1029e4:	88 90 fc ff ff ff    	mov    %dl,-0x4(%eax)
  1029ea:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  1029f1:	83 e2 f0             	and    $0xfffffff0,%edx
  1029f4:	83 ca 09             	or     $0x9,%edx
  1029f7:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  1029fd:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102a04:	83 ca 10             	or     $0x10,%edx
  102a07:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102a0d:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102a14:	83 e2 9f             	and    $0xffffff9f,%edx
  102a17:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102a1d:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102a24:	83 ca 80             	or     $0xffffff80,%edx
  102a27:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)
  102a2d:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102a34:	83 e2 f0             	and    $0xfffffff0,%edx
  102a37:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102a3d:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102a44:	83 e2 ef             	and    $0xffffffef,%edx
  102a47:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102a4d:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102a54:	83 e2 df             	and    $0xffffffdf,%edx
  102a57:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102a5d:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102a64:	83 ca 40             	or     $0x40,%edx
  102a67:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102a6d:	0f b6 90 fe ff ff ff 	movzbl -0x2(%eax),%edx
  102a74:	83 e2 7f             	and    $0x7f,%edx
  102a77:	88 90 fe ff ff ff    	mov    %dl,-0x2(%eax)
  102a7d:	8d 90 f0 0f 00 00    	lea    0xff0(%eax),%edx
  102a83:	c1 ea 18             	shr    $0x18,%edx
  102a86:	88 90 ff ff ff ff    	mov    %dl,-0x1(%eax)
    gdt[SEG_TSS].sd_s = 0;
  102a8c:	0f b6 90 fd ff ff ff 	movzbl -0x3(%eax),%edx
  102a93:	83 e2 ef             	and    $0xffffffef,%edx
  102a96:	88 90 fd ff ff ff    	mov    %dl,-0x3(%eax)

    // reload all segment registers
    lgdt(&gdt_pd);
  102a9c:	8d 80 d0 00 00 00    	lea    0xd0(%eax),%eax
  102aa2:	50                   	push   %eax
  102aa3:	e8 ae fe ff ff       	call   102956 <lgdt>
  102aa8:	83 c4 04             	add    $0x4,%esp
  102aab:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102ab1:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102ab5:	0f 00 d8             	ltr    %ax
}
  102ab8:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102ab9:	90                   	nop
  102aba:	c9                   	leave  
  102abb:	c3                   	ret    

00102abc <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102abc:	f3 0f 1e fb          	endbr32 
  102ac0:	55                   	push   %ebp
  102ac1:	89 e5                	mov    %esp,%ebp
  102ac3:	e8 d8 d7 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102ac8:	05 88 ce 00 00       	add    $0xce88,%eax
    gdt_init();
  102acd:	e8 c4 fe ff ff       	call   102996 <gdt_init>
}
  102ad2:	90                   	nop
  102ad3:	5d                   	pop    %ebp
  102ad4:	c3                   	ret    

00102ad5 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102ad5:	f3 0f 1e fb          	endbr32 
  102ad9:	55                   	push   %ebp
  102ada:	89 e5                	mov    %esp,%ebp
  102adc:	83 ec 10             	sub    $0x10,%esp
  102adf:	e8 bc d7 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102ae4:	05 6c ce 00 00       	add    $0xce6c,%eax
    size_t cnt = 0;
  102ae9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102af0:	eb 04                	jmp    102af6 <strlen+0x21>
        cnt ++;
  102af2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (*s ++ != '\0') {
  102af6:	8b 45 08             	mov    0x8(%ebp),%eax
  102af9:	8d 50 01             	lea    0x1(%eax),%edx
  102afc:	89 55 08             	mov    %edx,0x8(%ebp)
  102aff:	0f b6 00             	movzbl (%eax),%eax
  102b02:	84 c0                	test   %al,%al
  102b04:	75 ec                	jne    102af2 <strlen+0x1d>
    }
    return cnt;
  102b06:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102b09:	c9                   	leave  
  102b0a:	c3                   	ret    

00102b0b <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102b0b:	f3 0f 1e fb          	endbr32 
  102b0f:	55                   	push   %ebp
  102b10:	89 e5                	mov    %esp,%ebp
  102b12:	83 ec 10             	sub    $0x10,%esp
  102b15:	e8 86 d7 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102b1a:	05 36 ce 00 00       	add    $0xce36,%eax
    size_t cnt = 0;
  102b1f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102b26:	eb 04                	jmp    102b2c <strnlen+0x21>
        cnt ++;
  102b28:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102b2c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b2f:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102b32:	73 10                	jae    102b44 <strnlen+0x39>
  102b34:	8b 45 08             	mov    0x8(%ebp),%eax
  102b37:	8d 50 01             	lea    0x1(%eax),%edx
  102b3a:	89 55 08             	mov    %edx,0x8(%ebp)
  102b3d:	0f b6 00             	movzbl (%eax),%eax
  102b40:	84 c0                	test   %al,%al
  102b42:	75 e4                	jne    102b28 <strnlen+0x1d>
    }
    return cnt;
  102b44:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102b47:	c9                   	leave  
  102b48:	c3                   	ret    

00102b49 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102b49:	f3 0f 1e fb          	endbr32 
  102b4d:	55                   	push   %ebp
  102b4e:	89 e5                	mov    %esp,%ebp
  102b50:	57                   	push   %edi
  102b51:	56                   	push   %esi
  102b52:	83 ec 20             	sub    $0x20,%esp
  102b55:	e8 46 d7 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102b5a:	05 f6 cd 00 00       	add    $0xcdf6,%eax
  102b5f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b62:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b65:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b68:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102b6b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102b6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b71:	89 d1                	mov    %edx,%ecx
  102b73:	89 c2                	mov    %eax,%edx
  102b75:	89 ce                	mov    %ecx,%esi
  102b77:	89 d7                	mov    %edx,%edi
  102b79:	ac                   	lods   %ds:(%esi),%al
  102b7a:	aa                   	stos   %al,%es:(%edi)
  102b7b:	84 c0                	test   %al,%al
  102b7d:	75 fa                	jne    102b79 <strcpy+0x30>
  102b7f:	89 fa                	mov    %edi,%edx
  102b81:	89 f1                	mov    %esi,%ecx
  102b83:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b86:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102b89:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102b8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102b8f:	83 c4 20             	add    $0x20,%esp
  102b92:	5e                   	pop    %esi
  102b93:	5f                   	pop    %edi
  102b94:	5d                   	pop    %ebp
  102b95:	c3                   	ret    

00102b96 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102b96:	f3 0f 1e fb          	endbr32 
  102b9a:	55                   	push   %ebp
  102b9b:	89 e5                	mov    %esp,%ebp
  102b9d:	83 ec 10             	sub    $0x10,%esp
  102ba0:	e8 fb d6 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102ba5:	05 ab cd 00 00       	add    $0xcdab,%eax
    char *p = dst;
  102baa:	8b 45 08             	mov    0x8(%ebp),%eax
  102bad:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102bb0:	eb 21                	jmp    102bd3 <strncpy+0x3d>
        if ((*p = *src) != '\0') {
  102bb2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bb5:	0f b6 10             	movzbl (%eax),%edx
  102bb8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102bbb:	88 10                	mov    %dl,(%eax)
  102bbd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102bc0:	0f b6 00             	movzbl (%eax),%eax
  102bc3:	84 c0                	test   %al,%al
  102bc5:	74 04                	je     102bcb <strncpy+0x35>
            src ++;
  102bc7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102bcb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102bcf:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    while (len > 0) {
  102bd3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bd7:	75 d9                	jne    102bb2 <strncpy+0x1c>
    }
    return dst;
  102bd9:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102bdc:	c9                   	leave  
  102bdd:	c3                   	ret    

00102bde <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102bde:	f3 0f 1e fb          	endbr32 
  102be2:	55                   	push   %ebp
  102be3:	89 e5                	mov    %esp,%ebp
  102be5:	57                   	push   %edi
  102be6:	56                   	push   %esi
  102be7:	83 ec 20             	sub    $0x20,%esp
  102bea:	e8 b1 d6 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102bef:	05 61 cd 00 00       	add    $0xcd61,%eax
  102bf4:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102bfa:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bfd:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102c00:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c03:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c06:	89 d1                	mov    %edx,%ecx
  102c08:	89 c2                	mov    %eax,%edx
  102c0a:	89 ce                	mov    %ecx,%esi
  102c0c:	89 d7                	mov    %edx,%edi
  102c0e:	ac                   	lods   %ds:(%esi),%al
  102c0f:	ae                   	scas   %es:(%edi),%al
  102c10:	75 08                	jne    102c1a <strcmp+0x3c>
  102c12:	84 c0                	test   %al,%al
  102c14:	75 f8                	jne    102c0e <strcmp+0x30>
  102c16:	31 c0                	xor    %eax,%eax
  102c18:	eb 04                	jmp    102c1e <strcmp+0x40>
  102c1a:	19 c0                	sbb    %eax,%eax
  102c1c:	0c 01                	or     $0x1,%al
  102c1e:	89 fa                	mov    %edi,%edx
  102c20:	89 f1                	mov    %esi,%ecx
  102c22:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102c25:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102c28:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102c2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102c2e:	83 c4 20             	add    $0x20,%esp
  102c31:	5e                   	pop    %esi
  102c32:	5f                   	pop    %edi
  102c33:	5d                   	pop    %ebp
  102c34:	c3                   	ret    

00102c35 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102c35:	f3 0f 1e fb          	endbr32 
  102c39:	55                   	push   %ebp
  102c3a:	89 e5                	mov    %esp,%ebp
  102c3c:	e8 5f d6 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102c41:	05 0f cd 00 00       	add    $0xcd0f,%eax
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102c46:	eb 0c                	jmp    102c54 <strncmp+0x1f>
        n --, s1 ++, s2 ++;
  102c48:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102c4c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102c50:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102c54:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c58:	74 1a                	je     102c74 <strncmp+0x3f>
  102c5a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c5d:	0f b6 00             	movzbl (%eax),%eax
  102c60:	84 c0                	test   %al,%al
  102c62:	74 10                	je     102c74 <strncmp+0x3f>
  102c64:	8b 45 08             	mov    0x8(%ebp),%eax
  102c67:	0f b6 10             	movzbl (%eax),%edx
  102c6a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c6d:	0f b6 00             	movzbl (%eax),%eax
  102c70:	38 c2                	cmp    %al,%dl
  102c72:	74 d4                	je     102c48 <strncmp+0x13>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102c74:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c78:	74 18                	je     102c92 <strncmp+0x5d>
  102c7a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c7d:	0f b6 00             	movzbl (%eax),%eax
  102c80:	0f b6 d0             	movzbl %al,%edx
  102c83:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c86:	0f b6 00             	movzbl (%eax),%eax
  102c89:	0f b6 c0             	movzbl %al,%eax
  102c8c:	29 c2                	sub    %eax,%edx
  102c8e:	89 d0                	mov    %edx,%eax
  102c90:	eb 05                	jmp    102c97 <strncmp+0x62>
  102c92:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c97:	5d                   	pop    %ebp
  102c98:	c3                   	ret    

00102c99 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102c99:	f3 0f 1e fb          	endbr32 
  102c9d:	55                   	push   %ebp
  102c9e:	89 e5                	mov    %esp,%ebp
  102ca0:	83 ec 04             	sub    $0x4,%esp
  102ca3:	e8 f8 d5 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102ca8:	05 a8 cc 00 00       	add    $0xcca8,%eax
  102cad:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cb0:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102cb3:	eb 14                	jmp    102cc9 <strchr+0x30>
        if (*s == c) {
  102cb5:	8b 45 08             	mov    0x8(%ebp),%eax
  102cb8:	0f b6 00             	movzbl (%eax),%eax
  102cbb:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102cbe:	75 05                	jne    102cc5 <strchr+0x2c>
            return (char *)s;
  102cc0:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc3:	eb 13                	jmp    102cd8 <strchr+0x3f>
        }
        s ++;
  102cc5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102cc9:	8b 45 08             	mov    0x8(%ebp),%eax
  102ccc:	0f b6 00             	movzbl (%eax),%eax
  102ccf:	84 c0                	test   %al,%al
  102cd1:	75 e2                	jne    102cb5 <strchr+0x1c>
    }
    return NULL;
  102cd3:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102cd8:	c9                   	leave  
  102cd9:	c3                   	ret    

00102cda <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102cda:	f3 0f 1e fb          	endbr32 
  102cde:	55                   	push   %ebp
  102cdf:	89 e5                	mov    %esp,%ebp
  102ce1:	83 ec 04             	sub    $0x4,%esp
  102ce4:	e8 b7 d5 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102ce9:	05 67 cc 00 00       	add    $0xcc67,%eax
  102cee:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cf1:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102cf4:	eb 0f                	jmp    102d05 <strfind+0x2b>
        if (*s == c) {
  102cf6:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf9:	0f b6 00             	movzbl (%eax),%eax
  102cfc:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102cff:	74 10                	je     102d11 <strfind+0x37>
            break;
        }
        s ++;
  102d01:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s != '\0') {
  102d05:	8b 45 08             	mov    0x8(%ebp),%eax
  102d08:	0f b6 00             	movzbl (%eax),%eax
  102d0b:	84 c0                	test   %al,%al
  102d0d:	75 e7                	jne    102cf6 <strfind+0x1c>
  102d0f:	eb 01                	jmp    102d12 <strfind+0x38>
            break;
  102d11:	90                   	nop
    }
    return (char *)s;
  102d12:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102d15:	c9                   	leave  
  102d16:	c3                   	ret    

00102d17 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102d17:	f3 0f 1e fb          	endbr32 
  102d1b:	55                   	push   %ebp
  102d1c:	89 e5                	mov    %esp,%ebp
  102d1e:	83 ec 10             	sub    $0x10,%esp
  102d21:	e8 7a d5 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102d26:	05 2a cc 00 00       	add    $0xcc2a,%eax
    int neg = 0;
  102d2b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102d32:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102d39:	eb 04                	jmp    102d3f <strtol+0x28>
        s ++;
  102d3b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102d3f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d42:	0f b6 00             	movzbl (%eax),%eax
  102d45:	3c 20                	cmp    $0x20,%al
  102d47:	74 f2                	je     102d3b <strtol+0x24>
  102d49:	8b 45 08             	mov    0x8(%ebp),%eax
  102d4c:	0f b6 00             	movzbl (%eax),%eax
  102d4f:	3c 09                	cmp    $0x9,%al
  102d51:	74 e8                	je     102d3b <strtol+0x24>
    }

    // plus/minus sign
    if (*s == '+') {
  102d53:	8b 45 08             	mov    0x8(%ebp),%eax
  102d56:	0f b6 00             	movzbl (%eax),%eax
  102d59:	3c 2b                	cmp    $0x2b,%al
  102d5b:	75 06                	jne    102d63 <strtol+0x4c>
        s ++;
  102d5d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d61:	eb 15                	jmp    102d78 <strtol+0x61>
    }
    else if (*s == '-') {
  102d63:	8b 45 08             	mov    0x8(%ebp),%eax
  102d66:	0f b6 00             	movzbl (%eax),%eax
  102d69:	3c 2d                	cmp    $0x2d,%al
  102d6b:	75 0b                	jne    102d78 <strtol+0x61>
        s ++, neg = 1;
  102d6d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102d71:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102d78:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d7c:	74 06                	je     102d84 <strtol+0x6d>
  102d7e:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102d82:	75 24                	jne    102da8 <strtol+0x91>
  102d84:	8b 45 08             	mov    0x8(%ebp),%eax
  102d87:	0f b6 00             	movzbl (%eax),%eax
  102d8a:	3c 30                	cmp    $0x30,%al
  102d8c:	75 1a                	jne    102da8 <strtol+0x91>
  102d8e:	8b 45 08             	mov    0x8(%ebp),%eax
  102d91:	83 c0 01             	add    $0x1,%eax
  102d94:	0f b6 00             	movzbl (%eax),%eax
  102d97:	3c 78                	cmp    $0x78,%al
  102d99:	75 0d                	jne    102da8 <strtol+0x91>
        s += 2, base = 16;
  102d9b:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102d9f:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102da6:	eb 2a                	jmp    102dd2 <strtol+0xbb>
    }
    else if (base == 0 && s[0] == '0') {
  102da8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102dac:	75 17                	jne    102dc5 <strtol+0xae>
  102dae:	8b 45 08             	mov    0x8(%ebp),%eax
  102db1:	0f b6 00             	movzbl (%eax),%eax
  102db4:	3c 30                	cmp    $0x30,%al
  102db6:	75 0d                	jne    102dc5 <strtol+0xae>
        s ++, base = 8;
  102db8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102dbc:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102dc3:	eb 0d                	jmp    102dd2 <strtol+0xbb>
    }
    else if (base == 0) {
  102dc5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102dc9:	75 07                	jne    102dd2 <strtol+0xbb>
        base = 10;
  102dcb:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102dd2:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd5:	0f b6 00             	movzbl (%eax),%eax
  102dd8:	3c 2f                	cmp    $0x2f,%al
  102dda:	7e 1b                	jle    102df7 <strtol+0xe0>
  102ddc:	8b 45 08             	mov    0x8(%ebp),%eax
  102ddf:	0f b6 00             	movzbl (%eax),%eax
  102de2:	3c 39                	cmp    $0x39,%al
  102de4:	7f 11                	jg     102df7 <strtol+0xe0>
            dig = *s - '0';
  102de6:	8b 45 08             	mov    0x8(%ebp),%eax
  102de9:	0f b6 00             	movzbl (%eax),%eax
  102dec:	0f be c0             	movsbl %al,%eax
  102def:	83 e8 30             	sub    $0x30,%eax
  102df2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102df5:	eb 48                	jmp    102e3f <strtol+0x128>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102df7:	8b 45 08             	mov    0x8(%ebp),%eax
  102dfa:	0f b6 00             	movzbl (%eax),%eax
  102dfd:	3c 60                	cmp    $0x60,%al
  102dff:	7e 1b                	jle    102e1c <strtol+0x105>
  102e01:	8b 45 08             	mov    0x8(%ebp),%eax
  102e04:	0f b6 00             	movzbl (%eax),%eax
  102e07:	3c 7a                	cmp    $0x7a,%al
  102e09:	7f 11                	jg     102e1c <strtol+0x105>
            dig = *s - 'a' + 10;
  102e0b:	8b 45 08             	mov    0x8(%ebp),%eax
  102e0e:	0f b6 00             	movzbl (%eax),%eax
  102e11:	0f be c0             	movsbl %al,%eax
  102e14:	83 e8 57             	sub    $0x57,%eax
  102e17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e1a:	eb 23                	jmp    102e3f <strtol+0x128>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102e1c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1f:	0f b6 00             	movzbl (%eax),%eax
  102e22:	3c 40                	cmp    $0x40,%al
  102e24:	7e 3c                	jle    102e62 <strtol+0x14b>
  102e26:	8b 45 08             	mov    0x8(%ebp),%eax
  102e29:	0f b6 00             	movzbl (%eax),%eax
  102e2c:	3c 5a                	cmp    $0x5a,%al
  102e2e:	7f 32                	jg     102e62 <strtol+0x14b>
            dig = *s - 'A' + 10;
  102e30:	8b 45 08             	mov    0x8(%ebp),%eax
  102e33:	0f b6 00             	movzbl (%eax),%eax
  102e36:	0f be c0             	movsbl %al,%eax
  102e39:	83 e8 37             	sub    $0x37,%eax
  102e3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102e3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e42:	3b 45 10             	cmp    0x10(%ebp),%eax
  102e45:	7d 1a                	jge    102e61 <strtol+0x14a>
            break;
        }
        s ++, val = (val * base) + dig;
  102e47:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102e4b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e4e:	0f af 45 10          	imul   0x10(%ebp),%eax
  102e52:	89 c2                	mov    %eax,%edx
  102e54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e57:	01 d0                	add    %edx,%eax
  102e59:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102e5c:	e9 71 ff ff ff       	jmp    102dd2 <strtol+0xbb>
            break;
  102e61:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102e62:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102e66:	74 08                	je     102e70 <strtol+0x159>
        *endptr = (char *) s;
  102e68:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e6b:	8b 55 08             	mov    0x8(%ebp),%edx
  102e6e:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102e70:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102e74:	74 07                	je     102e7d <strtol+0x166>
  102e76:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e79:	f7 d8                	neg    %eax
  102e7b:	eb 03                	jmp    102e80 <strtol+0x169>
  102e7d:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102e80:	c9                   	leave  
  102e81:	c3                   	ret    

00102e82 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102e82:	f3 0f 1e fb          	endbr32 
  102e86:	55                   	push   %ebp
  102e87:	89 e5                	mov    %esp,%ebp
  102e89:	57                   	push   %edi
  102e8a:	83 ec 24             	sub    $0x24,%esp
  102e8d:	e8 0e d4 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102e92:	05 be ca 00 00       	add    $0xcabe,%eax
  102e97:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e9a:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102e9d:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102ea1:	8b 55 08             	mov    0x8(%ebp),%edx
  102ea4:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102ea7:	88 45 f7             	mov    %al,-0x9(%ebp)
  102eaa:	8b 45 10             	mov    0x10(%ebp),%eax
  102ead:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102eb0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102eb3:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102eb7:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102eba:	89 d7                	mov    %edx,%edi
  102ebc:	f3 aa                	rep stos %al,%es:(%edi)
  102ebe:	89 fa                	mov    %edi,%edx
  102ec0:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102ec3:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102ec6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102ec9:	83 c4 24             	add    $0x24,%esp
  102ecc:	5f                   	pop    %edi
  102ecd:	5d                   	pop    %ebp
  102ece:	c3                   	ret    

00102ecf <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102ecf:	f3 0f 1e fb          	endbr32 
  102ed3:	55                   	push   %ebp
  102ed4:	89 e5                	mov    %esp,%ebp
  102ed6:	57                   	push   %edi
  102ed7:	56                   	push   %esi
  102ed8:	53                   	push   %ebx
  102ed9:	83 ec 30             	sub    $0x30,%esp
  102edc:	e8 bf d3 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102ee1:	05 6f ca 00 00       	add    $0xca6f,%eax
  102ee6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ee9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102eec:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eef:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102ef2:	8b 45 10             	mov    0x10(%ebp),%eax
  102ef5:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102ef8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102efb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102efe:	73 42                	jae    102f42 <memmove+0x73>
  102f00:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f03:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f06:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f09:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f0c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f0f:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102f12:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102f15:	c1 e8 02             	shr    $0x2,%eax
  102f18:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102f1a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102f1d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f20:	89 d7                	mov    %edx,%edi
  102f22:	89 c6                	mov    %eax,%esi
  102f24:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102f26:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102f29:	83 e1 03             	and    $0x3,%ecx
  102f2c:	74 02                	je     102f30 <memmove+0x61>
  102f2e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102f30:	89 f0                	mov    %esi,%eax
  102f32:	89 fa                	mov    %edi,%edx
  102f34:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102f37:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102f3a:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102f3d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  102f40:	eb 36                	jmp    102f78 <memmove+0xa9>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102f42:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f45:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f48:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f4b:	01 c2                	add    %eax,%edx
  102f4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f50:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102f53:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f56:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102f59:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f5c:	89 c1                	mov    %eax,%ecx
  102f5e:	89 d8                	mov    %ebx,%eax
  102f60:	89 d6                	mov    %edx,%esi
  102f62:	89 c7                	mov    %eax,%edi
  102f64:	fd                   	std    
  102f65:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102f67:	fc                   	cld    
  102f68:	89 f8                	mov    %edi,%eax
  102f6a:	89 f2                	mov    %esi,%edx
  102f6c:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102f6f:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102f72:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102f75:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102f78:	83 c4 30             	add    $0x30,%esp
  102f7b:	5b                   	pop    %ebx
  102f7c:	5e                   	pop    %esi
  102f7d:	5f                   	pop    %edi
  102f7e:	5d                   	pop    %ebp
  102f7f:	c3                   	ret    

00102f80 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102f80:	f3 0f 1e fb          	endbr32 
  102f84:	55                   	push   %ebp
  102f85:	89 e5                	mov    %esp,%ebp
  102f87:	57                   	push   %edi
  102f88:	56                   	push   %esi
  102f89:	83 ec 20             	sub    $0x20,%esp
  102f8c:	e8 0f d3 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102f91:	05 bf c9 00 00       	add    $0xc9bf,%eax
  102f96:	8b 45 08             	mov    0x8(%ebp),%eax
  102f99:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f9c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fa2:	8b 45 10             	mov    0x10(%ebp),%eax
  102fa5:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102fa8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fab:	c1 e8 02             	shr    $0x2,%eax
  102fae:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102fb0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fb6:	89 d7                	mov    %edx,%edi
  102fb8:	89 c6                	mov    %eax,%esi
  102fba:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102fbc:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102fbf:	83 e1 03             	and    $0x3,%ecx
  102fc2:	74 02                	je     102fc6 <memcpy+0x46>
  102fc4:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102fc6:	89 f0                	mov    %esi,%eax
  102fc8:	89 fa                	mov    %edi,%edx
  102fca:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102fcd:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102fd0:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102fd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102fd6:	83 c4 20             	add    $0x20,%esp
  102fd9:	5e                   	pop    %esi
  102fda:	5f                   	pop    %edi
  102fdb:	5d                   	pop    %ebp
  102fdc:	c3                   	ret    

00102fdd <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102fdd:	f3 0f 1e fb          	endbr32 
  102fe1:	55                   	push   %ebp
  102fe2:	89 e5                	mov    %esp,%ebp
  102fe4:	83 ec 10             	sub    $0x10,%esp
  102fe7:	e8 b4 d2 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  102fec:	05 64 c9 00 00       	add    $0xc964,%eax
    const char *s1 = (const char *)v1;
  102ff1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff4:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102ff7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ffa:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102ffd:	eb 30                	jmp    10302f <memcmp+0x52>
        if (*s1 != *s2) {
  102fff:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103002:	0f b6 10             	movzbl (%eax),%edx
  103005:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103008:	0f b6 00             	movzbl (%eax),%eax
  10300b:	38 c2                	cmp    %al,%dl
  10300d:	74 18                	je     103027 <memcmp+0x4a>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10300f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103012:	0f b6 00             	movzbl (%eax),%eax
  103015:	0f b6 d0             	movzbl %al,%edx
  103018:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10301b:	0f b6 00             	movzbl (%eax),%eax
  10301e:	0f b6 c0             	movzbl %al,%eax
  103021:	29 c2                	sub    %eax,%edx
  103023:	89 d0                	mov    %edx,%eax
  103025:	eb 1a                	jmp    103041 <memcmp+0x64>
        }
        s1 ++, s2 ++;
  103027:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10302b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    while (n -- > 0) {
  10302f:	8b 45 10             	mov    0x10(%ebp),%eax
  103032:	8d 50 ff             	lea    -0x1(%eax),%edx
  103035:	89 55 10             	mov    %edx,0x10(%ebp)
  103038:	85 c0                	test   %eax,%eax
  10303a:	75 c3                	jne    102fff <memcmp+0x22>
    }
    return 0;
  10303c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103041:	c9                   	leave  
  103042:	c3                   	ret    

00103043 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  103043:	f3 0f 1e fb          	endbr32 
  103047:	55                   	push   %ebp
  103048:	89 e5                	mov    %esp,%ebp
  10304a:	53                   	push   %ebx
  10304b:	83 ec 34             	sub    $0x34,%esp
  10304e:	e8 51 d2 ff ff       	call   1002a4 <__x86.get_pc_thunk.bx>
  103053:	81 c3 fd c8 00 00    	add    $0xc8fd,%ebx
  103059:	8b 45 10             	mov    0x10(%ebp),%eax
  10305c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10305f:	8b 45 14             	mov    0x14(%ebp),%eax
  103062:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  103065:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103068:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10306b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10306e:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  103071:	8b 45 18             	mov    0x18(%ebp),%eax
  103074:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103077:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10307a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10307d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103080:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103083:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103086:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103089:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10308d:	74 1c                	je     1030ab <printnum+0x68>
  10308f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103092:	ba 00 00 00 00       	mov    $0x0,%edx
  103097:	f7 75 e4             	divl   -0x1c(%ebp)
  10309a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10309d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030a0:	ba 00 00 00 00       	mov    $0x0,%edx
  1030a5:	f7 75 e4             	divl   -0x1c(%ebp)
  1030a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1030ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030b1:	f7 75 e4             	divl   -0x1c(%ebp)
  1030b4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1030b7:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1030ba:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1030bd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1030c0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1030c3:	89 55 ec             	mov    %edx,-0x14(%ebp)
  1030c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1030c9:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  1030cc:	8b 45 18             	mov    0x18(%ebp),%eax
  1030cf:	ba 00 00 00 00       	mov    $0x0,%edx
  1030d4:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  1030d7:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  1030da:	19 d1                	sbb    %edx,%ecx
  1030dc:	72 37                	jb     103115 <printnum+0xd2>
        printnum(putch, putdat, result, base, width - 1, padc);
  1030de:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1030e1:	83 e8 01             	sub    $0x1,%eax
  1030e4:	83 ec 04             	sub    $0x4,%esp
  1030e7:	ff 75 20             	pushl  0x20(%ebp)
  1030ea:	50                   	push   %eax
  1030eb:	ff 75 18             	pushl  0x18(%ebp)
  1030ee:	ff 75 ec             	pushl  -0x14(%ebp)
  1030f1:	ff 75 e8             	pushl  -0x18(%ebp)
  1030f4:	ff 75 0c             	pushl  0xc(%ebp)
  1030f7:	ff 75 08             	pushl  0x8(%ebp)
  1030fa:	e8 44 ff ff ff       	call   103043 <printnum>
  1030ff:	83 c4 20             	add    $0x20,%esp
  103102:	eb 1b                	jmp    10311f <printnum+0xdc>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  103104:	83 ec 08             	sub    $0x8,%esp
  103107:	ff 75 0c             	pushl  0xc(%ebp)
  10310a:	ff 75 20             	pushl  0x20(%ebp)
  10310d:	8b 45 08             	mov    0x8(%ebp),%eax
  103110:	ff d0                	call   *%eax
  103112:	83 c4 10             	add    $0x10,%esp
        while (-- width > 0)
  103115:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  103119:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  10311d:	7f e5                	jg     103104 <printnum+0xc1>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  10311f:	8d 93 6e 44 ff ff    	lea    -0xbb92(%ebx),%edx
  103125:	8b 45 d8             	mov    -0x28(%ebp),%eax
  103128:	01 d0                	add    %edx,%eax
  10312a:	0f b6 00             	movzbl (%eax),%eax
  10312d:	0f be c0             	movsbl %al,%eax
  103130:	83 ec 08             	sub    $0x8,%esp
  103133:	ff 75 0c             	pushl  0xc(%ebp)
  103136:	50                   	push   %eax
  103137:	8b 45 08             	mov    0x8(%ebp),%eax
  10313a:	ff d0                	call   *%eax
  10313c:	83 c4 10             	add    $0x10,%esp
}
  10313f:	90                   	nop
  103140:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103143:	c9                   	leave  
  103144:	c3                   	ret    

00103145 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103145:	f3 0f 1e fb          	endbr32 
  103149:	55                   	push   %ebp
  10314a:	89 e5                	mov    %esp,%ebp
  10314c:	e8 4f d1 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  103151:	05 ff c7 00 00       	add    $0xc7ff,%eax
    if (lflag >= 2) {
  103156:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10315a:	7e 14                	jle    103170 <getuint+0x2b>
        return va_arg(*ap, unsigned long long);
  10315c:	8b 45 08             	mov    0x8(%ebp),%eax
  10315f:	8b 00                	mov    (%eax),%eax
  103161:	8d 48 08             	lea    0x8(%eax),%ecx
  103164:	8b 55 08             	mov    0x8(%ebp),%edx
  103167:	89 0a                	mov    %ecx,(%edx)
  103169:	8b 50 04             	mov    0x4(%eax),%edx
  10316c:	8b 00                	mov    (%eax),%eax
  10316e:	eb 30                	jmp    1031a0 <getuint+0x5b>
    }
    else if (lflag) {
  103170:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103174:	74 16                	je     10318c <getuint+0x47>
        return va_arg(*ap, unsigned long);
  103176:	8b 45 08             	mov    0x8(%ebp),%eax
  103179:	8b 00                	mov    (%eax),%eax
  10317b:	8d 48 04             	lea    0x4(%eax),%ecx
  10317e:	8b 55 08             	mov    0x8(%ebp),%edx
  103181:	89 0a                	mov    %ecx,(%edx)
  103183:	8b 00                	mov    (%eax),%eax
  103185:	ba 00 00 00 00       	mov    $0x0,%edx
  10318a:	eb 14                	jmp    1031a0 <getuint+0x5b>
    }
    else {
        return va_arg(*ap, unsigned int);
  10318c:	8b 45 08             	mov    0x8(%ebp),%eax
  10318f:	8b 00                	mov    (%eax),%eax
  103191:	8d 48 04             	lea    0x4(%eax),%ecx
  103194:	8b 55 08             	mov    0x8(%ebp),%edx
  103197:	89 0a                	mov    %ecx,(%edx)
  103199:	8b 00                	mov    (%eax),%eax
  10319b:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  1031a0:	5d                   	pop    %ebp
  1031a1:	c3                   	ret    

001031a2 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1031a2:	f3 0f 1e fb          	endbr32 
  1031a6:	55                   	push   %ebp
  1031a7:	89 e5                	mov    %esp,%ebp
  1031a9:	e8 f2 d0 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  1031ae:	05 a2 c7 00 00       	add    $0xc7a2,%eax
    if (lflag >= 2) {
  1031b3:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1031b7:	7e 14                	jle    1031cd <getint+0x2b>
        return va_arg(*ap, long long);
  1031b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1031bc:	8b 00                	mov    (%eax),%eax
  1031be:	8d 48 08             	lea    0x8(%eax),%ecx
  1031c1:	8b 55 08             	mov    0x8(%ebp),%edx
  1031c4:	89 0a                	mov    %ecx,(%edx)
  1031c6:	8b 50 04             	mov    0x4(%eax),%edx
  1031c9:	8b 00                	mov    (%eax),%eax
  1031cb:	eb 28                	jmp    1031f5 <getint+0x53>
    }
    else if (lflag) {
  1031cd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1031d1:	74 12                	je     1031e5 <getint+0x43>
        return va_arg(*ap, long);
  1031d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d6:	8b 00                	mov    (%eax),%eax
  1031d8:	8d 48 04             	lea    0x4(%eax),%ecx
  1031db:	8b 55 08             	mov    0x8(%ebp),%edx
  1031de:	89 0a                	mov    %ecx,(%edx)
  1031e0:	8b 00                	mov    (%eax),%eax
  1031e2:	99                   	cltd   
  1031e3:	eb 10                	jmp    1031f5 <getint+0x53>
    }
    else {
        return va_arg(*ap, int);
  1031e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1031e8:	8b 00                	mov    (%eax),%eax
  1031ea:	8d 48 04             	lea    0x4(%eax),%ecx
  1031ed:	8b 55 08             	mov    0x8(%ebp),%edx
  1031f0:	89 0a                	mov    %ecx,(%edx)
  1031f2:	8b 00                	mov    (%eax),%eax
  1031f4:	99                   	cltd   
    }
}
  1031f5:	5d                   	pop    %ebp
  1031f6:	c3                   	ret    

001031f7 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1031f7:	f3 0f 1e fb          	endbr32 
  1031fb:	55                   	push   %ebp
  1031fc:	89 e5                	mov    %esp,%ebp
  1031fe:	83 ec 18             	sub    $0x18,%esp
  103201:	e8 9a d0 ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  103206:	05 4a c7 00 00       	add    $0xc74a,%eax
    va_list ap;

    va_start(ap, fmt);
  10320b:	8d 45 14             	lea    0x14(%ebp),%eax
  10320e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  103211:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103214:	50                   	push   %eax
  103215:	ff 75 10             	pushl  0x10(%ebp)
  103218:	ff 75 0c             	pushl  0xc(%ebp)
  10321b:	ff 75 08             	pushl  0x8(%ebp)
  10321e:	e8 06 00 00 00       	call   103229 <vprintfmt>
  103223:	83 c4 10             	add    $0x10,%esp
    va_end(ap);
}
  103226:	90                   	nop
  103227:	c9                   	leave  
  103228:	c3                   	ret    

00103229 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  103229:	f3 0f 1e fb          	endbr32 
  10322d:	55                   	push   %ebp
  10322e:	89 e5                	mov    %esp,%ebp
  103230:	57                   	push   %edi
  103231:	56                   	push   %esi
  103232:	53                   	push   %ebx
  103233:	83 ec 2c             	sub    $0x2c,%esp
  103236:	e8 99 04 00 00       	call   1036d4 <__x86.get_pc_thunk.di>
  10323b:	81 c7 15 c7 00 00    	add    $0xc715,%edi
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103241:	eb 17                	jmp    10325a <vprintfmt+0x31>
            if (ch == '\0') {
  103243:	85 db                	test   %ebx,%ebx
  103245:	0f 84 9b 03 00 00    	je     1035e6 <.L22+0x2d>
                return;
            }
            putch(ch, putdat);
  10324b:	83 ec 08             	sub    $0x8,%esp
  10324e:	ff 75 0c             	pushl  0xc(%ebp)
  103251:	53                   	push   %ebx
  103252:	8b 45 08             	mov    0x8(%ebp),%eax
  103255:	ff d0                	call   *%eax
  103257:	83 c4 10             	add    $0x10,%esp
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10325a:	8b 45 10             	mov    0x10(%ebp),%eax
  10325d:	8d 50 01             	lea    0x1(%eax),%edx
  103260:	89 55 10             	mov    %edx,0x10(%ebp)
  103263:	0f b6 00             	movzbl (%eax),%eax
  103266:	0f b6 d8             	movzbl %al,%ebx
  103269:	83 fb 25             	cmp    $0x25,%ebx
  10326c:	75 d5                	jne    103243 <vprintfmt+0x1a>
        }

        // Process a %-escape sequence
        char padc = ' ';
  10326e:	c6 45 cb 20          	movb   $0x20,-0x35(%ebp)
        width = precision = -1;
  103272:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
  103279:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10327c:	89 45 d8             	mov    %eax,-0x28(%ebp)
        lflag = altflag = 0;
  10327f:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  103286:	8b 45 cc             	mov    -0x34(%ebp),%eax
  103289:	89 45 d0             	mov    %eax,-0x30(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10328c:	8b 45 10             	mov    0x10(%ebp),%eax
  10328f:	8d 50 01             	lea    0x1(%eax),%edx
  103292:	89 55 10             	mov    %edx,0x10(%ebp)
  103295:	0f b6 00             	movzbl (%eax),%eax
  103298:	0f b6 d8             	movzbl %al,%ebx
  10329b:	8d 43 dd             	lea    -0x23(%ebx),%eax
  10329e:	83 f8 55             	cmp    $0x55,%eax
  1032a1:	0f 87 12 03 00 00    	ja     1035b9 <.L22>
  1032a7:	c1 e0 02             	shl    $0x2,%eax
  1032aa:	8b 84 38 94 44 ff ff 	mov    -0xbb6c(%eax,%edi,1),%eax
  1032b1:	01 f8                	add    %edi,%eax
  1032b3:	3e ff e0             	notrack jmp *%eax

001032b6 <.L36>:

        // flag to pad on the right
        case '-':
            padc = '-';
  1032b6:	c6 45 cb 2d          	movb   $0x2d,-0x35(%ebp)
            goto reswitch;
  1032ba:	eb d0                	jmp    10328c <vprintfmt+0x63>

001032bc <.L34>:

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1032bc:	c6 45 cb 30          	movb   $0x30,-0x35(%ebp)
            goto reswitch;
  1032c0:	eb ca                	jmp    10328c <vprintfmt+0x63>

001032c2 <.L33>:

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1032c2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
                precision = precision * 10 + ch - '0';
  1032c9:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1032cc:	89 d0                	mov    %edx,%eax
  1032ce:	c1 e0 02             	shl    $0x2,%eax
  1032d1:	01 d0                	add    %edx,%eax
  1032d3:	01 c0                	add    %eax,%eax
  1032d5:	01 d8                	add    %ebx,%eax
  1032d7:	83 e8 30             	sub    $0x30,%eax
  1032da:	89 45 d4             	mov    %eax,-0x2c(%ebp)
                ch = *fmt;
  1032dd:	8b 45 10             	mov    0x10(%ebp),%eax
  1032e0:	0f b6 00             	movzbl (%eax),%eax
  1032e3:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1032e6:	83 fb 2f             	cmp    $0x2f,%ebx
  1032e9:	7e 39                	jle    103324 <.L39+0xc>
  1032eb:	83 fb 39             	cmp    $0x39,%ebx
  1032ee:	7f 34                	jg     103324 <.L39+0xc>
            for (precision = 0; ; ++ fmt) {
  1032f0:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
  1032f4:	eb d3                	jmp    1032c9 <.L33+0x7>

001032f6 <.L37>:
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1032f6:	8b 45 14             	mov    0x14(%ebp),%eax
  1032f9:	8d 50 04             	lea    0x4(%eax),%edx
  1032fc:	89 55 14             	mov    %edx,0x14(%ebp)
  1032ff:	8b 00                	mov    (%eax),%eax
  103301:	89 45 d4             	mov    %eax,-0x2c(%ebp)
            goto process_precision;
  103304:	eb 1f                	jmp    103325 <.L39+0xd>

00103306 <.L35>:

        case '.':
            if (width < 0)
  103306:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  10330a:	79 80                	jns    10328c <vprintfmt+0x63>
                width = 0;
  10330c:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
            goto reswitch;
  103313:	e9 74 ff ff ff       	jmp    10328c <vprintfmt+0x63>

00103318 <.L39>:

        case '#':
            altflag = 1;
  103318:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
            goto reswitch;
  10331f:	e9 68 ff ff ff       	jmp    10328c <vprintfmt+0x63>
            goto process_precision;
  103324:	90                   	nop

        process_precision:
            if (width < 0)
  103325:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  103329:	0f 89 5d ff ff ff    	jns    10328c <vprintfmt+0x63>
                width = precision, precision = -1;
  10332f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  103332:	89 45 d8             	mov    %eax,-0x28(%ebp)
  103335:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
            goto reswitch;
  10333c:	e9 4b ff ff ff       	jmp    10328c <vprintfmt+0x63>

00103341 <.L29>:

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103341:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
            goto reswitch;
  103345:	e9 42 ff ff ff       	jmp    10328c <vprintfmt+0x63>

0010334a <.L32>:

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  10334a:	8b 45 14             	mov    0x14(%ebp),%eax
  10334d:	8d 50 04             	lea    0x4(%eax),%edx
  103350:	89 55 14             	mov    %edx,0x14(%ebp)
  103353:	8b 00                	mov    (%eax),%eax
  103355:	83 ec 08             	sub    $0x8,%esp
  103358:	ff 75 0c             	pushl  0xc(%ebp)
  10335b:	50                   	push   %eax
  10335c:	8b 45 08             	mov    0x8(%ebp),%eax
  10335f:	ff d0                	call   *%eax
  103361:	83 c4 10             	add    $0x10,%esp
            break;
  103364:	e9 78 02 00 00       	jmp    1035e1 <.L22+0x28>

00103369 <.L30>:

        // error message
        case 'e':
            err = va_arg(ap, int);
  103369:	8b 45 14             	mov    0x14(%ebp),%eax
  10336c:	8d 50 04             	lea    0x4(%eax),%edx
  10336f:	89 55 14             	mov    %edx,0x14(%ebp)
  103372:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103374:	85 db                	test   %ebx,%ebx
  103376:	79 02                	jns    10337a <.L30+0x11>
                err = -err;
  103378:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  10337a:	83 fb 06             	cmp    $0x6,%ebx
  10337d:	7f 0b                	jg     10338a <.L30+0x21>
  10337f:	8b b4 9f 40 01 00 00 	mov    0x140(%edi,%ebx,4),%esi
  103386:	85 f6                	test   %esi,%esi
  103388:	75 1b                	jne    1033a5 <.L30+0x3c>
                printfmt(putch, putdat, "error %d", err);
  10338a:	53                   	push   %ebx
  10338b:	8d 87 7f 44 ff ff    	lea    -0xbb81(%edi),%eax
  103391:	50                   	push   %eax
  103392:	ff 75 0c             	pushl  0xc(%ebp)
  103395:	ff 75 08             	pushl  0x8(%ebp)
  103398:	e8 5a fe ff ff       	call   1031f7 <printfmt>
  10339d:	83 c4 10             	add    $0x10,%esp
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  1033a0:	e9 3c 02 00 00       	jmp    1035e1 <.L22+0x28>
                printfmt(putch, putdat, "%s", p);
  1033a5:	56                   	push   %esi
  1033a6:	8d 87 88 44 ff ff    	lea    -0xbb78(%edi),%eax
  1033ac:	50                   	push   %eax
  1033ad:	ff 75 0c             	pushl  0xc(%ebp)
  1033b0:	ff 75 08             	pushl  0x8(%ebp)
  1033b3:	e8 3f fe ff ff       	call   1031f7 <printfmt>
  1033b8:	83 c4 10             	add    $0x10,%esp
            break;
  1033bb:	e9 21 02 00 00       	jmp    1035e1 <.L22+0x28>

001033c0 <.L26>:

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1033c0:	8b 45 14             	mov    0x14(%ebp),%eax
  1033c3:	8d 50 04             	lea    0x4(%eax),%edx
  1033c6:	89 55 14             	mov    %edx,0x14(%ebp)
  1033c9:	8b 30                	mov    (%eax),%esi
  1033cb:	85 f6                	test   %esi,%esi
  1033cd:	75 06                	jne    1033d5 <.L26+0x15>
                p = "(null)";
  1033cf:	8d b7 8b 44 ff ff    	lea    -0xbb75(%edi),%esi
            }
            if (width > 0 && padc != '-') {
  1033d5:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  1033d9:	7e 78                	jle    103453 <.L26+0x93>
  1033db:	80 7d cb 2d          	cmpb   $0x2d,-0x35(%ebp)
  1033df:	74 72                	je     103453 <.L26+0x93>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1033e1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1033e4:	83 ec 08             	sub    $0x8,%esp
  1033e7:	50                   	push   %eax
  1033e8:	56                   	push   %esi
  1033e9:	89 fb                	mov    %edi,%ebx
  1033eb:	e8 1b f7 ff ff       	call   102b0b <strnlen>
  1033f0:	83 c4 10             	add    $0x10,%esp
  1033f3:	8b 55 d8             	mov    -0x28(%ebp),%edx
  1033f6:	29 c2                	sub    %eax,%edx
  1033f8:	89 d0                	mov    %edx,%eax
  1033fa:	89 45 d8             	mov    %eax,-0x28(%ebp)
  1033fd:	eb 17                	jmp    103416 <.L26+0x56>
                    putch(padc, putdat);
  1033ff:	0f be 45 cb          	movsbl -0x35(%ebp),%eax
  103403:	83 ec 08             	sub    $0x8,%esp
  103406:	ff 75 0c             	pushl  0xc(%ebp)
  103409:	50                   	push   %eax
  10340a:	8b 45 08             	mov    0x8(%ebp),%eax
  10340d:	ff d0                	call   *%eax
  10340f:	83 c4 10             	add    $0x10,%esp
                for (width -= strnlen(p, precision); width > 0; width --) {
  103412:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  103416:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  10341a:	7f e3                	jg     1033ff <.L26+0x3f>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10341c:	eb 35                	jmp    103453 <.L26+0x93>
                if (altflag && (ch < ' ' || ch > '~')) {
  10341e:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  103422:	74 1c                	je     103440 <.L26+0x80>
  103424:	83 fb 1f             	cmp    $0x1f,%ebx
  103427:	7e 05                	jle    10342e <.L26+0x6e>
  103429:	83 fb 7e             	cmp    $0x7e,%ebx
  10342c:	7e 12                	jle    103440 <.L26+0x80>
                    putch('?', putdat);
  10342e:	83 ec 08             	sub    $0x8,%esp
  103431:	ff 75 0c             	pushl  0xc(%ebp)
  103434:	6a 3f                	push   $0x3f
  103436:	8b 45 08             	mov    0x8(%ebp),%eax
  103439:	ff d0                	call   *%eax
  10343b:	83 c4 10             	add    $0x10,%esp
  10343e:	eb 0f                	jmp    10344f <.L26+0x8f>
                }
                else {
                    putch(ch, putdat);
  103440:	83 ec 08             	sub    $0x8,%esp
  103443:	ff 75 0c             	pushl  0xc(%ebp)
  103446:	53                   	push   %ebx
  103447:	8b 45 08             	mov    0x8(%ebp),%eax
  10344a:	ff d0                	call   *%eax
  10344c:	83 c4 10             	add    $0x10,%esp
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10344f:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  103453:	89 f0                	mov    %esi,%eax
  103455:	8d 70 01             	lea    0x1(%eax),%esi
  103458:	0f b6 00             	movzbl (%eax),%eax
  10345b:	0f be d8             	movsbl %al,%ebx
  10345e:	85 db                	test   %ebx,%ebx
  103460:	74 26                	je     103488 <.L26+0xc8>
  103462:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103466:	78 b6                	js     10341e <.L26+0x5e>
  103468:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  10346c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103470:	79 ac                	jns    10341e <.L26+0x5e>
                }
            }
            for (; width > 0; width --) {
  103472:	eb 14                	jmp    103488 <.L26+0xc8>
                putch(' ', putdat);
  103474:	83 ec 08             	sub    $0x8,%esp
  103477:	ff 75 0c             	pushl  0xc(%ebp)
  10347a:	6a 20                	push   $0x20
  10347c:	8b 45 08             	mov    0x8(%ebp),%eax
  10347f:	ff d0                	call   *%eax
  103481:	83 c4 10             	add    $0x10,%esp
            for (; width > 0; width --) {
  103484:	83 6d d8 01          	subl   $0x1,-0x28(%ebp)
  103488:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  10348c:	7f e6                	jg     103474 <.L26+0xb4>
            }
            break;
  10348e:	e9 4e 01 00 00       	jmp    1035e1 <.L22+0x28>

00103493 <.L31>:

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103493:	83 ec 08             	sub    $0x8,%esp
  103496:	ff 75 d0             	pushl  -0x30(%ebp)
  103499:	8d 45 14             	lea    0x14(%ebp),%eax
  10349c:	50                   	push   %eax
  10349d:	e8 00 fd ff ff       	call   1031a2 <getint>
  1034a2:	83 c4 10             	add    $0x10,%esp
  1034a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1034a8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            if ((long long)num < 0) {
  1034ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1034ae:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1034b1:	85 d2                	test   %edx,%edx
  1034b3:	79 23                	jns    1034d8 <.L31+0x45>
                putch('-', putdat);
  1034b5:	83 ec 08             	sub    $0x8,%esp
  1034b8:	ff 75 0c             	pushl  0xc(%ebp)
  1034bb:	6a 2d                	push   $0x2d
  1034bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c0:	ff d0                	call   *%eax
  1034c2:	83 c4 10             	add    $0x10,%esp
                num = -(long long)num;
  1034c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1034c8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1034cb:	f7 d8                	neg    %eax
  1034cd:	83 d2 00             	adc    $0x0,%edx
  1034d0:	f7 da                	neg    %edx
  1034d2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1034d5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            }
            base = 10;
  1034d8:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
            goto number;
  1034df:	e9 9f 00 00 00       	jmp    103583 <.L23+0x1f>

001034e4 <.L25>:

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1034e4:	83 ec 08             	sub    $0x8,%esp
  1034e7:	ff 75 d0             	pushl  -0x30(%ebp)
  1034ea:	8d 45 14             	lea    0x14(%ebp),%eax
  1034ed:	50                   	push   %eax
  1034ee:	e8 52 fc ff ff       	call   103145 <getuint>
  1034f3:	83 c4 10             	add    $0x10,%esp
  1034f6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1034f9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 10;
  1034fc:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
            goto number;
  103503:	eb 7e                	jmp    103583 <.L23+0x1f>

00103505 <.L28>:

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103505:	83 ec 08             	sub    $0x8,%esp
  103508:	ff 75 d0             	pushl  -0x30(%ebp)
  10350b:	8d 45 14             	lea    0x14(%ebp),%eax
  10350e:	50                   	push   %eax
  10350f:	e8 31 fc ff ff       	call   103145 <getuint>
  103514:	83 c4 10             	add    $0x10,%esp
  103517:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10351a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 8;
  10351d:	c7 45 dc 08 00 00 00 	movl   $0x8,-0x24(%ebp)
            goto number;
  103524:	eb 5d                	jmp    103583 <.L23+0x1f>

00103526 <.L27>:

        // pointer
        case 'p':
            putch('0', putdat);
  103526:	83 ec 08             	sub    $0x8,%esp
  103529:	ff 75 0c             	pushl  0xc(%ebp)
  10352c:	6a 30                	push   $0x30
  10352e:	8b 45 08             	mov    0x8(%ebp),%eax
  103531:	ff d0                	call   *%eax
  103533:	83 c4 10             	add    $0x10,%esp
            putch('x', putdat);
  103536:	83 ec 08             	sub    $0x8,%esp
  103539:	ff 75 0c             	pushl  0xc(%ebp)
  10353c:	6a 78                	push   $0x78
  10353e:	8b 45 08             	mov    0x8(%ebp),%eax
  103541:	ff d0                	call   *%eax
  103543:	83 c4 10             	add    $0x10,%esp
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103546:	8b 45 14             	mov    0x14(%ebp),%eax
  103549:	8d 50 04             	lea    0x4(%eax),%edx
  10354c:	89 55 14             	mov    %edx,0x14(%ebp)
  10354f:	8b 00                	mov    (%eax),%eax
  103551:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103554:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
            base = 16;
  10355b:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
            goto number;
  103562:	eb 1f                	jmp    103583 <.L23+0x1f>

00103564 <.L23>:

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103564:	83 ec 08             	sub    $0x8,%esp
  103567:	ff 75 d0             	pushl  -0x30(%ebp)
  10356a:	8d 45 14             	lea    0x14(%ebp),%eax
  10356d:	50                   	push   %eax
  10356e:	e8 d2 fb ff ff       	call   103145 <getuint>
  103573:	83 c4 10             	add    $0x10,%esp
  103576:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103579:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            base = 16;
  10357c:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103583:	0f be 55 cb          	movsbl -0x35(%ebp),%edx
  103587:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10358a:	83 ec 04             	sub    $0x4,%esp
  10358d:	52                   	push   %edx
  10358e:	ff 75 d8             	pushl  -0x28(%ebp)
  103591:	50                   	push   %eax
  103592:	ff 75 e4             	pushl  -0x1c(%ebp)
  103595:	ff 75 e0             	pushl  -0x20(%ebp)
  103598:	ff 75 0c             	pushl  0xc(%ebp)
  10359b:	ff 75 08             	pushl  0x8(%ebp)
  10359e:	e8 a0 fa ff ff       	call   103043 <printnum>
  1035a3:	83 c4 20             	add    $0x20,%esp
            break;
  1035a6:	eb 39                	jmp    1035e1 <.L22+0x28>

001035a8 <.L38>:

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1035a8:	83 ec 08             	sub    $0x8,%esp
  1035ab:	ff 75 0c             	pushl  0xc(%ebp)
  1035ae:	53                   	push   %ebx
  1035af:	8b 45 08             	mov    0x8(%ebp),%eax
  1035b2:	ff d0                	call   *%eax
  1035b4:	83 c4 10             	add    $0x10,%esp
            break;
  1035b7:	eb 28                	jmp    1035e1 <.L22+0x28>

001035b9 <.L22>:

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1035b9:	83 ec 08             	sub    $0x8,%esp
  1035bc:	ff 75 0c             	pushl  0xc(%ebp)
  1035bf:	6a 25                	push   $0x25
  1035c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1035c4:	ff d0                	call   *%eax
  1035c6:	83 c4 10             	add    $0x10,%esp
            for (fmt --; fmt[-1] != '%'; fmt --)
  1035c9:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1035cd:	eb 04                	jmp    1035d3 <.L22+0x1a>
  1035cf:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1035d3:	8b 45 10             	mov    0x10(%ebp),%eax
  1035d6:	83 e8 01             	sub    $0x1,%eax
  1035d9:	0f b6 00             	movzbl (%eax),%eax
  1035dc:	3c 25                	cmp    $0x25,%al
  1035de:	75 ef                	jne    1035cf <.L22+0x16>
                /* do nothing */;
            break;
  1035e0:	90                   	nop
    while (1) {
  1035e1:	e9 5b fc ff ff       	jmp    103241 <vprintfmt+0x18>
                return;
  1035e6:	90                   	nop
        }
    }
}
  1035e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  1035ea:	5b                   	pop    %ebx
  1035eb:	5e                   	pop    %esi
  1035ec:	5f                   	pop    %edi
  1035ed:	5d                   	pop    %ebp
  1035ee:	c3                   	ret    

001035ef <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1035ef:	f3 0f 1e fb          	endbr32 
  1035f3:	55                   	push   %ebp
  1035f4:	89 e5                	mov    %esp,%ebp
  1035f6:	e8 a5 cc ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  1035fb:	05 55 c3 00 00       	add    $0xc355,%eax
    b->cnt ++;
  103600:	8b 45 0c             	mov    0xc(%ebp),%eax
  103603:	8b 40 08             	mov    0x8(%eax),%eax
  103606:	8d 50 01             	lea    0x1(%eax),%edx
  103609:	8b 45 0c             	mov    0xc(%ebp),%eax
  10360c:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  10360f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103612:	8b 10                	mov    (%eax),%edx
  103614:	8b 45 0c             	mov    0xc(%ebp),%eax
  103617:	8b 40 04             	mov    0x4(%eax),%eax
  10361a:	39 c2                	cmp    %eax,%edx
  10361c:	73 12                	jae    103630 <sprintputch+0x41>
        *b->buf ++ = ch;
  10361e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103621:	8b 00                	mov    (%eax),%eax
  103623:	8d 48 01             	lea    0x1(%eax),%ecx
  103626:	8b 55 0c             	mov    0xc(%ebp),%edx
  103629:	89 0a                	mov    %ecx,(%edx)
  10362b:	8b 55 08             	mov    0x8(%ebp),%edx
  10362e:	88 10                	mov    %dl,(%eax)
    }
}
  103630:	90                   	nop
  103631:	5d                   	pop    %ebp
  103632:	c3                   	ret    

00103633 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103633:	f3 0f 1e fb          	endbr32 
  103637:	55                   	push   %ebp
  103638:	89 e5                	mov    %esp,%ebp
  10363a:	83 ec 18             	sub    $0x18,%esp
  10363d:	e8 5e cc ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  103642:	05 0e c3 00 00       	add    $0xc30e,%eax
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103647:	8d 45 14             	lea    0x14(%ebp),%eax
  10364a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  10364d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103650:	50                   	push   %eax
  103651:	ff 75 10             	pushl  0x10(%ebp)
  103654:	ff 75 0c             	pushl  0xc(%ebp)
  103657:	ff 75 08             	pushl  0x8(%ebp)
  10365a:	e8 0b 00 00 00       	call   10366a <vsnprintf>
  10365f:	83 c4 10             	add    $0x10,%esp
  103662:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103665:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103668:	c9                   	leave  
  103669:	c3                   	ret    

0010366a <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10366a:	f3 0f 1e fb          	endbr32 
  10366e:	55                   	push   %ebp
  10366f:	89 e5                	mov    %esp,%ebp
  103671:	83 ec 18             	sub    $0x18,%esp
  103674:	e8 27 cc ff ff       	call   1002a0 <__x86.get_pc_thunk.ax>
  103679:	05 d7 c2 00 00       	add    $0xc2d7,%eax
    struct sprintbuf b = {str, str + size - 1, 0};
  10367e:	8b 55 08             	mov    0x8(%ebp),%edx
  103681:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103684:	8b 55 0c             	mov    0xc(%ebp),%edx
  103687:	8d 4a ff             	lea    -0x1(%edx),%ecx
  10368a:	8b 55 08             	mov    0x8(%ebp),%edx
  10368d:	01 ca                	add    %ecx,%edx
  10368f:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103692:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  103699:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10369d:	74 0a                	je     1036a9 <vsnprintf+0x3f>
  10369f:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  1036a2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1036a5:	39 d1                	cmp    %edx,%ecx
  1036a7:	76 07                	jbe    1036b0 <vsnprintf+0x46>
        return -E_INVAL;
  1036a9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1036ae:	eb 22                	jmp    1036d2 <vsnprintf+0x68>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1036b0:	ff 75 14             	pushl  0x14(%ebp)
  1036b3:	ff 75 10             	pushl  0x10(%ebp)
  1036b6:	8d 55 ec             	lea    -0x14(%ebp),%edx
  1036b9:	52                   	push   %edx
  1036ba:	8d 80 9f 3c ff ff    	lea    -0xc361(%eax),%eax
  1036c0:	50                   	push   %eax
  1036c1:	e8 63 fb ff ff       	call   103229 <vprintfmt>
  1036c6:	83 c4 10             	add    $0x10,%esp
    // null terminate the buffer
    *b.buf = '\0';
  1036c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1036cc:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1036cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1036d2:	c9                   	leave  
  1036d3:	c3                   	ret    

001036d4 <__x86.get_pc_thunk.di>:
  1036d4:	8b 3c 24             	mov    (%esp),%edi
  1036d7:	c3                   	ret    
