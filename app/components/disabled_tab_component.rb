class DisabledTabComponent < ApplicationComponent
  def initialize(text:, icon: nil, tooltip: nil)
    @text = text
    @icon = icon
    @tooltip = tooltip
  end

  private

  attr_reader :text, :icon, :tooltip
end
