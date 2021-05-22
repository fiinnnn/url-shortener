# frozen_string_literal: true

require 'rails_helper'

describe RedirectController, type: :controller do
  context 'when redirect does not exist' do
    subject { get :show, params: { source: 'invalid' } }

    it { should have_http_status(:not_found) }
  end

  context 'when redirect exists' do
    subject { get :show, params: { source: redirect.source } }

    let(:redirect) { create(:redirect) }

    it { should have_http_status(:found) }
    it { should redirect_to redirect.target }
  end
end
