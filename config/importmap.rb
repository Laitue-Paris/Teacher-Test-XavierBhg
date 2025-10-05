# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "picmo" # @5.8.5
# pin "emoji-picker-element" # @1.27.0
# pin "emoji-picker-element", to: "https://cdn.jsdelivr.net/npm/emoji-picker-element@^1/index.js"
# pin "emoji-mart" # @5.6.0
pin "emoji-mart", to: "https://cdn.jsdelivr.net/npm/emoji-mart@latest/dist/browser.js"
pin "@emoji-mart/data", to: "@emoji-mart--data.js" # @1.2.1
