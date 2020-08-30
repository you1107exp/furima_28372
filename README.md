# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| family_name         | string | null: false |
| first_name          | string | null: false |
| family_name_reading | string | null: false |
| first_name_reading  | string | null: false |
| dob                 | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| image                  | string     | null: false                    |
| name                   | string     | null: false                    |
| explanation            | text       | null: false                    |
| category_id            | integer    | null: false                    |
| condition_id           | integer    | null: false                    |
| shipping_charge_id     | integer    | null: false                    |
| seller_prefecture_id   | integer    | null: false                    |
| days_until_shipping_id | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
