# README

## users テーブル

|Column            |Type    |Options   |
|------------------|--------|----------|
|nickname          | string | null: false |
|email             | string | null: false, unique: true |
|encrypted_password| string | null: false |
|family_name       | string | null: false |
|first_name        | string | null: false |
|family_name_kana  | string | null: false |
|first_name_kana   | string | null: false |
|birth_day         | date   | null: false |

### Association

- has_many :items 
- has_many :buyers
- belongs_to :destination 

## destinations テーブル

|Column          |Type     |Options            |
|----------------|---------|-------------------|
|post_number     | string  |  null: false      |
|prefecture_id   | integer |  null: false      |
|city            | string  |  null: false      |
|address         | string  |  null: false      |
|building_name   | string  |                   | 
|phon_number     | string  |                   |
|user_id         | references |  null: false , foreign_key: true | 

### Association

- belongs_to :user
- belongs_to_active_hash :prefecture


## items テーブル

|Column        |Type     |Options            |
|--------------|---------|-------------------|
|name          | string   |  null: false           | 
|description   | text     |  null: false           |
|category_id   | integer  |  null: false           |
|status_id     | integer  |  null: false           |
|cost_id       | integer  |  null: false           |
|prefecture_id | integer  |  null: false           |
|days_id       | integer  |  null: false           |
|price         | integer  |  null: false           |
|user_id       | references  |  null: false , foreign_key: true |

### Association

- belongs_to :user 
- belongs_to :buyer
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :cost
- belongs_to_active_hash :days
- ※ image=Active Storage

## buyers テーブル

|Column|Type|Options|
|------|----|-------|
|user_id| references | null: false, foreign_key: true |
|item_id| references | null: false, foreign_key: true |

belongs_to :user
belongs_to :items