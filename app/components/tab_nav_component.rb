class TabNavComponent < ApplicationComponent
  renders_many :tabs, types: {
    link: LinkTabComponent,
    disabled: DisabledTabComponent,
    dropdown: DropdownTabComponent
  }
  renders_one :extra
end
