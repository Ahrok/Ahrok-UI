local T, C, L, G = unpack(Tukui)

---------------------------------------------------------------------------------
-- Data Text
---------------------------------------------------------------------------------
local DataTextPosition = function(f, t, o)
	local left = TukuiInfoLeft
	local right = TukuiInfoRight
	local mapleft = TukuiMinimapStatsLeft
	local mapright = TukuiMinimapStatsRight
	local left2 = lip
	local right2 = rip
	
	if o == 1 then
		t:ClearAllPoints()
		t:SetParent(left)
		t:SetHeight(left:GetHeight())
		t:SetPoint("LEFT", left, 30, 0)
		t:SetPoint('TOP', left)
		t:SetPoint('BOTTOM', left)
	elseif o == 2 then
		t:ClearAllPoints()
		t:SetParent(left)
		t:SetHeight(left:GetHeight())
		t:SetPoint('TOP', left)
		t:SetPoint('BOTTOM', left)
	elseif o == 3 then
		t:ClearAllPoints()
		t:SetParent(left)
		t:SetHeight(left:GetHeight())
		t:SetPoint("RIGHT", left, -30, 0)
		t:SetPoint('TOP', left)
		t:SetPoint('BOTTOM', left)
	elseif o == 4 then
		t:ClearAllPoints()
		t:SetParent(left2)
		t:SetHeight(left2:GetHeight())
		t:SetPoint("RIGHT", lip, -230, 0)
		t:SetPoint('TOP', lip)
		t:SetPoint('BOTTOM', lip)
	elseif o == 5 then
		t:ClearAllPoints()
		t:SetParent(left2)
		t:SetHeight(left2:GetHeight())
		t:SetPoint("RIGHT", lip, -140, 0)
		t:SetPoint('TOP', lip)
		t:SetPoint('BOTTOM', lip)
	elseif o == 6 then
		t:ClearAllPoints()
		t:SetParent(left2)
		t:SetHeight(left2:GetHeight())
		t:SetPoint("RIGHT", lip, -30, 0)
		t:SetPoint('TOP', lip)
		t:SetPoint('BOTTOM', lip)
	elseif o == 7 then
		t:ClearAllPoints()
		t:SetParent(right2)
		t:SetHeight(right2:GetHeight())
		t:SetPoint("RIGHT", rip, -260, 0)
		t:SetPoint('TOP', rip)
		t:SetPoint('BOTTOM', rip)
	elseif o == 8 then
		t:ClearAllPoints()
		t:SetParent(right2)
		t:SetHeight(right2:GetHeight())
		t:SetPoint("RIGHT", rip, -140, 0)
		t:SetPoint('TOP', rip)
		t:SetPoint('BOTTOM', rip)
	elseif o == 9 then
		t:ClearAllPoints()
		t:SetParent(right2)
		t:SetHeight(right2:GetHeight())
		t:SetPoint("RIGHT", rip, -30, 0)
		t:SetPoint('TOP', rip)
		t:SetPoint('BOTTOM', rip)
	elseif o == 10 then
		t:ClearAllPoints()
		t:SetParent(right)
		t:SetHeight(right:GetHeight())
		t:SetPoint("LEFT", right, 30, 0)
		t:SetPoint('TOP', right)
		t:SetPoint('BOTTOM', right)
	elseif o == 11 then
		t:ClearAllPoints()
		t:SetParent(right)
		t:SetHeight(right:GetHeight())
		t:SetPoint('TOP', right)
		t:SetPoint('BOTTOM', right)
	elseif o == 12 then
		t:ClearAllPoints()
		t:SetParent(right)
		t:SetHeight(right:GetHeight())
		t:SetPoint("RIGHT", right, -30, 0)
		t:SetPoint('TOP', right)
		t:SetPoint('BOTTOM', right)
	elseif o == 13 then
		t:ClearAllPoints()
		t:SetParent(mapleft)
		t:SetHeight(mapleft:GetHeight())
		t:SetPoint('TOP', mapleft)
		t:SetPoint('BOTTOM', mapleft)
	elseif o == 14 then
		t:ClearAllPoints()
		t:SetParent(mapright)
		t:SetHeight(mapright:GetHeight())
		t:SetPoint('TOP', mapright)
		t:SetPoint('BOTTOM', mapright)
	else	
		f:Hide()
		t:Hide()
	end
end


local datatext = {
	"Guild",
	"Friends",
	"Gold",
	"FPS",
	"System",
	"Bags",
	"Gold",
	"Time",
	"Durability",
	"Heal",
	"Damage",
	"Power",
	"Haste",
	"Crit",
	"Avoidance",
	"Armor",
	"Currency",
	"Hit",
	"Mastery",
	"MicroMenu",
	"Regen",
	"Talent",
	"CallToArms",
}

for _, data in pairs(datatext) do
	local t = "TukuiStat"
	local frame = _G[t..data]
	local text = _G[t..data.."Text"]
	if frame and frame.Option then
		DataTextPosition(frame, text, frame.Option)
		
	end
end