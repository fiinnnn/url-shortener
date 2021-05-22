require 'rails_helper'

RSpec.describe Redirect, type: :model do
  context 'validations' do
    it { should validate_presence_of(:source) }
    it { should validate_uniqueness_of(:source) }

    it { should validate_presence_of(:target) }
    it { should validate_uniqueness_of(:target) }
  end
end
