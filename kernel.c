// kernel.c
void kernel_main() {
  char *msg = "Hello, and welcome to Axen OS";
  char *vidmem = (char *)0xb8000;

  for (int i = 0; msg[i] != '\0'; i++) {
    vidmem[i * 2] = msg[i];
    vidmem[i * 2 + 1] = 0x1F;  // Bright white text on blue background
  }
}
