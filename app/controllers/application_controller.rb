class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def self.render_with_signed_in_user(user, *args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(user, scope: :user) }
    renderer = self.renderer.new('warden' => proxy)
    renderer.render(*args)
  end

  def self.render_with_signed_in_stylist(stylist, *args)
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(stylist, scope: :stylist) }
    renderer = self.renderer.new('warden' => proxy)
    renderer.render(*args)
  end

  def after_sign_in_path_for(resource)
    case resource
    when User
     root_path
    when Stylist
      stylists_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :stylist
      stylists_path
    else
      root_path
    end
  end

  def after_update_path_for(resource)
    case resource
    when User
      root_path
    when Stylist
      stylists_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :prefecture_id, :work_id, :frame_type_id, :user_photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :prefecture_id, :work_id, :frame_type_id, :user_photo])
  end

  
end
