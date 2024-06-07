class TabNav::BaseTabComponent < ApplicationComponent
  private

  attr_reader :text, :icon, :selected

  def text_classes
    class_names("text-gray-600 group-hover:text-gray-700", "font-semibold": selected)
  end

  def icon_svg
    render("icons/#{icon}")
  end

  def icon_classes
    "text-gray-400 group-hover:text-gray-500"
  end

  def tab_classes(*args)
    class_names(tab_base, *args)
  end

  def tab_base
    "group whitespace-nowrap flex items-center space-x-1 rounded-md rounded-b-none leading-none py-3 px-3 border-b-2"
  end

  def tab_enabled
    "bg-gray-300 hover:bg-gray-400"
  end

  def tab_selected
    "border-b-red-400"
  end

  def tab_unselected
    "border-b-gray-400"
  end
end
