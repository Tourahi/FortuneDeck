-- Particle systems manager for systems exported from Hot Particles

import insert from table

PSmanager = {}

Timer = MeowC.core.Timer

with PSmanager
  .init = (folder) =>
    @folder = folder
    @systems = {}
    @requireSystems!
    @activatedSystems = {}


  .requireSystems = (fldr = nil) =>
    folder = fldr or @folder
    items = Filesystem.getDirectoryItems folder
    print folder
    -- Dump Filesystem.getDirectoryItems folder
    for _, item in ipairs items
      f = Utils.getFileName item
      fileExt = folder .. "/" .. item
      file = folder .. "/" .. f
      if Filesystem.getInfo(fileExt).type == "file"
        if Utils.getFileExtention(item) == 'lua'
          name = Utils.getFileName item
          @systems[name] = assert require(file)[1]
          with @systems[name]
            .spawnPositions = {}
            .active = false
            .followMouse = false
            .texturePath = nil
            .system\stop!
            .active = false
            .timer = nil
      elseif Filesystem.getInfo(fileExt).type == "directory"
        @requireSystems fileExt

  .kickstart = (Pname) =>
    pdata = @systems[Pname]
    system = pdata.system
    system\start!

    for _ = 1, pdata.kickStartSteps
      system\update pdata.kickStartDt
    system\emit pdata.emitAtStart


  .setArea = (Pname, dist, dx, dy, ang, drc) =>
    pdata = @systems[Pname]
    system = pdata.system
    system\setEmissionArea dist, dx, dy, ang, drc


  .reset = (Pname) =>
    pdata = @systems[Pname]
    system = pdata.system
    system\start!

    for _ = 1, pdata.kickStartSteps
      system\update pdata.kickStartDt
    system\emit pdata.emitAtStart

  .start = (Pname) =>
    @systems[Pname].system\start!

  .stop = (Pname) =>
    @systems[Pname].system\stop!
    @deactivateTimer Pname

  .update = (dt) =>
    for _, pdata in pairs @systems
      if pdata.timer
        pdata.timer.tick pdata.timer, pdata,  dt
      if pdata.active
        pdata.system\update dt

  .setActive = (Pname, a) =>
    @systems[Pname].active = a

   -- pos : {x,y}
  .addParticleSpawnPos = (Pname, pos) =>
    insert @systems[Pname].spawnPositions, pos

  .deactivateTimer = (Pname) =>
    @systems[Pname].timer = Timer.create Timer.ticks(5.5), (owner, dt) ->
      @systems[Pname].active = false
      @systems[Pname].timer = nil
      Log.debug @systems[Pname].active == false

  .draw = =>
    r, g, b, a = Graphics.getColor!
    bMode = Graphics.getBlendMode!
    shader = Graphics.getShader!
    Graphics.push!
    for _, pdata in pairs @systems
      if pdata.active
        sys = pdata.system
        Graphics.setBlendMode pdata.blendMode
        Graphics.setShader pdata.shader
        for _, pos in ipairs pdata.spawnPositions
          Graphics.draw sys, pos.x, pos.y
    Graphics.pop!
    Graphics.setColor r, g, b, a
    Graphics.setBlendMode bMode
    Graphics.setShader shader


return PSmanager
