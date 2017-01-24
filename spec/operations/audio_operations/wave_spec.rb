require "rails_helper"

RSpec.describe AudioOperations::Wave, type: :operation do
  let(:output) do
    run(AudioOperations::Wave, params)
  end

  context "when the file is valid" do
    let(:params) do
      {
        file_path:  File.join("spec/fixtures/valid.mp3"),
        duration: 360,
      }
    end

    it "returns the array of the wave" do
      expect(output).to eq([0,0,0,0,0])
    end
  end

  context "when the file is invalid" do
    context "because it does not exists" do
      let(:params) do
        {
          file_path: "fooo.mp3",
          duration: 360,
        }
      end

      it "raises an error" do
        expect {
          run(AudioOperations::Wave, params)
        }.to raise_error(AudioOperations::Wave::InvalidAudioFile)
      end
    end
  end
end
