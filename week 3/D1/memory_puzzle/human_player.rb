class HumanPlayer
  def get_input
    puts "enter another position separated by a space"
    gets.chomp.split(" ").map(&:to_i)
  end
end