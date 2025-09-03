class AlertComponent < ApplicationComponent
  renders_one :message

  def initialize(type:, title: nil, icon: nil)
    @type, @title, @icon = type, title, icon
  end

  CLASSES = {
    notice: { background: "bg-emerald-200", icon: "text-emerald-700", text: "text-emerald-800" },
    info: { background: "bg-cyan-200", icon: "text-cyan-700", text: "text-cyan-800" },
    warning: { background: "bg-yellow-200", icon: "text-yellow-700", text: "text-yellow-800" },
    alert: { background: "bg-rose-200", icon: "text-rose-700", text: "text-rose-800" }
  }.freeze

  private

  attr_reader :type, :title, :icon

  def color(element)
    CLASSES.dig(type, element)
  end

  def wrapper_classes
    class_names(color(:background), "flex items-center gap-2 p-3 mb-4 rounded-md")
  end

  def icon_classes
    class_names(color(:icon), "flex justify-center p-1", "bg-rose-200 border border-rose-400 rounded opacity-75": debug)
  end

  def title_classes
    class_names(color(:text), "font-semibold p-1", "mb-1 bg-rose-200 border border-rose-400 rounded opacity-75": debug)
  end

  def message_classes
    class_names(color(:text), "p-1 text-sm", "bg-rose-200 border border-rose-400 rounded opacity-75": debug)
  end
end
