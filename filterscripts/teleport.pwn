#include <a_samp>
#include <zcmd>
#include <sscanf2>

COMMAND:tp(playerid, params[]){
    new targetid;
    new Float:fX, Float:fY, Float:fZ;
    new msg[120];

    if(sscanf(params, "i", targetid)){
        return SendClientMessage(playerid, 0xFFFFFF, "Isınlanmak istediginiz ID yi giriniz.");
    }
    if(!IsPlayerConnected(targetid)){
        return SendClientMessage(playerid, 0xFFFFFF, "Isınlanmak istediginiz ID oyunda yok");
    }

    GetPlayerPos(targetid, fX, fY, fZ);
    SetPlayerPos(playerid, fX, fY, fZ); 
    format(msg, sizeof(msg), "[%i] ID li kullaniciya isinlandiniz!", targetid);
    SendClientMessage(playerid, 0xFF00FF, msg);
    SendClientMessage(targetid, 0xFF00FF, "Admin size Isınlandi!");

    return 1;
}