-- Set up the combat icon & anchor it to a frame
local function ApplyTextures(frame, anchor)
	frame.texture = frame:CreateTexture()
	frame.texture:SetTexture("Interface\\CHARACTERFRAME\\UI-StateIcon.blp")
	frame.texture:SetTexCoord(0.5,1,0,0.49);
	frame.texture:SetAllPoints(frame)
	frame:SetWidth(21)
	frame:SetHeight(21)
	frame:SetPoint("BOTTOMRIGHT", anchor, "BOTTOMRIGHT", -22, 12)
	frame:Show()
end

-- Update the combat state
local function FrameOnUpdate(self, unit)
	if UnitAffectingCombat(unit) then
		self:Show()
	else
		self:Hide()
	end
end

-- Target frame
local target         = CreateFrame("Frame")
local target_handler = CreateFrame("Frame")
ApplyTextures(target, TargetFrame)
target_handler:SetScript("OnUpdate", function(self) FrameOnUpdate(target, "target") end)

-- Focus frame
local focus         = CreateFrame("Frame")
local focus_handler = CreateFrame("Frame")
ApplyTextures(focus, FocusFrame)
focus_handler:SetScript("OnUpdate", function(self) FrameOnUpdate(focus, "focus") end)