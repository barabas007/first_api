# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates user' do
    should validate_presence_of :name
  end

  it 'validates user' do
    should validate_presence_of :password
  end

  it 'validates user' do
    should validate_uniqueness_of :email
  end
end
