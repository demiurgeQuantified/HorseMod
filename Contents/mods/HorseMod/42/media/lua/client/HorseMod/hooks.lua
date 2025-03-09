local HorseUtils = require("HorseMod/HorseUtils")

-- Hook ISAnimalUI to setup our animation when it's a horse

local old_create = ISAnimalUI.create

---@diagnostic disable-next-line: duplicate-set-field
ISAnimalUI.create = function(self)
    old_create(self)
    if HorseUtils.isHorse(self.animal) then
        self.avatarPanel:setVariable("isHorse", true)
    end
end

-- FIXME: hook ISAnimalUI to fix too long names (American Quarter Stallion) partially covering the Rename button
