local HorseRiding = {}

--FIXME: remove this pairing if the grapple ends early for some reason
---@type {IsoPlayer: IsoAnimal}
HorseRiding.playerMounts = {}

---@param animal IsoAnimal
---@return boolean
---@nodiscard
HorseRiding.isMountableHorse = function(animal)
    local animalType = animal:getAnimalType()
    if animalType ~= "stallion" and animalType ~= "mare" then
        return false
    end

    return true
end

---@param player IsoPlayer
---@param horse IsoAnimal
---@return boolean
---@nodiscard
HorseRiding.canMountHorse = function(player, horse)
    return true
end

---@param player IsoPlayer
---@param horse IsoAnimal
HorseRiding.mountHorse = function(player, horse)
    -- TODO: not sure the setDoGrapple calls are necessary
    player:setDoGrapple(true)
    horse:Grappled(player, player:getAttackingWeapon(), 1, "MountHorse")
    player:setDoGrapple(false)
    player:setVariable("mounted", true)
end

---@param player IsoPlayer
HorseRiding.dismountHorse = function(player)
    if HorseRiding.playerMounts[player] then
        player:LetGoOfGrappled("Dismount")
        HorseRiding.playerMounts[player] = nil
        player:setVariable("mounted", false)
    end
end

Events.OnContextKey.Add(HorseRiding.dismountHorse)

return HorseRiding