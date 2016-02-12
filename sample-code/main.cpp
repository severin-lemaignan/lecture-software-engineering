#include <iostream>
#include <vector>

using namespace std;

int main(int argc, char** argv) {

    cout << "The TicTacToe game" << endl;

    bool done = false;

    vector<char> positions = {1,0,0,
                              0,1,0,
                              0,0,1};

    char x_char;
    int x;
    int y;

    while(!done) {

        char i = 0;
        cout << "  A B C " << endl;
        cout << " -------" << endl;
        cout << "1";

        for(auto pos : positions) {
            i++;
            cout << "|" << ((pos == 0) ? " " : "x");

            if (i % 3 == 0) {
                cout << "|" << endl;
                cout << " -------" << endl;
                cout << i/3 + 1;
            }
        }

        cout << endl << "Enter X coordinate (A, B or C):";
        cin >> x_char;
        x = (x_char == 'A' ? 0 : (x_char == 'B' ? 1 : 2));

        cout << endl << "Enter Y coordinate (1, 2 or 3):";
        cin >> y;
        y--;

        if (y == 0) {
            done = true;
        }
        else {
            positions[x + 3 * y] = 1;
        }
    }

    return 0;
}
