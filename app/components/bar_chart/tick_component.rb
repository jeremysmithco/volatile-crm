class BarChart::TickComponent < ApplicationComponent
  DEFAULT_SPACING = 5
  with_collection_parameter :tick

  def initialize(tick:, window:, ceiling:, tick_iteration:)
    @tick = tick
    @window = window
    @ceiling = ceiling
    @tick_iteration = tick_iteration
  end

  private

  attr_reader :tick, :window, :ceiling, :tick_iteration

  def x_offset
    (bar_width + DEFAULT_SPACING) * tick_iteration.index
  end

  def bar_width
    (window.width - ((tick_iteration.size - 1) * DEFAULT_SPACING)) / tick_iteration.size
  end

  def bar_height
    ((tick.count / ceiling.to_f) * window.height).to_i
  end

  def bar
    Bar.new(0, window.height - bar_height, bar_width, bar_height, "#6b7280")
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
end
