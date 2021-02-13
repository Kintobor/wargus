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

function AiRufus_2015()
	AiCharacter_Set_Name_2015("Rufus Norcross")
	if (GameDefinition["Name"] == "Escape") then
		AiRufus_Escape_2015()
	elseif ((GameDefinition["Name"] == "For the Motherland") or ((GameDefinition["Map"]["Name"] == "Canal Liberation") and (AiPlayer() == 8))) then
		AiRufus_FtM_2016(AiPlayer())
	elseif (GameDefinition["Name"] == "Skirmish") then
		AiRufus_Skirmish_2016()
	end
end

--  ______________________                           ______________________
--                                E S C A P E        

function AiRufus_Escape_2015()
	if (GameDefinition["Map"]["Name"] == "Seawill Forests") then
		AiRufus_Escape_Seawill_Forests_2015()
	end
end

function AiRufus_Escape_Seawill_Forests_2015()
	local RufusEnemy = 3
	local RufusAlly = 4
	if (RufusTimer == nil) then 
		RufusTimer = 30
	elseif (RufusTimer < 1) then 
		RufusTimer = 15
	else 
		RufusTimer = RufusTimer - 1 
	end
	if ((GameCycle > 0) and (GameCycle < 150)) then
		AiForce(0, {AiDestroyer(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiDestroyer()), AiTransporter(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiTransporter())})
		if (MoveUnitQuick(AiPlayer(), AiDestroyer(AiPlayer()), 84, 125, 96, 188, 0, "move") == true) then
		elseif (MoveUnitQuick(AiPlayer(), AiTransporter(AiPlayer()), 89, 123, 99, 188, 0, "move") == true) then
		elseif (MoveUnitQuick(AiPlayer(), AiDestroyer(AiPlayer()), 90, 125, 102, 188, 0, "move") == true) then
		end
	elseif ((UnitNear(AiPlayer(), AiTransporter(AiPlayer()), 90, 123, 5) == true) and (GameCycle > 1000) and (GameCycle < 1500)) then
		if (GetPlayerData(4, "UnitTypesCount", AiSoldier(4)) ~= 3) then
			for i=1,3 do
				TeleportUnit(4, AiSoldier(4), {90 - i, 122}, AiPlayer(), AiTransporter(AiPlayer()), {90 - i, 123}, false, 3)
			end
		elseif (GetPlayerData(4, "UnitTypesCount", AiHeroSoldier(4)) == 0) then
			TeleportUnit(4, AiHeroSoldier(4), {90 - 4, 122}, AiPlayer(), AiTransporter(AiPlayer()), {90 - 4, 123}, false, 3)
		elseif (UnitNear(AiPlayer(), AiTransporter(AiPlayer()), 90-4, 123, 1) == true) then
			MoveUnitQuick(AiPlayer(), AiTransporter(AiPlayer()), 87, 125, 90-4, 123, 1, "move")
		elseif (UnitNear(4, AiHeroSoldier(4), 86, 122, 0) == true) then
			MoveUnitQuick(4, AiHeroSoldier(4), 82+1, 117+0, 86, 122, 0, "move")
		elseif (UnitNear(4, AiSoldier(4), 87, 122, 0) == true) then
			MoveUnitQuick(4, AiSoldier(4), 82+0, 117+2, 87, 122, 0, "move")
		elseif (UnitNear(4, AiSoldier(4), 88, 122, 0) == true) then
			MoveUnitQuick(4, AiSoldier(4), 82+2, 117+2, 88, 122, 0, "move")
		elseif (UnitNear(4, AiSoldier(4), 89, 122, 0) == true) then
			MoveUnitQuick(4, AiSoldier(4), 82+4, 117+2, 89, 122, 0, "move")
		end
	elseif ((GetPlayerData(AiPlayer(), "UnitTypesCount", AiCatapult()) == 0) and (UnitNear(RufusEnemy, AiDestroyer(RufusEnemy), 93, 150, 8) == true) and (TeleportUnit(AiPlayer(), AiCatapult(), {93, 150}, AiPlayer(), AiTransporter(), {93, 150}, false, 3) == true)) then
	elseif ((GetPlayerData(AiPlayer(), "UnitTypesCount", AiCatapult()) == 0) and (UnitNear(RufusEnemy, AiDestroyer(RufusEnemy), 108, 151, 8) == true) and (TeleportUnit(AiPlayer(), AiCatapult(), {108, 151}, AiPlayer(), AiTransporter(), {108, 151}, false, 3) == true)) then
	elseif 	(RufusTimer == 1) then
		if (GameCycle > 1500) then
			if (MoveNavyGrid(AiPlayer(), {{120, 133},{101, 145},{86, 144},{68, 129}}, {{88, 126}}, 8, RufusEnemy, RufusAlly) == true) then
			elseif (MoveNavyGrid(AiPlayer(), {{73, 146},{48, 134},{102, 152}}, {{68, 129}}, 10, RufusEnemy, RufusAlly) == true) then
			elseif (MoveNavyGrid(AiPlayer(), {{73, 146},{103, 53},{71, 157},{108, 58}}, {{86, 144}}, 10, RufusEnemy, RufusAlly) == true) then
			elseif (MoveNavyGrid(AiPlayer(), {{78, 153},{106, 157}}, {{101, 145}, {120, 133}}, 10, RufusEnemy, RufusAlly) == true) then
			elseif (MoveNavyGrid(AiPlayer(), {{64, 171},{81, 171},{69, 156},{44, 149}}, {{78, 153},{106, 157},{73, 146},{103, 53}}, 10, RufusEnemy, RufusAlly) == true) then
			elseif (MoveNavyGrid(AiPlayer(), {{42, 175},{66, 184},{77, 182}}, {{48, 134},{102, 152},{71, 157},{108, 58}}, 10, RufusEnemy, RufusAlly) == true) then
			elseif ((GetPlayerData(AiPlayer(), "UnitTypesCount", AiCatapult()) == 1) and (GetPlayerData(AiPlayer(), "UnitTypesCount", AiDestroyer()) == 0)) then
				 if ((GetPlayerData(AiPlayer(), "UnitTypesCount", AiTransporter()) == 1) and (GameCycle < 3700)) then
					AiJadeite_Force_2010(0, {AiDestroyer(), 0})
					AiJadeite_Force_2010(1, {AiTransporter(), 1, AiCatapult(), 1})
					AiJadeite_Attack_2010(1)
				 else
					SetSharedVision(AiPlayer(), false, RufusAlly)
				 end
			end
		end
	end
