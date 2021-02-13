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
--	level05o_ai.lua 
--
--	(c) Copyright 2013 by Kyran Jackson
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

function AiLevel05a()
	if (((GameCycle > 44000) and (GameCycle < 44010)) or ((GameCycle > 46000) and (GameCycle < 46010)) or ((GameCycle > 56000) and (GameCycle < 56010)) or ((GameCycle > 53000) and (GameCycle < 53010)) or ((GameCycle > 61000) and (GameCycle < 61010)) or ((GameCycle > 82000) and (GameCycle < 82010)) or ((GameCycle > 47000) and (GameCycle < 47010)) or ((GameCycle > 49000) and (GameCycle < 49010)) or ((GameCycle > 33000) and (GameCycle < 33010)) or ((GameCycle > 35000) and (GameCycle < 35010)) or ((GameCycle > 45000) and (GameCycle < 45010)) or ((GameCycle > 58000) and (GameCycle < 58010)) or ((GameCycle > 42000) and (GameCycle < 42010)) or ((GameCycle > 39000) and (GameCycle < 39010)) or ((GameCycle > 99000) and (GameCycle < 99010)) or ((GameCycle > 86000) and (GameCycle < 86010)) or ((GameCycle > 71000) and (GameCycle < 71010)) or ((GameCycle > 74000) and (GameCycle < 74010)) or ((GameCycle > 79000) and (GameCycle < 79010)) or ((GameCycle > 83500) and (GameCycle < 83510)) or ((GameCycle > 96000) and (GameCycle < 96010)) or ((GameCycle > 1110000) and (GameCycle < 1110010)) or ((GameCycle > 120000) and (GameCycle < 120010)) or ((GameCycle > 13000) and (GameCycle < 13010)) or ((GameCycle > 15000) and (GameCycle < 15010)) or ((GameCycle > 18000) and (GameCycle < 18010)) or ((GameCycle > 20000) and (GameCycle < 20010)) or ((GameCycle > 21000) and (GameCycle < 21010)) or ((GameCycle > 23000) and (GameCycle < 23010)) or ((GameCycle > 25000) and (GameCycle < 25010)) or ((GameCycle > 28000) and (GameCycle < 28010)) or ((GameCycle > 32000) and (GameCycle < 32010)) or ((GameCycle > 36000) and (GameCycle < 36010)) or ((GameCycle > 40000) and (GameCycle < 40010)) or ((GameCycle > 50000) and (GameCycle < 50010)) or ((GameCycle > 55000) and (GameCycle < 55010)) or ((GameCycle > 58000) and (GameCycle < 58010)) or ((GameCycle > 60000) and (GameCycle < 60010)) or ((GameCycle > 65000) and (GameCycle < 65010)) or ((GameCycle > 70000) and (GameCycle < 70010)) or ((GameCycle > 75000) and (GameCycle < 75010)) or ((GameCycle > 78000) and (GameCycle < 78010)) or ((GameCycle > 82000) and (GameCycle < 82010)) or ((GameCycle > 86000) and (GameCycle < 86010)) or ((GameCycle > 90000) and (GameCycle < 90010)) or ((GameCycle > 100000) and (GameCycle < 100010))) then
		--KillUnitAt("unit-archer", 0, 50, {0, 0}, {15, 5});
		--KillUnitAt("unit-ballista", 0, 50, {0, 0}, {15, 5});
		--KillUnitAt("unit-footman", 0, 50, {0, 0}, {15, 5});
		--KillUnitAt("unit-attack-peasant", 0, 50, {0, 0}, {15, 5});
	elseif ((GetPlayerData(2, "UnitTypesCount", "unit-stronghold") == 0) and (GetPlayerData(3, "UnitTypesCount", "unit-stronghold") == 0)) then
		if (GetNumUnitsAt(6, "unit-arthor-literios", {85, 50}, {90, 60}) >= 1) then
			ActionVictory()
		end
	else
		if (GameCycle < 200) then
			AiRed_Resources_Set_2014(8, 50, 50, 50)
		elseif (GameCycle > 25000) and (GameCycle < 25500) then
			AiRed_Resources_Set_2014(8, 0, 0, 0)
		elseif (GameCycle < 50000) then
			AiRedRibbon_2014()
		end
		if ((GameCycle < 100) or (timers[AiPlayer()] == (50 - AiPlayer())) or (timers[AiPlayer()] == (100 - AiPlayer()))) then
			--if (GetPlayerData(AiPlayer(), "TotalNumUnits") > 0) then
				--if (GetNumUnitsAt(AiPlayer(), AiShooter(), {0, 0}, {256, 256}) >= 8) then
				--	AiForce(1, {AiShooter(), 8})
				--	AiAttackWithForce(1)
				--end
				--if (GetNumUnitsAt(AiPlayer(), "unit-balloon", {0, 0}, {256, 256}) < 1) then
				--	CreateUnit("unit-balloon", 0, {52, 1})
				--	AiForce(6, {"unit-balloon", 1})
				--	AiAttackWithForce(6)
				--end	
				--if (GetNumUnitsAt(AiPlayer(), AiShooter(), {0, 0}, {256, 256}) < 1) then
				--	CreateUnit("unit-archer", 0, {1, 0})
				--	CreateUnit("unit-archer", 0, {0, 0})
				--	CreateUnit("unit-archer", 0, {1, 1})
				--	CreateUnit("unit-archer", 0, {0, 1})
				--	CreateUnit("unit-archer", 0, {1, 0})
				--	CreateUnit("unit-archer", 0, {0, 0})
				--	CreateUnit("unit-archer", 0, {1, 1})
				--	CreateUnit("unit-archer", 0, {0, 1})
				--	AiForce(1, {AiShooter(), 8})
				--	AiAttackWithForce(1)
				--end
				--if (GetNumUnitsAt(AiPlayer(), AiSoldier(), {0, 0}, {256, 256}) >= 36) then
				--	AiForce(2, {AiSoldier(), 36})
				--	AiAttackWithForce(2)
				--end
				--if (GetNumUnitsAt(AiPlayer(), "unit-ballista", {0, 0}, {256, 256}) < 1) then	
				--	CreateUnit("unit-ballista", 0, {1, 1})
				--	CreateUnit("unit-ballista", 0, {0, 1})
				--	AiForce(5, {"unit-ballista", 2})
				--	AiAttackWithForce(5)
				--end
				--if (GetNumUnitsAt(AiPlayer(), AiSoldier(), {0, 0}, {256, 256}) < 1) then
				--	CreateUnit("unit-footman", 0, {8, 0})
				--	CreateUnit("unit-footman", 0, {9, 0})
				--	CreateUnit("unit-footman", 0, {9, 1})
				--	CreateUnit("unit-footman", 0, {8, 0})
				--	CreateUnit("unit-footman", 0, {9, 0})
				--	CreateUnit("unit-footman", 0, {8, 1})
				--	CreateUnit("unit-footman", 0, {9, 1})
				--	AiForce(2, {AiSoldier(), 8})
				--	AiAttackWithForce(2)
				--end
				--if (GetNumUnitsAt(AiPlayer(), "unit-paladin", {0, 0}, {256, 256}) < 1) then
				--	CreateUnit("unit-paladin", 0, {9, 0})
				--	CreateUnit("unit-paladin", 0, {8, 0})
				--	AiForce(5, {"unit-paladin", 2})
				--	AiAttackWithForce(5)
				--end
				if (GetNumUnitsAt(AiPlayer(), "unit-human-destroyer", {0, 0}, {256, 256}) < 1) then
					CreateUnit("unit-human-destroyer", AiPlayer(), {45, 0})
					CreateUnit("unit-human-destroyer", AiPlayer(), {44, 0})
					CreateUnit("unit-human-destroyer", AiPlayer(), {43, 1})
					CreateUnit("unit-human-destroyer", AiPlayer(), {45, 1})
					CreateUnit("unit-human-destroyer", AiPlayer(), {43, 0})
					CreateUnit("unit-human-destroyer", AiPlayer(), {44, 1})
					AiForce(3, {"unit-human-destroyer", 6})
					AiAttackWithForce(3)
				end
				if (GetNumUnitsAt(AiPlayer(), "unit-battleship", {0, 0}, {256, 256}) < 1) then
					CreateUnit("unit-battleship", AiPlayer(), {46, 0})
					AiForce(8, {"unit-battleship", 1})
					AiAttackWithForce(8)
				end	
				if (GetNumUnitsAt(AiPlayer(), "unit-battleship", {0, 0}, {256, 256}) >= 4) then
					AiForce(4, {"unit-battleship", 4})
					AiAttackWithForce(4)
				end	
			--end
		elseif (((timers[AiPlayer()] > 50) and (timers[AiPlayer()] < 70)) or ((timers[AiPlayer()] > 0) and (timers[AiPlayer()] < 20))) then
			if (MoveArmyQuick(AiPlayer(), 29, 13, 18, 8, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 9, 35, 29, 13, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 16, 67, 9, 35, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 32, 76, 16, 67, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 84, 17, 32, 76, 3) == true) then 
			end
			if (MoveArmyQuick(AiPlayer(), 27, 25, 10, 5, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 27, 25, 10, 10, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 83, 55, 71, 90, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 30, 68, 27, 25, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 50, 70, 30, 68, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 71, 90, 50, 70, 3) == true) then 
			end
			if (MoveArmyQuick(AiPlayer(), 31, 8, 5, 15, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 31, 8, 5, 10, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 31, 8, 5, 5, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 14, 35, 31, 8, 3) == true) then 
			elseif (MoveArmyQuick(AiPlayer(), 22, 47, 14, 35, 3) == true) then 
			end
		end
	end
