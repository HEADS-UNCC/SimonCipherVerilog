# SimonCipherVerilog
__Disclaimer: This code should not be used in production and has been written for educational purposes only__

This is a Verilog implementation of the Simon cipher. It follows the specifications described in:
[https://eprint.iacr.org/2013/404.pdf](https://eprint.iacr.org/2013/404.pdf)

The code is parameterizable and is dependent on two parameters, *n* and *m* to produce Simon 2n/nm:
- n: is the word size in bits, wheras 2n is the block size.
- m: is the number of words in a key, therefore key length is nm bits.

Valid values for n and m are as follows:

The implementation consists of the following modules:
- simon.v: Top level module
- round.v: Round function
- key\_expansion.v: Key-expansion function
- utility.vh: Defines macro values

The inputs/outputs of the simon module are given as follows:
- clk: clock input
- rst: synchronous reset input
- key: key input (size = n\*m)
- plaintext: plaintext input (size = 2\*n)
- ciphertext: output ciphertext  (size = 2\*n)
- done: done bit output, sets to high once the process is complete. The number of clock cycles taken by the operation is equal to the number of rounds.
