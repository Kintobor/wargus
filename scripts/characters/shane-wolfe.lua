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

CharacterSetup("Shane Wolfe", 17, "White House", "Freeman")
CharacterSetup("Shane Wolfe", "Skin", "Neutral", "char_shane", 1)

--  ______________________                           ______________________
--                           T E M P E R A M E N T   

CharacterSetup("Shane Wolfe", "Mood", "Neutral", "Grumpy")
CharacterSetup("Shane Wolfe", "Mood", "Neutral", "Surprised")
CharacterSetup("Shane Wolfe", "Mood", "Neutral", "Unsure")
CharacterSetup("Shane Wolfe", "Mood", "Neutral", "Happy")
CharacterSetup("Shane Wolfe", "Mood", "Neutral", "Sly")

--  ______________________                           ______________________
--                          I N T E L L I G E N C E  

function AiShane_2015()
	AiCharacter_Set_Name_2015("Shane Wolfe")
	--Check game type.
	if (GameDefinition["Name"] == "For the Motherland") then
		AiShane_FtM_2015(AiPlayer())
	elseif (GameDefinition["Name"] == "Escape") then
		AiShane_Escape_2015()
	else
		AiShane_Skirmish_2015()
	end
end

--  ______________________                           ______________________
--                                E S C A P E        

function AiShane_Escape_2015()
	if (GameDefinition["Map"]["Name"] == "Shameful Display") then
		if (GameCycle < 50) then
			AiForce(0, {AiFodder(), GetPlayerData(AiPlayer(), "UnitTypesCount", AiFodder())})
		elseif ((UnitNear(2, AiSoldier(2), 26, 108, 10) == true) or (UnitNear(2, AiSoldier(2), 74, 106, 10) == true) or (UnitNear(2, AiSoldier(2), 101, 117, 10) == true)) then
			AiNephrite_Attack_2013("force")
		end
	elseif (GameDefinition["Map"]["Name"] == "Seawill Forests") then
		AiShane_Escape_Seawill_Forests_2015()
	end
end

--  ______________________                           ______________________
--                            M O T H E R L A N D    

function AiShane_FtM_2015(player)
	if ((GameCycle < 50) or (aiftm_action[player][aiftm_index[player]] == "loop")) then
		--Check map.
		if (GameDefinition["Map"]["Name"] == "Rockfort Arena") then
			AiShane_FtM_Rockfort_Arena_2015(player)
		elseif (GameDefinition["Map"]["Name"] == "One Way Through") then
			AiShane_FtM_One_Way_Through_2015(player)
		elseif (GameDefinition["Map"]["Name"] == "Nick's Duel") then
			AiShane_FtM_Nicks_Duel_2015(player)
		else
			AiRed_Strategy_Action_2015(player, 0, "ai_red_2014")
		end
	end
	AiRed_2015()
end

