Events.OnCreateLivingCharacter.Add(function(character, desc)
    if character:isAnimal() then
        ---@cast character IsoAnimal
        character:setVariable("isHorse", true)
    end
end)
