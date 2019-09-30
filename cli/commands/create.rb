require 'commands/base'
require 'erb'

module Commands
  class Create < Base
    attr_reader :box_dir, :box_name, :config

    def initialize(cli, box_dir)
      super(cli)
      @box_dir = box_dir
      @box_name = File.basename(box_dir)
      @config = Hashie::Mash.new
    end

    def execute
      if (@project_name = options[:name]).nil?
        @project_name = prompt.ask('Project name:')
      end

      if File.exist?(@project_name)
        abort "A file or directory with name `#{@project_name}` already exists."
      end
      dry_run or Dir.mkdir(@project_name)
      @project_dir = @project_name

      if !dry_run && !system("sh -c 'cd #{@project_name} && git init' >/dev/null")
        abort 'Git init failed.'
      end

      populate_config

      template = ERB.new(File.read(erb_template_path), trim_mode: '-')
      content = template.result(binding)
      dry_run or File.open(File.join(@project_dir, 'Vagrantfile'), 'w') { |io| io << content }

      puts 'Successfully created a project.'
    end

    private

    def dry_run
      options[:dry_run]
    end

    def erb_template_path
      path = File.join(box_dir, 'Vagrantfile.erb')
      if !File.exist?(path)
        path = File.expand_path('../Vagrantfile.erb', __FILE__)
      end
      path
    end

    def populate_config
    end
  end
end
