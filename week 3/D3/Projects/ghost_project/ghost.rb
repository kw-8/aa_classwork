require "set"


class Game
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @fragment = ""
    @dictionary = Set.new
  end

  
  
end

file = File.open("./dictionary.txt")
p results = file.readlines.map(&:chomp).to_set # convert txt list to array of words (dictionary)




