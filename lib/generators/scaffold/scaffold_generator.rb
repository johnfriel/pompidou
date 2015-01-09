require 'rails/generators/rails/resource/resource_generator'
require 'rails/generators/model_helpers'
require 'rails/generators/resource_helpers'
require 'active_support/core_ext/object/blank'
#require 'pry'

module Pompidou
  module Generators
    #class ScaffoldGenerator < Rails::Generators::ResourceGenerator
    class ScaffoldGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ModelHelpers
      include Rails::Generators::ResourceHelpers
      
      #remove_hook_for :resource_controller
      #remove_hook_for :resource_route
      #remove_class_option :actions
    
      class_option :stylesheets, type: :boolean, desc: "Generate Stylesheets"
      class_option :stylesheet_engine, desc: "Engine for Stylesheets"
      class_option :assets, type: :boolean
      #class_option :resource_route, type: :boolean
      
      argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"
      
      hook_for :orm, required: true
    
      def handle_skip
        @options = @options.merge(stylesheets: false) unless options[:assets]
        @options = @options.merge(stylesheet_engine: false) unless options[:stylesheets]
      end

      def orm_class
        Rails::Generators::ActiveModel
      end
   
      ## worked as files in /lib 
      #invoke :pompidou_controller
      #invoke :pompidou_resource
      
      #invoke :active_record
      invoke 'pompidou:scaffold_controller'
      invoke 'pompidou:resource'
    
    end
  end
end


# Code for Rails' ModelGenerator

#module Rails
#  module Generators
#    class ModelGenerator < NamedBase # :nodoc:
#      include Rails::Generators::ModelHelpers
#
#      argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"
#      hook_for :orm, required: true
#    end
#  end
#end
#
#


#module Rails
#  module Generators
#    class ResourceGenerator < ModelGenerator # :nodoc:
#      include ResourceHelpers
#
#      hook_for :resource_controller, required: true do |controller|
#        invoke controller, [ controller_name, options[:actions] ]
#      end
#
#      class_option :actions, type: :array, banner: "ACTION ACTION", default: [],
#                             desc: "Actions for the resource controller"
#
#      hook_for :resource_route, required: true
#    end
#  end
#end
#
#


#module Rails
#  module Generators
#    class ScaffoldGenerator < ResourceGenerator # :nodoc:
#      remove_hook_for :resource_controller
#      remove_class_option :actions
#
#      class_option :stylesheets, type: :boolean, desc: "Generate Stylesheets"
#      class_option :stylesheet_engine, desc: "Engine for Stylesheets"
#      class_option :assets, type: :boolean
#      class_option :resource_route, type: :boolean
#
#      def handle_skip
#        @options = @options.merge(stylesheets: false) unless options[:assets]
#        @options = @options.merge(stylesheet_engine: false) unless options[:stylesheets]
#      end
#
#      hook_for :scaffold_controller, required: true
#
#      hook_for :assets do |assets|
#        invoke assets, [controller_name]
#      end
#
#      hook_for :stylesheet_engine do |stylesheet_engine|
#        if behavior == :invoke
#          invoke stylesheet_engine, [controller_name]
#        end
#      end
#    end
#  end
#end
#
