local base = MeowC.base;
local class = require(base .. ".src.libs.30log");

local Timer = class("Timer", {
  time,
  onDone,
  duration
});


Timer.init = function(self, duration, onDone)
  self.time = 0;
  self.onDone = onDone;
  self.duration = duration;
end

Timer.ticks = function(frames)
  return frames * (1/ love.timer.getFPS());
end

Timer.tick = function(self, owner, dt)
  self.time = self.time + (1 * dt);
  if self.time >= self.duration then
    self:onDone(owner);
    owner.timer = nil;
  end
end

return Timer;
