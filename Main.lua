local name = UnitName("player")
local level = UnitLevel("player")
local currentArea = GetZoneText()
local factionGroup = UnitFactionGroup("player")
local faction
if string.lower(factionGroup) == "alliance" then
    faction = 1
else
    faction = 2
end

local areas = {
    { name = "Azuremyst Isle", faction = 1, from = 1, to = 10 },
    { name = "Dun Morogh", faction = 1, from = 1, to = 10 },
    { name = "Durotar", faction = 2, from = 1, to = 10 },
    { name = "Elwynn Forest", faction = 1, from = 1, to = 10 },
    { name = "Eversong Woods", faction = 2, from = 1, to = 10 },
    { name = "Mulgore", faction = 2, from = 1, to = 10 },
    { name = "Teldrassil", faction = 1, from = 1, to = 10 },
    { name = "Tirisfal Glades", faction = 2, from = 1, to = 10 },
    { name = "Bloodmyst Isle", faction = 1, from = 10, to = 20 },
    { name = "Darkshore", faction = 1, from = 10, to = 20 },
    { name = "Ghostlands", faction = 2, from = 10, to = 20 },
    { name = "Loch Modan", faction = 1, from = 10, to = 20 },
    { name = "Silverpine Forest", faction = 2, from = 10, to = 20 },
    { name = "Westfall", faction = 1, from = 10, to = 20 },
    { name = "Barrens", faction = 2, from = 10, to = 25 },
    { name = "Redridge Mountains", faction = 1, from = 15, to = 25 },
    { name = "Stonetalon Mountains", faction = 0, from = 15, to = 27 },
    { name = "Ashenvale", faction = 0, from = 18, to = 30 },
    { name = "Duskwood", faction = 1, from = 18, to = 30 },
    { name = "Hillsbrad Foothills", faction = 0, from = 20, to = 30 },
    { name = "Wetlands", faction = 1, from = 20, to = 30 },
    { name = "Thousand Needles", faction = 2, from = 25, to = 35 },
    { name = "Alterac Mountains", faction = 0, from = 30, to = 40 },
    { name = "Arathi Highlands", faction = 0, from = 30, to = 40 },
    { name = "Desolace", faction = 0, from = 30, to = 40 },
    { name = "Stranglethorn Vale", faction = 0, from = 30, to = 45 },
    { name = "Dustwallow Marsh", faction = 0, from = 35, to = 45 },
    { name = "Badlands", faction = 2, from = 35, to = 45 },
    { name = "Swamp of Sorrows", faction = 2, from = 35, to = 45 },
    { name = "Hinterlands", faction = 0, from = 40, to = 50 },
    { name = 'Tanaris', faction = 0, from = 40, to = 50 },
    { name = "Feralas", faction = 0, from = 42, to = 50 },
    { name = "Searing Gorge", faction = 0, from = 45, to = 50 },
    { name = "Azshara", faction = 0, from = 45, to = 55 },
    { name = "Blasted Lands", faction = 0, from = 45, to = 55 },
    { name = "Un'goro Crater", faction = 0, from = 48, to = 55 },
    { name = "Felwood", faction = 0, from = 48, to = 55 },
    { name = "Burning Steppes", faction = 0, from = 50, to = 58 },
    { name = "Western Plaguelands", faction = 0, from = 51, to = 58 },
    { name = "Scarlet Enclave", faction = 0, from = 55, to = 58 },
    { name = "Deadwind Pass", faction = 0, from = 55, to = 60 },
    { name = "Eastern Plaguelands", faction = 0, from = 53, to = 60 },
    { name = "Winterspring", faction = 0, from = 53, to = 60 },
    { name = "Moonglade", faction = 0, from = 55, to = 60 },
    { name = "Silithus", faction = 0, from = 55, to = 60 },
    { name = "Hellfire Peninsula", faction = 0, from = 58, to = 63 },
    { name = "Zangarmarsh", faction = 0, from = 60, to = 64 },
    { name = "Terokkar Forest", faction = 0, from = 62, to = 65 },
    { name = "Nagrand", faction = 0, from = 64, to = 67 },
    { name = "Blade's Edge Mountains", faction = 0, from = 65, to = 68 },
    { name = "Netherstorm", faction = 0, from = 67, to = 70 },
    { name = "Shadowmoon Valley", faction = 0, from = 67, to = 70 },
    { name = "Deadwind Pass", faction = 0, from = 68, to = 70 },
    { name = "Howling Fjord", faction = 0, from = 68, to = 72 },
    { name = "Borean Tundra", faction = 0, from = 68, to = 72 },
    { name = "Isle of Quel'Danas", faction = 0, from = 70, to = 73 },
    { name = "Dragonblight", faction = 0, from = 71, to = 75 },
    { name = "Grizzly Hills", faction = 0, from = 73, to = 75 },
    { name = "Zul'Drak", faction = 0, from = 74, to = 76 },
    { name = "Sholazar Basin", faction = 0, from = 76, to = 78 },
    { name = "Crystalsong Forest", faction = 0, from = 77, to = 80 },
    { name = "Hrothgar's Landing", faction = 0, from = 77, to = 80 },
    { name = "Icecrown", faction = 0, from = 77, to = 80 },
    { name = "Storm Peaks", faction = 0, from = 77, to = 80 },
    { name = "Wintergrasp", faction = 0, from = 77, to = 80 }
}

local function listItems (args, editbox)
    local customLevel = args and tonumber(args)

    if customLevel ~= nil and customLevel > 0 and customLevel <= 80 then
        print("Displaying regions for provided level " .. customLevel .. ", " .. factionGroup .. ":")
        for k, region in pairs(areas) do
            if customLevel >= region.from and customLevel <= region.to then
                if region.faction == 0 or faction == region.faction then
                    print("- " .. region.name.." ("..region.from.."-"..region.to..")")
                end
            end
        end
    
    else

        print("Displaying regions for level " .. level .. ", " .. factionGroup .. ":")
        for k, region in pairs(areas) do
            if level >= region.from and level <= region.to then
                if region.faction == 0 or faction == region.faction then
                    print("- " .. region.name.." ("..region.from.."-"..region.to..")")
                end
            end
        end

    end
    
end

SLASH_AREAS1 = "/areas";
SlashCmdList["AREAS"] = listItems;