end

--  ______________________                           ______________________
--                            M O T H E R L A N D    

function AiRufus_FtM_2016(player)
	if ((GameCycle < 200) or (aiftm_action[player][aiftm_index[player]] == "loop")) then
		--Check map.
		if (GameDefinition["Map"]["Name"] == "Canal Liberation") then
			AiRufus_FtM_Canal_Liberation_2016(player)
		else
			AiRed_Strategy_Action_2015(player, 0, "ai_red_2014")
		end
	end
	AiRed_2015()
end

function AiRufus_FtM_Canal_Liberation_2016(player)
	aiftm_terminate[player] = 1000
	if (player == 8) then
		AiRed_Strategy_Action_2015(player, 0, "move", 1, AiWise(), 99, 99)
		AiRed_Strategy_Action_2015(player, 1, "skip", 1)
		AiRed_Strategy_Action_2015(player, 2, "skip", 1)
		AiRed_Strategy_Action_2015(player, 3, "move", 1, AiWise(), 0, 0)
		AiRed_Strategy_Action_2015(player, 4, "skip", 1)
		AiRed_Strategy_Action_2015(player, 5, "summon", 1, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 6, "gold", 4000)
		AiRed_Strategy_Action_2015(player, 7, "wood", 1500)
		AiRed_Strategy_Action_2015(player, 8, "summon", 1, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 9, "summon", 1, AiShooter(), 0, 0)
		AiRed_Strategy_Action_2015(player, 10, "summon", 1, AiShooter(), 0, 0)
		AiRed_Strategy_Action_2015(player, 11, "skip", 1)
		AiRed_Strategy_Action_2015(player, 12, "summon", 1, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 13, "summon", 1, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 14, "summon", 1, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 15, "skip", 1)
		AiRed_Strategy_Action_2015(player, 16, "skip", 1)
		AiRed_Strategy_Action_2015(player, 17, "summon", 1, AiShooter(), 0, 0)
		AiRed_Strategy_Action_2015(player, 18, "summon", 1, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 19, "summon", 1, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 20, "summon", 1, AiLonerShooter(), 0, 0)
		AiRed_Strategy_Action_2015(player, 21, "skip", 1)
		AiRed_Strategy_Action_2015(player, 22, "summon", 1, AiHeroSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 23, "summon", 3, AiShooter(), 0, 0)
		AiRed_Strategy_Action_2015(player, 24, "summon", 3, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 25, "summon", 3, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 26, "summon", 3, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 27, "summon", 1, AiCatapult(), 0, 0)
		AiRed_Strategy_Action_2015(player, 28, "skip", 1)
		AiRed_Strategy_Action_2015(player, 29, "summon", 1, AiWorker(), 0, 0)
		AiRed_Strategy_Action_2015(player, 30, "skip", 1)
		AiRed_Strategy_Action_2015(player, 31, "summon", 1, AiHeroShooter(), 0, 0)
		AiRed_Strategy_Action_2015(player, 32, "skip", 1)
		AiRed_Strategy_Action_2015(player, 33, "summon", 1, AiHeroSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 34, "skip", 1)
		AiRed_Strategy_Action_2015(player, 35, "summon", 2, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 36, "skip", 1)
		AiRed_Strategy_Action_2015(player, 37, "summon", 2, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 38, "skip", 1)
		AiRed_Strategy_Action_2015(player, 39, "summon", 3, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 40, "summon", 3, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 41, "skip", 10)
		AiRed_Strategy_Action_2015(player, 42, "loop", 5)
	end
end

--  ______________________                           ______________________
--                             N I G H T M A R E     

--  ______________________                           ______________________
--                              S K I R M I S H      

function AiRufus_Skirmish_2016(player)

end

--  ______________________                           ______________________
--                                M Y T H I C        

DefineAi("Rufus Norcross", "*", "ai_red_2015", AiRufus_2015)