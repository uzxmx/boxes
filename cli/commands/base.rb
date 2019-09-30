module Commands
  class Base
    attr_reader :options, :prompt

    def initialize(cli)
      @options = cli.options
      @prompt = cli.prompt
    end

    def execute
      raise 'Unimplemented'
    end

    private

    def abort(msg)
      puts "Error: #{msg}"
      exit -1
    end
  end
end
