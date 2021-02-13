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

function TransferResource(from, to, resource)
	if ((resource ~= nil) and (from ~= nil) and (to ~= nil)) then
		if (resource[2] == nil) then resource[2] = GetPlayerData(from, "Resources", resource[1]) end
		if (resource[2] <= GetPlayerData(from, "Resources", resource[1])) then
			SetPlayerData(to, "Resources", resource[1], GetPlayerData(to, "Resources", resource[1]) + resource[2])
			SetPlayerData(from, "Resources", resource[1], GetPlayerData(from, "Resources", resource[1]) - resource[2])
			return true
		else
			return false
		end
	else
		return false
	end
end

function TransferResources(from, to, resource1, resource2, resource3)
	if (resource1 ~= nil) then
		TransferResource(from, to, resource1)
	end
	if (resource2 ~= nil) then
		TransferResource(from, to, resource2)
	end
	if (resource3 ~= nil) then
		TransferResource(from, to, resource3)
	end
end

function QuickTrain(player, unit, x, y)
	for index = 1, 30 do
		if (UnitDatabase[GetPlayerData(player, "RaceName")][index]["Unit"] == unit) then
			if (UnitNear(player, UnitDatabase[GetPlayerData(player, "RaceName")][index]["Origin"], x, y, 2) == true) then
				CreateUnit(unit, player, {x, y})
				return true
			else
				return false
			end
			break
		end
	end		
end

function UnitNear(player, unit, x, y, area)
	if (area == nil) then area = 3 end
	if ((GetPlayerData(player, "UnitTypesCount", unit) > 0) and (GetNumUnitsAt(player, unit, {x-area, y-area}, {x+area, y+area}) > 0)) then 
		return true
	else
		return false
	end
end

function ArmyNear(player, x, y, area)
	local t = {AiHeroSoldier(player), AiShooter(player), AiEliteShooter(player), AiSoldier(player), AiCatapult(player), AiFodder(player), AiCavalry(player), AiCavalryMage(player)}
	for i=1, table.getn(t) do
		if (UnitNear(player, t[i], x, y, area) == true) then
			return true
		end
	end
	return false
end

