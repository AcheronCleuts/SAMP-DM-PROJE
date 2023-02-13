#include <a_samp>
#include <zcmd>
#include <sscanf2>

enum _dialog{
	DIALOG_WAR,
	DIALOG_SPAWN,
}

#define DIALOG_WAR 0
#define DIALOG_SPAWN 1

public OnPlayerConnect(playerid){
    
    
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
    switch(dialogid){
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
                case 3:{
                    GivePlayerWeapon(playerid, 32, 5000);
					SetPlayerArmour(playerid, 100.0);
					SetPlayerHealth(playerid, 100.0);
					SetPlayerSkin(playerid, 287);
					SendClientMessage(playerid, 0x00FF00, "Pilot sinifina katildiniz iyi oyunlar.");
                    SetPlayerPos(playerid, 319.634887, 2024.155883, 17.640625);

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

COMMAND:savasgir(playerid){
    
    ShowPlayerDialog(playerid, DIALOG_WAR, DIALOG_STYLE_LIST, "Sinif Seciniz","Piyade \nKeskin Nisanci\nAgir Roket \nPilot", "Savasa Gir","");

    return 1;
}

SpawnPoint(playerid){
	ShowPlayerDialog(playerid, DIALOG_SPAWN, DIALOG_STYLE_LIST, "Spawn Noktasi Seciniz","Kule \nKule2 \nKlube \nKamera Odasi","Basla","");
    return 1;
}