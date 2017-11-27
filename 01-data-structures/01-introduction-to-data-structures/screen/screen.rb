require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = []

  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if inbounds(x, y)
      pixel.x = x
      pixel.y = y
      @matrix.push(pixel)
    end
  end

  def at(x, y)
    if inbounds(x, y)
      @matrix.each do |pixel|
        if pixel.x == x && pixel.y == y
          return pixel
        end
      end
    else
      nil
    end
  end

  private

  def inbounds(x, y)
      if x.between?(0, width) && y.between?(0, height)
        true
      else
        false
      end
  end

end
