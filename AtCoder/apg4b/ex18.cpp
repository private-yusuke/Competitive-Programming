#include <bits/stdc++.h>
using namespace std;

int main() {
    int N, M;
    cin >> N >> M;
    vector<int> A(M), B(M);
    for (int i = 0; i < M; i++) {
        cin >> A.at(i) >> B.at(i);
    }

    // ここにコードを追記
    // (ここで"試合結果の表"の2次元配列を宣言)
    vector<vector<char> > board(N, vector<char>(N, '-'));

    for(int i = 0; i < M; i++) {
        int a = A.at(i) - 1, b = B.at(i) - 1;
        board.at(a).at(b) = 'o';
        board.at(b).at(a) = 'x';
    }
    for(vector<char> i : board) {
        for(int k = 0; k < N; k++) {
            cout << i.at(k);
            if(k != N-1) cout << ' ';
        }
        cout << endl;
    }
}
