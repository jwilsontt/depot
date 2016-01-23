include ActiveMerchant::Billing

ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Biling::BraintreeGateway.new(
    :merchant_id => 'rg5cvw2bmwfnz485',
    :public_key => 'hk92phmwrk3nm289',
    :private_key => '5da9991a67646ebb70e73ab898809e22'
	)

credit_card = ActiveMerchant::Billing::CreditCard.new(
	:type => 'visa',
	:number =>  '411111111111111',
	:month =>  '8',
	:year => '2016',
	:first_name => 'Jason',
	:last_name => 'Wilson',
	:verification_value => '123'
)

response = gateway.purchase(1000, creditcard)
STDERR.puts response.success?
STDERR.puts response.message
STDERR.puts response.authorization
# puts "Is #{credit_card.number} valid? #{credit_card.valid?}"