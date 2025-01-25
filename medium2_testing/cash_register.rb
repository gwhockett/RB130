#require_relative 'transaction'

class CashRegister
  attr_reader :total_money

  def initialize(total_money)
    @total_money = total_money
  end

  def change(transaction)
    change = transaction.amount_paid - transaction.item_cost
    #@total_money = @total_money - change
    change
  end

  def give_receipt(transaction)
    puts "You've paid $#{transaction.item_cost}."
  end

  def accept_money(transaction)
    @total_money += transaction.amount_paid
  end

  def start_transaction(transaction)
    transaction.prompt_for_payment
    accept_money(transaction)
    change(transaction)
    give_receipt(transaction)
  end
end

#buy1 = CashRegister.new(1000)
#transaction1 = Transaction.new(20)
#transaction1.amount_paid = 30
#p buy1.accept_money(transaction1)
#p buy1.change(transaction1)
#p buy1.total_money
#puts buy1.give_receipt(transaction1)
