# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| name                 | string | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |
| first_kana           | string | null: false |
| last_kana            | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :boughts

## items テーブル

| Column        | Type       | Options                            |
| ------------- | ---------- | ---------------------------------- |
| title         | string     | null: false                        |
| explan        | text       | null: false                        |
| image         | ActiveStorageで実装                              |
| user          | references | foreign_key: true                  |
| category_id   | integer    | null: false                        |
| status_id     | integer    | null: false                        |
| price_id      | integer    | null: false                        |
| send_fee_id   | integer    | null: false                        |
| send_area_id  | integer    | null: false                        |
| send_day_id   | integer    | null: false                        |

### Association

- belongs_to :user
- has_many :comments
- has_one :bought
- belongs_to :genre

## genres テーブル

| Column     | Type       | Options                            |
| ---------- | ---------- | ---------------------------------- |
| category   | integer    | null: false                        |
| status     | integer    | null: false                        |
| price      | integer    | null: false                        |
| send_fee   | integer    | null: false                        |
| send_area  | integer    | null: false                        |
| send_day   | integer    | null: false                        |

### Association

- has_many :items


## bought テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| item       | references | foreign_key: true |
| user       | references | foreign_key: true |

### Association

- belongs_to :item
- has_one :deli
- belongs_to :user

## deli テーブル

| Column      | Type       | Options           |
| ----------- | -----------| ----------------- |
| deli_post   | string     | null: false       |
| deli_area   | integer    | null: false       |
| deli_city   | string     | null: false       |
| deli_number | string     | null: false       |
| deli_bill   | string     |                   |
| deli_phone  | string     | null: false       |
| bought      | references | foreign_key: true |

### Association

- belongs_to :bought

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| text      | text       | null: false                    |
| items     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
