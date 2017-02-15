waitUntil {!isNull player};
waitUntil {player == player};

diag_log "Starting INIT";
call compile preprocessFileLineNumbers "initVar.sqf";//this is the file where you can modify a few things.
diag_log "Initvar done.";
call compile preprocessFileLineNumbers "initFunctions.sqf";
diag_log "Functions done.";

[] call removeGear;
sleep 2;
[] call addGear;

//Makes sure that both TFAR and ACRE2 are not running on the server, and that the AFAR lobby parameter is enabled
if((!isClass(configFile>>"CfgPatches">>"task_force_radio"))&&{(!isClass(configFile>>"CfgPatches">>"acre_main"))&&(AFAR==1)})then{
	#include "AFAR\rFN.sqf";
	call initAFAR;
};