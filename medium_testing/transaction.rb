# transaction.rb

class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end

def prompt_for_payment(input: $stdin, output: $stdout)
  # input: is a keyword argument and $stdin is a global variable
  # that Ruby uses for the default source of input, the keyboard
  # here we are going to use it to mock keyboard input when the
  # test is run.
  # $stdout consumes the output of puts so we have a "clean"
  # test
  loop do
    output.puts "You owe $#{item_cost}.\nHow much are you paying?"
    @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
    break if valid_payment? && sufficient_payment?
    output.puts "That is not the correct amount. " \
         "Please make sure to pay the full cost."
  end
end

  private

  def valid_payment?
    amount_paid > 0.0
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end
end
