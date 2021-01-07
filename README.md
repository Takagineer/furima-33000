# DB設計

## users table

| Column                  | Type                | Options                 |
|-------------------------|---------------------|-------------------------|
| family_name             | string              | null: false             |
| last_name               | string              | null: false             |
| family_name_kana        | string              | null: false             |
| last_name_kana          | string              | null: false             |
| birthday                | DATE                | null: false             |

### Association
has_many :items
has_many :purchases
has_one :id

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
| selling_price      | string              | null: false             |

### Association
belongs_to :user
has_one :purchase
has_one :id

## purchases table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| prefecture         | string              |                         |
| city               | string              |                         |
| address            | string              |                         |
| building_name      | string              |                         |
| phone_number       | string              | null: false             |

### Association
belongs_to :user
belongs_to :item

## id table
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user_id            | string              | null: false             |
| item_id            | string              | null: false             |                         

### Association
has_one :user
has_one :item