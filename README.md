# Volatile CRM

A companion Rails app to [Refactoring Volatile Views into Cohesive Components](https://speakerdeck.com/jeremysmithco/refactoring-volatile-views-into-cohesive-components) talk.

### Built With

* [ViewComponent](https://viewcomponent.org/)
* [Tailwind](https://tailwindcss.com/)
* [Stimulus](https://stimulus.hotwired.dev/)
* [Lookbook](https://lookbook.build/)

### Component Examples

Examples of three different types of view components:

1. Utility: `AlertComponent` http://localhost:3000/alerts
2. Layout: `PageLayouts::BasicComponent` http://localhost:3000/page_layouts
3. Model-Specific: `ContactCardComponent` http://localhost:3000/contacts

### Tabbed Navigation

See the progression of a tabbed navigation bar:

* From: http://localhost:3000/tabs/1
* To: http://localhost:3000/tabs/7

Then compare the final implementation with ViewComponent and traditional Rails view partials and helpers.

* ViewComponent: http://localhost:3000/tabs/c
* Partials & helpers: http://localhost:3000/tabs/p
