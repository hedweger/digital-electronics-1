# Lab 2: Hadwiger Tomáš



| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   |  0 | 0 0 | 0 0 | 0 | 1 | 0 |
   |  1 | 0 0 | 0 1 | 0 | 0 | 1 |
   |  2 | 0 0 | 1 0 | 0 | 0 | 1 |
   |  3 | 0 0 | 1 1 | 0 | 0 | 1 |
   |  4 | 0 1 | 0 0 | 1 | 0 | 0 |
   |  5 | 0 1 | 0 1 | 0 | 1 | 0 |
   |  6 | 0 1 | 1 0 | 0 | 0 | 1 |
   |  7 | 0 1 | 1 1 | 0 | 0 | 1 |
   |  8 | 1 0 | 0 0 | 1 | 0 | 0 |
   |  9 | 1 0 | 0 1 | 1 | 0 | 0 |
   | 10 | 1 0 | 1 0 | 0 | 1 | 0 |
   | 11 | 1 0 | 1 1 | 0 | 0 | 1 |
   | 12 | 1 1 | 0 0 | 1 | 0 | 0 |
   | 13 | 1 1 | 0 1 | 1 | 0 | 0 |
   | 14 | 1 1 | 1 0 | 1 | 0 | 0 |
   | 15 | 1 1 | 1 1 | 0 | 1 | 0 |
   
   
### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   ![K-maps](https://github.com/hedweger/digital-electronics-1/blob/main/labs/02-logic/1_Kmap.jpeg)

   Less than:

   ![K-maps](https://github.com/hedweger/digital-electronics-1/blob/main/labs/02-logic/2_Kmap.jpeg)

2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![Logic function](https://github.com/hedweger/digital-electronics-1/blob/main/labs/02-logic/SOP.jpeg)
   ![Logic function](https://github.com/hedweger/digital-electronics-1/blob/main/labs/02-logic/POS.jpeg)

### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx??**

```vhdl
    begin
    uut_comparator_4bit : entity work.comparator_4bit
        port map(
            a_i           => s_a,
            b_i           => s_b,
            B_greater_A_o => s_B_greater_A,
            B_equals_A_o  => s_B_equals_A,
            B_less_A_o    => s_B_less_A
        );
        p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        s_b <= "0101"; 
        s_a <= "0010";        
        wait for 100 ns;
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
        report "Input combination 0101 and 0010 FAILED" severity error;
    
        s_b <= "0001"; 
        s_a <= "0010";        
        wait for 100 ns;
        assert ((s_B_greater_A = '1') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '0'))
        report "Input combination 0001 and 0010 FAILED" severity error;
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

```

2. Text console screenshot during your simulation, including reports.

   ![your figure](https://github.com/hedweger/digital-electronics-1/blob/main/labs/02-logic/Screenshot%202022-02-27%20at%2012.56.00.png)

3. Link to your public EDA Playground example:

   ![EDA](https://www.edaplayground.com/x/8tsV)
