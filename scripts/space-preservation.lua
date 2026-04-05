local preservation_tech = {}

local preservation_data = require("__planetaris-tellus__/lib")
local config = preservation_data.config
local blacklist_array = preservation_data.blacklist

local SPOILAGE_BLACKLIST = {}

local function rebuild_blacklist()
  SPOILAGE_BLACKLIST = {}
  for _, item_name in pairs(blacklist_array) do
    SPOILAGE_BLACKLIST[item_name] = true
  end
end

local space_spoilage_data = {
  enabled = false,
  multiplier = 1.0,
  current_tier = 0
}


-- HELPERS

local function set_preservation_active(active)
  if active then
    script.on_nth_tick(60, preservation_tech.process_preservation)
  else
    script.on_nth_tick(60, nil)
  end
end


-- LIFECYCLE

function preservation_tech.on_init()
  storage.space_spoilage_data = storage.space_spoilage_data or space_spoilage_data
  rebuild_blacklist()
  set_preservation_active(storage.space_spoilage_data.enabled)
end

function preservation_tech.on_configuration_changed()
  storage.space_spoilage_data = storage.space_spoilage_data or space_spoilage_data

  rebuild_blacklist()

  for _, force in pairs(game.forces) do
    local best_tier = 0
    for tier, _ in pairs(config) do
      local tech = force.technologies["planetaris-space-preservation-" .. tier]
      if tech and tech.researched then
        best_tier = math.max(best_tier, tier)
      end
    end
    if best_tier > 0 then
      storage.space_spoilage_data.enabled      = true
      storage.space_spoilage_data.multiplier   = config[best_tier].multiplier
      storage.space_spoilage_data.current_tier = best_tier
    end
  end

  space_spoilage_data = storage.space_spoilage_data
  set_preservation_active(space_spoilage_data.enabled)
end

function preservation_tech.on_research_finished(event)
  local tech_name = event.research.name
  for tier, values in pairs(config) do
    if tech_name == "planetaris-space-preservation-" .. tier then
      if tier > (storage.space_spoilage_data.current_tier or 0) then
        storage.space_spoilage_data.enabled      = true
        storage.space_spoilage_data.multiplier   = values.multiplier
        storage.space_spoilage_data.current_tier = tier
        game.print("Space preservation technology researched! Materials spoil " .. values.new .. "% slower in space.")
        set_preservation_active(true)
      end
      break
    end
  end
  space_spoilage_data = storage.space_spoilage_data
end


-- MAIN LOOP

function preservation_tech.process_preservation()
  space_spoilage_data = storage.space_spoilage_data
  if not space_spoilage_data.enabled then return end
  if space_spoilage_data.multiplier >= 1 then return end

  local ticks_to_restore = math.floor(60 * (1 - space_spoilage_data.multiplier))
  local chest_slot       = defines.inventory.chest
  local blacklist        = SPOILAGE_BLACKLIST

  for _, force in pairs(game.forces) do
    for _, platform in pairs(force.platforms) do
      local hub = platform.hub
      if hub and hub.valid then
        local inv = hub.get_inventory(chest_slot)
        if inv and not inv.is_empty() then
          for slot = 1, #inv do
            local stack = inv[slot]
            if stack.valid_for_read and stack.spoil_tick and not blacklist[stack.name] then
              pcall(function() stack.spoil_tick = stack.spoil_tick + ticks_to_restore end)
            end
          end
        end
      end
    end
  end
end

return preservation_tech