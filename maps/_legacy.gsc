#include maps\_utility;
#include common_scripts\utility; 
#include maps\_zombiemode_utility;

init()
{
	level.zombie_vars[ "zombie_perk_juggernaut_health" ] = 160;
	level thread zombie_total();
	level thread check_for_jugg_perk();
}

zombie_total()
{
	for (;;)
	{
		level waittill("start_of_round");
		if(level.round_number > 5 && getplayers().size == 1)
		{
			level.zombie_total = 24;
		}
	}
}

check_for_jugg_perk()
{
	for(;;)
	{
		players = getplayers();
		for(i = 0; i < players.size; i++)
		{
			if(players[i] hasperk("specialty_armorvest") && !isdefined(players[i].is_burning))
			{
				players[i].health += 40;
				if(players[i].health > 160)
				{
					players[i].health = 160;
				}
			}
		}
		wait 0.5;
	}
}