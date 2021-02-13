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

CharacterSetup("Yukiko Robinson", 17, "Yellow House", "Order")
CharacterSetup("Yukiko Robinson", "Skin", "Neutral", "char_yukiko", 1)

--  ______________________                           ______________________
--                           T E M P E R A M E N T   

--[[
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "ai", "char_yukiko_ai")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "e", "char_yukiko_e")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "etc", "char_yukiko_etc")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "l", "char_yukiko_l")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "mbp", "char_yukiko_mbp")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "o", "char_yukiko_o")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "u", "char_yukiko_u")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "wq", "char_yukiko_wq")
]]

CharacterSetup("Yukiko Robinson", "Mood", "Neutral", "Grumpy", "char_yukiko_annoyed")
CharacterSetup("Yukiko Robinson", "Mood", "Neutral", "Surprised", "char_yukiko_surprised")
CharacterSetup("Yukiko Robinson", "Mood", "Neutral", "Unsure", "char_yukiko_unsure")
CharacterSetup("Yukiko Robinson", "Mood", "Neutral", "Happy")
CharacterSetup("Yukiko Robinson", "Mood", "Neutral", "Sly", "char_yukiko_cat")

--  ______________________                           ______________________
--                          I N T E L L I G E N C E  

function AiYukiko_2015()
	AiCharacter_Set_Name_2015("Yukiko Robinson")
	AiAya_2015()
end

--  ______________________                           ______________________
--                                E S C A P E        

--  ______________________                           ______________________
--                            M O T H E R L A N D    

--  ______________________                           ______________________
--                             N I G H T M A R E     

--  ______________________                           ______________________
--                              S K I R M I S H      

--  ______________________                           ______________________
--                                 W I L D S         

DefineAi("Yukiko Robinson", "*", "ai_red_2015", AiYukiko_2015)