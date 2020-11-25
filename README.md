# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | ------ | ----------- |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |
| first_name.kana      | string | null: false |
| last_name.kana       | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_one :cards
- has_one :buyers

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ------     | ------------------------------ |
| name               | string     | null: false                    |
| plice              | string     | null: false                    |
| status             | string     | null: false                    |
| delivery_fee       | string     | null: false                    |
| method_of_shipment | string     | null: false                    |
| ship_form          | string     | null: false                    |
| day_to_ship        | string     | null: false                    |
| user_id            | integer    | null: false, foreign_key: true |

## Association

- has_many :images
- belongs_to :users

## buyers テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |  
| user_id         | integer | null: false, foreign_key: true |
| last_name       | string  | null: false                    |
| first_name      | string  | null: false                    |
| first_name_kana | string  | null: false                    |
| last_name_kana  | string  | null: false                    |
| post_code       | string  | null: false                    |
| prefecture      | string  | null: false                    |
| city            | string  | null: false                    |
| address         | string  | null: false                    |
| building_name   | string  |                                |
| phone_number    | string  |                                |

### Association

- belongs_to :users

## cards テーブル

| Column      | Type   | Options                        |
| ----------- | -------| ------------------------------ |  
| card_number | string | null: false                    |
| exp_month   | string | null: false                    |
| exp_year    | string | null: false                    |

- belongs_to :users

## images テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |  
| image  | string     | null: false                    |

- belongs_to :users