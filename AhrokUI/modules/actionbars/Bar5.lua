local T, C, L, G = unpack( Tukui )

if( C["actionbar"].enable ~= true ) then return end

---------------------------------------------------------------------------
-- setup Bar 5 Top Left Bar 
---------------------------------------------------------------------------

local bar = TukuiBar5
MultiBarLeft:SetParent(bar)
for i= 1, 12 do
    local b = _G["MultiBarLeftButton"..i]
    local b2 = _G["MultiBarLeftButton"..i-1]
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