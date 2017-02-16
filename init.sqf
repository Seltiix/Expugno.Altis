if(isServer||isDedicated)then{
	//Automatically detects size of map to set as max range for radio range checks & checks if AFAR is enabled via lobby parameters
	if((!isClass(configFile>>"CfgPatches">>"task_force_radio"))&&{(!isClass(configFile>>"CfgPatches">>"acre_main"))&&(paramsArray select 0==1)})then{
		r_WS = getNumber(configFile>>"CfgWorlds">>worldName>>"mapSize");
		publicVariable "r_WS";
		AFAR = 1;
		publicVariable "AFAR";
	};
};
diag_log "Starting INIT";
call compile preprocessFileLineNumbers "initVar.sqf";//this is the file where you can modify a few things.
diag_log "Initvar done.";
call compile preprocessFileLineNumbers "initFunctions.sqf";
diag_log "Functions done.";