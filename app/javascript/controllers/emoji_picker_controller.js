import { Controller } from "@hotwired/stimulus";
import "emoji-mart";
import data from "@emoji-mart/data";

// Connects to data-controller="emoji-picker"
export default class extends Controller {
  static targets = ["button", "container"]
  static values = { commentId: Number }

  connect() {
    this.initializeEmojiMartPicker();
  }

  fire(event) {
    event.preventDefault();
    this.initializeEmojiMartPicker();
  }

  initializeEmojiMartPicker() {
    if (!this.picker) {
      this.picker = new EmojiMart.Picker({
        data: data,
        onEmojiSelect: (emoji) => {
          if (this.buttonTarget) {
            const form = document.getElementById(`react_form_${this.commentIdValue}`);
            const emojiField = form.querySelector('input[name="emoji"]');

            emojiField.value = emoji.native;
            form.requestSubmit();
            this.containerTarget.classList.add("d-none");
          }
        },
        theme: "light",
      });

      this.containerTarget.innerHTML = "";
      this.containerTarget.appendChild(this.picker);
    }

    // Toggle visibility
    this.containerTarget.classList.toggle("d-none");
  }
}
