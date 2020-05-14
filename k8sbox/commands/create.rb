class Create < Commands::Create
  def populate_config
    config.num_instances = prompt.ask('Number of instances:', default: 2, convert: :int)
    config.instance_name_prefix = prompt.ask('Instance name prefix:', default: 'k8s')
    config.subnet = prompt.ask('Cluster subnet (e.g. 172.17.9):', value: '172.17.', required: true)
    config.taint_master = prompt.yes?('Taint master (pods will not be scheduled to master)?', default: false)
  end

  def post_setup
    kubespray_version = File.read(File.join(box_dir, '.kubespray_version')).strip
    dry_run or system <<-EOF
      sh -c 'cd #{@project_name} && \
        git submodule add https://github.com/kubernetes-sigs/kubespray.git && \
        cd kubespray && git checkout -b "#{kubespray_version}" "#{kubespray_version}" \
      '
    EOF
  end
end
