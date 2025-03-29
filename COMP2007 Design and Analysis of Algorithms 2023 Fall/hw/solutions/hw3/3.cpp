#include <iostream>
using namespace std;


int main(void)
{
    int n;
    cin >> n;
    int nums[n];
    for (int i = 0; i < n; i++)
    {
        cin >> nums[i];
    }
    if (n == 1)
    {
        cout << nums[0] <<endl;
    }
    if (n == 2)
    {
        cout << max(nums[0], nums[1]) << endl;
    }
    int arr1[n - 1], arr2[n - 1];
    for (int i = 0; i < n - 1; i++)
    {
        arr1[i] = nums[i];
        arr2[i] = nums[i + 1];
    }
    int m1[n - 1], m2[n - 1];
    m1[0] = arr1[0];
    m2[0] = arr2[0];
    m1[1] = max(arr1[0], arr1[1]);
    m2[1] = max(arr2[0], arr2[1]);
    for (int i = 2; i < n - 1; i++)
    {
        m1[i] = max(m1[i - 2] + arr1[i], m1[i - 1]);
        m2[i] = max(m2[i - 2] + arr2[i], m2[i - 1]);
    }
    cout << max(m1[n - 2], m2[n - 2]) << endl;
    return 0;
}
