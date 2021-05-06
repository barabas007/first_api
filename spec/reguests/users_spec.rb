require 'rails_helper'

describe 'Users API', type: :request do
  it 'returns all users' do
    get '/api/v1/users'
    expect(response).to have_http_status(:success)
  end

end