module TabNavHelper
  def nav_classes
    "flex justify-between space-x-2 items-start border-b border-gray-400 mb-8"
  end

  def section_classes
    "flex -mb-px space-x-2"
  end

  # Base Tab

  def text_classes(selected)
    class_names("text-gray-500 group-hover:text-gray-600", "font-semibold": selected)
  end

  def icon_svg(icon)
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

  # Disabled Tab

  def disabled_text_classes
    "text-gray-400"
  end

  def disabled_icon_classes
    "text-gray-300"
  end

  def disabled_tab_classes
    tab_classes("#{tab_disabled}": true)
  end

  def tab_disabled
    "border-gray-200 border-b-gray-400 cursor-not-allowed"
  end

  # Dropdown Tab

  def dropdown_wrapper_classes
    "relative"
  end

  def dropdown_caret_svg
    render("icons/chevron-down")
  end

  def dropdown_caret_classes
    "text-gray-400"
  end

  def dropdown_tab_classes(selected)
    tab_classes("h-full", tab_enabled, "#{tab_selected}": selected)
  end

  def dropdown_menu_classes
    class_names(dropdown_hidden_class, "z-40 absolute mt-1 w-60 rounded border border-gray-300 shadow-lg py-1 bg-white divide-y divide-gray-200")
  end

  def dropdown_hidden_class
    "hidden"
  end

  def dropdown_item_classes
    "block w-full text-left py-1.5 px-3 text-gray-500 hover:text-gray-600 hover:bg-gray-50"
  end

  # Link Tab

  def link_tab_classes(selected)
    tab_classes(tab_enabled, "#{tab_selected}": selected)
  end

  def counter_classes(counter, threshold)
    class_names("text-xs leading-none p-1 rounded bg-gray-200 text-gray-600", threshold_classes(counter, threshold))
  end

  def threshold_classes(counter, threshold)
    exceeds_threshold?(counter, threshold) ? "bg-red-200 text-red-600" : "bg-gray-200 text-gray-600"
  end

  def exceeds_threshold?(counter, threshold)
    return false if counter.blank? || threshold.blank?

    counter > threshold
  end
end
