local T, C, L, G = unpack( Tukui )
------------------------------------------------
-- Fonts
------------------------------------------------


local font, caith, pixel = C["media"].font, C["media"].caith, C["media"].pixelfont
local blank, norm, empath = C["media"].blank, C["media"].normTex, C["media"].empath

-- font template used for fallback values if incorrect or no values are entered
-- don't change this, unless you know what you're doing
local fontTemplate = {
	family = font,
	size = 12,
	outline = "NONE", -- "THINOUTLINE" / "OUTLINE" / "MONOCHROMEOUTLINE"
	point = "CENTER",
	xOff = 0,
	yOff = 0
}

-- fallback functions
local function Font(family, size, outline, point, xOff, yOff)
	local result = {
		setfont = {
			family or fontTemplate.family,
			size or fontTemplate.size,
			outline or fontTemplate.outline
		},
		setoffsets = {
			point or fontTemplate.point,
			xOff or fontTemplate.xOff,
			yOff or fontTemplate.yOff
		}
	}
	return result;
end

local function Texture(texture)
	local result = {
		texture or C["media"].blank,
	}
	return result;
end

if C["general"].font then
T.Fonts = {
	--[[ how to use:
		 
		1. You only need to change the values you want to change, other values can be left as "nil".
		Font function syntax:
		
		Font(font, size, outline, anchorpoint, x-offset, y-offset)
		
		
		For example if you only needed to change the font size and outline on the aHotkey table...
		 
		aHotkey = Font(nil, 14, "THINOUTLINE", nil, nil, nil)
		 
		...that's how you would write it; because you are using default values from the fallback table.
		 
		Included font alternatives:
		- font
		- pixel
		- caith
	]]--
	
	-- actionbars
	
		aHotkey = Font(pixel, 13, "MONOCHROMEOUTLINE", "TOPRIGHT", nil, -1), -- hotkey
		aCount = Font(pixel, 13, "MONOCHROMEOUTLINE", "BOTTOMRIGHT", -1, 1), -- count
		
		-- bags
		baCount = Font(pixel, 13, "MONOCHROMEOUTLINE", "BOTTOMRIGHT", -1, 1), -- count
		baGeneral = Font(pixel, 13, "MONOCHROMEOUTLINE", nil, nil, nil),
		
		-- mirror bar
		miGeneral = Font(pixel, nil, "MONOCHROMEOUTLINE", nil, nil, nil),
		
		-- buffs
		bDuration = Font(pixel, nil, "MONOCHROMEOUTLINE", "BOTTOM", 1, -14), -- duration
		bCount = Font(pixel, nil, "MONOCHROMEOUTLINE", "TOPLEFT", 3, 1), -- count
		
		-- chat
		cTab = Font(pixel, 13, "MONOCHROMEOUTLINE", nil, nil, nil), -- chat tab
		cGeneral = Font(caith, 11, nil, nil, nil, nil), -- chat window
		
		-- datatext
		dFont = Font(pixel, 13, "MONOCHROMEOUTLINE", nil, nil, nil),
		-- loot
		lGeneral = Font(caith, 11, "OUTLINE", nil, nil, nil),
		
		-- map
		mTitle = Font(caith, 22, "OUTLINE", nil, nil, nil), -- region name
		mGeneral = Font(caith, 22, "OUTLINE", nil, nil, nil), -- show quest/digsite
		mArea = Font(caith, 22*3, "OUTLINE", nil, nil, nil), -- hover over
		
		-- nameplates
		nGeneral = Font(pixel, nil, "OUTLINE", nil, nil, nil),
		
		-- tooltip
		tGeneral = Font(caith, 11, nil, nil, nil, nil),
		
		-- unitframes - don't try and anchor these yet
		uHealth = Font(pixel, 13, "MONOCHROMEOUTLINE", nil, nil, nil), -- unit health
		uPower = Font(pixel, 13, "MONOCHROMEOUTLINE", nil, nil, nil), -- unit power
		uName = Font(pixel, 13, "MONOCHROMEOUTLINE", nil, nil, nil), -- unit name
		
		uGeneral = Font(pixel, 13, "MONOCHROMEOUTLINE", nil, nil, nil), -- castbar, pvp, etc
		uCombat = Font(caith, 14, nil, nil, nil, nil), -- combat feedback
		uAuras = Font(pixel, 13, "MONOCHROMEOUTLINE", nil, nil, nil),
		
		-- miscellaneous
		altPowerBar = Font(pixel, nil, "MONOCHROMEOUTLINE", nil, 0, 1),
		lootRollFrame = Font(pixel, nil, "MONOCHROMEOUTLINE", nil, nil, nil),
		cooldown = Font(pixel, nil, "MONOCHROMEOUTLINE", nil, nil, nil), -- actionbar / bag / etc.
		movers = Font(pixel, nil, "MONOCHROMEOUTLINE", nil, nil, nil), -- /moveui text + vehicle
}
else

