//if !(hasInterface)exitWith{};
//CONFIGURATIONS:
//////////////////////
r_PS="";//VARIABLE: Player Side (Do Not Change!)
//CHANNELS:			Channel# enableChannel [CHAT,VOICE]
//GLOBAL: 0 | SIDE: 1 | COMMAND: 2 | GROUP: 3 | VEHICLE: 4 | DIRECT: 5 | 6-15 = Custom Channels
r_CH=[2,3,4];//Channels for voice comms + radio effects  >> Default: [2,3,4]
r_glCH=[FALSE,FALSE];//VARIABLE: Global Channel Chat/Voice Allow  >> Default: [FALSE,FALSE]
r_sCH=[TRUE,FALSE];//VARIABLE: Side Channel Chat/Voice Allow  >> Default: [FALSE,TRUE]
r_cCH=[TRUE,TRUE];//VARIABLE: Command Channel Chat/Voice Allow  >> Default: [TRUE,TRUE]
r_grCH=[FALSE,TRUE];//VARIABLE: Group Channel Chat/Voice Allow  >> Default: [FALSE,TRUE]
r_vCH=[TRUE,TRUE];//VARIABLE: Vehicle Channel Chat/Voice Allow  >> Default: [TRUE,TRUE]
r_dCH=[FALSE,TRUE];//VARIABLE: Direct Channel Chat/Voice Allow  >> Default: [FALSE,TRUE]



//THE SCRIPT:
//////////////////////
switch(side player)do{//Auto-determines r_PS variable
case WEST:{r_PS="SoldierWB"};
case EAST:{r_PS="SoldierEB"};
case INDEPENDENT:{r_PS="SoldierGB"};
case RESISTANCE:{r_PS="SoldierGB"};
case CIVILIAN:{r_PS="Civilian"};};
r_rEH=[];//ARRAY: Handle list of radio eventHandlers to Remove
Fuzz={//FUNCTION: Global radio noise based on distance between sender/closest reciever
if(player==_this select 0)exitWith{};//<-- CREDIT: rob223344
if("ItemRadio" in assignedItems player&&isAbleToBreathe player)then{
_n=(entities[[r_PS],[],true,true])inAreaArray[getPos player,r_WS,r_WS,360,false,-1];//position player
_c=[];_v=[];_cn=count _n;_f="";
if(_cn<=1)exitWith{};
{if((alive _x)&&{(_x!=player)})then{_c set[(count _c),_x];};}forEach _n;//(_x!=player) doesnt work, so we select 1 instead of 0
_c=_c select 1;
//if(currentChannel==4 && player!=vehicle player)exitWith{};//Vehicle Channel Check
//if(currentChannel==3 && group player!=group _c)exitWith{};//Group Channel Check
//if(currentChannel==2 && leader player!=leader group player)exitWith{};//Command Channel Check
//if(currentChannel==1 && side _c!=side player)exitWith{};//Side Channel Check
if(currentChannel in r_CH)then{
if(surfaceIsWater getPos player)then{
if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
_f="Land_HelipadEmpty_F" createVehicleLocal getPosASLW vehicle player;_f attachTo[vehicle player,[0,0,0.5]];}else{
_f="Land_HelipadEmpty_F" createVehicleLocal getPosASLW player;_f attachTo[player,[-0.08,0.35,0.005],"Neck"];};}else{
if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
_f="Land_HelipadEmpty_F" createVehicleLocal getPosATL vehicle player;_f attachTo[vehicle player,[0,0,0.5]];}else{
_f="Land_HelipadEmpty_F" createVehicleLocal getPosATL player;_f attachTo[player,[-0.08,0.35,0.005],"Neck"];};};
if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
if(vehicle player distance _c>=0&&{vehicle player distance _c<150})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz1";sleep 5.3;};};
if(vehicle player distance _c>150&&{vehicle player distance _c<300})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz2";sleep 5;};};
if(vehicle player distance _c>300&&{vehicle player distance _c<450})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz3";sleep 5;};};
if(vehicle player distance _c>450&&{vehicle player distance _c<600})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz4";sleep 5;};};
if(vehicle player distance _c>600&&{vehicle player distance _c<750})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz5";sleep 5;};};
if(vehicle player distance _c>750&&{vehicle player distance _c<900})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz6";sleep 5;};};
if(vehicle player distance _c>900&&{vehicle player distance _c<1050})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz7";sleep 5;};};
if(vehicle player distance _c>1050&&{vehicle player distance _c<1500})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz8";sleep 5;};};}else{
if(player distance _c>=0&&{player distance _c<150})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz1";sleep 5.3;};};
if(player distance _c>150&&{player distance _c<300})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz2";sleep 5;};};
if(player distance _c>300&&{player distance _c<450})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz3";sleep 5;};};
if(player distance _c>450&&{player distance _c<600})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz4";sleep 5;};};
if(player distance _c>600&&{player distance _c<750})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz5";sleep 5;};};
if(player distance _c>750&&{player distance _c<900})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz6";sleep 5;};};
if(player distance _c>900&&{player distance _c<1050})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz7";sleep 5;};};
if(player distance _c>1050&&{player distance _c<1500})exitWith{playSound "in1";while{!isNull _f}do{_f say2D "fuz8";sleep 5;};};
};};};};


