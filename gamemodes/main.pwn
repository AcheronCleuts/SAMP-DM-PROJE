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

enum _dialog{
	DIALOG_CHANGENAME,
	DIALOG_MAKECAR,
	DIALOG_WAR,
	DIALOG_SPAWN,
}
#define DIALOG_CHANGENAME 0
#define DIALOG_MAKECAR 1
#define DIALOG_WAR 2
#define DIALOG_SPAWN 3

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("main");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
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
        format(string, sizeof(string), "{8188FF}[{FFFFFF}DEV{8188FF}] : %s {FFFFFF}(%i) : %s", name, playerid, text);
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
    switch(dialogid){
		case DIALOG_CHANGENAME:{
			if(strlen(inputtext) < 0 || strlen(inputtext) > 24){
				SendClientError(playerid, "Lütfen 0-24 arasi degerlik girin.");
			}
			if(response){
				SetPlayerName(playerid, inputtext);
				SendClientMessage(playerid, 0x006400, "Adiniz degistirildi. Iyi oyunlar!");
			}else{
				SendClientError(playerid, "Islem iptal edildi.");
			}
        
		}
		case DIALOG_MAKECAR:{
			switch(listitem){
				case 0:{
					MakeVehicle(playerid, 522);

				}
				case 1:{
					MakeVehicle(playerid, 560);
				}
			}
		}
		case DIALOG_WAR:{
			switch(listitem){
				case 0:{
					GivePlayerWeapon(playerid, 24, 500);
					GivePlayerWeapon(playerid, 30, 500);
					GivePlayerWeapon(playerid, 16, 20);
					SetPlayerArmour(playerid, 100.0);
					SetPlayerHealth(playerid, 100.0);	
					SetPlayerSkin(playerid, 287);
					SendClientMessage(playerid, 0x00FF00, "Piyade sinifina katildiniz iyi oyunlar.");
					SpawnPoint(playerid);					
				}
				case 1:{
					GivePlayerWeapon(playerid, 34,500);
					GivePlayerWeapon(playerid, 39, 25);
					GivePlayerWeapon(playerid, 24, 500);
					SetPlayerArmour(playerid, 100.0);
					SetPlayerHealth(playerid, 100.0);
					SetPlayerSkin(playerid, 287);
					SendClientMessage(playerid, 0x00FF00, "Keskin nisanci sinifina katildiniz iyi oyunlar.");
					SpawnPoint(playerid);					
				}
				case 2:{
					GivePlayerWeapon(playerid, 35, 45);
					GivePlayerWeapon(playerid, 29, 500);
					GivePlayerWeapon(playerid, 23, 500);
					SetPlayerArmour(playerid, 100.0);
					SetPlayerHealth(playerid, 100.0);
					SetPlayerSkin(playerid, 287);
					SendClientMessage(playerid, 0x00FF00, "Agir roket sinifina katildiniz iyi oyunlar.");
					SpawnPoint(playerid);
				}
			}
		}
		case DIALOG_SPAWN:{
			switch(listitem){
				case 0:{
					SetPlayerPos(playerid, 195.406768, 1849.665771, 25.498508);
				}
				case 1:{
					SetPlayerPos(playerid, 233.151565, 1935.087280, 25.698508);
				}
				case 2:{
					SetPlayerPos(playerid, 211.326721, 1810.927978, 21.867178);
				}
				case 3:{
					SetPlayerPos(playerid, 247.323303, 1859.631591, 14.084012);
				}
			}
		}

	}


	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

COMMAND:setskin(playerid,params[]){//Kullanımı /setskin (parametre)

new skinid;

if(sscanf(params, "i", skinid)){
return SendClientError(playerid, "Dogru Kullanim : /setskin id ");}

SetPlayerSkin(playerid,skinid);
SendClientMessage(playerid, 0xFF00FFAA, "Skin degistirildi");

return 1;
}

