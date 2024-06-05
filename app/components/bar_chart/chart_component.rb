class BarChart::ChartComponent < ApplicationComponent
  DEFAULT_CEILING = 50
  DEFAULT_SCALE = 10

  def initialize(ticks:, width: 640, height: 480, background_color: "#ffffff", debug: false)
    @ticks = ticks
    @width = width.to_i
    @height = height.to_i
    @background_color = background_color.to_s
    @debug = debug

    @window = Window.new(chart: self)
    @ceiling = ticks.max_by(&:count)&.count || DEFAULT_CEILING
    @scales = (0..ceiling).step(DEFAULT_SCALE).to_a
  end

  attr_reader :width, :height

  private

  attr_reader :ticks, :background_color, :debug, :window, :ceiling, :scales

  class Window
    SIDE_PROPORTIONS = { top: 1, right: 1, bottom: 2, left: 2.5 }

    def initialize(chart:, margin: 20)
      @chart = chart
      @margin = margin
    end

    attr_reader :margin

    def width
      chart.width - margin_for(:left, :right)
    end

    def height
      chart.height - margin_for(:top, :bottom)
    end

    def y_offset
      margin_for(:top)
    end

    def x_offset
      margin_for(:left)
    end

    def step_offset
      margin_for(:left) - margin
    end

    private

    attr_reader :chart

    def margin_for(*sides)
      (margin * SIDE_PROPORTIONS.values_at(*sides).sum).to_i
    end
  end
end
