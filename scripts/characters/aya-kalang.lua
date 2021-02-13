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

CharacterSetup("Aya Kalang", 18, "Red House", "Mythics")
CharacterSetup("Aya Kalang", "Skin", "Neutral", "char_aya.png", 1)

CharacterSetup("Aya Kalang", "Sync", "Neutral", "ai", "char_aya_ai.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "e", "char_aya_e.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "etc", "char_aya_etc.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "l", "char_aya_l.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "mbp", "char_aya_mbp.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "o", "char_aya_o.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "u", "char_aya_u.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "wq", "char_aya_wq.png")

CharacterSetup("Aya Kalang", "Mood", "Neutral", "Grumpy")
CharacterSetup("Aya Kalang", "Mood", "Neutral", "Surprised")
CharacterSetup("Aya Kalang", "Mood", "Neutral", "Unsure")
CharacterSetup("Aya Kalang", "Mood", "Neutral", "Happy")
CharacterSetup("Aya Kalang", "Mood", "Neutral", "Sly")

--  ______________________                           ______________________
--                          I N T E L L I G E N C E  

function AiAya_2015()
	AiCharacter_Set_Name_2015("Aya Kalang")
	--Check game type.
	if (GameDefinition["Name"] == "For the Motherland") then
		AiAya_FtM_2015(AiPlayer())
	else
		AiAya_Skirmish_2016()
	end
end

--  ______________________                           ______________________
--                                E S C A P E        

--  ______________________                           ______________________
--                            M O T H E R L A N D    

function AiAya_FtM_2015(player)
	-- Sandria will be a hard, archer player.
	if ((GameCycle < 50) or (aiftm_action[player][aiftm_index[player]] == "loop")) then
		--Check map.
		if (GameDefinition["Map"]["Name"] == "Rockfort Arena") then
			AiAya_FtM_Rockfort_Arena_2015(player)
		elseif (GameDefinition["Map"]["Name"] == "One Way Through") then
			AiAya_FtM_One_Way_Through_2015(player)
		elseif (GameDefinition["Map"]["Name"] == "Nick's Duel") then
			AiAya_FtM_Nicks_Duel_2015(player)
		elseif (GameDefinition["Map"]["Name"] == "Fall of Genesis Castle") then
			AiAya_FtM_Fall_Genesis_2015(player)
		end
	end
	AiRed_2015()
end

function AiAya_FtM_Fall_Genesis_2015(player)
	aiftm_terminate[player] = 1000
	x = 105
	y = 2
	AiRed_Strategy_Action_2015(player, 0, "summon", 2, AiWorker(), x+5, y+5)
	AiRed_Strategy_Action_2015(player, 1, "summon", 3, AiWorker(), x+5, y+5)
	for i=0,9 do
		AiRed_Strategy_Action_2015(player, 2+i, "summon", 1, AiSoldier(), x+i, y)
	end
	AiRed_Strategy_Action_2015(player, 3, "summon", 1, AiCavalryMage(), x+1, y)
	AiRed_Strategy_Action_2015(player, 4, "move", 1, AiSoldier(), x+10, y, x, y)
	AiRed_Strategy_Action_2015(player, 12, "summon", 1, AiSoldier(), x, y)
	AiRed_Strategy_Action_2015(player, 13, "summon", 1, AiSoldier(), x+2, y)
	for i=0,8 do
		AiRed_Strategy_Action_2015(player, 14+i, "summon", 1, AiShooter(), x+2+i, y+1)
		AiRed_Strategy_Action_2015(player, 23+i, "summon", 1, AiShooter(), x+2+i, y+2)
		AiRed_Strategy_Action_2015(player, 32+i, "summon", 1, AiSoldier(), x+2+i, y+3)
	end
	AiRed_Strategy_Action_2015(player, 41, "skip", 10)
	AiRed_Strategy_Action_2015(player, 42, "summon", 1, AiShooter(), x, y+1)
	AiRed_Strategy_Action_2015(player, 43, "summon", 1, AiShooter(), x+1, y+1)
	AiRed_Strategy_Action_2015(player, 44, "summon", 4, "hero", x+1, y+1)
	AiRed_Strategy_Action_2015(player, 45, "loop", 0)
end

function AiAya_FtM_Nicks_Duel_2015(player)
	aiftm_terminate[player] = 1000
	x = ftm_team_x1[player]
	y = ftm_team_y1[player]
	if (player == 10) then
		AiRed_Strategy_Action_2015(player, 1, "summon", 1, AiWorker(), x+2, y+1)
		AiRed_Strategy_Action_2015(player, 2, "move", 1, AiWorker(), x+2, y+1, x+2, y+1)
		AiRed_Strategy_Action_2015(player, 12, "move", 1, AiWise(), x+3, y+1)
		AiRed_Strategy_Action_2015(player, 36, "attack", 1, AiSoldier(), 0, 0)
		AiRed_Strategy_Action_2015(player, 38, "move", 1, AiShooter(), 17, 29, x, y)
		AiRed_Strategy_Action_2015(player, 41, "move", 1, AiShooter(), 18, 28, x+2, y)
		AiRed_Strategy_Action_2015(player, 44, "move", 1, AiShooter(), 19, 27, x+2, y+2)
		AiRed_Strategy_Action_2015(player, 47, "move", 1, AiShooter(), 16, 30, x, y+2)
		AiRed_Strategy_Action_2015(player, 50, "attack", 1, AiShooter(), 0, 0)
		AiRed_Strategy_Action_2015(player, 51, "attack", 1, AiCavalryMage(), 0, 0)
	elseif (player == 11) then
		AiRed_Strategy_Action_2015(player, 1, "summon", 1, AiWorker(), x, y+1)
		AiRed_Strategy_Action_2015(player, 2, "move", 1, AiWorker(), x-1, y+1, x, y+1)
		AiRed_Strategy_Action_2015(player, 12, "move", 1, AiWise(), x-1, y+1)
		AiRed_Strategy_Action_2015(player, 36, "attack", 1, AiSoldier(), 31, 31)
		AiRed_Strategy_Action_2015(player, 38, "move", 1, AiShooter(), 13, 2, x, y)
		AiRed_Strategy_Action_2015(player, 41, "move", 1, AiShooter(), 16, 0, x+2, y)
		AiRed_Strategy_Action_2015(player, 44, "move", 1, AiShooter(), 15, 1, x+2, y+2)
		AiRed_Strategy_Action_2015(player, 47, "move", 1, AiShooter(), 14, 2, x, y+2)
		AiRed_Strategy_Action_2015(player, 50, "attack", 1, AiShooter(), 31, 31)
		AiRed_Strategy_Action_2015(player, 51, "attack", 1, AiCavalryMage(), 31, 31)
	end
	AiRed_Strategy_Action_2015(player, 0, "skip", 1)
	-- 1
	-- 2
	AiRed_Strategy_Action_2015(player, 3, "skip", 1)
	AiRed_Strategy_Action_2015(player, 4, "summon", 1, AiShooter(), x, y)
	AiRed_Strategy_Action_2015(player, 5, "attack", 1, AiShooter(), x-1, y-1, x, y)
	AiRed_Strategy_Action_2015(player, 6, "skip", 1)
	AiRed_Strategy_Action_2015(player, 7, "summon", 1, AiShooter(), x+2, y)
	AiRed_Strategy_Action_2015(player, 8, "attack", 1, AiShooter(), x+3, y-1, x+2, y)
	AiRed_Strategy_Action_2015(player, 9, "skip", 1)
	AiRed_Strategy_Action_2015(player, 10, "summon", 1, AiCavalryMage(), x, y+2)
	AiRed_Strategy_Action_2015(player, 11, "attack", 1, AiCavalryMage(), x-1, y+3, x, y+2)
	-- 12
	AiRed_Strategy_Action_2015(player, 13, "summon", 1, AiShooter(), x+2, y+2)
	AiRed_Strategy_Action_2015(player, 14, "attack", 1, AiShooter(), x+3, y+3, x+2, y+2)
	AiRed_Strategy_Action_2015(player, 15, "skip", 10)
	AiRed_Strategy_Action_2015(player, 16, "move", 1, AiShooter(), x+2, y+2, x+3, y+3)
	AiRed_Strategy_Action_2015(player, 17, "move", 1, AiCavalryMage(), x, y+2, x-1, y+3)
	AiRed_Strategy_Action_2015(player, 18, "move", 1, AiShooter(), x+2, y, x+3, y-1)
	AiRed_Strategy_Action_2015(player, 19, "move", 1, AiShooter(), x, y, x-1, y-1)
	AiRed_Strategy_Action_2015(player, 20, "summon", 1, AiHeroRider(), x+1, y+1)
	AiRed_Strategy_Action_2015(player, 21, "move", 1, AiWorker(), x+4, y+4)
	AiRed_Strategy_Action_2015(player, 22, "summon", 1, AiShooter(), x+1, y)
	AiRed_Strategy_Action_2015(player, 23, "move", 1, AiHeroRider(), x+1, y+1)
	AiRed_Strategy_Action_2015(player, 24, "summon", 1, AiShooter(), x+1, y+2)
	AiRed_Strategy_Action_2015(player, 25, "summon", 1, AiFodder(), x+1, y-1)
	AiRed_Strategy_Action_2015(player, 26, "summon", 1, AiFlyer(), x-1, y-1)
	AiRed_Strategy_Action_2015(player, 27, "summon", 1, AiHeroRider(), x, y+1)
	AiRed_Strategy_Action_2015(player, 28, "summon", 1, AiFlyer(), x+2, y-1)
	AiRed_Strategy_Action_2015(player, 29, "summon", 1, AiHeroRider(), x+2, y)
	AiRed_Strategy_Action_2015(player, 30, "skip", 10)
	AiRed_Strategy_Action_2015(player, 31, "summon", 9, AiSoldier(), x-4, y+3)
	AiRed_Strategy_Action_2015(player, 32, "skip", 10)
	AiRed_Strategy_Action_2015(player, 33, "summon", 1, AiFlyer(), x+2, y+2)
	AiRed_Strategy_Action_2015(player, 34, "summon", 1, AiFlyer(), x-1, y+2)
	AiRed_Strategy_Action_2015(player, 35, "skip", 1)
	-- 36
	AiRed_Strategy_Action_2015(player, 37, "skip", 1)
	-- 38
	AiRed_Strategy_Action_2015(player, 39, "summon", 1, AiHeroShooter(), x, y)
	AiRed_Strategy_Action_2015(player, 40, "skip", 1)
	-- 41
	AiRed_Strategy_Action_2015(player, 42, "summon", 1, AiHeroShooter(), x+2, y)
	AiRed_Strategy_Action_2015(player, 43, "skip", 1)
	-- 44
	AiRed_Strategy_Action_2015(player, 45, "summon", 1, AiHeroShooter(), x+2, y+2)
	AiRed_Strategy_Action_2015(player, 46, "skip", 1)
	-- 47
	AiRed_Strategy_Action_2015(player, 48, "summon", 1, AiHeroShooter(), x, y+2)
	AiRed_Strategy_Action_2015(player, 49, "skip", 10)
	-- 50
	-- 51
	AiRed_Strategy_Action_2015(player, 52, "summon", 1, "hero", x+1, y+1)
	AiRed_Strategy_Action_2015(player, 53, "summon", 1,"hero", x+1, y+1)
	AiRed_Strategy_Action_2015(player, 54, "summon", 1, "hero", x+1, y+1)
	AiRed_Strategy_Action_2015(player, 55, "skip", 10)
	AiRed_Strategy_Action_2015(player, 56, "loop", 31)
end

function AiAya_FtM_One_Way_Through_2015(player)
	AiShane_FtM_One_Way_Through_2015(player)
	-- TODO: This!
end

function AiAya_FtM_Rockfort_Arena_2015(player)
	aiftm_terminate[player] = 1000
	x = ftm_team_x1[player]
	y = ftm_team_y1[player]
	if (player == 8) then
		AiRed_Strategy_Action_2015(player, 0, "move", 1, AiWise(), 4, 2, x+1, y+1)
		AiRed_Strategy_Action_2015(player, 19, "move", 1, AiWise(), x+4, y+1)
		AiRed_Strategy_Action_2015(player, 66, "move", 1, AiWise(), x+4, y+1)
		AiRed_Strategy_Action_2015(player, 67, "move area", 10, AiSoldier(), 47, 47, x+6, y+9)
		AiRed_Strategy_Action_2015(player, 68, "move area", 10, AiLonerShooter(), 47, 47, x+6, y+9)
	elseif (player == 9) then
		AiRed_Strategy_Action_2015(player, 0, "move", 1, AiWise(), x-1, y+1)
		AiRed_Strategy_Action_2015(player, 19, "move", 1, AiWise(), x-2, y+1)
		AiRed_Strategy_Action_2015(player, 66, "move", 1, AiWise(), x-2, y+1)
		AiRed_Strategy_Action_2015(player, 67, "move area", 10, AiSoldier(), 47, 47, x-6, y+9)
		AiRed_Strategy_Action_2015(player, 68, "move area", 10, AiLonerShooter(), 47, 47, x-6, y+9)
	elseif (player == 10) then
		AiRed_Strategy_Action_2015(player, 0, "move", 1, AiWise(), 4, 93, x+1, y+1)
		AiRed_Strategy_Action_2015(player, 19, "move", 1, AiWise(), x+4, y+1)
		AiRed_Strategy_Action_2015(player, 66, "move", 1, AiWise(), x+4, y+1)
		AiRed_Strategy_Action_2015(player, 67, "move area", 10, AiSoldier(), 47, 47, x+6, y-9)
		AiRed_Strategy_Action_2015(player, 68, "move area", 10, AiLonerShooter(), 47, 47, x+6, y-9)
	elseif (player == 11) then
		AiRed_Strategy_Action_2015(player, 0, "move", 1, AiWise(), 91, 93, x+1, y+1)
		AiRed_Strategy_Action_2015(player, 19, "move", 1, AiWise(), x-2, y+1)
		AiRed_Strategy_Action_2015(player, 66, "move", 1, AiWise(), x-2, y+1)
		AiRed_Strategy_Action_2015(player, 67, "move area", 10, AiSoldier(), 47, 47, x-6, y-9)
		AiRed_Strategy_Action_2015(player, 68, "move area", 10, AiLonerShooter(), 47, 47, x-6, y-9)
	end
	if ((player == 8) or (player == 9)) then
		AiRed_Strategy_Action_2015(player, 24, "move", 1, AiShooter(), x, y+26, x, y+1)
		AiRed_Strategy_Action_2015(player, 29, "move", 1, AiShooter(), x+1, y+26, x+1, y)
		AiRed_Strategy_Action_2015(player, 31, "move", 1, AiShooter(), x+2, y+26, x+2, y)
		AiRed_Strategy_Action_2015(player, 36, "move", 1, AiShooter(), x-1, y+26, x+1, y+2)
		AiRed_Strategy_Action_2015(player, 38, "move", 1, AiShooter(), x-2, y+26, x, y+2)
		AiRed_Strategy_Action_2015(player, 41, "move", 1, AiShooter(), x-3, y+26, x+2, y+2)
		AiRed_Strategy_Action_2015(player, 48, "move", 1, AiEliteShooter(), x-1, y+25, x+1, y+2)
		AiRed_Strategy_Action_2015(player, 49, "move", 1, AiEliteShooter(), x-2, y+25, x, y+2)
		AiRed_Strategy_Action_2015(player, 50, "move", 1, AiEliteShooter(), x-3, y+25, x+2, y+2)
		AiRed_Strategy_Action_2015(player, 60, "move", 1, AiWise(), x, y+11)
		AiRed_Strategy_Action_2015(player, 62, "summon", 5, AiLonerShooter(), x, y+10)
		AiRed_Strategy_Action_2015(player, 63, "summon", 5, AiSoldier(), x, y+10)
		AiRed_Strategy_Action_2015(player, 65, "summon", 5, AiSoldier(), x, y+10)
		AiRed_Strategy_Action_2015(player, 71, "attack area", 10, AiSoldier(), 15, 87, 47, 47)
		AiRed_Strategy_Action_2015(player, 72, "attack area", 5, AiLonerShooter(), 16, 86, 47, 47)
		AiRed_Strategy_Action_2015(player, 73, "attack area", 10, AiSoldier(), 80, 84, 16, 86)
		AiRed_Strategy_Action_2015(player, 74, "attack area", 5, AiLonerShooter(), 80, 84, 16, 86)
	elseif ((player == 10) or (player == 11)) then
		AiRed_Strategy_Action_2015(player, 24, "move", 1, AiShooter(), x, y-26, x, y+1)
		AiRed_Strategy_Action_2015(player, 29, "move", 1, AiShooter(), x+1, y-26, x+1, y)
		AiRed_Strategy_Action_2015(player, 31, "move", 1, AiShooter(), x+2, y-26, x+2, y)
		AiRed_Strategy_Action_2015(player, 36, "move", 1, AiShooter(), x-1, y-26, x+1, y+2)
		AiRed_Strategy_Action_2015(player, 38, "move", 1, AiShooter(), x-2, y-26, x, y+2)
		AiRed_Strategy_Action_2015(player, 41, "move", 1, AiShooter(), x-3, y-26, x+2, y+2)
		AiRed_Strategy_Action_2015(player, 48, "move", 1, AiEliteShooter(), x-1, y-25, x+1, y+2)
		AiRed_Strategy_Action_2015(player, 49, "move", 1, AiEliteShooter(), x-2, y-25, x, y+2)
		AiRed_Strategy_Action_2015(player, 50, "move", 1, AiEliteShooter(), x-3, y-25, x+2, y+2)
		AiRed_Strategy_Action_2015(player, 60, "move", 1, AiWise(), x, y-11)
		AiRed_Strategy_Action_2015(player, 62, "summon", 5, AiLonerShooter(), x, y-10)
		AiRed_Strategy_Action_2015(player, 63, "summon", 5, AiSoldier(), x, y-10)
		AiRed_Strategy_Action_2015(player, 65, "summon", 5, AiSoldier(), x, y-10)
		AiRed_Strategy_Action_2015(player, 71, "attack area", 10, AiSoldier(), 76, 9, 47, 47)
		AiRed_Strategy_Action_2015(player, 72, "attack area", 5, AiLonerShooter(), 76, 10, 47, 47)
		AiRed_Strategy_Action_2015(player, 73, "attack area", 10, AiSoldier(), 19, 10, 76, 9)
		AiRed_Strategy_Action_2015(player, 74, "attack area", 5, AiLonerShooter(), 19, 9, 76, 10)
	end
	AiRed_Strategy_Action_2015(player, 1, "summon", 1, AiCatapult(), x+1, y+1)
	AiRed_Strategy_Action_2015(player, 2, "summon", 1, AiShooter(), x+1, y+2)
	AiRed_Strategy_Action_2015(player, 3, "attack", 1, AiShooter(), x+1, y+3, x+1, y+2)
	AiRed_Strategy_Action_2015(player, 4, "summon", 1, AiShooter(), x, y+2)
	AiRed_Strategy_Action_2015(player, 5, "attack", 1, AiShooter(), x, y+3, x, y+2)
	AiRed_Strategy_Action_2015(player, 6, "summon", 1, AiShooter(), x+2, y+2)
	AiRed_Strategy_Action_2015(player, 7, "attack", 1, AiShooter(), x+2, y+3, x+2, y+2)
	AiRed_Strategy_Action_2015(player, 8, "skip", 10)
	AiRed_Strategy_Action_2015(player, 9, "summon", 1, AiEliteShooter(), x, y)
	AiRed_Strategy_Action_2015(player, 10, "attack", 1, AiEliteShooter(), x-1, y-1, x, y)
	AiRed_Strategy_Action_2015(player, 10, "attack", 1, AiEliteShooter(), x-1, y-1, x, y)
	AiRed_Strategy_Action_2015(player, 11, "attack", 1, AiShooter(), x+3, y+3, x+1, y+2)
	AiRed_Strategy_Action_2015(player, 12, "summon", 1, AiShooter(), x, y+1)
	AiRed_Strategy_Action_2015(player, 13, "attack", 1, AiShooter(), x-1, y, x, y+1)
	AiRed_Strategy_Action_2015(player, 14, "attack", 1, AiShooter(), x-1, y+3, x, y+2)
	AiRed_Strategy_Action_2015(player, 15, "summon", 1, AiShooter(), x+1, y)
	AiRed_Strategy_Action_2015(player, 16, "attack", 1, AiShooter(), x+1, y-1, x+1, y)
	AiRed_Strategy_Action_2015(player, 17, "summon", 1, AiShooter(), x+2, y)
	AiRed_Strategy_Action_2015(player, 18, "attack", 1, AiShooter(), x+2, y-1, x+2, y)
	-- 19
	AiRed_Strategy_Action_2015(player, 20, "attack", 1, AiEliteShooter(), x, y-1, x, y)
	AiRed_Strategy_Action_2015(player, 21, "summon", 1, AiHeroRider(), x+2, y+1)
	AiRed_Strategy_Action_2015(player, 22, "attack", 1, AiHeroRider(), x+3, y, x+2, y+1)
	AiRed_Strategy_Action_2015(player, 23, "summon", 1, AiFlyer(), x-1, y-1)
	-- 24
	AiRed_Strategy_Action_2015(player, 25, "summon", 1, AiHeroShooter(), x, y+1)
	AiRed_Strategy_Action_2015(player, 26, "attack", 1, AiShooter(), x+1, y+2, x, y+4)
	AiRed_Strategy_Action_2015(player, 27, "oil", 12000)
	AiRed_Strategy_Action_2015(player, 28, "wood", 6000)
	-- 29
	AiRed_Strategy_Action_2015(player, 30, "summon", 1, AiFlyer(), x+1, y+1)
	-- 31
	AiRed_Strategy_Action_2015(player, 32, "skip", 5)
	AiRed_Strategy_Action_2015(player, 33, "summon", 1, AiEliteShooter(), x+1, y)
	AiRed_Strategy_Action_2015(player, 34, "summon", 1, AiEliteShooter(), x+2, y)
	AiRed_Strategy_Action_2015(player, 35, "move", 1, AiHeroRider(), x+2, y+1)
	-- 36
	AiRed_Strategy_Action_2015(player, 37, "skip", 5)
	-- 38
	AiRed_Strategy_Action_2015(player, 39, "skip", 5)
	AiRed_Strategy_Action_2015(player, 40, "summon", 1, AiEliteShooter(), x, y+2)
	-- 41
	AiRed_Strategy_Action_2015(player, 42, "summon", 1, AiEliteShooter(), x+2, y+2)
	AiRed_Strategy_Action_2015(player, 43, "summon", 1, AiEliteShooter(), x+1, y+2)
	AiRed_Strategy_Action_2015(player, 44, "summon", 1, AiFlyer(), x+1, y-1)
	AiRed_Strategy_Action_2015(player, 45, "summon", 1, AiFlyer(), x, y+1)
	AiRed_Strategy_Action_2015(player, 46, "skip", 10)
	AiRed_Strategy_Action_2015(player, 47, "oil", 25000)
	-- 48
	-- 49
	-- 50
	AiRed_Strategy_Action_2015(player, 51, "skip", 1)
	AiRed_Strategy_Action_2015(player, 52, "summon", 1, AiHeroShooter(), x+1, y+2)
	AiRed_Strategy_Action_2015(player, 53, "skip", 1)
	AiRed_Strategy_Action_2015(player, 54, "summon", 1, AiHeroShooter(), x, y+2)
	AiRed_Strategy_Action_2015(player, 55, "skip", 1)
	AiRed_Strategy_Action_2015(player, 56, "summon", 1, AiHeroShooter(), x+2, y+2)
	AiRed_Strategy_Action_2015(player, 57, "skip", 10)
	AiRed_Strategy_Action_2015(player, 58, "summon", 1, "hero", x+1, y+1)
	AiRed_Strategy_Action_2015(player, 59, "summon", 5, AiLonerShooter(), x+1, y+1)
	-- 60
	AiRed_Strategy_Action_2015(player, 61, "skip", 20)
	-- 62
	-- 63
	AiRed_Strategy_Action_2015(player, 64, "skip", 10)
	-- 65
	-- 66
	-- 67
	-- 68
	AiRed_Strategy_Action_2015(player, 69, "skip", 20)
	AiRed_Strategy_Action_2015(player, 70, "summon", 1, "hero", x+1, y+1)
	-- 71
	-- 72
	-- 73
	-- 74
	AiRed_Strategy_Action_2015(player, 75, "loop", 58)
end

--  ______________________                           ______________________
--                             N I G H T M A R E     

--  ______________________                           ______________________
--                              S K I R M I S H      

function AiAya_Skirmish_2016()
	AiLucas_Skirmish_Standard_2015()
end

--  ______________________                           ______________________
--                                M Y T H I C        

DefineAi("Aya Kalang", "*", "ai_red_2015", AiAya_2015)