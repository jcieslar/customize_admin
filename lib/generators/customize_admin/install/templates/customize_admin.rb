# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
CustomizeAdmin.setup do |config|
  config.name_space = "<%= @name_space %>"
  config.per_page = 50
end
