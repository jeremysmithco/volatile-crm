module TabNavHelper
  def tab_nav_nav_classes
    "flex justify-between space-x-2 items-start border-b border-gray-400 mb-8"
  end

  def tab_nav_section_classes
    "flex -mb-px space-x-2"
  end

  def tab_nav_text_classes(selected: false, disabled: false)
    class_names(
      "text-gray-500 group-hover:text-gray-600": !disabled,
      "font-semibold": selected,
      "text-gray-400": disabled
    )
  end

  def tab_nav_icon_svg(icon)
    render("icons/#{icon}")
  end

  def tab_nav_icon_classes(disabled: false)
    disabled ? "text-gray-300" : "text-gray-400"
  end

  def tab_nav_tab_classes(selected: false, disabled: false, dropdown: false)
    class_names(
      "group whitespace-nowrap flex items-center space-x-1 rounded rounded-b-none leading-none py-3 px-3 border",
      "h-full": dropdown,
      "border-gray-300 border-b-gray-400 hover:bg-gray-50": !disabled,
      "border-gray-200 border-b-gray-400 cursor-not-allowed": disabled,
      "border-b-2 border-b-red-400": selected
    )
  end

  def tab_nav_dropdown_wrapper_classes
    "relative"
  end

  def tab_nav_dropdown_caret_svg
    render("icons/chevron-down")
  end

  def tab_nav_dropdown_caret_classes
    "text-gray-400"
  end

  def tab_nav_dropdown_menu_classes
    class_names(
      tab_nav_dropdown_hidden_class,
      "z-40 absolute mt-1 w-60 rounded border border-gray-300 shadow-lg py-1 bg-white divide-y divide-gray-200"
    )
  end

  def tab_nav_dropdown_hidden_class
    "hidden"
  end

  def tab_nav_dropdown_item_classes
    "block w-full text-left py-1.5 px-3 text-gray-500 hover:text-gray-600 hover:bg-gray-50"
  end

  def tab_nav_counter_classes(counter, threshold)
    class_names(
      "text-xs leading-none p-1 rounded bg-gray-200 text-gray-600",
      tab_nav_threshold_classes(counter, threshold)
    )
  end

  def tab_nav_threshold_classes(counter, threshold)
    tab_nav_exceeds_threshold?(counter, threshold) ? "bg-red-200 text-red-600" : "bg-gray-200 text-gray-600"
  end

  def tab_nav_exceeds_threshold?(counter, threshold)
    return false if counter.blank? || threshold.blank?

    counter > threshold
  end
end
