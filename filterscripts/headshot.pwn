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

public OnPlayerDeath(playerid, killerid, reason){
    new killerName[MAX_PLAYER_NAME], playerName[MAX_PLAYER_NAME];
    new nStr[200];
    new killerScore;

    GetPlayerName(playerid, playerName, MAX_PLAYER_NAME);
    GetPlayerName(killerid, killerName, MAX_PLAYER_NAME);

    format(nStr, sizeof(nStr), "{FF00FF}%s {FF00FF}[%i], %s [%i]'Yi oldurdu!", killerName, killerid, playerName, playerid);
    
    killerScore = GetPlayerScore(killerid);
    SetPlayerScore(killerid, killerScore + 1);
    SendClientMessageToAll(0x00FF00, nStr);

    return 1;
}