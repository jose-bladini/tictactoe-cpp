#pragma once


class game
{

public:

	void gameengine();
	game();

private:

	// zmienne
	char c1, tab[3][3]; //tablica u¿ywana w grze
	bool err, firstmov,turn,finish;
	int c,l;

	// funkcje
	bool check();

};