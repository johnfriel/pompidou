module Pompidou
  module Generators
    class ResourceGenerator < Rails::Generators::NamedBase
    
      # TODO -- Need to write the namespace code if it doesn't exist
    
      def pompidou_routes
        write_route admin_namespace_pattern
        write_route public_namespace_pattern
      end
    
      private
    
        def write_route(pattern)
          in_root do
            inject_into_file(
              'config/routes.rb', 
              "\n    resources :#{file_name.pluralize}",
              { after: pattern, verbose: false, force: true }
            )
          end
        end
    
        def public_namespace_pattern
          /^\s*scope\s*:module\s*=>\s*:public\s*do\s*$/
        end
        
        def admin_namespace_pattern
          /^\s*namespace\s*:admin\s*do\s*$/
        end
    
    end
  end
end

