require "tempfile"

module AudioOperations
  class Wave < FunctionalOperations::Operation
    class InvalidAudioFile < StandardError; end
    class CommandError < StandardError; end

    BIN = `which audiowaveform`

    def arguments
      required :file_path, String
      required :duration, Integer
    end

    def perform
      filename  = File.basename(@file_path,".*")
      output_path = File.join(File.dirname(@file_path), "#{filename}.json")

      `audiowaveform -i #{@file_path} -o #{output_path} -s 0 -e #{@duration}`

      raise CommandError.new(self, $?) if ! $?.success?

      output = File.read(output_path)
      json_output  = JSON.parse(output)

      json_output["data"]
    end
  end
end
