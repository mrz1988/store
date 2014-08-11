#pragma semicolon 1

#include <sourcemod>
#include <store>

public Plugin:myinfo = 
{
	name = "Store CreditInfo",
	author = "sadface",
	description = "Give information on earning credits",
	version = STORE_VERSION,
	url = "https://github.com/mrz1988/store"
};

public OnPluginStart()
{
	Store_AddMainMenuItem("Credit Earning", "", "", OnMainMenuCreditInfoClick, 20);
}

public OnMainMenuCreditInfoClick(client, const String:value[])
{
	new Handle:menu = CreateMenu(CreditMenuSelectHandle);
	
	SetMenuTitle(menu, "Credit Earning\n \n->While active on the server you will gain\ncredits every minute. Credits can also\nbe obtained by killing enemy players or\nby betting your credits on the winning\nteam for the round.");
	
	AddMenuItem(menu, "_", "_", 4);
	
	SetMenuExitBackButton(menu, true);
	DisplayMenu(menu, client, 0);
}

public CreditMenuSelectHandle(Handle:menu, MenuAction:action, client, slot)
{
	if (action == MenuAction_Cancel)
	{
		if (slot == MenuCancel_ExitBack)
		{
			Store_OpenMainMenu(client);
		}
	}		
	else if (action == MenuAction_End)
	{
		CloseHandle(menu);
	}
}