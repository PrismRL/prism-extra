local PickupTarget = prism.Target:extend("PickupTarget")

--- @param owner Actor
--- @param targetObject any
function PickupTarget:validate(owner, targetObject)
   return 
      targetObject:is(prism.Actor) and
      targetObject:hasComponent(prism.components.Item) and
      owner:getRange(targetObject) == 0 and
      not owner:expectComponent(prism.components.Inventory):hasItem(targetObject)
end

---@class PickupAction : Action
---@field name string
---@field targets Target[]
local Pickup = prism.Action:extend("PickupAction")
Pickup.name = "pickup"
Pickup.targets = { PickupTarget }
Pickup.requiredComponents = {
   prism.components.Controller,
   prism.components.Inventory,
}

function Pickup:_canPerform(level, item)
   return true
end

function Pickup:_perform(level, item)
   local inventory = self.owner:expectComponent(prism.components.Inventory)
   level:removeActor(item)
   inventory:addItem(item)
end

return Pickup