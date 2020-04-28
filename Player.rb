class Player
  attr_reader :life, :name

  def initialize(name, life)
    @name = name
    @life = life
  end

  def lose_life # information hiding, encapsulation (OOP term)
    @life -= 1
  end

  def question_handler(expected, answer)
    if expected != answer
      self.lose_life
      return puts "Wrong! #{name}, you lose a life."
    end
    return puts "Correct! #{name}, you keep your #{Format.life(@life)}."
  end
end