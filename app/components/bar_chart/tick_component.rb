class BarChart::TickComponent < ApplicationComponent
  DEFAULT_SPACING = 5
  with_collection_parameter :tick

  def initialize(tick:, window:, ceiling:, tick_iteration:)
    @tick = tick
    @window = window
    @ceiling = ceiling
    @tick_iteration = tick_iteration

    @bar = Bar.new(0, bar_offset, bar_width, bar_height, "#6b7280")
    @label = Label.new(bar.width / 2, window.height + 20, "#6b7280", 12)
  end

  private

  attr_reader :tick, :window, :ceiling, :tick_iteration, :bar, :label

  def x_offset
    (bar_width + DEFAULT_SPACING) * tick_iteration.index
  end

  def bar_offset
    window.height - bar_height
  end

  def bar_width
    (window.width - total_spacing) / tick_iteration.size
  end

  def total_spacing
    (tick_iteration.size - 1) * DEFAULT_SPACING
  end

  def bar_height
    ((tick.count / ceiling.to_f) * window.height).to_i
  end

  class Bar
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
