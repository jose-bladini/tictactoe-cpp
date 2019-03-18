#pragma once


class game
{

public:

	int gameengine( int rounds );

private:

	// zmienne
	char c1, tab[3][3]; //tablica u¿ywana w grze
	bool err,firstmov,turn,finish;
	int win = 1,c,l,circlepoints = 0,crosspoints = 0;

	// funkcje
	bool check( char tabc[3][3] );

};