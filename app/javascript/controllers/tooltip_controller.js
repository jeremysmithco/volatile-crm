import { Controller } from "@hotwired/stimulus"
import tippy from "tippy.js";

export default class extends Controller {
  static values = {
    content: String
  }

  connect() {
    this.tippy = tippy(this.element, { content: this.contentValue });
  }

  disconnect() {
    this.tippy.destroy();
  }
}