COMMAND:silahver(playerid, params[]){

    new weaponid, targetid, ammo;

    if(sscanf(params, "uii", targetid, weaponid, ammo )){
        return SendClientError(playerid, "Kullanim /silahver id silahid mermi");
    }

 
    GivePlayerWeapon(targetid, weaponid, ammo);
    SendClientMessage(playerid, 0xFF00FFAA, "Kullaniciya silah verildi");

    return 1;
}

COMMAND:tamir(playerid){
    
	if(!IsPlayerInAnyVehicle(playerid)){
		return SendClientError(playerid, "Aracta degilsiniz!");
	}

	RepairVehicle(GetPlayerVehicleID(playerid));
    SendClientMessage(playerid, 0xFF00FFAA, "Tamir edildi");
	return 1;
}

COMMAND:konum(playerid){

	new Float:vX, Float:vY, Float:vZ;
    if(GetPlayerPos(playerid,vX,vY,vZ)){
        printf("X : %f",vX);
		printf("Y : %f",vY);
		printf("Z : %f",vZ);
    } else {
        SendClientMessage(playerid, 0xff0000, "Geçersiz oyuncu ID'si");
    }
    return 1;

}

COMMAND:isimver(playerid){
    
	ShowPlayerDialog(playerid, DIALOG_CHANGENAME, DIALOG_STYLE_INPUT, "Dogukan NETWORK", "isim  girin.", "Devam", "Iptal");
    return 1;
}

COMMAND:aracshop(playerid, params[]){
   
   ShowPlayerDialog(playerid, DIALOG_MAKECAR, DIALOG_STYLE_TABLIST_HEADERS, "Arac Al", "Araclar\t	Fiyat\n	 NRG-500\t	  {00EE00}1000\n	 Sultan\t    {00EE00}2000",	  "Tamam", "");
    
   return 1;    

}

COMMAND:paraver(playerid, params[]){
	new targetid, amount;
	new msg[22];
	//Burayı halletmem lazım.
    format(msg, sizeof(msg), "%d Id li kullaniciya %i$ para gonderildi.", targetid, amount);
	if(sscanf(params, "ui", targetid, amount)){
		return SendClientError(playerid, "Kullanim: /paraver [id] [miktar]");
	}

	if(amount < 0){
		return SendClientError(playerid, "Negatif miktarda para verilemez.");
	}

	if(!IsPlayerConnected(targetid)){
		return SendClientError(playerid, "Böyle bir oyuncu bulunamadi.");
	}


	GivePlayerMoney(targetid, amount);
	SendClientMessage(targetid, 0x00EE00, msg);
    SendClientMessage(playerid, 0x00EE00, "Kullaniciya para gonderildi.");
	return 1;
}

COMMAND:deneme(playerid){
    new Float:vX, Float:vY, Float:vZ;
	GetPlayerPos(playerid, vX, vY, vZ);
	Create3DTextLabel("Welcome to SA-MP!", 0xFF00FF, vX, vY, vZ, 100.0, 1);
	SendClientMessage(playerid, 0xFF00FF, "Komut calisti");
	return 1;
}





SendClientError(playerid, str[]){
  
   new nStr[128];
   format(nStr, sizeof(nStr),"[ERROR] {FF0000} %s", str);
   SendClientMessage(playerid, 0xba55d3, nStr);
   return 1;
}

MakeVehicle(playerid, vehicleId){
	new Float:pX, Float:pY, Float:pZ;
    GetPlayerPos(playerid, pX,pY,pZ);
    CreateVehicle(vehicleId, pX + 3, pY, pZ, 0, 0, 0, -1, 0);
    SendClientMessage(playerid, 0xFF00FFAA, "Arac Olusturuldu"); 
    return 1;

}

SpawnPoint(playerid){
	ShowPlayerDialog(playerid, DIALOG_SPAWN, DIALOG_STYLE_LIST, "Spawn Noktasi Seciniz","Kule \nKule2 \nKlube \nKamera Odasi","Basla","");
    return 1;
}


COMMAND:savasgir(playerid){

    ShowPlayerDialog(playerid, DIALOG_WAR, DIALOG_STYLE_LIST, "Sinif Seciniz","Piyade \nKeskin Nisanci\nAgir Roket", "Savasa Gir","");
	return 1;
}

