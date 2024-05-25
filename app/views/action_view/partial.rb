$delegate_superclass ||= DelegateClass(ActionView::Base) # Trickery to make reloading work, while hacking on the concept

class ActionView::Partial < $delegate_superclass
  class Context; thread_mattr_accessor :view; end
  def self.view = Context.view
  def view = __getobj__

  def self.render_in(view, &)
    Context.view = view
    new.render(&)
  end

  def initialize = super(Context.view)

  def capture(element = self, &) = super
  singleton_class.delegate :capture, to: :new
end
