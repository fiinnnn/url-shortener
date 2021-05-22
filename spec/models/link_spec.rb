# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'when validating' do
    subject { build(:link) }

    it { should validate_presence_of(:source) }
    it { should validate_uniqueness_of(:source) }

    it { should validate_presence_of(:target) }
  end
end
