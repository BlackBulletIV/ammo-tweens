function delay(secs, func)
  if not ammo._world then return end
  local t = Tween:new(secs, nil, func)
  ammo._world:add(t)
  return t:start()
end

function tween(obj, duration, t)
  if not ammo._world then return end
  
  local ease = t.ease
  local onComplete = t.onComplete
  t.ease = nil
  t.onComplete = nil
  
  local tween = AttrTween:new(obj, duration, t, ease, onComplete)
  ammo._world:add(tween)
  return tween:start()
end

function Entity:animate(duration, t)
  if not ammo._world then return end
  
  local ease = t.ease
  local onComplete = t.onComplete
  t.ease = nil
  t.onComplete = nil
  
  local tween = AttrTween:new(self, duration, t, ease, onComplete)
  local world = self._world or ammo._world
  world:add(tween)
  return tween:start()
end
