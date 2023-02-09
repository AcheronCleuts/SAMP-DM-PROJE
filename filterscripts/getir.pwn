#include <a_samp>
#include <zcmd>
#include <sscanf2>

COMMAND:getir(playerid, params[]){
    new targetid;
    new Float:vx, Float:vy, Float:vz;
    new msgstr[120];

    if(sscanf(params, "i", targetid)){
        return SendClientMessage(playerid, 0xFFFFFF, "Getirmek istedigin oyuncunun idsini gir.");
    }
    if(!IsPlayerConnected(targetid)){
        return SendClientMessage(playerid, 0xFFFFFF, "Oyuncu ID si gecersiz!");
    }
    format(msgstr, sizeof(msgstr), "[%i] ID li oyuncuyu yaniniza cektiniz!");
    GetPlayerPos(playerid, vx, vy, vz);
    SetPlayerPos(targetid, vx, vy, vz);
    SendClientMessage(targetid, 0xFFFFFF, "Admin sizi yanina cekti!");
    SendClientMessage(playerid, 0xFFFFFF, msgstr);


    return 1;
}