require 'rails_helper'

RSpec.describe Review, type: :model do
  subject { FactoryGirl.create :review }
  it { expect(subject).to be_valid }
end
