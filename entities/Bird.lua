Bird = {}
Bird.__index = Bird

local GRAVITY = 10

function Bird.new()
  local bird = {}
  setmetatable(bird, Bird)

  bird.image = love.graphics.newImage('assets/images/bird.png')
  bird.width = bird.image:getWidth()
  bird.height = bird.image:getHeight()

  bird.x = WINDOW.VIRTUAL.WIDTH / 2 - (bird.width / 2)
  bird.y = WINDOW.VIRTUAL.HEIGHT / 2 - (bird.height / 2)

  bird.dy = 0

  return bird
end

function Bird:update(dt)
  self.dy = self.dy + GRAVITY * dt

  if love.keyboard.wasPressed('space') then
    self.dy = -2.5
  end

  self.y = self.y + self.dy
end

function Bird:draw()
  love.graphics.draw(self.image, self.x, self.y)
end
