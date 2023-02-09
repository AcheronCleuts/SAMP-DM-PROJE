#include <a_samp>

//Oyuncu hasar aldığında olacaklar!

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart){
     //bodypard 9 = kafa
     if(issuerid != INVALID_PLAYER_ID && bodypart == 9){
        switch(weaponid){
            case 34:{
                SetPlayerHealth(playerid, 0.0);
                SendClientMessage(issuerid, 0xFF00FF, "Tam KAFADAN !");
            }default:{
                new Float:can;
                GetPlayerHealth(playerid, can);
                SetPlayerHealth(playerid, can - 50.0);
            }
        }
     }
     return 1;
}