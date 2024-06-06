class TailwindBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, :safe_join, to: :@template

  def text_field(method, options={})
    super(method, options.merge(class: "#{options[:class]} #{default_classes}"))
  end

  def number_field(method, options={})
    super(method, options.merge(class: "#{options[:class]} #{default_classes}"))
  end

  def password_field(method, options={})
    super(method, options.merge(class: "#{options[:class]} #{default_classes}"))
  end

  def date_field(method, options={})
    super(method, options.merge(class: "#{options[:class]} #{default_classes}"))
  end

  def text_area(method, options={})
    super(method, options.merge(class: "#{options[:class]} #{default_classes(options)}"))
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    super(method, choices, options, html_options.merge(class: "#{html_options[:class]} #{default_classes}"), &block)
  end

  def date_select(method, options = {}, html_options = {}, &block)
    super(method, options, html_options.merge(class: "#{html_options[:class]} border-gray-300 shadow-inner disabled:bg-gray-100 rounded"), &block)
  end

  private

  def default_classes(options = {})
    default_classes = "w-full border-gray-300 shadow-inner disabled:bg-gray-100"
    default_classes += options[:toolbar] ? " rounded-b flex" : " rounded"
    default_classes
  end
end
