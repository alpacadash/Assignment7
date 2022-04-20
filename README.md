"# Assignment7" 

Assignment 7A - Encryption Using Rotate Operations

Write a program that performs simple encryption by rotating each plaintext byte a varying number of positions in different directions. For example, in the following array that represents the encryption key, a negative value indicates a rotation to the left and a positive value indicates a rotation to the right. The integer in each position indicates the magnitude of the rotation:

key BYTE −2, 4, 1, 0, −3, 5, 2, −4, −4, 6

Your program should loop through a plaintext message and align the key to the first 10 bytes of the message. Rotate each plaintext byte by the amount indicated by its matching key array value. Then, align the key to the next 10 bytes of the message and repeat the process.

Assignment 7B - Greatest Common Divisior (GCD)

The greatest common divisor (GCD) of two integers is the largest integer that will evenly divideboth integers. The GCD algorithm involves integer division in a loop, described by the followingpseudocode:
int GCD(int x, int y)
{
  x = abs(x)
  y = abs(y) 
  do
  {
    int n = x % y
    x= y
    y= n
   }while (y<0)
  return x
 }
 Implement this function in assembly language and write a test program that calls the function.