///////////
Hush={_fz=[];//FUNCTION: Silence global radio noise + remove getInMan/OutMan eventHandlers
if(surfaceIsWater getPos player)then{
if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
_fz=nearestObjects[getPosASLW vehicle player,["Land_HelipadEmpty_F","Land_PortableLongRangeRadio_F"],4];}else{
_fz=nearestObjects[getPosASLW player,["Land_HelipadEmpty_F","Land_PortableLongRangeRadio_F"],2];};};

if(!surfaceIsWater getPos player)then{
if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
_fz=nearestObjects[getPosATL vehicle player,["Land_HelipadEmpty_F","Land_PortableLongRangeRadio_F"],4];}else{//3
_fz=nearestObjects[getPosATL player,["Land_HelipadEmpty_F","Land_PortableLongRangeRadio_F"],2];};};//1.8
{detach _x;deleteVehicle _x;}forEach _fz;hintSilent"";//Ends radio noise sound effect

//EVENTHANDLERS: Removes the eventHandlers added in other functions
{player removeEventHandler["GetInMan",_x];vehicle player removeEventHandler["GetInMan",_x];
player removeEventHandler["GetOutMan",_x];vehicle player removeEventHandler["GetOutMan",_x];}forEach r_rEH;r_rEH resize 0;};


