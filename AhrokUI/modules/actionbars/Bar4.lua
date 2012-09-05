local T, C, L = unpack( Tukui ) -- Import: T - functions, constants, variables; C - config; L - locales
if not C["actionbar"].enable == true then return end
---------------------------------------------------------------------------
-- setup Bar 4 asTop Right Bar 
---------------------------------------------------------------------------
local bar = TukuiBar4
MultiBarRight:SetParent(bar)
for i= 1, 12 do
    local b = _G["MultiBarRightButton"..i]
    local b2 = _G["MultiBarRightButton"..i-1]
    b:SetSize(T.buttonsize, T.buttonsize)
    b:ClearAllPoints()
    b:SetFrameStrata("BACKGROUND")
    b:SetFrameLevel(15)
    if i == 1 then
        b:SetPoint("TOPLEFT", bar, T.buttonspacing, -T.buttonspacing)
    else
        b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
    end
end

RegisterStateDriver(bar, "visibility", "[vehicleui][petbattle][overridebar] hide; show")