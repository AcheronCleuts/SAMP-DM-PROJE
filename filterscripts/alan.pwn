#include <a_samp>
#include <streamer>

new alan, zoneID;

//BU SCRİPT AREA 51 E GİRİNCE MESAJ VEREN BİR BÖLGE OLUŞTURMA SCRİPTİDİR!
//- DOĞUKAN -

public OnGameModeInit(){
    AddPlayerClass(271, 87.615592, 1802.224121, 17.640625, 355.1350, 0, 0, 0, 0, 0, 0);
    AddPlayerClass(271, 406.442657, 2105.841308, 17.226562, 235.1272, 0, 0, 0, 0, 0, 0);
    alan = CreateDynamicRectangle(87.615592, 1802.224121, 406.442657, 2105.841308);
    zoneID = GangZoneCreate(87.615592, 1802.224121, 406.442657, 2105.841308);
    return 1;
}

public OnPlayerConnect(playerid){
   
    GangZoneShowForPlayer(playerid, zoneID, 0xa1ffacAA);

    return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid){
    if(alan == areaid){
        SendClientMessage(playerid, 0xFF00FF, "Bolgeye Giris Yaptiniz!");
    }
    
    return 1;
}

public OnPlayerLeaveDynamicArea(playerid, areaid){
    if(alan == areaid){
        SendClientMessage(playerid, 0xFF00FF, "Bolgeden Cikis yaptiniz!");
    }
    return 1;
}