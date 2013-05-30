require 'current_user'
require 'archetype'
require 'canonical_url'

class ApplicationController < ActionController::Base
  include CurrentUser
  include CanonicalURL::ControllerExtensions

  # WHAT? why current_user isn't working
  #alias_method :cur_user, :current_user
  #alias_method :current_user, :cur_user
  #helper_method :current_user

#  protect_from_forgery with: :exception
#  rescue_from Exception do |exception|
#    unless [ ActiveRecord::RecordNotFound, ActionController::RoutingError,
#             ActionController::UnknownController, AbstractController::ActionNotFound].include? exception.class
#    end

  protect_from_forgery with: :null_session

  before_filter :check_ajax
  before_filter :set_locale
  #before_filter :check_if_maintenance

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
  end
  

  def store_preloaded(key, json)
    @preloaded ||= {}
    @preloaded[key] = json.gsub("</", "<\\/")
  end

  def preload_json
    if request.format and request.format.html?
      store_preloaded('current_user', MultiJson.dump(CurrentUserSerializer.new(current_user, root:false)))
    end
  end

  def serialize_data(obj, serializer, opts={})
    serializer_opts = {scope: guardian}.merge!(opts)
    if obj.is_a?(Array)
      serializer_opts[:each_serializer] = serializer
      ActiveModel::ArraySerializer.new(obj, serializer_opts).as_json
    else
      serializer.new(obj, serializer_opts).as_json
    end
  end

  protected


  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  rescue
    :en
  end

  def check_if_maintenance
  
  end

  def check_ajax
    # not supporting anything else right now
    return if !request.get?
    raise RenderNil.new unless ((request.format && request.format.json?) || request.xhr?)
  end

  def ensure_current_user
    raise Bsh::NotLoggedIn.new unless current_user.present?
  end


end
