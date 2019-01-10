set title: 'The Evolution Game Clicker!', width: 1024, height: 600

# class MyWindow
class MyWindow < Window
	def initialize
    Image.new('../images/background.png')
    @username = ''
    @is_enter = true
    @input_block = Rectangle.new(x: 0, y: 0,
                                 width: 300, height: 50,
                                 color: '#B0C4DE', z: -1)
    @user_label = Text.new('')
    @username_on_screen = Text.new('')
    draw_user_label
    draw_username_input_place
  end

  def draw_user_label
    @user_label.remove
    @user_label = Text.new(
      'Enter your name to start new game or upload one',
      x: 250, y: 150,
      size: 20,
      color: 'green',
      z: 10
    )
  end

  def draw_username_input_place
    @input_block.remove
    @input_block = Rectangle.new(x: 350, y: 200,
                                 width: 300, height: 50,
                                 color: '#B0C4DE', z: 2)
  end
end