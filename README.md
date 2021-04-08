![ConnectStylist](https://user-images.githubusercontent.com/79197015/113973607-8a138f80-9877-11eb-909d-1787a6e94cdc.png)
<h2 align="center">ConnectStylist</h2>
<p align="center">
  <a href="https://www.ruby-lang.org/en/about/"><img src="https://user-images.githubusercontent.com/79197015/113974271-9b10d080-9878-11eb-9e64-7335daa36fb5.png" width="45px;" /></a>
  <a href="https://rubyonrails.org/"><img src="https://user-images.githubusercontent.com/79197015/113974312-a82dbf80-9878-11eb-8ccf-cbcb9b6faf33.png" height="45px;" /></a>
  <a href="https://jquery.com/"><img src="https://user-images.githubusercontent.com/79197015/113974345-b67bdb80-9878-11eb-916c-9933e5e3ca2a.png" height="22px;" /></a>
  <a href="https://www.mysql.com/jp/"><img src="https://user-images.githubusercontent.com/79197015/113974369-c1367080-9878-11eb-8750-525d3c343ef3.png" height="45px;" /></a>
</p>
  
    
      


# ConnectStylistとは

# ご利用方法

# 構築
$ git clone ＊＊＊＊＊＊＊＊
$ cd ＊＊＊＊＊＊＊＊
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails s
:point_right: http://localhost:3000

# ライセンス

# 作者







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

- has_many :reservations
- has_one  :room
- has_many :messages


## reservations テーブル

| Column              | Type          | Options                        |
| ------------------- |  ------------ | ------------------------------ |
| date                | date          | null: false                    |
| time_zone_id        | integer       | null: false                    |
| purpose_id          | integer       | null: false                    |
| style_id            | integer       | null: false                    |
| remarks             | text          |                                |
| user                | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :room

## rooms テーブル

| Column              | Type          | Options                        |
| ------------------- |  ------------ | ------------------------------ |
| user                | references    | null: false, foreign_key: true |
| stylist             | references    | foreign_key: true              |
| reservation         | references    | null: false, foreign_key: true |

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