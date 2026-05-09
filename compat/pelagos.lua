if not mods["pelagos"] then return end

PlanetarisLib.add_tech_effect("planetaris-enemy-egg-productivity", {
        type = "change-recipe-productivity",
        recipe = "copper-biter-egg",
        change = 0.1
      })