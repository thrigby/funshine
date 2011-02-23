require 'rubygems'
require 'gosu'
require 'player'
require 'ball'

class MyGame < Gosu::Window
  def initialize
    super(400, 400, false) #false means don't take up the whole screen
    @player1 = Player.new(self)
    @balls = 2.times.map {Ball.new(self)}
    @bg_image = Gosu::Image.new(self, "images/white.png", true)
    @running = true
  end

  def update
    if @running
      if button_down? Gosu::Button::KbLeft
        @player1.move_left
      end

      if button_down? Gosu::Button::KbRight
        @player1.move_right
      end

      if button_down? Gosu::Button::KbUp
        @player1.move_up
      end

      if button_down? Gosu::Button::KbDown
        @player1.move_down
      end   

      @balls.each {|ball| ball.update} 

      if @player1.hit_by? @balls
        stop_game!
      end
    else
      #the game is currently stopped
      if button_down? Gosu::Button::KbEscape
        restart_game
      end
    end
  end

  def draw
    @bg_image.draw(0, 0, 0)
    @balls.each { |ball| ball.draw }
    @player1.draw
  end

  def stop_game!
    @running = false
  end
  
  def restart_game
    @running = true
    @balls.each { |ball| ball.reset! }
  end

end

window = MyGame.new
window.show