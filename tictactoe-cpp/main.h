#pragma once

#include <Windows.h>

void anykey();

class settings
{

public:

	//variables
	std::string nickname;
	int score;
	char appdata[MAX_PATH];

	//functions
	void load();
	void options();
	settings();

private:

	//variables
	char savefile[MAX_PATH],savefileloc[MAX_PATH];

	//functions
	void create();
	bool save();

};