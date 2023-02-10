#include <a_samp>
#include <sscanf2>
#include <zcmd>

new MYSQL:handle, errno;

public OnFilterScriptInit()
{
	handle = mysql_connect("localhost", "root", "", "samp_db");
	errno = mysql_errno(handle);
 
if (errno != 0) 
{
    new error[100];
 
    mysql_error(error, sizeof (error), handle);
    printf("[ERROR] #%d '%s'", errno, error);
}
}

COMMAND:komutlar(playerid){
    
    ShowPlayerDialog(playerid, 1, DIALOG_STYLE_MSGBOX, "Komutlar", "/aracver, /tp, /silahver, /savasgir, /tamir, /setskin,", "Tamam", "");
    
    return 1;
}
COMMAND:setskin(playerid,params[]){//Kullanımı /setskin (parametre)

new skinid;

if(sscanf(params, "i", skinid)){
return SendClientError(playerid, "Dogru Kullanim : /setskin id ");}

SetPlayerSkin(playerid,skinid);
SendClientMessage(playerid, 0xFF00FFAA, "Skin degistirildi");

new query[256];
format(query, sizeof(query), "INSERT INTO veriler (playerid, skinid) VALUES (%i, %i)", playerid, skinid);
mysql_query(handle, query);


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

SendClientError(playerid, str[]){
  
   new nStr[128];
   format(nStr, sizeof(nStr),"[ERROR] {FF0000} %s", str);
   SendClientMessage(playerid, 0xba55d3, nStr);
   return 1;
}

