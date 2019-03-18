#include <stdlib.h>
#include <iostream>
#include <conio.h>
#include "game.h"
using namespace std;

bool game::check( char tabc[3][3] )
{
	int counter = 0,result = 0;
	for ( int j = 0; j <= 2; j++ )
	{
		for ( int k = 0; k <= 2; k++ )
			if ( tabc[j][k] == 'X' )
				counter++;
		if ( counter == 3 )
			result = 1;
		counter = 0;
	}
	for ( int j = 0; j <= 2; j++ )
	{
		for ( int k = 0; k <= 2; k++ )
			if ( tabc[k][j] == 'X' )
				counter++;
		if ( counter == 3 )
			result = 1;
		counter = 0;
	}
	for ( int j = 0,k = 0; j <= 2; j++ )
	{
		if ( tabc[j][k] == 'X' )
			counter++;
		k++;
	}
	if ( counter == 3 )
		result = 1;
	counter = 0;
	for ( int j = 2,k = 0; j >= 0; j-- )
	{
		if ( tabc[j][k] == 'X' )
			counter++;
		k++;
	}
	if ( counter == 3 )
		result = 1;
	counter = 0;
	return result;
}


int game::gameengine( int rounds ) // silnik gry
{
	firstmov = rand() % 2; // losowanie zaczynaj¹cego
	for ( int i = 0; i < rounds; i++ ) // x = 0, o = 1
	{
		cout << "= Prepare for the game... ===============\n\n";
		if ( firstmov == 0 ) // zamiana rozpoczynaj¹cych
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
		system( "PAUSE" );
		system( "CLS" );
		for ( int j = 0; j <= 2; j++ )
			for ( int k = 0; k <= 2; k++ )
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
				switch ( toupper( c1 ) )
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
			do // wybor wiersza
			{
				l = _getch();
				switch ( l )
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
			if ( turn == 0 ) // stawia znak w zale¿noœci od kolejki i zmienia osobê wykonuj¹c¹ ruch
			{
				tab[c][l] = 'X';
				turn = 1;
			}
			else
			{
				tab[c][l] = 'O';
				turn = 0;
			}
			system( "CLS" );
			finish = 1;
			for ( int j = 0; j <= 2; j++ )
				for ( int k = 0; k <= 2; k++ )
					if ( tab[j][k] == ' ' )
						finish = 0;
			if ( !finish )
				finish = check( tab );
		} while ( finish == 0 );
	}
	return win;
}
