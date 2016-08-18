# 01/02/03 Town Hall Author's reading Mark Twain $5.50
class Ticket
  attr_accessor :date, :venue, :price

  VENUE = %w(Reflektor AB).freeze

  def initialize(date, venue)
    raise ArgumentError, "Unknown venue #{venue}" unless VENUE.include?(venue)

    @venue = venue
    @date = date
  end

  def self.most_expensive(*tickets)
    tickets.max_by(&:price)
  end
end
# puts "This ticket is for: #{ticket.event}, at #{ticket.venue}, on #{ticket.date}. " \
#      "The perfomer is #{ticket.perfomer}. " \
#      "The seat is ticket.seat, and it costs #{'%.2f.' % ticket.price}"

# print 'Information desired: '
# request = gets.chomp

# if ticket.respond_to?(request)
#   puts ticket.send(request)
# else
#   puts "no method #{request}."
# end
