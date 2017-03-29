
class CEntity : CScriptBaseRoom
{
	void Spawn()
	{
		Print( "Spawned\n" );
	}
	
	int ScheduleOfType( const string& in szName )
	{
		return BaseClass.ScheduleOfType( szName ) + 2;
	}
}


