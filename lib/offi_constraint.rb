require_dependency 'current_user'

class OffiConstraint

  def matches?(request)
    return false unless request.session[:current_user_id].present?
    User.offis.where(id: request.session[:current_user_id].to_i).exists?
  end

end
