﻿/*
unit loadout script by Belbo
creates a specific loadout for playable units. Add the items to their respective variables. (expected data type is given).
The kind of ammo a player gets with this loadout does not necessarily have to be specified.
*/

//clothing - (string)
_uniform = ["U_O_PilotCoveralls"];
_vest = ["V_TacVest_khk"];
_headgear = ["H_CrewHelmetHeli_O"];
_backpack = ["B_Parachute"];
_insignium = "";
_useProfileGoggles = 1;		//If set to 1, goggles from your profile will be used. If set to 0, _goggles will be added (or profile goggles will be removed when _goggles is left empty).
_goggles = "";
_unitTraits = [["medic",false],["engineer",true],["explosiveSpecialist",false],["UAVHacker",false],["camouflageCoef",1.0],["audibleCoef",1.0]];

//weapons - primary weapon - (string)
_primaryweapon = "SMG_02_F";

//primary weapon items - (array)
_optic = ["optic_ACO_grn_smg"];
_attachments = [""];
_silencer = "muzzle_snds_L";		//if silencer is added

//primary weapon ammo (if a primary weapon is given) and how many tracer mags - (integer)
_primaryweaponAmmo = [4,0];

//40mm Grenades - (integer)
_40mmHeGrenadesAmmo = 0;
_40mmSmokeGrenadesWhite = 0;
_40mmSmokeGrenadesYellow = 0;
_40mmSmokeGrenadesOrange = 0;
_40mmSmokeGrenadesRed = 0;
_40mmSmokeGrenadesPurple = 0;
_40mmSmokeGrenadesBlue = 0;
_40mmSmokeGrenadesGreen = 0;
_40mmFlareWhite = 0;
_40mmFlareYellow = 0;
_40mmFlareRed = 0;
_40mmFlareGreen = 0;
_40mmFlareIR = 0;

//weapons - handgun - (string)
_handgun = "hgun_Rook40_F";

//handgun items - (array)
_itemsHandgun = [""];
_handgunSilencer = "muzzle_snds_L";		//if silencer is added

//handgun ammo (if a handgun is given) - (integer)
_handgunAmmo = [4,0];

//weapons - launcher - (string)
_launcher = "";

//launcher ammo (if a launcher is given) - (integer) 
_launcherAmmo = [0,0];

//binocular - (string)
_binocular = "Binocular";

//throwables - (integer)
_grenadeSet = 0;		//contains 2 HE grenades, 1 white and one coloured smoke grenade and 1 red chemlight. Select 0 if you want to define your own grenades.
_grenades = ["RED","RED"];		//depending on the custom loadout the colours may be merged.
_chemlights = ["RED"];
_IRgrenade = 0;

//first aid kits and medi kits- (integer)
_FirstAidKits = 2;
_MediKit = 0;		//if set to 1, a MediKit and all FirstAidKits will be added to the backpack; if set to 0, FirstAidKits will be added to inventory in no specific order.

//items added specifically to uniform: - (array)
_itemsUniform = [];

//items added specifically to vest: - (array)
_itemsVest = [];

//items added specifically to Backpack: - (array)
_itemsBackpack = [];

//linked items (don't put "ItemRadio" in here, as it's set with _equipRadio) - (array)
_itemsLink = [
	"ItemWatch",
	"ItemCompass",
	"ItemGPS",
	"ItemMap",
	"NVGoggles_OPFOR"
];
		
//items added to any container - (array)
_items = [];

//MarksmenDLC-objects:
if (304400 in (getDLCs 1) || 332350 in (getDLCs 1)) then {
};

	//CustomMod items//
	
//ACRE radios
_ACREradios = ["ACRE_PRC343","ACRE_PRC148"];	//_this select 0=shortrange radio;_this select 1=leader radio;_this select 2=backpackRadio;
//TFAR items
_givePersonalRadio = true;
_giveRiflemanRadio = false;
_tfar_microdagr = 0;		//adds the tfar microdagr to set the channels for a rifleman radio

//ACE items (if ACE is running on the server) - (integers)
_ACE_EarPlugs = 1;

_ace_FAK = 1;		//overwrites the values for bandages, morphine and tourniquet and adds a specified number of bandages and morphine. Defined in fn_aceFAK.sqf
_ACE_fieldDressing = 3;
_ACE_packingBandage = 6;
_ACE_elasticBandage = 6;
_ACE_quikclot = 6;
_ACE_atropine = 0;
_ACE_adenosine = 0;
_ACE_epinephrine = 0;
_ACE_morphine = 2;
_ACE_tourniquet = 2;
_ACE_bloodIV = 0;
_ACE_bloodIV_500 = 0;
_ACE_bloodIV_250 = 0;
_ACE_plasmaIV = 0;
_ACE_plasmaIV_500 = 0;
_ACE_plasmaIV_250 = 0;
_ACE_salineIV = 0;
_ACE_salineIV_500 = 0;
_ACE_salineIV_250 = 0;
_ACE_bodyBag = 0;
_ACE_personalAidKit = 0;
_ACE_surgicalKit = 0;

