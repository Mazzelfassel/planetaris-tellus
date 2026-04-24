local function add_preserving_subgroup(subgroup)
    if data.raw["item-subgroup"][subgroup] then
        table.insert(spoilable_subgroups, subgroup)
    end
end

local function add_preserving_item(item)
    if data.raw.item[item] or data.raw.capsule[item] or data.raw.tool[item] then
        table.insert(preservation_whitelist, item)
    end
end

local function blacklist_preserving_item(item)
        table.insert(preservation_blacklist, item)
end


if mods["lignumis"] then
    add_preserving_subgroup("lignumis-bioprocessing")
end

if mods["maraxsis"] then
    add_preserving_subgroup("maraxsis-intermediants")
    add_preserving_subgroup("salt")
end

if mods["pelagos"] then
    add_preserving_subgroup("raw-material")
end

if mods["Moshine"] then
    blacklist_preserving_item("3d-data-storage")
end

if mods["rubia"] then
    blacklist_preserving_item("yeet-agricultural-science-pack")
    blacklist_preserving_item("yeet-ai-tier-10")
    blacklist_preserving_item("yeet-biorecycling-science-pack")
    blacklist_preserving_item("yeet-carbon-fiber")
    blacklist_preserving_item("yeet-cryogenic-science-pack")
    blacklist_preserving_item("yeet-dream-concentrate-barrel")
    blacklist_preserving_item("yeet-electric-coil")
    blacklist_preserving_item("yeet-electrochemical-science-pack")
    blacklist_preserving_item("yeet-electromagnetic-science-pack")
    blacklist_preserving_item("yeet-ghetto-biorecycling-science-pack")
    blacklist_preserving_item("yeet-gun-turret")
    blacklist_preserving_item("yeet-liquid-tiberium-barrel")
    blacklist_preserving_item("yeet-lubricant-barrel")
    blacklist_preserving_item("yeet-maraxsis-glass-panes")
    blacklist_preserving_item("yeet-metallurgic-science-pack")
    blacklist_preserving_item("yeet-plutonium-239")
    blacklist_preserving_item("yeet-rabbasca-energetic-concrete")
    blacklist_preserving_item("yeet-raw-fish")
    blacklist_preserving_item("yeet-rubia-biofusion-science-pack")
    blacklist_preserving_item("yeet-spoilage")
    blacklist_preserving_item("yeet-steam-recycler")
    blacklist_preserving_item("yeet-wood")
end

if mods["foliax"] then
    add_preserving_subgroup("foliax-arcane")
    add_preserving_subgroup("foliax-bauxite")
    add_preserving_subgroup("foliax-iron")
    add_preserving_subgroup("foliax-copper")
    add_preserving_subgroup("foliax-zinc")
    add_preserving_subgroup("foliax-brass")
    add_preserving_subgroup("foliax-tin")
    add_preserving_subgroup("foliax-lead")
    add_preserving_subgroup("foliax-bitumen")
    add_preserving_subgroup("foliax-uranium")
    add_preserving_subgroup("foliax-tungsten")
    add_preserving_subgroup("foliax-obsidian")
    add_preserving_subgroup("foliax-holmium")
    add_preserving_subgroup("foliax-lithium")
    add_preserving_subgroup("foliax-fluorite")
    add_preserving_subgroup("foliax-scrap")
    add_preserving_subgroup("foliax-calcite")
    add_preserving_subgroup("foliax-fruit")
    add_preserving_subgroup("foliax-promethium")
    add_preserving_subgroup("mixed-drinks")
    add_preserving_subgroup("foliax-equipment")
    add_preserving_subgroup("foliax-space")
    add_preserving_subgroup("foliax-plates")
    add_preserving_subgroup("foliax-modules")
    add_preserving_subgroup("foliax-research")
    add_preserving_subgroup("foliax-seeds")
    add_preserving_subgroup("foliax-plants")
    add_preserving_subgroup("foliax-trees")
    add_preserving_subgroup("foliax-tiles")
end

