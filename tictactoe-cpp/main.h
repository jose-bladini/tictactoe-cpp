#pragma once

class settings
{

public:

	//zmienne
	std::string nickname;
	int score;
	char appdata[MAX_PATH];

	//funkcje
	void load();
	bool save();
	void options();
	settings();

private:

	//zmienne
	char savefile[MAX_PATH],savefileloc[MAX_PATH];

	//funkcje
	void create();

};