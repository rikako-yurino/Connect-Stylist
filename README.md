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

- has_one :reservation
- has_one :room
- has_many :messages


## reservations テーブル

| Column              | Type          | Options                        |
| ------------------- |  ------------ | ------------------------------ |
| date                | date          | null: false                    |
| time_id             | integer       | null: false                    |
| user                | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :room

## rooms テーブル

| Column              | Type          | Options                        |
| ------------------- |  ------------ | ------------------------------ |
| purpose_id          | integer       | null: false                    |
| style_id            | integer       | null: false                    |
| remarks             | text          |                                |
| user                | references    | null: false, foreign_key: true |
| reservation_id      | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :stylist
- belongs_to :reservation
- has_many :messages

## stylist テーブル

| Column               | Type          | Options                        |
| -------------------  |  ------------ | ------------------------------ |
| email                | string        | null: false, unique:true       |
| password             | string        | null: false                    |
| encrypted_password   | string        | null: false                    |
| last_name            | string        | null: false                    |
| first_name           | string        | null: false                    |
| license              | text          | null: false                    |
| profile              | text          | null: false                    |

### Association

- has_many :messages
- has_one :room

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user