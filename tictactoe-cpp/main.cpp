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
settings theSettings;

void anykey()
{
	std::cout << "Press any key...";
	_getch();
}

void newgame( int gametype ) // sts up a new game
{
	bool quit = false;
	while ( quit == false )
	{
		int rounds = 0;
		system("CLS");
		cout << "================== Mode =================\n\n";
		cout << "What game mode do you choole ?" << endl;
		cout << "1. Singleplayer " << endl; 
		cout << "2. Multiplayer " << endl;
		cin >> single;
		while ( rounds <= 0 || rounds >= 1000 ) // dialog will be repeating until you type correct number
		{
			system( "CLS" );
			cout << "================ New game ===============\n\n";
			cout << " How many rounds would you like to play?\n\n? ";
			cin >> rounds;
			if ( rounds > 0 && rounds < 1000 ) // game loop (kind of)
			{
				game theGame;
				for ( int i = 0; i < rounds; i++ )
				{
					theGame.gameengine();
				}
			}
			else
			{
				cout << "You typed in a wrong number!\n\n";
				anykey();
			}
		}

		bool quit2 = false;
		while ( quit2 == false )
		{
			system( "CLS" );
			cout << "================= Finish =================\n\n";
			cout << " Do you want to play again? [Y/N]\n\n? ";
			switch ( toupper( _getch() ) )
			{
			case 'Y':
				quit2 = true;
				break;
			case 'N':
				quit = true;
				quit2 = true;
				break;
			default:
				break;
			}
		}
	}
}

void mainmenu()
{
	bool quit = false;
	while ( quit == false )
	{
		system( "CLS" ); //clear output
		cout << "=========================================\n";
		cout << "============== TIC TAC TOE ==============\n";
		cout << "=========================================\n";
		cout << "================= v 0.1 =================\n";
		cout << "================= ALPHA =================\n";
		cout << "=========================================\n\n";
		cout << " 1. New Game\n";
		//cout << "M = Multiplayer\n";
		cout << " 2. Options\n\n";
		cout << "Press ESC to quit the game\n\n? ";

		bool quit2 = false;
		switch ( _getch() ) // capturing direct input from keyboard
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
			while ( quit2 == false )
			{
				system( "CLS" );
				cout << "================= Quit ==================\n\n";
				cout << " Are you sure? [Y/N]\n\n? ";

				switch ( toupper( _getch() ) )
				{
				case 'Y':
					quit = true;
					quit2 = true;
					break;
				case 'N':
					quit2 = true;
					break;
				default:
					break;
				}
			}
			break;
		default:
			break;
		}
	}
}

int main( int *argc,char argv[] )
{
	srand( time( NULL ) );

	//cmd stuff
	system( "MODE CON:COLS=41 LINES=15" ); //setting window size
	system( "title Tic-Tac-Toe [TEST BUILD]" ); //seting window title

	//theSettings.load(); // loading settings
	mainmenu();
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
		create();
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

void settings::options() // options menu
{
	bool quit = false;
	while ( quit == false )
	{
		system( "CLS" );
		cout << "=============== Options ===============\n\n";
		cout << " 1. Reconfigure\n";
		cout << " 2. Save\n\n";
		cout << "To go back to main menu press ESC\n\n? ";

		switch ( _getch() )
		{
		case '1':
			create();
			break;
		case '2':
			/*if ( save() )
				cout << "Unable to save :(\n\n";*/
			cout << "Not available for now :(\n\n";
			anykey();
			break;
		case 27:
			quit = true;
			break;
		default:
			break;
		}
	}
}

void settings::create()
{
	//this initiates configuration if configuration file cannot be loaded
	system( "CLS" );
	cout << "============= Configuration ==============\n\n";
	cout << " What\'s your nickname?\n\n? ";
	cin >> nickname;
	system( "CLS" );
	cout << "============= Configuration ==============\n\n";
	cout << " Hello " << nickname << "!\n\n";
	anykey();
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
