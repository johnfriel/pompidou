require "pompidou/version"

module Pompidou
end

require "rails/generators"
require "pompidou/generators"
require "pompidou/bingbong" if defined?(Rails)

