class CustomizeAdmin::ScaffoldGenerator < Rails::Generators::NamedBase

  source_root File.expand_path('../templates', __FILE__)
  #argument :model_name, :type => :string
  argument :fields, :type => :array, :banner => "field:type"
  #argument :namespace, :type => :string, :default => "admin" #, :required => false

  def generate_controller
    puts file_name
    #puts class_name
    puts plural_name
    puts options
    puts namespace

    @controller_name = plural_name[0].capitalize + plural_name.slice(1..-1)
    #namespace = ask("Tell the admin namespace")
    namespace = "admin"
    @namespace = namespace[0].capitalize + namespace.slice(1..-1)
    if namespace.present?
      template "controller_template.rb", "app/controllers/#{namespace}/#{plural_name}_controller.rb"
      insert_into_file "config/routes.rb", :after => "namespace :#{namespace} do\n  #customize_admin:\n" do
        "    resources :#{plural_name}\n"
      end
    else
      template "controller_template.rb", "app/controllers/#{plural_name}_controller.rb"
      route("resources :#{plural_name}")
    end

    insert_into_file "app/views/customize_admin/application/_admin_menu.html.erb", :after => "customize_admin\n" do
      "<%= link_to '#{@controller_name}', #{namespace +"_"+ plural_name}_path %>\n"
    end

  end

  def add_to_menu
  end

  def generate_model
    s = ""
    fields.each do |f|
      s += f + " "
    end
    generate "model #{file_name} #{s}"
  end

end
