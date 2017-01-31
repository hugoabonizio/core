require "rails_helper"

RSpec.describe ChannelDecorator do
  let(:decorator) { channel.decorate }

  describe "description" do
    let(:channel) { Fabricate.build(:channel, description: description, summary: summary) }

    describe "summary" do
      context "when both the summary and description are empty" do
        let(:description) { "" }
        let(:summary) { "" }

        it "returns an empty string" do
          expect(decorator.summary).to be_empty?
        end
      end

      context "when the summary is present and the description is not" do
        let(:description) { "" }
        let(:summary) { "Foo" }

        it "returns the summary" do
          expect(decorator.summary).to be_empty?
        end
      end
    end
  end
end
