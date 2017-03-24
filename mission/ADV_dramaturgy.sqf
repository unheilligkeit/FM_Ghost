if (!isServer && hasInterface) exitWith {};

if !(isServer || hasInterface) then {ADV_HCpresent = 1;};
if (isServer) then {ADV_HCpresent = 0;};
publicVariable "ADV_HCpresent";

if (isNil "ADV_taskVar") then { ADV_taskVar = 0; };
if (isNil "ADV_spawnVar") then { ADV_spawnVar = 0; };

//upsmon arrays for editor placed units (for HC-compatibility)
/*
[] spawn {
	_upsmonCalls = [
		//[opf_group_1,"area","CARELESS","LIMITED"]
	];
	if (count _upsmonCalls != 0) then {
		{_x execVM "scripts\upsmon.sqf"} forEach _upsmonCalls;
	};
};
*/

//scripts for first mission part
waitUntil {sleep 1; ADV_taskVar == 1};

[{playMusic "intro"},"BIS_fnc_spawn",true] call BIS_fnc_MP;


[{["<img size='4' image='img\logo.paa'/> <br />
<t align = 'center' color='#FF8012' shadow = '1' size = '.8'>Task Force Wolf<br />
präsentiert</t>",0,0,10,10,1,789] spawn BIS_fnc_dynamicText;},"BIS_fnc_spawn",true] call BIS_fnc_MP;

sleep 20;

[{["<t align = 'center' color='#FF8012' shadow = '1' size = '.8'>eine<br />
eine TFW Mission</t>",0,0,10,10,-1,791] spawn BIS_fnc_dynamicText;},"BIS_fnc_spawn",true] call BIS_fnc_MP;

sleep 20;

[{["<t align = 'center' color='#FF8012' shadow = '1' size = '.8'>Made in<br />
Switzerland</t>",0,0,10,10,1,794] spawn BIS_fnc_dynamicText;},"BIS_fnc_spawn",true] call BIS_fnc_MP;

sleep 20;

[{["<t align = 'center' color='#FF8012' shadow = '1' size = '.8'>gebaut von<br />
TFW Florian</t>",0,0,10,10,-1,792] spawn BIS_fnc_dynamicText;},"BIS_fnc_spawn",true] call BIS_fnc_MP;

sleep 20;

[{["<t align = 'center' color='#FFF300' shadow = '1' size = '.9'>THE GHOSTS</t>",0,0,10,10,1,793] spawn BIS_fnc_dynamicText;},"BIS_fnc_spawn",true] call BIS_fnc_MP;






waitUntil {sleep 1; ADV_taskVar == 2};

[{of1 say "party"},"BIS_fnc_spawn",true] call BIS_fnc_MP;

[["task_1", "succeeded"],"FHQ_TT_setTaskState",false] call BIS_fnc_MP;





waitUntil {sleep 1; ADV_taskVar == 3};
titleText ["", "BLACK FADED"];
skipTime 6;
sleep 2;
titleFadeOut 5;


[{[
	[
		["CIA Aussenposten,","<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
		["6 Stunden später ...","<t align = 'center' shadow = '1' size = '1.0'>%1</t>"]
	]
] spawn BIS_fnc_typeText;},"BIS_fnc_spawn",true] call BIS_fnc_MP;

sleep 10;
[[{true},["task_2","Denn Waffenhändler Ricardo Mendes aufspüren und observieren","Target observieren","WPDesc.","Marker","assigned"]],"FHQ_TT_addTasks",false] call BIS_fnc_MP;
p1 setFuel 1;






waitUntil {sleep 1; ADV_taskVar == 4};

[spawn2] call drohne;
["Ghosts Drohnenunterstützung ist in der Luft","hint",true,true] call BIS_fnc_MP;

sleep 1200;

vip moveInCargo p1;
sleep 10;
p1 landAt 2;


_transport = group fahrer;
_transport allowFleeing 0;
_weg1 = _transport addWaypoint [(getPos w1), 0,1];
[_transport, 1] setWaypointSpeed "LIMITED";
_weg1 = _transport addWaypoint [(getPos w2), 0,2];
_weg1 = _transport addWaypoint [(getPos w3), 0,3];
_weg1 = _transport addWaypoint [(getPos w4), 0,4];
_weg1 = _transport addWaypoint [(getPos w5), 0,5];






waitUntil {sleep 1; ADV_taskVar == 5};

sleep 10;
vip leaveVehicle p1;
_chef = group vip;
_chef allowFleeing 0;
sleep 10;
_weg2 = _chef addWaypoint [(getPos wagen), 0,1];
[_chef, 1] setWaypointSpeed "LIMITED";
group vip addVehicle wagen;







waitUntil {sleep 1; ADV_taskVar == 6};

sleep 10;
deleteWaypoint [_chef, 1];
_weg1 = _transport addWaypoint [(getPos w6), 0,6];
_weg1 = _transport addWaypoint [(getPos w7), 0,7];
_weg1 = _transport addWaypoint [(getPos w8), 0,8];
_weg1 = _transport addWaypoint [(getPos w9), 0,9];
_weg1 = _transport addWaypoint [(getPos w10), 0,10];
_weg1 = _transport addWaypoint [(getPos w11), 0,11];
_weg1 = _transport addWaypoint [(getPos w12), 0,12];
_weg1 = _transport addWaypoint [(getPos w13), 0,13];
_weg1 = _transport addWaypoint [(getPos w14), 0,14];
_weg1 = _transport addWaypoint [(getPos w15), 0,15];
_weg1 = _transport addWaypoint [(getPos w16), 0,16];
_weg1 = _transport addWaypoint [(getPos w17), 0,17];
_weg1 = _transport addWaypoint [(getPos w18), 0,18];
_weg1 = _transport addWaypoint [(getPos w19), 0,19];
_weg1 = _transport addWaypoint [(getPos w20), 0,20];
_weg1 = _transport addWaypoint [(getPos w21), 0,21];







waitUntil {sleep 1; ADV_taskVar == 7};

sleep 10;
vip leaveVehicle wagen;
_weg2 = _chef addWaypoint [(getPos w22), 0,2];
_weg2 = _chef addWaypoint [(getPos w23), 0,3];
sleep 60;
_weg2 = _chef addWaypoint [(getPos wagen2), 0,4];
group vip addVehicle wagen2;







waitUntil {sleep 1; ADV_taskVar == 8};

sleep 10;
deleteWaypoint [_chef, 4];
_transporttwo = group fahrer2;
_transporttwo allowFleeing 0;
_weg3 = _transporttwo addWaypoint [(getPos w24), 0,1];
_weg3 = _transporttwo addWaypoint [(getPos w25), 0,2];
_weg3 = _transporttwo addWaypoint [(getPos w26), 0,3];
_weg3 = _transporttwo addWaypoint [(getPos w27), 0,4];
_weg3 = _transporttwo addWaypoint [(getPos w28), 0,5];
_weg3 = _transporttwo addWaypoint [(getPos w29), 0,6];
_weg3 = _transporttwo addWaypoint [(getPos w30), 0,7];
_weg3 = _transporttwo addWaypoint [(getPos w31), 0,8];
_weg3 = _transporttwo addWaypoint [(getPos w32), 0,9];
_weg3 = _transporttwo addWaypoint [(getPos w33), 0,10];
_weg3 = _transporttwo addWaypoint [(getPos w34), 0,11];
_weg3 = _transporttwo addWaypoint [(getPos w35), 0,12];
_weg3 = _transporttwo addWaypoint [(getPos w36), 0,13];
_weg3 = _transporttwo addWaypoint [(getPos w37), 0,14];
_weg3 = _transporttwo addWaypoint [(getPos w38), 0,15];
[_transporttwo, 15] setWaypointType "GETOUT";






waitUntil {sleep 1; ADV_taskVar == 9};

[["task_2", "succeeded"],"FHQ_TT_setTaskState",false] call BIS_fnc_MP;
sleep 10;
[[{true},["task_3","Denn Waffenhändler Ricardo Mendes eliminieren und Informationen Bergen","Target eliminieren und Infos sichern.","WPDesc.","Marker","assigned"]],"FHQ_TT_addTasks",false] call BIS_fnc_MP;



//scripts for following mission parts
ADV_handle_dramaturgy_1 = [] spawn {

};

//mission end:
ADV_handle_dramaturgy_end = [] spawn {
	waitUntil {sleep 1; ADV_taskVar == 99};
	["task_1", "succeeded"] remoteExec ["FHQ_TT_setTaskState",2];
	sleep 20;
	["End2",true,8] remoteExec ["BIS_fnc_endMission",0];
};

/*
//possible spawn calls:
[["O_Soldier_TL_F","O_Soldier_GL_F","O_Soldier_F","O_soldier_AR_F","O_medic_F"],east,50,["LIMITED","CARELESS","STAG COLUMN"],[spawnLogic_1]] call ADV_fnc_spawnPatrol;
//or:
[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_F","I_soldier_GL_F","I_medic_F"],independent,50,["LIMITED","CARELESS","STAG COLUMN"],[spawnLogic_1,spawnLogic_2],"area_1"] call ADV_fnc_spawnPatrol;
or:
[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_F","I_soldier_GL_F","I_medic_F"],independent,50,[spawnLogic_1],attackLogic_1] call ADV_fnc_spawnAttack;
//for calling custom loadouts on last group spawned (just add one spawnLogic/Marker):
_grp = [["B_Sniper_F","B_Spotter_F"],west,200,["LIMITED","STAG COLUMN","NOFOLLOW"],[spawnLogic_1]] call ADV_fnc_spawnPatrol;
[(units _grp) select 0] call ADV_fnc_sniper;
[(units _grp) select 1] call ADV_fnc_spotter;
//for adding new tasks, create a new case in ADV_tasks.sqf, a new task within this case and call like this:
[2] remoteExec ["ADV_fnc_tasks",2];
*/

if (true) exitWith {};