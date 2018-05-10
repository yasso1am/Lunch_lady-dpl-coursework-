class NewPerson
  attr_accessor :order, :wallet

  def initialize(order, wallet)
    @order = order
    @wallet = wallet
  end

  def order
    @order.each_with_index do |order, index|
    list_index = index + 1
    puts "\t#{list_index}] #{order.dish} $#{order.price}"
    end
  end

  def sum_order
    sum = 0
    @order.each {|item| sum+=item[:price]}
  end

  def check_wallet
    sum = 0
    @order.each {|item| sum+=[:price]}
    balance = @wallet - sum
  end
end
