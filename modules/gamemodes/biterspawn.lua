local Event = require("utils.event")
local config = require("config.gamemodes.biterspawn")

Event.add(defines.events.on_chunk_generated, function (event)
  local surface = event.surface
  local left_top = event.area.left_top

  for y_offset = 1, 32 do
    if y_offset % config.divider == 0 then
      for x_offset = 1, 32 do
        if x_offset % config.divider == 0 then
          local x = left_top.x + x_offset
          local y = left_top.y + y_offset
          if surface.can_place_entity{
            name=config.biter_name,
            position={x, y}
          } then
            surface.create_entity{
              name=config.biter_name,
              position={x, y}
            }
          end
        end
      end
    end
  end
end)