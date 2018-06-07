module Cashbox
    def account
        @account ||= 0
    end

    def pay_to_cash(money)
        @account = account.to_i + money.to_i
    end

    def incase
        @account = 0
        puts 'Encashment was carried out'
    end

    def get_cash
        account
    end
end