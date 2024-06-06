class AlertComponent < ApplicationComponent
  CLASSES = {
    notice: { background: "bg-emerald-200", icon: "text-emerald-700", text: "text-emerald-800" },
    info: { background: "bg-cyan-200", icon: "text-cyan-700", text: "text-cyan-800" },
    warning: { background: "bg-yellow-200", icon: "text-yellow-700", text: "text-yellow-800" },
    alert: { background: "bg-rose-200", icon: "text-rose-700", text: "text-rose-800" }
  }.freeze

  renders_one :message

  def initialize(type:, title: nil, icon: nil)
    @type = type
    @title = title
    @icon = icon
  end

  def color(element)
    CLASSES.dig(type, element)
  end

  private

  attr_reader :type, :title, :icon
end
