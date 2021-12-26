class Store < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :name, presence: true, length: { maximum: 30 }
  validates :profile, presence: true, length: { maximum: 100 }
  validates :station_name, presence: true, length: { maximum: 20 }
  validates :addres, presence: true, length: { maximum: 50 }
  validates :phone_number, presence: true, length: { maximum: 15 }

  enum how_to_work:{登録制:0, 短期:1, シフト申告制:2, 週１日可:3, Wワーク可:4}
  enum how_to_earn:{高収入:0, 日払い可:1, 週払い可:2, 月給:3}
  enum treatment:{高校生募集:0, 大学生募集:1, フリーター募集:2, 主婦募集:3, 人手不足:4}
  enum go_to_work:{車、バイク可:0, 駅チカ:1, 駅ナカ:2}
  enum skill:{接客業:0, 体を動かす:1, スキルがつく:2, 語学力求む:3, PCスキル歓迎:4, リーダー候補募集:5}
  enum salary:{時給900円以上:0, 時給950円以上:1, 時給1000円以上:2, 時給1050円以上:3, 時給1100円以上:4, 時給1150円以上:5, 時給1200円以上:6, 時給1300円以上:7, 時給1500円以上:8, その他:9}
  enum time_zone:{早朝:0, 朝:1, 昼:2, 夕:3, 夜:4, 深夜:5}
  enum atmosphere:{明るめ:0, 年齢層バラバラ:1, 落ち着いている:2, 体育会系:3, 文化系:4, 主婦・パート中心:5, 社員多め:6, バイトリーダー中心:7}
  enum age_group:{平均年齢20代:0, 平均年齢30代:1, 平均年齢40代:2, 平均年齢50代:3, 平均年齢60代:4}
  enum station_on_foot:{駅から徒歩5分以内:0, 駅から徒歩10分以内:1, 駅から徒歩15分以内:2, 駅から徒歩30分以内:3,それ以上:4}
  enum prefecture_name:{北海道:0,青森県:1,岩手県:2,宮城県:3,秋田県:4,山形県:5,福島県:6,
    茨城県:7,栃木県:8,群馬県:9,埼玉県:10,千葉県:11,東京都:12,神奈川県:13,
    新潟県:14,富山県:15,石川県:16,福井県:17,山梨県:18,長野県:19,
    岐阜県:20,静岡県:21,愛知県:22,三重県:23,
    滋賀県:24,京都府:25,大阪府:26,兵庫県:27,奈良県:28,和歌山県:29,
    鳥取県:30,島根県:31,岡山県:32,広島県:33,山口県:34,
    徳島県:35,香川県:36,愛媛県:37,高知県:38,
    福岡県:39,佐賀県:40,長崎県:41,熊本県:42,大分県:43,宮崎県:44,鹿児島県:45,沖縄県:46}
end
