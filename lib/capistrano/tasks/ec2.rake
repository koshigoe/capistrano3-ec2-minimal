require 'terminal-table'
require 'colorize'

namespace :ec2 do
  desc 'Show matched ec2 instances.'
  task :status do
    table = Terminal::Table.new(
      :style => {
        :border_x => "",
        :border_i => "",
        :border_y => ""
      }
    )
    table.add_row [
      "Num".colorize(:bold),
      "Name".colorize(:bold),
      "ID".colorize(:bold),
      "Type".colorize(:bold),
      "Zone".colorize(:bold),
      "Roles".colorize(:bold),
      "Stage".colorize(:bold)
    ]
    ec2_each_instances.each_with_index do |instance, index|
      name_tag = instance.tags.find{|t| t.key == 'Name' }
      name_tag = name_tag ? name_tag.value : ''
      roles_tag = instance.tags.find{|t| t.key == 'Roles' }
      roles_tag = roles_tag ? roles_tag.value : ''
      stage_tag = instance.tags.find{|t| t.key == 'Stage' }
      stage_tag = stage_tag ? stage_tag.value : ''

      table.add_row [
        sprintf("%02d:", index),
        name_tag.colorize(:green),
        instance.instance_id.colorize(:red),
        instance.instance_type.colorize(:cyan),
        instance.placement.availability_zone.colorize(:magenta),
        roles_tag.colorize(:yellow),
        stage_tag.colorize(:yellow),
      ]
    end
    puts table.to_s
  end
end
