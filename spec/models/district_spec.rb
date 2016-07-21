require 'rails_helper'

RSpec.describe District, type: :model do
  subject { FactoryGirl.create :district }
  it { expect(subject).to be_valid }
end
