waitUntil { !isNil "KPLIB_all_fobs" };
waitUntil { !isNil "blufor_sectors" };

sleep 5;

attack_in_progress = false;

while { KPLIB_endgame == 0 } do {

    {
        _ownership = [ markerpos _x ] call KPLIB_fnc_getSectorOwnership;
        if ( _ownership == KPLIB_side_enemy ) then {
            [ _x ] call attack_in_progress_sector;
        };
        sleep 0.5;
    } foreach blufor_sectors;

    {
        _ownership = [ _x ] call KPLIB_fnc_getSectorOwnership;
        if ( _ownership == KPLIB_side_enemy ) then {
            [ _x ] call attack_in_progress_fob;
        };
        sleep 0.5;
    } foreach KPLIB_all_fobs;

    sleep 1;

};
