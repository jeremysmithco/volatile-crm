class PageLayouts::BasicComponent < ApplicationComponent
  renders_one :action
  renders_one :body

  def initialize(title:, parent_title: nil, parent_link: nil)
    @title = title

    @parent = Parent.new(parent_title, parent_link) if parent_title.present?
  end

  private

  attr_reader :title, :parent

  class Parent
    def initialize(title, link)
      @title = title
      @link = link
    end

    attr_reader :title, :link
  end
end
