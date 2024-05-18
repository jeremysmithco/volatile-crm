class DropdownTabComponent < ApplicationComponent
  renders_many :items, "DropdownItemComponent"

  def initialize(text:, icon: nil, selected: false)
    @text = text
    @icon = icon
    @selected = selected
  end

  private

  attr_reader :text, :icon, :selected

  class DropdownItemComponent < ViewComponent::Base
    def initialize(text:, link:)
      @text = text
      @link = link
    end

    def call
      link_to text, link, class: "block w-full text-left py-1 px-2 text-gray-500 hover:text-gray-600 hover:bg-gray-50"
    end

    private

    attr_reader :text, :link
  end
end
