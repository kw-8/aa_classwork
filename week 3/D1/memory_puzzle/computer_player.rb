class ComputerPlayer
  def initialize(size)
    @not_yet_seen = []
    (0...size).each do |i|
      (0...size).each do |j|
        @not_yet_seen << [i, j]
      end
    end
    @grid_hash = Hash.new(0)
  end

  def get_input #{'a'=> [],[]
                # 'b'=> []}
    if @grid_hash.values.map(&:length).include?(2)

    end
  end
end