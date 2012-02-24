class CustomizeAdmin::AddResourceGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers
  source_root File.expand_path('../templates', __FILE__)
  argument :resource_class

  def generate_controller
    @namespace_class = CustomizeAdmin.name_space.camelize
    @namespace = CustomizeAdmin.name_space
    @controller_name = plural_name.camelize
    @resource = resource_class.camelize
    @collection_name = resource_class.pluralize
    @instance_name = resource_class

    template "controller_template.rb", "app/controllers/#{@namespace}/#{plural_name}_controller.rb"

    insert_into_file "config/routes.rb", :after => "namespace :#{@namespace} do\n  #customize_admin:\n" do
        "    resources :#{plural_name}\n"
    end

    insert_into_file "app/views/customize_admin/application/_admin_menu.html.erb", :after => "<li></li>\n" do
      "<li><%= link_to '#{@controller_name}', #{@namespace +"_"+ plural_name}_path %></li>\n"
    end

  end

end
