class ChartsController < ApplicationController
  Tick = Data.define(:label, :count)

  def index
    @ticks = [
      Tick.new(label: "1", count: 54),
      Tick.new(label: "2", count: 95),
      Tick.new(label: "3", count: 45),
      Tick.new(label: "4", count: 22),
      Tick.new(label: "5", count: 17),
      Tick.new(label: "6", count: 76),
      Tick.new(label: "7", count: 83),
      Tick.new(label: "8", count: 113),
      Tick.new(label: "9", count: 93),
      Tick.new(label: "10", count: 11),
      Tick.new(label: "11", count: 52),
      Tick.new(label: "12", count: 24),
      Tick.new(label: "13", count: 38),
      Tick.new(label: "14", count: 16),
      Tick.new(label: "15", count: 92),
      Tick.new(label: "16", count: 28),
      Tick.new(label: "17", count: 57),
      Tick.new(label: "18", count: 72),
      Tick.new(label: "19", count: 50),
      Tick.new(label: "20", count: 48),
      Tick.new(label: "21", count: 29),
      Tick.new(label: "22", count: 81),
      Tick.new(label: "23", count: 95),
      Tick.new(label: "24", count: 25),
      Tick.new(label: "25", count: 72),
      Tick.new(label: "26", count: 13),
      Tick.new(label: "27", count: 42),
      Tick.new(label: "28", count: 93),
      Tick.new(label: "29", count: 48),
      Tick.new(label: "30", count: 73),
      Tick.new(label: "31", count: 65),
    ]
  end
end
