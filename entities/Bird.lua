Class = require 'vendor.class'

Bird = Class{}

function Bird:init()
  self.image = love.graphics.newImage('assets/images/bird.png')
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()

  self.x = WINDOW.VIRTUAL.WIDTH / 2 - (self.width / 2)
  self.y = WINDOW.VIRTUAL.HEIGHT / 2 - (self.height / 2)
end

function Bird:render()
  love.graphics.draw(self.image, self.x, self.y)
end

return Bird
