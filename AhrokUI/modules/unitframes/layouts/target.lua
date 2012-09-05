local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end
--------------------------------------------------------------
-------------------------- Player ---------------------------
--------------------------------------------------------------
do

	do
		G.UnitFrames.Target:SetBackdrop( nil )
		G.UnitFrames.Target:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.Target.shadow:Kill()
		--G.UnitFrames.Target.panel:Kill()
	end
	
--------------------------------------------------------------
-- panel just to move the target name around ....
--------------------------------------------------------------
	do
		G.UnitFrames.Target.panel:SetAlpha(0)
		G.UnitFrames.Target.panel:ClearAllPoints()
		G.UnitFrames.Target.panel:SetPoint( "BOTTOMLEFT", G.UnitFrames.Target, "TOPLEFT", -4, 7 )
		
	end
	
--------------------------------------------------------------
-- health
--------------------------------------------------------------	
	
	do
	-- Healthbar
	G.UnitFrames.Target.Health:SetHeight(23)
	G.UnitFrames.Target.Health:Point("TOPLEFT", 0, -16)
	G.UnitFrames.Target.Health:Point("TOPRIGHT", 0, -16)
	G.UnitFrames.Target.Health:SetStatusBarTexture(C["media"].normTex)
	G.UnitFrames.Target.Health:SetFrameLevel( 4 )
	G.UnitFrames.Target.Health:CreateBackdrop("Default")
	G.UnitFrames.Target.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )
	--Healthbar Unicolor
		if( C["unitframes"].unicolor == true ) then
			G.UnitFrames.Target.Health.colorTapping = false
			G.UnitFrames.Target.Health.colorDisconnected = false
			G.UnitFrames.Target.Health.colorClass = false
			G.UnitFrames.Target.Health:SetStatusBarColor(.3, .3, .3, 1)
			G.UnitFrames.Target.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
			G.UnitFrames.Target.Health.bg:SetVertexColor(unpack(C["unitframes"].healthBgColor))
		else
			G.UnitFrames.Target.Health.colorDisconnected = true
			G.UnitFrames.Target.Health.colorTapping = true
			G.UnitFrames.Target.Health.colorClass = true
			G.UnitFrames.Target.Health.colorReaction = true
		end
	end
--------------------------------------------------------------
-- Power
--------------------------------------------------------------		
	do
	-- Powerbar
	G.UnitFrames.Target.Power:Height(4)
	G.UnitFrames.Target.Power:Point("TOPLEFT", G.UnitFrames.Target.Health, "BOTTOMLEFT", 0, -5)
	G.UnitFrames.Target.Power:Point("TOPRIGHT", G.UnitFrames.Target.Health, "BOTTOMRIGHT", 0, -5)
	G.UnitFrames.Target.Power:SetStatusBarTexture(C["media"].normTex)
	G.UnitFrames.Target.Power:CreateBackdrop("Default")
	end	
--------------------------------------------------------------
-- Power & Health Text  / Targetname
--------------------------------------------------------------		
	do
	-- Health Text
	G.UnitFrames.Target.Health.value:ClearAllPoints()
	G.UnitFrames.Target.Health.value = T.SetFontString( G.UnitFrames.Target.Health,unpack(T.Fonts.uGeneral.setfont))
	G.UnitFrames.Target.Health.value:Point( "RIGHT", G.UnitFrames.Target.Health, "RIGHT", -4, 1 )
	-- Power Text
	G.UnitFrames.Target.Power.value:ClearAllPoints()
	G.UnitFrames.Target.Power.value = T.SetFontString( G.UnitFrames.Target.Health,unpack(T.Fonts.uGeneral.setfont))
	G.UnitFrames.Target.Power.value:Point( "LEFT", G.UnitFrames.Target.Health, "LEFT", 4, 1 )
	-- Targetname
	G.UnitFrames.Target.Name:SetShadowOffset( 1.25, -1.25 )
	G.UnitFrames.Target.Name:SetFont(unpack(T.Fonts.uGeneral.setfont))	
	
	end
