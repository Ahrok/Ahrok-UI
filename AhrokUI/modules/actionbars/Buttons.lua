local T, C, L, G= unpack( Tukui ) -- Import: T - functions, constants, variables; C - config; L - locales
-- This is the file for our action bars settings in game via mouseover buttons around action bars.

TukuiBar2Button:Kill()
TukuiBar3Button:Kill()
TukuiBar4Button:Kill()
TukuiBar5ButtonTop:Kill()
TukuiBar5ButtonBottom:Kill()

local function ShowOrHideBar(bar, button)
	local db = TukuiDataPerChar
	
	if bar:IsShown() then
		if bar == TukuiBar5 and T.lowversion then
			if button == TukuiBar5ButtonTop then
				if TukuiBar7:IsShown() then
					UnregisterStateDriver(TukuiBar7, "visibility")
					TukuiBar7:Hide()
					db.hidebar7 = true
				elseif TukuiBar6:IsShown() then
					UnregisterStateDriver(TukuiBar6, "visibility")
					TukuiBar6:Hide()
					db.hidebar6 = true
				else
					UnregisterStateDriver(bar, "visibility")
					bar:Hide()
				end
			end
		else
			UnregisterStateDriver(bar, "visibility")
			bar:Hide()
		end
		
		if bar == TukuiBar2 then
			TukuiBar1:SetHeight((T.buttonsize * 1) + (T.buttonspacing * 2))
			TukuiPetBar:Point("TOP", TukuiBar1, "TOP", 0, 30)
		end
	else
		if bar == TukuiBar5 and T.lowversion then
			if TukuiBar7:IsShown() then
				RegisterStateDriver(TukuiBar7, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
				TukuiBar7:Show()
			elseif TukuiBar6:IsShown() then
				RegisterStateDriver(TukuiBar6, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
				TukuiBar6:Show()
			else
				RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
				bar:Show()
			end
		else
			RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")
			bar:Show()
		end
		
		if bar == TukuiBar2 then
			TukuiBar1:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
			TukuiPetBar:Point("TOP", TukuiBar2, "TOP", 0, 30)
		end
	end
end

local function MoveButtonBar(button, bar)
	local db = TukuiDataPerChar
	
    if button == TukuiBar2Button then
        if bar:IsShown() then
            db.hidebar2 = false
            button:ClearAllPoints()
            button.text:SetText("|cff4BAF4CT|r")
        else
            db.hidebar2 = true
            button:ClearAllPoints()
            button.text:SetText("|cffff0000T|r")
	    end
	end
	
	if button == TukuiBar3Button then
		if bar:IsShown() then
			db.hidebar3 = false
			button:ClearAllPoints()
			button.text:SetText("|cff4BAF4CS|r")
		else
			db.hidebar3 = true
			button:ClearAllPoints()
			button.text:SetText("|cffff0000S|r")
		end
	end

	if button == TukuiBar4Button then
		if bar:IsShown() then
			db.hidebar4 = false
			button.text:SetText("|cff4BAF4CR|r")
		else
			db.hidebar4 = true
			button.text:SetText("|cffff0000R|r")
		end
	end
	
	if button == TukuiBar5ButtonTop then
		local buttontop = TukuiBar5ButtonTop
		if bar:IsShown() then
			db.hidebar5 = false
			buttontop:ClearAllPoints()
			if not T.lowversion then buttontop.text:SetText("|cff4BAF4CL|r") end
					
		else
			db.hidebar5 = true
			buttontop:ClearAllPoints()
			if not T.lowversion then buttontop.text:SetText("|cffff0000L|r") end
			

		end	
	end
end

local function UpdateBar(self, bar) -- guess what! :P
	if InCombatLockdown() then print(ERR_NOT_IN_COMBAT) return end
	
	local button = self
	
	ShowOrHideBar(bar, button)
	MoveButtonBar(button, bar)
end

local TukuiBar2Button = CreateFrame("Button", "TukuiBar2Button", TukuiPetBattleHider)
TukuiBar2Button:Width(19)
TukuiBar2Button:Height(TukuiTabsRightBackground:GetHeight()-4)
TukuiBar2Button:Point("LEFT", TukuiTabsRightBackground, "RIGHT", -81, 0)
TukuiBar2Button:SetTemplate("Default")
TukuiBar2Button:RegisterForClicks("AnyUp")
TukuiBar2Button:SetAlpha(1)
TukuiBar2Button:SetScript("OnClick", function(self) UpdateBar(self, TukuiBar2) end)
TukuiBar2Button.text = T.SetFontString(TukuiBar2Button, C.media.uffont, 14)
TukuiBar2Button.text:Point("CENTER", 0, 0)
TukuiBar2Button.text:SetText("|cff4BAF4CT|r")
G.ActionBars.Bar2.ShowHideButton = TukuiBar2Button

local TukuiBar3LeftButton = CreateFrame("Button", "TukuiBar3LeftButton", UIParent)
TukuiBar3LeftButton:Width(19)
TukuiBar3LeftButton:Height(TukuiTabsRightBackground:GetHeight()-4)
TukuiBar3LeftButton:Point("LEFT", TukuiBar2Button, "RIGHT", 1, 0)
TukuiBar3LeftButton:SetTemplate("Default")
TukuiBar3LeftButton:RegisterForClicks("AnyUp")
TukuiBar3LeftButton:SetAlpha(1)
TukuiBar3LeftButton:SetScript("OnClick", function(self) UpdateBar(self, TukuiBar3Left) end)
TukuiBar3LeftButton.text = T.SetFontString(TukuiBar3LeftButton, C.media.uffont, 14)
TukuiBar3LeftButton.text:Point("CENTER", 0, 0)
TukuiBar3LeftButton.text:SetText("|cff4BAF4CS|r")
G.ActionBars.Bar3.ShowHideButton = TukuiBar3Button

local TukuiBar4Button = CreateFrame("Button", "TukuiBar4Button", TukuiPetBattleHider)
TukuiBar4Button:Width(19)
TukuiBar4Button:Height(TukuiTabsRightBackground:GetHeight()-4)
TukuiBar4Button:Point("LEFT", TukuiBar3LeftButton, "RIGHT", 1, 0)
TukuiBar4Button:SetTemplate("Default")
TukuiBar4Button:RegisterForClicks("AnyUp")
TukuiBar4Button:SetAlpha(1)
TukuiBar4Button:SetScript("OnClick", function(self) UpdateBar(self, TukuiBar4) end)
TukuiBar4Button.text = T.SetFontString(TukuiBar4Button, C.media.uffont, 14)
TukuiBar4Button.text:SetPoint("CENTER", 0, 0)
TukuiBar4Button.text:SetText("|cff4BAF4CR|r")
G.ActionBars.Bar4.ShowHideButton = TukuiBar4Button

local TukuiBar5ButtonTop = CreateFrame("Button", "TukuiBar5ButtonTop", TukuiPetBattleHider)
TukuiBar5ButtonTop:Width(19)
TukuiBar5ButtonTop:Height(TukuiTabsRightBackground:GetHeight()-4)
TukuiBar5ButtonTop:Point("LEFT", TukuiBar4Button, "RIGHT", 1, 0)
TukuiBar5ButtonTop:SetTemplate("Default")
TukuiBar5ButtonTop:RegisterForClicks("AnyUp")
TukuiBar5ButtonTop:SetAlpha(1)
TukuiBar5ButtonTop:SetScript("OnClick", function(self) UpdateBar(self, TukuiBar5) end)
TukuiBar5ButtonTop.text = T.SetFontString(TukuiBar5ButtonTop, C.media.uffont, 14)
TukuiBar5ButtonTop.text:Point("CENTER", 0, 0)
TukuiBar5ButtonTop.text:SetText("|cff4BAF4CL|r")
G.ActionBars.Bar5.ShowHideButtonTop = TukuiBar5ButtonTop

local init = CreateFrame("Frame")
init:RegisterEvent("VARIABLES_LOADED")
init:SetScript("OnEvent", function(self, event)
	if not TukuiDataPerChar then TukuiDataPerChar = {} end
	local db = TukuiDataPerChar
	
	if not T.lowversion and db.hidebar2 then 
		UpdateBar(TukuiBar2Button, TukuiBar2)
	end
	
	if not T.lowversion and db.hidebar3 then
		UpdateBar(TukuiBar3Button, TukuiBar3)
	end
	
	if db.hidebar4 then
		UpdateBar(TukuiBar4Button, TukuiBar4)
	end
		
	if T.lowversion then
		-- because we use bar6.lua and bar7.lua with TukuiBar5Button for lower reso.
		TukuiBar2Button:Hide()
		TukuiBar3Button:Hide()
		if db.hidebar7 then
			UnregisterStateDriver(TukuiBar7, "visibility")
			TukuiBar7:Hide()
			TukuiBar5:SetWidth((T.buttonsize * 2) + (T.buttonspacing * 3))
		end
		
		if db.hidebar6 then
			UnregisterStateDriver(TukuiBar6, "visibility")
			TukuiBar6:Hide()
			TukuiBar5:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
		end
		
		TukuiBar5ButtonTop:SetWidth(TukuiBar5:GetWidth())
	end
	
	if db.hidebar5 then
		UpdateBar(TukuiBar5ButtonTop, TukuiBar5)
	end
end)