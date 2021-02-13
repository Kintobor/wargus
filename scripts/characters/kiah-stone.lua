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

function AiKiah_2015()
	AiCharacter_Set_Name_2015("Kiah Stone")
	--Check game type.
	if (GameDefinition["Name"] == "For the Motherland") then
		AiAya_FtM_2015(AiPlayer())
	elseif ((GameDefinition["Name"] == "Skirmish") or (GameDefinition["Name"] == "Nightmare")) then
		AiKiah_Skirmish_2015()
	elseif (GameDefinition["Name"] == "Escape") then
		AiKiah_Escape_2015()
	end
end

--  ______________________                           ______________________
--                                E S C A P E        

function AiKiah_Escape_2015()
	if (GameDefinition["Map"]["Name"] == "Shameful Display") then
		AiKiah_Escape_Shameful_Display_2015()
	end
end

function AiKiah_Escape_Shameful_Display_2015()
	if (GetPlayerData(AiPlayer(), "UnitTypesCount", AiHeroSoldier()) > 0) then
		if (MoveArmyQuick(AiPlayer(), 7, 55, 7, 7, 9) == true) then 
		--elseif (MoveArmyQuick(AiPlayer(), 105, 40, 118, 7, 9) == true) then 
		elseif ((UnitNear(0, AiHeroSoldier(0), 2, 2, 5) == true) or (UnitNear(0, AiHeroSoldier(0), 124, 2, 5) == true) or (UnitNear(4, AiHeroSoldier(4), 2, 2, 3) == true) or (UnitNear(4, AiHeroSoldier(4), 124, 2, 3) == true)) then
			if (LucasTimer == 5) then
				SetDiplomacy(2, "allied", 0)
				SetDiplomacy(0, "allied", 2)
				SetDiplomacy(2, "allied", 8)
				SetDiplomacy(8, "allied", 2)
			elseif (LucasTimer == 4) then
				AiForce(1, {AiEliteSoldier(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiEliteSoldier()), AiShooter(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiShooter()), AiSoldier(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiSoldier()), AiCatapult(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiCatapult())}, true)
				AiAttackWithForce(1)
				AiAttackWithForce(0)
			elseif (LucasTimer < 4) then
				SetDiplomacy(2, "enemy", 0)
				SetDiplomacy(0, "enemy", 2)
				SetDiplomacy(2, "enemy", 8)
				SetDiplomacy(8, "enemy", 2)
				MoveArmyQuick(AiPlayer(), 113, 28, 78, 112, 3, "patrol")
			end
		elseif ((GameCycle > 5000) and (GameCycle < 5100)) then
			AiForce(0, {AiEliteSoldier(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiEliteSoldier()), AiShooter(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiShooter()), AiSoldier(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiSoldier()), AiCatapult(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiCatapult())}, true)
		elseif (GameCycle < 1000) then
			-- South Left Pass
			if (GameCycle < 100) then
				MoveUnitQuick(AiPlayer(), AiSoldier(), 0, 71, 53, 55, 0)
				MoveUnitQuick(AiPlayer(), AiCatapult(), 3, 70, 56, 53, 1)
			elseif (GameCycle < 200) then
				OrderUnitSquare(AiPlayer(), AiShooter(), 53, 54, 2, 1, 0, 70)
				OrderUnitSquare(AiPlayer(), AiShooter(), 55, 54, 2, 1, 14, 70)
			elseif (GameCycle < 300) then
				OrderUnitSquare(AiPlayer(), AiSoldier(), 54, 55, 2, 1, 13, 72)
			elseif (GameCycle < 400) then
				MoveUnitQuick(AiPlayer(), AiSoldier(), 0, 70, 56, 55, 0)
			end
			-- South Middle Pass
			if (GameCycle < 100) then
				MoveUnitQuick(AiPlayer(), AiSoldier(), 51, 77, 61, 57, 0)
				MoveUnitQuick(AiPlayer(), AiSoldier(), 58, 76, 64, 57, 0)
				MoveUnitQuick(AiPlayer(), AiCatapult(), 54, 74, 64, 55, 1)
			elseif ((GameCycle > 300) and (GameCycle < 330)) then
				OrderUnitSquare(AiPlayer(), AiShooter(), 61, 56, 2, 1, 50, 76)
				OrderUnitSquare(AiPlayer(), AiShooter(), 63, 56, 2, 1, 57, 74)
			elseif ((GameCycle > 600) and (GameCycle < 700)) then
				MoveUnitQuick(AiPlayer(), AiSoldier(), 41, 53, 60, 55, 8)
			end
			-- Middle Island Pass
			if ((GameCycle > 500) and (GameCycle < 550)) then
				OrderUnitSquare(AiPlayer(), AiShooter(), 70, 64, 4, 1, 63, 59)
				OrderUnitSquare(AiPlayer(), AiSoldier(), 77, 69, 4, 1, 102, 63)
			elseif ((GameCycle > 600) and (GameCycle < 650)) then
				OrderUnitSquare(AiPlayer(), AiSoldier(), 70, 65, 4, 1, 63, 60)
				OrderUnitSquare(AiPlayer(), AiShooter(), 77, 68, 4, 1, 102, 62)
				MoveUnitQuick(AiPlayer(), AiCatapult(), 68, 57, 74, 64, 1)
				MoveUnitQuick(AiPlayer(), AiCatapult(), 105, 61, 81, 68, 1)
			end
		else
			if ((UnitNear(0, AiHeroSoldier(0), 100, 100, 25) == true) or (UnitNear(4, AiHeroSoldier(4), 100, 100, 25) == true)) then
				if (LucasTimer == 6) then
					MoveArmyQuick(AiPlayer(), 114, 68, 105, 64, 1)
				elseif (LucasTimer == 4) then
					MoveArmyQuick(AiPlayer(), 114, 27, 100, 67, 1)
				elseif (LucasTimer == 3) then
					MoveArmyQuick(AiPlayer(), 72, 54, 99, 72, 1)
				elseif (LucasTimer == 2) then
					MoveArmyQuick(AiPlayer(), 104, 44, 102, 64, 1)
				elseif (LucasTimer == 5) then
					MoveArmyQuick(AiPlayer(), 115, 76, 103, 67, 1)
				end
			end
			if ((UnitNear(0, AiHeroSoldier(0), 119, 61, 5) == true) or (UnitNear(4, AiHeroSoldier(4), 119, 61, 5) == true)) then
				MoveArmyQuick(AiPlayer(), 119, 26, 65, 56, 5, "patrol")
			end
			if ((UnitNear(4, AiSoldier(4), 10, 26, 11) == true) or (UnitNear(4, AiHeroSoldier(4), 10, 26, 11) == true) or (UnitNear(0, AiSoldier(0), 10, 37, 11) == true) or (UnitNear(0, AiHeroSoldier(0), 10, 26, 11) == true)) then
				MoveUnitQuick(AiPlayer(), AiShooter(), 8, 21, 8, 54, 8)
				MoveUnitQuick(AiPlayer(), AiCatapult(), 9, 20, 8, 54, 8)
				MoveUnitQuick(AiPlayer(), AiSoldier(), 10, 23, 8, 54, 8)
				MoveUnitQuick(AiPlayer(), AiHeroSoldier(), 11, 21, 8, 54, 8)
				MoveUnitQuick(AiPlayer(), AiShooter(), 8, 25, 14, 71, 3)
				MoveUnitQuick(AiPlayer(), AiSoldier(), 11, 24, 14, 71, 3)
				MoveUnitQuick(AiPlayer(), AiShooter(), 9, 22, 1, 76, 3)
				MoveUnitQuick(AiPlayer(), AiSoldier(), 10, 21, 1, 76, 3)
				MoveUnitQuick(AiPlayer(), AiCatapult(), 9, 23, 1, 76, 3)
			elseif ((UnitNear(4, AiHeroSoldier(4), 32, 25, 8) == true) or (UnitNear(4, AiHeroSoldier(4), 50, 15, 8) == true) or (UnitNear(4, AiHeroSoldier(4), 39, 3, 3) == true) or (UnitNear(0, AiSoldier(0), 50, 15, 8) == true) or (UnitNear(0, AiHeroSoldier(0), 39, 3, 3) == true)) then
				MoveArmyQuick(AiPlayer(), 7, 55, 9, 22, 9)
				MoveArmyQuick(AiPlayer(), 48, 10, 68, 59, 9)
			elseif ((UnitNear(4, AiSoldier(4), 3, 76, 3) == true) or (UnitNear(4, AiShooter(4), 3, 76, 3) == true) or (UnitNear(0, AiSoldier(0), 17, 72, 5) == true) or (UnitNear(0, AiShooter(0), 17, 72, 5) == true)) then 
				-- Left Paths
				if ((UnitNear(4, AiSoldier(4), 3, 76, 3) == true) or (UnitNear(4, AiShooter(4), 3, 76, 3) == true) or (UnitNear(0, AiSoldier(0), 3, 76, 3) == true) or (UnitNear(0, AiShooter(0), 3, 76, 3) == true)) then 
					-- South Left 1 Path
					if ((UnitNear(AiPlayer(), AiSoldier(), 3, 69, 3) == true) or (UnitNear(AiPlayer(), AiShooter(), 3, 69, 3) == true)) then 
						MoveUnitQuick(AiPlayer(), AiShooter(), 1, 74, 14, 71, 3)
						MoveUnitQuick(AiPlayer(), AiSoldier(), 1, 76, 14, 71, 3)
					end
				elseif ((UnitNear(4, AiSoldier(4), 17, 72, 5) == true) or (UnitNear(4, AiShooter(4), 17, 72, 5) == true) or (UnitNear(0, AiSoldier(0), 17, 72, 5) == true) or (UnitNear(0, AiShooter(0), 17, 72, 5) == true)) then 
					-- South Left 2 Path
					MoveUnitQuick(AiPlayer(), AiShooter(), 14, 69, 1, 76, 3)
					MoveUnitQuick(AiPlayer(), AiCatapult(), 14, 71, 1, 76, 3)
				end
				if ((UnitNear(AiPlayer(), AiHeroSoldier(), 92, 45, 35) == true) or (UnitNear(AiPlayer(), AiHeroSoldier(), 87, 87, 35) == true)) then 
					MoveUnitQuick(AiPlayer(), AiShooter(), 8, 52, 106, 62, 3)
					MoveUnitQuick(AiPlayer(), AiCatapult(), 8, 50, 106, 62, 3)
					MoveUnitQuick(AiPlayer(), AiSoldier(), 6, 56, 106, 62, 3)
				end
				if ((UnitNear(4, AiHeroSoldier(4), 10, 76, 11) == true) and (GameCycle < 5000)) then
					MoveUnitQuick(AiPlayer(), AiShooter(), 9, 52, 66, 59, 5)
					MoveUnitQuick(AiPlayer(), AiCatapult(), 7, 50, 66, 59, 5)
					MoveUnitQuick(AiPlayer(), AiSoldier(), 6, 56, 66, 59, 5)
					MoveUnitQuick(AiPlayer(), AiHeroSoldier(), 8, 53, 66, 59, 5)
				end
			else 
				SetDiplomacy(2, "enemy", 0)
				SetDiplomacy(0, "enemy", 2)
				SetDiplomacy(2, "enemy", 8)
				SetDiplomacy(8, "enemy", 2)
			end
		end
	else
		AiForce(1, {AiEliteSoldier(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiEliteSoldier()), AiShooter(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiShooter()), AiSoldier(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiSoldier()), AiCatapult(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiCatapult())}, true)
		AiAttackWithForce(1)
		AiAttackWithForce(0)
	end
