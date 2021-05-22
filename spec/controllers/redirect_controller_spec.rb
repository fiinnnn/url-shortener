require 'rails_helper'

describe RedirectController, type: :controller do
  context 'redirect does not exist' do
    it do
      should rescue_from(ActiveRecord::RecordNotFound).with(:render_not_found)
    end
  end

  context 'redirect exists' do
    before do
      @redirect = create :redirect
    end

    it 'is found' do
      get :show, :params => { :source => @redirect.source }
      expect(response).to have_http_status(:found)
    end

    it do
      get :show, :params => { :source => @redirect.source }
      is_expected.to redirect_to @redirect.target
    end
  end
end
