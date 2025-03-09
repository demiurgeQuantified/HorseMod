local HORSE_TYPES = {
    ["stallion"] = true,
    ["mare"] = true,
    ["filly"] = true
}

local HorseUtils = {}

---Checks whether an animal is a horse.
---@param animal IsoAnimal The animal to check.
---@return boolean isHorse Whether the animal is a horse.
HorseUtils.isHorse = function(animal)
    return HORSE_TYPES[animal:getAnimalType()]
end

return HorseUtils