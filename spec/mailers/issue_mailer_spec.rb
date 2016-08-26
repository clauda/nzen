require "rails_helper"

RSpec.describe IssueMailer, type: :mailer do
  let(:issue) { FactoryGirl.create :issue, email: "claudia@sorta.in" }
  let(:email) { IssueMailer.received(issue) }

  describe "#received" do
    it { expect(email.from).to include("contato@pinou.com.br") }
    it { expect(email.to).to include("claudia@sorta.in") }
    it { expect(email.subject).to eq("Recebemos o seu contato") }
  end
end