function MoveNavySafe(player, tox, toy, fromx, fromy, area, enemy, action)
	if ((enemy == nil) or (((GetNumUnitsAt(enemy, AiBattleship(enemy), {tox-area-10, toy-area-10}, {tox+area+10, toy+area+10}) == 0) or (GetNumUnitsAt(player, AiBattleship(player), {fromx-area, fromy-area}, {fromx+area, fromy+area}) > 1)) and (GetNumUnitsAt(enemy, AiTransporter(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2) and (GetNumUnitsAt(enemy, AiDestroyer(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2) and (GetNumUnitsAt(enemy, AiSubmarine(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) == 0))) then
		if (MoveNavyQuick(player, tox, toy, fromx, fromy, area, action) == true) then
			return true
		else
			return false
		end
	else
		return false
	end
end

function MoveArmySafe(player, tox, toy, fromx, fromy, area, enemy, action)
	if (((GetNumUnitsAt(enemy, AiSoldier(enemy), {tox-area-10, toy-area-10}, {tox+area+10, toy+area+10}) == 0) or (GetNumUnitsAt(player, AiSoldier(player), {fromx-area, fromy-area}, {fromx+area, fromy+area}) > 2)) and (GetNumUnitsAt(enemy, AiCavalryMage(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2) and (GetNumUnitsAt(enemy, AiEliteShooter(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2) and (GetNumUnitsAt(enemy, AiShooter(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2) and (GetNumUnitsAt(enemy, AiCatapult(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2) and (GetNumUnitsAt(enemy, AiCavalry(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2)) then
		if (MoveArmyQuick(player, tox, toy, fromx, fromy, area, action) == true) then
			return true
		else
			return false
		end
	else
		return false
	end
end

function MoveUnitSafe(player, unit, tox, toy, fromx, fromy, area, enemy, action)
	if (((GetNumUnitsAt(enemy, AiSoldier(enemy), {tox-area-10, toy-area-10}, {tox+area+10, toy+area+10}) == 0) or (GetNumUnitsAt(player, AiSoldier(player), {fromx-area, fromy-area}, {fromx+area, fromy+area}) > 2)) and (GetNumUnitsAt(enemy, AiCavalryMage(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2) and (GetNumUnitsAt(enemy, AiEliteShooter(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2) and (GetNumUnitsAt(enemy, AiShooter(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2) and (GetNumUnitsAt(enemy, AiCatapult(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2) and (GetNumUnitsAt(enemy, AiCavalry(enemy), {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) < 2)) then
		if (MoveUnitQuick(player, unit, tox, toy, fromx, fromy, area, action) == true) then
			return true
		else
			return false
		end
	else
		return false
	end
end

function FollowNavyQuick(player, tox, toy, fromx, fromy, area, ally, action)
	if (ally ~= nil) then
		local n = {AiDestroyer(ally), AiTransporter(ally), AiSubmarine(ally), AiBattleship(ally)}
		if ((GetNumUnitsAt(ally, n[1], {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) > 0) or (GetNumUnitsAt(ally, n[2], {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) > 0) or (GetNumUnitsAt(ally, n[3], {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) > 0) or (GetNumUnitsAt(ally, n[4], {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) > 0)) then
			if (MoveNavyQuick(player, tox, toy, fromx, fromy, area, action) == true) then
				return true
			else
				return false
			end
		else
			return false
		end
	else
		return false
	end
end

function FollowArmyQuick(player, tox, toy, fromx, fromy, area, ally, action)
	if (ally ~= nil) then
		local a = {AiHeroSoldier(ally), AiShooter(ally), AiEliteShooter(ally), AiSoldier(ally), AiCatapult(ally)}
		if ((GetNumUnitsAt(ally, a[1], {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) > 0) or (GetNumUnitsAt(ally, a[2], {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) > 0) or (GetNumUnitsAt(ally, a[3], {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) > 0) or (GetNumUnitsAt(ally, a[4], {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) > 0) or (GetNumUnitsAt(ally, a[5], {tox-area-5, toy-area-5}, {tox+area+5, toy+area+5}) > 0)) then
			if (MoveArmyQuick(player, tox, toy, fromx, fromy, area, action) == true) then
				return true
			else
				return false
			end
		else
			return false
		end
	else
		return false
	end
end

function MoveNavyGrid(player, to, from, area, enemy, ally, action)
	for j=1, 4 do
		if ((from[j] ~= nil) and (from[j][1] ~= nil) and (from[j][2] ~= nil)) then
			if     (((ally ~= nil) and (to[1] ~= nil) and (to[1][1] ~= nil) and (to[1][2] ~= nil)) and (FollowNavyQuick(AiPlayer(), to[1][1], to[1][2], from[j][1], from[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[2] ~= nil) and (to[2][1] ~= nil) and (to[2][2] ~= nil)) and (FollowNavyQuick(AiPlayer(), to[2][1], to[2][2], from[j][1], from[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[3] ~= nil) and (to[3][1] ~= nil) and (to[3][2] ~= nil)) and (FollowNavyQuick(AiPlayer(), to[3][1], to[3][2], from[j][1], from[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[4] ~= nil) and (to[4][1] ~= nil) and (to[4][2] ~= nil)) and (FollowNavyQuick(AiPlayer(), to[4][1], to[4][2], from[j][1], from[j][2], area + 2, ally) == true)) then return true
			elseif (FollowNavyQuick(AiPlayer(), from[j][1], from[j][2], from[j][1], from[j][2], area, ally) == true) then return false
			-- go back
			elseif (((ally ~= nil) and (to[j] ~= nil) and (from[1] ~= nil) and (from[1][1] ~= nil) and (from[1][2] ~= nil)) and (FollowNavyQuick(AiPlayer(), from[1][1], from[1][2], to[j][1], to[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[j] ~= nil) and (from[2] ~= nil) and (from[2][1] ~= nil) and (from[2][2] ~= nil)) and (FollowNavyQuick(AiPlayer(), from[2][1], from[2][2], to[j][1], to[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[j] ~= nil) and (from[3] ~= nil) and (from[3][1] ~= nil) and (from[3][2] ~= nil)) and (FollowNavyQuick(AiPlayer(), from[3][1], from[3][2], to[j][1], to[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[j] ~= nil) and (from[4] ~= nil) and (from[4][1] ~= nil) and (from[4][2] ~= nil)) and (FollowNavyQuick(AiPlayer(), from[4][1], from[4][2], to[j][1], to[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[j] ~= nil) and (to[j][1] ~= nil) and (to[j][2] ~= nil)) and (FollowNavyQuick(AiPlayer(), to[j][1], to[j][2], to[j][1], to[j][2], area, ally) == true)) then return false
			else
				for i=1, 4 do
					if (((from[i] ~= nil) and (to[j] ~= nil) and (from[i][1] ~= nil) and (from[i][2] ~= nil)  and (to[j][1] ~= nil) and (to[j][2] ~= nil)) and (MoveNavySafe(AiPlayer(), to[j][1], to[j][2], from[i][1], from[i][2], area, enemy, action) == true)) then 
						break
					end
				end
			end
		end
	end
end

function MoveArmyGrid(player, to, from, area, enemy, ally, action)
	local ji = {}
	repeat ji[1] = SyncRand(4) + 1 until (ji[1] ~= 0)
	repeat ji[2] = SyncRand(4) + 1 until ((ji[1] ~= ji[2]) and (ji[2] ~= 0))
	repeat ji[3] = SyncRand(4) + 1 until ((ji[1] ~= ji[3]) and (ji[2] ~= ji[3]) and (ji[3] ~= 0))
	repeat ji[4] = SyncRand(4) + 1 until ((ji[1] ~= ji[4]) and (ji[2] ~= ji[4]) and (ji[3] ~= ji[4]) and (ji[4] ~= 0))
	for j=1, 4 do
		if ((from[j] ~= nil) and (from[j][1] ~= nil) and (from[j][2] ~= nil)) then
			if     (((ally ~= nil) and (to[ji[1]] ~= nil) and (to[ji[1]][1] ~= nil) and (to[ji[1]][2] ~= nil)) and (FollowArmyQuick(AiPlayer(), to[ji[1]][1], to[ji[1]][2], from[j][1], from[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[ji[2]] ~= nil) and (to[ji[2]][1] ~= nil) and (to[ji[2]][2] ~= nil)) and (FollowArmyQuick(AiPlayer(), to[ji[2]][1], to[ji[2]][2], from[j][1], from[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[ji[3]] ~= nil) and (to[ji[3]][1] ~= nil) and (to[ji[3]][2] ~= nil)) and (FollowArmyQuick(AiPlayer(), to[ji[3]][1], to[ji[3]][2], from[j][1], from[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[ji[4]] ~= nil) and (to[ji[4]][1] ~= nil) and (to[ji[4]][2] ~= nil)) and (FollowArmyQuick(AiPlayer(), to[ji[4]][1], to[ji[4]][2], from[j][1], from[j][2], area + 2, ally) == true)) then return true
			elseif (FollowArmyQuick(AiPlayer(), from[j][1], from[j][2], from[j][1], from[j][2], area, ally) == true) then return false
			-- go back
			elseif (((ally ~= nil) and (to[j] ~= nil) and (from[ji[1]] ~= nil) and (from[ji[1]][1] ~= nil) and (from[ji[1]][2] ~= nil)) and (FollowArmyQuick(AiPlayer(), from[ji[1]][1], from[ji[1]][2], to[j][1], to[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[j] ~= nil) and (from[ji[2]] ~= nil) and (from[ji[2]][1] ~= nil) and (from[ji[2]][2] ~= nil)) and (FollowArmyQuick(AiPlayer(), from[ji[2]][1], from[ji[2]][2], to[j][1], to[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[j] ~= nil) and (from[ji[3]] ~= nil) and (from[ji[3]][1] ~= nil) and (from[ji[3]][2] ~= nil)) and (FollowArmyQuick(AiPlayer(), from[ji[3]][1], from[ji[3]][2], to[j][1], to[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[j] ~= nil) and (from[ji[4]] ~= nil) and (from[ji[4]][1] ~= nil) and (from[ji[4]][2] ~= nil)) and (FollowArmyQuick(AiPlayer(), from[ji[4]][1], from[ji[4]][2], to[j][1], to[j][2], area + 2, ally) == true)) then return true
			elseif (((ally ~= nil) and (to[j] ~= nil) and (to[j][1] ~= nil) and (to[j][2] ~= nil)) and (FollowArmyQuick(AiPlayer(), to[j][1], to[j][2], to[j][1], to[j][2], area, ally) == true)) then return false
			else
				for i=1, 4 do
					if (((from[ji[i]] ~= nil) and (to[j] ~= nil) and (from[ji[i]][1] ~= nil) and (from[ji[i]][2] ~= nil)  and (to[j][1] ~= nil) and (to[j][2] ~= nil)) and (MoveArmySafe(AiPlayer(), to[j][1], to[j][2], from[ji[i]][1], from[ji[i]][2], area, enemy, action) == true)) then 
						break
					end
				end
			end
		end
	end
end

function TeleportUnit(toplayer, tounit, topos, fromplayer, fromunit, frompos, fromdelete, area)
	if (GetNumUnitsAt(toplayer, tounit, {topos[1], topos[2]}, {topos[1], topos[2]}) == 0) then 
		if (GetPlayerData(fromplayer, "UnitTypesCount", fromunit) > 0) then
			if (GetNumUnitsAt(fromplayer, fromunit, {frompos[1], frompos[2]}, {frompos[1], frompos[2]}) > 0) then 
				CreateUnit(tounit, toplayer, {topos[1], topos[2]})
				if (fromdelete == true) then
					KillUnitAt(fromunit, fromplayer, 1, frompos[1], frompos[2])
				end
				return true
			elseif (GetNumUnitsAt(fromplayer, fromunit, {frompos[1] - 1, frompos[2] - 1}, {frompos[1] + 1, frompos[2] + 1}) > 0) then
				if (area == nil) then area = 1 end
				MoveUnitQuick(fromplayer, fromunit, frompos[1], frompos[2], frompos[1], frompos[2], area, "move")
			end
		end
	end
end

function MoveNavyQuick(player, tox, toy, fromx, fromy, area, action)
	local n = {AiDestroyer(player), AiTransporter(player), AiSubmarine(player), AiBattleship(player)}
	for i=1, 4 do
		MoveUnitQuick(player, n[i], tox, toy, fromx, fromy, area, action)
	end
	if ((UnitNear(player, n[1], fromx, fromy, area) == true) or (UnitNear(player, n[2], fromx, fromy, area) == true) or (UnitNear(player, n[3], fromx, fromy, area) == true) or (UnitNear(player, n[4], fromx, fromy, area) == true))	then 
		return true
	else
		return false
	end
end

function MoveArmyQuick(player, tox, toy, fromx, fromy, area, action)
	local a = {AiHeroSoldier(player), AiShooter(player), AiEliteShooter(player), AiSoldier(player), AiCatapult(player), AiFodder(player)}
	for i=1, table.getn(a) do
		MoveUnitQuick(player, a[i], tox, toy, fromx, fromy, area, action)
	end
		if ((UnitNear(player, a[1], fromx, fromy, area) == true) or (UnitNear(player, a[2], fromx, fromy, area) == true) or (UnitNear(player, a[3], fromx, fromy, area) == true) or (UnitNear(player, a[4], fromx, fromy, area) == true) or (UnitNear(player, a[5], fromx, fromy, area) == true))	then 
		return true
	else
		return false
	end
end

function MoveUnitQuick(player, unit, tox, toy, fromx, fromy, area, action)
	-- action = "clear" when we don't want the unit moving to a location with another unit there.
	local randomsyncnumber
	if (area ~= 1) then 
		randomsyncnumber = SyncRand(3) - SyncRand(3)
		-- The following may cause a crash/bug!
		if ((tox + randomsyncnumber > 0) and (tox + randomsyncnumber < mapinfo.w)) then
			tox = tox + randomsyncnumber
			randomsyncnumber = SyncRand(3) - SyncRand(3)
		end
		if ((toy + randomsyncnumber > 0) and (toy + randomsyncnumber < mapinfo.h)) then
			toy = toy + randomsyncnumber
		end
	end
	if ((unit == AiTransporter(player)) or (unit == AiScout(player))) then action = "move" end
	if (action == nil) then 
		for j=0, 15 do
			if (GetPlayerData(j, "TotalNumUnits") > 0) then
				local t = {AiHeroSoldier(j), AiShooter(j), AiEliteShooter(j), AiSoldier(j), AiCatapult(j), AiFodder(j), AiCavalry(j), AiCavalryMage(j)}
				local b = {AiFarm(j)}
				local n = {AiDestroyer(player), AiTransporter(player), AiSubmarine(player), AiBattleship(player)}
				for i=1, table.getn(t) do
					if (((t[i] ~= nil) and (GetNumUnitsAt(j, t[i], {tox, toy}, {tox, toy}) > 0)) or ((b[i] ~= nil) and (GetNumUnitsAt(j, b[i], {tox, toy}, {tox, toy}) > 0)) or ((n[i] ~= nil) and (GetNumUnitsAt(j, n[i], {tox, toy}, {tox, toy}) > 0))) then
						if (action == "clear") then
							action = "cancel"
						else
							action = "move"
						end
						break
					end
				end
			end
		end
		if (action == nil) then action = "attack" end
	end
	if ((UnitNear(player, unit, fromx, fromy, area) == true) and (action ~= "cancel")) then 
		if (area == nil) then area = SyncRand(3) end
		if (action == "clear") then action = "move" end
		OrderUnit(player, unit, {fromx-area,fromy-area,fromx+area,fromy+area}, {tox,toy,tox,toy}, action)
		return true
	else
		return false
	end
end