module IconsHelper
  class Icons < ActionView::Partial
    def method_missing(icon) = render(icon.to_s.dasherize)
    def render(icon) = super("icons/#{icon}")
  end

  def icons = @icons ||= Icons.new
end
