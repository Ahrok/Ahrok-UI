local T, C, L, G = unpack( Tukui )
------------------------------
-- AUi Actionbars 
------------------------------
-- Main Bar (Bottom)
G.ActionBars.Bar1:ClearAllPoints()
G.ActionBars.Bar1:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 46)
G.ActionBars.Bar1:Size((T.buttonsize * 12 ) + ( T.buttonspacing * 13 ), ( T.buttonsize * 2 ) + ( T.buttonspacing * 3 ))
G.ActionBars.Bar1:CreateShadow("Default")
G.ActionBars.Bar1:SetTemplate("Transparent")

-- Top Bar 
G.ActionBars.Bar2:ClearAllPoints()
G.ActionBars.Bar2:SetPoint("BOTTOM", TukuiBar1, "BOTTOM", 0, 0)
G.ActionBars.Bar2:Size((T.buttonsize * 12 ) + ( T.buttonspacing * 13 ), ( T.buttonsize * 2 ) + ( T.buttonspacing * 3 ))
G.ActionBars.Bar2:CreateShadow("Default")
G.ActionBars.Bar2:SetTemplate("Transparent")


-- SplitBars L

G.ActionBars.Bar3:ClearAllPoints()
G.ActionBars.Bar3:SetAllPoints( G.ActionBars.Bar1 )

local TukuiBar3L = CreateFrame("Frame", "TukuiBar3Left", UIParent, "SecureHandlerStateTemplate")
TukuiBar3L:SetTemplate()
TukuiBar3L:Point("BOTTOMRIGHT", G.ActionBars.Bar1, "BOTTOMLEFT", -T.buttonspacing, 0)
TukuiBar3L:SetWidth((T.buttonsize * 3) + (T.buttonspacing * 4))
TukuiBar3L:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar3L:SetFrameStrata("BACKGROUND")
TukuiBar3L:SetFrameLevel(3)
TukuiBar3L:CreateShadow("Default")
if T.lowversion then
	TukuiBar3L:SetAlpha(0)
else
	TukuiBar3L:SetAlpha(1)
end

-- SplitBars R

local TukuiBar3R = CreateFrame("Frame", "TukuiBar3Right", UIParent, "SecureHandlerStateTemplate")
TukuiBar3R:SetTemplate()
TukuiBar3R:Point("BOTTOMLEFT", G.ActionBars.Bar1, "BOTTOMRIGHT",  T.buttonspacing, 0)
TukuiBar3R:SetWidth((T.buttonsize * 3) + (T.buttonspacing * 4))
TukuiBar3R:SetHeight((T.buttonsize * 2) + (T.buttonspacing * 3))
TukuiBar3R:SetFrameStrata("BACKGROUND")
TukuiBar3R:SetFrameLevel(3)
TukuiBar3R:CreateShadow("Default")
if T.lowversion then
	TukuiBar3R:SetAlpha(0)
else
	TukuiBar3R:SetAlpha(1)
end

-- Top Right bar
G.ActionBars.Bar4:ClearAllPoints()
G.ActionBars.Bar4:SetPoint("RIGHT", G.Panels.RightChatTabsBackground, "RIGHT", 0, 38)
G.ActionBars.Bar4:Size((T.buttonsize * 12 ) + ( T.buttonspacing * 13 ), ( T.buttonsize * 1 ) + ( T.buttonspacing * 2 ))
G.ActionBars.Bar4:CreateShadow("Default")
G.ActionBars.Bar4:SetTemplate("Transparent")

-- Top Left bar
G.ActionBars.Bar5:ClearAllPoints()
G.ActionBars.Bar5:SetPoint("LEFT", G.Panels.LeftChatTabsBackground, "LEFT", 0, 38)
G.ActionBars.Bar5:Size((T.buttonsize * 12 ) + ( T.buttonspacing * 13 ), ( T.buttonsize * 1 ) + ( T.buttonspacing * 2 ))
G.ActionBars.Bar5:CreateShadow("Default")
G.ActionBars.Bar5:SetTemplate("Transparent") 

-- Pet bar
G.ActionBars.Pet:ClearAllPoints()
G.ActionBars.Pet:Width( ( T.petbuttonsize * NUM_PET_ACTION_SLOTS + T.buttonspacing * 11 ) + 0 )
G.ActionBars.Pet:Height( ( T.petbuttonsize + T.buttonspacing * 2 ) + 0 )
G.ActionBars.Pet:SetPoint( "TOP", G.ActionBars.Bar2, "TOP", 0, 30 )
G.ActionBars.Pet:CreateShadow( "Default" )
G.ActionBars.Pet:SetTemplate( "Default" )

