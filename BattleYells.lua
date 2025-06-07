local function getYell(targetName)
  local zone = GetRealZoneText()
  local yells = BattleYells[zone]
  if not yells then return nil end

  local lines = yells[targetName] or yells["__event__"]
  if not lines then return nil end

  return lines[math.random(#lines)]
end

SLASH_YELLSHORT1 = "/ym"
SlashCmdList["YELLSHORT"] = function()
  local target = UnitName("target")
  local msg = getYell(target)

  if not msg then
    print("BattleYells: No yell found for this target or zone.")
    return
  end

  SendChatMessage(msg, "YELL")
end
