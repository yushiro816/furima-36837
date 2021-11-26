# README

## users テーブル

|Column            |Type    |Options   |
|------------------|--------|----------|
|nickname          | string | not null |
|email             | string | not null |
|encrypted_password| string | not null |
|family_name       | string | not null |
|first_name        | string | not null |
|family_name_kana  | string | not null |
|first_name_kana   | string | not null |
|birth_day         | date   | not null |

### Association

- has_many :item dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :card dependent: :destroy

## destinations テーブル

|Column       |Type     |Options            |
|-------------|---------|-------------------|
|post_number  | string  | not null          |
|prefecture   | string  | not null          |
|city         | string  | not null          |
|address      | string  | not null          |
|building_name| string  |                   | 
|phon_number  | string  |                   |
|user_id      | integer | not null, 外部キー | 

### Association

- belongs_to :user

## cards テーブル

|Column     |Type     |Options             |
|-----------|---------|--------------------|
|user_id    | integer | not null, 外部キー  | 
|customer_id| string  | not null           |
|card_id    | string  | not null           | 

## Association

- belongs_to :user

## items テーブル

|Column     |Type     |Options            |
|-----------|---------|-------------------|
|name       | string  | not null          | 
|description| string  | not null          |
|status     | string  | not null          |
|cost       | string  | not null          |
|prefecture | string  | not null          |
|days       | string  | not null          |
|price      | string  | not null          |
|brand_id   | integer | not null,外部キー  |
|category_id| integer | not null,外部キー  |
|user_id    | integer | not null, 外部キー |

### Association

- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- belongs_to :user dependent: :destroy
- has_many :image dependent: :destroy

## categories テーブル

|Column|Type    |Options   |
|------|--------|----------|
|name  | string | not null |

### Association

- has_many :item

## brands テーブル

|Column|Type    |Options   |
|------|--------|----------|
|name  | string | not null |

### Association

- has_many :item

## images テーブル

|Column |Type     |Options            |
|-------|---------|-------------------|
|image  | string  | not null          |
|item_id| integer | not null, 外部キー |

### Association

- belongs_to :item