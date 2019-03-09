//port kika z batcha na c++
#include <iostream>
#include <string>
#include <conio.h>
#include <stdlib.h>
#include <ctime>

using namespace std;

char wybor;

bool check(char tabc[3][3])
{
	int counter = 0, result = 0;
	for (int j = 0; j <= 2; j++)
	{
		for (int k = 0; k <= 2; k++)
			if (tabc[j][k] == 'X')
				counter++;
		if (counter == 3)
			result = 1;
		counter = 0;
	}
	for (int j = 0; j <= 2; j++)
	{
		for (int k = 0; k <= 2; k++)
			if (tabc[k][j] == 'X')
				counter++;
		if (counter == 3)
			result = 1;
		counter = 0;
	}
	for (int j = 0, k = 0; j <= 2; j++)
	{
		if (tabc[j][k] == 'X')
			counter++;
		k++;
	}
	if (counter == 3)
		result = 1;
	counter = 0;
	for (int j = 2, k = 0; j >= 0; j--)
	{
		if (tabc[j][k] == 'X')
			counter++;
		k++;
	}
	if (counter == 3)
		result = 1;
	counter = 0;
	return result;
}

int game(int rounds) // silnik gry
{
	char tab[3][3]; // inicjalizacja tablicy
	int win=1, c, l, circlepoints=0, crosspoints=0;
	char c1;
	bool err, firstmov, turn, finish;
	firstmov = rand() % 2; // losowanie zaczynaj¹cego
	for (int i = 0; i < rounds; i++) // x = 0, o = 1
	{
		cout << "= Prepare for the game... ===============\n\n";
		if (firstmov == 0) // zamiana rozpoczynaj¹cych
		{
			firstmov = 1;
			cout << " Circle begins!\n\n";
		}
		else
		{
			firstmov = 0;
			cout << " Cross begins!\n\n";
		}
		turn = firstmov;
		system("PAUSE");
		system("CLS");
		for (int j = 0; j <= 2; j++)
			for (int k = 0; k <= 2; k++)
				tab[j][k] = ' ';
		finish = 0;
		do //powtarzaj dopóki runda siê nie zakoñczy
		{
			cout << "     A   B   C\n";
			cout << "   _____________\n";
			cout << " 1 | " << tab[0][0] << " | " << tab[1][0] << " | " << tab[2][0] << " |\n";
			cout << "   |---|---|---|\n";
			cout << " 2 | " << tab[0][1] << " | " << tab[1][1] << " | " << tab[2][1] << " |\n";
			cout << "   |---|---|---|\n";
			cout << " 3 | " << tab[0][2] << " | " << tab[1][2] << " | " << tab[2][2] << " |\n";
			cout << "   -------------\n\n";
			cout << "[A, B, C] ? ";
			do // wybor kolumny
			{
				c1 = _getch();
				switch (toupper(c1))
				{
				case 'A':
					c = 0;
					err = 0;
					break;
				case 'B':
					c = 1;
					err = 0;
					break;
				case 'C':
					c = 2;
					err = 0;
					break;
				default:
					err = 1;
					break;
				}
			} while (err == 1);
			cout << "\n[1, 2, 3] ? ";
			do // wybor wiersza
			{
				l = _getch();
				switch (l)
				{
				case '1':
					l = 0;
					err = 0;
					break;
				case '2':
					l = 1;
					err = 0;
					break;
				case '3':
					l = 2;
					err = 0;
					break;
				default:
					err = 1;
					break;
				}
			} while (err == 1);
			if (turn == 0) // stawia znak w zale¿noœci od kolejki i zmienia osobê wykonuj¹c¹ ruch
			{
				tab[c][l] = 'X';
				turn = 1;
			}
			else
			{
				tab[c][l] = 'O';
				turn = 0;
			}
			system("CLS");
			finish = 1;
			for (int j = 0; j <= 2; j++)
				for(int k=0;k<=2;k++)
					if (tab[j][k] == ' ')
						finish = 0;
			if (!finish)
				finish = check(tab);
		} while (finish == 0);
	}
	return win;
}

void newgame(int gametype) // ustawienie opcji dla nowej gry
{
	bool quitn = false;
	while (quitn == false)
	{
		int rounds = 0;
		while (rounds <= 0 || rounds >= 1000)
		{
			cout << "= New game ==============================\n\n";
			cout << " How many rounds would you like to play?\n\n? ";
			cin >> rounds;
			system("CLS");
			if (rounds > 0 && rounds < 1000)
				cout << game(rounds) << endl;
			else
				cout << "You typed in a wrong number!\n\n";
		}
		cout << " Do you want to play again? [Y/N]\n\n? ";
		wybor = _getch();
		system("CLS");
		switch (toupper(wybor))
		{
		case 'Y':
			break;
		case 'N':
			quitn = 1;
			break;
		default:
			cout << "You pressed wrong key!\n\n";
			break;
		}
	}
}

void options() // menu opcji
{
	bool quito = false;
	while (quito == false) // pêtla zapobiegaj¹ca wyjœciu
	{
		cout << "= Options ===============================\n\n";
		cout << " 1. Language\n";
		cout << " 2. Difficulty\n";
		cout << " 3. Color\n\n";
		cout << "To go back to main menu press ESC\n\n? ";
		wybor = _getch();
		system("CLS");
		switch (wybor)
		{
		case '1':
			//lang();
			cout << "Not supported for now\n\n";
			break;
		case '2':
			//wpt();
			cout << "Not supported for now\n\n";
			break;
		case '3':
			//kl();
			cout << "Not supported for now\n\n";
			break;
		case 27:
			quito = true;
			break;
		default:
			cout << "You pressed wrong key!\n\n";
			break;
		}
	}
}

int main()
{
	srand(time(NULL));
	system("MODE CON:COLS=41 LINES=20");
	bool quit = false;
	while (quit == false) // pêtla zapobiegaj¹ca zakoñczeniu programu
	{
		cout << "=========================================\n";
		cout << "============== TIC TAC TOE ==============\n";
		cout << "=========================================\n";
		cout << "================ v 0.1 ==================\n";
		cout << "================ ALPHA ==================\n";
		cout << "=========================================\n\n";
		cout << " 1. New Game\n";
		//cout << "M = Multiplayer\n";
		cout << " 2. Options\n\n";
		cout << "Press ESC to quit the game\n\n? ";
		wybor = _getch();
		system("CLS");
		switch (wybor)
		{
		case '1':
			newgame(0);
			break;
		/*case 'M':
			newgame(1);
			break;*/
		case '2':
			options();
			break;
		case 27:
			cout << "= Quit ==================================\n\n";
			cout << " Are you sure? [Y/N]\n\n? ";
			wybor = _getch();
			system("CLS");
			switch(toupper(wybor))
			{
			case 'Y':
				quit = true;
				break;
			case 'N':
				break;
			default:
				cout << "You pressed wrong key!\n\n";
				break;
			}
			break;
		default:
			cout << "You pressed wrong key!\n\n";
			break;
		}
	}
}
