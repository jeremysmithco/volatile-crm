module IconsHelper
  class Icons < ActionView::Partial
    def render(icon, disabled: false)
      tag.span super("icons/#{icon}"), class: (disabled ? "text-gray-300" : "text-gray-400")
    end
    def method_missing(icon, ...) = render(icon.to_s.dasherize, ...)
  end

  def icons = @icons ||= Icons.new
end
