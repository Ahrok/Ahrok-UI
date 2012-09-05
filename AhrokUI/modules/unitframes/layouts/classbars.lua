local T, C, L, G = unpack( Tukui )

---------------------------------------------------
-- The Deathknight Classbars --
---------------------------------------------------
if( T.myclass == "DEATHKNIGHT" ) then

	G.UnitFrames.Player.Runes:ClearAllPoints()
	G.UnitFrames.Player.Runes:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 5)
	G.UnitFrames.Player.Runes:Height(11)
	G.UnitFrames.Player.Runes:CreateBackdrop("Default")

	for i = 1, 6 do
		if( i == 1 ) then
			G.UnitFrames.Player.Runes[i]:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player.Runes, "TOPLEFT", 0, -11 )
			G.UnitFrames.Player.Runes[i]:Size( (G.UnitFrames.Player:GetWidth()-5)/6, 11 )
		elseif( i == 2 or i == 3 ) then
			G.UnitFrames.Player.Runes[i]:Size(  (G.UnitFrames.Player:GetWidth()-5)/6, 11 )
			G.UnitFrames.Player.Runes[i]:SetPoint( "BOTTOMLEFT", G.UnitFrames.Player.Runes, "TOPLEFT", 1, -11 )
		else
			G.UnitFrames.Player.Runes[i]:Point( "LEFT", G.UnitFrames.Player.Runes[i - 1], "RIGHT", 2, 0 )
			G.UnitFrames.Player.Runes[i]:Size(  (G.UnitFrames.Player:GetWidth()-5)/6, 11 )
		end
	end
end


