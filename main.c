
extern  "C" static void _start() {
    char* video_adress = (char*)0xb800;
    *video_adress = 'X';
}
