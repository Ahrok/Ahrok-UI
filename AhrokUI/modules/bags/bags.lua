local T, C, L, G = unpack(Tukui)

if C.bags.enable ~= true then return end

local function BagsUpdateBagsPosition( self )
	TukuiBags:ClearAllPoints()

	if( C["chat"].background ~= true ) then
			TukuiBags:SetPoint( "BOTTOMRIGHT", G.Panels.DataTextRight, "TOPRIGHT", 0, 3 )
		else
			TukuiBags:SetPoint( "BOTTOMRIGHT", G.Panels.RightChatBackground, "TOPRIGHT", 0, 3 )
		end
end
TukuiBags:HookScript( "OnUpdate", BagsUpdateBagsPosition )

local function BagsUpdateBankPosition( self, value )
	local bag = _G["Tukui" .. value]
	if( value == "Bank" ) then
		bag:ClearAllPoints()
		if( C["chat"].background ~= true ) then
			bag:SetPoint( "BOTTOMLEFT", G.Panels.DataTextLeft, "TOPLEFT", 0, 3 )
		else
			bag:SetPoint( "BOTTOMLEFT", G.Panels.LeftChatBackground, "TOPLEFT", 0, 3 )
		end
	end
end
hooksecurefunc( Stuffing, "CreateBagFrame", BagsUpdateBankPosition )