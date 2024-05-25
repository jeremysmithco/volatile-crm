class TabNav::Bar < Struct.new(:view)
  def self.render_in(view, &) = new(view).render(&)

  def render(&)
    view.render "tab_nav/bar", tabs: view.capture(self, &), extra:
  end
  def extra(&) = @extra ||= view.capture(&)

  def link_tab(text, link, selected: view.current_page?(link), icon:, counter: nil, threshold: nil)
    partial __method__, tab: tab_for(text:, selected:, icon:), link:,
      counter: (Counter.new(view, counter, threshold) if counter)
  end

  def disabled_tab(text, icon:, tooltip:)
    partial __method__, tab: tab_for(text:, icon:, disabled: true), tooltip:
  end

  def dropdown_tab(text, selected: false, icon:, &)
    items = view.capture(Dropdown.new(view), &)
    partial __method__, tab: tab_for(text:, selected:, icon:), items:
  end

  private
    def partial(key, **) = view.render("tab_nav/#{key}", **)
    def tab_for(**) = Tab.new(view:, **)

    class Tab < Data.define(:view, :text, :icon, :disabled, :selected)
      alias disabled? disabled
      alias selected? selected
      def initialize(view:, text:, icon: nil, disabled: false, selected: false) = super

      def classes
        view.class_names(
          "group whitespace-nowrap flex items-center space-x-1 rounded rounded-b-none leading-none py-3 px-3 border",
          "border-gray-300 border-b-gray-400 hover:bg-gray-50":  !disabled?,
          "border-gray-200 border-b-gray-400 cursor-not-allowed": disabled?,
          "border-b-2 border-b-red-400": selected?
        )
      end

      def icon
        super&.then { view.icons.render(_1, disabled:) }
      end

      def text(**)
        view.tag.span(super(), class: ["text-gray-500 group-hover:text-gray-600", "font-semibold": selected?], **)
      end
    end

    class Counter < Data.define(:view, :counter, :threshold)
      def to_s
        view.tag.span counter, class: ["text-xs leading-none p-1 rounded bg-gray-200 text-gray-600", threshold_classes]
      end

      private
        def threshold_classes
          exceeded? ? "bg-red-200 text-red-600" : "bg-gray-200 text-gray-600"
        end

        def exceeded?
          threshold && counter > threshold
        end
    end

    class Dropdown < Data.define(:view)
      def item(text, link)
        view.link_to text, link, class: "block w-full text-left py-1.5 px-3 text-gray-500 hover:text-gray-600 hover:bg-gray-50"
      end
    end
end
