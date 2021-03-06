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
--      upgrade.ccl - Define the human dependencies and upgrades.
--
--      (c) Copyright 2014 by Kyran Jackson
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
--      Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--

local upgrades = {
  {"upgrade-unit-footman", "icon-battle-axe2",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-archer", "icon-battle-axe3",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-ballista", "icon-throwing-axe2",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-knight", "icon-throwing-axe3",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-female-hero", "icon-orc-shield2",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-knight-rider", "icon-orc-shield3",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-peasant", "icon-orc-ship-cannon2",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-ranger", "icon-orc-ship-cannon3",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-yeoman", "icon-orc-ship-armor2",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-gryphon-rider", "icon-orc-ship-armor3",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-arthor-literios", "icon-catapult1",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-mage", "icon-catapult2",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-paladin", "icon-berserker",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-attack-peasant", "icon-light-axes",
    {     0,     0,     0,     0,     0,     0,     0}},
  {"upgrade-unit-dwarves", "icon-light-axes",
    {     0,     0,     0,     0,     0,     0,     0}},
}

for i = 1,table.getn(upgrades) do
  u = CUpgrade:New(upgrades[i][1])
  u.Icon = Icons[upgrades[i][2]]
  for j = 1,table.getn(upgrades[i][3]) do
    u.Costs[j - 1] = upgrades[i][3][j]
  end
end

DefineModifier("upgrade-sword1",
  {"Level", 1},
  {"PiercingDamage", 2},
  {"apply-to", "unit-caanoo-oathbreaker"}, {"apply-to", "unit-human-adventurer"}, {"apply-to", "unit-order-paladin"})

DefineModifier("upgrade-sword2",
  {"Level", 1},
  {"PiercingDamage", 2},
  {"apply-to", "unit-caanoo-oathbreaker"}, {"apply-to", "unit-human-adventurer"}, {"apply-to", "unit-order-paladin"})

DefineModifier("upgrade-arrow1",
  {"Level", 1},
  {"PiercingDamage", 1},
  {"apply-to", "unit-yeoman"})

DefineModifier("upgrade-arrow2",
  {"Level", 1},
  {"PiercingDamage", 1},
  {"apply-to", "unit-yeoman"})

DefineModifier("upgrade-human-shield1",
  {"Level", 1},
  {"Armor", 2},
  {"apply-to", "unit-caanoo-oathbreaker"}, {"apply-to", "unit-human-adventurer"}, {"apply-to", "unit-order-paladin"})

DefineModifier("upgrade-human-shield2",
  {"Level", 1},
  {"Armor", 2},
  {"apply-to", "unit-caanoo-oathbreaker"}, {"apply-to", "unit-human-adventurer"}, {"apply-to", "unit-order-paladin"})

DefineModifier("upgrade-longbow",
  {"Level", 1},
  {"SightRange", 1},
  {"AttackRange", 1},
  {"apply-to", "unit-yeoman"})

DefineModifier("upgrade-ranger-scouting",
  {"Level", 1},
  {"SightRange", 3},
  {"apply-to", "unit-yeoman"})

DefineModifier("upgrade-ranger-marksmanship",
  {"Level", 1},
  {"PiercingDamage", 3},
  {"apply-to", "unit-yeoman"})

DefineModifier("upgrade-holy-vision",
  {"Level", 1},
  {"apply-to", "unit-order-paladin"})

DefineModifier("upgrade-healing",
  {"Level", 1},
  {"apply-to", "unit-order-paladin"})

DefineModifier("upgrade-exorcism",
  {"Level", 1},
  {"apply-to", "unit-order-paladin"})
  
DefineModifier("upgrade-throwing-axe1",
  {"Level", 1},
  {"PiercingDamage", 1},
  {"apply-to", "unit-nomad"})

DefineModifier("upgrade-throwing-axe2",
  {"Level", 1},
  {"PiercingDamage", 1},
  {"apply-to", "unit-nomad"})

DefineModifier("upgrade-light-axes",
  {"Level", 1},
  {"SightRange", 1},
  {"AttackRange", 1},
  {"apply-to", "unit-nomad"})

DefineModifier("upgrade-berserker-scouting",
  {"Level", 1},
  {"SightRange", 3},
  {"apply-to", "unit-nomad"})

DefineModifier("upgrade-berserker-regeneration",
  {"Level", 1},
  {"regeneration-rate", 1},
  {"apply-to", "unit-nomad"})
  
-- Wise Man Spells
  
DefineModifier("upgrade-unit-footman",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-archer",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-ballista",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-knight",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
 
DefineModifier("upgrade-unit-female-hero",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-knight-rider",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-peasant",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-ranger",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-yeoman",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-gryphon-rider",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-arthor-literios",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-mage",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-paladin",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-attack-peasant",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineModifier("upgrade-unit-dwarves",
  {"Level", 1},
  {"apply-to", "unit-caanoo-wiseman"})
  
DefineAllow("upgrade-unit-footman", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-archer", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-ballista", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-knight", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-attack-peasant", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-unit-paladin", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-paladin", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-mage", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-arthor-literios", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-gryphon-rider", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-yeoman", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-ranger", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-peasant", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-knight-rider", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-female-hero", "RRRRRRRRRRRRRRRR")
DefineAllow("upgrade-unit-dwarves", "RRRRRRRRRRRRRRRR")
  
-- Wise Skeleton Spells


