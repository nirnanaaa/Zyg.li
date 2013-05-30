require 'spec_helper'

describe ApplicationController do
  let(:not_correct_api_key){ SecureRandom.hex(32) }

  it "allows GET for all users" do
  end

  it "disallows PUT for non-api users" do
  end


end
