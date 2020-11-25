# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |
| first_name_kana      | string | null: false |
| last_name_kana       | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_many :histories

## items テーブル

| Column                | Type       | Options                       |
| --------------------- | ------     | ----------------------------- |
| name                  | string     | null: false                   |
| description           | text       | null: false                   |
| price                 | integer    | null: false                   |
| status_id             | integer    | null: false                   |
| delivery_fee_id       | integer    | null: false                   |
| method_of_shipment_id | integer    | null: false                   |
| ship_form_id          | integer    | null: false                   |
| day_to_ship_id        | integer    | null: false                   |
| user_id               | integer    | null: false, foreign_key: true|

## Association
- belongs_to :history
- belongs_to :user

## buyers テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |  
| history_id      | integer | null: false, foreign_key: true |
| post_code       | string  | null: false                    |
| ship_form_id    | intger  | null: false                    |
| city            | string  | null: false                    |
| address         | string  | null: false                    |
| building_name   | string  |                                |
| phone_number    | string  | null: false                    |

### Association

- belongs_to :history

## histories テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |  
| user_id         | integer | null: false, foreign_key: true |
| item_id         | integer | null: false, foreign_key: true |

### Association

- has_one :buyer
- belongs_to :item
- belongs_to :user