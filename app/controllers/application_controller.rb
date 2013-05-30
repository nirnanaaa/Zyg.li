require 'current_user'
require 'archetype'
require 'canonical_url'

class ApplicationController < ActionController::Base
  include CurrentUser
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception
#  rescue_from Exception do |exception|
#    unless [ ActiveRecord::RecordNotFound, ActionController::RoutingError,
#             ActionController::UnknownController, AbstractController::ActionNotFound].include? exception.class
#    end

  protect_from_forgery with: :null_session

  before_filter :check_ajax
  before_filter :set_locale
#  before_filter


end
