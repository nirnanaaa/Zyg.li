require 'spec_helper'

describe PagesController do
  describe "access" do
    it "disallows POST requests for not logged in users" do
      expect do
        post :create
      end.to raise_error BSH::NotLoggedIn
    end
  end

end
