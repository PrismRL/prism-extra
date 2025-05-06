local DropTarget = prism.Target:extend("DropTarget")

--- @param owner Actor
--- @param targetObject any
function DropTarget:validate(owner, targetObject)
   return 
      targetObject:is(prism.Actor) and
      targetObject:hasComponent(prism.components.Item) and
      owner:expectComponent(prism.components.Inventory):hasItem(targetObject)
end

---@class DropAction : Action
---@field name string
---@field targets Target[]
local Drop = prism.Action:extend("DropAction")
Drop.name = "drop"
Drop.targets = { DropTarget }
Drop.requiredComponents = {
   prism.components.Controller,
   prism.components.Inventory,
}

function Drop:_canPerform(level, item)
   return true
end

function Drop:_perform(level, item)
   local inventory = self.owner:expectComponent(prism.components.Inventory)
   inventory:removeItem(item)
   
   -- it's safe to change the position of an actor outside of a level!
   --- @diagnostic disable-next-line
   item.position = self.owner:getPosition()

   level:addActor(item)
end

return Drop