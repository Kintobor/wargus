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

--  ______________________                           ______________________
--                            A P P E A R A N C E    

CharacterSetup("Yutaka Nomiya", 17, "White House", "Freemen")
CharacterSetup("Yutaka Nomiya", "Skin", "Neutral", "char_yutaka", 1)

--  ______________________                           ______________________
--                           T E M P E R A M E N T   

CharacterSetup("Yutaka Nomiya", "Mood", "Neutral", "Grumpy")
CharacterSetup("Yutaka Nomiya", "Mood", "Neutral", "Surprised")
CharacterSetup("Yutaka Nomiya", "Mood", "Neutral", "Unsure")
CharacterSetup("Yutaka Nomiya", "Mood", "Neutral", "Happy")
CharacterSetup("Yutaka Nomiya", "Mood", "Neutral", "Sly")

--  ______________________                           ______________________
--                          I N T E L L I G E N C E  

function AiYutaka_2016()
	AiCharacter_Set_Name_2015("Yutaka Nomiya")
	--Check game type.
	if (GameDefinition["Name"] == "For the Motherland") then
		AiShane_FtM_2015(AiPlayer())
	elseif (GameDefinition["Name"] == "Escape") then
		AiShane_Escape_2015()
	else
		AiYutaka_Skirmish_2016()
	end
end

--  ______________________                           ______________________
--                                E S C A P E        

--  ______________________                           ______________________
--                            M O T H E R L A N D    

--  ______________________                           ______________________
--                             N I G H T M A R E     

--  ______________________                           ______________________
--                              S K I R M I S H      

function AiYutaka_Skirmish_2016()
	if (GameDefinition["Map"]["Name"] == "Endodus") then
		AiYutaka_Skirmish_Endodus_2016()
	elseif (GameDefinition["Map"]["Name"] == "Canal Liberation") then
		AiYutaka_Skirmish_Canal_Liberation_2016(AiPlayer())
	else
		AiLucas_Skirmish_Standard_2015()
	end
end

function AiYutaka_Skirmish_Canal_Liberation_2016(player)
	local yretreat = false
	--if ((UnitNear(player, AiWorker(player), 30, 8, 5) == true) and (GetPlayerData(player, "UnitTypesCount", AiLumberMill()) == 0)) then
		--AiJadeite_Build_2010(AiLumberMill(), 1)
	if ((GetPlayerData(player, "UnitTypesCount", AiCityCenter()) > 0) or (UnitNear(player, AiWorker(player), 4, 90, 5) == true)) then
		AiLucas_Skirmish_Standard_2015()
	else	
		if (yretreat == false) then
			if (MoveUnitSafe(player, AiWorker(player),     4, 90, 10, 83, 8, 2, "move") == true) then
			elseif (MoveUnitSafe(player, AiWorker(player), 10, 83, 10, 73, 8, 2, "move") == true) then
			elseif (MoveUnitSafe(player, AiWorker(player), 10, 83, 3,  91, 4, 2, "move") == true) then
			elseif (MoveUnitSafe(player, AiWorker(player), 10, 73, 16, 66, 8, 2, "move") == true) then
			elseif (MoveUnitSafe(player, AiWorker(player), 16, 66, 13, 52, 8, 2, "move") == true) then
			elseif (MoveUnitSafe(player, AiWorker(player), 13, 52, 15, 35, 8, 2, "move") == true) then
			elseif (MoveUnitSafe(player, AiWorker(player), 15, 35, 20, 30, 8, 2, "move") == true) then
			elseif (MoveUnitSafe(player, AiWorker(player), 20, 30, 20, 20, 8, 2, "move") == true) then
			elseif (MoveUnitSafe(player, AiWorker(player), 15, 35, 19, 20, 2, 2, "move") == true) then
			elseif (MoveUnitSafe(player, AiWorker(player), 20, 20, 10, 10, 10, 2, "move") == true) then
				yretreat = true
			end
		else
			-- Move back!
			if(MoveUnitQuick(player, AiWorker(player), 10, 73, 10, 83, 4, "move") == true) then
			elseif (MoveUnitQuick(player, AiWorker(player), 3,  91, 10, 83, 4, "move") == true) then
			elseif (MoveUnitQuick(player, AiWorker(player), 16, 66, 10, 73, 4, "move") == true) then
			elseif (MoveUnitQuick(player, AiWorker(player), 13, 52, 16, 66, 4, "move") == true) then
			elseif (MoveUnitQuick(player, AiWorker(player), 15, 35, 13, 52, 4, "move") == true) then
			elseif (MoveUnitQuick(player, AiWorker(player), 20, 30, 15, 35, 4, "move") == true) then
			elseif (MoveUnitQuick(player, AiWorker(player), 20, 20, 20, 30, 4, "move") == true) then
			elseif (MoveUnitQuick(player, AiWorker(player), 19, 20, 15, 35, 2, "move") == true) then
			elseif (MoveUnitQuick(player, AiWorker(player), 10, 10, 20, 20, 4, "move") == true) then
				yretreat = false
			end
		end
	end
end

function AiYutaka_Skirmish_Endodus_2016()
	if (GameCycle < 1000) then
		AiSet(AiWorker(), 10)
	else
		AiJadeite_Upgrade_2010(AiSoldier())
		AiJadeite_Upgrade_2010(AiShooter())
		if (AiJadeite_Force_2010(3, AiFodder(), 10, AiShooter(), 10, AiFodder(), 5) == true) then
			AiJadeite_Attack_2010(3, true)
		end
	end
	if (cycle == nil) then cycle = 0 elseif (cycle >= 0) then AiJadeite_Ticker_2010() end
end

--  ______________________                           ______________________
--                               F R E E M A N       

DefineAi("Yutaka Nomiya", "*", "ai_red_2015", AiYutaka_2016)