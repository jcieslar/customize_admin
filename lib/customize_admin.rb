require "customize_admin/engine"

module CustomizeAdmin

  mattr_accessor :name_space
  @@name_space = "admin"

  mattr_accessor :admin_user
  @@admin_user = "AdminUser"

  def self.setup
    yield self
  end

end
