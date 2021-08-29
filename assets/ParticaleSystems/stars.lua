--[[
module = {
	{
		system=particleSystem1,
		kickStartSteps=steps1, kickStartDt=dt1, emitAtStart=count1,
		blendMode=blendMode1, shader=shader1,
		texturePreset=preset1, texturePath=path1,
		shaderPath=path1, shaderFilename=filename1
	},
	{ system=particleSystem2, ... },
	...
}
]]
local LG        = love.graphics
local particles = {}

local image1 = LG.newImage("assets/Logo.png")
image1:setFilter("linear", "linear")

local ps = LG.newParticleSystem(image1, 1244)
ps:setColors(0.71608126163483, 0.2651515007019, 1, 0, 1, 0.75378787517548, 0.75378787517548, 1, 0.34848484396935, 0.88154268264771, 1, 0.5, 1, 1, 1, 0)
ps:setDirection(-1.4840580224991)
ps:setEmissionArea("uniform", 800, 600, 0, false)
ps:setEmissionRate(198.75582885742)
ps:setEmitterLifetime(-1)
ps:setInsertMode("bottom")
ps:setLinearAcceleration(0, 0, 0, 0)
ps:setLinearDamping(0, 0)
ps:setOffset(34.067794799805, 19.322034835815)
ps:setParticleLifetime(2.0179927349091, 5.3143892288208)
ps:setRadialAcceleration(0, 0)
ps:setRelativeRotation(false)
ps:setRotation(0, 0)
ps:setSizes(1.5718525648117)
ps:setSizeVariation(0)
ps:setSpeed(0.4852437376976, 0.17468774318695)
ps:setSpin(1.2688204050064, 0)
ps:setSpinVariation(0)
ps:setSpread(2.9974830150604)
ps:setTangentialAcceleration(0, 0)
table.insert(particles, {system=ps, kickStartSteps=10, kickStartDt=0.53143892288208, emitAtStart=134, blendMode="add", shader=nil, texturePath="Logo.png", texturePreset="lightDot", shaderPath="", shaderFilename=""})

return particles
