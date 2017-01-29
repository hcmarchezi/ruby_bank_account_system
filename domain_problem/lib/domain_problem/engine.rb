module DomainProblem
  class Engine < ::Rails::Engine
    config.generators.api_only = true

    # Append migrations to client application of any
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    # append factory girl definitions to client application
    initializer :append_factory_girl_definitions do |app|
      unless app.root.to_s.match root.to_s

        # Include FactoryGirl factories only when in test mode
        if Rails.env.test?
          plugin_factories = Rails.root.to_s + '/../domain_problem/test/factories'
      
          if ! FactoryGirl.definition_file_paths.include? plugin_factories
              FactoryGirl.definition_file_paths << plugin_factories        
          end
        end

      end    
    end

  end
end
