require "rails_helper"

RSpec.describe ServiceMailer, type: :mailer do
  let(:user) { FactoryGirl.create :user }
  let(:service) { FactoryGirl.create :service, user: user }
  let(:email) { ServiceMailer.published(service) }

  describe "#published" do
    it { expect(email.from).to include("contato@pinou.com.br") }
    it { expect(email.to).to include(user.email) }
    it { expect(email.subject).to eq("Seu negócio está no ar!") }
  end
end
