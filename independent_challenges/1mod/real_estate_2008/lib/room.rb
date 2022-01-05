class Room
  attr_reader :category, :length, :width, :area

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width.to_i
    @is_painted = false
    @area = area
  end

  def area
   @area = "#{@width.to_i * @length}".to_i
  end

  def is_painted?
   @is_painted
  end

  def paint
   @is_painted = true
  end
end
