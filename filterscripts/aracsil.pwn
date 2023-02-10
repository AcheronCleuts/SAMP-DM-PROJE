#include <a_samp>
#include <zcmd>
#include <sscanf2>

COMMAND:aracsil(){
     new Float:X, Float:Y, Float:Z;
     new nStr[128];
    for( new veh; veh < MAX_VEHICLES; veh ++ )
    {
        GetVehiclePos( veh, X, Y, Z );
        if( X == 0.00 && Y == 0.00 && Z == 00 )
            continue;

        DestroyVehicle( veh );
    }
    format(nStr, sizeof(nStr), "BUTUN ARACLAR SILINDI");
    SendClientMessageToAll(0xe5ced2, nStr);
    return 1;
}