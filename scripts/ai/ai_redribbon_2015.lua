--       _________ __                 __
--      /   _____//  |_____________ _/  |______     ____  __ __  ______
--      \_____  \\   __\_  __ \__  \\   __\__  \   / ___\|  |  \/  ___/
--      /        \|  |  |  | \// __ \|  |  / __ \_/ /_/  >  |  /\___ \ 
--     /_______  /|__|  |__|  (____  /__| (____  /\___  /|____//____  >
--             \/                  \/          \//_____/            \/ 
--  ______________________                           ______________________
--                        T H E   W A R   B E G I N S
--         Stratagus - A free fantasy real time strategy game engine
--
--	(c) Copyright 2015 by Kyran Jackson
--
--      This program is free software; you can redistribute it and/or modify
--      it under the terms of the GNU General Public License as published by
--      the Free Software Foundation; either version 2 of the License, or
--      (at your option) any later version.
--  
--      This program is distributed in the hope that it will be useful,
--      but WITHOUT ANY WARRANTY; without even the implied warranty of
--      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--      GNU General Public License for more details.
--  
--      You should have received a copy of the GNU General Public License
--      along with this program; if not, write to the Free Software
--      Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
--

function SetPlayerGame2015(player, race, ai, faction, gold, wood, oil, startx, starty, varA1, varA2, varB1, varB2, varC1, varC2)
	if (ftm_choice == nil) then AiRedRibbon_Setup_2014() end
	if (ai == "surprise") then
		repeat
			temp = SyncRand(5) + SyncRand(5)
			if (temp == 0) then
				ai = "Land Attack"
			elseif (temp == 1) then
				ai = "Jadeite"
			elseif (temp == 2) then
				ai = "Morga"
			elseif (temp == 3) then
				ai = "Flau"
			elseif (temp == 4) then
				ai = "Kyurene"
			elseif (temp == 5) then
				ai = "Nephrite"
			elseif (temp == 6) then
				ai = "Regulus"
			elseif (temp == 7) then
				ai = "Flau"
			end
		until (ai ~= "surprise")
	end
	SetupPlayer(player, race, ai, gold, wood, oil, startx, starty)
	-- Check game type.
	if (player ~= nil) then
		if ((GameDefinition["Name"] == "Frontlines") or (GameDefinition["Name"] == "Front Lines")) then
			--ftm_team_x1[player] = 0
			--ftm_team_y1[player] = 0
			--ftm_team_x2[player] = 255
			--ftm_team_y2[player] = 255
			
			ftm_team_x1[player] = 43
			ftm_team_y1[player] = 0
			ftm_team_x2[player] = 80
			ftm_team_y2[player] = 127
			if (varA1 ~= nil) then
				ftm_team_x1[player] = varA1
				if (varA2 ~= nil) then
					ftm_team_y1[player] = varA2
					if (varB1 ~= nil) then
						ftm_team_x2[player] = varB1
						if (varB2 ~= nil) then
							ftm_team_y2[player] = varB2
						end
					end
				end
			end
			ftm_team[player] = varC1
			ftm_team_startx[player] = startx
			ftm_team_starty[player] = starty
			ftm_faction[player] = faction
		elseif (GameDefinition["Name"] == "Escape") then
			ftm_team_x1[player] = varA1
			ftm_team_y1[player] = varA2
			ftm_team_x2[player] = varB1
			ftm_team_y2[player] = varB2
		end
	end
end

function AiEscape_2015()

end

function AiNightmare_2015()
	local yn
	local xn
	local yb
	local xb
	local hn = mapinfo.h/3
	local wn = mapinfo.w/3
	if ((timers[AiPlayer()] == (50 - AiPlayer())) or (timers[AiPlayer()] == (100 - AiPlayer()))) then
		if ((GetPlayerData(ftm_choice[AiPlayer()], "TotalNumUnits") > GetPlayerData(ftm_choice[AiPlayer()], "UnitTypesCount", AiWise()))) then
			for index = 1, 15 do
				if (GetPlayerData(ftm_choice[AiPlayer()], "UnitTypesCount", UnitDatabase[GetPlayerData(ftm_choice[AiPlayer()], "RaceName")][index]["Unit"]) > 0) then
					for xn = 0, 2 do
						for yn = 0, 2 do
							for build = 0, GetNumUnitsAt(ftm_choice[AiPlayer()], UnitDatabase[GetPlayerData(ftm_choice[AiPlayer()], "RaceName")][index]["Unit"], {xn*wn, yn*hn}, {(xn+1)*wn, (yn+1)*hn}) do
								if (build ~= 0) then
									if (yn == 0) then 
										yb = 0
									elseif (yn == 1) then
										yb = mapinfo.h/2
									else
										yb = mapinfo.h
									end
									if (xn == 0) then 
										xb = 0
									elseif (xn == 2) then 
										xb = mapinfo.w
									else
										xb = mapinfo.w/2
									end
									CreateUnit(UnitDatabase[GetPlayerData(ftm_choice[AiPlayer()], "RaceName")][index]["Unit"], AiPlayer(), {xb, yb})
									if ((mapinfo.w > 128) and (mapinfo.w > 128)) and (UnitDatabase[GetPlayerData(ftm_choice[AiPlayer()], "RaceName")][index]["Unit"] ~= AiWorker(AiPlayer())) then 
										MoveUnitQuick(AiPlayer(), UnitDatabase[GetPlayerData(ftm_choice[AiPlayer()], "RaceName")][index]["Unit"], mapinfo.w/2, mapinfo.h/2, xb, yb, 10)
									end
								end
							end
						end
					end
				end
			end
		end
		--if ((mapinfo.w > 128) and (mapinfo.w > 128)) then 
		--else
			AiNephrite_Attack_2013("force")
		--end
	end
	AiRedRibbon_Common_2014()
end

function AiCharacter_Set_Name_2015(name)
	if (name == nil) then
		if (GameDefinition["Player"][GameDefinition["Map"][AiPlayer()]["Team"]][GameDefinition["Map"][AiPlayer()]["Player"]]["Name"] ~= nil) then
			AiJadeite_Set_Name_2010(GameDefinition["Player"][GameDefinition["Map"][AiPlayer()]["Team"]][GameDefinition["Map"][AiPlayer()]["Player"]]["Name"])
		end
	else
		AiJadeite_Set_Name_2010(name)
	end
end

function AiPlayer_Check_2015(player, ai)
	if (((ai == nil) and ((GetPlayerData(AiPlayer(), "Name") == "Computer") or (GetPlayerData(AiPlayer(), "Name") == "Land Attack") or
		(GetPlayerData(AiPlayer(), "Name") == "Jadeite") or (GetPlayerData(AiPlayer(), "Name") == "Morga") or 
		(GetPlayerData(AiPlayer(), "Name") == "Flau") or (GetPlayerData(AiPlayer(), "Name") == "Kyurene") or
		(GetPlayerData(AiPlayer(), "Name") == "Nephrite") or (GetPlayerData(AiPlayer(), "Name") == "Regulus") or
		(GetPlayerData(AiPlayer(), "Name") == "Zoisite"))) or (GetPlayerData(AiPlayer(), "Name") == ai)) then
		return true
	end
end

function AiFrontlines_2015()
	for player = 0, 15 do
		if ((ftm_faction[AiPlayer()] == ftm_faction[player]) and (player ~= AiPlayer())) then
			if (GameDefinition["Version"] == "Advanced") then
				-- Teleport the unit!
				if ((timers[AiPlayer()] == 1) or (timers[AiPlayer()] == 11) or (timers[AiPlayer()] == 21) or (timers[AiPlayer()] == 31) or (timers[AiPlayer()] == 41) or (timers[AiPlayer()] == 51) or (timers[AiPlayer()] == 61) or (timers[AiPlayer()] == 71) or (timers[AiPlayer()] == 81) or (timers[AiPlayer()] == 91) or (timers[AiPlayer()] == 101) or (timers[AiPlayer()] == 111) or (timers[AiPlayer()] == 121) or (timers[AiPlayer()] == 131) or (timers[AiPlayer()] == 141) or (timers[AiPlayer()] == 151) or (timers[AiPlayer()] == 161) or (timers[AiPlayer()] == 171) or (timers[AiPlayer()] == 181) or (timers[AiPlayer()] == 191) or
				(timers[AiPlayer()] == 6) or (timers[AiPlayer()] == 16) or (timers[AiPlayer()] == 26) or (timers[AiPlayer()] == 36) or (timers[AiPlayer()] == 46) or (timers[AiPlayer()] == 56) or (timers[AiPlayer()] == 66) or (timers[AiPlayer()] == 76) or (timers[AiPlayer()] == 86) or (timers[AiPlayer()] == 96) or (timers[AiPlayer()] == 106) or (timers[AiPlayer()] == 116) or (timers[AiPlayer()] == 126) or (timers[AiPlayer()] == 136) or (timers[AiPlayer()] == 146) or (timers[AiPlayer()] == 156) or (timers[AiPlayer()] == 166) or (timers[AiPlayer()] == 176) or (timers[AiPlayer()] == 186) or (timers[AiPlayer()] == 196)) then
					for index = 1, 15 do
						if (GetNumUnitsAt(player, UnitDatabase[GetPlayerData(player, "RaceName")][index]["Unit"], {ftm_team_x1[player], ftm_team_y1[player]}, {ftm_team_x2[player], ftm_team_y2[player]}) > 0) then
							KillUnitAt(UnitDatabase[GetPlayerData(player, "RaceName")][index]["Unit"], player, 1, {ftm_team_x1[player], ftm_team_y1[player]}, {ftm_team_x2[player], ftm_team_y2[player]})
							CreateUnit(UnitDatabase[GetPlayerData(player, "RaceName")][index]["Unit"], AiPlayer(), {ftm_team_startx[AiPlayer()], ftm_team_starty[AiPlayer()]})
							break
						end
					end
				end
			else
				-- Change unit ownership!
				ChangeUnitsOwner({ftm_team_x1[player], ftm_team_y1[player]}, {ftm_team_x2[player], ftm_team_y2[player]}, player, AiPlayer())
			end
		end
	end
	if ((timers[AiPlayer()] == nil) or (timers[AiPlayer()] < 1)) then
		timers[AiPlayer()] = 50
	elseif (timers[AiPlayer()] == 23) then
		if (GetPlayerData(AiPlayer(), "TotalNumUnits") > 0) then
			for player = 0, 15 do
				if (ftm_faction[AiPlayer()] ~= ftm_faction[player]) then
					for index = 1, 15 do
						if (GetNumUnitsAt(AiPlayer(), UnitDatabase["human"][index]["Unit"], {0,0}, {mapinfo.w,mapinfo.h}) > 0) then
							OrderUnit(AiPlayer(), UnitDatabase["human"][index]["Unit"], {0,0,mapinfo.w,mapinfo.h}, {ftm_team_startx[ftm_team[player]],ftm_team_starty[ftm_team[player]],ftm_team_startx[ftm_team[player]],ftm_team_starty[ftm_team[player]]}, "attack")
						end
						if (GetNumUnitsAt(AiPlayer(), UnitDatabase["orc"][index]["Unit"], {0,0}, {mapinfo.w,mapinfo.h}) > 0) then
							OrderUnit(AiPlayer(), UnitDatabase["orc"][index]["Unit"], {0,0,mapinfo.w,mapinfo.h}, {ftm_team_startx[ftm_team[player]],ftm_team_starty[ftm_team[player]],ftm_team_startx[ftm_team[player]],ftm_team_starty[ftm_team[player]]}, "attack")
						end
					end
					break
				end
			end
		end
		timers[AiPlayer()] = timers[AiPlayer()] - 1
	elseif (timers[AiPlayer()] == 1) then
		repeat
			timers[AiPlayer()] = SyncRand(25) + SyncRand(25)
		until timers[AiPlayer()] > 25
	else
		timers[AiPlayer()] = timers[AiPlayer()] - 1
	end
end

function AiRed_2015()
	if ((GetPlayerData(AiPlayer(), "UnitTypesCount", AiWise()) > 0) and (GameCycle > 500)) then
		if ((timers[ftm_team[AiPlayer()]] == 50) or (timers[ftm_team[AiPlayer()]] == 99) or (timers[ftm_team[AiPlayer()]] == 25) or (timers[ftm_team[AiPlayer()]] == 75)) then
		else
			if ((aiftm_action[AiPlayer()][aiftm_index[AiPlayer()]] ~= 0) and (aiftm_action[AiPlayer()][aiftm_index[AiPlayer()]] ~= "summon") and (aiftm_action[AiPlayer()][aiftm_index[AiPlayer()]] ~= "spawn")) then
				-- Actions
				AiRed_Action_2015(AiPlayer())
			else	
				-- Spawn
				for i=1,15 do
					if ((aiftm_action[AiPlayer()][aiftm_index[AiPlayer()]] == 0) or (aiftm_action[AiPlayer()][aiftm_index[AiPlayer()]] == "summon") or (aiftm_action[AiPlayer()][aiftm_index[AiPlayer()]] == "spawn")) then
						if (AiRed_Check_Unit_2014(AiPlayer(), i) == true) then
							if (AiRed_Check_Building_2014(ftm_team[AiPlayer()], i) == true) then
								if (UnitNear(AiPlayer(), AiWise(), aiftm_x_to[AiPlayer()][aiftm_index[AiPlayer()]], aiftm_y_to[AiPlayer()][aiftm_index[AiPlayer()]], 10)) then
									-- Introduced in the Nightmare Game Mode. Unit will spawn only if a wiseman is nearby.
									if ((aiftm_action[AiPlayer()][aiftm_index[AiPlayer()]] ~= "summon") and (aiftm_action[AiPlayer()][aiftm_index[AiPlayer()]] ~= "spawn")) then
										AiRed_Spawn_2014(AiPlayer(), i)
										AiRed_GridChange_2014(AiPlayer())
									else
										AiRed_Spawn_2014(AiPlayer(), i, nil, aiftm_x_to[AiPlayer()][aiftm_index[AiPlayer()]], aiftm_y_to[AiPlayer()][aiftm_index[AiPlayer()]])
									end
									AiRed_Resources_Remove_2014(AiPlayer(), (UnitDatabase[ftm_team[AiPlayer()]][i]["CastGold"]), (UnitDatabase[ftm_team[AiPlayer()]][i]["CastWood"]), (UnitDatabase[ftm_team[AiPlayer()]][i]["CastOil"]))
								end
							end
							-- Recently moved. If something breaks, this could be it.
							aiftm_action[AiPlayer()][aiftm_index[AiPlayer()]] = "next"
						end
					end
				end
			end
		end
	elseif ((ftm_team_tempx[AiPlayer()] < 2) and (GameCycle > 100)) then
		AiRed_GridSetup_2014(AiPlayer())
	end
end

function AiRed_Action_2015(player)
	if ((aiftm_action[player][aiftm_index[player]] == "skip") or (aiftm_action[player][aiftm_index[player]] == "next") or
		((aiftm_action[player][aiftm_index[player]] == "wait") and (GameCycle >= aiftm_quantity[player][aiftm_index[player]])) or 
		((aiftm_action[player][aiftm_index[player]] == "gold") and (GetPlayerData(player, "Resources", "gold") >= aiftm_quantity[player][aiftm_index[player]])) or 
		((aiftm_action[player][aiftm_index[player]] == "wood") and (GetPlayerData(player, "Resources", "wood") >= aiftm_quantity[player][aiftm_index[player]])) or 
		((aiftm_action[player][aiftm_index[player]] == "oil") and (GetPlayerData(player, "Resources", "oil") >= aiftm_quantity[player][aiftm_index[player]]))) then
		if (((aiftm_action[player][aiftm_index[player]] == "skip") or (aiftm_action[player][aiftm_index[player]] == "next")) and (aiftm_quantity[player][aiftm_index[player]] > 1)) then
			aiftm_quantity[player][aiftm_index[player]] = aiftm_quantity[player][aiftm_index[player]] - 1
			if ((aiftm_unit[player][aiftm_index[player]] ~= nil) and (aiftm_action[player][aiftm_index[player]] == "next")) then
				aiftm_action[player][aiftm_index[player]] = "summon"
			end
		else
			AiRed_Increment_2014(player)
		end
	elseif ((aiftm_action[player][aiftm_index[player]] == "ai_red_2014") or (aiftm_action[player][0] == "ai_red_2014") or ((aiftm_action[player][10] == "ai_red_2014") and( aiftm_index[player] > 9))) then
		AiRed_2014()
	elseif ((aiftm_action[player][aiftm_index[player]] == "attack") or (aiftm_action[player][aiftm_index[player]] == "move") or (aiftm_action[player][aiftm_index[player]] == "patrol") or (aiftm_action[player][aiftm_index[player]] == "attack area") or (aiftm_action[player][aiftm_index[player]] == "move area") or (aiftm_action[player][aiftm_index[player]] == "patrol area")) then
		if ((aiftm_y_from[player][aiftm_index[player]] == nil) or (aiftm_x_from[player][aiftm_index[player]] == nil)) then
			OrderUnit(player, aiftm_unit[player][aiftm_index[player]], {0,0,mapinfo.w,mapinfo.h}, {aiftm_x_to[player][aiftm_index[player]],aiftm_y_to[player][aiftm_index[player]],aiftm_x_to[player][aiftm_index[player]],aiftm_y_to[player][aiftm_index[player]]}, aiftm_action[player][aiftm_index[player]])
		else
			if ((aiftm_action[player][aiftm_index[player]] == "attack area") or (aiftm_action[player][aiftm_index[player]] == "move area") or (aiftm_action[player][aiftm_index[player]] == "patrol area")) then
				if (aiftm_action[player][aiftm_index[player]] == "attack area") then aiftm_action[player][aiftm_index[player]] = "attack" end
				if (aiftm_action[player][aiftm_index[player]] == "move area") then aiftm_action[player][aiftm_index[player]] = "move" end
				if (aiftm_action[player][aiftm_index[player]] == "patrol area") then aiftm_action[player][aiftm_index[player]] = "patrol" end
				OrderUnit(player, aiftm_unit[player][aiftm_index[player]], {aiftm_x_from[player][aiftm_index[player]]-7,aiftm_y_from[player][aiftm_index[player]]-7,aiftm_x_from[player][aiftm_index[player]]+7,aiftm_y_from[player][aiftm_index[player]]+7}, {aiftm_x_to[player][aiftm_index[player]],aiftm_y_to[player][aiftm_index[player]],aiftm_x_to[player][aiftm_index[player]],aiftm_y_to[player][aiftm_index[player]]}, aiftm_action[player][aiftm_index[player]])
			else
				OrderUnit(player, aiftm_unit[player][aiftm_index[player]], {aiftm_x_from[player][aiftm_index[player]],aiftm_y_from[player][aiftm_index[player]],aiftm_x_from[player][aiftm_index[player]],aiftm_y_from[player][aiftm_index[player]]}, {aiftm_x_to[player][aiftm_index[player]],aiftm_y_to[player][aiftm_index[player]],aiftm_x_to[player][aiftm_index[player]],aiftm_y_to[player][aiftm_index[player]]}, aiftm_action[player][aiftm_index[player]])
			end
		end
		aiftm_action[player][aiftm_index[player]] = "skip"
	--elseif ((aiftm_action[player][aiftm_index[player]] == "attack all") or (aiftm_action[player][aiftm_index[player]] == "move all") or (aiftm_action[player][aiftm_index[player]] == "patrol all")) then
	--	OrderUnit(player, aiftm_unit[player][aiftm_index[player]], {0,0,mapinfo.w,mapinfo.h}, {aiftm_x_to[player][aiftm_index[player]],aiftm_y_to[player][aiftm_index[player]],aiftm_x_to[player][aiftm_index[player]],aiftm_y_to[player][aiftm_index[player]]}, aiftm_action[player][aiftm_index[player]])
	--	aiftm_action[player][aiftm_index[player]] = "skip"
	elseif (aiftm_action[player][aiftm_index[player]] == "loop") then
		aiftm_index[player] = aiftm_quantity[player][aiftm_index[player]]
	end
end

function AiRed_Strategy_Action_2015(i, j, action, quantity, unit, x_to, y_to, x_from, y_from)
	-- i, j, "Gold", 5000
	-- i, j, "Oil", 5000
	-- i, j, "Move", 1, "unit-caanoo-wiseman", tox, toy, fromx, fromy
	-- i, j, "Attack", "All", "Fodder"
	if (quantity == nil) then
		quantity = 1
	end
	aiftm_action[i][j] = action
	aiftm_quantity[i][j] = quantity
	if (unit ~= nil) then
		aiftm_x_to[i][j] = x_to
		aiftm_y_to[i][j] = y_to
		aiftm_x_from[i][j] = x_from
		aiftm_y_from[i][j] = y_from
		AiRed_Strategy_Insert_2015(i, j, 1, unit)
	end
end

function AiRed_Strategy_Insert_2015(i, j, slot, unit, option1, option2)
	if (option2 == nil) then
		option2 = unit
		if (option1 == nil) then
			option1 = unit
		end
	end
	if (slot == 2) then
		aiftm_unit2[i][j] = unit
		aiftm_unit2_option1[i][j] = option1
		aiftm_unit2_option2[i][j] = option2
	elseif (slot == 3) then
		aiftm_unit3[i][j] = unit
		aiftm_unit3_option1[i][j] = option1
		aiftm_unit3_option2[i][j] = option2
	else
		aiftm_unit[i][j] = unit
		aiftm_unit_option1[i][j] = option1
		aiftm_unit_option2[i][j] = option2
	end
end

function AiRed_Strategy_Choice_2015(i, j, unit, or1, unit2, or2, unit3, slot)
	if (slot == nil) then
		slot = 1
	end
	if (unit2 == nil) then
		if (type (or1) == "string") then
			AiRed_Strategy_Insert_2014(i, j, unit)
		else
			AiRed_Strategy_Insert_2014(i, j, unit, or1)
		end
	else
		aiftm_unit[i][j] = unit
		if ((or1 == "and") and (or1 == "and")) then 
			AiRed_Strategy_Insert_2015(i, j, slot, unit, unit2, unit3)
		elseif ((or1 == "or") and (or1 == "or")) then 
			AiRed_Strategy_Insert_2015(i, j, 1, unit)
			AiRed_Strategy_Insert_2015(i, j, 2, unit2)
			AiRed_Strategy_Insert_2015(i, j, 3, unit3)
		elseif ((or1 == "and") and (or1 == "or")) then 
			AiRed_Strategy_Insert_2015(i, j, 1, unit, unit2)
			AiRed_Strategy_Insert_2015(i, j, 2, unit3)
		elseif ((or1 == "or") and (or1 == "and")) then 
			AiRed_Strategy_Insert_2015(i, j, 1, unit)
			AiRed_Strategy_Insert_2015(i, j, 2, unit2, unit3)
		end
	end
end

DefineAi("ai_red_2015", "*", "ai_red_2015", AiRed_2015)
DefineAi("ai_frontlines_2015", "*", "ai_frontlines_2015", AiFrontlines_2015)
DefineAi("ai_nightmare_2015", "*", "ai_nightmare_2015", AiNightmare_2015)