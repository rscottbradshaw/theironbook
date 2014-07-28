require 'rails_helper'

RSpec.describe InfoController, :type => :controller do

  describe "GET create" do
    it "returns http success" do
      get :create
      expect(response).to be_success
    end
  end

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to be_success
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to be_success
    end
  end

end
