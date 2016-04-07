require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:user) {User.create!(email: "member@example.com", password: "password", confirmed_at: Time.now)}
  let(:topic) { Topic.create!(title: "A topic title", user: user)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

end
