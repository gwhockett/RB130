require 'minitest/autorun'
require_relative 'transaction'
require_relative 'cash_register'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(20)
  end

  def test_accept_money
    @transaction.amount_paid = 20
    previous_amount = @cash_register.total_money
    assert_equal(previous_amount + 20,
                 @cash_register.accept_money(@transaction))
  end

  def test_change
    @transaction.amount_paid = 30
    @cash_register.accept_money(@transaction)
    assert_equal(10, @cash_register.change(@transaction))
  end

  def test_give_receipt
    @transaction.amount_paid = 20
    @cash_register.accept_money(@transaction)
    # remember that #puts adds \n
    assert_output("You've paid $20.\n") do
      @cash_register.give_receipt(@transaction)
    end
  end

  # def test_transaction_amount_paid
  #   input = StringIO.new("20\n") # auto inputs needed info
  #   output = StringIO.new # consumes the output of the tested method
  #   @transaction.prompt_for_payment(input: input, output: output)
  #   assert_equal(20, @transaction.amount_paid)
  # end

  # we could also do this
  def test_prompt_for_payment
    input = StringIO.new('20\n')
    capture_io { @transaction.prompt_for_payment(input: input) }
    assert_equal(20, @transaction.amount_paid)
  end
end
