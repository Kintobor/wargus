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

function AiNathan_2015()
	AiCharacter_Set_Name_2015("Nathan Withers")
	--Check game type.
	if (GameDefinition["Name"] == "For the Motherland") then
		AiAya_FtM_2015(AiPlayer())
	elseif (GameDefinition["Name"] == "Nightmare") then
		AiNathan_Nightmare_2015(AiPlayer())
	elseif (GameDefinition["Name"] == "Escape") then
		AiNathan_Escape_2015()
	else
		AiNathan_Skirmish_2015()
	end
end

--  ______________________                           ______________________
--                                E S C A P E        

function AiNathan_Escape_2015()
	if (GameDefinition["Map"]["Name"] == "Seawill Forests") then
		AiNathan_Escape_Seawill_Forests_2015()
	end
end

function AiNathan_Escape_Seawill_Forests_2015()
	local NathanEnemy = 4 -- Who we want to avoid.
	local NathanAlly = 0 -- Who we want to follow.
	if (NathanTimer == nil) then 
		NathanTimer = 20
	elseif (NathanTimer < 1) then 
		NathanTimer = 40
	else 
		NathanTimer = NathanTimer - 1 
	end
	if (GameCycle < 50) then
		OrderUnitSquare(AiPlayer(), AiDestroyer(), 7, 184, 1, 3, 4, 125)
		OrderUnitSquare(AiPlayer(), AiDestroyer(), 10, 184, 1, 3, 75, 180)
		OrderUnitSquare(AiPlayer(), AiHeroSoldier(), 28, 32, 1, 1, 60, 92)
	elseif (GameCycle < 100) then
		OrderUnitSquare(AiPlayer(), AiSoldier(), 29, 34, 1, 3, 50, 93)
		OrderUnitSquare(AiPlayer(), AiSoldier(), 27, 37, 1, 3, 107, 71)
	elseif ((GameCycle > 200) and (GameCycle < 300)) then
		OrderUnitSquare(AiPlayer(), AiSoldier(), 27, 31, 3, 1, 53, 79)
	elseif ((UnitNear(4, AiHeroSoldier(4), 61, 91, 6) == true) and (GetPlayerData(4, "UnitTypesCount", AiSoldier(4)) == 0)) then
		SetDiplomacy(3, "allied", 6)
		AiForce(3, {AiHeroSoldier(AiPlayer()), 1, AiSoldier(AiPlayer()), 3}, false)
		AiAttackWithForce(3)
		NathanTimer = 40
		SetDiplomacy(3, "enemy", 6)
	elseif ArmyNear(4, 61, 91, 7) then
		MoveUnitQuick(AiPlayer(), AiHeroSoldier(), 28, 32, 60, 92, 15, "move")
		if (UnitNear(4, AiHeroSoldier(4), 61, 91, 6) == true) then
			MoveUnitQuick(AiPlayer(), AiSoldier(), 61, 91, 61, 91, 30)
		else
			MoveUnitQuick(AiPlayer(), AiSoldier(), 61, 91, 61, 91, 15)
		end
	elseif ArmyNear(4, 45, 96, 3) then
		MoveUnitQuick(AiPlayer(), AiSoldier(), 45, 96, 61, 91, 20)
	elseif ArmyNear(4, 70, 105, 6) then
		MoveUnitQuick(AiPlayer(), AiSoldier(), 70, 105, 64, 91, 3)
	elseif ((GameCycle > 400) and (GameCycle < 500)) then
		OrderUnitSquare(AiPlayer(), AiSoldier(), 28, 34, 1, 3, 72, 86, "move")
	elseif ((GameCycle > 600) and (GameCycle < 700)) then
		OrderUnitSquare(AiPlayer(), AiSoldier(), 28, 34, 1, 3, 37, 24)
		OrderUnitSquare(AiPlayer(), AiSoldier(), 27, 30, 3, 1, 99, 104)
	elseif ((GameCycle > 800) and (GameCycle < 900)) then
		MoveUnitQuick(AiPlayer(), AiSoldier(), 25, 80, 27, 35, 1, "move")
	elseif ((GameCycle > 900) and (GameCycle < 1000)) then
		OrderUnitSquare(AiPlayer(), AiSoldier(), 29, 34, 1, 3, 50, 93)
		OrderUnitSquare(AiPlayer(), AiSoldier(), 27, 31, 3, 1, 53, 79)
		OrderUnitSquare(AiPlayer(), AiSoldier(), 28, 34, 1, 3, 72, 86, "move")
		OrderUnitSquare(AiPlayer(), AiSoldier(), 27, 29, 3, 1, 91, 42)
	elseif (NathanTimer == 40) then
		if (MoveNavyGrid(AiPlayer(), {{7, 157},{51, 166},{74, 156},{108, 157}}, {{14, 133},{50, 137},{83, 134},{117, 132}}, 20, NathanEnemy, NathanAlly) == true) then
		elseif (MoveNavyGrid(AiPlayer(), {{14, 133},{50, 137},{83, 134},{117, 132}}, {{7, 157},{51, 166},{74, 156},{108, 157}}, 20, NathanEnemy, NathanAlly) == true) then
		end
	elseif (NathanTimer == 30) then
		if (MoveNavyGrid(AiPlayer(), {{9, 180},{52, 179},{81, 178},{115, 175}}, {{7, 157},{51, 166},{74, 156},{108, 157}}, 20, NathanEnemy, NathanAlly) == true) then
		elseif (MoveNavyGrid(AiPlayer(), {{7, 157},{51, 166},{74, 156},{108, 157}}, {{9, 180},{52, 179},{81, 178},{115, 175}}, 20, NathanEnemy, NathanAlly) == true) then
		end
	elseif ((NathanTimer == 1) and (GameCycle > 6000)) then
		for NathanX=1,4 do
			if (MoveArmyGrid(AiPlayer(), {{NathanX*25, 25},{NathanX*25, 50},{NathanX*25, 75},{NathanX*25, 100}}, {{NathanX*25+100, 25},{NathanX*25+75, 50},{NathanX*25+50, 75},{NathanX*25+25, 25}}, 40, NathanAlly, NathanEnemy) == true) then
			end
		end
	elseif ((NathanTimer == 20) and (GameCycle > 6000)) then
		for NathanX=1,4 do
			if (MoveArmyGrid(AiPlayer(), {{NathanX*25+25, 100},{NathanX*25+25, 75},{NathanX*25+25, 50},{NathanX*25+25, 25}}, {{NathanX*25, 25},{NathanX*25, 50},{NathanX*25, 75},{NathanX*25, 100}}, 40, NathanAlly, NathanEnemy) == true) then
			end
		end
	end
