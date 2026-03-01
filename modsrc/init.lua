rawset(_G,"FTF", {})
FTF.net = {}

freeslot("TOL_FTF")
G_AddGametype({
    name = "Flee The Facility",
    identifier = "FTF",
    typeoflevel = TOL_FTF,
    rules = GTR_SPECTATORS|GTR_DEATHMATCHSTARTS|GTR_SPAWNINVUL|GTR_RESPAWNDELAY,
    intermissiontype = int_match,
    headercolor = 164,
	description = "forsaken release the retro gubbies"
})

local filetree = {
	/*
	[k] = {
		dir = "",
		files = {...}
	}
	*/
}

for k, info in ipairs(filetree)
	for file in ipairs(info.files)
		dofile(info.dir .. file)
	end
end

print("\x82mod loaded")