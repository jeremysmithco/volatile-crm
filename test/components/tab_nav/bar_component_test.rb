require "test_helper"

class TabNav::BarComponentTest < ViewComponent::TestCase
  def test_render_component
    render_inline(TabNav::BarComponent.new) do |c|
      c.with_tab_link(text: "Home", link: "/home")
      c.with_tab_link(text: "Reports", link: "/reports", icon: "chart-bar")
      c.with_extra { "<strong>Something else.</strong>".html_safe }
    end

    assert_selector("nav")
    assert_selector("a", count: 2)
    assert_link("Home", href: "/home")
    assert_link("Reports", href: "/reports")
    assert_selector("svg", count: 1)
    assert_selector("strong", text: "Something else.")
  end
end
