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
- has_many :orders

## items テーブル

| Column       | Type       | Options                            |
| ------------ | ---------- | ---------------------------------- |
| title        | string     | null: false                        |
| explan       | text       | null: false                        |
| image        | ActiveStorageで実装                              |
| user         | references | foreign_key: true                  |
| price        | integer    | null: false                        |
| category_id  | integer    | null: false                        |
| status_id    | integer    | null: false                        |
| send_fee_id  | integer    | null: false                        |
| send_area_id | integer    | null: false                        |
| send_day_id  | integer    | null: false                        |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## order テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| item       | references | foreign_key: true |
| user       | references | foreign_key: true |

### Association

- belongs_to :item
- has_one :deli
- belongs_to :user

## deli テーブル

| Colum          | Type       | Options           |
| -------------- | -----------| ----------------- |
| postal         | string     | null: false       |
| send_area_id   | integer    | null: false       |
| city           | string     | null: false       |
| banchi         | string     | null: false       |
| bill           | string     |                   |
| phone          | string     | null: false       |
| order          | references | foreign_key: true |

### Association

- belongs_to :order

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| text      | text       | null: false                    |
| items     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
