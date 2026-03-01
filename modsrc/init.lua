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
	[1] = {
		dir = "Lib",
		files = {
			"math.lua",
			"shallowCopy.lua",
		}
	},
	[2] = {
		dir = "Funcs",
		files = {
			"isGamemode.lua",
		}
	},
	
	[3] = {
		dir = "Game",
		files = {
			"",
		}
	},
	
	[4] = {
		dir = "Player",
		files = {
			"main.lua",
			"initPlayer.lua",
		}
	}
}

for k, info in ipairs(filetree)
	for _, file in ipairs(info.files)
		if file == "" then continue end
		dofile(info.dir .."/".. file)
	end
end

print("\x82mod loaded")