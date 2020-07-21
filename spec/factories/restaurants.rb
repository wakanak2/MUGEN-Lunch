FactoryBot.define do
  factory :restaurant do
    name {'蓬莱園'}
    name_kana{ 'ホウライエン' }
    postcode{'5540031'}
    address{'大阪府大阪市此花区桜島２丁目１−３３'}
    tel{'11122223333'}
    weekday_start{'11:00'}
    weekday_finish{'15:00'}
    weekend_start{'11:00'}
    weekend_finish{'15:00'}
    holiday{'月'}
    seat{'10'}
    homepage{'xxxxxxxxxxxxx'}
    standing{"あり"}
    smoking{"禁煙"}
    closed{"開業中"}
  end
end