T.Fonts = {

		aHotkey = Font(font, nil, "OUTLINE", "TOPRIGHT", nil, -1), -- hotkey
		aCount = Font(font, nil, "OUTLINE", "BOTTOMRIGHT", -1, 1), -- count
		
		-- bags
		baCount = Font(font, nil, "OUTLINE", "BOTTOMRIGHT", -1, 1), -- count
		baGeneral = Font(font, nil, "OUTLINE", nil, nil, nil),
		
		-- mirror bar
		miGeneral = Font(font, nil, "OUTLINE", nil, nil, nil),
		
		-- buffs
		bDuration = Font(font, nil, "OUTLINE", "BOTTOM", 1, -14), -- duration
		bCount = Font(font, nil, "OUTLINE", "TOPLEFT", 3, 1), -- count
		
		-- chat
		cTab = Font(font, nil, "OUTLINE", nil, nil, nil), -- chat tab
		cGeneral = Font(caith, 11, nil, nil, nil, nil), -- chat window
		
		-- datatext
		dFont = Font(font, nil, "OUTLINE", nil, nil, nil), 
		
		-- loot
		lGeneral = Font(caith, 11, "OUTLINE", nil, nil, nil),
		
		-- map
		mTitle = Font(caith, 22, "OUTLINE", nil, nil, nil), -- region name
		mGeneral = Font(caith, 22, "OUTLINE", nil, nil, nil), -- show quest/digsite
		mArea = Font(caith, 22*3, "OUTLINE", nil, nil, nil), -- hover over
		
		-- nameplates
		nGeneral = Font(font, nil, "OUTLINE", nil, nil, nil),
		
		-- tooltip
		tGeneral = Font(caith, 11, nil, nil, nil, nil),
		
		-- unitframes - don't try and anchor these yet
		uHealth = Font(font, nil, "OUTLINE", nil, nil, nil), -- unit health
		uPower = Font(font, nil, "OUTLINE", nil, nil, nil), -- unit power
		uName = Font(font, nil, "OUTLINE", nil, nil, nil), -- unit name
		
		uGeneral = Font(font, nil, "OUTLINE", nil, nil, nil), -- castbar, pvp, etc
		uCombat = Font(caith, 14, nil, nil, nil, nil), -- combat feedback
		uAuras = Font(font, nil, "OUTLINE", nil, nil, nil),
		
		-- miscellaneous
		altPowerBar = Font(font, nil, "OUTLINE", nil, 0, 1),
		lootRollFrame = Font(font, nil, "OUTLINE", nil, nil, nil),
		cooldown = Font(font, nil, "MONOCHROMEOUTLINE", nil, nil, nil), -- actionbar / bag / etc.
		movers = Font(font, nil, "OUTLINE", nil, nil, nil), -- /moveui text + vehicle
}
end
T.Textures = {
	-- interface textures (e.g - panels)
	interface = Texture(nil),
	
	-- status bar textures
	statusBars = Texture(C["media"].normTex),
}

