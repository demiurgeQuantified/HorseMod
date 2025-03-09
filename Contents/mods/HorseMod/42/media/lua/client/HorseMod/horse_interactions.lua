local HorseUtils  = require("HorseMod/HorseUtils")

---@param player IsoPlayer
---@param context ISContextMenu
---@param animal IsoAnimal
local doHorseInteractionMenu = function(context, player, animal)
    if not HorseUtils.isHorse(animal) then
        return
    end

    -- FIXME: currently we set this variable here because animations are still in testing
    -- we should detect when a horse spawns and apply this immediately
    animal:setVariable("isHorse", true)
end

---@type Callback_OnClickedAnimalForContext
local onClickedAnimalForContext = function(playerNum, context, animals, test)
    doHorseInteractionMenu(
        context,  getSpecificPlayer(playerNum), animals[1])
end

Events.OnClickedAnimalForContext.Add(onClickedAnimalForContext)

local old_AnimalsInteraction = ContextualActionHandlers.AnimalsInteraction

---@param action string
---@param player IsoPlayer
---@param animal IsoAnimal
---@param ... any
---@diagnostic disable-next-line: duplicate-set-field
ContextualActionHandlers.AnimalsInteraction = function(action, player, animal, ...)
    if not HorseRiding.isMountableHorse(animal) then
        old_AnimalsInteraction(action, player, animal, ...)
        return
    end

    if not luautils.walkAdj(player, animal:getSquare()) then
        return
    end

    HorseRiding.mountHorse(player, animal)
end
