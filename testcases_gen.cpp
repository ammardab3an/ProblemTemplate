
// By AmmarDab3an - Aleppo University

#include "testlib.h"
#include "bits/stdc++.h"

using namespace std;

#define endl '\n'
#define fastIO ios_base::sync_with_stdio(0); cin.tie(0); cout.tie(0);

int32_t main(int32_t argc, char* argv[]){
    
    fastIO;
    
    registerGen(argc, argv, 1);
    
    int64_t n = atoll(argv[1]);
    int64_t min_a = atoll(argv[2]);
    int64_t max_a = atoll(argv[3]);

    assert(n <= 1e6);
    assert(min_a <= max_a);
    assert(max_a <= LLONG_MAX);

    cout << n << endl;
    for(int i = 0; i < n; i++){
        cout << rnd.next(min_a, max_a) << endl;
    }

}