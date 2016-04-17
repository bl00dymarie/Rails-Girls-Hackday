#zuerst gosu installieren
#gem install gosu

require 'gosu'#gosu ist die library für game development
class GameWindow < Gosu::Window#einrichten vom einem Spielefenster, greifen dabei auf gosu window zurück
  def initialize
    super 1200, 800#, :fullscreen => true #definieren hiermit die größe des fensters
    #alternativ für fullscreen
    self.caption = "Gosu Luca Playground" #self bezieht sich auf GameWindow, name des fensters
    @background_image = Gosu::Image.new("C:\\Users\\User\\Desktop\\coco.jpg")
    @player = Spielerin.new
    @precious = Precious.new
    @precious1 = Precious.new
    @precious2 = Precious.new
    @precious3 = Precious.new
    @precious4 = Precious.new
  end#beenden def initialize

  def update
    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
      @player.turn_left
    end
    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
      @player.turn_right
    end
    if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 then
      @player.go_up
    end
    if Gosu::button_down? Gosu::KbDown or Gosu::button_down? Gosu::GpButton1 then
      @player.go_down
    end
    if @player.x == @precious.x and @player.y == @precious.y
      @precious.delete
    end
    if @player.x == @precious1.x and @player.y == @precious1.y
      @precious1.delete
    end
    if @player.x == @precious2.x and @player.y == @precious2.y
      @precious2.delete
    end
    if @player.x == @precious3.x and @player.y == @precious3.y
      @precious3.delete
    end
    if @player.x == @precious4.x and @player.y == @precious4.y
      @precious4.delete
    end
  end

  def draw
    @player.draw
    @background_image.draw(0, 0, 0)
    @precious.draw
    @precious1.draw
    @precious2.draw
    @precious3.draw
    @precious4.draw
  end
end#beenden class

class Spielerin
  attr_reader :x, :y
  def initialize
@image = Gosu::Image.new("C:\\Users\\User\\Desktop\\precious.vulva.JPG")
    @x = @y = 0.0
  end
  def turn_left
    @x = @x-1
  end
  def turn_right
    @x = @x+1
  end
  def go_up
    @y = @y-1
  end
  def go_down
    @y = @y+1
  end
  def draw
    @image.draw(@x, @y, 1, 0.5, 0.5)
  end
end

class Precious
  attr_reader :x, :y
  def initialize
    @image = Gosu::Image.new("C:\\Users\\User\\Desktop\\elpapa.JPG")
    @x = rand(640-50)
    @y = rand(480-50)
    @alive = true
  end
  def draw
    if @alive
      @image.draw(@x, @y, 1, 0.03, 0.03)
    end
  end
  def delete
    @alive = false
  end
end

window = GameWindow.new
window.show #anzeigen was bisher passiert ist
