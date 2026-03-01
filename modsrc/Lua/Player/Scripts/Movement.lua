FTF.addPlayerHook(function(p)
	local baseskin = skins["sonic"]
	local ff = p.ftf
	local me = p.realmo
	
	p.normalspeed = 15*FU
	p.runspeed = 100*FU
	
	p.jumpfactor = FU
	p.charability = CA_NONE
	p.charability2 = CA2_NONE
	p.charflags = $|SF_NOJUMPSPIN &~(SF_DASHMODE|SF_MULTIABILITY|SF_RUNONWATER|SF_SUPER)
	p.acceleration = baseskin.acceleration
	p.accelstart = baseskin.accelstart
	
	if ff.beast then return end
	
	local wascrouching = ff.crouching
	local toosmall = (me.ceilingz - me.floorz) <= P_GetPlayerSpinHeight(p)
	ff.crouching = false
	
	if ((p.cmd.buttons & BT_SPIN)
	and P_IsObjectOnGround(me))
	or (toosmall and wascrouching)
		me.state = S_PLAY_ROLL
		p.normalspeed = $ / 2
		
		ff.crouching = true
	elseif (me.state == S_PLAY_ROLL)
		me.state = (P_IsObjectOnGround(me)) and S_PLAY_WALK or S_PLAY_SPRING
		if toosmall or (p.pflags & PF_SPINNING)
			me.state = S_PLAY_ROLL
		else
			P_MovePlayer(p)
		end
	end
end)

addHook("PlayerCanEnterSpinGaps",function(p)
	if not FTF.isGamemode() then return end
	if not (p.ftf) then return end
	if p.ftf.beast then return end
	if not p.ftf.crouching then return end
	
	return (p.mo.state == S_PLAY_ROLL)
end)