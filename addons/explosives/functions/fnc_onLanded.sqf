/*
 * Author: Garth 'L-H' de Wet
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Example:
 * object addEventHandler ["EpeContactStart", ACE_explosive_fnc_onLanded];
 *
 * Public: No
 */
#include "script_component.hpp"
EXPLODE_2_PVT(_this,_explosive,_hitTarget);

if ((_explosive getVariable [QGVAR(Handled), false])) exitWith {};

_explosive setVariable [QGVAR(Handled), true];
if (!isNull _hitTarget && {_hitTarget isKindOf "AllVehicles"}) then {
    _explosive attachTo [_hitTarget];
    private "_dir";
    _dir = _setup getVariable [QGVAR(Direction), 0];
    _dir = _dir - (getDir _hitTarget);
    [[_explosive, _dir, 0], QFUNC(setPosition)] call EFUNC(common,execRemoteFnc);
} else {
    [{
        EXPLODE_2_PVT(_this,_player,_explosive);
        private "_pos";
        if (surfaceIsWater _pos) then {
            _pos = getPosASL _explosive;
            _explosive setPosASL _pos;
        }else{
            _pos = getPosATL _explosive;
            _explosive setPosATL _pos;
        };
    }, [ACE_player, _explosive], 0.5, 0.1] call EFUNC(common,waitAndExecute);
};
