# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@prettier/plugin-ruby", to: "@prettier--plugin-ruby.js" # @4.0.4
pin "prettier" # @3.3.3
pin "child_process" # @2.1.0
pin "fs" # @2.1.0
pin "net" # @2.1.0
pin "os" # @2.1.0
pin "path" # @2.1.0
pin "process" # @2.1.0
pin "url" # @2.1.0
pin "chartkick" # @5.0.1
pin "dropzone" # @6.0.0
pin "just-extend" # @5.1.1
pin "activestorage" # @5.2.8
pin "@rails/activestorage", to: "@rails--activestorage.js" # @8.0.0
pin "Chart.bundle", to: "Chart.bundle.js"
