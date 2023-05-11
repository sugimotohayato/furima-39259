## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |


### Association
- has_many :items
- has_many :comments
- has_many :buys

## itemsテーブル

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| name       | string      | null: false                    |
| category   | string      | null: false                    |
| price      | integer     | null: false                    |
| situation  | string      | null: false                    |
| postage    | boolean     | null: false                    |
| sender     | string      | null: false                    |
| send_day   | datetime    | null: false                    |
| user       | reference   | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_many :comments
- has_many :buys
- has_one_attached :image

## buyテーブル

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| item      | reference   | null: false, foreign_key: true |
| user      | reference   | null: false, foreign_key: true |

### Association
- belongs_to :items
- belongs_to :users
- has_one :users

## addressesテーブル

| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| name       | string      | null: false                    |
| post       | integer     | null: false                    |
| prefecture | string      | null: false                    |
| city       | string      | null: false                    |
| address    | string      | null: false                    |
| building   | string      | null: false                    |
| tel        | integer     | null: false                    |
| buy        | reference   | null: false, foreign_key: true |

### Association
- belongs_to :buys

## commentsテーブル

| Column    | Type        | Options                        |
| --------- | ----------- | ------------------------------ |
| content   | text        | null: false                    |
| item      | reference   | null: false, foreign_key: true |
| user      | reference   | null: false, foreign_key: true |

### Association
- belongs_to :items
- belongs_to :users