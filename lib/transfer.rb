require 'pry'
class Transfer
  
  attr_accessor :amount, :receiver, :sender, :status

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def accept_transfer
    self.status = "complete"
    receiver.deposit(self.amount)
    sender.deposit(-self.amount)
  end

  def reject_transfer
    self.status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if valid? && self.status == "pending" && sender.balance >= self.amount 
      accept_transfer
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.deposit(-self.amount)
      sender.deposit(self.amount)
      self.status = "reversed"
    end
  end



end


# def execute_transaction
#   if @status == 'pending' && @sender.balance >= @amount && @sender.valid? && @receiver.valid?
#     #binding.pry
#     @receiver.deposit(@amount)
#     @sender.deposit(-@amount)
#     @status = 'complete'
#   else
#     @status = 'rejected'
#     "Transaction rejected. Please check your account balance."
#   end
# end