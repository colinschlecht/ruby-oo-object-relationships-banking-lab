class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    @@all = []

    def initialize(name)
        @balance = 1000
        @name = name
        @status = "open"
    end

    def self.all
        @@all
    end

    def deposit(amt)
        self.balance += amt
    end
    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        self.balance > 0 && self.status == "open"
    end

    def close_account
        self.status = "closed"
    end
end
