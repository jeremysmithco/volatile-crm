class TabNav::LinkTabComponent < TabNav::BaseTabComponent
  def initialize(link:, text:, icon: nil, selected: false, counter: nil)
    @link = link
    @text = text
    @icon = icon
    @selected = selected
    @counter = counter
  end

  private

  attr_reader :link

  def tab_classes
    super(tab_enabled, "#{tab_selected}": selected)
  end
end
