## usersテーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
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

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| name       | string      | null: false                    |
| data       | text        | null: false                    |
| category   | integer     | null: false                    |
| price      | integer     | null: false                    |
| situation  | integer     | null: false                    |
| postage    | integer     | null: false                    |
| sender     | integer     | null: false                    |
| send_day   | integer     | null: false                    |
| user       | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- belongs_to :buy
- has_one_attached :image

## buysテーブル

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| item      | references  | null: false, foreign_key: true |
| user      | references  | null: false, foreign_key: true |

### Association
- has_one :items
- belongs_to :user
- belongs_to :address

## addressesテーブル

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| name       | string      | null: false                    |
| post       | string      | null: false                    |
| prefecture | string      | null: false                    |
| city       | integer     | null: false                    |
| address    | string      | null: false                    |
| building   | string      |                                |
| tel        | string      | null: false                    |
| buy        | references  | null: false, foreign_key: true |

### Association
- belongs_to :buy
- has_one :buys

## commentsテーブル

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| content   | text        | null: false                    |
| item      | references  | null: false, foreign_key: true |
| user      | references  | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user