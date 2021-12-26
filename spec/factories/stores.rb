FactoryBot.define do
  factory :store do
    name { "test2" }
    addres { "千葉県印旛郡本埜村滝野" }
    phone_number { "000000000" }
    profile { "test_store2" }
    station_name {"印西牧の原駅"}
    how_to_work {"シフト申告制"}
    how_to_earn {"高収入"}
    treatment {"大学生募集"}
    go_to_work {"駅ナカ"}
    skill {"リーダー候補募集"}
    salary {"時給1300円以上"}
    time_zone {"夕"}
    atmosphere {"明るめ"}
    age_group {"平均年齢20代"}
    prefecture_name {"千葉県"}
    station_on_foot {"駅から徒歩5分以内"}
  end

  factory :second_store, class: Store do
    name { "test4" }
    addres { "茨城県水戸市常磐町" }
    phone_number { "000000000" }
    profile { "test_store4" }
    station_name {"水戸駅"}
    how_to_work {"登録制"}
    how_to_earn {"日払い可"}
    treatment {"人手不足"}
    go_to_work {"車、バイク可"}
    skill {"接客業"}
    salary {"時給900円以上"}
    time_zone {"昼"}
    atmosphere {"体育会系"}
    age_group {"平均年齢50代"}
    prefecture_name {"茨城県"}
    station_on_foot {"それ以上"}
  end

  factory :third_store, class: Store do
    name { "test5" }
    addres { "福島県いわき市鹿島町" }
    phone_number { "000000000" }
    profile { "test_store5" }
    station_name {"印西牧の原駅"}
    how_to_work {"Wワーク可"}
    how_to_earn {"月給"}
    treatment {"フリーター募集"}
    go_to_work {"車、バイク可"}
    skill {"体を動かす"}
    salary {"時給1000円以上"}
    time_zone {"夜"}
    atmosphere {"年齢層バラバラ"}
    age_group {"平均年齢20代"}
    prefecture_name {"福島県"}
    station_on_foot {"駅から徒歩10分以内"}
  end
end
