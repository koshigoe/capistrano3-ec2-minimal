require 'capistrano/ec2/minimal/version'
require 'aws-sdk-core'

module Capistrano
  module DSL
    module Ec2
      module Minimal
        class Instances
          include Enumerable

          def initialize
            ec2 = Aws::EC2::Client.new
            filters = [
              { name: 'tag:Project', values: [fetch(:application)] },
              { name: 'tag:Stage', values: [fetch(:stage)] },
              { name: 'instance-state-name', values: %w(running) },
            ]
            @reservations = ec2.describe_instances(filters: filters).reservations
          end

          def each
            @reservations.each do |reservation|
              reservation.instances.each do |instance|
                yield(instance)
              end
            end
          end
        end

        def ec2_each_instances
          Instances.new
        end

        def ec2_set_servers(options = {})
          Instances.new.each do |instance|
            if roles_tag = instance.tags.find { |tag| tag.key == 'Roles' }
              roles = roles_tag.value.split(',').map(&:strip).reject(&:empty?).uniq
              options[:roles] = roles unless roles.empty?
            end
            server instance.private_ip_address, options
          end
        end
      end
    end
  end
end
extend Capistrano::DSL::Ec2::Minimal

load File.expand_path("../../tasks/ec2.rake", __FILE__)
