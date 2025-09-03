class PageLayouts::BasicComponent < ApplicationComponent
  renders_one :parent, ->(title:, link:) do
    safe_join([
      link_to(title, link, class: "text-cyan-500"),
      tag.div(render("icons/divider"), class: divider_classes)
    ])
  end

  renders_many :actions, types: {
    link: "LinkActionComponent", button: "ButtonActionComponent"
  }

  renders_one :body

  def initialize(title:)
    @title = title
  end

  private

  attr_reader :title

  def wrapper_classes
    "bg-white p-4 rounded-md mb-10"
  end

  def header_classes
    "flex justify-between items-stretch gap-2 pb-2 border-b-2 border-b-gray-200 mb-4"
  end

  def title_classes
    class_names("flex items-center grow p-2 text-lg leading-none font-semibold", "bg-rose-200 border border-rose-400 rounded opacity-75": debug)
  end

  def divider_classes
    "text-gray-300"
  end

  def action_classes
    class_names("flex grow justify-end p-2 gap-2", "bg-rose-200 border border-rose-400 rounded opacity-75": debug)
  end

  def body_classes
    class_names("p-2", "bg-rose-200 border border-rose-400 rounded opacity-75": debug)
  end

  class LinkActionComponent < ApplicationComponent
    def initialize(text:, path:, colors: "bg-cyan-500 hover:bg-cyan-700")
      @text, @path, @colors = text, path, colors
    end

    def call
      link_to(text, path, class: "block px-3 py-1 text-white rounded-md cursor-pointer #{colors}")
    end

    private

    attr_reader :text, :path, :colors
  end

  class ButtonActionComponent < ApplicationComponent
    def initialize(text:, path:, method: :post, colors: "bg-cyan-500 hover:bg-cyan-700")
      @text, @path, @method, @colors = text, path, method, colors
    end

    def call
      button_to(text, path, method: method, class: "block px-3 py-1 text-white rounded-md cursor-pointer #{colors}")
    end

    private

    attr_reader :text, :path, :method, :colors
  end
end