end

--  ______________________                           ______________________
--                            M O T H E R L A N D    

--  ______________________                           ______________________
--                             N I G H T M A R E     

function AiKiah_Nightmare_Diablos_Maze_2016(player)
	if (player == 8) then
		aiftm_terminate[player] = 1000	
		AiRed_Strategy_Action_2015(player, 0, "move", 1, AiWise(), 5, 252, 45, 232)
		AiRed_Strategy_Action_2015(player, 1, "move", 1, AiWise(), 133, 254, 44, 233)
		AiRed_Strategy_Action_2015(player, 2, "skip", 20)
		if (GetPlayerData(AiPlayer(), "Resources", "gold") > 20000) then
			AiRed_Strategy_Action_2015(player, 3, "summon", 1, AiCatapult(), 0, 254)
			AiRed_Strategy_Action_2015(player, 4, "summon", 6, AiSoldier(), 0, 253)
			AiRed_Strategy_Action_2015(player, 5, "summon", 7, AiShooter(), 2, 254)
			AiRed_Strategy_Action_2015(player, 6, "summon", 1, AiCavalryMage(), 1, 255)
		else
			AiRed_Strategy_Action_2015(player, 3, "summon", 2, AiFodder(), 0, 254)
			AiRed_Strategy_Action_2015(player, 4, "summon", 2, AiFodder(), 0, 253)
			AiRed_Strategy_Action_2015(player, 5, "skip", 1)
			AiRed_Strategy_Action_2015(player, 6, "skip", 1)
		end
		AiRed_Strategy_Action_2015(player, 7, "summon", 1, AiWorker(), 4, 252)
		AiRed_Strategy_Action_2015(player, 8, "move area", 1, AiWorker(), 10, 10, 4, 252)
		if (GetPlayerData(AiPlayer(), "Resources", "gold") > 20000) then
			AiRed_Strategy_Action_2015(player, 9, "summon", 1, AiEliteShooter(), 2, 254)
		else
			AiRed_Strategy_Action_2015(player, 9, "summon", 1, AiSoldier(), 5, 250)
		end
		AiRed_Strategy_Action_2015(player, 10, "summon", 2, AiSoldier(), 6, 250)
		AiRed_Strategy_Action_2015(player, 11, "move area", 5, AiFodder(), 1, 125, 5, 250)
		if (GetPlayerData(AiPlayer(), "Resources", "gold") > 20000) then
			AiRed_Strategy_Action_2015(player, 12, "summon", 1, AiShooter(), 131, 255)
			AiRed_Strategy_Action_2015(player, 13, "summon", 2, AiShooter(), 133, 254)
			AiRed_Strategy_Action_2015(player, 14, "summon", 3, AiSoldier(), 132, 255)
		else
			AiRed_Strategy_Action_2015(player, 14, "summon", 1, AiEliteShooter(), 131, 255)
			AiRed_Strategy_Action_2015(player, 12, "summon", 1, AiFodder(), 133, 254)
			AiRed_Strategy_Action_2015(player, 13, "summon", 1, AiFodder(), 132, 255)
		end
		AiRed_Strategy_Action_2015(player, 15, "move area", 1, AiWorker(), 10, 10, 4, 252)
		AiRed_Strategy_Action_2015(player, 16, "move area", 5, AiFodder(), 135, 5, 1, 125)
		AiRed_Strategy_Action_2015(player, 17, "summon", 1, AiSoldier(), 132, 254)
		AiRed_Strategy_Action_2015(player, 18, "summon", 1, AiShooter(), 131, 252)
		AiRed_Strategy_Action_2015(player, 19, "summon", 4, AiFodder(), 128, 255)
		AiRed_Strategy_Action_2015(player, 20, "move area", 1, AiWise(), 253, 254, 133, 254)
		AiRed_Strategy_Action_2015(player, 21, "move area", 5, AiFodder(), 240, 7, 135, 5)
		AiRed_Strategy_Action_2015(player, 22, "summon", 3, AiShooter(), 6, 255)
		AiRed_Strategy_Action_2015(player, 23, "summon", 1, AiSoldier(), 7, 253)
		AiRed_Strategy_Action_2015(player, 24, "summon", 1, AiShooter(), 6, 254)
		AiRed_Strategy_Action_2015(player, 25, "summon", 1, "ranged", 7, 255)
		AiRed_Strategy_Action_2015(player, 26, "summon", 1, AiCavalryMage(), 7, 255)
		AiRed_Strategy_Action_2015(player, 27, "summon", 1, AiCatapult(), 247, 253)
		AiRed_Strategy_Action_2015(player, 28, "skip", 1)
		AiRed_Strategy_Action_2015(player, 29, "summon", 5, "fodder", 244, 253)
		AiRed_Strategy_Action_2015(player, 30, "skip", 1)
		AiRed_Strategy_Action_2015(player, 31, "summon", 5, "fodder", 245, 255)
		AiRed_Strategy_Action_2015(player, 32, "skip", 1)
		AiRed_Strategy_Action_2015(player, 33, "summon", 2, "ranged", 243, 251)
		AiRed_Strategy_Action_2015(player, 34, "skip", 1)
		AiRed_Strategy_Action_2015(player, 35, "summon", 2, "elite", 244, 250)
		AiRed_Strategy_Action_2015(player, 36, "skip", 1)
		AiRed_Strategy_Action_2015(player, 37, "summon", 1, "hero", 4, 250)
		AiRed_Strategy_Action_2015(player, 38, "skip", 1)
		AiRed_Strategy_Action_2015(player, 39, "summon", 1, "elite", 4, 251)
		AiRed_Strategy_Action_2015(player, 40, "summon", 1, "air", 0, 255)
		AiRed_Strategy_Action_2015(player, 41, "skip", 10)
		AiRed_Strategy_Action_2015(player, 42, "loop", 27)
	else
		AiKiah_Skirmish_Standard_2016()
		if (((GameCycle > 5270) and (GameCycle < 5300)) or ((GameCycle > 7480) and (GameCycle < 7500))) then
			MoveUnitQuick(AiPlayer(), AiShooter(), 114, 141, 123, 126, 10, "clear")
			MoveUnitQuick(AiPlayer(), AiShooter(), 117, 141, 123, 126, 10, "clear")
			MoveUnitQuick(AiPlayer(), AiShooter(), 104, 134, 123, 126, 10, "clear")
		elseif (((GameCycle > 4970) and (GameCycle < 5000)) or ((GameCycle > 7580) and (GameCycle < 7600))) then
			MoveUnitQuick(AiPlayer(), AiShooter(), 104, 131, 123, 126, 10, "clear")
			MoveUnitQuick(AiPlayer(), AiShooter(), 104, 128, 123, 126, 10, "clear")
		elseif (((GameCycle > 4070) and (GameCycle < 4100)) or ((GameCycle > 7880) and (GameCycle < 7900))) then
			MoveUnitQuick(AiPlayer(), AiShooter(), 129, 135, 123, 126, 10, "clear")
			MoveUnitQuick(AiPlayer(), AiShooter(), 127, 111, 123, 126, 10, "clear")
		elseif (((GameCycle > 4270) and (GameCycle < 4300)) or ((GameCycle > 8080) and (GameCycle < 8100))) then
			MoveUnitQuick(AiPlayer(), AiShooter(), 122, 113, 123, 126, 10, "clear")
			MoveUnitQuick(AiPlayer(), AiShooter(), 105, 111, 123, 126, 10, "clear")
			MoveUnitQuick(AiPlayer(), AiShooter(), 136, 139, 123, 126, 10, "clear")
		elseif (((GameCycle > 5170) and (GameCycle < 5200)) or ((GameCycle > 8180) and (GameCycle < 8200))) then
			MoveUnitQuick(AiPlayer(), AiSoldier(), 111, 142, 123, 126, 10, "clear")
			MoveUnitQuick(AiPlayer(), AiSoldier(), 120, 142, 123, 126, 10, "clear")
		elseif (((GameCycle > 4870) and (GameCycle < 4900)) or ((GameCycle > 8380) and (GameCycle < 8400))) then
			MoveUnitQuick(AiPlayer(), AiSoldier(), 103, 137, 123, 126, 10, "clear")
			MoveUnitQuick(AiPlayer(), AiSoldier(), 103, 122, 123, 126, 10, "clear")
		elseif (((GameCycle > 4470) and (GameCycle < 4500)) or ((GameCycle > 6580) and (GameCycle < 6600))) then
			MoveUnitQuick(AiPlayer(), AiSoldier(), 129, 140, 123, 126, 10, "clear")
			MoveUnitQuick(AiPlayer(), AiSoldier(), 136, 142, 123, 126, 10, "clear")
			MoveUnitQuick(AiPlayer(), AiSoldier(), 137, 142, 123, 126, 10, "clear")
		end
	end
