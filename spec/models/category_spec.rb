require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { FactoryGirl.create :category }
  it { expect(subject).to be_valid }

  describe '#to_param' do
    let(:category) { FactoryGirl.create :category, name: 'Natal Zen' }
    it { expect(category.to_param).to eq('natal-zen') }
  end
end
