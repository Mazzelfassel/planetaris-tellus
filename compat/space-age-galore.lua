if mods["space_age_galore"] then 
  

  if data.raw.recipe["vgal-nutrients-biter-egg"] then
    PlanetarisLib.add_tech_effect("planetaris-enemy-egg-productivity", {
            type = "change-recipe-productivity",
            recipe = "vgal-nutrients-biter-egg",
            change = 0.1
          })
  end

  if data.raw.recipe["vgal-nutrients-biter-egg"] then
    PlanetarisLib.add_tech_effect("planetaris-enemy-egg-productivity", {
            type = "change-recipe-productivity",
            recipe = "vgal-petroleum-gas-barrel-biter-egg",
            change = 0.1
          })
    end
    
end