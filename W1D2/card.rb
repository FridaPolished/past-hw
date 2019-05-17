class Card
  def initialize(face_value)
    @face_value = face_value
    @revealed = false
  end

  def display
    @face_value if @revealed
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  # attr_reader :face_value
  def to_s 
    @face_value if @revealed
  end

  # attr_reader :revealed
  def revealed?
    @revealed
  end

  # ???
  def ==(card)
    @face_value == card.to_s
  end
end
