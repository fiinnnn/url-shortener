# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Links', type: :request do
  describe 'POST /links' do
    subject(:post_link) { post '/links', params: { link: link } }

    let(:response_body) { JSON.parse(response.body) }

    context 'without custom source' do
      let(:target) { 'http://example.com' }
      let(:link) { { target: target } }

      before { post_link }

      it { expect(response).to have_http_status(:created) }
      it { expect(response_body['target']).to eq target }
      it { expect(response_body['source']).to be_present }
    end

    context 'with custom source' do
      let(:target) { 'http://example.com' }
      let(:source) { 'custom-source' }
      let(:link) { { target: target, source: source } }

      before { post_link }

      it { expect(response).to have_http_status(:created) }
      it { expect(response_body['target']).to eq target }
      it { expect(response_body['source']).to eq source }
    end
  end
end
