local PlayerThinkers = {}
local NumThinkers = 0

FTF.addPlayerHook = function(func)
	table.insert(PlayerThinkers, func)
	NumThinkers = $ + 1
end

addHook("PlayerThink",function(p)
	if not FTF.isGamemode() then return end
	if not (p.ftf) then p.ftf = shallowCopy(FTF.objectInfo.player); end
	
	if not (p.mo and p.mo.valid and p.mo.health) then return end
	if (p.spectator) then return end
	if not NumThinkers then return end
	
	for i = 1, NumThinkers
		PlayerThinkers[NumThinkers](p)
	end
end)

local scripts = {
	"Movement.lua",
}

for k, file in ipairs(scripts)
	dofile("Player/Scripts/"..file)
end