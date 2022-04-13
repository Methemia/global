function Player:sendBossWindow(bosseye)

-- Modal window design
	local window = ModalWindow {
		title = bosseye.mainTitle, -- Title of the modal window
		message = bosseye.mainMsg, -- The message to be displayed on the modal window
	}

	-- Add buttons to the window (Note: if you change the names of these you must change the functions in the modal window functionallity!)
	window:addButton("Cancel")

	-- Set what button is pressed when the player presses enter or escape
	window:setDefaultEscapeButton("Cancel")
	
	
	window:addChoice("-- Soul War Bosses --")

	if self:getStorageValue(Storage.Tibiana.GoshnarsHatred) > os.time() then
		window:addChoice("Goshnars Hatred [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.Tibiana.GoshnarsHatred)) .."]")
	else
		window:addChoice("Goshnars Hatred [OK]")
	end
	
	if self:getStorageValue(Storage.Tibiana.GoshnarsMalice) > os.time() then
		window:addChoice("Goshnars Malice [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.Tibiana.GoshnarsMalice)) .."]")
	else
		window:addChoice("Goshnars Malice [OK]")
	end
	
	if self:getStorageValue(Storage.Tibiana.GoshnarsSpice) > os.time() then
		window:addChoice("Goshnars Spite [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.Tibiana.GoshnarsSpice)) .."]")
	else
		window:addChoice("Goshnars Spite [OK]")
	end
	
	if self:getStorageValue(Storage.Tibiana.GoshnarsCruelty) > os.time() then
		window:addChoice("Goshnars Cruelty [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.Tibiana.GoshnarsCruelty)) .."]")
	else
		window:addChoice("Goshnars Cruelty [OK]")
	end
	
	if self:getStorageValue(Storage.Tibiana.GoshnarsGreed) > os.time() then
		window:addChoice("Goshnars Greed [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.Tibiana.GoshnarsGreed)) .."]")
	else
		window:addChoice("Goshnars Greed [OK]")
	end
	
	if self:getStorageValue(Storage.Tibiana.GoshnarsMegalomania) > os.time() then
		window:addChoice("Goshnars Megalomania [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.Tibiana.GoshnarsMegalomania)) .."]")
	else
		window:addChoice("Goshnars Megalomania [OK]")
	end
	
	
	window:addChoice("-----------------------")
	window:addChoice("-- Cobra Bastion --")
	
	if self:getStorageValue(Storage.GraveDanger.CobraBastion.ScarlettTimer) > os.time() then
		window:addChoice("Scarlett Etzel [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.GraveDanger.CobraBastion.ScarlettTimer)) .."]")
	else
		window:addChoice("Scarlett Etzel [OK]")
	end
	
	
	window:addChoice("-----------------------")
	window:addChoice("-- Kilmaresh --")
	
	if self:getStorageValue(Storage.Kilmaresh.UrmahlulluTimer) > os.time() then
		window:addChoice("Urmahlullu [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.Kilmaresh.UrmahlulluTimer)) .."]")
	else
		window:addChoice("Urmahlullu [OK]")
	end
	
	
	window:addChoice("-----------------------")
	window:addChoice("-- Falcons Bastion --")	
	
	if self:getStorageValue(Storage.TheSecretLibrary.TheOrderOfTheFalcon.OberonTimer) > os.time() then
		window:addChoice("Oberon [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.TheSecretLibrary.TheOrderOfTheFalcon.OberonTimer)) .."]")
	else
		window:addChoice("Oberon [OK]")
	end
	
	
	window:addChoice("-----------------------")
	window:addChoice("-- Lions Bastion --")
	
	if self:getStorageValue(Storage.TheOrderOfTheLion.Drume.Timer) > os.time() then
		window:addChoice("Drume [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.TheOrderOfTheLion.Drume.Timer)) .."]")
	else
		window:addChoice("Drume [OK]")
	end
	
	
	window:addChoice("-----------------------")
	window:addChoice("-- Warzone --")
	
	if self:getStorageValue(Storage.DangerousDepths.Bosses.TheBaronFromBelow) > os.time() then
		window:addChoice("The Baron From Below [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.DangerousDepths.Bosses.TheBaronFromBelow)) .."]")
	else
		window:addChoice("The Baron From Below [OK]")
	end
	
	if self:getStorageValue(Storage.DangerousDepths.Bosses.TheCountOfTheCore) > os.time() then
		window:addChoice("The Count Of The Core [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.DangerousDepths.Bosses.TheCountOfTheCore)) .."]")
	else
		window:addChoice("The Count Of The Core [OK]")
	end
	
	if self:getStorageValue(Storage.DangerousDepths.Bosses.TheDukeOfTheDepths) > os.time() then
		window:addChoice("The Duke Of The Depths [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.DangerousDepths.Bosses.TheDukeOfTheDepths)) .."]")
	else
		window:addChoice("The Duke Of The Depths [OK]")
	end
	
	if self:getStorageValue(Storage.BigfootBurden.BossWarzone1) > os.time() then
		window:addChoice("Deathstrike [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.BigfootBurden.BossWarzone1)) .."]")
	else
		window:addChoice("Deathstrike [OK]")
	end
	
	if self:getStorageValue(Storage.BigfootBurden.BossWarzone2) > os.time() then
		window:addChoice("Gnomevil [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.BigfootBurden.BossWarzone2)) .."]")
	else
		window:addChoice("Gnomevil [OK]")
	end
	
	
	window:addChoice("-----------------------")
	window:addChoice("-- Forgotten Knowledge --")
	
	if self:getStorageValue(Storage.ForgottenKnowledge.LadyTenebrisTimer) > os.time() then
		window:addChoice("Lady Tenebris [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.ForgottenKnowledge.LadyTenebrisTimer)) .."]")
	else
		window:addChoice("Lady Tenebris [OK]")
	end
	
	if self:getStorageValue(Storage.ForgottenKnowledge.LloydTimer) > os.time() then
		window:addChoice("Lloyd [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.ForgottenKnowledge.LloydTimer)) .."]")
	else
		window:addChoice("Lloyd [OK]")
	end
	
	if self:getStorageValue(Storage.ForgottenKnowledge.ThornKnightTimer) > os.time() then
		window:addChoice("Mounted Thorn Knight [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.ForgottenKnowledge.ThornKnightTimer)) .."]")
	else
		window:addChoice("Mounted Thorn Knight [OK]")
	end
	
	if self:getStorageValue(Storage.ForgottenKnowledge.DragonkingTimer) > os.time() then
		window:addChoice("Dragonking Zyrtarch [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.ForgottenKnowledge.DragonkingTimer)) .."]")
	else
		window:addChoice("Dragonking Zyrtarch [OK]")
	end
	
	if self:getStorageValue(Storage.ForgottenKnowledge.HorrorTimer) > os.time() then
		window:addChoice("Melting Frozen Horror [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.ForgottenKnowledge.HorrorTimer)) .."]")
	else
		window:addChoice("Melting Frozen Horror [OK]")
	end
	
	if self:getStorageValue(Storage.ForgottenKnowledge.TimeGuardianTimer) > os.time() then
		window:addChoice("The Time Guardian [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.ForgottenKnowledge.TimeGuardianTimer)) .."]")
	else
		window:addChoice("The Time Guardian [OK]")
	end
	
	if self:getStorageValue(Storage.ForgottenKnowledge.LastLoreTimer) > os.time() then
		window:addChoice("The Last Lore Keeper [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.ForgottenKnowledge.LastLoreTimer)) .."]")
	else
		window:addChoice("The Last Lore Keeper [OK]")
	end

	
	window:addChoice("-----------------------")
	window:addChoice("-- Bosses --")
	
	if self:getStorageValue(Storage.GraveDangerBosses.KingZelos.Timer) > os.time() then
		window:addChoice("King Zelos [" .. os.date('%d/%m/%Y - %H:%M:%S', self:getStorageValue(Storage.GraveDangerBosses.KingZelos.Timer)) .."]")
	else
		window:addChoice("King Zelos [OK]")
	end
	
	-- Send the window to player
	window:sendToPlayer(self)
end