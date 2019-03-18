//port kika z batcha na c++
#define BOOST_FILESYSTEM_NO_DEPRECATED
#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <fstream>
#include <conio.h>
#include <stdlib.h>
#include <ctime>
#include <boost\filesystem.hpp>
#include <string>
#include <Windows.h>
#include <ShlObj.h>
#include "main.h"
#include "game.h"

using namespace std;

// defining global variables and objects
char wybor;
settings theSettings;

void anykey()
{
	cout << "Press any key...";
	_getch();
}

void newgame( int gametype ) // ustawienie opcji dla nowej gry
{
	bool quitn = false;
	while ( quitn == false )
	{
		int rounds = 0;
		while ( rounds <= 0 || rounds >= 1000 )
		{
			cout << "= New game ==============================\n\n";
			cout << " How many rounds would you like to play?\n\n? ";
			cin >> rounds;
			system( "CLS" );
			if ( rounds > 0 && rounds < 1000 )
			{
				game theGame;
				cout << theGame.gameengine( rounds ) << endl;
			}
			else
				cout << "You typed in a wrong number!\n\n";
		}
		cout << " Do you want to play again? [Y/N]\n\n? ";
		wybor = _getch();
		system( "CLS" );
		switch ( toupper( wybor ) )
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

void mainmenu()
{
	bool quit = false;
	while ( quit == false ) // pêtla zapobiegaj¹ca zakoñczeniu programu
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
		system( "CLS" );
		switch ( wybor )
		{
		case '1':
			newgame( 0 );
			break;
			/*case 'M':
				newgame(1);
				break;*/
		case '2':
			theSettings.options();
			break;
		case 27:
			cout << "= Quit ==================================\n\n";
			cout << " Are you sure? [Y/N]\n\n? ";
			wybor = _getch();
			system( "CLS" );
			switch ( toupper( wybor ) )
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

int main( int *argc,char argv[] )
{
	srand( time( NULL ) );

	//cmd stuff
	system( "MODE CON:COLS=41 LINES=15" );
	system( "title Tic-Tac-Toe [TEST BUILD]" );

	theSettings.load(); // loading settings
	cout << theSettings.nickname;
	//mainmenu();
	cout << "Zapisac? [t/n]\n";
	switch ( _getch() )
	{
	case 't':
		if ( theSettings.save() )
		{
			cout << "Zapis niemozliwy\n";
		}
		break;
	default:
		cout << "ok\n";
		break;
	}
	anykey();
	return 0;
}

void settings::load()
{
	ifstream setfile;
	setfile.open( savefile );
	if ( setfile )
	{
		setfile.close();
	}
	else
	{
		settings::create();
	}
}

bool settings::save()
{
	if ( !boost::filesystem::exists( savefileloc ) ) //check for directory existance
	{
		boost::filesystem::create_directory( savefileloc ); // create directory if doesn't already exist
	}
	ofstream setfile( savefile );
	if ( setfile )
	{
		setfile << "version = 1" << endl; //this is configuration file version, not game version
		setfile << "nickname = " << nickname << endl;
		setfile << "score = " << score << endl;
		setfile.close();
		return false;
	}
	else
	{
		return true;
	}
}

void settings::options() // menu opcji
{
	bool quito = false;
	while ( quito == false ) // pêtla zapobiegaj¹ca wyjœciu
	{
		cout << "= Options ===============================\n\n";
		cout << " 1. Language\n";
		cout << " 2. Difficulty\n";
		cout << " 3. Color\n\n";
		cout << "To go back to main menu press ESC\n\n? ";
		wybor = _getch();
		system( "CLS" );
		switch ( wybor )
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

void settings::create()
{
	cout << "= Configuration ========================\n";
	cout << " What\'s your nickname?\n :";
	cin >> nickname;
	system( "CLS" );
	cout << "= Configuration ========================\n\n";
	cout << " Hello " << nickname << "!\n";
	anykey();
	system( "CLS" );
}

settings::settings()
{
	// getting full path to appdata
	HRESULT res;
	res = SHGetFolderPath( 0,CSIDL_APPDATA,0,0,appdata );

	// setting paths for save directory and file
	strcat( savefileloc,appdata );
	strcat( savefileloc,"\\tictactoe" );
	strcat( savefile,appdata );
	strcat( savefile,"\\tictactoe\\setfile.cfg" );
}
