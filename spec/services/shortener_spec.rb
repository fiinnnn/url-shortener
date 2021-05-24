# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shortener do
  context 'when link does not exist' do
    let(:target) { 'http://example.com' }
    let(:link) { described_class.call(target) }

    it 'creates a new link with the specified target' do
      expect(link.target).to eq target
    end
  end

  context 'when link to the same target already exists' do
    let(:existing_link) { create(:link) }
    let(:link) { described_class.call(existing_link.target) }

    it 'returns a link with the specified target' do
      expect(link.target).to eq existing_link.target
    end

    it 'returns the existing link' do
      expect(link.source).to eq existing_link.source
    end
  end
end
