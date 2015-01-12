/**
 * fn_broadcastAnim.sqf
 * @Descr: Broadcast an animation across the network using switchMove
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECt, animation STRING]
 * @Return: void
 * @PublicAPI: true
 */


private ["_unit","_anim","_persistent"];
_unit = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_anim = [_this, 1, "",[""]] call BIS_fnc_Param;

 if (count _this >2) then {
 	_persistent = [_this, 2, false, [false]] call BIS_fnc_Param;
	[[_unit,_anim], "cse_fnc_switchAnim", true, _persistent] spawn BIS_fnc_MP;
 } else {
	[[_unit,_anim], "cse_fnc_switchAnim", true, false] spawn BIS_fnc_MP;
 };
