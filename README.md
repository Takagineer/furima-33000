# DB設計

## users table

| Column                  | Type                | Options                 |
|-------------------------|---------------------|-------------------------|
| email                   | string              | null:false unique:true  |
| encrypted_password      | string              | null: false             |
| family_name             | string              | null: false             |
| last_name               | string              | null: false             |
| family_name_kana        | string              | null: false             |
| last_name_kana          | string              | null: false             |
| birthday                | datetime            |                         |

### Association
has_many :items
has_many :orders

## items table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| title              | string              | null: false             |
| explanation        | text                | null: false             |
| category_id        | integer             | null: false             |
| status_id          | integer             | null: false             |
| shipping_cost_id   | integer             | null: false             |
| delivery_source_id | integer             | null: false             |
| preparation_day_id | integer             | null: false             |
| selling_price      | integer             | null: false             |
| user_id            | integer             | foreign_key: true       |

### Association
belongs_to :user
has_one :order

## purchases table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| prefecture_id      | integer             | null: false             |
| city               | string              | null: false             |
| address            | string              | null: false             |
| building_name      | string              |                         |
| phone_number       | string              | null: false             |
| order_id           | integer             | foreign_key: true       |

### Association
has_one :order

## orders table
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user_id            | integer             | foreign_key: true       |
| item_id            | integer             | foreign_key: true       |

### Association
belongs_to :user
belongs_to :item
has_one :purchase