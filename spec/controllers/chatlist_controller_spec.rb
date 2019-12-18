require 'rails_helper'

RSpec.describe ChatlistController, type: :controller do

  describe "GET #chat" do
    it "returns http success" do
      get :chat
      expect(response).to have_http_status(:success)
    end
  end

end
