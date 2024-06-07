class TabNav::BarComponent < ApplicationComponent
  renders_many :tabs, types: {
    link: TabNav::LinkTabComponent,
    disabled: TabNav::DisabledTabComponent,
    dropdown: TabNav::DropdownTabComponent
  }
  renders_one :extra

  private

  def nav_classes
    "flex justify-between space-x-2 items-start border-b-2 border-gray-400"
  end

  def section_classes
    "flex -mb-0.5 space-x-2"
  end
end
