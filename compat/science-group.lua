if not mods["science-tab"] then return end

if not data.raw["item-subgroup"]["science-tab-planetaris-science-pack"] then
    data:extend {
        {
            type = "item-subgroup",
            name = "science-tab-planetaris-science-pack",
            group = "science",
            order = "p[planetaris-science-pack]"
        }
    }
end

data.raw.tool["planetaris-bioengineering-science-pack"].subgroup = "science-tab-planetaris-science-pack"
data.raw.tool["planetaris-bioengineering-science-pack"].order = "c[tellus]-a"

data.raw.tool["planetaris-pathological-science-pack"].subgroup = "science-tab-planetaris-science-pack"
data.raw.tool["planetaris-pathological-science-pack"].order = "c[tellus]-b"

if mods["Krastorio2-spaced-out"] then
    if data.raw["item-group"]["science"] then
            data.raw.item["kr-bioengineering-research-data"].subgroup = "krastorio-research-data"
            data.raw.item["kr-pathological-research-data"].subgroup = "krastorio-research-data"
    end
end