--------------------------------------------------------------
-- portraits
--------------------------------------------------------------
	do
		if C["unitframes"].charportrait == true then
			G.UnitFrames.Target.Portrait:ClearAllPoints()
			G.UnitFrames.Target.Portrait:SetAllPoints( G.UnitFrames.Target.Health )
			G.UnitFrames.Target.Portrait:SetAlpha( 0.2 )
			G.UnitFrames.Target.Portrait.SetAlpha = T.dummy
			G.UnitFrames.Target.Health:ClearAllPoints()
			G.UnitFrames.Target.Health:SetPoint( "TOPLEFT", 0, 0 )
			G.UnitFrames.Target.Health:SetPoint( "TOPRIGHT" )
			G.UnitFrames.Target.Portrait:SetFrameLevel( G.UnitFrames.Target.Health:GetFrameLevel()+1)
		end
	end

--------------------------------------------------------------
-- castbar
--------------------------------------------------------------	
	do
	-- the castbar it self
		if (C["unitframes"].unitcastbar == true) then
		G.UnitFrames.Target.Castbar:ClearAllPoints()
		G.UnitFrames.Target.Castbar:SetHeight(13)
		G.UnitFrames.Target.Castbar:Point("TOPLEFT", G.UnitFrames.Target.Power, "BOTTOMLEFT", 0, -5)
		G.UnitFrames.Target.Castbar:Point("TOPRIGHT", G.UnitFrames.Target.Power, "BOTTOMRIGHT", 0, -5)
		G.UnitFrames.Target.Castbar:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.Target.Castbar:CreateBackdrop("Default")
		G.UnitFrames.Target.Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )
		end
	-- the castbar icon
		if C["unitframes"].cbicons == true then
			G.UnitFrames.Target.Castbar.button:ClearAllPoints()
			G.UnitFrames.Target.Castbar.button:SetPoint( "RIGHT", G.UnitFrames.Target.Castbar, "LEFT", -5, 0 )
			G.UnitFrames.Target.Castbar.button:Size( 17)
		else
			G.UnitFrames.Target.Castbar:SetWidth(C.castbar.Targetwidth)
		end
	-- Castbar text
		G.UnitFrames.Target.Castbar.PostCastStart = T.PostCastStart
		G.UnitFrames.Target.Castbar.PostChannelStart = T.PostCastStart

		G.UnitFrames.Target.Castbar.Time = T.SetFontString( G.UnitFrames.Target.Castbar,unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Target.Castbar.Time:Point( "RIGHT", G.UnitFrames.Target.Castbar, "RIGHT", -4, 0 )

		G.UnitFrames.Target.Castbar.Text = T.SetFontString( G.UnitFrames.Target.Castbar,unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.Target.Castbar.Text:Point( "LEFT", G.UnitFrames.Target.Castbar, "LEFT", 4, 0 )
			
	end
--------------------------------------------------------------
-- buffs, debuffs
--------------------------------------------------------------	
	do
		G.UnitFrames.Target.Buffs:ClearAllPoints()
		G.UnitFrames.Target.Buffs:Point( "BOTTOMLEFT", G.UnitFrames.Target, "TOPLEFT", -2, 25 )
		G.UnitFrames.Target.Buffs.ClearAllPoints = T.dummy
		G.UnitFrames.Target.Buffs.SetPoint = T.dummy
		G.UnitFrames.Target.Debuffs:ClearAllPoints()
		G.UnitFrames.Target.Debuffs:Point( "BOTTOMRIGHT", G.UnitFrames.Target.Buffs, "TOPRIGHT", 7, 3 )
		G.UnitFrames.Target.Debuffs.ClearAllPoints = T.dummy
		G.UnitFrames.Target.Debuffs.SetPoint = T.dummy
		G.UnitFrames.Target.Debuffs.onlyShowPlayer = C.auras.onlyselfdebuffs
		G.UnitFrames.Target.Buffs.onlyShowPlayer = C.auras.onlyselfbuffs
	end
	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.Target:Size( 250, 30 )
	end	

end