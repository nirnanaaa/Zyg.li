require_dependency 'page_serializer'

class PagesController < ApplicationController
  before_filter :ensure_current_user, except: [ :index, :show ]
  skip_before_filter :check_ajax, only: [ :index ]

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

end
