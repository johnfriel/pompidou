require "pompidou/version"

module Pompidou
end

require "rails/generators"
require "pompidou/generators"
require "pompidou/railtie" if defined?(Rails)

