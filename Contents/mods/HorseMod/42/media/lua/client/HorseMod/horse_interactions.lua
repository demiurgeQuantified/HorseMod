local HorseUtils  = require("HorseMod/HorseUtils")

---@param player IsoPlayer
---@param context ISContextMenu
---@param animal IsoAnimal
local doHorseInteractionMenu = function(context, player, animal)
    if not HorseUtils.isHorse(animal) then
        return
    end
end

---@type Callback_OnClickedAnimalForContext
local onClickedAnimalForContext = function(playerNum, context, animals, test)
    doHorseInteractionMenu(
        context,  getSpecificPlayer(playerNum), animals[1])
end

Events.OnClickedAnimalForContext.Add(onClickedAnimalForContext)
