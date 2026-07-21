# clang / clang++

C and C++ compiler from the LLVM project. Use `clang` for C and `clang++` for C++.

## Syntax
```
clang++ [options] source.cpp -o output
```

## Basic compilation
```bash
clang++ main.cpp -o main          # compile and output binary
clang++ main.cpp                  # outputs a.out by default
./main                            # run the binary
```

## Development flags (use these during development)
```bash
clang++ --pedantic-errors -ggdb -O0 -o main main.cpp
```

| Flag | Description |
|------|-------------|
| `--pedantic-errors` | Enforces strict ISO C++ standard — turns non-standard extensions into errors. Catches code that compiles with clang but may break on other compilers (MSVC, GCC). Essential for writing portable code. |
| `-ggdb` | Includes debug symbols optimized for GDB/LLDB. Lets you use a debugger to inspect variables, set breakpoints, and step through code line by line. |
| `-O0` | Zero optimizations. The compiler leaves your code as-is, making debugging predictable. Without this, the compiler may reorder or remove code, making debuggers confusing. |

## C++ standard version
```bash
clang++ -std=c++17 main.cpp -o main   # C++17
clang++ -std=c++20 main.cpp -o main   # C++20
clang++ -std=c++23 main.cpp -o main   # C++23
```

## Warnings
| Flag | Description |
|------|-------------|
| `-Wall` | Enables a broad set of common warnings — uninitialized variables, unused results, suspicious constructs. Good baseline. |
| `-Weffc++` | Warns about violations of Scott Meyers' *Effective C++* guidelines — e.g. not initializing members in constructors, missing virtual destructors. Catches bad OOP habits early. |
| `-Wextra` | Extra warnings not covered by `-Wall` — unused parameters, missing field initializers, suspicious comparisons. |
| `-Wconversion` | Warns when an implicit conversion may silently change a value — e.g. assigning a `double` to an `int` truncates the decimal without error by default. |
| `-Wsign-conversion` | Warns specifically about mixing signed and unsigned integers — e.g. comparing `int` with `size_t`. A common source of subtle bugs. |

## Recommended development command
```bash
clang++ -std=c++17 -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion --pedantic-errors -ggdb -O0 -o main main.cpp
```

## Release build (when shipping)
```bash
clang++ -std=c++17 -O2 -o main main.cpp
```
`-O2` enables optimizations for performance. Never use with `-ggdb` for final builds.

## Multiple source files
```bash
clang++ main.cpp utils.cpp -o main
```

## Common flags reference
| Flag | Description |
|------|-------------|
| `-o file` | Output binary name |
| `-std=c++17` | Set C++ standard |
| `-Wall` | Enable common warnings |
| `-Weffc++` | Warn about Effective C++ guideline violations |
| `-Wextra` | Enable extra warnings |
| `-Wconversion` | Warn on implicit value-changing conversions |
| `-Wsign-conversion` | Warn on signed/unsigned mixing |
| `-O0` | No optimization (debug) |
| `-O2` | Optimized (release) |
| `-ggdb` | Debug symbols for debugger |
| `-c` | Compile only, don't link (produces `.o` file) |
| `-I path` | Add include search path |
| `-L path` | Add library search path |
| `-l name` | Link against a library (e.g. `-lm` for math) |