_ACE_SpareBarrel = 0;
_ACE_UAVBattery = 0;
_ACE_wirecutter = 0;
_ACE_Clacker = 0;
_ACE_M26_Clacker = 0;
_ACE_DeadManSwitch = 0;
_ACE_DefusalKit = 0;
_ACE_Cellphone = 0;
_ACE_MapTools = 1;
_ACE_CableTie = 0;
_ACE_EntrenchingTool = 0;
_ACE_sprayPaintColor = "NONE";
_ACE_gunbag = 0;

_ACE_key = 1;	//0 = no key, 1 = side dependant key, 2 = master key, 3 = lockpick
_ACE_flashlight = 1;
_ACE_kestrel = 0;
_ACE_altimeter = 1;
_ACE_ATragMX = 0;
_ACE_rangecard = 0;
_ACE_DAGR = 0;
_ACE_microDAGR = 1;
_ACE_RangeTable_82mm = 0;
_ACE_MX2A = 0;
_ACE_HuntIR_monitor = 0;
_ACE_HuntIR = 0;
_ACE_m84 = 0;
_ACE_HandFlare_Green = 0;
_ACE_HandFlare_Red = 0;
_ACE_HandFlare_White = 0;
_ACE_HandFlare_Yellow = 0;

//AGM Variables (if AGM is running) - (bool)
_ACE_isMedic = 0;		//0 = no medic; 1 = medic; 2 = doctor;
_ACE_isEngineer = 0;	//0 = no specialist; 1 = engineer; 2 = repair specialist;
_ACE_isEOD = false;
_ACE_isPilot = true;

//Tablet-Items
_tablet = false;
_androidDevice = true;
_microDAGR = false;
_helmetCam = false;

//scorch inv items
_scorchItems = [""];
_scorchItemsRandom = ["sc_cigarettepack","sc_candybar","","",""];

//Addon Content:
switch (ADV_par_opfWeap) do {
	case 1: {
		//RHS
		_primaryweapon = "rhs_weap_pp2000";
		_optic = [""];
		_attachments = [""];
		_silencer = "";		//if silencer is added
		_primaryweaponAmmo = [4,2];
		_handgun = "";
		_handgunAmmo = [0,0];
		_itemsHandgun = [""];
		_handgunSilencer = "";
	};
	case 2: {
		//RHS Guerilla
		_primaryweapon = ["rhs_weap_aks74un_folded"];
		_optic = [""];
		_attachments = [""];
		_silencer = "";		//if silencer is added		
		_handgun = "";
		_itemsHandgun = [];
		_handgunSilencer = "";
	};
	case 3: {
		//CUP
		_primaryweapon = "CUP_arifle_AKS74U";
		_optic = [""];
		_attachments = [""];
		_silencer = "";		//if silencer is added
		_handgun = "CUP_hgun_PB6P9";
		_itemsHandgun = [];
		_handgunSilencer = "CUP_muzzle_PB6P9";
	};
	case 4: {
		//HLC AK
		_primaryweapon = ["hlc_rifle_aks74u"];
		_optic = [""];
		_attachments = [""];
		_silencer = "hlc_muzzle_545SUP_AK";		//if silencer is added		
		if (isClass(configFile >> "CfgPatches" >> "RH_de_cfg")) then {
			_handgun = "RH_mak";
			_itemsHandgun = [""];
			_handgunSilencer = "RH_pmsd";
		};
	};
	default {};
};
switch (ADV_par_opfUni) do {
	case 1: {
		//RHS EMR-Summer
		_uniform = ["rhs_uniform_df15"];
		_vest = ["V_TacVest_oli"];
		_headgear = ["rhs_zsh7a"];
		_itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["rhs_1PN138"];
	};
	case 2: {
		//RHS Flora
		_uniform = ["rhs_uniform_df15"];
		_vest = ["V_TacVest_oli"];
		_headgear = ["rhs_zsh7a"];
		_itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["rhs_1PN138"];
	};
	case 3: {
		//RHS Mountain Flora
		_uniform = ["rhs_uniform_df15"];
		_vest = ["V_TacVest_oli"];
		_headgear = ["rhs_zsh7a"];
		_itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["rhs_1PN138"];
	};
	case 4: {
		//RHS EMR Desert
		_uniform = ["rhs_uniform_df15"];
		_vest = ["V_TacVest_oli"];
		_headgear = ["rhs_zsh7a"];
		_itemsLink = _itemsLink-["NVGoggles_OPFOR"]+["rhs_1PN138"];
	};
	default {};
};

///// No editing necessary below this line /////
_player = _this select 0;
[_player] call ADV_fnc_gear;
CL_IE_Module_Enabled = true;

_return = getUnitLoadout _player;
_return;