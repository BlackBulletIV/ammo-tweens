-- making these locals will make things slighly faster
local tau = math.tau
local b1 = 1 / 2.75
local b2 = 2 / 2.75
local b3 = 1.5 / 2.75
local b4 = 2.5 / 2.75
local b5 = 2.25 / 2.75
local b6 = 2.625 / 2.75

local t = {}

function t.quadIn(t)
  return t * t
end

function t.quadOut(t)
  return -t * (t - 2)
end

function t.quadInOut(t)
  if t <= .5 then
    return t * t * 2
  else
    t = t - 1
    return 1 - t * t * 2
  end
end

function t.cubeIn(t)
  return t * t * t
end

function t.cubeOut(t)
  t = t - 1
  return 1 + t * t * t
end

function t.cubeInOut(t)
  if t <= .5 then
    return t * t * t * 4
  else
    t = t - 1
    return 1 + t * t * t * 4
  end
end

function t.quartIn(t)
  return t * t * t * t
end

function t.quartOut(t)
  t = t - 1
  return 1 - t * t * t * t
end

function t.quartInOut(t)
  if t <= .5 then
    return t * t * t * t * 8
  else
    t = t * 2 - 2
    return (1 - t * t * t * t) / 2 + .5
  end
end

function t.quintIn(t)
  return t * t * t * t * t
end

function t.quintOut(t)
  t = t - 1
  return t * t * t * t * t + 1
end

function t.quintInOut(t)
  t = t * 2
  if t < 1 then
    return (t * t * t * t * t) / 2
  else
    t = t - 2
    return (t * t * t * t * t + 2) / 2
  end
end

function t.sineIn(t)
  return -math.cos(tau / 4 * t) + 1
end

function t.sineOut(t)
  return math.sin(tau / 4 * t)
end

function t.sineInOut(t)
  return -math.cos(tau / 2 * t) / 2 + .5
end

function t.bounceIn(t)
  t = 1 - t
  if t < b1 then return 1 - 7.5625 * t * t end
  if t < b2 then return 1 - (7.5625 * (t - b3) * (t - b3) + .75) end
  if t < b4 then return 1 - (7.5625 * (t - b5) * (t - b5) + .9375) end
  return 1 - (7.5625 * (t - b6) * (t - b6) + .984375)
end

function t.bounceOut(t)
  if t < b1 then return 7.5625 * t * t end
  if t < b2 then return 7.5625 * (t - b3) * (t - b3) + .75 end
  if t < b4 then return 7.5625 * (t - b5) * (t - b5) + .9375 end
  return 7.5625 * (t - b6) * (t - b6) + .984375
end

function t.bounceInOut(t)
  if t < .5 then
    t = 1 - t * 2
    if t < b1 then return (1 - 7.5625 * t * t) / 2 end
    if t < b2 then return (1 - (7.5625 * (t - b3) * (t - b3) + .75)) / 2 end
    if t < b4 then return (1 - (7.5625 * (t - b5) * (t - b5) + .9375)) / 2 end
    return (1 - (7.5625 * (t - b6) * (t - b6) + .984375)) / 2
  else
    t = t * 2 - 1
    if t < b1 then return (7.5625 * t * t) / 2 + .5 end
    if t < b2 then return (7.5625 * (t - b3) * (t - b3) + .75) / 2 + .5 end
    if t < b4 then return (7.5625 * (t - b5) * (t - b5) + .9375) / 2 + .5 end
    return (7.5625 * (t - b6) * (t - b6) + .984375) / 2 + .5
  end
end

function t.circIn(t)
  return -(math.sqrt(1 - t * t) - 1)
end

function t.circOut(t)
  return math.sqrt(1 - (t - 1) * (t - 1))
end

function t.circInOut(t)
  if t <= .5 then
    return (math.sqrt(1 - t * t * 4) - 1) / -2
  else
    return (math.sqrt(1 - (t * 2 - 2) * (t * 2 - 2)) + 1) / 2
  end
end

function t.expoIn(t)
  return math.pow(2, 10 * (t - 1))
end

function t.expoOut(t)
  return -math.pow(2, -10 * t) + 1
end

function t.expoInOut(t)
  if t < .5 then
    return math.pow(2, 10 * (t * 2 - 1)) / 2
  else
    return (-math.pow(2, -10 * (t * 2 - 1)) + 2) / 2
  end
end

function t.backIn(t)
  return t * t * (2.70158 * t - 1.70158)
end

function t.backOut(t)
  t = t - 1
  return 1 - t * t * (-2.70158 * t - 1.70158)
end

function t.backInOut(t)
  t = t * 2
  if t < 1 then return t * t * (2.70158 * t - 1.70158) / 2 end
  t = t - 2
  return (1 - t * t * (-2.70158 * t - 1.70158)) / 2 + .5
end

return t
