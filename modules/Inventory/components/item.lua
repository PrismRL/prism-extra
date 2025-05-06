--- A simple tag component to let the pickup/drop actions know
--- this can be placed inside an inventory. This is where you would
--- add things like volume and weight.
--- @class ItemComponent : Component, IQueryable
local ItemComponent = prism.Component:extend( "ItemComponent" )
ItemComponent.name = "Item"

return ItemComponent