function AiShane_FtM_One_Way_Through_2015(player)
	aiftm_terminate[player] = 1000
	x = ftm_team_x1[player]
	y = ftm_team_y1[player]
	AiRed_Strategy_Action_2015(player, 0, "summon", 1, AiEliteShooter(), x, y+1)
	-- 1
	AiRed_Strategy_Action_2015(player, 2, "summon", 1, AiSoldier(), x+1, y)
	AiRed_Strategy_Action_2015(player, 3, "summon", 1, AiSoldier(), x+2, y)
	AiRed_Strategy_Action_2015(player, 4, "summon", 1, AiCavalryMage(), x, y)
	AiRed_Strategy_Action_2015(player, 5, "summon", 1, AiEliteShooter(), x+2, y+1)
	AiRed_Strategy_Action_2015(player, 6, "summon", 1, AiMage(), x+2, y+2)
	AiRed_Strategy_Action_2015(player, 7, "summon", 1, AiHeroRider(), x+1, y+2)
	AiRed_Strategy_Action_2015(player, 8, "summon", 1, AiCatapult(), x, y+2)
	AiRed_Strategy_Action_2015(player, 9, "summon", 1, AiFlyer(), x+2, y+2)
	if (player == 14) then
		AiRed_Strategy_Action_2015(player, 1, "attack", 1, AiEliteShooter(), x-1, y-1, x, y+1)
		AiRed_Strategy_Action_2015(player, 10, "attack", 1, AiSoldier(), x+3, y-1, x+2, y)
		AiRed_Strategy_Action_2015(player, 11, "attack", 1, AiSoldier(), x+2, y-1, x+1, y)
		AiRed_Strategy_Action_2015(player, 12, "attack", 1, AiCavalryMage(), x+1, y-1, x, y)
		AiRed_Strategy_Action_2015(player, 19, "skip", 1)
		AiRed_Strategy_Action_2015(player, 33, "summon", 5, AiLonerShooter(), 4, 15)
		AiRed_Strategy_Action_2015(player, 34, "summon", 10, AiShooter(), 0, 12)
		AiRed_Strategy_Action_2015(player, 35, "summon", 5, AiSoldier(), 0, 17)
		AiRed_Strategy_Action_2015(player, 36, "attack", 10, AiShooter(), 60, 45)
		AiRed_Strategy_Action_2015(player, 37, "attack", 5, AiSoldier(), 61, 46)
		AiRed_Strategy_Action_2015(player, 38, "summon", 1, "hero", x+1, y+1)
	elseif (player == 13) then
		AiRed_Strategy_Action_2015(player, 1, "summon", 1, AiShooter(), x+1, y+1)
		AiRed_Strategy_Action_2015(player, 10, "skip", 1)
		AiRed_Strategy_Action_2015(player, 11, "skip", 1)
		AiRed_Strategy_Action_2015(player, 12, "skip", 1)
		AiRed_Strategy_Action_2015(player, 19, "move", 1, AiShooter(), x+1, y, x+1, y+1)
		AiRed_Strategy_Action_2015(player, 33, "summon", 5, AiLonerShooter(), 50, 60)
		AiRed_Strategy_Action_2015(player, 34, "summon", 5, AiShooter(), 50, 60)
		AiRed_Strategy_Action_2015(player, 35, "summon", 5, AiSoldier(), 50, 60)
		AiRed_Strategy_Action_2015(player, 36, "attack", 5, AiShooter(), 1, 23)
		AiRed_Strategy_Action_2015(player, 37, "attack", 5, AiSoldier(), 2, 24)
		AiRed_Strategy_Action_2015(player, 38, "summon", 1, "hero", 50, 60)
	end
	AiRed_Strategy_Action_2015(player, 13, "skip", 15)
	AiRed_Strategy_Action_2015(player, 14, "move", 1, AiSoldier(), 35, 33, x+2, y)
	AiRed_Strategy_Action_2015(player, 15, "move", 1, AiEliteShooter(), x+2, y, x+2, y+1)
	AiRed_Strategy_Action_2015(player, 16, "summon", 1, AiHeroRider(), x+2, y+1)
	AiRed_Strategy_Action_2015(player, 17, "summon", 1, AiFlyer(), x, y+2)
	AiRed_Strategy_Action_2015(player, 18, "move", 1, AiSoldier(), 33, 35, x+1, y)
	AiRed_Strategy_Action_2015(player, 20, "summon", 1, AiHeroRider(), x+1, y+1)
	AiRed_Strategy_Action_2015(player, 21, "move", 1, AiCavalryMage(), 34, 34, x, y)
	AiRed_Strategy_Action_2015(player, 22, "move", 1, AiEliteShooter(), x, y, x, y+1)
	AiRed_Strategy_Action_2015(player, 23, "summon", 1, AiCatapult(), x, y+1)
	AiRed_Strategy_Action_2015(player, 24, "summon", 1, AiFlyer(), x+2, y)
	AiRed_Strategy_Action_2015(player, 25, "move", 1, AiShooter(), 50, 41, x+1, y)
	AiRed_Strategy_Action_2015(player, 26, "summon", 1, AiHeroRider(), x+1, y)
	AiRed_Strategy_Action_2015(player, 27, "move", 1, AiEliteShooter(), 41, 50, x+2, y)
	AiRed_Strategy_Action_2015(player, 28, "summon", 1, AiHeroRider(), x+2, y)
	AiRed_Strategy_Action_2015(player, 29, "move", 1, AiEliteShooter(), 40, 51, x, y)
	AiRed_Strategy_Action_2015(player, 30, "summon", 1, AiHeroShooter(), x, y)
	AiRed_Strategy_Action_2015(player, 31, "summon", 1, AiFlyer(), x, y)
	AiRed_Strategy_Action_2015(player, 32, "skip", 10)
	AiRed_Strategy_Action_2015(player, 39, "loop", 28)