end

--  ______________________                           ______________________
--                              S K I R M I S H      

function AiKiah_Skirmish_2015()
	if (GameDefinition["Map"]["Name"] == "Endodus") then
		AiKiah_Skirmish_Endodus_2015()
	elseif (GameDefinition["Map"]["Name"] == "Diablo's Maze") then
		AiKiah_Nightmare_Diablos_Maze_2016()
	else
		AiKiah_Skirmish_Standard_2016()
	end
end

function AiKiah_Skirmish_Standard_2016()
	AiLucas_Skirmish_Standard_2015()
end

function AiKiah_Skirmish_Endodus_2015()
	if (GetPlayerData(GetThisPlayer(), "TotalNumUnits") > 0) then
		if (GetNumUnitsAt(AiPlayer(), "unit-orc-shipyard", {0, 0}, {64, 64}) > 0) then
			AiForce(0, {AiDestroyer(), 4})
			AiSet(AiWorker(), 5)
			if (GetNumUnitsAt(AiPlayer(), AiFoundry(), {0, 0}, {64, 64}) > 0) then
				if (AiForce(1, {AiSoldier(), 10, AiTransporter(), 4, AiShooter(), 10}) == true) then
					AiAttackWithForce(1, true)
				elseif (GetNumUnitsAt(AiPlayer(), "unit-orc-watch-tower", {0, 0}, {64, 64}) > 0) then
					AiUpgradeTo(AiGuardTower())
				end
				if (GetNumUnitsAt(AiPlayer(), "unit-orc-oil-platform", {0, 0}, {64, 64}) > 0) then
					if (GetNumUnitsAt(AiPlayer(), "unit-orc-destroyer", {0, 0}, {64, 64}) < 2) then
						AiForce(3, {AiDestroyer(), 4})
					else
						AiAttackWithForce(3)
					end
				else
					AiSet(AiTanker(), 1)
					AiNeed(AiPlatform())
				end
			else
				AiSet(AiFoundry(), 1)
			end
		else
			if (GetNumUnitsAt(AiPlayer(), AiLumberMill(), {0, 0}, {64, 64}) > 0) then
				AiSet(AiHarbor(), 1)
			else
				AiSet(AiLumberMill(), 1)
			end
		end
	end
end

--  ______________________                           ______________________
--                                 W I L D S         

DefineAi("Kiah Stone", "*", "ai_red_2015", AiKiah_2015)