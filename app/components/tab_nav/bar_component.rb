class TabNav::BarComponent < ApplicationComponent
  renders_many :tabs, types: {
    link: TabNav::LinkTabComponent,
    disabled: TabNav::DisabledTabComponent,
    dropdown: TabNav::DropdownTabComponent
  }
  renders_one :extra

  private

  def nav_classes
    "flex justify-between space-x-2 items-start border-b border-gray-400 mb-8"
  end

  def section_classes
    "flex -mb-px space-x-2"
  end
end
