# Walter Programming Language

Programming language operating on potentially unbounded streams of integers. 

## Installation

Language is built in Haskell hence to install you will need ghc compiler.

Download walter_1.0 directory then run the following command inside.

```bash
make
```
In order to run a program type the following.

```bash
./myinterpreter <your_file> < <your input>
```

## Example

For full documentation please refer to Walter User Guide included in this repository. 

Read two streams of data. Interpret first as integer second as boolean. If boolean is true then increment the number.


```haskell
Example1: {}

-- define input
[a : Int, b : Bool] -> if(b){
                       [a + 1]; -- output a + 1
                       [a + 2]; -- output a + 2
                       }
```

To run the function place it inside Main.

```haskell
Main:
     stdin >> Example1 >> stdout
```

Example input and output.

```haskell
Input:  Output:
1 1      2
2 0      3
3 1      4
         5

```

## Piping feature
In Walter you can define multiple functions and then pipe them together. \
We are going to illustrate it with a simple example.

```haskell
IncrementConstant: {k  : Int = 5;}
[a : Int] -> [a + k]

Negate: {}
[a : Int] -> [-a]

Main:
stdin >> SumConstant >> Negate >> stdout

Input:  Output:
 1       -6
-2        7
 3       -8

```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
