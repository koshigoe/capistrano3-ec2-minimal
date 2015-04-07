namespace :ec2 do
  desc 'Show matched ec2 instances.'
  task :list do
    ec2_each_instances do |instance|
      p instance
    end
  end
end
