require 'rails/generators/rails/resource/resource_generator'
#require 'pry'

module Pompidou
  module Generators
    class ScaffoldGenerator < Rails::Generators::ResourceGenerator
      #source_root File.expand_path('../templates', __FILE__)
    
      remove_hook_for :resource_controller
      remove_hook_for :resource_route
      remove_class_option :actions
    
      class_option :stylesheets, type: :boolean, desc: "Generate Stylesheets"
      class_option :stylesheet_engine, desc: "Engine for Stylesheets"
      class_option :assets, type: :boolean
      #class_option :resource_route, type: :boolean
    
      def handle_skip
        @options = @options.merge(stylesheets: false) unless options[:assets]
        @options = @options.merge(stylesheet_engine: false) unless options[:stylesheets]
      end
   
      ## worked as files in /lib 
      #invoke :pompidou_controller
      #invoke :pompidou_resource
      
      invoke 'pompidou:scaffold_controller'
      invoke 'pompidou:resource'
    
    end
  end
end
