#ifndef ENTITYMGR_H
#define ENTITYMGR_H

#include <vector>
#include <string>

class base_entity;

class entity_manager
{
public:
	entity_manager();
	~entity_manager();

	int Start();
	void Run();
	void Shutdown();

	//CGameObj *GetGameObjAt(int x, int y);

	//bool GetActionState(int action);

	//CGameObj *FindGameObjByName(const std::string &name);

protected:
	//void Render();
	//void GetInput();
	//CGameObj *SpawnObject(const std::string &type, char dispChar, int x, int y);
    
    base_entity *SpawnRoom(const std::string &room);

	std::vector<base_entity*> gameObjects;

	//bool actionStates[4];

	bool isRunning;
};

extern entity_manager *gameMgr;

#endif
