# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Redirect, type: :model do
  context 'when validating' do
    subject { build(:redirect) }

    it { should validate_presence_of(:source) }
    it { should validate_uniqueness_of(:source) }

    it { should validate_presence_of(:target) }
    it { should validate_uniqueness_of(:target) }
  end
end