end

--  ______________________                           ______________________
--                            M O T H E R L A N D    

--  ______________________                           ______________________
--                             N I G H T M A R E     

function AiNathan_Nightmare_2015(player)
	if ((GameCycle < 50) or (aiftm_action[player][aiftm_index[player]] == "loop")) then
		if (GameDefinition["Map"]["Name"] == "Mountain Pass") then
			if (player == 11) then
				AiNathan_Nightmare_Mountain_Pass_2015(player)
			else
				AiLucas_Skirmish_Standard_2015()
			end
		end
		if (GameDefinition["Map"]["Name"] == "Diablo's Maze") then
			AiKiah_Nightmare_Diablos_Maze_2016(player)
		end
	end
	AiRed_2015()
end

function AiNathan_Nightmare_Mountain_Pass_2015(player)
	aiftm_terminate[player] = 1000
	if (player == 11) then
		AiRed_Strategy_Action_2015(player, 0, "move", 1, AiWise(), 14, 8, 7, 35)
		AiRed_Strategy_Action_2015(player, 1, "move", 1, AiWise(), 1, 126, 14, 114)
		AiRed_Strategy_Action_2015(player, 2, "move", 1, AiWise(), 71, 126, 103, 114)
		AiRed_Strategy_Action_2015(player, 3, "move", 1, AiWise(), 124, 44, 120, 14)
		AiRed_Strategy_Action_2015(player, 4, "skip", 1)
		AiRed_Strategy_Action_2015(player, 5, "summon", 4, AiFodder(), 71, 126)
		AiRed_Strategy_Action_2015(player, 6, "gold", 4000)
		AiRed_Strategy_Action_2015(player, 7, "oil", 1500)
		AiRed_Strategy_Action_2015(player, 8, "summon", 1, AiWorker(), 16, 10)
		AiRed_Strategy_Action_2015(player, 9, "summon", 1, AiFodder(), 16, 10)
		AiRed_Strategy_Action_2015(player, 10, "summon", 2, AiFodder(), 16, 10)
		AiRed_Strategy_Action_2015(player, 11, "skip", 1)
		AiRed_Strategy_Action_2015(player, 12, "summon", 1, AiFodder(), 16, 10)
		AiRed_Strategy_Action_2015(player, 13, "summon", 1, AiFodder(), 16, 10)
		AiRed_Strategy_Action_2015(player, 14, "summon", 1, AiEliteShooter(), 16, 10)
		AiRed_Strategy_Action_2015(player, 15, "skip", 1)
		AiRed_Strategy_Action_2015(player, 16, "skip", 1)
		AiRed_Strategy_Action_2015(player, 17, "summon", 1, AiSoldier(), 124, 44)
		AiRed_Strategy_Action_2015(player, 18, "summon", 1, AiShooter(), 124, 44)
		AiRed_Strategy_Action_2015(player, 19, "summon", 4, AiFodder(), 16, 10)
		AiRed_Strategy_Action_2015(player, 20, "summon", 3, AiShooter(), 0, 127)
		AiRed_Strategy_Action_2015(player, 21, "skip", 1)
		AiRed_Strategy_Action_2015(player, 22, "summon", 3, AiShooter(), 71, 126)
		AiRed_Strategy_Action_2015(player, 23, "summon", 1, AiSoldier(), 124, 44)
		AiRed_Strategy_Action_2015(player, 24, "summon", 1, AiShooter(), 124, 44)
		AiRed_Strategy_Action_2015(player, 25, "summon", 1, "ranged", 0, 127)
		AiRed_Strategy_Action_2015(player, 26, "summon", 1, AiCavalryMage(), 0, 127)
		AiRed_Strategy_Action_2015(player, 27, "summon", 1, "elite", 124, 44)
		AiRed_Strategy_Action_2015(player, 28, "skip", 1)
		AiRed_Strategy_Action_2015(player, 29, "summon", 5, "fodder", 71, 126)
		AiRed_Strategy_Action_2015(player, 30, "skip", 1)
		AiRed_Strategy_Action_2015(player, 31, "summon", 5, "fodder", 16, 10)
		AiRed_Strategy_Action_2015(player, 32, "skip", 1)
		AiRed_Strategy_Action_2015(player, 33, "summon", 2, "ranged", 124, 44)
		AiRed_Strategy_Action_2015(player, 34, "skip", 1)
		AiRed_Strategy_Action_2015(player, 35, "summon", 2, "elite", 124, 44)
		AiRed_Strategy_Action_2015(player, 36, "skip", 1)
		AiRed_Strategy_Action_2015(player, 37, "summon", 1, "hero", 0, 127)
		AiRed_Strategy_Action_2015(player, 38, "skip", 1)
		AiRed_Strategy_Action_2015(player, 39, "summon", 1, AiCatapult(), 71, 126)
		AiRed_Strategy_Action_2015(player, 40, "summon", 1, "air", 16, 10)
		AiRed_Strategy_Action_2015(player, 41, "skip", 10)
		AiRed_Strategy_Action_2015(player, 42, "loop", 27)
	end
