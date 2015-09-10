require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rubyplex
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    root.join('vendor', 'assets', 'bower_components').to_s.tap do |bower_path|
      config.sass.load_paths << bower_path
      config.assets.paths << bower_path
    end
# Precompile Bootstrap fonts
    config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
# Minimum Sass number precision required by bootstrap-sass
    ::Sass::Script::Value::Number.precision = [8, ::Sass::Script::Value::Number.precision].max

    # We don't want the default of everything that isn't js or css, because it pulls too many things in
    config.assets.precompile.shift

    # Explicitly register the extensions we are interested in compiling
    config.assets.precompile.push(Proc.new do |path|
                                    File.extname(path).in? [
                                                               '.png',  '.gif', '.jpg', '.jpeg', '.svg', # Images
                                                               '.eot',  '.otf', '.svc', '.woff', '.ttf' # Fonts
                                                           ]
                                  end)

    config.generators do |generate|
      # Disable generation of helpers
      generate.helper false
      generate.coffee false
      generate.js false
    end

  end
end
