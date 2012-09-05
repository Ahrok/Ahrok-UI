local T, C, L, G = unpack( Tukui )
------------------------------
-- AUi Stancebar mover / resizer
------------------------------
-- StanceBar
G.ActionBars.Stance:ClearAllPoints()
if T.myclass == "SHAMAN" then
	G.ActionBars.Stance:SetPoint("BOTTOM", TukuiBar1, "TOP", 0, 3)
elseif T.myclass == "DRUID" then
	G.ActionBars.Stance:SetPoint("BOTTOM", UIParent , "Bottom", 42, 3)
elseif T.myclass == "DEATHKNIGHT" or "WARRIOR" or "PALADIN" then
	G.ActionBars.Stance:SetPoint("BOTTOM", UIParent , "Bottom", 65, 3)
elseif T.myclass == "PRIEST" or "WARLOCK" then
	G.ActionBars.Stance:SetPoint("BOTTOM", 0, 3)
else
	G.ActionBars.Stance:SetPoint("BOTTOM", 40, 3)
end
G.ActionBars.Stance:SetWidth((T.petbuttonsize * 5) + (T.petbuttonsize * 4))
G.ActionBars.Stance:SetHeight(10)
G.ActionBars.Stance:SetFrameStrata("MEDIUM")
G.ActionBars.Stance:SetMovable(true)