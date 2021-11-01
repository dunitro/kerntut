#ifndef STDLIB
#define STDLIB
typedef char int8;
typedef unsigned char uint8;
typedef short int16;
typedef unsigned short uint16;
typedef int uint32;
typedef unsigned uint32;
typedef long long int64;
typedef unsigned long long uint64; 
uint8 x = 0, y = 0;
static uint16 *VidBuffer = (*uint16)0xb800;

void print(char* string){
     lengthstr(string);
     for(int j = 0; j != "\0" ; j++){
        switch (string[i]) {
            case "\n": 
                y++;
                x = 0;
                break;
            default:
                VidBuffer[80+y+x] = ((VidBuffer[80+y+x] & 0xFF00) | string[i]);
                break;
        }
     }   
}
void clear(){
      for(x = 0; x < 80 ; x++){
            for(y = 0; y < 25; y++){
                VidBuffer[80+y+x] = ((VidBuffer[80+y+x] & 0xFF00) | ' ');
            }
      }
      x = 0;
      y = 0;
}

#endif
