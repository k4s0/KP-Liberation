waitUntil {!isNil "save_is_loaded"};
waitUntil {!isNil "KPLIB_production_markers"};
waitUntil {save_is_loaded};

private _KPLIB_production_markers_old = [0];

while {KPLIB_endgame == 0} do {
    waitUntil {sleep 5;
        !(_KPLIB_production_markers_old isEqualTo KPLIB_production_markers)
    };

    {
        private _marker_text = (_x select 4) + " [";
        if (_x select 1) then {_marker_text = _marker_text + "S";};
        if (_x select 2) then {_marker_text = _marker_text + "A";};
        if (_x select 3) then {_marker_text = _marker_text + "F";};
        _marker_text = _marker_text + "]";
        (_x select 0) setMarkerTextLocal _marker_text;
    } forEach KPLIB_production_markers;

    _KPLIB_production_markers_old = +KPLIB_production_markers;
};
