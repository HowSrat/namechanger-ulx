local CATEGORY_NAME = "Utility"

local PlayerNameOrNick = debug.getregistry().Player
PlayerNameOrNick.RealName = PlayerNameOrNick.Nick
PlayerNameOrNick.Nick = function(self) if self != nil then return self:GetNWString("PlayerName", self:RealName()) else return "" end end
PlayerNameOrNick.Name = PlayerNameOrNick.Nick
PlayerNameOrNick.GetName = PlayerNameOrNick.Nick


function ulx.setName(calling_ply, target_ply, name)
    local PlayerNick = target_ply:Nick() 
    target_ply:SetNWString("PlayerName", name)
    ulx.fancyLogAdmin(calling_ply, "#A set "..PlayerNick.." Name to "..name, target_ply, name)
end

local setName = ulx.command(CATEGORY_NAME, "ulx setname", ulx.setName, "!setname")
setName:addParam{ type = ULib.cmds.PlayerArg }
setName:addParam{ type = ULib.cmds.StringArg, hint = "name", ULib.cmds.takeRestOfLine }
setName:defaultAccess(ULib.ACCESS_ADMIN)
setName:help("Sets target's Name \n SetName")
