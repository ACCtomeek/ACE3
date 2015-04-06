#include "script_component.hpp"

#define _dsp (uiNamespace getVariable "ATragMX_Display")

if (ctrlVisible 5006) then
{
	false execVM "\atragmx\fnc_show_range_card.sqf";
	true execVM "\atragmx\fnc_show_main_page.sqf";
} else
{
	false execVM "\atragmx\fnc_show_main_page.sqf";
	true execVM "\atragmx\fnc_show_range_card.sqf";
	
	ctrlSetFocus (_dsp displayCtrl 5001);
	
	[] call FUNC(calculate_range_card);
	[] call FUNC(update_range_card);
};