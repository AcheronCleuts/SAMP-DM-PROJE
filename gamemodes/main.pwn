#include <a_samp>
#include <zcmd>
#include <a_mysql>
#include <sscanf2>

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print("Dogukan calisiyor....");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" Hoşgeldin Dogukan kodun calisiyor.");
	print("----------------------------------\n");
}

#endif

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("BETA DM");
	new i;
	for(i = 1; i < 311; i++){
		AddPlayerClass(i, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	}
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{   
	SetPlayerPos(playerid, -2080.4919, 242.6367, 105.8890);
	SetPlayerFacingAngle(playerid, 187.0440);
	SetPlayerCameraPos(playerid, -2087.8054, 231.7423, 110.4536);
	SetPlayerCameraLookAt(playerid, -2080.4919, 242.6367, 105.8890);
	return 1;
}

public OnPlayerConnect(playerid)
{   
    new pName[MAX_PLAYER_NAME], nStr[128];
    GetPlayerName(playerid, pName, MAX_PLAYER_NAME);
	format(nStr, sizeof(nStr), "Sunucuya Hosgeldin - %s", pName);
    SendClientMessage(playerid, 0xe5ced2, nStr);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
    if(IsPlayerAdmin(playerid)){
		new string[999];
		new name[20];

		GetPlayerName(playerid, name, 20);
        format(string, sizeof(string), "{8188FF}[{FFFFFF}DEV{8188FF}] : %s {FFFFFF}(%i) : {8188FF}%s", name, playerid, text);
		SendClientMessageToAll(playerid, string);

		return 0 ;

	}

	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/deneme", cmdtext, true, 10) == 0)
	{
		SetPlayerSkin(playerid, 30);
        SendClientMessage(playerid, 0xddaaddee, "[SUNUCU] OROSPU Skinini degistirdi");
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{    
    return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}



