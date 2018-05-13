require_relative 'menu_items'

require 'pry'

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
    cash_left =4 (@person.wallet - (@menu_items.maindish[user_choice].price))
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
      @person.cart.each_with_index do |item, index|
        list_index = index + 1
      puts "\t#{list_index}) #{item.dish} - #{item.price}"
      end
    puts "Do you want to confirm and pay [Y/N] ?"
      confirm = gets.strip.downcase
     if confirm != "y"
       puts "\tWhat an indecisive person. Let's start your whole order over"
       @person.cart = []
      puts
      main_order
    else
      puts "Okay, let's see if you can foot the bill"
    end
    calculate
  end

  def calculate
    binding.pry
  end




end
