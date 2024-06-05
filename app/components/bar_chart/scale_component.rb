class BarChart::ScaleComponent < ApplicationComponent
  with_collection_parameter :scale

  def initialize(scale:, window:, ceiling:)
    @scale = scale
    @window = window
    @ceiling = ceiling
  end

  private

  attr_reader :scale, :window, :ceiling

  def offset
    window.height - height
  end

  def height
    ((scale / ceiling.to_f) * window.height).to_i
  end

  def label_spacing
    10
  end
end
