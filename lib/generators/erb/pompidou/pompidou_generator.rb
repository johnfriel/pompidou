require 'rails/generators/erb'
require 'rails/generators/resource_helpers'

module Erb # :nodoc:
  module Generators # :nodoc:
    class PompidouGenerator < Base # :nodoc:
      include Rails::Generators::ResourceHelpers
  
      source_root File.expand_path('../templates', __FILE__)

      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_root_folder
        empty_directory File.join("app/views/admin", controller_file_path)
        empty_directory File.join("app/views/public", controller_file_path)
      end

      def copy_view_files
        admin_views.each do |view|
          Array(formats).each do |format|
            filename = filename_with_extensions(view, format)
            template "admin/#{filename}", File.join("app/views/admin", controller_file_path, filename)
          end
        end
        
        public_views.each do |view|
          Array(formats).each do |format|
            filename = filename_with_extensions(view, format)
            template "public/#{filename}", File.join("app/views/public", controller_file_path, filename)
          end
        end
      end

    protected

      def admin_views
        %w(index edit show new _form)
      end
      
      def public_views
        %w(index show)
      end
     
      # The following four methods are copied from 
      # lib/rails/generators/erb.rb
      def formats
        format
      end

      def format
        :html
      end

      def handler
        :erb
      end

      def filename_with_extensions(name, format)
        [name, format, handler].compact.join(".")
      end
      # end copied methods
    end
  end
end

