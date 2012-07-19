module CustomizeAdmin
  class ApplicationController < ActionController::Base

    before_filter :set_admin_locale

    def set_admin_locale
        I18n.locale = session[:admin_locale] || I18n.default_locale
    end
  end
end
