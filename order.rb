require_relative 'menu_items'

class Order
  attr_accessor :person, :menu_items

  def initialize(person, menu_items)
    @menu_items = menu_items
    @person = person
    main_order
  end

  def main_order
    puts "#{@person.name}, which of the following items would you like to add to your order?"
    @menu_items.list_main_dish
    user_choice = gets.strip.to_i - 1
    if user_choice > (@menu_items.maindish.length - 1)
      puts "Sorry we don't have that dish, let's try again"
      puts
      main_order
    else
      @menu_items.pick_main(user_choice)
    end
    @person.cart << @menu_items.maindish[user_choice]
    cash_left = (@person.wallet - (@menu_items.maindish[user_choice].price))
    puts "\tYou have $#{cash_left} remaining"
    puts
    side_order
  end

  def side_order
    puts "Alright, let's pick out a side"
      @menu_items.list_side_dish
        user_choice = gets.strip.to_i - 1
    if user_choice > (@menu_items.sidedish.length - 1)
      puts "Sorry that side dish doesn't exist, try again"
      puts
      side_order
    else
      @menu_items.pick_side(user_choice)
    end
      @person.cart << @menu_items.sidedish[user_choice]
    puts "You seem hungry, let's pick out another side!"
      @menu_items.list_side_dish
        user_choice = gets.strip.to_i - 1
    if user_choice > (menu_items.sidedish.length - 1)
      puts "Why did you choose something that doesn't exist?"
      puts "Now we have to start our side order again"
        @person.cart.pop
      side_order
    else
      @menu_items.pick_side(user_choice)
    end
      @person.cart << menu_items.sidedish[user_choice]
      review_order
  end

  def review_order
    puts "Okay, so far this is what I have for your order"
    puts
      @person.cart.each_with_index do |item, index|
        list_index = index + 1
      puts "\t#{list_index}) #{item.dish} - $#{item.price}"
      end
    puts "Do you want to confirm and pay [Y/N] ?"
      confirm = gets.strip.downcase
     if confirm != "y"
       puts "\tWhat an indecisive person. Let's start your whole order over".colorize(:red)
       @person.cart = []
      puts
      main_order
    else
      puts "\tOkay, let's see if you can foot the bill"
    end
    calculate
  end

  def calculate
    total = @person.cart[0].price + @person.cart[1].price + @person.cart[2].price
    puts "\tYour meal cost $#{total} and you started with $#{@person.wallet}"
      if @person.wallet < total
        puts "*" * 50
        puts "\tSorry, you spent too much and we aren't feeling generous today".colorize(:red)
        puts "\tYou're welcome to try again, this time be more frugal!!!".colorize(:red)
        puts "*" * 50
        LunchLady.new
      else
        @person.wallet = @person.wallet - total
      end
    puts "\tDo you want to confirm your order?"
    puts "Select [Y] to get you grub or [N] to start over"
      selection = gets.strip.downcase
      if selection != "y"
        puts "Fine, fine, let's do this all over again".colorize(:red)
          @order_start
      else
        puts "*" * 50
        puts "\tWe have confirmed your order and our delivery person is on their way!"
        puts "\tYou spent $#{total} and have $#{@person.wallet} remaining.".colorize(:green)
        puts "\tThanks for eating at the DPL Cafeteria.".colorize(:cyan)
        puts "\tSending you back to the main menu."
        puts "*" * 50
        LunchLady.new
      end
  end
end
