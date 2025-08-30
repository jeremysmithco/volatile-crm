class PageLayouts::BasicComponent < ApplicationComponent
  renders_one :parent, ->(title:, link:) do
    safe_join([
      link_to(title, link, class: "text-cyan-500"),
      tag.div(render("icons/divider"), class: divider_classes)
    ])
  end

  renders_one :action
  renders_one :body

  def initialize(title:, debug: false)
    @title, @debug = title, debug
  end

  private

  attr_reader :title, :debug

  def wrapper_classes
    "bg-white p-4 rounded-md mb-10"
  end

  def header_classes
    "flex justify-between items-stretch gap-2 pb-2 border-b-2 border-b-gray-200 mb-4"
  end

  def title_classes
    class_names("flex items-center grow p-2 text-lg leading-none font-semibold", "bg-rose-100 border border-rose-400 rounded": debug)
  end

  def divider_classes
    "text-gray-300"
  end

  def action_classes
    class_names("flex grow justify-end p-2 gap-2", "bg-rose-100 border border-rose-400 rounded": debug)
  end

  def body_classes
    class_names("p-2", "bg-rose-100 border border-rose-400 rounded": debug)
  end
end
