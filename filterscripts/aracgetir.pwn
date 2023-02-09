#include <a_samp>
#include <zcmd>
#include <sscanf2>

COMMAND:aracver(playerid, params[]){
    new vehicleID;
    new Float:pX, Float:pY, Float:pZ;
    if(sscanf(params, "i", vehicleID)){
       return SendClientMessage(playerid, 0xFF00FF, "Getirmek istediginiz arac ID si giriniz!");
    }else if(vehicleID < 400 || vehicleID > 611){
        return SendClientMessage(playerid, 0xFFFFFF, "400-611 Arasi Arac ID si giriniz!");
    }

    GetPlayerPos(playerid, pX,pY,pZ);
    CreateVehicle(vehicleID, pX + 3, pY, pZ, 0, 0, 0, -1, 0);
    SendClientMessage(playerid, 0xFF00FFAA, "Arac Olusturuldu"); 


    return 1;
}