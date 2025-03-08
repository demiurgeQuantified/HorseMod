local HorseUtils  = require("HorseMod/HorseUtils")
local HorseRiding = require("HorseMod/HorseRiding")

---@param player IsoPlayer
---@param context ISContextMenu
---@param animal IsoAnimal
local doHorseInteractionMenu = function(context, player, animal)
    if not HorseUtils.isHorse(animal) then
        return
    end
    if HorseRiding.isMountableHorse(animal) then
        -- FIXME: currently we set this variable here because animations are still in testing
        -- we should detect when a horse spawns and apply this immediately
        animal:setVariable("isHorse", true)
        context:addOption("IGUI_HorseMod_MountHorse",
                          player, HorseRiding.mountHorse, animal)
    end
end

---@type Callback_OnClickedAnimalForContext
local onClickedAnimalForContext = function(playerNum, context, animals, test)
    doHorseInteractionMenu(
        context,  getSpecificPlayer(playerNum), animals[1])
end

Events.OnClickedAnimalForContext.Add(onClickedAnimalForContext)
