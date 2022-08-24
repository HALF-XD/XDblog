LinuxC 文档 https://akaedu.github.io/book/ch24s02.html

一个博主的关于C的博文 https://blog.csdn.net/m0_49425260/category_10956932.html

#### 第一个例子

C file:

```c
#include <stdio.h>
/* main: generate some simple output */
int main(void){
	printf("Hello, world.\n");
	return 0;
}
```

bash:

```bash
$ gcc main.c
$ ./a.out
Hello, world.
$ gcc main.c -o main
$ ./main
Hello, world.
```

函数指针是指向函数的指针变量，

函数指针可以像一般函数一样，用于调用函数、传递参数。

执行：

```markdown
main.c		main.s		main.o		 a.out
					  ↑         ↑↑        ↑↑↑
				 [gcc -s] 	[gcc -c] 	 [gcc]  
与 -o 搭配
```

编译命令

【gcc main.c -g】【objdump -dS a.out】

​	在编译的时候加上 -g 选项，用objdump反汇编时可以把C代码和汇编代码穿插起来显示

【gcc -S main.c 】只生成汇编代码文件【main.s】

【objdump -d a.out】将【a.out】 二进制文件反汇编为【main.s】文件

#### 18.2. x86的寄存器

【the stack - by Jeremy Gordon】文章http://www.godevtool.com/GoasmHelp/usstack1.htm

x86的通用寄存器 【https://datacadamia.com/computer/cpu/register/general#bit】

```md
eax - Accumulator  
ebx - Base
edx - Counter
edx - Data
edi - Destination Index
esi - Source Index 
```

x86的特殊寄存器 

```
(ebp和esp用于维护函数调用的堆栈)
ebp - Stack pointer
		EBP is usually set to `esp` at the start of function.
		EBP 是编译器跟踪函数参数和局部变量的一种比ESP直接使用更方便的方法。
esp - Base pointer
		ESP is the top of the stack.
		ESP是当前的堆栈指针，每当一个字或地址被压入或弹出堆栈时，它都会改变。
eip - 程序计数器
eflags - 保存计算过程中产生的标志位,包括进位CF、溢出OF、零ZF、负数SF四个标志位。	
```

#### 19.1. 函数调用

`brew install gdb` 时间比较长

[gdb调试命令- https://www.cnblogs.com/wuyuegb2312/archive/2013/03/29/2987025.html]

```bash
- 将例子中代码保存为`19.1_case.c`文件
- 1.1 执行命令 `gcc 19.1_case.c -g`,得到可执行文件 a.out
- 1.2 执行命令 `objdump -dS a.out`，打印出的结果保存在文件`19.1_case.txt`中
- 2 执行命令 `gcc -S 19.1_case.c`, 生成文件 `19.1_case.s`
```

在 x86 平台 上这个栈是从高地址向低地址增长的，

函数调用和返回过程中的规则：参数是从右向左依次压栈传递；ebp 总是指向栈帧的栈部；返回值通过 eax 寄存器传递；

#### 19.4. 结构体和联合体

 [汇编中**movl,movw,movb**的作用 **-** https://blog.csdn.net/m0_37806112/article/details/80549927]

- MOV 指令的基本格式： movx source, destination
- source 和 destination 的值可以是内存地址，存储在内存中的数据值，指令语句中定义的数据值，或者是寄存器

#### 20.1. 多目标文件的链接

[linux环境c创建链接库并使用 - https://blog.csdn.net/shanghaichongmin/article/details/121692518]

```bash
代码 `stack.c` 实现堆栈, 这里的top总是指向栈顶元素
代码 `main.c` 使用堆栈，这里的a、b 两个变量没有用，为了说明链接过程加上的。
创建头文件`func.h`，内容为 `stack.c` 中的函数接口，并在 `main.c` 文件顶部导入
执行命令 `gcc stack.c main.c -o main` 生成 `main` 文件
执行命令 `./main` 打印结果在终端
```

todo - 【https://blog.csdn.net/x1r2p3/article/details/10371719】

**静态库**：
	通常以 .so为后缀；
	当要使用时，连接器会找出程序所需的函数，然后将它们拷贝到执行文件，由于这种拷贝是完整的，所以一旦连接成功，静态程序库也就不再需要了。

**动态库**：
	通常以 .a为后缀；
	某个程序在运行中要调用某个动态链接库函数的时候，操作系统首先会查看所有正在运行的程序，看在内存里是否已有此库函数的拷贝了。

​	如果有，则让其共享那一个拷贝；只有没有才链接载入。

​	在程序运行的时候，被调用的动态链接库函数被安置在内存的某个地方，所有调用它的程序将指向这个代码段。

​	因此，这些代码必须使用相对地址，而不是绝对地址。

​	在编译的时候，我们需要告诉编译器，这些对象文件是用来做动态链接库的，所以要用地址无关代码（Position Independent Code (PIC))。

**注意**：linux下进行连接的缺省操作是首先连接动态库，也就是说，如果同时存在静态和动态库，不特别指定的话，将与动态库相连接。

#### 20.2 声明和定义

extern 关键字 “外部变量声明”

单个源文件

多个源文件

其他

头文件：提取重复的代码

自己写一个头文件 stack.h

```txt
#include <stdio.h> 用角括号
#include "stack.h" 用引号

角括号包含的头文件 gcc首先查找 -I 选项指定的目录
		然后查找系统的头文件目录

引号包含的头文件	gcc首先查找包含头文件[.c]文件所在的目录  
		然后查找-I 选项指定的目录
		再然后查找系统的头文件目录
-I [i大写] 选项【gcc -c main.c -I stack】
		子目录
或者 #include “stack/stack.h”
```

目录

```bash
tree
|—main.c
|—stack
 	|—stack.c
 	|—stack.h
```

#### 24 函数接口

malloc与free: 程序中动态分配一块内存

malloc：C标准函数库，可以在堆空间动态分配内存。

free：动态分配的内存。





​		