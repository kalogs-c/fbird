Pipe = {}
Pipe.__index = Pipe

local PIPE_IMAGE = love.graphics.newImage('assets/images/pipe.png')
local PIPE_SCROLL = -60

function Pipe.new()
  local pipe = {}
  setmetatable(pipe, Pipe)

  pipe.x = WINDOW.VIRTUAL.WIDTH
  pipe.y = math.random(WINDOW.VIRTUAL.HEIGHT / 3, WINDOW.VIRTUAL.HEIGHT - 30)

  pipe.width = PIPE_IMAGE:getWidth()

  return pipe
end

function Pipe:update(dt)
  self.x = self.x + PIPE_SCROLL * dt
end

function Pipe:draw()
  love.graphics.draw(PIPE_IMAGE, self.x, self.y)
end
