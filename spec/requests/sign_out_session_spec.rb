require 'rails_helper'

RSpec.describe 'User Authentication', type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  it 'logs out a user and redirects to the sign-in page' do
    delete destroy_user_session_path  # Perform sign-out

    expect(controller.user_signed_in?).to be false
    expect(controller.current_user).to_not be_present
    
    follow_redirect!  # Follow the redirect to the sign-in page
    expect(response).to have_http_status(:ok)  # Ensure the sign-in page loads successfully

    # Check if the user is logged out by verifying absence of user-specific content
    expect(response.body).not_to include('Welcome')
  end
end
