from random import seed, random
seed(1)

def testcases_gen(props, test_idx):
    return ('.\\testcases_gen.exe {} 1> .\\testcases\\input\\input{}.txt'.format(
        props, test_idx
    ))

def answers_0(test_idx):
    return ('(type .\\testcases\\input\\input{0}.txt | .\\solution_0.exe) 1> .\\testcases\\output\\output{0}.txt'.format(
        test_idx
    ))

def answers_1(test_idx):
    return ('(type .\\testcases\\input\\input{0}.txt | .\\solution_1.exe) 1> .\\testcases\\output_1\\output{0}.txt'.format(
        test_idx
    ))
    
def answers_cmp(test_idx):
    return ('.\\wcmp.exe .\\testcases\\input\\input{0}.txt .\\testcases\\output_1\\output{0}.txt .\\testcases\\output\\output{0}.txt'.format(
        test_idx
    ))

def go(testcases):

    with open("testcases_gen.cmd", "w") as output_file:
        for i in range(len(testcases)):
            print(testcases_gen(testcases[i], i), file=output_file)
            print(testcases_gen(testcases[i], i))

    with open("answers_0.cmd", "w") as output_file:
        for i in range(len(testcases)):
            print(answers_0(i), file=output_file)
            print(answers_0(i))

    with open("answers_1.cmd", "w") as output_file:
        for i in range(len(testcases)):
            print(answers_1(i), file=output_file)
            print(answers_1(i))
        
    with open("answers_cmp.cmd", "w") as output_file:
        for i in range(len(testcases)):
            print(answers_cmp(i), file=output_file)
            print(answers_cmp(i))   

with open("testcases_gen.txt", "r") as input_file:
    
    testcases = input_file.read().split('\n')
    testcases_len = len(testcases)
    assert testcases_len > 0
    props_len = len(testcases[0].split())
    
    for i in range(testcases_len):
        assert len(testcases[i].split()) == props_len
        testcases[i] += ' ' + str(random())
    
    go(testcases)

