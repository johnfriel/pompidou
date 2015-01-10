require 'rails/generators/rails/resource/resource_generator'
require 'rails/generators/model_helpers'
require 'rails/generators/resource_helpers'
require 'active_support/core_ext/object/blank'

module Pompidou
  module Generators
    class ScaffoldGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ModelHelpers
      include Rails::Generators::ResourceHelpers
      
      argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"
      
      invoke 'active_record:model'
      invoke 'pompidou:scaffold_controller'
      invoke 'pompidou:resource'
    
    end
  end
end
