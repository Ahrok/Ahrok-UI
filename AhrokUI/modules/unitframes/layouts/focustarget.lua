local T, C, L, G = unpack( Tukui )

if( C["unitframes"].enable ~= true ) then return end

--------------------------------------------------------------
-- Focus Target
--------------------------------------------------------------
do
	do
		G.UnitFrames.FocusTarget:SetBackdrop( nil )
		G.UnitFrames.FocusTarget:SetBackdropColor( 0, 0, 0 )
		G.UnitFrames.FocusTarget.shadow:Kill()
	end

--------------------------------------------------------------
-- health
--------------------------------------------------------------
	do
		G.UnitFrames.FocusTarget.Health:Size( 200, 20 )
		G.UnitFrames.FocusTarget.Health:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.FocusTarget.Health:SetFrameLevel( 5 )
		G.UnitFrames.FocusTarget.Health:CreateBackdrop("Default")
		G.UnitFrames.FocusTarget.Health.bg:SetVertexColor( 0.6, 0.6, 0.6 )

		if( C["unitframes"].unicolor == true ) then
			G.UnitFrames.FocusTarget.Health.colorTapping = false
			G.UnitFrames.FocusTarget.Health.colorDisconnected = false
			G.UnitFrames.FocusTarget.Health.colorClass = false
			G.UnitFrames.FocusTarget.Health:SetStatusBarColor(.3, .3, .3, 1)
			G.UnitFrames.FocusTarget.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
			G.UnitFrames.FocusTarget.Health.bg:SetVertexColor(unpack(C["unitframes"].healthBgColor))
		else
			G.UnitFrames.FocusTarget.Health.colorDisconnected = true
			G.UnitFrames.FocusTarget.Health.colorTapping = true
			G.UnitFrames.FocusTarget.Health.colorClass = true
			G.UnitFrames.FocusTarget.Health.colorReaction = true
		end

		G.UnitFrames.FocusTarget.Name:SetFont(unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.FocusTarget.Name:SetShadowOffset( 1.25, -1.25 )
		G.UnitFrames.FocusTarget.Name:Point( "CENTER", G.UnitFrames.FocusTarget.Health, "CENTER", 0, 1 )

		G.UnitFrames.FocusTarget.Health.value = T.SetFontString( G.UnitFrames.FocusTarget.Health,unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.FocusTarget.Health.value:Point( "RIGHT", G.UnitFrames.FocusTarget.Health, "RIGHT", -4, 1 )
	end

--------------------------------------------------------------
-- power
--------------------------------------------------------------
	do
		G.UnitFrames.FocusTarget.Power:Size( 200, 5 )
		G.UnitFrames.FocusTarget.Power:SetStatusBarTexture(C["media"].normTex)
		G.UnitFrames.FocusTarget.Power:ClearAllPoints()
		G.UnitFrames.FocusTarget.Power:Point( "TOPRIGHT", G.UnitFrames.FocusTarget.Health, "BOTTOMRIGHT", 0, -5 )
		G.UnitFrames.FocusTarget.Power:SetFrameLevel( G.UnitFrames.FocusTarget.Health:GetFrameLevel() + 2 )
		G.UnitFrames.FocusTarget.Power:CreateBackdrop("Default")

		G.UnitFrames.FocusTarget.Power.value = T.SetFontString( G.UnitFrames.FocusTarget.Health,unpack(T.Fonts.uGeneral.setfont))
		G.UnitFrames.FocusTarget.Power.value:Point( "LEFT", G.UnitFrames.FocusTarget.Health, "LEFT", 4, 1 )
	end

--------------------------------------------------------------
-- castbar
--------------------------------------------------------------
	do
		if( C["unitframes"].unitcastbar == true ) then
			G.UnitFrames.FocusTarget.Castbar:ClearAllPoints()
			G.UnitFrames.FocusTarget.Castbar:SetHeight( 15 )
			G.UnitFrames.FocusTarget.Castbar:Point( "TOPLEFT", G.UnitFrames.FocusTarget, "BOTTOMLEFT", 0, -16 )
			G.UnitFrames.FocusTarget.Castbar:CreateBackdrop("Default")

			G.UnitFrames.FocusTarget.Castbar.bg:Kill()

			G.UnitFrames.FocusTarget.Castbar.bg = G.UnitFrames.FocusTarget.Castbar:CreateTexture( nil, "BORDER" )
			G.UnitFrames.FocusTarget.Castbar.bg:SetAllPoints( G.UnitFrames.FocusTarget.Castbar )
			G.UnitFrames.FocusTarget.Castbar.bg:SetTexture( C["media"].normTex)
			G.UnitFrames.FocusTarget.Castbar.bg:SetVertexColor( 0.05, 0.05, 0.05 )

			G.UnitFrames.FocusTarget.Castbar.Time = T.SetFontString( G.UnitFrames.FocusTarget.Castbar, unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames.FocusTarget.Castbar.Time:Point( "RIGHT", G.UnitFrames.FocusTarget.Castbar, "RIGHT", -4, 1 )

			G.UnitFrames.FocusTarget.Castbar.Text = T.SetFontString( G.UnitFrames.FocusTarget.Castbar,unpack(T.Fonts.uGeneral.setfont))
			G.UnitFrames.FocusTarget.Castbar.Text:Point( "LEFT", G.UnitFrames.FocusTarget.Castbar, "LEFT", 4, 1 )
			G.UnitFrames.FocusTarget.Castbar.PostCastStart = T.PostCastStart
			G.UnitFrames.FocusTarget.Castbar.PostChannelStart = T.PostCastStart

			if( C["unitframes"].cbicons == true ) then
				G.UnitFrames.FocusTarget.Castbar:Width( 173 )

				G.UnitFrames.FocusTarget.Castbar.button:ClearAllPoints()
				G.UnitFrames.FocusTarget.Castbar.button:SetPoint( "LEFT", G.UnitFrames.FocusTarget.Castbar, "RIGHT", 5, 0 )
				G.UnitFrames.FocusTarget.Castbar.button:Size( 19 )
			else
				G.UnitFrames.FocusTarget.Castbar:Width( 200 )

				G.UnitFrames.FocusTarget.Castbar.button:Kill()
			end
		end
	end

--------------------------------------------------------------
-- buffs, debuffs
--------------------------------------------------------------
	do
		G.UnitFrames.FocusTarget.Debuffs:SetHeight( 20 )
		G.UnitFrames.FocusTarget.Debuffs:SetWidth( 200 )
		G.UnitFrames.FocusTarget.Debuffs.size = 20
		G.UnitFrames.FocusTarget.Debuffs.num = 5
		G.UnitFrames.FocusTarget.Debuffs.spacing = 3

		G.UnitFrames.FocusTarget.Debuffs:ClearAllPoints()
		G.UnitFrames.FocusTarget.Debuffs:Point( "LEFT", G.UnitFrames.FocusTarget, "RIGHT", 5, 0 )
		G.UnitFrames.FocusTarget.Debuffs.ClearAllPoints = T.dummy
		G.UnitFrames.FocusTarget.Debuffs.SetPoint = T.dummy

		G.UnitFrames.FocusTarget.Debuffs.initialAnchor = "LEFT"
		G.UnitFrames.FocusTarget.Debuffs["growth-x"] = "RIGHT"

		if( G.UnitFrames.FocusTarget.Debuffs ) then
			for _, frames in pairs( { G.UnitFrames.FocusTarget.Debuffs } ) do
				if( not frames ) then return end

				frames:Size( 200, 20 )
				frames.size = 20
				frames.num = 5

				--hooksecurefunc( frames, "PostCreateIcon", T.SkinAura )
			end
		end
	end

	------------------------------
	-- size
	------------------------------
	do
		G.UnitFrames.FocusTarget:Size( 200, 20 )
	end
end