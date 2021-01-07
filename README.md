# DB設計

## users table

| Column                  | Type                | Options                 |
|-------------------------|---------------------|-------------------------|
| nickname                | string              | null: false             |
| email                   | string              | null: false             |
| password                | string              | null: false             |
| password_confirmation   | string              | null: false             |
| name                    | string              | null: false             |
| name_kana               | string              | null: false             |
| birthday                | string              | null: false             |

### Association
has_many :items
has_many :purchases

## items table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| title              | string              | null: false             |
| explanation        | text                | null: false             |
| category           | string              | null: false             |
| status             | string              | null: false             |
| shipping_cost      | string              | null: false             |
| delivery_source    | string              | null: false             |
| preparation_days   | string              | null: false             |
| selling_price      | string              | null: false             |

### Association
belongs_to :user
has_one :purchase

## purchases table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| card_number        | string              | null: false             |
| effective_date     | string              | null: false             |
| security_code      | string              | null: false             |
| postal_code        | string              | null: false             |
| add_div_Japan      | string              | null: false             |
| city               | string              | null: false             |
| address            | string              | null: false             |
| building_name      | string              | null: false             |
| phone_number       | string              | null: false             |

### Association
belongs_to :user
belongs_to :item