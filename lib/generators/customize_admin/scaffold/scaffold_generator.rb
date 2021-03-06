class CustomizeAdmin::ScaffoldGenerator < Rails::Generators::NamedBase

  source_root File.expand_path('../templates', __FILE__)
  argument :fields, :type => :array, :banner => "field:type"

  def generate_controller

    @controller_name = plural_name.pluralize.camelize
    namespace = CustomizeAdmin.name_space
    @namespace = namespace.camelize
    if namespace.present?
      template "controller_template.rb", "app/controllers/#{namespace}/#{plural_name}_controller.rb"
      insert_into_file "config/routes.rb", :after => "namespace :#{namespace} do\n  #customize_admin:\n" do
        "    resources :#{plural_name}\n"
      end
    else
      template "controller_template.rb", "app/controllers/#{plural_name}_controller.rb"
      route("resources :#{plural_name}")
    end

    insert_into_file "app/views/customize_admin/application/_admin_menu.html.erb", :after => "</li>\n" do
      "<li><%= link_to '#{@controller_name}', #{namespace +"_"+ plural_name}_path %></li>\n"
    end

  end

  def generate_model
    s = ""
    fields.each do |f|
      s += f + " "
    end
    generate "model #{file_name} #{s}"
  end

end