///////////
rIn={//FUNCTION: Sender client-side effects for pressing radio key
//private["_n","_cN","_c","_r","_fz"];
if!(currentChannel in r_CH)exitWith{};
if("ItemRadio" in assignedItems player)then{
if(!isAbleToBreathe player&&surfaceIsWater getPos player)then{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;5 enableChannel false;};
if(alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
_n=(entities[[r_PS],[],true,true])inAreaArray[position player,r_WS,r_WS,360,false,-1];_cN=[];
{if((alive _x)&&{(_x!=player)})then{_cN set[(count _cN),_x];};}forEach _n;//(_x!=player) doesnt work so we select 1, instead of 0
if(count _cN>1)then{
_c=_cN select 1;
	if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
	0 enableChannel r_glCH;1 enableChannel r_sCH;2 enableChannel r_cCH;3 enableChannel r_grCH;5 enableChannel r_dCH;
		if(vehicle player distance _c>=0&&{vehicle player distance _c<150})then{hintSilent"Transmitting...";};
		if(vehicle player distance _c>150&&{vehicle player distance _c<300})then{hintSilent"Transmitting...";};
		if(vehicle player distance _c>300&&{vehicle player distance _c<450})then{hintSilent"Transmitting...";};
		if(vehicle player distance _c>450&&{vehicle player distance _c<600})then{hintSilent"Transmitting...";};
		if(vehicle player distance _c>600&&{vehicle player distance _c<750})then{hintSilent"Transmitting...";};
		if(vehicle player distance _c>750&&{vehicle player distance _c<900})then{hintSilent"Transmitting...";};
		if(vehicle player distance _c>900&&{vehicle player distance _c<1050})then{hintSilent"Transmitting...";};
		if(vehicle player distance _c>1050&&{vehicle player distance _c<2000})then{0 enableChannel false;1 enableChannel r_sCH;2 enableChannel false;3 enableChannel false;hintSilent"v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^";};
		if(vehicle player distance _c>2000)then{playSound "in2";0 enableChannel false;1 enableChannel r_sCH;2 enableChannel false;3 enableChannel false;hintSilent"-----------------------------------------------------";};
		}else{
		0 enableChannel r_glCH;1 enableChannel r_sCH;2 enableChannel r_cCH;3 enableChannel r_grCH;5 enableChannel r_dCH;
		if(player distance _c>=0&&{player distance _c<100})then{hintSilent"Transmitting...";playSound "in1";};
		if(player distance _c>150&&{player distance _c<300})then{hintSilent"Transmitting...";playSound "in1";};
		if(player distance _c>300&&{player distance _c<450})then{hintSilent"Transmitting...";playSound "in1";};
		if(player distance _c>450&&{player distance _c<600})then{hintSilent"Transmitting...";playSound "in1";};
		if(player distance _c>600&&{player distance _c<750})then{hintSilent"Transmitting...";playSound "in1";};
		if(player distance _c>750&&{player distance _c<900})then{hintSilent"Transmitting...";playSound "in1";};
		if(player distance _c>900&&{player distance _c<1050})then{hintSilent"Transmitting...";playSound "in1";};
		if(player distance _c>1050&&{player distance _c<2000})then{0 enableChannel false;1 enableChannel r_sCH;2 enableChannel false;3 enableChannel false;hintSilent"v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^";playSound "in1";};
		if(player distance _c>2000)then{playSound "in2";0 enableChannel false;1 enableChannel r_sCH;2 enableChannel false;3 enableChannel false;hintSilent"-----------------------------------------------------";};
		};}else{
if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
0 enableChannel false;1 enableChannel r_sCH;2 enableChannel false;3 enableChannel false;4 enableChannel r_vCH;playSound "in2";hintSilent"-----------------------------------------------------";}else{
0 enableChannel false;1 enableChannel r_sCH;2 enableChannel false;3 enableChannel false;4 enableChannel r_vCH;playSound "in2";hintSilent"-----------------------------------------------------";};};


if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
_r="Land_PortableLongRangeRadio_F" createVehicleLocal getPos vehicle player;_r attachTo[vehicle player,[0,0,0.5]];_r setVectorUp[0,0,0.005];}else{
_r="Land_PortableLongRangeRadio_F" createVehicleLocal getPos player;_r attachTo[player,[-0.08,0.35,0.005],"Neck"];_r setVectorUp[0,-1,0.005];};
	_rEH=player addEventHandler["GetInMan",{
	if(surfaceIsWater getPos player)then{
	if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
	_fz=nearestObjects[getPosASLW vehicle player,["Land_HelipadEmpty_F"],4];_r=nearestObjects[getPosASLW vehicle player,["Land_PortableLongRangeRadio_F"],4];_fz=_fz select 0;_r=_r select 0;detach _fz;detach _r;_fz attachTo[vehicle player,[0,0,0.5]];_r attachTo[vehicle player,[0,0,0.5]];_r setVectorUp[0,-1,0.005];}else{
	_fz=nearestObjects[getPosASLW player,["Land_HelipadEmpty_F"],4];_r=nearestObjects[getPosASLW player,["Land_PortableLongRangeRadio_F"],4];_fz=_fz select 0;_r=_r select 0;detach _fz;detach _r;_fz attachTo[player,[-0.08,0.35,0.005],"Neck"];_r attachTo[player,[-0.08,0.35,0.005],"Neck"];_r setVectorUp[0,-1,0.005];};};
	if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
	_fz=nearestObjects[getPosATL vehicle player,["Land_HelipadEmpty_F"],4];_r=nearestObjects[getPosATL vehicle player,["Land_PortableLongRangeRadio_F"],4];_fz=_fz select 0;_r=_r select 0;detach _fz;detach _r;_fz attachTo[vehicle player,[0,0,0.5]];_r attachTo[vehicle player,[0,0,0.5]];_r setVectorUp[0,-1,0.005];}else{
	_fz=nearestObjects[getPosATL player,["Land_HelipadEmpty_F"],4];_r=nearestObjects[getPosATL player,["Land_PortableLongRangeRadio_F"],4];_fz=_fz select 0;_r=_r select 0;detach _fz;detach _r;_fz attachTo[player,[-0.08,0.35,0.005],"Neck"];_r attachTo[player,[-0.08,0.35,0.005],"Neck"];_r setVectorUp[0,-1,0.005];};}];

	_rEH=player addEventHandler["GetOutMan",{
	if(surfaceIsWater getPos player)then{
	if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
	_fz=nearestObjects[getPosASLW vehicle player,["Land_HelipadEmpty_F"],4];_r=nearestObjects[getPosASLW vehicle player,["Land_PortableLongRangeRadio_F"],4];_fz=_fz select 0;_r=_r select 0;detach _fz;detach _r;_fz attachTo[vehicle player,[0,0,0.5]];_r attachTo[vehicle player,[0,0,0.5]];_r setVectorUp[0,-1,0.005];}else{
	_fz=nearestObjects[getPosASLW player,["Land_HelipadEmpty_F"],4];_r=nearestObjects[getPosASLW player,["Land_PortableLongRangeRadio_F"],4];_fz=_fz select 0;_r=_r select 0;detach _fz;detach _r;_fz attachTo[player,[-0.08,0.35,0.005],"Neck"];_r attachTo[player,[-0.08,0.35,0.005],"Neck"];_r setVectorUp[0,-1,0.005];};};
	if((vehicle player!=player)&&{(vehicle player isKindOf "LandVehicle")||(vehicle player isKindOf "Air")||(vehicle player isKindOf "Ship_F")})then{
	_fz=nearestObjects[getPosATL vehicle player,["Land_HelipadEmpty_F"],4];_r=nearestObjects[getPosATL vehicle player,["Land_PortableLongRangeRadio_F"],4];_fz=_fz select 0;_r=_r select 0;detach _fz;detach _r;_fz attachTo[vehicle player,[0,0,0.5]];_r attachTo[vehicle player,[0,0,0.5]];_r setVectorUp[0,-1,0.005];}else{
	_fz=nearestObjects[getPosATL player,["Land_HelipadEmpty_F"],4];_r=nearestObjects[getPosATL player,["Land_PortableLongRangeRadio_F"],4];_fz=_fz select 0;_r=_r select 0;detach _fz;detach _r;_fz attachTo[player,[-0.08,0.35,0.005],"Neck"];_r attachTo[player,[-0.08,0.35,0.005],"Neck"];_r setVectorUp[0,-1,0.005];};}];
	r_rEH set[count r_rEH,_rEH];
