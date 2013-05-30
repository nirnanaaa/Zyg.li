require 'spec_helper'

describe PagesController do
  describe "access" do
    it "allows GET / for all users" do
      expect do
        get :index
      end.not_to raise_error
    end

    it "disallows POST requests for not logged in users" do
      expect do
        post :create
      end.to raise_error Bsh::NotLoggedIn
    end
  end

end
