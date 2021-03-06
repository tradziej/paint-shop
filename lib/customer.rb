require_relative 'errors'
require_relative 'paint'

module PaintShop
  class Customer
    include Comparable

    attr_reader :preferences

    def initialize(preferences: [])
      raise 'Paint preferences can\'t be nil' if preferences.nil?
      raise 'Paint preferences aren\'t an array' unless preferences.is_a?(Array)
      @preferences = preferences
    end

    def self.parse(preference_string)
      raise 'Can\'t parse' if preference_string.nil?
      preferences = []

      parts = preference_string.split(' ')
      parts.each_slice(2) do |i, f|
        preferences << ::PaintShop::Paint.new(number: i.to_i, finish: f.to_sym)
      end

      Customer.new(preferences: preferences)
     rescue StandardError => e
      raise ::PaintShop::Errors::ParseError, "#{e.message} in #{preference_string.inspect}"
    end

    # checks if customer is satisfied by given solution, e.g. [:G, :G, :M]
    def satisfied_with?(solution = [])
      preferences.any? { |pref| pref.finish == solution[pref.number - 1] }
    end

    def <=>(other)
      unless other.is_a?(::PaintShop::Customer)
        raise TypeError, "Can't compare #{other.class} with PaintShop::Customer"
      end

      preferences.size <=> other.preferences.size
    end
  end
end