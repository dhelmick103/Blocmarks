require 'rails_helper'

RSpec.describe Topics::BookmarksController, type: :controller do
  let(:topic) { FactoryGirl.create(:topic)}
  let(:bookmark) { FactoryGirl.create(:bookmark, topic: topic)}

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: topic.id, id: bookmark.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: topic.id, id: bookmark.id
      expect(response).to have_http_status(:success)
    end
  end

end
