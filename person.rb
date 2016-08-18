class Person
  PERSON = []

  attr_reader :first_name, :last_name
  attr_accessor :city, :friends, :hobbies

  def initialize(first_name)
    @first_name = first_name
    @last_name = last_name
    @friends = []
    @hobbies = []

    PERSON << self
  end

  def has_friend(f)
    @friends << f
  end

  def has_hobby(h)
    @hobbies << h
  end

  def self.method_missing(m, *args)
    method = m.to_s

    if method.start_with?('all_with_')
      att = method[9..-1]
      if public_method_defined?(att)
        PERSON.find_all do |person|
          person.send(att).include?(args[0])
        end
      else
        raise ArgumentError, "Unknown method #{att}"
      end
    else
      super
    end
  end
end

john = Person.new('John')
paul = Person.new('Paul')
ringo = Person.new('Ringo')

john.has_friend('Paul')
ringo.has_friend('Paul')
ringo.has_hobby('guitar')
paul.has_hobby('guitar')
john.has_hobby('painting')

Person.all_with_friends('Paul').each { |p| puts p.first_name }
Person.all_with_hobbies('guitar').each { |p| puts p.first_name }
