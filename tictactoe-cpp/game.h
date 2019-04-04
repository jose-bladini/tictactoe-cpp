#pragma once


class game
{

public:

	//variables
	void gameengine();

	//functions
	game();
private:

	//variables
	char c1, tab[3][3]; // game tab
	bool err, firstmov,turn; // 0 = X, 1 = O;
	int c, l, finish; // finish states: 0 - no end-game situation, 1 - draw, 2 - win;

	//functions
	int check();
	void updatescreen() , ai();

};