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
    @hello_text = Text.new('')
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

  def show_input_name
    @username_on_screen.remove
    @username_on_screen = Text.new(
      @username,
      x: 355, y: 223,
      size: 15,
      color: '#2F4F4F',
      z: 10
    )
  end

  def init_game
    draw_hello_label
    @user_label.remove
    @username_on_screen.remove
    @input_block.remove
    draw_background
    draw_click_label
    draw_statistic_label
    draw_dna_label
    draw_dna_image
    draw_save_button
  end

  def draw_hello_label
    @hello_text.remove
    @hello_text = Text.new(
      'Welcome, ' + @username + '!',
      x: 685, y: 10,
      size: 30,
      color: '#B0C4DE',
      z: 10
    )
  end

  def draw_background
    Image.new('../images/background.png')
    Line.new(
      x1: 585, y1: 0,
      x2: 585, y2: 600,
      width: 5,
      color: '#33CCCC',
      z: 0
    )
  end

  def draw_click_label
    Text.new(
      'Click on me to upgrade faster!',
      x: 80, y: 480,
      size: 25,
      color: '#B0C4DE',
      z: 10
    )
  end

  def draw_statistic_label
    Text.new(
      'Now you have: ',
      x: 650, y: 235,
      size: 40,
      color: '#B0C4DE',
      z: 10
    )
  end

  def draw_dna_label
    Text.new(
      'DNA',
      x: 768, y: 340,
      size: 20,
      color: '#B0C4DE',
      z: 10
    )
  end

  def draw_dna_image
    Image.new(
      '../images/dna.png',
      x: 705, y: 300,
      width: 70, height: 70,
      z: 10
    )
  end


end