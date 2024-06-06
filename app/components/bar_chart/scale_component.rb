class BarChart::ScaleComponent < ApplicationComponent
  with_collection_parameter :scale

  def initialize(scale:, window:, ceiling:)
    @scale = scale
    @window = window
    @ceiling = ceiling

    @line = Line.new(label_spacing, 0, window.width + label_spacing, 1, "#d1d5db")
    @label = Label.new(label_spacing - 2, 1, "#6b7280", 12)
  end

  private

  attr_reader :scale, :window, :ceiling, :line, :label

  def offset
    window.height - height
  end

  def height
    ((scale / ceiling.to_f) * window.height).to_i
  end

  def label_spacing
    10
  end

  class Line
    def initialize(x, y, width, height, color)
      @x = x
      @y = y
      @width = width
      @height = height
      @color = color
    end

    attr_reader :x, :y, :width, :height, :color
  end

  class Label
    def initialize(x, y, color, size)
      @x = x
      @y = y
      @color = color
      @size = size
    end

    attr_reader :x, :y, :color, :size
  end
end
