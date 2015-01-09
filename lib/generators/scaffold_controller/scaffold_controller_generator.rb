require 'rails/generators/resource_helpers'

module Pompidou
  module Generators
    class ScaffoldControllerGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
    
      source_root File.expand_path('../templates', __FILE__)
      
      check_class_collision suffix: "Controller"
    
      class_option :orm, banner: "NAME", type: :string, required: true,
                         desc: "ORM to generate the controller for"
    
      argument :attributes, type: :array, default: [], banner: "field:type field:type"
    
      def create_controller_files
        template(
          "admin_controller.rb", 
          File.join('app/controllers/admin', controller_class_path, "#{controller_file_name}_controller.rb")
        )
        template(
          "public_controller.rb", 
          File.join('app/controllers/public', controller_class_path, "#{controller_file_name}_controller.rb")
        )
      end
    
      hook_for :template_engine, as: :pompidou
      hook_for :test_framework, as: :scaffold
    
    end
  end
end

