require 'rails_helper'

RSpec.describe Admin::Issue, type: :model do
  subject { FactoryGirl.create :issue }
  it { expect(subject).to be_valid }
end