---------------------------------------------------
-- The Druid Classbars --
---------------------------------------------------
if( T.myclass == "DRUID" ) then
			
		local SPELL_POWER_ECLIPSE = SPELL_POWER_ECLIPSE
		
		G.UnitFrames.Player.DruidManaBackground:Kill()
		G.UnitFrames.Player.EclipseBar:ClearAllPoints()
		G.UnitFrames.Player.EclipseBar:SetPoint("BOTTOM", TukuiWildMushroomBar, "TOP", 0, 7)
		G.UnitFrames.Player.EclipseBar:Height(11)
		G.UnitFrames.Player.EclipseBar:CreateBackdrop("Default")
		G.UnitFrames.Player.EclipseBar:SetFrameStrata("LOW")
		G.UnitFrames.Player.EclipseBar.LunarBar:SetSize( G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight() )
		G.UnitFrames.Player.EclipseBar.SolarBar:SetSize( G.UnitFrames.Player.EclipseBar:GetWidth(), G.UnitFrames.Player.EclipseBar:GetHeight() )
		G.UnitFrames.Player.EclipseBar.Text:ClearAllPoints()
		G.UnitFrames.Player.EclipseBar.Text:SetPoint( "TOP", G.UnitFrames.Player.EclipseBar, 0, 25 )
		G.UnitFrames.Player.EclipseBar.Text:SetFont(unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Player.EclipseBar.Text:SetShadowOffset( T.mult, -T.mult )
		
		TukuiWildMushroomBar:ClearAllPoints()
		TukuiWildMushroomBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
		TukuiWildMushroomBar:SetBackdrop(nil)
		TukuiWildMushroomBar:Size(250, 3)
	for i = 1, 3 do
		TukuiWildMushroomBar[i]:SetFrameLevel(8)
		TukuiWildMushroomBar[i]:CreateBackdrop("Default")
		if( i == 1 ) then
			TukuiWildMushroomBar[i]:Point("TOPLEFT", TukuiWildMushroomBar, "BOTTOMLEFT", 0, 3)
			TukuiWildMushroomBar[i]:Size(240/3, 3)
		else
			TukuiWildMushroomBar[i]:Point( "LEFT", TukuiWildMushroomBar[i - 1], "RIGHT", 5, 0 )
			TukuiWildMushroomBar[i]:Size(240/3, 3)
	end
end
	local DPowerStatus = CreateFrame("StatusBar", "DPowerStatus", G.UnitFrames.Player.EclipseBar)
	DPowerStatus:Point("TOPLEFT", G.UnitFrames.Player.EclipseBar, "TOPLEFT", 2, -2)
	DPowerStatus:Point("BOTTOMRIGHT", G.UnitFrames.Player.EclipseBar, "BOTTOMRIGHT", -2, 2)
		
	DPowerStatus.t = DPowerStatus:CreateFontString(nil, "OVERLAY")
	DPowerStatus.t:SetPoint("CENTER")
	DPowerStatus.t:SetFont(unpack(T.Fonts.dFont.setfont))
		
	local t = 0
	DPowerStatus:SetScript("OnUpdate", function(self, elapsed)
		t = t + elapsed;
		if (t > 0.07) then
			local power = UnitPower('player', SPELL_POWER_ECLIPSE)
			local maxPower = UnitPowerMax('player', SPELL_POWER_ECLIPSE)				
			DPowerStatus:SetMinMaxValues(-maxPower, maxPower)
			DPowerStatus:SetValue(power)
			DPowerStatus.t:SetText(power)
		end
	end)	
end

---------------------------------------------------
-- The Mage Classbars --
---------------------------------------------------

local T, C, L, G = unpack( Tukui )

if( T.myclass == "MAGE" ) then
		G.UnitFrames.Player.ArcaneChargeBar:ClearAllPoints()
		G.UnitFrames.Player.ArcaneChargeBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
		G.UnitFrames.Player.ArcaneChargeBar:Height(11)
		G.UnitFrames.Player.ArcaneChargeBar:CreateBackdrop("Default")

	for i = 1, 6 do
		if( i == 1 ) then
			G.UnitFrames.Player.ArcaneChargeBar[i]:SetPoint( "TOPLEFT", G.UnitFrames.Player.ArcaneChargeBar, "BOTTOMLEFT", 0, 11)
			G.UnitFrames.Player.ArcaneChargeBar[i]:Size( (G.UnitFrames.Player:GetWidth()-5)/6, 11 )
		elseif i == 5 then
			G.UnitFrames.Player.ArcaneChargeBar[i]:Point( "LEFT", G.UnitFrames.Player.ArcaneChargeBar[i - 1], "RIGHT", 2, 0 )
			G.UnitFrames.Player.ArcaneChargeBar[i]:Size( (G.UnitFrames.Player:GetWidth()-6)/6, 11 )
		else
			G.UnitFrames.Player.ArcaneChargeBar[i]:Point( "LEFT", G.UnitFrames.Player.ArcaneChargeBar[i - 1], "RIGHT", 1, 0 )
			G.UnitFrames.Player.ArcaneChargeBar[i]:Size( (G.UnitFrames.Player:GetWidth()-5)/6, 11 )
		end
	end
end

---------------------------------------------------
-- The Monk Classbars --
---------------------------------------------------

if T.myclass == "MONK" then
		G.UnitFrames.Player.HarmonyBar:ClearAllPoints()
		G.UnitFrames.Player.HarmonyBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
		G.UnitFrames.Player.HarmonyBar:Height(11)
		G.UnitFrames.Player.HarmonyBar:CreateBackdrop("Default")
		TukuiStatueBar:ClearAllPoints()
		TukuiStatueBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
		TukuiStatueBar:CreateBackdrop("Default")
		TukuiStatueBar:Size(233, 3)
	for i = 1, 5 do
		if i == 1 then
			G.UnitFrames.Player.HarmonyBar[i]:Point("TOPLEFT", G.UnitFrames.Player.HarmonyBar, "BOTTOMLEFT", 1, 11)
			G.UnitFrames.Player.HarmonyBar[i]:Size((G.UnitFrames.Player:GetWidth()-3)/4, 11 )
		else
			G.UnitFrames.Player.HarmonyBar[i]:Point("LEFT", G.UnitFrames.Player.HarmonyBar[i-1], "RIGHT", 1, 0)
			G.UnitFrames.Player.HarmonyBar[i]:Size( (G.UnitFrames.Player:GetWidth()-5)/4, 11 )
		end
	end
end
---------------------------------------------------
-- The Paladin Classbars --
---------------------------------------------------

if( T.myclass == "PALADIN" ) then
		G.UnitFrames.Player.HolyPower:ClearAllPoints()
		G.UnitFrames.Player.HolyPower:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
		G.UnitFrames.Player.HolyPower:Height(11)
		G.UnitFrames.Player.HolyPower:SetFrameStrata("LOW")
		G.UnitFrames.Player.HolyPower:CreateBackdrop("Default")
	for i = 1, 5  do
			G.UnitFrames.Player.HolyPower[i]:SetStatusBarColor( 228 / 255, 225 / 255, 16 / 255 )
		if i == 1 then
			G.UnitFrames.Player.HolyPower[i]:Point("TOPLEFT", G.UnitFrames.Player.HolyPower, "BOTTOMLEFT", 0, 11)
			G.UnitFrames.Player.HolyPower[i]:Size( (G.UnitFrames.Player:GetWidth()-6)/5, 11 )
		else
			G.UnitFrames.Player.HolyPower[i]:Point("LEFT", G.UnitFrames.Player.HolyPower[i-1], "RIGHT", 1, 0)
			G.UnitFrames.Player.HolyPower[i]:Size( (G.UnitFrames.Player:GetWidth()-5)/5, 11 )
		end
	end	
end

---------------------------------------------------
-- The Priest Classbars --
---------------------------------------------------
if( T.myclass == "PRIEST" ) then
	G.UnitFrames.Player.ShadowOrbsBar:ClearAllPoints()
	G.UnitFrames.Player.ShadowOrbsBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
	G.UnitFrames.Player.ShadowOrbsBar:Height(11)
	G.UnitFrames.Player.ShadowOrbsBar:SetFrameStrata("LOW")
	G.UnitFrames.Player.ShadowOrbsBar:CreateBackdrop("Default")
	TukuiStatueBar:ClearAllPoints()
	TukuiStatueBar:SetPoint("BOTTOM", G.UnitFrames.Player.ShadowOrbsBar, "TOP", 0, 7)
	TukuiStatueBar:CreateBackdrop("Default")
	TukuiStatueBar:Size(250, 3)
	for i = 1, 3  do
		if i == 1 then
			G.UnitFrames.Player.ShadowOrbsBar[i]:SetPoint( "TOPLEFT", G.UnitFrames.Player.ShadowOrbsBar, "TOPLEFT", 0, 0 )
			G.UnitFrames.Player.ShadowOrbsBar[i]:Size(250/3, 11)
		else
			G.UnitFrames.Player.ShadowOrbsBar[i]:Point("LEFT", G.UnitFrames.Player.ShadowOrbsBar[i-1], "RIGHT", 3, 0)
			G.UnitFrames.Player.ShadowOrbsBar[i]:Size(250/3, 11)
		end
	end
end

---------------------------------------------------
-- The Rogue Classbars / combo bar--
---------------------------------------------------

if( T.myclass == "ROGUE") then
	if( C["unitframes"].classiccombo == true and unit == "target") then
		G.UnitFrames.Player.ComboPointsBar:Kill()
		G.UnitFrames.Player.CPoints:ClearAllPoints()
		for i = 1, 5 do
			if i == 1 then
				G.UnitFrames.Player.CPoints[i]:SetPoint("TOPLEFT", G.UnitFrames.Target, -15, 20.5)
			else
				G.UnitFrames.Player.CPoints[i]:Point("TOP", G.UnitFrames.Player.CPoints[i-1], "BOTTOM", 1)
			end
		end
	else
		G.UnitFrames.Player.ComboPointsBar:ClearAllPoints()
		G.UnitFrames.Player.ComboPointsBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
		G.UnitFrames.Player.ComboPointsBar:Size( 250, 11)
		G.UnitFrames.Player.ComboPointsBar:SetFrameStrata("LOW")
		G.UnitFrames.Player.ComboPointsBar:CreateBackdrop("Default")
		for i = 1, 5  do
			
			if i == 1 then
				G.UnitFrames.Player.ComboPointsBar[i]:Point("TOPLEFT", G.UnitFrames.Player.ComboPointsBar, "BOTTOMLEFT", 1, 11)
				G.UnitFrames.Player.ComboPointsBar[i]:Size(240/5, 11)
			else
				G.UnitFrames.Player.ComboPointsBar[i]:Point("LEFT", G.UnitFrames.Player.ComboPointsBar[i-1], "RIGHT", 3, 0)
				G.UnitFrames.Player.ComboPointsBar[i]:Size(240/5, 11)
			end
		end		
	end
end
---------------------------------------------------
-- The Shaman Classbars --
---------------------------------------------------

if( T.myclass == "SHAMAN" ) then
	local totembg = CreateFrame("Frame", "totembg", UIParent)
	totembg:Size(250, 11)
	totembg:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
	totembg:SetTemplate("Default")
	totembg:CreateBackdrop("Default")
	
	for i = 1, 4  do
		if i == 1 then
			G.UnitFrames.Player.TotemBar[i]:ClearAllPoints()
			G.UnitFrames.Player.TotemBar[i]:SetPoint( "TOPLEFT", totembg, "TOPLEFT", 0, 0)
			G.UnitFrames.Player.TotemBar[i]:Size(240/4, 11)
		else
			G.UnitFrames.Player.TotemBar[i]:ClearAllPoints()
			G.UnitFrames.Player.TotemBar[i]:Point("LEFT", G.UnitFrames.Player.TotemBar[i-1], "RIGHT", 3, 0)
			G.UnitFrames.Player.TotemBar[i]:Size(240/4, 11)
		end
	end
end

---------------------------------------------------
-- The Warlock Classbars --
---------------------------------------------------
	
if( T.myclass == "WARLOCK" ) then

	G.UnitFrames.Player.WarlockSpecBars:ClearAllPoints()
	G.UnitFrames.Player.WarlockSpecBars:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
	G.UnitFrames.Player.WarlockSpecBars:Size( 250, 11)
	G.UnitFrames.Player.WarlockSpecBars:SetFrameStrata("LOW")
	G.UnitFrames.Player.WarlockSpecBars:CreateBackdrop("Default")
	for i = 1, 4  do
		
		if i == 1 then
			G.UnitFrames.Player.WarlockSpecBars[i]:Point("TOPLEFT", G.UnitFrames.Player.WarlockSpecBars, "BOTTOMLEFT", 0, 11)
			G.UnitFrames.Player.WarlockSpecBars[i]:Size(250/4, 11)
		else
			G.UnitFrames.Player.WarlockSpecBars[i]:Point("LEFT", G.UnitFrames.Player.WarlockSpecBars[i-1], "RIGHT", 3, 0)
			G.UnitFrames.Player.WarlockSpecBars[i]:Size(250/4, 11)
		end
	end	

	local wlPowerStatus = CreateFrame("StatusBar", "wlPowerStatus", G.UnitFrames.Player.WarlockSpecBars)
	wlPowerStatus:Point("TOPLEFT", G.UnitFrames.Player.WarlockSpecBars, "TOPLEFT", 2, -2)
	wlPowerStatus:Point("BOTTOMRIGHT", G.UnitFrames.Player.WarlockSpecBars, "BOTTOMRIGHT", -2, 2)
	wlPowerStatus.t = wlPowerStatus:CreateFontString(nil, "OVERLAY")
	wlPowerStatus.t:SetPoint("CENTER")
	wlPowerStatus.t:SetFont(unpack(T.Fonts.dFont.setfont))
		
	local function showpower()
		local spec = GetSpecialization()
		local SPEC_WARLOCK_DEMONOLOGY = SPEC_WARLOCK_DEMONOLOGY
		local SPEC_WARLOCK_DESTRUCTION = SPEC_WARLOCK_DESTRUCTION
		local SPEC_WARLOCK_AFFLICTION = SPEC_WARLOCK_AFFLICTION
			
		if spec == SPEC_WARLOCK_DEMONOLOGY then
			local SPELL_POWER_DEMONIC_FURY = SPELL_POWER_DEMONIC_FURY
			local power = UnitPower("player", SPELL_POWER_DEMONIC_FURY)
			local maxPower = UnitPowerMax("player", SPELL_POWER_DEMONIC_FURY)
			wlPowerStatus:SetMinMaxValues(0, maxPower)
			wlPowerStatus:SetValue(power)
			wlPowerStatus.t:SetText(power)
		elseif spec == SPEC_WARLOCK_DESTRUCTION then
			local maxPower = UnitPowerMax("player", SPELL_POWER_BURNING_EMBERS, true)
			local power = UnitPower("player", SPELL_POWER_BURNING_EMBERS, true)
			local numBars = floor(maxPower / MAX_POWER_PER_EMBER)
			for i = 1, numBars do
				wlPowerStatus:SetMinMaxValues((MAX_POWER_PER_EMBER * i) - MAX_POWER_PER_EMBER, MAX_POWER_PER_EMBER * i)
				wlPowerStatus:SetValue(power)
			end
			wlPowerStatus.t:SetText(power)
		elseif spec == SPEC_WARLOCK_AFFLICTION then
				wlPowerStatus.t:SetText(power)
		end
	end
		
	local function createBars()
		wlPowerStatus:RegisterEvent('UNIT_POWER')
		wlPowerStatus:RegisterEvent("PLAYER_TALENT_UPDATE")
		wlPowerStatus:SetScript("OnEvent", showpower)
		showpower()
	end
	wlPowerStatus:RegisterEvent("PLAYER_ENTERING_WORLD")
	wlPowerStatus:SetScript("OnEvent",function(self,event)
		if event == "PLAYER_ENTERING_WORLD" then
			createBars()
			showpower()
		end
	end)
end

---------------------------------------------------
-- The Warlock Classbars --
---------------------------------------------------

if T.myclass == "WARRIOR" then
	TukuiStatueBar:ClearAllPoints()
	TukuiStatueBar:SetPoint("BOTTOM", G.UnitFrames.Player, "TOP", 0, 7)
	TukuiStatueBar:CreateBackdrop("Default")
	TukuiStatueBar:Size(250, 3)
end