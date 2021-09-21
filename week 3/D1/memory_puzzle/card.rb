class Card
  attr_reader :face
  attr_accessor :face_up

  def initialize(face)
    @face = face
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def ==(other_card)
    return false if other_card.class != self.class
    @face == other_card.face
  end

  def to_s
    @face.to_s
  end

end