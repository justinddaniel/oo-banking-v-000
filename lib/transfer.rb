class Transfer

attr_accessor :status
attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.valid? == false || self.status == "complete" || self.amount > sender.balance
      "Transaction rejected. Please check your account balance."
      self.status = "rejected"
    else
      sender.balance -= self.amount 
      receiver.balance += self.amount
      self.status = "complete"
    end
  end

end
