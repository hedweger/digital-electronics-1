# Lab 5: Tomáš Hadwiger

## Preparation tasks (done before the lab at home)

1. Write characteristic equations and complete truth tables for D, JK, T flip-flops where `q(n)` represents main output value before the clock edge and `q(n+1)` represents output value after the clock edge.

   ![Characteristic equations](https://github.com/hedweger/digital-electronics-1/blob/main/labs/05-ffs/Images/eq_flip_flops.png)
  

   **D-type FF**
   | **clk** | **d** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](images/eq_uparrow.png) | 0 | 0 | 0 |  |
   | ![rising](images/eq_uparrow.png) | 0 | 1 | 0 |  |
   | ![rising](images/eq_uparrow.png) | 1 | 1 | 1 |  |
   | ![rising](images/eq_uparrow.png) | 1 | 0 | 1 |  |

   **JK-type FF**
   | **clk** | **j** | **k** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-: | :-- |
   | ![rising](images/eq_uparrow.png) | 0 | 0 | 0 | 0 | Output did not change |
   | ![rising](images/eq_uparrow.png) | 0 | 0 | 1 | 1 | Output did not change |
   | ![rising](images/eq_uparrow.png) | 0 | 1 | 0 | 0 | Output reset |
   | ![rising](images/eq_uparrow.png) | 0 | 1 | 1 | 0 | Output reset |
   | ![rising](images/eq_uparrow.png) | 1 | 0 | 0 | 1 | Output set |
   | ![rising](images/eq_uparrow.png) | 1 | 0 | 1 | 1 | Output set |
   | ![rising](images/eq_uparrow.png) | 1 | 1 | 0 | 1 | Toggle |
   | ![rising](images/eq_uparrow.png) | 1 | 1 | 1 | 0 | Toggle |

   **T-type FF**
   | **clk** | **t** | **q(n)** | **q(n+1)** | **Comments** |
   | :-: | :-: | :-: | :-: | :-- |
   | ![rising](images/eq_uparrow.png) | 0 | 0 | 0 | Output did not change |
   | ![rising](images/eq_uparrow.png) | 0 | 1 | 1 | Output did not change |
   | ![rising](images/eq_uparrow.png) | 1 | 0 | 1 | Output inverted |
   | ![rising](images/eq_uparrow.png) | 1 | 1 | 0 | Output inverted |

<a name="part1"></a>


### Flip-flops

1. Listing of VHDL architecture for T-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture Behavioral of t_ff_rst is
    signal s_q : std_logic;
begin
    -- p_t_ff_rst:
    -- T type flip-flop with a high-active synchro reset,
    -- rising-edge clk.
    -- q(n+1) = t./q(n) + /t.q(n)
    -- q(n+1) =  q(n) if t = 0 (no change)
    -- q(n+1) = /q(n) if t = 1 (inversion)
    --------------------------------------------------------
    p_t_ff_rst : process(clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then 
                 s_q <= '0';
            elsif ( t = '0') then
                s_q <= s_q;
            else -- t = 1
                s_q <= not s_q;
            end if;
        end if;
    end process p_t_ff_rst;

    -- Output ports are permanently connected to local signal
    q     <= s_q;
    q_bar <= not s_q;
end architecture Behavioral;
```

2. Screenshot with simulated time waveforms. Try to simulate both flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure](https://github.com/hedweger/digital-electronics-1/blob/main/labs/05-ffs/Images/waveforms.png)

### Shift register

1. Image of the shift register `top` level schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![your figure](https://github.com/hedweger/digital-electronics-1/blob/main/labs/05-ffs/Images/shit_register.png)
