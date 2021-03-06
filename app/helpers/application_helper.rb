require 'current_user'
require 'canonical_url'

module ApplicationHelper
  include CurrentUser
  include CanonicalURL::Helpers

  def only_dev(text)
    text.html_safe if Rails.env.development?
  end

  def only_prod(text)
    text.html_safe if Rails.env.production?
  end


end
