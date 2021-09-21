require_relative "card.rb"

class Board
  def initialize(size)
    @grid = Array.new(size){Array.new(size){'_'}}
    @size = size
  end

  def populate
    card_types = ("a".."z").to_a + ("A".."Z").to_a
    num_pairs = @size * @size / 2
    while num_pairs > 0
      new_card_type = card_types.sample # a random character
      card_types.delete(new_card_type)
      populate_pair(new_card_type)
      num_pairs -= 1
    end
  end

  def populate_pair(new_card_type)
    i = 0
    while i < 2
      row = rand(0...@size)
      col = rand(0...@size)
      if @grid[row][col] == '_'
        @grid[row][col] = Card.new(new_card_type)
        i += 1
      end
    end
  end

  def render
    @grid.each {|row| puts row.map(&:to_s).join(" ")}
  end

  def board_print
    @grid.each do |row|
      puts row.map{|card| card.face_up ? card.to_s : "*"}.join(" ")
    end
  end

  def won?
    @grid.all? {|row| row.all?{|card| card.face_up == true}}
  end

  def reveal(guessed_pos)
    row = guessed_pos[0]
    col = guessed_pos[1]
    if @grid[row][col].face_up == false
      #print @grid[row][col].to_s
      return @grid[row][col].to_s
    end
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end
end