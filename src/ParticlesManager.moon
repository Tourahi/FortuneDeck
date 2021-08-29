-- Particle systems manager for systems exported from Hot Particles

import insert from table

PSmanager = {}

with PSmanager
  .init = (folder) =>
    @folder = folder
    @systems = {}
    @requireSystems!

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
      elseif Filesystem.getInfo(fileExt).type == "directory"
        @requireSystems fileExt

  .initOrResetParticle = (Pname) =>
    pdata = @systems[Pname]
    system = pdata.system
    system\reset!

    for _ = 1, pdata.kickStartSteps
      system\update pdata.kickStartDt
    system\emit pdata.emitAtStart

  .startParticle = (Pname) =>
    @systems[Pname].active = true
    @systems[Pname].system\start!

  .stopParticle = (Pname) =>
    @systems[Pname].active = false
    @systems[Pname].system\stop!

  .setActive = (Pname ,a) =>
    @systems[Pname].active = a

  .update = (dt) =>
    for _, pdata in pairs @systems
      if pdata.active
        pdata.system\update dt

   -- pos : {x,y}
  .addParticleSpawnPos = (Pname, pos) =>
    insert @systems[Pname].spawnPositions, pos

  .draw = =>
    Graphics.push!
    for _, pdata in pairs @systems
      sys = pdata.system
      Graphics.setBlendMode pdata.blendMode
      Graphics.setShader pdata.shader
      for _, pos in ipairs pdata.spawnPositions
        Graphics.draw sys, pos.x, pos.y
    Graphics.pop!









return PSmanager
