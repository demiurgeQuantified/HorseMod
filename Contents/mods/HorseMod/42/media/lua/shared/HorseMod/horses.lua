local HorseUtils = require("HorseMod/HorseUtils")

-- we wait a tick to process animals because their type isn't set when the event triggers

---@type IsoAnimal[]
local animalsToProcess = table.newarray()

Events.OnCreateLivingCharacter.Add(function(character, desc)
    if character:isAnimal() then
        table.insert(animalsToProcess, character)
        ---@cast character IsoAnimal
    end
end)

Events.OnTick.Add(function()
    for i = #animalsToProcess, 1, -1  do
        local animal = animalsToProcess[i]
        if HorseUtils.isHorse(animal) then
            animal:setVariable("isHorse", true)
            animal:setVariable("geneSpeed", animal:getUsedGene("speed"):getCurrentValue())
        end
        animalsToProcess[i] = nil
    end
end)
