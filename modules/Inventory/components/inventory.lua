--- @class InventoryComponent : Component, IQueryable
local InventoryComponent = prism.Component:extend( "InventoryComponent" )
InventoryComponent.name = "Inventory"

function InventoryComponent:__new()
   self.inventory = prism.ActorStorage()
end

-- A few utility functions so we have less indirection, add/remove should
-- only be called INSIDE AN ACTION!

function InventoryComponent:query(...)
   return self.inventory:query(...)
end

function InventoryComponent:hasItem(actor)
   return self.inventory:hasActor(actor)
end

function InventoryComponent:addItem(actor)
   assert(actor:hasComponent(prism.components.Item))
   self.inventory:addActor(actor)
end

function InventoryComponent:removeItem(actor)
   self.inventory:removeActor(actor)
end

return InventoryComponent
