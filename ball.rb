class Ball
  attr_accessor :reset_counter
  def initialize(game_window)
    @game_window = game_window
    @ball = Gosu::Image.new(@game_window, "images/seal.png", true)
    @reset_counter = 1
    @boss_level = false
    reset!
  end
  
  def update
    if @y > @game_window.height
     reset!
    else  
      @y = @y + 3
    end
  end
    
  def draw
      @ball.draw(@x, @y, 2)
  end
  
  def x
    @x
  end
  
  def y
    @y
  end
  
  def reset!
    @x = rand(@game_window.width)
    @y = 0
    @reset_counter += 1
    check_boss
  end
  
  def check_boss
    if @reset_counter == 5
      boss_attack
      @reset_counter = 1
    end
  end
  
  def boss_attack
    @boss_level = true
    @ball = Gosu::Image.new(@game_window, "images/cow.png", true)
  end
  
   
end  
  