require_relative 'stacklike'

class CargoHold
  include Stacklike

  def load_and_report(obj)
    puts "loading suitcase #{obj.object_id}"
    add_to_stack(obj)
  end

  def unload
    remove_from_stack
  end
end
