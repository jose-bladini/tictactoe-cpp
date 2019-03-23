#pragma once

#include <Windows.h>

void anykey();

class settings
{

public:

	//variables
	std::string nickname;
	int score;
	bool autosave;
	char appdata[MAX_PATH];

	//functions
	void load();
	bool save();
	void options();
	settings();

private:

	//variables
	char savefile[MAX_PATH],savefileloc[MAX_PATH];

	//functions
	void create();

};