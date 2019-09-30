require 'rubygems'
ENV['BUNDLE_GEMFILE'] = File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup'
Bundler.require(:default)

$LOAD_PATH.unshift(File.expand_path('..', __FILE__))

require 'commands/create'

class CLI < Thor
  attr_reader :prompt

  def initialize(*args)
    super(*args)
    @prompt = TTY::Prompt.new(help_color: :cyan)
  end

  desc 'create', 'Create a project from a base box'
  option :name, desc: 'Project name'
  option :base, desc: 'Base box'
  option :dry_run, default: false, desc: 'Dry run'
  def create
    if (box = options[:base]).nil?
      boxes = Dir[File.expand_path('../../*/Vagrantfile', __FILE__)].map { |path| File.basename(File.dirname(path)) }
      box = prompt.select('Choose a base box:', boxes)
    end
    box_dir = File.expand_path("../../#{box}", __FILE__)
    path = File.join(box_dir, 'commands/create.rb')
    if File.exist?(path)
      mod = Module.new
      mod.module_eval(File.read(path))
      clazz = mod.const_get(:Create)
    else
      clazz = Commands::Create
    end
    clazz.new(self, box_dir).execute
  end
end

CLI.start(ARGV)
