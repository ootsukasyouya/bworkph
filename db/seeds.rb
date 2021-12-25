# 20.times do |n|
#     User.create!(
#       email: "test#{n + 1}@test.com",
#       name: "テスト店舗#{n + 1}",
#       status: "店舗",
#       password: "123456"
#     )
#   end
#
# Store.create!(
#   user_id: User.find(17).id,
#   name: "ノマノマ",
#   profile: "コロナで潰れそう",
#   station_name: "高田馬場駅",
#   addres: "東京都新宿区高田馬場１丁目３５−２",
#   phone_number: "070-000",
#   how_to_work: "シフト申告制",
#   how_to_earn: "高収入",
#   treatment: "大学生募集",
#   go_to_work: "駅ナカ",
#   skill: "リーダー候補募集",
#   salary: "時給1300円以上",
#   time_zone: "夕",
#   atmosphere: "明るめ",
#   age_group: "平均年齢20代",
#   prefecture_name: "東京都",
#   station_on_foot: "駅から徒歩5分以内"
# )
#
# Store.create!(
#   user_id: User.find(18).id,
#   name: "Hうどん",
#   profile: "昼の人数足りません",
#   station_name: "丸亀駅",
#   addres: "香川県高松市浜ノ町 １−２０",
#   phone_number: "070-000000000",
#   how_to_work: "登録制",
#   how_to_earn: "日払い可",
#   treatment: "人手不足",
#   go_to_work: "車、バイク可",
#   skill: "接客業",
#   salary: "時給900円以上",
#   time_zone: "昼",
#   atmosphere: "体育会系",
#   age_group: "平均年齢50代",
#   prefecture_name: "香川県",
#   station_on_foot: "それ以上"
# )
# Store.create!(
#   user_id: User.find(19).id,
#   name: "ラーメン王セウ牧ノ原店",
#   profile: "賄いクソうまい",
#   station_name: "印西牧の原駅",
#   addres: "千葉県印西市草深２１９１",
#   phone_number: "070-000000",
#   how_to_work: "Wワーク可",
#   how_to_earn: "月給",
#   treatment: "フリーター募集",
#   go_to_work: "車、バイク可",
#   skill: "体を動かす",
#   salary: "時給1000円以上",
#   time_zone: "夜",
#   atmosphere: "年齢層バラバラ",
#   age_group: "平均年齢50代",
#   prefecture_name: "千葉県",
#   station_on_foot: "駅から徒歩10分以内"
# )
# Store.create!(
#   user_id: User.find(20).id,
#   name: "すんたば",
#   profile: "田舎に咲く一輪の花",
#   station_name: "いわき駅",
#   addres: "福島県いわき市平田町",
#   phone_number: "070-000000",
#   how_to_work: "週１日可",
#   how_to_earn: "月給",
#   treatment: "主婦募集",
#   go_to_work: "車、バイク可",
#   skill: "体を動かす",
#   salary: "時給950円以上",
#   time_zone: "早朝",
#   atmosphere: "主婦・パート中心",
#   age_group: "平均年齢50代",
#   prefecture_name: "福島県",
#   station_on_foot: "駅から徒歩30分以内"
# )
#
#
# 16.times do |n|
#     Store.create!(
#       user_id: User.find(n + 1).id,
#       name: "テスト店舗#{n + 1}",
#       profile: "test#{n + 1}",
#       station_name: "浜松駅",
#       addres: "静岡県浜松市中区砂山町６−２",
#       phone_number: "0000000",
#       how_to_work: "週１日可",
#       how_to_earn: "月給",
#       treatment: "高校生募集",
#       go_to_work: "駅チカ",
#       skill: "語学力求む",
#       salary: "時給1050円以上",
#       time_zone: "深夜",
#       atmosphere: "社員多め",
#       age_group: "平均年齢60代",
#       prefecture_name: "静岡県",
#       station_on_foot: "駅から徒歩15分以内"
#     )
#   end