T.Colors = {
	tapped = {0.55, 0.57, 0.61},
	disconnected = {0.84, 0.75, 0.65},
	power = {
		["MANA"]				= {0.31, 0.45, 0.63},
		["RAGE"] 				= {0.69, 0.31, 0.31},
		["FOCUS"] 				= {0.71, 0.43, 0.27},
		["ENERGY"] 				= {0.65, 0.63, 0.35},
		["RUNES"] 				= {0.55, 0.57, 0.61},
		["RUNIC_POWER"] 		= {0, 0.82, 1},
		["AMMOSLOT"] 			= {0.8, 0.6, 0},
		["FUEL"] 				= {0, 0.55, 0.5},
		["POWER_TYPE_STEAM"] 	= {0.55, 0.57, 0.61},
		["POWER_TYPE_PYRITE"] 	= {0.60, 0.09, 0.17},
	},
	happiness = {
		[1] = {.69,.31,.31},
		[2] = {.65,.63,.35},
		[3] = {.33,.59,.33},
	},
	runes = {
			[1] = {.69,.31,.31},
			[2] = {.33,.59,.33},
			[3] = {.31,.45,.63},
			[4] = {.84,.75,.65},
	},
	reaction = {
		[1] = { 222/255, 95/255,  95/255 }, -- Hated
		[2] = { 222/255, 95/255,  95/255 }, -- Hostile
		[3] = { 222/255, 95/255,  95/255 }, -- Unfriendly
		[4] = { 218/255, 197/255, 92/255 }, -- Neutral
		[5] = { 75/255,  175/255, 76/255 }, -- Friendly
		[6] = { 75/255,  175/255, 76/255 }, -- Honored
		[7] = { 75/255,  175/255, 76/255 }, -- Revered
		[8] = { 75/255,  175/255, 76/255 }, -- Exalted	
	},
	class = {
		["DEATHKNIGHT"] = { 196/255,  30/255,  60/255 },
		["DRUID"]       = { 255/255, 125/255,  10/255 },
		["HUNTER"]      = { 171/255, 214/255, 116/255 },
		["MAGE"]        = { 104/255, 205/255, 255/255 },
		["PALADIN"]     = { 245/255, 140/255, 186/255 },
		["PRIEST"]      = { 212/255, 212/255, 212/255 },
		["ROGUE"]       = { 255/255, 243/255,  82/255 },
		["SHAMAN"]      = {  41/255,  79/255, 155/255 },
		["WARLOCK"]     = { 148/255, 130/255, 201/255 },
		["WARRIOR"]     = { 199/255, 156/255, 110/255 },
	},
}

--------------------------------------------------------------------------------------------
-- Grid theme indicator section
--------------------------------------------------------------------------------------------

-- position of indicators
T.countOffsets = {
	TOPLEFT = {6*C["unitframes"].gridscale, 1},
	TOPRIGHT = {-6*C["unitframes"].gridscale, 1},
	BOTTOMLEFT = {6*C["unitframes"].gridscale, 1},
	BOTTOMRIGHT = {-6*C["unitframes"].gridscale, 1},
	LEFT = {6*C["unitframes"].gridscale, 1},
	RIGHT = {-6*C["unitframes"].gridscale, 1},
	TOP = {0, 0},
	BOTTOM = {0, 0},
}

-- skin the icon
T.CreateAuraWatchIcon = function(self, icon)
	icon:SetTemplate("Default")
	icon.icon:Point("TOPLEFT", 1, -1)
	icon.icon:Point("BOTTOMRIGHT", -1, 1)
	icon.icon:SetTexCoord(.08, .92, .08, .92)
	icon.icon:SetDrawLayer("ARTWORK")
	if (icon.cd) then
		icon.cd:SetReverse()
	end
	icon.overlay:SetTexture()
end

-- create the icon
T.createAuraWatch = function(self, unit)
	local auras = CreateFrame("Frame", nil, self)
	auras:SetPoint("TOPLEFT", self.Health, 2, -2)
	auras:SetPoint("BOTTOMRIGHT", self.Health, -2, 2)
	auras.presentAlpha = 1
	auras.missingAlpha = 0
	auras.icons = {}
	auras.PostCreateIcon = T.CreateAuraWatchIcon

	if (not C["unitframes"].auratimer) then
		auras.hideCooldown = true
	end

	local buffs = {}

	if (T.buffids["ALL"]) then
		for key, value in pairs(T.buffids["ALL"]) do
			tinsert(buffs, value)
		end
	end

	if (T.buffids[T.myclass]) then
		for key, value in pairs(T.buffids[T.myclass]) do
			tinsert(buffs, value)
		end
	end

	-- "Cornerbuffs"
	if (buffs) then
		for key, spell in pairs(buffs) do
			local icon = CreateFrame("Frame", nil, auras)
			icon.spellID = spell[1]
			icon.anyUnit = spell[4]
			icon:Width(14)
			icon:Height(14)
			icon:SetPoint(spell[2], 0, 0)

			--[[local tex = icon:CreateTexture(nil, "OVERLAY")
			tex:SetAllPoints(icon)
			tex:SetTexture(C.media.blank)
			if (spell[3]) then
				tex:SetVertexColor(unpack(spell[3]))
			else
				tex:SetVertexColor(0.8, 0.8, 0.8)
			end]]

			local count = icon:CreateFontString(nil, "OVERLAY")
			count:SetFont(C["media"].uffont, 12, "THINOUTLINE")
			count:SetPoint("CENTER", unpack(T.countOffsets[spell[2]]))
			icon.count = count

			auras.icons[spell[1]] = icon
		end
	end
	
	self.AuraWatch = auras
end