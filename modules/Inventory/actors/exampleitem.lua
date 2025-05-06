--- @class CheeseActor : Actor
local Cheese = prism.Actor:extend("CheeseActor")
Cheese.name = "Cheese"

function Cheese:initialize()
   return {
      prism.components.Drawable(string.byte(";") + 1, prism.Color4.WHITE),
      prism.components.Item()
   }
end

return Cheese
