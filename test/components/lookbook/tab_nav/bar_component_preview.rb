class TabNav::BarComponentPreview < Lookbook::Preview
  def standard
    render TabNav::BarComponent.new do |c|
      c.with_tab_link(text: "Simple", link: "/simple", selected: true)
      c.with_tab_link(text: "Icon", link: "/icon", icon: "chart-bar")
      c.with_tab_disabled(text: "Disabled", icon: "chart-bar", tooltip: "Tooltip message.")
      c.with_tab_dropdown(text: "Dropdown", selected: false, icon: "chart-bar") do |d|
        d.with_item(text: "Item 1", link: "/item-1")
        d.with_item(text: "Item 2", link: "/item-")
      end

      c.with_extra { "<strong>Something else.</strong>".html_safe }
    end
  end
end
