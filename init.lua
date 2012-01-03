local path = ({...})[1]:gsub("%.init", "")
require(path .. ".Tween")
require(path .. ".AttrTween")
require(path .. ".ease")

function Entity:animate(duration, t)
  if not ammo._world then return end
  
  local ease = t.ease
  local onComplete = t.onComplete
  t.ease = nil
  t.onComplete = nil
  
  local tween = AttrTween:new(self, duration, t, Tween.ONESHOT, onComplete, ease)
  local world = self._world or ammo._world
  world:add(tween)
  return tween:start()
end

function delay(secs, func)
  if not ammo._world then return end
  local t = Tween:new(secs, Tween.ONESHOT, func)
  ammo._world:add(t)
  return t:start()
end

function tween(obj, duration, t)
  if not ammo._world then return end
  
  local ease = t.ease
  local onComplete = t.onComplete
  t.ease = nil
  t.onComplete = nil
  
  local t = AttrTween:new(obj, duration, t, Tween.ONESHOT, onComplete, ease)
  ammo._world:add(t)
  return t:start()
end
