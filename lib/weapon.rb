module Splatoon2Weapon
  class Weapon
    @@config = nil

    def initialize(**args)
      @name = args[:name]
    end

    class << self
      def config
        unless @@config
          @@config = Dir.glob("#{File.dirname(__FILE__)}/../../config/weapons.yml").each_with_object({}) do |file, weapons|
            weapons.merge!(YAML.load_file(file))
          end
        end
        @@config
      end

      def names
        config.keys
      end

      def all
        @@all_weapons ||= config.map { |key, prof| prof[:key]; new(prof) }
      end

      def find_by_name(weapon_name)
        all_weapons.find { |weapon| [weapon.name].include?(weapon_name) } || (raise UnknownWeaponError, "Unknown weapon: #{weapon_name}")
      end
    end

    class UnknownWeaponError < StandardError; end
  end
end