end

function AiShane_FtM_Rockfort_Arena_2015(player)
	ftm_team_orderx[player] = "Left"
	ftm_team_ordery[player] = "Down"
	aiftm_terminate[player] = 1000
	if ((player == 10) or (player == 11)) then
		y = 91
		y2 = 91
	else
		y = 0
		y2 = -45
	end
	if ((player == 9) or (player == 11)) then
		AiRed_Strategy_Action_2015(player, 0, "move", 1, AiWise(), 91, 2+y, 93, 2+y)
		AiRed_Strategy_Action_2015(player, 1, "summon", 1, AiEliteShooter(), 92, 2+y)
		AiRed_Strategy_Action_2015(player, 2, "summon", 1, AiShooter(), 92, 3+y)
		AiRed_Strategy_Action_2015(player, 3, "summon", 1, AiCavalryMage(), 92, 1+y)
		AiRed_Strategy_Insert_2015(player, 4, 1, AiCatapult())
		AiRed_Strategy_Action_2015(player, 5, "summon", 1, AiFlyer(), 94, 0+y)
		AiRed_Strategy_Action_2015(player, 6, "oil", 7000)
		AiRed_Strategy_Insert_2015(player, 7, 1, AiMage())
		AiRed_Strategy_Action_2015(player, 8, "oil", 7000)
		AiRed_Strategy_Insert_2015(player, 9, 1, AiMage())
		AiRed_Strategy_Insert_2015(player, 10, 1, AiHeroRider())
		AiRed_Strategy_Insert_2015(player, 11, 1, AiCatapult())
		AiRed_Strategy_Action_2015(player, 12, "summon", 1, AiHeroSoldier(), 94, 2+y)
		AiRed_Strategy_Action_2015(player, 13, "move", 1, AiWise(), 90, 2+y, 91, 2+y)
		AiRed_Strategy_Action_2015(player, 14, "summon", 1, AiFlyer(), 94, 2+y)
		AiRed_Strategy_Action_2015(player, 15, "move", 1, AiEliteShooter(), 52, 26+y, 92, 2+y)
		AiRed_Strategy_Action_2015(player, 16, "summon", 1, AiHeroSoldier(), 92, 2+y)
		AiRed_Strategy_Action_2015(player, 17, "move", 1, AiShooter(), 51, 26+y, 92, 3+y)
		AiRed_Strategy_Action_2015(player, 18, "summon", 1, AiHeroShooter(), 92, 3+y)
		AiRed_Strategy_Action_2015(player, 19, "move", 1, AiCavalryMage(), 52, 27+y, 92, 1+y)
		AiRed_Strategy_Action_2015(player, 20, "summon", 1, AiHeroShooter(), 92, 1+y)
		AiRed_Strategy_Action_2015(player, 21, "summon", 1, AiFlyer(), 92, 0+y)
		AiRed_Strategy_Action_2015(player, 22, "summon", 1, AiFlyer(), 92, 2+y)
		if (player == 9) then
			AiRed_Strategy_Action_2015(player, 23, "move", 1, AiWise(), 79, 9+y)
			AiRed_Strategy_Action_2015(player, 24, "skip")
			AiRed_Strategy_Action_2015(player, 25, "skip")
			AiRed_Strategy_Action_2015(player, 26, "skip")
			AiRed_Strategy_Action_2015(player, 27, "skip")
			AiRed_Strategy_Action_2015(player, 28, "skip")
			AiRed_Strategy_Action_2015(player, 29, "summon", 1, AiSoldier(), 78, 10+y)
			AiRed_Strategy_Action_2015(player, 30, "summon", 1, AiSoldier(), 79, 10+y)
			AiRed_Strategy_Action_2015(player, 31, "summon", 1, AiSoldier(), 80, 10+y)
			AiRed_Strategy_Action_2015(player, 32, "summon", 1, AiSoldier(), 81, 10+y)
			AiRed_Strategy_Action_2015(player, 33, "summon", 1, AiSoldier(), 82, 10+y)
			AiRed_Strategy_Action_2015(player, 34, "summon", 1, AiSoldier(), 76, 10+y)
			AiRed_Strategy_Action_2015(player, 35, "summon", 1, AiSoldier(), 77, 10+y)
			AiRed_Strategy_Action_2015(player, 36, "skip")
			for xy=0,6 do
				AiRed_Strategy_Action_2015(player, 37+xy, "summon", 1, AiShooter(), 76+xy, 11+y)
			end
			AiRed_Strategy_Action_2015(player, 44, "skip")
			AiRed_Strategy_Action_2015(player, 45, "skip")
			AiRed_Strategy_Action_2015(player, 46, "skip")
			AiRed_Strategy_Action_2015(player, 47, "move", 1, AiSoldier(), 51, 27+y, 76, 10+y)
			AiRed_Strategy_Action_2015(player, 48, "move", 1, AiSoldier(), 50, 27+y, 77, 10+y)
			AiRed_Strategy_Action_2015(player, 49, "move", 1, AiSoldier(), 49, 27+y, 78, 10+y)
			AiRed_Strategy_Action_2015(player, 50, "move", 1, AiSoldier(), 48, 27+y, 79, 10+y)
			AiRed_Strategy_Action_2015(player, 51, "move", 1, AiSoldier(), 47, 27+y, 80, 10+y)
			AiRed_Strategy_Action_2015(player, 52, "move", 1, AiSoldier(), 46, 27+y, 81, 10+y)
			AiRed_Strategy_Action_2015(player, 53, "move", 1, AiSoldier(), 45, 27+y, 82, 10+y)
			AiRed_Strategy_Action_2015(player, 54, "skip", 10)
			AiRed_Strategy_Action_2015(player, 55, "move", 1, AiShooter(), 80, 26+y, 76, 11+y)
			AiRed_Strategy_Action_2015(player, 56, "move", 1, AiShooter(), 50, 26+y, 77, 11+y)
			AiRed_Strategy_Action_2015(player, 57, "move", 1, AiShooter(), 49, 26+y, 78, 11+y)
			AiRed_Strategy_Action_2015(player, 58, "move", 1, AiShooter(), 48, 26+y, 79, 11+y)
			AiRed_Strategy_Action_2015(player, 59, "move", 1, AiShooter(), 47, 26+y, 80, 11+y)
			AiRed_Strategy_Action_2015(player, 60, "move", 1, AiShooter(), 46, 26+y, 81, 11+y)
			AiRed_Strategy_Action_2015(player, 61, "move", 1, AiShooter(), 45, 26+y, 82, 11+y)
			AiRed_Strategy_Action_2015(player, 62, "skip", 5)
			AiRed_Strategy_Action_2015(player, 63, "summon", 3, "hero", 78, 5+y)
			AiRed_Strategy_Action_2015(player, 64, "attack", 1, AiShooter(), 6, 87)
			AiRed_Strategy_Action_2015(player, 65, "attack", 1, AiSoldier(), 6, 88)
			AiRed_Strategy_Action_2015(player, 66, "loop", 23)
		else
			AiRed_Strategy_Action_2015(player, 23, "move", 1, AiWise(), 79, 90, 90, 93)
			AiRed_Strategy_Action_2015(player, 24, "skip", 5)
			for xy=1,10 do
				AiRed_Strategy_Action_2015(player, 24+xy, "summon", 1, AiShooter(), 78, 85+xy)
				AiRed_Strategy_Action_2015(player, 34+xy, "move", 1, AiShooter(), 64, 67+xy, 78, 85+xy)
				AiRed_Strategy_Action_2015(player, 45+xy, "patrol", 1, AiShooter(), 78, 67+xy, 64, 67+xy)
			end
			AiRed_Strategy_Action_2015(player, 45, "skip", 10)
			-- Moving something which isn't there crashes the game.
			AiRed_Strategy_Action_2015(player, 56, "move", 1, AiWise(), 89, 78, 79, 90)
			AiRed_Strategy_Action_2015(player, 57, "attack", 1, AiShooter(), 91, 26, 53, 90)
			AiRed_Strategy_Action_2015(player, 58, "attack", 1, AiCavalryMage(), 91, 26)
			AiRed_Strategy_Action_2015(player, 59, "attack", 1, AiEliteShooter(), 91, 26)
			AiRed_Strategy_Action_2015(player, 60, "skip", 2)
			AiRed_Strategy_Action_2015(player, 61, "summon", 1, AiFodder(), 85, 78)
			AiRed_Strategy_Action_2015(player, 62, "summon", 1, AiFodder(), 85, 79)
			for xy=0,6 do
				AiRed_Strategy_Action_2015(player, 63+xy, "summon", 1, AiFodder(), 91-xy, 77)
				AiRed_Strategy_Action_2015(player, 72+xy, "summon", 1, AiFodder(), 84-xy, 80)
				AiRed_Strategy_Action_2015(player, 79+xy, "summon", 1, AiFodder(), 84-xy, 79)
			end
			AiRed_Strategy_Action_2015(player, 70, "move", 1, AiWise(), 81, 82, 89, 78)
			AiRed_Strategy_Action_2015(player, 71, "skip", 5)
			AiRed_Strategy_Action_2015(player, 86, "move", 1, AiWise(), 91, 93)
			AiRed_Strategy_Action_2015(player, 87, "skip", 10)
			-- Begin loop.
			for xy=0,4 do
				AiRed_Strategy_Action_2015(player, 88+xy, "summon", 1, AiSoldier(), 90, 91+xy)
				AiRed_Strategy_Action_2015(player, 93+xy, "summon", 1, AiSoldier(), 89, 91+xy)
				AiRed_Strategy_Action_2015(player, 98+xy, "summon", 1, AiSoldier(), 88, 91+xy)
				AiRed_Strategy_Action_2015(player, 103+xy, "summon", 1, AiSoldier(), 87, 91+xy)
				AiRed_Strategy_Action_2015(player, 108+xy, "summon", 1, AiFodder(), 86, 91+xy)
			end
			AiRed_Strategy_Action_2015(player, 113, "summon", 1, AiLonerShooter(), 85, 95)
			AiRed_Strategy_Action_2015(player, 114, "summon", 1, AiLonerShooter(), 85, 94)
			AiRed_Strategy_Action_2015(player, 115, "attack", 1, AiSoldier(), 93, 26)
			AiRed_Strategy_Action_2015(player, 116, "attack", 1, AiLonerShooter(), 93, 26)
			AiRed_Strategy_Action_2015(player, 117, "attack", 1, AiFodder(), 93, 26)
			AiRed_Strategy_Action_2015(player, 118, "move", 1, AiWise(), 89, 78)
			AiRed_Strategy_Action_2015(player, 119, "skip", 10)
			AiRed_Strategy_Action_2015(player, 120, "loop", 60)
		end
	end
