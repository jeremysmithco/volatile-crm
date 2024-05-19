class TabNav::BaseTabComponent < ApplicationComponent
  private

  attr_reader :text, :icon, :selected

  def text_classes
    class_names("text-gray-500 group-hover:text-gray-600", "font-semibold": selected)
  end

  def icon_svg
    render("icons/#{icon}")
  end

  def icon_classes
    "text-gray-400"
  end

  def tab_classes(*args)
    class_names(tab_base, *args)
  end

  def tab_base
    "group whitespace-nowrap flex items-center space-x-1 rounded rounded-b-none leading-none py-3 px-3 border"
  end

  def tab_enabled
    "border-gray-300 border-b-gray-400 hover:bg-gray-50"
  end

  def tab_selected
    "border-b-2 border-b-red-400"
  end
end
