require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { FactoryGirl.create :user, email: FFaker::Internet.email  }
  subject { FactoryGirl.create :review, user_id: user.id }
  it { expect(subject).to be_valid }
end
