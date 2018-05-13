require_relative 'food'

class Add
  attr_accessor :lunchlady, :menu_items

def initialize(menu_items)
  @lunchlady = lunchlady
  @menu_items = menu_items
  add_item
end

  def add_item
    puts "What do you think we should have on the menu?"
    food = gets.strip
    puts "Should that be a 1) Main dish or 2) Side dish?"
    type = gets.strip.to_i
    puts "How much should it cost (please keep in mind our bottom line)"
    cost = gets.strip.to_i
      if cost > 25
        puts "Okay, customers will never pay that much. You obviously have never worked in food service".colorize(:red)
        puts "Try again".colorize(:red)
        add_item
      else
        thing = Food.new(food, cost)
      end
      case type
        when 1
          @menu_items.maindish << thing
          puts "Alright, thanks for adding #{thing.dish} for $#{thing.price}"
        when 2
          @menu_items.sidedish << thing
          puts "Alright, thanks for adding #{thing.dish} for $#{thing.price}"
        else
          puts "That's not going to work, try again"
          add_item
        end

      puts "Would you like to add another item [Y/N]"
      selection = gets.strip.downcase
        if selection == "y"
          add_item
        else
          puts "Returning to main menu"
        end
    end
end