local panelsToKill = { G.ActionBars.Pet.BackgroundLink }
for _, panels in pairs( panelsToKill ) do
	panels:Kill()
end
------------------------------
-- AUi Chat
------------------------------
if( C["chat"].background == true ) then
G.Panels.LeftChatBackground:ClearAllPoints()
G.Panels.LeftChatBackground:Size( G.Panels.DataTextLeft:GetWidth() +12, 177)
G.Panels.LeftChatBackground:SetPoint( "BOTTOM", G.Panels.DataTextLeft, "BOTTOM", 0, -6 )
G.Panels.LeftChatBackground:CreateShadow("Default")
G.Panels.LeftChatBackground:SetTemplate("Transparent")

G.Panels.RightChatBackground:ClearAllPoints()
G.Panels.RightChatBackground:Size(G.Panels.DataTextLeft:GetWidth() +12, 177)
G.Panels.RightChatBackground:SetPoint( "BOTTOM", G.Panels.DataTextRight, "BOTTOM", 0, -6 )
G.Panels.RightChatBackground:CreateShadow( "Default" )
G.Panels.RightChatBackground:SetTemplate( "Transparent" )


G.Panels.LeftChatTabsBackground:ClearAllPoints()
G.Panels.LeftChatTabsBackground:Size( G.Panels.LeftChatBackground:GetWidth() - 10, 23 )
G.Panels.LeftChatTabsBackground:SetPoint( "TOP", G.Panels.LeftChatBackground, "TOP", 0, -5 )
G.Panels.LeftChatTabsBackground:CreateOverlay( G.Panels.LeftChatTabsBackground )

G.Panels.RightChatTabsBackground:ClearAllPoints()
G.Panels.RightChatTabsBackground:Size( G.Panels.RightChatBackground:GetWidth() - 10, 23 )
G.Panels.RightChatTabsBackground:SetPoint( "TOP", G.Panels.RightChatBackground, "TOP", 0, -5 )
G.Panels.RightChatTabsBackground:CreateOverlay( G.Panels.RightChatTabsBackground )
end
------------------------------
-- AUi x-tra Panels 
------------------------------

-- Left info Panel 2
local lip = CreateFrame("Frame", "lip", UIParent, "SecureHandlerStateTemplate")
lip:SetTemplate()
lip:SetWidth(327)
lip:SetHeight(23)
lip:SetPoint("LEFT", TukuiInfoLeft, "Right", 9, 0)
lip:SetFrameLevel(2)

-- LIP cube
local lipcube = CreateFrame("Frame", "lipcube", UIParent, "SecureHandlerStateTemplate")
lipcube:SetTemplate()
lipcube:SetWidth(23)
lipcube:SetHeight(23)
lipcube:SetPoint("Left", lip, "Right", 1, 0)
	lipcube:FontString(nil, C.media.font, 14, 14)
	lipcube.text:SetText("C|r")
	lipcube.text:SetPoint("CENTER")
lipcube:SetFrameLevel(2)
lipcube:EnableMouse(true)
	lipcube:SetScript("OnMouseDown", function(self)
			ToggleFrame(ChatMenu)
	end)

-- Right info Panel 2
local rip = CreateFrame("Frame", "rip", UIParent, "SecureHandlerStateTemplate")
rip:SetTemplate()
rip:SetWidth(327)
rip:SetHeight(23)
rip:SetPoint("RIGHT", TukuiInfoRight, "LEFT", -9, 0)
rip:SetFrameLevel(2)

-- RIP cube
local ripcube = CreateFrame("Frame", "ripcube", UIParent, "SecureHandlerStateTemplate")
ripcube:SetTemplate()
ripcube:SetWidth(23)
ripcube:SetHeight(23)
ripcube:SetPoint("Right", rip, "LEFT", -1, 0)
	ripcube:FontString(nil, C.media.font, 14, 14)
	ripcube.text:SetText("D|r")
	ripcube.text:SetPoint("CENTER")
ripcube:SetFrameLevel(2)
ripcube:EnableMouse(true)
	ripcube:SetScript("OnMouseDown", function(self)
			ToggleEncounterJournal() 
	end)