# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| first_kana | string | null: false |
| last_kana  | string | null: false |
| birthday   | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :bought

## items テーブル

| Column     | Type       | Options                            |
| ---------- | ---------- | ---------------------------------- |
| title      | string     | null: false                        |
| explan     | text       | null: false                        |
| image      | ActiveStorageで実装                              |
| user_id    | references | foreign_key: true                  |
| category   | string     | null: false                        |
| status     | string     | null: false                        |
| price      | string     | null: false                        |
| send_fee   | string     | null: false                        |
| send_area  | string     | null: false                        |
| send_day   | string     | null: false                        |

### Association

- belongs_to :user
- has_many :comments
- 

## bought テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| item_id    | references | foreign_key: true |
| deli_id    | references | foreign_key: true |
| user_id    | references | foreign_key: true |

### Association

- belongs_to :items
- has_one :deli
- belings_to :user

## deli テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| deli_post   | integer | null: false |
| deli_area   | string  | null: false |
| deli_city   | string  | null: false |
| deli_number | integer | null: false |
| deli_bill   | string  | null: false |
| deli_phone  | integer | null: false |

### Association

- belings_to :bought

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| text      | text       | null: false                    |
| items     | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user
