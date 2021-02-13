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

CharacterSetup("Sky Robinson", 17, "Yellow House", "Order")
CharacterSetup("Sky Robinson", "Skin", "Neutral", "char_sky_crossed.png", 1)

CharacterSetup("Sky Robinson", "Sync", "Neutral", "ai", "char_sky_ai.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "e", "char_sky_e.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "etc", "char_sky_etc.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "l", "char_sky_l.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "mbp", "char_sky_mbp.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "o", "char_sky_o.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "u", "char_sky_u.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "wq", "char_sky_wq.png")

CharacterSetup("Sky Robinson", "Mood", "Neutral", "Grumpy", "char_sky_annoyed")
CharacterSetup("Sky Robinson", "Mood", "Neutral", "Surprised", "char_sky_surprised.png")
CharacterSetup("Sky Robinson", "Mood", "Neutral", "Unsure", "char_sky_unsure.png")
CharacterSetup("Sky Robinson", "Mood", "Neutral", "Happy")
CharacterSetup("Sky Robinson", "Mood", "Neutral", "Sly", "char_sky_cat")

--  ______________________                           ______________________
--                          I N T E L L I G E N C E  

function AiSky_2015()
	AiCharacter_Set_Name_2015("Sky Robinson")
	--Check game type.
	if (GameDefinition["Name"] == "For the Motherland") then
		AiSky_FtM_2015(AiPlayer())
	else
		AiSky_Skirmish_2015()
	end
end

--  ______________________                           ______________________
--                                E S C A P E        

--  ______________________                           ______________________
--                            M O T H E R L A N D    

function AiSky_FtM_2015(player)
	if ((GameCycle < 50) or (aiftm_action[player][aiftm_index[player]] == "loop")) then
		--Check map.
	--	if (GameDefinition["Map"]["Name"] == "Nephrite's Gambit") then
			AiSky_FtM_Nephrites_Gambit_2015(player)
	--	end
	end
	AiRed_2015()
end

function AiSky_FtM_Nephrites_Gambit_2015(player)
	ftm_team_orderx[player] = "Left"
	ftm_team_ordery[player] = "Down"
	aiftm_terminate[player] = 1000
	if (player == 8) then
		sx = 4
		sy = 115
	elseif (player == 12) then
		sx = 9
		sy = 120
	elseif (player == 9) then
		sx = 122
		sy = 2
	end
	if ((player == 8) or (player == 12)) then
		if (player == 8) then
			AiRed_Strategy_Action_2015(player, 0, "move", 1, AiWise(), 14, 117, 9, 113)
			AiRed_Strategy_Action_2015(player, 1, "summon", 1, AiFodder(), sx+3, sy+3)
			AiRed_Strategy_Action_2015(player, 2, "skip", 10)
			AiRed_Strategy_Action_2015(player, 3, "summon", 1, AiFodder(), sx+3, sy+2)
			-- 4
			AiRed_Strategy_Action_2015(player, 5, "summon", 1, AiFodder(), sx+3, sy+0)
			AiRed_Strategy_Action_2015(player, 6, "move", 1, AiWise(), 9, 113, 14, 117)
			AiRed_Strategy_Action_2015(player, 21, "gold", 7500)
			AiRed_Strategy_Action_2015(player, 22, "oil", 5000)
			AiRed_Strategy_Action_2015(player, 23, "move", 1, AiFodder(), sx+0, sy-8, sx+3, sy+3)
			AiRed_Strategy_Action_2015(player, 24, "skip", 5)
			AiRed_Strategy_Action_2015(player, 25, "move", 1, AiFodder(), sx+1, sy-8, sx+3, sy+2)
			AiRed_Strategy_Action_2015(player, 28, "gold", 7500)
			AiRed_Strategy_Action_2015(player, 29, "oil", 5000)
			AiRed_Strategy_Action_2015(player, 30, "move", 1, AiFodder(), sx+2, sy-8, sx+3, sy+0)
			AiRed_Strategy_Action_2015(player, 31, "skip", 5)
			AiRed_Strategy_Action_2015(player, 32, "summon", 1, AiCavalryMage(), sx+3, sy+0)
			AiRed_Strategy_Action_2015(player, 33, "gold", 7500)
			AiRed_Strategy_Action_2015(player, 34, "move", 1, AiSoldier(), sx+3, sy-8, sx+3, sy+1)
			-- When the Gateway is under threat, Rufus might decide to charge with the officers in the next wave and tell Sandria to do the same.
			-- The Order commander will think them crazy.
			-- Do you want to live forever?
			-- Easy for you to say.
			AiRed_Strategy_Action_2015(player, 35, "skip", 5)
			AiRed_Strategy_Action_2015(player, 36, "oil", 5000)
			AiRed_Strategy_Action_2015(player, 37, "summon", 1, AiCavalryMage(), sx+3, sy+1)
		else
			AiRed_Strategy_Action_2015(player, 0, "skip", 1)
			AiRed_Strategy_Action_2015(player, 1, "summon", 1, AiEliteShooter(), sx, sy)
			AiRed_Strategy_Action_2015(player, 2, "skip", 10)
		end
	else
		AiRed_Strategy_Action_2015(player, 0, "skip", 1)
		AiRed_Strategy_Action_2015(player, 1, "summon", 1, AiSoldier(), sx+3, sy+3)
		AiRed_Strategy_Action_2015(player, 2, "summon", 1, AiSoldier(), sx+3, sy+2)
		AiRed_Strategy_Action_2015(player, 5, "summon", 1, AiSoldier(), sx+3, sy+0)
	end
	-- 0
	-- 1
	-- 2
	-- 3
	AiRed_Strategy_Action_2015(player, 4, "summon", 1, AiSoldier(), sx+3, sy+1)
	-- 5
	-- 6
	AiRed_Strategy_Action_2015(player, 7, "summon", 1, AiCavalryMage(), sx+2, sy+2)
	AiRed_Strategy_Action_2015(player, 8, "summon", 1, AiSoldier(), sx+1, sy+2)
	AiRed_Strategy_Action_2015(player, 9, "summon", 1, AiSoldier(), sx+2, sy+1)
	AiRed_Strategy_Action_2015(player, 10, "summon", 1, AiCatapult(), sx+1, sy+1)
	AiRed_Strategy_Action_2015(player, 11, "summon", 1, AiCavalry(), sx+0, sy+0)
	AiRed_Strategy_Action_2015(player, 12, "summon", 1, AiSoldier(), sx+0, sy+1)
	AiRed_Strategy_Action_2015(player, 13, "summon", 1, AiSoldier(), sx+0, sy+2)
	AiRed_Strategy_Action_2015(player, 14, "summon", 1, AiSoldier(), sx+0, sy+3)
	AiRed_Strategy_Action_2015(player, 15, "summon", 1, AiSoldier(), sx+1, sy+3)
	AiRed_Strategy_Action_2015(player, 16, "summon", 1, AiCatapult(), sx+2, sy+3)
	AiRed_Strategy_Action_2015(player, 17, "summon", 1, AiHeroSoldier(), sx+0, sy+1)
	AiRed_Strategy_Action_2015(player, 18, "summon", 1, AiCavalryMage(), sx+2, sy+0)
	AiRed_Strategy_Action_2015(player, 19, "skip", 10)
	AiRed_Strategy_Action_2015(player, 20, "skip", 10)
	-- 21
	-- 22
	-- 23
	AiRed_Strategy_Action_2015(player, 26, "summon", 1, AiCavalryMage(), sx+3, sy+2)
	AiRed_Strategy_Action_2015(player, 27, "summon", 1, AiCatapult(), sx+3, sy+3)
	--AiRed_Strategy_Action_2015(player, 3, "loop", 0)
end

--  ______________________                           ______________________
--                             N I G H T M A R E     



--  ______________________                           ______________________
--                              S K I R M I S H      

function AiSky_Skirmish_2015()
	if ((GameDefinition["Map"]["Name"] == "Fall of Genesis Castle") and (AiPlayer() == 9)) then
		AiAya_FtM_2015(AiPlayer())
	end
end

--  ______________________                           ______________________
--                                 O R D E R         

DefineAi("Sky Robinson", "*", "ai_red_2015", AiSky_2015)