[player]remoteExec["Fuzz",0];
//[player]remoteExec["Fuzz",(-1*(clientOwner))];//<-- CREDIT: rob223344
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)DisplayRemoveEventHandler["KeyUp",kpOut];
(findDisplay 46)DisplayRemoveEventHandler["KeyDown",kpIn];
	kpOut=(findDisplay 46)displayAddEventHandler["KeyUp","if(_this select 1==58)then{[player]call rOut;}"];};};};



///////////
rOut={//FUNCTION: Ends radio transmission with a bleep
if!(currentChannel in r_CH)exitWith{};
if("ItemRadio" in assignedItems player&&alive player&&isAbleToBreathe player)then{
"out1"remoteExec["playSound",0];[player]remoteExec["Hush",0];
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)DisplayRemoveEventHandler["KeyUp",kpOut];
(findDisplay 46)DisplayRemoveEventHandler["KeyDown",kpIn];
kpIn=(findDisplay 46)displayAddEventHandler["KeyDown","if(_this select 1==58)then{[player]call rIn;}"];};
};



///////////
initAFAR={//INIT FUNCTION: Initializes AFAR script functions
//Sets up channels
0 enableChannel r_glCH;1 enableChannel r_sCH;2 enableChannel r_cCH;3 enableChannel r_grCH;4 enableChannel r_vCH;5 enableChannel r_dCH;6 enableChannel true;setCurrentChannel 3;

//EVENTHANDLER: If player gets rid of radio, he cannot send/recieve transmissions
player addEventHandler["Put",{if((_this select 2=="ItemRadio")&&{!("ItemRadio" in assignedItems player)})then{
0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;}else{
0 enableChannel r_glCH;1 enableChannel r_sCH;2 enableChannel r_cCH;3 enableChannel r_grCH;5 enableChannel r_dCH;};}];

//EVENTHANDLERS: Adds CAPS LOCK key as eventHandler to call rIn and rOut functions upon keyPress/keyRelease
waitUntil{!(isNull(findDisplay 46))};
kpIn=(findDisplay 46)displayAddEventHandler["KeyDown","if(_this select 1==58)then{[player]call rIn;}"];
kpOut=(findDisplay 46)displayAddEventHandler["KeyUp","if(_this select 1==58)then{[player]call rOut;}"];

//BRIEFING: Helpful information / instructions regarding AFAR
player createDiarySubject["Arma Radio","ArmA Radio"];
player createDiaryRecord["Arma Radio",["Instructions Manual","
<font face='PuristaMedium' size=30 shadow='5' color='#808000'>ADDON-FREE ARMA RADIO</font></size><b/><br/>Created by Phronk<br/>
<font face='PuristaMedium' size=12 color='#8E8E8E'>__________________________________</font></size><br/><br/>
<font face='PuristaMedium' size=20 color='#808000'>RADIO SETUP</font></size><br/>
    • The 'CAPS LOCK' key is the radio comms key<br/><br/>
    1. Open the in-game menu and go into 'Configure/Controls/Multiplayer'<br/><br/>
    2. Set your PUSH TO TALK or TALK ON GROUP CHANNEL key to CAPS LOCK<br/><br/>
    3. Set your 'TALK ON DIRECT CHANNEL' key to whatever you prefer<br/><br/>
    • WHISPER/SHOUT:  Adjust MICROPHONE volume slider in AUDIO settings<br/>
    • LISTEN VOLUME:  Adjust VON volume slider in AUDIO settings<br/><br/>

<font face='PuristaMedium' size=20 color='#808000'>OPERATING RADIO</font></size><br/>
• The 'CAPS LOCK' key is the radio comms key<br/><br/>
• Radio comms channels are <font color='#fffaa3'>COMMAND</font>, <font color='#b6f442'>GROUP</font>, and <font color='#f4c542'>VEHICLE</font><br/><br/>
• Radio must be equipped to send/recieve transmissions<br/><br/>
• You must be within 1050m of another friendly soldier with a radio<br/><br/>
• Radio static intensifies every 150m away from closest recieving soldier<br/><br/>
• Only squad leaders can communicate via <font color='#fffaa3'>Command Channel</font><br/><br/>
• Only squadmates can communicate via <font color='#b6f442'>Group Channel</font><br/><br/>
• Only vehicle passengers can communicate via <font color='#f4c542'>Vehicle Channel</font><br/><br/>
• Cannot speak via <font color='#ffffff'>Direct Channel</font> while underwater<br/><br/>
• Cannot communicate via radio if underwater without rebreather<br/><br/>
• Cannot communicate via radio comms channels if outside radio range<br/><br/><br/>

<font face='PuristaMedium' size=20 color='#808000'>CREDITS</font></size><br/>
    • RADIO SCRIPT:  Phronk + davidoss<br/>
    • RADIO MODEL:  Bohemia Interactive<br/>
    • RADIO AUDIO:  Bohemia Interactive"]];};

/*Script Version: 0.2
	To Do:
	1. Radio Keybind Setup *TOP PRIORITY*
	2. Prevent people outside your Group from hearing radio bleeps/static when you talk in Group
	3. Prevent people not in your vehicle from hearing radio bleeps/static when you talk in Vehicle
	4. Prevent people not on your channel from hearing radio bleeps/static when you talk in that channel
	5. Fix players talking on radio near you silencing your radio noise if you were already talking bug
	6. Cause player's voice to cut in and out when 'almost' completely out of radio range
	7. Rewrite distance checks to use switch cases, instead of if()then{}if()then{}if()then{}

SCRIPT BY: Phronk
CONTRIBUTIONS:
	1. Davidoss optimized script by effectively using: (entities[[PS],[],true,true])inAreaArray[getPos player,8192,8192,360,false,-1];
	2. R3vo suggested if !(hasInterface)exitWith{}; at top of script
	3. rob223344 helped fix sender hearing his own radio noise
	4. Killzone_Kid helped fix server/dedicated in init.sqf globally distribute AFAR variable