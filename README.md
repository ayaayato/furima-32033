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

| Column    | Type       | Options                            |
| --------- | ---------- | ---------------------------------- |
| title     | string     | null: false                        |
| explan    | text       | null: false                        |
| image     | ActiveStorageで実装                              |
| user      | references | foreign_key: true                  |
| price     | integer    | null: false                        |
| category  | integer    | null: false                        |
| status    | integer    | null: false                        |
| send_fee  | integer    | null: false                        |
| send_area | integer    | null: false                        |
| send_day  | integer    | null: false                        |

### Association

- belongs_to :user
- has_many :comments
- has_one :bought

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

| Colum  | Type       | Options           |
| ------ | -----------| ----------------- |
| post   | string     | null: false       |
| area   | integer    | null: false       |
| city   | string     | null: false       |
| number | string     | null: false       |
| bill   | string     |                   |
| phone  | string     | null: false       |
| bought | references | foreign_key: true |

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
