1. d_ff.v
2. d_latch.v
3. tst_d.v
4. run.do

Why use Negative Edge Triggered Reset Logic?

- Because Reset is like emergency switch, there might be necessary situation
to Reset the Circuit, so 0V is easily available than 5V etc.
It is easy to LOW a circuit than HIGH.

- Transition from LOW to HIGH or 0V to 5V transition might cause Noisy 
Transition. 