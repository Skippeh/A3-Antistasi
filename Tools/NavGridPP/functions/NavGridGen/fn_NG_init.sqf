/*
Maintainer: Caleb Serafin
    Initialises const values.

Scope: Any, Local Effect
Environment: Unscheduled
Public: No

Example:
    class NG_init { preInit = 1; };
*/





// Common for transforming 3DPos to 2D.
A3A_NG_const_pos2DSelect = [0,2];

// Common for empty check
A3A_NG_const_emptyArray = [];

// Common Enum of road types, Case sensitive
A3A_NG_const_roadTypeEnum = ["TRACK","ROAD","MAIN ROAD"];

// For use with nearRoads or NearestTerrainObjects, the inaccuracy is caused by str and parseNumber.
A3A_NG_const_positionInaccuracy = 0.075;

// This is the maximum amount of roads that will allow changing marker type to auto refresh colours. If it goes above, it will prompt the user to refresh.
A3A_NGSA_autoMarkerRefreshNodeMax = 2000;

// Modifiable sizes for drawing navPoints
A3A_NGSA_dotBaseSize = 1.2;
A3A_NGSA_lineBaseSize = 4;

// All pallets should have at least 2 accents
//                    Black      Dark Grey    Light Grey     White
private _greys = ["ColorBlack","Color6_FD_F","ColorGrey","ColorWhite"];
//                 Dark Red      Grey Red       Red      Pink
private _reds = ["ColorEAST","Color1_FD_F","ColorRed","ColorPink"];  // ColorEAST == colorOPFOR
//                      Brown       Orange     Light Orange
private _oranges = ["ColorBrown","ColorOrange","Color3_FD_F"];
//                    Dark Yellow     Yellow
private _yellows = ["ColorUNKNOWN","ColorYellow"];
//                    Khaki       Light Khaki
private _khakis = ["ColorKhaki","Color2_FD_F"];
//                  Dark Green     Green
private _greens = ["ColorGUER","ColorGreen"];  // ColorGUER == colorIndependent
//                  Dark Blue      Blue     Light Blue
private _blues = ["ColorWEST","ColorBlue","Color4_FD_F"];  // ColorWEST == colorBLUFOR
//                     Purple   Light Purple
private _purples = ["ColorCIV","Color5_FD_F"];  // ColorCIV == colorCivilian

private _fnc_reverseEach = {
    private _a = [];
    _this apply {_a=+_x; reverse _a, _a};
};
A3A_NGSA_const_allMarkerColours = [];
private _allPallets = [_greens,_purples,_oranges,_khakis,_yellows,_blues] call _fnc_reverseEach;
// Mixes so that it cycles through pallets before accents
for "_i" from 0 to 3 do {    // longest accent
    for "_j" from 0 to count _allPallets -1 do {
        private _currentPallet = _allPallets#_j;
        if (count _currentPallet > _i) then {
            A3A_NGSA_const_allMarkerColours pushBack (_currentPallet#_i);
        };
    };
};
reverse A3A_NGSA_const_allMarkerColours;    // Push the brighter colours to the front.
A3A_NGSA_const_allMarkerColoursCount = count A3A_NGSA_const_allMarkerColours;
A3A_NGSA_const_markerColourAccent1 = _reds#2;
A3A_NGSA_const_markerColourAccent2 = _reds#1;
