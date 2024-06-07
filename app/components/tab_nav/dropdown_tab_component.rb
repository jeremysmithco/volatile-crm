class TabNav::DropdownTabComponent < TabNav::BaseTabComponent
  renders_many :items, "DropdownItemComponent"

  def initialize(text:, icon: nil, selected: false)
    @text = text
    @icon = icon
    @selected = selected
  end

  private

  def wrapper_classes
    "relative"
  end

  def caret_svg
    render("icons/chevron-down")
  end

  def caret_classes
    "text-gray-600 group-hover:text-gray-700"
  end

  def tab_classes
    super("h-full", tab_enabled, "#{tab_selected}": selected, "#{tab_unselected}": !selected)
  end

  def menu_classes
    class_names(hidden_class, "z-40 absolute mt-1 w-60 rounded-md border-2 border-gray-300 shadow-lg py-1 bg-gray-200 divide-y divide-gray-200")
  end

  def hidden_class
    "hidden"
  end

  class DropdownItemComponent < ApplicationComponent
    def initialize(text:, link:)
      @text = text
      @link = link
    end

    def call
      link_to text, link, class: "block w-full text-left py-1.5 px-3 text-gray-500 hover:text-gray-600 hover:bg-gray-300"
    end

    private

    attr_reader :text, :link
  end
end
