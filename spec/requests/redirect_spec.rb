# frozen_string_literal: true

require 'rails_helper'

describe 'Redirect', type: :request do
  context 'when redirect does not exist' do
    before { get '/r/invalid' }

    it { expect(response).to have_http_status(:not_found) }
  end

  context 'when redirect exists' do
    let(:link) { create(:link) }

    before { get "/r/#{link.source}" }

    it { expect(response).to have_http_status(:found) }
    it { expect(response).to redirect_to link.target }
  end
end
