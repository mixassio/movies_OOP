require 'Money'

I18n.enforce_available_locales = false

module Cashbox
  def account
    @account ||= Money.from_amount(0, 'USD')
  end

  def pay_to_cash(money)
    @account = account + Money.from_amount(money, 'USD')
  end

  def take(who)
    raise('Alarm, police was caled!') if who != 'Bank'
    @account = Money.from_amount(0, 'USD')
    puts 'Encashment was carried out'
  end

  def cash
    account.format
  end
end
