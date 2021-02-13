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

CharacterSetup("Sandria Fields", 14, "Red House", "Mythic")
CharacterSetup("Sandria Fields", "Skin", "Neutral", "char_sandria.png", 0.7) --0.7
CharacterSetup("Sandria Fields", "Skin", "Neutral Bloody", "char_sandria_blood.png", 0.7) --0.7

CharacterSetup("Sandria Fields", "Sync", "Neutral", "ai", "char_sandria_mouth_ai.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "e", "char_sandria_mouth_e.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "etc", "char_sandria_mouth_etc.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "l", "char_sandria_mouth_l.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "mbp", "char_sandria_mouth_mbp.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "o", "char_sandria_mouth_o.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "u", "char_sandria_mouth_u.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "wq", "char_sandria_mouth_wq.png")

CharacterSetup("Sandria Fields", "Mood", "Neutral", "Grumpy", "char_sandria_mouth_frown.png", "char_sandria_eyes_sly.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral", "Surprised", "char_sandria_mouth_surprised.png", "char_sandria_eyes_bright.png", "char_sandria_brows_surprised.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral", "Unsure", "char_sandria_mouth_frown.png", "char_sandria_eyes_bright.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral", "Happy", "char_sandria_mouth_cat.png", "char_sandria_eyes_bright.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral", "Sly", "char_sandria_mouth_cat.png", "char_sandria_eyes_sly.png")

CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "ai", "char_sandria_mouth_ai.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "e", "char_sandria_mouth_e.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "etc", "char_sandria_mouth_etc.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "l", "char_sandria_mouth_l.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "mbp", "char_sandria_mouth_mbp.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "o", "char_sandria_mouth_o.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "u", "char_sandria_mouth_u.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "wq", "char_sandria_mouth_wq.png")

CharacterSetup("Sandria Fields", "Mood", "Neutral Bloody", "Grumpy", "char_sandria_mouth_frown.png", "char_sandria_eyes_sly.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral Bloody", "Surprised", "char_sandria_mouth_surprised.png", "char_sandria_eyes_bright.png", "char_sandria_brows_surprised.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral Bloody", "Unsure", "char_sandria_mouth_frown.png", "char_sandria_eyes_bright.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral Bloody", "Happy", "char_sandria_mouth_cat.png", "char_sandria_eyes_bright.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral Bloody", "Sly", "char_sandria_mouth_cat.png", "char_sandria_eyes_sly.png")

--  ______________________                           ______________________
--                          I N T E L L I G E N C E  

function AiSandria_2015()
	AiCharacter_Set_Name_2015("Sandria Fields")
	-- Sandria will be an easy, archer player.
	--Check game type.
	if (GameDefinition["Name"] == "For the Motherland") then
		AiAya_FtM_2015(AiPlayer())
	else -- if skirmish
		if (GameCycle > 100) then
			AiJadeite_Shooter_2010()
		end
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

function AiSandria_Skirmish_2015()
	AiAya_FtM_2015(AiPlayer())
end

--  ______________________                           ______________________
--                                M Y T H I C        

DefineAi("Sandria Fields", "*", "ai_red_2015", AiSandria_2015)