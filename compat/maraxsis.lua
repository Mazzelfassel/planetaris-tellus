if not mods["maraxsis"] then return end

if mods["Better-Planets"] or mods["AsteroidBelt"] then return end

local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

if settings.startup["adjust-maraxsis"].value == true then
    -- remove space connections
    if data.raw["space-connection"]["vulcanus-maraxsis"] then
        data.raw["space-connection"]["vulcanus-maraxsis"] = nil
    end

    if data.raw["space-connection"]["fulgora-maraxsis"] and data.raw["planet"]["hyarion"] then
        data.raw["space-connection"]["fulgora-maraxsis"] = nil
    end

    if data.raw["space-connection"]["maraxsis-arig"] and data.raw["planet"]["arig"] then
        data.raw["space-connection"]["maraxsis-arig"] = nil
    end

    if data.raw["space-connection"]["maraxsis-hyarion"] and data.raw["planet"]["hyarion"] then
        data.raw["space-connection"]["maraxsis-hyarion"].length = 30000
    end

    if data.raw["planet"]["maraxsis"] then
        data.raw["planet"]["maraxsis"].orientation = 0.6
    end

end

    data:extend({
        {
            type = "space-connection",
            name = "maraxsis-tellus",
            subgroup = "planet-connections",
            from = "maraxsis",
            to = "tellus", 
            length = 15000,
            icon_size = 64,
            order = "d-b",
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
        }
    })