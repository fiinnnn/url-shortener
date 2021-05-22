require 'rails_helper'

describe RedirectController, type: :controller do
  context 'redirect does not exist' do
    subject { get :show, :params => { :source => 'invalid' } }

    it { should have_http_status(:not_found) }
  end

  context 'redirect exists' do
    before do
      @redirect = create :redirect
    end

    subject { get :show, :params => { :source => @redirect.source } }

    it { should have_http_status(:found) }
    it { should redirect_to @redirect.target }
  end
end
