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
| birth              | date     | null: false               |


### Association
- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| name          | string      | null: false                    |
| data          | text        | null: false                    |
| category_id   | integer     | null: false                    |
| price         | integer     | null: false                    |
| condition_id  | integer     | null: false                    |
| postage_id    | integer     | null: false                    |
| state_id      | integer     | null: false                    |
| shipping_id   | integer     | null: false                    |
| user          | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :order
- has_one_attached :image

## ordersテーブル

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
| postcode      | string      | null: false                    |
| state_id      | integer     | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building      | string      |                                |
| tel           | string      | null: false                    |
| buy           | references  | null: false, foreign_key: true |

### Association
- belongs_to :order

## commentsテーブル

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| content   | text        | null: false                    |
| item      | references  | null: false, foreign_key: true |
| user      | references  | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user