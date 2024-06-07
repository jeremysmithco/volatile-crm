class TabNav::DisabledTabComponent < TabNav::BaseTabComponent
  def initialize(text:, icon: nil, tooltip: nil)
    @text = text
    @icon = icon
    @tooltip = tooltip
  end

  private

  attr_reader :tooltip

  def text_classes
    "text-gray-400"
  end

  def icon_classes
    "text-gray-300"
  end

  def tab_classes
    super("#{tab_disabled}": true, "#{tab_unselected}": true)
  end

  def tab_disabled
    "bg-gray-100 cursor-not-allowed"
  end
end
