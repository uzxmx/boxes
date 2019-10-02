class Create < Commands::Create
  def populate_config
    config.num_instances = prompt.ask('Number of instances:', default: 2, convert: :int)
    config.instance_name_prefix = prompt.ask('Instance name prefix:', default: 'k8s')
    config.subnet = prompt.ask('Cluster subnet (e.g. 172.17.9):', value: '172.17.', required: true)
    config.taint_master = prompt.yes?('Taint master (pods will not be scheduled to master)?', default: true)

    config.ansible_playbooks_path = 'ansible_playbooks'
    dry_run or system("sh -c 'cd #{@project_name} && git submodule add https://github.com/uzxmx/ansible_playbooks.git && cd ansible_playbooks && git submodule update --init --recursive'")
  end
end
