class TabNav::Bar < ActionView::Partial
  slot :extra

  def render(&)
    view.render "tab_nav/bar", tabs: capture(&), extra:
  end

  def link_tab(text, link, selected: current_page?(link), icon:, counter: nil, threshold: nil)
    partial __method__, text:, link:, selected:, icon:, counter: (Counter.new(counter, threshold) if counter)
  end

  def disabled_tab(text, icon:, tooltip:)
    partial __method__, text:, icon:, tooltip:
  end

  def dropdown_tab(text, selected: false, icon:, &)
    partial __method__, text:, selected:, icon:, items: Dropdown.capture(&)
  end

  private
    def partial(key, **)
      view.render("tab_nav/#{key}", tab: Tab.new, **)
    end

    class Tab < ActionView::Partial
      def classes(disabled: false, selected: false)
        class_names(
          "group whitespace-nowrap flex items-center space-x-1 rounded rounded-b-none leading-none py-3 px-3 border",
          "border-gray-300 border-b-gray-400 hover:bg-gray-50": !disabled,
          "border-gray-200 border-b-gray-400 cursor-not-allowed": disabled,
          "border-b-2 border-b-red-400": selected
        )
      end
    end

    class Counter < Data.define(:counter, :threshold)
      def to_s
        ActionView::Partial.view.tag.
          span counter, class: ["text-xs leading-none p-1 rounded bg-gray-200 text-gray-600", threshold_classes]
      end

      private
        def threshold_classes
          exceeded? ? "bg-red-200 text-red-600" : "bg-gray-200 text-gray-600"
        end

        def exceeded?
          threshold && counter > threshold
        end
    end

    class Dropdown < ActionView::Partial
      def item(text, link)
        link_to text, link, class: "block w-full text-left py-1.5 px-3 text-gray-500 hover:text-gray-600 hover:bg-gray-50"
      end
    end
end