end

--  ______________________                           ______________________
--                              S K I R M I S H      

function AiNathan_Skirmish_2015()
	if ((GameDefinition["Map"]["Name"] == "Northern Swamp") or (GameDefinition["Map"]["Name"] == "Southern Swamp")) then
		AiNathan_Skirmish_Northern_Swamp_2015()
	elseif (GameDefinition["Map"]["Name"] == "Fall of Genesis Castle") then
		AiNathan_Skirmish_Fall_Genesis_2015()
	elseif (GameDefinition["Map"]["Name"] == "Sea Preparations") then
		AiNathan_Skirmish_Sea_Preparations_2015()
	else
		AiLucas_Skirmish_Standard_2015()
	end
end

function AiNathan_Skirmish_Sea_Preparations_2015()
	if ((GetPlayerData(11, "UnitTypesCount", AiCityCenter()) > 0) or (GetPlayerData(11, "UnitTypesCount", AiBestCityCenter()) > 0) or (GetPlayerData(11, "UnitTypesCount", AiBetterCityCenter()) > 0)) then
		-- There is a town hall to rescue!
		if (MoveArmyQuick(AiPlayer(), 121, 57, 121, 115, 6) == true) then
		elseif (MoveArmyQuick(AiPlayer(), 103, 67, 121, 57, 6) == true) then
		end
	else
		AiLucas_Skirmish_Standard_2015()
	end
