FactoryBot.define do

	factory :user do
		nickname              {'フリマ太郎'}
		email			            {'sample@gmail.com'}
		password              {'12345a'}
		encrypted_password    {password}
		family_name           {'田中'}
		first_name            {'太郎'}
		family_name_kana      {'タナカ'}
		first_name_kana       {'タロウ'}
		birth_day             {'2000-01-01'}
	end
end