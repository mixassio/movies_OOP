require_relative '../cashbox.rb'

describe Cashbox do
  let(:host_class) { Class.new.include(Cashbox) }
  let(:cash_desk) { host_class.new }
  context 'empty cashdesk' do
    it { expect(cash_desk.cash).to be == '$0.00' }
  end
  context 'add money' do
    it {
      expect do
        cash_desk.pay_to_cash(10)
        cash_desk.pay_to_cash(20)
      end.to change(cash_desk, :cash).to('$30.00')
    }
  end
  context 'incase' do
    it { expect { cash_desk.take('murder') }.to raise_error(RuntimeError) }
    before { cash_desk.take('Bank') }
    it { expect(cash_desk.cash).to be == '$0.00' }
  end
end
