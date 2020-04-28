module Format
  def self.life(num)
    if num == 1
      return 'life'
    end
    return 'lives'
  end

  def self.border(string)
    return "####### #{string} ########"
  end
end