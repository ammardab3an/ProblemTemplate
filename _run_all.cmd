@echo off

echo "compiling..."
g++ -Wl,--stack,268435456 -std=c++17 -Wall -Wextra -O2 solution_0.cpp -o solution_0.exe
g++ -Wl,--stack,268435456 -std=c++17 -Wall -Wextra -O2 solution_1.cpp -o solution_1.exe
g++ -std=c++17 -Wall -Wextra -O2 testcases_gen.cpp -o testcases_gen.exe
g++ -std=c++17 -Wall -Wextra -O2 wcmp.cpp -o wcmp.exe
echo "all cpp files are compiled"

rd /s /q "testcases"
del  "testcases.zip"
echo "all old testcases files are deleted"

mkdir testcases
mkdir testcases\input
mkdir testcases\output
mkdir testcases\output_1

call python testcases_gen.py
echo "scripts generated"

call testcases_gen.cmd
echo "testcases generated"

call answers_0.cmd
echo "solution_0 answers generated" 

call answers_1.cmd
echo "solution_1 answers generated"

call answers_cmp.cmd
echo "done compairing output files"

call "C:\Program Files\WinRAR\WinRAR.exe" a -afzip "testcases.zip" ".\testcases"
echo "testacses compressed and ready for uploading"

call python _run_all_linux.py
call "C:\Program Files\WinRAR\WinRAR.exe" a -afzip "linux_reday.zip" ./solution_0.cpp ./testcases_gen.cpp ./testlib.h ./_run_all_linux.txt