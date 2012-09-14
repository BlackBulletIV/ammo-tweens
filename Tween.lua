Tween = class('Tween')

-- METATABLE --

Tween._mt = {}

function Tween._mt:__index(key)
  local result = rawget(self, "_" .. key) or self.class.__instanceDict[key]
  
  if result then
    return result
  elseif key == 'scale' then
    return self._t
  elseif key == 'elapsed' then
    return self._time
  elseif key == 'duration' then
    return self._target
  elseif key == 'percent' then
    return self._time / self._target
  elseif key == 'remaining' then
    return self._target - self._time
  end
end

function Tween._mt:__newindex(key, value)
  if key == 'percent' then
    self._time = self._target * value -- value is a 0 - 1 value
  elseif key == 'duration' then
    if not self.active then
      self._target = value
    end
  else
    rawset(self, key, value)
  end
end

Tween:enableAccessors()

-- METHODS --

function Tween:initialize(duration, ease, complete, ...)
  self.active = false
  self.ease = ease
  self.complete = complete
  self.completeArgs = { ... }
  self._target = duration or 1
  self._time = 0
  self._t = 0
  self:applyAccessors()
end

function Tween:update(dt)
  self._time = self._time + dt
  self._t = self._time / self._target
  
  if self.ease and self._t > 0 and self._t < 1 then
    self._t = self.ease(self._t)
  end
  
  -- are we done?
  if self._time >= self._target then
    self._t = 1
    self._time = self._target
    self:_finish()
    if self.complete then self.complete(unpack(self.completeArgs)) end
  end
end

function Tween:start()
  self.active = true
  return self
end

function Tween:pause()
  self.active = false
  return self
end

function Tween:reset()
  self._time = 0
  self._t = 0
  return self
end

function Tween:stop()
  self:_finish()
  return self:reset()
end

function Tween:_finish()
  self.active = false
  if self._world then self._world:remove(self) end
end
