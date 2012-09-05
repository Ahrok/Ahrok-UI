local T, C, L, G = unpack(Tukui)

-- switch to heal layout via a command
SLASH_TUKUIHEAL1 = "/heal"
SlashCmdList.TUKUIHEAL = function()
	DisableAddOn("AhrokUI_Raid")
	EnableAddOn("AhrokUI_Raid_for_Heal")
	ReloadUI()
end

-- switch to dps layout via a command
SLASH_TUKUIDPS1 = "/dps"
SlashCmdList.TUKUIDPS = function()
	DisableAddOn("AhrokUI_Raid_for_Heal")
	EnableAddOn("AhrokUI_Raid")
	ReloadUI()
end