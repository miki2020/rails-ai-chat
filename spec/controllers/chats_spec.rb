require "spec_helper"
require "rails_helper"

RSpec.describe ChatsController, type: :controller do
  let(:user) { create(:user) }
  let(:chat) { create(:chat, user: user) }

  before do
    # sign_in user
    session[:user_id] = user.id
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: chat.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new chat" do
      expect {
        post :create, params: { chat: { model_id: "llama3.2:1b", provider: "ollama" } }
      }.to change(Chat, :count).by(1)
    end
  end
end
