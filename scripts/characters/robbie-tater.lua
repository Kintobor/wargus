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

CharacterSetup("Robbie Tater", 18, "White House", "Freemen")
CharacterSetup("Robbie Tater", "Skin", "Neutral", "char_yellowmalecaptain_full", 1)

--  ______________________                           ______________________
--                           T E M P E R A M E N T   

CharacterSetup("Robbie Tater", "Mood", "Neutral", "Grumpy")
CharacterSetup("Robbie Tater", "Mood", "Neutral", "Surprised")
CharacterSetup("Robbie Tater", "Mood", "Neutral", "Unsure")
CharacterSetup("Robbie Tater", "Mood", "Neutral", "Happy")
CharacterSetup("Robbie Tater", "Mood", "Neutral", "Sly")

--  ______________________                           ______________________
--                          I N T E L L I G E N C E  

function AiRobbie_2015()
	AiCharacter_Set_Name_2015("Robbie Tater")
	AiLucas_2015()
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

DefineAi("Robbie Tater", "*", "ai_red_2015", AiRobbie_2015)