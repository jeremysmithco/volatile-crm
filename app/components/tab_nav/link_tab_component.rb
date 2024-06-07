class TabNav::LinkTabComponent < TabNav::BaseTabComponent
  def initialize(link:, text:, icon: nil, selected: false, counter: nil, threshold: nil)
    @link = link
    @text = text
    @icon = icon
    @selected = selected
    @counter = counter
    @threshold = threshold
  end

  private

  attr_reader :link, :counter, :threshold

  def tab_classes
    super(tab_enabled, "#{tab_selected}": selected, "#{tab_unselected}": !selected)
  end

  def counter_classes
    class_names("text-xs leading-none p-1 rounded-md", threshold_classes)
  end

  def threshold_classes
    exceeds_threshold? ? "bg-red-50 text-red-600" : "bg-gray-50 text-gray-600"
  end

  def exceeds_threshold?
    return false if counter.blank? || threshold.blank?

    counter > threshold
  end
end