end

function AiNathan_Skirmish_Northern_Swamp_2015()
	if (GameDefinition["Map"]["Name"] == "Northern Swamp") then
		if (GameCycle < 2500) then
			if (GameCycle < 200) then
				OrderUnitSquare(AiPlayer(), AiSoldier(), 11, 68, 1, 3, 96, 45, "attack")
				OrderUnitSquare(AiPlayer(), AiSoldier(), 18, 72, 3, 1, 97, 46, "attack")
				OrderUnitSquare(AiPlayer(), AiSoldier(), 24, 74, 3, 1, 102, 46, "attack")
				OrderUnitSquare(AiPlayer(), AiSoldier(), 29, 74, 3, 1, 107, 46, "attack")
				OrderUnitSquare(AiPlayer(), AiShooter(), 10, 68, 1, 3, 95, 45)
				OrderUnitSquare(AiPlayer(), AiShooter(), 18, 73, 3, 1, 98, 46)
				OrderUnitSquare(AiPlayer(), AiShooter(), 24, 75, 3, 1, 103, 46)
				OrderUnitSquare(AiPlayer(), AiShooter(), 29, 75, 3, 1, 108, 46)
			elseif ((GameCycle > 1100) and (GameCycle < 1800)) then
				MoveUnitQuick(AiPlayer(), AiCavalry(), 108, 28, 3, 92, 3)
				MoveUnitQuick(AiPlayer(), AiCavalry(), 104, 28, 15, 100, 3)
			elseif ((GameCycle > 1800) and (GameCycle < 2500)) then
				MoveUnitQuick(AiPlayer(), AiSoldier(), 108, 27, 96, 45, 3)
				MoveUnitQuick(AiPlayer(), AiSoldier(), 104, 27, 97, 46, 3)
				MoveUnitQuick(AiPlayer(), AiSoldier(), 101, 27, 102, 46, 3)
				MoveUnitQuick(AiPlayer(), AiSoldier(), 98, 27, 107, 46, 3)
				if (GameCycle > 1900) then
					MoveUnitQuick(AiPlayer(), AiShooter(), 108, 28, 96, 46, 3)
					MoveUnitQuick(AiPlayer(), AiShooter(), 104, 28, 97, 47, 3)
					MoveUnitQuick(AiPlayer(), AiShooter(), 101, 28, 102, 47, 3)
					MoveUnitQuick(AiPlayer(), AiShooter(), 98, 28, 107, 47, 3)
				end
			end
		end
	elseif (GameDefinition["Map"]["Name"] == "Southern Swamp") then
		if (GameCycle < 2500) then
			if (GameCycle < 100) then
				OrderUnitSquare(AiPlayer(), AiSoldier(), 44, 95, 1, 3, 26, 62)
				OrderUnitSquare(AiPlayer(), AiSoldier(), 53, 95, 1, 3, 49, 74)
				OrderUnitSquare(AiPlayer(), AiSoldier(), 48, 97, 2, 1, 34, 62)
			elseif ((GameCycle > 400) and (GameCycle < 500)) then
				OrderUnitSquare(AiPlayer(), AiSoldier(), 48, 96, 2, 1, 61, 62)
			elseif ((GameCycle > 600) and (GameCycle < 700)) then
				OrderUnitSquare(AiPlayer(), AiSoldier(), 48, 95, 2, 1, 65, 88)
			elseif ((GameCycle > 700) and (GameCycle < 2400)) then
				if (GetPlayerData(AiPlayer(), "UnitTypesCount", AiScout()) > 0) then
					if (MoveUnitQuick(AiPlayer(), AiScout(), 30, 59, 48, 90, nil, "move") == true) then 
					elseif (MoveUnitQuick(AiPlayer(), AiScout(), 24, 46, 30, 59, nil, "move") == true) then 
					elseif (MoveUnitQuick(AiPlayer(), AiScout(), 21, 72, 24, 46, nil, "move") == true) then 
					elseif (MoveUnitQuick(AiPlayer(), AiScout(), 35, 43, 21, 72, nil, "move") == true) then 
					elseif (MoveUnitQuick(AiPlayer(), AiScout(), 41, 69, 35, 43, nil, "move") == true) then 
					elseif (MoveUnitQuick(AiPlayer(), AiScout(), 66, 8, 41, 69, nil, "move") == true) then 
					elseif (MoveUnitQuick(AiPlayer(), AiScout(), 66, 8, 18, 72, 3, "move") == true) then 
					elseif (MoveUnitQuick(AiPlayer(), AiScout(), 39, 55, 18, 53, 3, "move") == true) then 
					elseif (MoveUnitQuick(AiPlayer(), AiScout(), 41, 69, 39, 55, nil, "move") == true) then 
					end
				elseif (GetPlayerData(AiPlayer(), "UnitTypesCount", AiScientific()) > 0) then
					CreateUnit(AiScout(), AiPlayer(), {48, 90})
					SetPlayerData(AiPlayer(), "Resources", "gold", GetPlayerData(AiPlayer(), "Resources", "gold") - 500)
					SetPlayerData(AiPlayer(), "Resources", "wood", GetPlayerData(AiPlayer(), "Resources", "wood") - 100)
				end
			elseif ((GameCycle > 2400) and (GameCycle < 2500)) then
				MoveUnitQuick(AiPlayer(), AiCavalry(), 26, 64, 48, 96, 5)
			end
		elseif ((UnitNear(4, AiFlyer(4), 10, 117, 10) == true) and (UnitNear(4, AiCavalry(4), 10, 117, 10) == false) and (UnitNear(4, AiShooter(4), 10, 117, 10) == false) and (UnitNear(4, AiSoldier(4), 10, 117, 10) == false)) then
			MoveUnitQuick(AiPlayer(), AiCavalry(), 43, 103, 10, 117, 10)
		elseif ((GetPlayerData(4, "UnitTypesCount", AiBetterCityCenter(4)) == 0) and (GetPlayerData(0, "UnitTypesCount", AiBetterCityCenter(0)) == 0)) then
			if (GetPlayerData(AiPlayer(), "UnitTypesCount", AiAirport()) ~= 0) then
				if (GetPlayerData(AiPlayer(), "Resources", "gold") > 2499) then
					CreateUnit(AiFlyer(), AiPlayer(), {39, 120})
					SetPlayerData(AiPlayer(), "Resources", "gold", GetPlayerData(AiPlayer(), "Resources", "gold") - 2500)
					if (GetPlayerData(AiPlayer(), "Resources", "gold") < 5000) then
						AiNephrite_Attack_2013("force")
					end
				end
			end
		elseif (((UnitNear(4, AiCavalry(4), 35, 115, 25) == true) or (UnitNear(4, AiSoldier(4), 41, 101, 15) == true) or (UnitNear(4, AiShooter(4), 41, 101, 15) == true) or (UnitNear(4, AiEliteShooter(4), 41, 101, 15) == true)) or ((UnitNear(0, AiCavalry(0), 41, 101, 15) == true) or (UnitNear(0, AiSoldier(0), 41, 101, 15) == true) or (UnitNear(0, AiShooter(0), 41, 101, 15) == true) or (UnitNear(0, AiEliteShooter(0), 41, 101, 15) == true))) then 
			-- Enemy is going for my base!
			if (UnitNear(4, AiCavalry(4), 41, 101, 15) == true) then
				MoveUnitQuick(AiPlayer(), AiCavalry(), 42, 103, 24, 63, 8)
				MoveUnitQuick(AiPlayer(), AiCavalry(), 42, 103, 51, 76, 8)
			else
				MoveUnitQuick(AiPlayer(), AiCavalry(), 19, 30, 24, 63, 8)
				MoveUnitQuick(AiPlayer(), AiCavalry(), 19, 30, 51, 76, 8)
			end
			MoveUnitQuick(AiPlayer(), AiCavalry(), 42, 103, 100, 58, 20)
			MoveUnitQuick(AiPlayer(), AiCavalry(), 42, 103, 102, 26, 15)
		elseif (UnitNear(AiPlayer(), AiGuardTower(), 30, 62, 2) == true) then 
			-- First line of defence.
			if ((UnitNear(0, AiWorker(0), 70, 88, 10) == true) or (UnitNear(4, AiWorker(4), 70, 88, 10) == true)) then 
				-- Enemy forces are using middle gold mine.
				MoveUnitQuick(AiPlayer(), AiSoldier(), 74, 86, 49, 71, 8)
			elseif (UnitNear(AiPlayer(), AiCavalry(), 48, 96, 5)) then
				MoveUnitQuick(AiPlayer(), AiCavalry(), 26, 64, 48, 96, 5)
			end
		elseif (UnitNear(AiPlayer(), AiGuardTower(), 46, 70, 2) == true) then 
			-- Second line of defence.
			if ((UnitNear(0, AiWorker(0), 70, 88, 10) == true) or (UnitNear(4, AiWorker(4), 70, 88, 10) == true)) then 
				-- Enemy forces are using middle gold mine.
				MoveUnitQuick(AiPlayer(), AiCavalry(), 72, 87, 51, 68, 2)
			elseif (UnitNear(AiPlayer(), AiCavalry(), 44, 96, 2)) then
				MoveUnitQuick(AiPlayer(), AiCavalry(), 51, 68, 44, 96, 2)
			elseif (GetPlayerData(AiPlayer(), "UnitTypesCount", AiFlyer()) > 0) then
				if (MoveUnitQuick(AiPlayer(), AiFlyer(), 65, 80, 39, 120) == true) then 
				elseif (MoveUnitQuick(AiPlayer(), AiFlyer(), 69, 32, 65, 80) == true) then 
				elseif (MoveUnitQuick(AiPlayer(), AiFlyer(), 53, 18, 69, 32) == true) then 
				elseif (MoveUnitQuick(AiPlayer(), AiFlyer(), 57, 0, 53, 18) == true) then 
				end
			elseif ((GetPlayerData(AiPlayer(), "Resources", "gold") > 2500) and (GetPlayerData(AiPlayer(), "UnitTypesCount", AiAirport()) > 0)) then
				CreateUnit(AiFlyer(), AiPlayer(), {39, 120})
				SetPlayerData(AiPlayer(), "Resources", "gold", GetPlayerData(AiPlayer(), "Resources", "gold") - 2500)
			end
		else
		
		end
	end
	if (GetPlayerData(4, "UnitTypesCount", AiFlyer(4)) > 0) then
		if ((((GetPlayerData(AiPlayer(), "Resources", "gold") > 2500) and (GetPlayerData(AiPlayer(), "UnitTypesCount", AiFlyer()) == 0)) or ((GetPlayerData(AiPlayer(), "Resources", "gold") > 7500) and (GetPlayerData(AiPlayer(), "UnitTypesCount", AiFlyer()) < (GetPlayerData(4, "UnitTypesCount", AiFlyer(4)))))) and (GetPlayerData(AiPlayer(), "UnitTypesCount", AiAirport()) > 0)) then
			CreateUnit(AiFlyer(), AiPlayer(), {39, 120})
			SetPlayerData(AiPlayer(), "Resources", "gold", GetPlayerData(AiPlayer(), "Resources", "gold") - 2500)
		end
		AiJadeite_Force_2010(0, AiShooter(), 6, AiFlyer(), GetPlayerData(4, "UnitTypesCount", AiFlyer(4)))
		if (GetPlayerData(AiPlayer(), "UnitTypesCount", AiScout()) > 0) then
			if (MoveUnitQuick(AiPlayer(), AiScout(), 2, 67, 46, 89, nil, "move") == true) then 
			elseif (MoveUnitQuick(AiPlayer(), AiScout(), 4, 11, 2, 67, nil, "move") == true) then 
			elseif (MoveUnitQuick(AiPlayer(), AiScout(), 15, 1, 4, 11, nil, "move") == true) then 
			elseif (MoveUnitQuick(AiPlayer(), AiScout(), 53, 7, 15, 1, nil, "move") == true) then 
			elseif (MoveUnitQuick(AiPlayer(), AiScout(), 74, 45, 53, 7, nil, "move") == true) then 
			elseif (MoveUnitQuick(AiPlayer(), AiScout(), 99, 69, 74, 45, nil, "move") == true) then 
			elseif (MoveUnitQuick(AiPlayer(), AiScout(), 27, 93, 99, 69, nil, "move") == true) then 
			elseif (MoveUnitQuick(AiPlayer(), AiScout(), 46, 89, 68, 6, 5, nil, "move") == true) then 
			end
		elseif ((GetPlayerData(AiPlayer(), "UnitTypesCount", AiScientific()) > 0) and (GetPlayerData(4, "UnitTypesCount", AiFlyer(4)) == 3)) then
			CreateUnit(AiScout(), AiPlayer(), {46, 89})
			SetPlayerData(AiPlayer(), "Resources", "gold", GetPlayerData(AiPlayer(), "Resources", "gold") - 500)
			SetPlayerData(AiPlayer(), "Resources", "wood", GetPlayerData(AiPlayer(), "Resources", "wood") - 100)
		end
	elseif (GetPlayerData(AiPlayer(), "UnitTypesCount", AiFlyer()) > 2) then
		if (MoveUnitQuick(AiPlayer(), AiFlyer(), 2, 125, 35, 117, 20) == true) then 
		elseif (MoveUnitQuick(AiPlayer(), AiFlyer(), 0, 0, 5, 30, 5) == true) then 
		else
			MoveUnitQuick(AiPlayer(), AiFlyer(), 0, 0, 5, 122, 5)
		end
	elseif (GetPlayerData(AiPlayer(), "UnitTypesCount", AiBarracks()) > 0) then
		AiJadeite_Cavalry_2010()
	else
		AiJadeite_Flyer_2010()
	end
end

function AiNathan_Skirmish_Fall_Genesis_2015()
	-- Wild Attacker
	AiJadeite_Intermittent_2010()
	if (GetPlayerData(AiPlayer(), "UnitTypesCount", AiBarracks()) > 0) then
		if (GetPlayerData(AiPlayer(), "UnitTypesCount", AiSoldier()) > 3) then
			AiJadeite_Force_2010(3, AiSoldier(), 15, AiShooter(), 10, AiCatapult(), 4)
			if (GetPlayerData(AiPlayer(), "UnitTypesCount", AiSoldier()) > 8) then
				AiJadeite_Upgrade_2010(AiSoldier())
				AiJadeite_Upgrade_2010(AiShooter())
				AiJadeite_Attack_2010(3)
			end
		else
			AiJadeite_Force_2010(0, AiSoldier(), 4)
		end
	end
end

--  ______________________                           ______________________
--                                 W I L D S         

DefineAi("Nathan Withers", "*", "ai_red_2015", AiNathan_2015)