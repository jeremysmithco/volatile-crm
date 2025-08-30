class ChartsController < ApplicationController
  Tick = Data.define(:label, :count)

  def index
    day_range = Range.new(1, Time.days_in_month(Date.current.month))
    @ticks = day_range.to_a.map { |day| Tick.new(label: day, count: rand(0..125)) }
  end
end