end

function AiShane_FtM_Nicks_Duel_2015(player)
	AiAya_FtM_Nicks_Duel_2015(player)
	-- TODO: This.
end

--  ______________________                           ______________________
--                             N I G H T M A R E     

--  ______________________                           ______________________
--                              S K I R M I S H      

function AiShane_Skirmish_2015()
	if (GameDefinition["Map"]["Name"] == "Dunath Plains") then
		AiShane_Skirmish_Dunath_Plains_2015()
	elseif (GameDefinition["Map"]["Name"] == "Sea Preparations") then
		AiShane_Skirmish_Sea_Preparations_2015()
	else
		AiLucas_Skirmish_Standard_2015()
	end
end

function AiShane_Skirmish_Dunath_Plains_2015()
	if (GameCycle < 1500) then
		AiSet(AiWorker(), 10)
		AiSet(AiBarracks(), 1)
		AiJadeite_Variable_2010("archers", true)
	else
		AiJadeite_Force_2010(0, AiEliteShooter(), 5)
		if (ArmyNear(1, 9, 6, 5) == true) then
			AiJadeite_Attack_2010(3, true)
			AiJadeite_Attack_2010(4, true)
			if ((CampaignData["Shane Wolfe"]["Dunath Plains"]["Magic"] < 9) and (GetPlayerData(1, "UnitTypesCount", AiSoldier(1)) > 6) and (UnitNear(4, AiCityCenter(4), 9, 6, 5)) and ((GetPlayerData(1, "UnitTypesCount", AiSoldier(1)) > GetPlayerData(4, "UnitTypesCount", AiSoldier(4)) + GetPlayerData(4, "UnitTypesCount", AiFodder(4))))) then
				if ((GetPlayerData(6, "UnitTypesCount", AiEliteShooter(6)) > 6) and (CampaignData["Shane Wolfe"]["Dunath Plains"]["Magic"] < 10)) then
					BundleAction("Multiplayer", "Shane Wolfe", {"Sit tight, I'm sending help."}, {"Help1"})
				else
					BundleAction("Multiplayer", "Shane Wolfe", {"I'm sorry, I can't help you. My forces have been decimated."}, {"Help2", "Help3"})
				end
				CampaignDataSetup("Shane Wolfe", 9)
			end
		elseif (ArmyNear(4, 100, 100, 25) == true) then
			AiJadeite_Attack_2010(3, true)
			AiJadeite_Attack_2010(4, true)
			if ((UnitNear(4, AiCityCenter(4), 9, 6, 5)) and (UnitNear(6, AiCityCenter(6), 111, 25, 5)) and ((GetPlayerData(6, "UnitTypesCount", AiFodder(6)) > 4) or (GetPlayerData(6, "UnitTypesCount", AiEliteShooter(6)) > 6)) and (CampaignData["Shane Wolfe"]["Dunath Plains"]["Magic"] < 10)) then
				if ((CampaignData["Shane Wolfe"]["Dunath Plains"]["Magic"] > 0) and (CampaignData["Shane Wolfe"]["Dunath Plains"]["Magic"] < 9)) then
					BundleAction("Multiplayer", "Shane Wolfe", {"Now is the time, Mythic. Let us assault the enemy fortifications.", nil, "Stick close to the rangers."}, {"Attack1", "Attack2", "Backup3"})
				else
					BundleAction("Multiplayer", "Shane Wolfe", {"The calvary has arrived. Let's crush these Wild scum together.", nil, "Stick close to the rangers."}, {"Backup1", "Backup2", "Backup3"})
				end
				MoveArmyQuick(6, 127, 127, 111, 25, 10)
				CampaignDataSetup("Shane Wolfe", 10)
			end
		end
		AiJadeite_Intermittent_2010()
		AiJadeite_Force_2010(3, AiFodder(), 10, AiShooter(), 5)
		AiJadeite_Force_2010(4, AiFodder(), 10, AiShooter(), 5)
		TransferResources(14, 6, {"gold"}, {"wood"}, {"oil"})
	end
	if ((UnitNear(14, AiCityCenter(14), 9, 6, 5)) and (UnitNear(4, AiHeroSoldier(4), 111, 25, 5)) and (UnitNear(6, AiCityCenter(6), 111, 25, 5)) and (CampaignData["Shane Wolfe"]["Dunath Plains"]["Magic"] == 0)) then
		if (GameCycle < 10000) then
			BundleAction("Multiplayer", "Shane Wolfe", {"Hello Mythic. Good of you to come.",  nil, "Together we'll be able about to drive these Wild scum out of Dunath.", "If you need a headquarters, there is one you can use to the west."}, {"Visit1", "Visit2", "Visit3", "Visit4"})
		else
			BundleAction("Multiplayer", "Shane Wolfe", {"Oh, hi Myth. Nice of you to finally arrive.",  nil, "The townsfolk are waiting for you at the town hall to the west."}, {"Late1", "Late2", "Late3"})
		end
		CampaignDataSetup("Shane Wolfe", 1)
	elseif ((UnitNear(4, AiCityCenter(4), 9, 6, 5)) and (CampaignData["Shane Wolfe"]["Dunath Plains"]["Magic"] < 5) and (ArmyNear(4, 100, 100, 25) ~= true)) then
		if (GameCycle < 15000) then
			if (CampaignData["Shane Wolfe"]["Dunath Plains"]["Magic"] == 0) then
				BundleAction("Multiplayer", "Shane Wolfe", {"Greetings Mythic. It is good you have finally arrived.",  nil, "Together we'll be able about to drive these Wild scum out of Dunath.", "They have been tearing our stores down and raiding our supplies.", "The first thing you are going to want to do is to replace the four farmsteads that were lost.", "Without them you wont have the supplies needed to fight back.", "Assign three workers to collect lumber. Tell the remaining ones mine gold."}, {"Base1", "Base2", "Base3", "Base4", "Base6", "Base7", "Base8", "Base9"})
			else
				BundleAction("Multiplayer", "Shane Wolfe", {"Those Wild marauders have been tearing our farms and stealing our supplies.", "The first thing you are going to want to do is to replace the four farmsteads that were lost.", "Without them you wont have the supplies needed to fight back.", "Assign three workers to collect lumber. Tell the remaining ones mine gold."}, {"Base5", "Base6", "Base7", "Base8", "Base9"})
			end
		else
			BundleAction("Multiplayer", "Shane Wolfe", {"You made it, finally. I don't have time to explain the situation.", nil, "Just build a barracks and four farmsteads. You'll need them to gather minutemen.", "Assign three workers to collect lumber. Tell the remaining ones mine gold."}, {"Time1", "Time2", "Time3", "Time4", "Base8", "Base9"})
		end
		CampaignDataSetup("Shane Wolfe", 5)
	elseif ((GetPlayerData(4, "UnitTypesCount", AiFarm(4)) > 2) and (CampaignData["Shane Wolfe"]["Dunath Plains"]["Magic"] == 5)) then
		if (GetPlayerData(4, "UnitTypesCount", AiBarracks(4)) == 0) then
			BundleAction("Multiplayer", "Shane Wolfe", {"Think about building a barracks. That would allow you to recruit minutemen."}, {"Build1"})
			CampaignDataSetup("Shane Wolfe", 6)
		else
			BundleAction("Multiplayer", "Shane Wolfe", {"Minutemen are townsfolk who have undergone combat training. They can be equiped with improved weapons from the blacksmith."}, {"Build2", "Build3"})
			CampaignDataSetup("Shane Wolfe", 8)
		end
	elseif ((GetPlayerData(4, "UnitTypesCount", AiBarracks(4)) > 0) and (CampaignData["Shane Wolfe"]["Dunath Plains"]["Magic"] == 6)) then
		BundleAction("Multiplayer", "Shane Wolfe", {"You can train minutemen at this barracks. It shouldn't take more than a minute."}, {"Build4"})
		CampaignDataSetup("Shane Wolfe", 7)
	elseif ((GetPlayerData(4, "UnitTypesCount", AiFodder(4)) > 5) and (GetPlayerData(4, "UnitTypesCount", AiBlacksmith(4)) == 0) and (CampaignData["Shane Wolfe"]["Dunath Plains"]["Magic"] == 7)) then
		BundleAction("Multiplayer", "Shane Wolfe", {"Think about building a blacksmith. You'll be able to equip your minutemen with better weapons and armour."}, {"Build5", "Build6"})
		CampaignDataSetup("Shane Wolfe", 8)
	elseif ((GameCycle > 20000) and (GameCycle < 21000)) then
		AiSet(AiFarm(), 20)
		AiSet(AiWorker(), 20)
	elseif ((GameCycle > 6000) and (GameCycle < 7000)) then
		AiSet(AiFarm(), 10)
	else
		if (GetPlayerData(AiPlayer(), "UnitTypesCount", AiFodder()) > 4) then
			AiJadeite_Upgrade_2010(AiSoldier())
		end
		if (GetPlayerData(AiPlayer(), "UnitTypesCount", AiEliteShooter()) > 4) then
			AiJadeite_Upgrade_2010(AiShooter())
		end
	end
