g++ -Wl,--stack,268435456 -std=c++17 -Wall -Wextra -O2 main.cpp -o main.exe
g++ -Wl,--stack,268435456 -std=c++17 -Wall -Wextra -O2 brute.cpp -o brute.exe
g++ -std=c++17 -Wall -Wextra -O2 testcases_gen.cpp -o testcases_gen.exe
g++ -std=c++17 -Wall -Wextra -O2 wcmp.cpp -o wcmp.exe