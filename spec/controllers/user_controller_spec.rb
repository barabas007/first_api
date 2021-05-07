# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

  context 'POST #create' do
    before { get :users }

    it 'returns users' do
      is_expected.to render_template :users
      expect(assigns(:users)).to match_array(users)
    end
  end
  end