**Windows Executable in a QR Code**

well yes yesterday i watched a [video](https://youtu.be/ExwqNreocpg) about a great guy who did the following. hide a windows executable binary in a... well.. yes... in a QR Code. at the begining i even didnt really belive in that so i started attemting that myself:

```c
#include <stdio.h>

int main(){
    printf("Hello World");
    return 0;
}
```
        
well i of course didnt fail by compiling it. the problem was the size of the executable. a QR Code can only handle 2.9kb of data. well pretty small but if you search up what bootsector games did its not that small anymore 🙂 

i tried all avalible combination of compiler flags and exe compress tools but the exe just dont wanted to fit in this my 2.9kb of size we need to create a QR Code.

**suddenly i had a idea 💡**

why dont we just write it in assembly without any kind of c library and link it with something compact like GoLink

and it workded 😄 

so my result was a small hello world in assembly with win32 which hat a toal size of 2048 bytes. Which can acually fit in a QR Code.

and thats my result:

![alt text](https://github.com/just6chill/asm-learningspace/blob/main/qrcodeexe/code.png "QR Code")
