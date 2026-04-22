require ("__base__/prototypes/entity/pipecovers")
require ("__planetaris-tellus__/prototypes/entity/planetaris-cover-pictures")

local simulations = require("__base__/prototypes/factoriopedia-simulations")
local sounds = require("__base__/prototypes/entity/sounds")
local hit_effects = require("__base__/prototypes/entity/hit-effects")

data.extend({
  {
    type = "furnace",
    name = "planetaris-preservation-unit",
    icon = "__planetaris-tellus__/graphics/icons/preservation-unit.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-repairable", "breaths-air"},
    subgroup = "tellus-production",
    order = "c-a",
    minable = {mining_time = 0.2, result = "planetaris-preservation-unit", count = 1},
    placeable_by = {item = "planetaris-preservation-unit", count = 1},
    cant_insert_at_source_message_key = "preservation-name.cant-be-preserved",
    custom_input_slot_tooltip_key  = "preservation-name.spoilable-items",
    result_inventory_size = 1,
    source_inventory_size = 1,
    max_health = 500,
    icon_draw_specification = {scale = 1, shift = {0, -0.3}},
    resistances =
    {
      {
        type = "fire",
        percent = 50
      },
      {
        type = "impact",
        percent = 20
      },
    },
    surface_conditions =
    {
      {
        property = "gravity",
        max = 0,
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    --damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "preservation-unit",
    dying_explosion = "planetaris-bioassembler-explosion",
    next_upgrade = nil,
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__planetaris-tellus__/graphics/entity/preservation-unit/preservation-unit.png",
            priority="high",
            width = 210,
            height = 260,
            line_length = 8,
            frame_count = 64,
            animation_speed = 1,
            shift = util.by_pixel(0, -16),
            scale = 0.5
          },
          {
            filename = "__planetaris-tellus__/graphics/entity/preservation-unit/preservation-unit-shadow.png",
            priority="high",
            width = 280,
            height = 136,
            repeat_count = 64,
            draw_as_shadow = true,
            shift = util.by_pixel(10, 0),
            scale = 0.5
          }
        }
      },
      working_visualisations = {
        {
        fadeout = true,
        animation =
                {
                    filename = "__planetaris-tellus__/graphics/entity/preservation-unit/preservation-unit-light.png",
                    priority = "high",
                    width = 210,
                    height = 260,
                    line_length = 8,
                    frame_count = 64,
                    animation_speed = 1,
                    shift = util.by_pixel(0, -16),
                    scale = 0.5
                  }
        },
      }
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__planetaris-tellus__/graphics/entity/bioassembler/bioassembler-reflection.png",
        priority="high",
        width = 296,
        height = 296,
        shift = util.by_pixel(0, 15),
        variation_count = 1,
        scale = 0.5
      },
      rotate = false,
      orientation_to_variation = false
    },
    crafting_categories = {"preserving"},
    crafting_speed = 1,
    energy_source = {
			type = "fluid",
			burns_fluid = true,
			scale_fluid_usage = true,
			light_flicker = {
				color = { 0, 0, 1, 1 },
			},
			fluid_box = {
				pipe_picture = planetaris_preserver_cover_pictures(),
				always_draw_covers = true,
				volume = 20,
                filter = "thruster-oxidizer",
				pipe_connections = {
					{ direction = defines.direction.west, position = { -1, 0 }},
					{ direction = defines.direction.east, position = { 1, 0 }},
				},
				production_type = "input-output",
			},
    },
    energy_usage = "500kW",
    module_slots = 3,
    allowed_effects = {"speed", "consumption", "pollution"},
    impact_category = "metal",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/biochamber/biochamber-loop.ogg", volume = 0.4},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
  },
})