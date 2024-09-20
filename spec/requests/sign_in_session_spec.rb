# spec/requests/sessions_spec.rb
require 'rails_helper'

RSpec.describe 'User Login', type: :request do
  let!(:user) { create(:user, email: 'test@example.com', password: 'password123') }

  context 'when logging in with email' do
    it 'logs in successfully with valid credentials' do
      post user_session_path, params: {
        user: {
          login: user.email,
          password: 'password123'
        }
      }


      expect(response).to have_http_status(:see_other) # redirects to a page after successful login
      expect(controller.user_signed_in?).to be true

      expect(controller.current_user).to eq(user)  # current_user should now be the logged-in user

      follow_redirect!
      expect(response.body).to include('Welcome')
    end

    it 'fails with invalid credentials' do
      post user_session_path, params: {
        user: {
          login: user.email,
          password: 'password124'
        }
      }

      expect(controller.user_signed_in?).to be false
      expect(controller.current_user).to_not be_present
    end
  end

  context 'when logging in with username' do
    let!(:admin) { create(:admin, username: 'admin_user', user: user) }

    it 'logs in successfully with valid username' do
      post user_session_path, params: {
        user: {
          login: admin.username,
          password: 'password123'
        }
      }

      expect(response).to have_http_status(:see_other)
      expect(controller.current_user).to eq(user)
    end

    it 'fails with invalid username' do
      post user_session_path, params: {
        user: {
          login: admin.username,
          password: 'password1234'
        }
      }

      expect(controller.user_signed_in?).to be false
      expect(controller.current_user).to_not be_present

      expect(response.body).to_not include('Welcome')
      # expect(response).to have_http_status(:unauthorized)
    end
  end
end
