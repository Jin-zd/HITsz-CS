#include<bits/stdc++.h>
using namespace std;

bool isprime(int num){
    for(int i = 2; i * i <= num; i++){ 
        if(num % i == 0) 
            return false;
    }
    return true;
}

bool find(int num, vector<int>& evens, vector<bool>& used, vector<int>& match){
    for(int i = 0; i < evens.size(); i++){ 
        if(isprime(num + evens[i]) && !used[i]){
            used[i] = true;
            if(match[i] == 0 || find(match[i], evens, used, match)){ 
                match[i] = num; 
                return true;
            }
        }
    }
    return false;
}
int main(){
    int n;
    while(cin >> n){
        vector<int> odds;
        vector<int> evens;
        vector<int> nums(n);
        for(int i = 0; i < n; i++){
            cin >> nums[i];
            if(nums[i] % 2) 
                odds.push_back(nums[i]);
            else 
                evens.push_back(nums[i]);
        }
        int count = 0;
        if(odds.size() == 0 || evens.size() == 0){ 
            cout << count << endl;
            continue;
        }
        vector<int> match(evens.size(), 0); 
        for(int i = 0; i < odds.size(); i++){ 
            vector<bool> used(evens.size(), false); 
            if(find(odds[i], evens, used, match)) 
                count++;
        }
        cout << count << endl;
    }
    return 0;
}