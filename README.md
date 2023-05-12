## usersテーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_kana    | string   | null: false               |
| last_name_kana     | string   | null: false               |
| birthday           | date     | null: false               |


### Association
- has_many :items
- has_many :comments
- has_many :buys

## itemsテーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| name          | string      | null: false                    |
| data          | text        | null: false                    |
| category_id   | integer     | null: false                    |
| price         | integer     | null: false                    |
| situation_id  | integer     | null: false                    |
| postage_id    | integer     | null: false                    |
| prefecture_id | integer     | null: false                    |
| send_day_id   | integer     | null: false                    |
| user          | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :buy
- has_one_attached :image

## buysテーブル

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| item      | references  | null: false, foreign_key: true |
| user      | references  | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル

| Column        | Type        | Options                        |
| --------------| ----------- | ------------------------------ |
| post          | string      | null: false                    |
| prefecture_id | string      | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building      | string      |                                |
| tel           | string      | null: false                    |
| buy           | references  | null: false, foreign_key: true |

### Association
- belongs_to :buy

## commentsテーブル

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| content   | text        | null: false                    |
| item      | references  | null: false, foreign_key: true |
| user      | references  | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user