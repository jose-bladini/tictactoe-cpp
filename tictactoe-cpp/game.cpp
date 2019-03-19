#include <stdlib.h>
#include <iostream>
#include <conio.h>
#include "game.h"
#include "main.h"
using namespace std;

int game::check()
{
	int counter = 0,result;
	char turnb;
	if ( turn == 0 ) // "translates" bool turn to char turnb
		turnb = 'X';
	else
		turnb = 'O';
	result = 1;
	for ( int j = 0; j <= 2; j++ ) // draw check
		for ( int k = 0; k <= 2; k++ )
			if ( tab[j][k] == ' ' )
				result = 0;
	for ( int j = 0; j <= 2; j++ ) // vertical check
	{
		for ( int k = 0; k <= 2; k++ )
			if ( tab[j][k] == turnb )
				counter++;
		if ( counter == 3 )
			result = 2;
		counter = 0;
	}
	for ( int j = 0; j <= 2; j++ ) // horizontal check
	{
		for ( int k = 0; k <= 2; k++ )
			if ( tab[k][j] == turnb )
				counter++;
		if ( counter == 3 )
			result = 2;
		counter = 0;
	}
	for ( int j = 0,k = 0; j <= 2; j++ )
	{
		if ( tab[j][k] == turnb )
			counter++;
		k++;
	}
	if ( counter == 3 )
		result = 2;
	counter = 0;
	for ( int j = 2,k = 0; j >= 0; j-- )
	{
		if ( tab[j][k] == turnb )
			counter++;
		k++;
	}
	if ( counter == 3 )
		result = 2;
	counter = 0;
	return result;
}


void game::gameengine() // game "engine"
{
	system( "CLS" );
	cout << "= Prepare for the game... ===============\n\n";
	if ( firstmov == 0 ) // changes begginer every round
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
	anykey();
	for ( int j = 0; j <= 2; j++ ) // reset game state
		for ( int k = 0; k <= 2; k++ )
			tab[j][k] = ' ';
	finish = 0;
	while ( finish == 0 )
	{
		system( "CLS" );
		cout << "     A   B   C\n"; // display game state
		cout << "   _____________\n";
		cout << " 1 | " << tab[0][0] << " | " << tab[1][0] << " | " << tab[2][0] << " |\n";
		cout << "   |---|---|---|\n";
		cout << " 2 | " << tab[0][1] << " | " << tab[1][1] << " | " << tab[2][1] << " |\n";
		cout << "   |---|---|---|\n";
		cout << " 3 | " << tab[0][2] << " | " << tab[1][2] << " | " << tab[2][2] << " |\n";
		cout << "   -------------\n\n";
		cout << "[A, B, C] ? ";
		do // select column
		{
			switch ( toupper( _getch() ) )
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
		} while ( err == 1 );
		cout << "\n[1, 2, 3] ? ";
		do // select row
		{
			switch ( _getch() )
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
		} while ( err == 1 );
		if ( turn == 0 ) // places x or o, checks if there is an end-game situation anc swaps turns
		{
			tab[c][l] = 'X';
			finish = check();
			turn = 1;
		}
		else
		{
			tab[c][l] = 'O';
			finish = check();
			turn = 0;
		}
	}
	system( "CLS" );
	cout << "= Results ===============================\n\n";
	switch ( finish )
	{
	case 1:
		cout << " It\'s a draw!\n\n";
		break;
	case 2:
		if ( turn == 0 ) // because turns hawe swapped
			cout << " Circle wins!\n\n";
		else
			cout << " Cross wins!\n\n";
	}
	anykey();
}

game::game()
{
	firstmov = rand() % 2; // random begginer
}