end

function AiLevel05c()
	if ((GetNumUnitsAt(6, "all", {0, 0}, {256, 256}) < 11) and (GetNumUnitsAt(3, "unit-grunt", {0, 0}, {38, 45}) < 1) and (GetNumUnitsAt(2, "unit-grunt", {0, 0}, {38, 15}) < 1) and (GetPlayerData(6, "UnitTypesCount", "unit-peasant") < 1)) then
		--if (GetPlayerData(AiPlayer(), "UnitTypesCount", "unit-elven-lumber-mill") == 0) then
		--	CreateUnit("unit-elven-lumber-mill", 2, {15, 0})
		--end
		CreateUnit(AiWorker(), 6, {16, 0})
		--CreateUnit(AiWorker(), 6, {0, 0})
		--CreateUnit(AiWorker(), 6, {0, 0})
		--CreateUnit(AiWorker(), 6, {0, 0})
		--CreateUnit(AiWorker(), 6, {0, 0})
		--CreateUnit(AiWorker(), 6, {0, 0})
		--SetPlayerData(6, "Resources", "gold", (GetPlayerData(6, "TotalResources", "gold") + 1000))
		--SetPlayerData(2, "Resources", "wood", (GetPlayerData(2, "TotalResources", "wood") + 1000))
	--[[
		CreateUnit("unit-buildpoint-tower", 2, {3, 15})
		CreateUnit("unit-buildpoint-tower", 2, {5, 15})
		CreateUnit("unit-buildpoint-tower", 2, {7, 15})
		CreateUnit("unit-buildpoint-tower", 2, {31, 5})
		CreateUnit("unit-buildpoint-tower", 2, {28, 12})
		AiSet("unit-human-watch-tower", 5)
		AiNephrite_Level5()
	else
		if ((GetNumUnitsAt(6, "unit-peasant", {0, 90}, {6, 96}) >= 1) or (GetPlayerData(AiPlayer(), "UnitTypesCount", AiBetterCityCenter()) > 0)) then
			if (GetPlayerData(AiPlayer(), "UnitTypesCount", AiCityCenter()) == 0) then
				if (GetNumUnitsAt(2, AiWorker(), {0, 0}, {30, 30}) >= 1) then
					KillUnitAt(AiWorker(), 2, 1, {0, 0}, {30, 30})
				end
				AiNephrite_Flush_2013()
				AiSet(AiCityCenter(), 1)
				SetPlayerData(6, "Resources", "gold", 6000)
				SetPlayerData(6, "Resources", "gold", 6000)
			else
				AiZoisite_2013()
				if (GetNumUnitsAt(6, AiBarracks(), {0, 0}, {30, 30}) >= 1) then
					KillUnitAt(AiBarracks(), 6, 1, {0, 0}, {30, 30})
					AiNephrite_Attack_2013()
				end
				if (GetNumUnitsAt(6, AiLumberMill(), {0, 0}, {30, 30}) >= 1) then
					KillUnitAt(AiLumberMill(), 2, 1, {0, 0}, {30, 30})
					SetPlayerData(6, "Resources", "gold", 1500)
					SetPlayerData(6, "Resources", "gold", 1500)
				end
				if (GetNumUnitsAt(6, AiSoldier(), {0, 70}, {40, 96}) >= 8) then
					AiNephrite_Attack_2013()
				end
			end
			if (GetNumUnitsAt(6, "unit-peasant", {50, 55}, {96, 96}) >= 1) then
			else
				ChangeUnitsOwner({55, 55}, {96, 96}, 2, 6)
			end
		else
			if (GetNumUnitsAt(6, "all", {0, 0}, {256, 256}) < 11) then
				SetPlayerData(6, "Resources", "gold", 1200)
				AiNephrite_Level5()
			end
			if (GetNumUnitsAt(6, "unit-peasant", {0, 35}, {55, 55}) >= 1) then
			else
				ChangeUnitsOwner({0, 45}, {50, 50}, 2, 6)
			end
		end
		KillUnit("unit-peasant", 6)
	]]
	elseif (GetPlayerData(6, "UnitTypesCount", AiCityCenter(6)) == 1) then
		if ((timers[AiPlayer()] == (50 - AiPlayer())) or (timers[AiPlayer()] == (100 - AiPlayer()))) then
			MoveArmyQuick(6, 22, 66, 9, 86, 10, "move")
			ChangeUnitsOwner({20, 64}, {24, 68}, 6, 14)
			MoveArmyQuick(14, 22, 33, 72, 66, 5, "move")
		end
		if (GetPlayerData(6, "UnitTypesCount", AiLumberMill(6)) == 0) then
			CreateUnit(AiWorker(6), 6, {0, 82})
			CreateUnit(AiWorker(6), 6, {0, 81})
			CreateUnit(AiWorker(6), 6, {0, 80})
			CreateUnit(AiLumberMill(), 6, {14, 0})
		elseif ((GetPlayerData(6, "UnitTypesCount", AiBarracks(6)) == 1) and (GetPlayerData(6, "UnitTypesCount", AiWorker()) < 8) and (GetPlayerData(6, "UnitTypesCount", AiFarm(6)) == 3)) then
			AiSetCollect({0, 50, 50, 0, 0, 0, 0})
			CreateUnit(AiWorker(6), 6, {17, 0})
			CreateUnit(AiWorker(6), 6, {18, 0})
			CreateUnit(AiWorker(6), 6, {19, 0})
			CreateUnit(AiWorker(6), 6, {20, 0})
		elseif ((GetPlayerData(0, "UnitTypesCount", AiCityCenter(0)) == 0) and (GetNumUnitsAt(2, AiGuardTower(2), {0, 6}, {72, 77}) == 0)) then
			CreateUnit(AiCityCenter(), 0, {0, 72})
			CreateUnit(AiWorker(0), 0, {0, 65})
			if (GetNumUnitsAt(0, AiCityCenter(0), {0, 72}, {3, 75}) == 1) then
				AiRedRibbon_Auto_Origin_2014(0, "all", 0, 72, AiCityCenter(0))
			end
		end
	end
end

function AiLevel05()
	if (nephrite_attackforce ~= nil) then
		nephrite_attackforce = 5
	end
	--if (AiPlayer() == 0) then
		AiLevel05a()
	--else
	--	if (GameCycle > 100000) then
	--		AiZoisite_2013()
	--	else
			AiLevel05c()
	--	end
	--end
end

DefineAi("ai_level05", "*", "ai_level05", AiLevel05)