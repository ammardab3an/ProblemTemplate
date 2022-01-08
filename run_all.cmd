@echo off

powershell -command "Get-ChildItem -Path ./testcases -Include *.txt, *.zip -File -Recurse | foreach { $_.Delete()}"
echo "all old testcases files are deleted"

g++ -Wl,--stack,268435456 -std=c++17 -Wall -Wextra -O2 main.cpp -o main.exe
g++ -Wl,--stack,268435456 -std=c++17 -Wall -Wextra -O2 brute.cpp -o brute.exe
g++ -std=c++17 -Wall -Wextra -O2 testcases_gen.cpp -o testcases_gen.exe
g++ -std=c++17 -Wall -Wextra -O2 wcmp.cpp -o wcmp.exe
echo "all cpp files are compiled"

call gen_testcases.cmd
echo "testcases generated"

call gen_answers.cmd
echo "main answers generated" 

call gen_answers_brute.cmd
echo "bruteforce answers generated"

call comp_brute.cmd
echo "done compairing output files"

powershell -command "Compress-Archive -LiteralPath .\testcases -DestinationPath .\testcases\testcases.zip -Force"
echo "testacses compressed and ready for upload"
