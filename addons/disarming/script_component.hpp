#define COMPONENT disarming
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_DISARMING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_DISARMING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_DISARMING
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define DANGEROUS_ITEMS ["ACE_Clacker", "ACE_M26_Clacker", "ACE_DeadManSwitch"]