class Player
  attr_accessor :distance
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/btank.png", true)
    @x = 50
    @y = 300
    @distance = 50
  end

  def draw
    @icon.draw(@x, @y, 1)
  end

  def move_left
    if @x < 0
      @x = 5
    else
      @x = @x - 3
    end
  end
  
  def move_right
    if @x > (@game_window.width - 75)
      @x = @game_window.width - 75
    else
      @x = @x + 3
    end
  end

  def move_up
    if @y < 0
      @y = 0
    else
      @y = @y - 3
    end
  end

  def move_down
    if @y > (@game_window.height - 75)
      @y = @game_window.height - 75
    else
      @y = @y + 3
    end  
  end
  
  def hit_by?(balls) 
      balls.any? { |ball| Gosu::distance(@x, @y, ball.x, ball.y) < @distance }
  end
end