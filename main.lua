require 'config'

local Bird = require 'entities.Bird'

local push = require 'vendor.push'

local background = {
  image = love.graphics.newImage('assets/images/background.png'),
  scroll = 0,
  scroll_speed = 30,
  loopingPoint = 413
}

local ground = {
  image = love.graphics.newImage('assets/images/ground.png'),
  scroll = 0,
  scroll_speed = 60,
}

local bird = Bird()

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')
  love.window.setTitle(WINDOW.TITLE)

  push:setupScreen(
    WINDOW.VIRTUAL.WIDTH,
    WINDOW.VIRTUAL.HEIGHT,
    WINDOW.WIDTH,
    WINDOW.HEIGHT,
    {
      vsync = true,
      fullscreen = false,
      resizable = true
    }
  )
end

function love.resize(w, h)
  push:resize(w, h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
  background.scroll = (background.scroll + background.scroll_speed * dt) % background.loopingPoint
  ground.scroll = (ground.scroll + ground.scroll_speed * dt) % WINDOW.VIRTUAL.HEIGHT
end

function love.draw()
    push:start()

    love.graphics.draw(background.image, -background.scroll, 0)
    love.graphics.draw(ground.image, -ground.scroll, WINDOW.VIRTUAL.HEIGHT - 16)

    bird:render()

    push:finish()
end
