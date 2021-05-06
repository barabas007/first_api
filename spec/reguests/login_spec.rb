require 'rails_helper'

describe 'Login', type: :request do
  describe 'POST/login' do
    it 'login the client' do
      post '/api/v1/login', params: { name: 'KKK', email: 'user@mail.ru', password: '123456' }

      # expect(response).to have_http_status(:created)
      # expect(response_body_if_short).to eq({ 'token' => '1234567890' })
    end

    it 'returns error when email is missing' do
      post '/api/v1/login', params: { name: 'KKK', password: '12345' }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error when password is missing' do
      post '/api/v1/login', params: { name: 'KKK', email: 'ooooooo' }
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns error when name is missing' do
      post '/api/v1/login', params: { email: 'ooooooo', password: '12345' }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
