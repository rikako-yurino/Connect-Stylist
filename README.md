# テーブル設計

## users テーブル

| Column               | Type    | Options                 |
| -------------------- | ------- | ----------------------- |
| nickname             | string  | null: false             |
| email                | string  | null: false,unique:true |
| encrypted_password   | string  | null: false             |
| last_name            | string  | null: false             |
| first_name           | string  | null: false             |
| last_name_kana       | string  | null: false             |
| first_name_kana      | string  | null: false             |
| birthday             | date    | null: false             |
| prefecture_id        | integer |                         |
| work_id              | integer | null: false             |
| frame_type_id        | integer | null: false             |


### Association

- has_many :orders
- has_many :room
- has_many :messages
- has_one :reservation

## reservations テーブル

| Column              | Type          | Options                        |
| ------------------- |  ------------ | ------------------------------ |
| date_time_id        | integer       | null: false                    |
| plan_id             | integer       | null: false                    |
| remarks             | text          |                                |
| user                | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## rooms テーブル

| Column              | Type          | Options                        |
| ------------------- |  ------------ | ------------------------------ |
| purpose_id          | integer       | null: false                    |
| style_id            | integer       | null: false                    |
| remarks             | text          |                                |
| user                | references    | null: false, foreign_key: true |

### Association

- belongs_to :user


## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## orders テーブル

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| user     | references  | null: false, foreign_key: true |
| plan_id  | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery
