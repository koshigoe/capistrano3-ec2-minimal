require 'capistrano/ec2/minimal/version'
require 'aws-sdk-core'

module Capistrano
  module Ec2
    module Minimal
    end
  end
end

load File.expand_path("../../../tasks/ec2.rake", __FILE__)
