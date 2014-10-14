local iconWidth  = 30
local iconHeight = 30

local function AddCombatIconTextureTo(frame)
	local texture = frame:CreateTexture(nil, "BACKGROUND")
	
	texture:SetTexture("Interface\\CHARACTERFRAME\\UI-StateIcon.blp")
	texture:SetTexCoord(.5, 1, 0, .49) -- sprite leak. booo
	texture:SetWidth(iconWidth)
	texture:SetHeight(iconHeight)
	texture:SetPoint("CENTER")
	
	return texture
end

local function CreateCombatIconFrameOn(parentFrame, unitName)
	local frame = CreateFrame("Frame", nil, parentFrame)

	frame:SetWidth(iconWidth)
	frame:SetHeight(iconHeight)
	frame:SetPoint("BOTTOMRIGHT", parentFrame, "BOTTOMRIGHT", -36, 21)
	frame:Hide()

	AddCombatIconTextureTo(frame)
	RaiseFrameLevel(frame)

	return frame
end

local function ToggleFrameOnUnitUpdate(frame, unit)
	if UnitAffectingCombat(unit) then
		frame:Show()
	else
		frame:Hide()
	end
end

local targetCombatIconFrame = CreateCombatIconFrameOn(TargetFrame)
local focusCombatIconFrame = CreateCombatIconFrameOn(FocusFrame)

local handlerFrame = CreateFrame("Frame", nil, UIParent)
handlerFrame:SetScript("OnUpdate", function (self)
	ToggleFrameOnUnitUpdate(targetCombatIconFrame, "target")
	ToggleFrameOnUnitUpdate(focusCombatIconFrame, "focus")
end)