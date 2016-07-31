require 'rails_helper'

RSpec.describe City, type: :model do
  subject { FactoryGirl.create :city }
  it { expect(subject).to be_valid }
end