end

function AiShane_Skirmish_Sea_Preparations_2015()
	if (GameCycle > 5000) then
		AiJadeite_Upgrade_2010(AiSoldier())
		AiJadeite_Upgrade_2010(AiShooter())
	end
	if (AiJadeite_Force_2010(3, AiFodder(), 10, AiShooter(), 10) == true) then
		AiJadeite_Build_2010(AiGuardTower())
		AiJadeite_Attack_2010(3, true)
		AiSet(AiWorker(), 20)
	end
	AiJadeite_Intermittent_2010()
end

function AiShane_Escape_Seawill_Forests_2015()
	local ShaneEnemy = 3
	local ShaneAlly = 4
	if (ShaneTimer == nil) then 
		ShaneTimer = 15
	elseif (ShaneTimer < 1) then 
		if (GetPlayerData(AiPlayer(), "UnitTypesCount", AiShooter()) == 0) then
			ShaneTimer = 50
		else
			ShaneTimer = 10
		end
	else 
		ShaneTimer = ShaneTimer - 1 
	end
	if (GameCycle < 50) then
		MoveUnitQuick(AiPlayer(), AiEliteShooter(AiPlayer()), 107, 72, 85, 82, 10, "move")
	elseif (GameCycle < 2000) then
	elseif ((GameCycle > 3900) and (GameCycle < 4000)) then
		MoveUnitQuick(AiPlayer(), AiEliteShooter(AiPlayer()), 85, 82, 107, 72, 10)
	elseif (ShaneTimer == 1) then 
		if (MoveArmyGrid(AiPlayer(), {{28, 39},{47, 43},{34, 62},{32, 34}}, {{55, 57}}, 5, ShaneEnemy, ShaneAlly) == true) then
		
		--76, 63
		elseif (MoveArmyGrid(AiPlayer(), {{124, 35},{97, 24},{94, 4}}, {{114, 8}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{39, 73},{34, 62},{8, 79},{26, 80}}, {{30, 73}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{67, 3},{67, 18},{94, 4},{89, 20}}, {{75, 8}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{85, 12},{54, 13}}, {{67, 3},{67, 18}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{40, 2},{67, 3},{67, 18},{53, 13}}, {{69, 33}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{55, 57},{32, 35},{69, 33},{53, 13}}, {{47, 43}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{74, 69},{104, 74},{97, 100},{60, 90}}, {{87, 82}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{77, 59},{55, 57},{55, 79},{85, 81}}, {{65, 67},{74, 69}}, 4, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{114, 7},{85, 13},{85, 13}}, {{94, 4},{98, 23}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{105, 57}}, {{123, 58}}, 4, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{123, 58}}, {{121, 72}}, 4, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{107, 73},{87, 79}}, {{116, 83}}, 4, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{116, 82},{102, 105}}, {{103, 97}}, 4, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{78, 111},{106, 115},{113, 97},{86, 79}}, {{102, 101}}, 8, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{2, 2},{49, 11},{37, 3}}, {{26, 3},{13, 16},{17, 7},{37, 3}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{10, 45},{13, 44},{10, 32},{28, 39}}, {{8, 55},{14, 53},{20, 54},{24, 54}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{14, 18},{23, 17},{32, 18},{26, 3}}, {{10, 45},{13, 44},{10, 32},{28, 39}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{27, 106},{72, 109},{80, 119},{19, 102}}, {{35, 114},{43, 116},{56, 119},{69, 112}}, 4, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{30, 95},{12, 100}}, {{19, 102},{27, 104},{32, 108}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{44, 96},{25, 80}}, {{30, 95}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{9, 80},{30, 73},{37, 74}}, {{25, 80}, {23, 77}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{25, 79},{8, 55}}, {{9, 80}}, 5, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{12, 100},{27, 105},{73, 109},{24, 80}}, {{1, 108},{39, 116},{30, 95},{56, 120}}, 3, ShaneEnemy, ShaneAlly) == true) then
		elseif (MoveArmyGrid(AiPlayer(), {{12, 100},{30, 95}}, {{2, 108},{26, 104},{19, 102}}, 5, ShaneEnemy, ShaneAlly) == true) then
		-- go back
		elseif (MoveArmyGrid(AiPlayer(), {{2, 108},{26, 104},{19, 102}}, {{12, 100},{30, 95}}, 5, ShaneEnemy, ShaneAlly) == true) then
		end
	end
end

--  ______________________                           ______________________
--                               F R E E M A N       

DefineAi("Shane Wolfe", "*", "ai_red_2015", AiShane_2015)