class LinkTabComponent < ApplicationComponent
  def initialize(text:, link:, selected: false, icon: nil, count: nil)
    @text = text
    @link = link
    @selected = selected
    @icon = icon
    @count = count
  end

  private

  attr_reader :text, :link, :selected, :icon, :count
end
