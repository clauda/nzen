require 'rails_helper'

RSpec.describe Service, type: :model do
  subject { FactoryGirl.create :service }
  it { expect(subject).to be_valid }
end
