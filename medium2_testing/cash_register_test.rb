require 'minitest/autorun'
#require 'stringio'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def test_accept_money
    register = CashRegister.new(1000)
    transaction1 = Transaction.new(40)
    transaction1.amount_paid = 40

    previous_amount = register.total_money
    register.accept_money(transaction1)
    current_amount = register.total_money
    
    assert_equal(previous_amount + 40, current_amount)
  end

  def test_change
    register = CashRegister.new(1000)
    transaction1 = Transaction.new(40)
    transaction1.amount_paid = 50

    assert_equal 10, register.change(transaction1)
  end

  def test_give_receipt
    item_cost = 50
    register = CashRegister.new(1000)
    transaction1 = Transaction.new(item_cost)

    assert_output("You've paid $#{item_cost}.\n") {register.give_receipt(transaction1)}
  end

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30')
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 30, transaction.amount_paid
  end
end