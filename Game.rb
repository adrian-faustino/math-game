class Game
  attr_accessor :player1, :player2, :current_player, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @winner = nil
    @current_player = player1
  end

  def change_current_player
    if self.current_player == @player1
      self.current_player = @player2
    elsif self.current_player == @player2
      self.current_player = @player1
    end
  end

  def display_lives
    # format for plural vs singular "life"
    p1_format = Format.life(@player1.life)
    p2_format = Format.life(@player2.life)

    puts "\n" + Format.border('Score')
    puts "#{player1.name}: #{player1.life} #{p1_format} <===> #{player2.name}: #{player2.life} #{p2_format}"
  end

  def start
    puts Format.border('New Game') + "\n"

    # main game loop
    while @winner == nil
      puts "\n" + Format.border('New Turn')
      puts "#{current_player.name}, it's your turn!"

      # generate question and calc life
      expected = Question.generate_addition_question
      user_answer = gets.to_i 
      current_player.question_handler(expected, user_answer)
    
      # winner check
      if current_player.life == 0
        self.change_current_player()
        @winner = current_player
        break
      end

      # display life
      self.display_lives()

      # change turn
      self.change_current_player()
    end

    # game over
    puts "\n" + Format.border('Game over')
    puts "#{current_player.name} wins wtih #{current_player.life} #{Format.life(current_player.life)}."
  end
end