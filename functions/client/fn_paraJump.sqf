﻿/*
ADV_fnc_paraJump - by Belbo:

Allows player to jump with a parachute over a position that's defined by mapclick (or by position of group leader of the player)

Possible call - has to be executed where unit is local:
	[player] call ADV_fnc_paraJump;
Or, with an addaction:
	ADV_handle_paraJumpAction = OBJECT addAction [("<t color=""#33FFFF"">" + ("Parajump") + "</t>"), {[_this select 1] call ADV_fnc_paraJump},nil,3,false,true,"","player distance cursortarget <5"];
*/

params [
	["_unit",player,[objNull]],
	["_targetPos",[0,0,0], [[]]]
];

if (!local _unit) exitWith {};

//has the unit had a backpack?
_unit setVariable ["adv_var_parajump_backpack", backpack _unit];
_unit setVariable ["adv_var_parajump_backpackItems", backpackItems _unit];
if !((_unit getVariable "adv_var_parajump_backpack") == "") then {
	removeBackpack _unit;
	systemChat "Backpack saved. Wait after landing for it to be readded!";
};
sleep 1;
//Parachute is given
_unit addBackpackGlobal "B_Parachute";
sleep 2+(random 4);
//unit is moved to height 2000 on given position
_target = [(_targetPos select 0)+(20+(random 10)), (_targetPos select 1)+(20+(random 10)), 2000];
_unit setPos _target;
_unit allowDamage false;

//safety:
waitUntil {((getPosWorld _unit) select 2) > 900};
_unit moveTo _targetPos;
waitUntil {((getPosWorld _unit) select 2) < 110};
if (isClass(configFile >> "CfgPatches" >> "ace_parachute")) then {
	if !(backpack _unit == "ACE_ReserveParachute") then {
		_unit action ["openParachute", _unit];
	};
} else {
	_unit action ["openParachute", _unit];
};
_unit allowDamage true;
_unit moveTo _targetPos;

//removal of the parachute:
waitUntil {sleep 0.2; ( isTouchingGround _unit || ((getPosATL _unit) select 2) < 1 )};
if !(isClass(configFile >> "CfgPatches" >> "ace_parachute")) then { _unit playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon"; };
sleep 1;
_unit action ["PutBag"];
sleep 1;
//and readding the old one:
if !((_unit getVariable "adv_var_parajump_backpack") == "") then {
	sleep 2;
	_unit addBackpackGlobal (_unit getVariable "adv_var_parajump_backpack");
	{ (backpackContainer _unit) addItemCargoGlobal [_x,1] } count (_unit getVariable "adv_var_parajump_backpackItems");
	systemChat "Backpack readded.";
};

if (true) exitWith {};