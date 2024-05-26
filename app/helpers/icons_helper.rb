module IconsHelper
  class Icons < Data.define(:view)
    def render(icon, disabled: false)
      view.tag.span view.render("icons/#{icon}"), class: (disabled ? "text-gray-300" : "text-gray-400")
    end
    def method_missing(icon, ...) = render(icon.to_s.dasherize, ...)
  end

  def icons = @icons ||= Icons.new(self)
end
