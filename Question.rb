class Question
  # takes 2 numbers between 1 - 10 and creates an addition question, returns answer
  def self.generate_addition_question
    x = rand(10) + 1
    y = rand(10) + 1
    
    print "What is #{x} + #{y}? "

    return x + y
  end
end