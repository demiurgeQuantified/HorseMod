local HorseUtils = require("HorseMod/HorseUtils")

Events.OnCreateLivingCharacter.Add(function(character, desc)
    if character:isAnimal() and HorseUtils.isHorse(character --[[@as IsoAnimal]]) then
        ---@cast character IsoAnimal
        character:setVariable("isHorse", true)
    end
end)
