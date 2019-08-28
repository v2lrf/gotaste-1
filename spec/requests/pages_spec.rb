# frozen_string_literal: true

require 'rails_helper'

describe 'Pages', type: :request do
  describe 'GET about' do
    it 'is a successful request' do
      get about_path
      expect(response).to be_successful
    end
  end
end
