class CustomizeAdmin::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  def add_gems
    insert_into_file "Gemfile", :after => "source 'http://rubygems.org'\n" do
      "# CustomizeAdmin gems:\n gem 'inherited_resources'\n gem 'has_scope'\n gem 'formtastic'\n gem 'will_paginate'\n gem 'devise'\n gem 'twitter-bootstrap-rails', '1.4.3' \n \n"
    end

  end

  def add_routes
    insert_into_file "config/routes.rb", :after => "draw do\n" do
      @name_space = ask("Tell me the admin namespace?")
      "  mount CustomizeAdmin::Engine => '/admin', :as => 'customize_admin'\n  namespace :#{@name_space} do\n  #customize_admin:\n match '/' => 'dashboard#index' \n \n  end\n"
    end
  end

  def create_menu_file
    create_file "app/views/customize_admin/application/_admin_menu.html.erb" do
      "<%= link_to 'Dashboard', #{@name_space}_path, :class => 'brand' %> \n"
    end
  end

  def run_formtastic_generator
    generate "formtastic:install"
  end

  def run_devise_generator
    generate "devise:install"
  end

  def create_admin_user_table
    generate "devise AdminUser"
  end

  def remove_registerable
    model_file = File.join(destination_root, "app", "models", "admin_user.rb")
    gsub_file model_file, /\:registerable([.]*,)?/, ""
  end

  def admin_user_add_to_migration
    inject_into_file Dir["db/migrate/*_devise_create_admin_users.rb"].first,
      "# Create a default user\n AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')\n\n ",
      :before => "add_index :admin_users, :email"
  end

  def add_dashboard
    s = ""
    @name_space.to_s.split("_").each do |n|
      s += n[0].capitalize + n.slice(1..-1)
    end
    @name_space_class = s
    template "dashboard_controller.rb", "app/controllers/#{@name_space}/dashboard_controller.rb"
    template "index.html.erb", "app/views/#{@name_space}/dashboard/index.html.erb"
  end

  def add_devise_layout
    template "devise_admin.html.erb", "app/views/layouts/devise_admin.html.erb"
    inject_into_file Dir["app/controllers/application_controller.rb"].first,
      "\n layout :layout_by_resource
def layout_by_resource
  if devise_controller? && resource_name == :admin_user
    'devise_admin'
  else
    'application'
  end
end ",
      :after => "class ApplicationController < ActionController::Base"

  end

end
