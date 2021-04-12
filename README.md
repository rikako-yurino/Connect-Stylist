![ConnectStylist](https://user-images.githubusercontent.com/79197015/113973607-8a138f80-9877-11eb-909d-1787a6e94cdc.png)
<h2 align="center">ConnectStylist</h2>
<p align="center">
  <a href="https://www.ruby-lang.org/en/about/"><img src="https://user-images.githubusercontent.com/79197015/113974271-9b10d080-9878-11eb-9e64-7335daa36fb5.png" width="50px;" /></a>
  <a href="https://rubyonrails.org/"><img src="https://user-images.githubusercontent.com/79197015/113974312-a82dbf80-9878-11eb-8ccf-cbcb9b6faf33.png" height="50px;" /></a>
  <a href="https://jquery.com/"><img src="https://user-images.githubusercontent.com/79197015/113974345-b67bdb80-9878-11eb-916c-9933e5e3ca2a.png" height="25px;" /></a>
  <a href="https://www.mysql.com/jp/"><img src="https://user-images.githubusercontent.com/79197015/113974369-c1367080-9878-11eb-8750-525d3c343ef3.png" height="50px;" /></a>
<br>
<br>
<br>
<br>
<br>

</p>
  
    
      


# :star:About "ConnectStylist"
#### :purple_heart:このアプリケーションについて
プロのファッションスタイリストとユーザーをチャットで繋ぎ、  
失敗しがちな服のネットショッピングをサポートするアプリケーションです。

# :star:URL & Test account
このアプリケーションには
『ユーザー専用ページ』と『スタイリスト専用ページ』があります。<br>

#### user
URL: https://connect-stylist.herokuapp.com/
email: test@com
password: test123
<br>
#### stylist
URL: https://connect-stylist.herokuapp.com/stylists
email: test@com
password: test123

# :star:How to Use
#### :purple_heart:利用方法


# :star:Task
#### :purple_heart:目指した問題解決


# :star:Requirements
#### :purple_heart:要件定義


# :star:Function
#### :purple_heart:実装した機能

# :star:Plans
#### :purple_heart:今後の実装予定


# :star:DB
#### ER図


# Build
#### ローカル環境構築
$ git clone ＊＊＊＊＊＊＊＊<br>
$ cd ＊＊＊＊＊＊＊＊<br>
$ bundle install<br>
$ rails db:create<br>
$ rails db:migrate<br>
$ rails s<br>
:point_right: http://localhost:3000<br>


# :star:Intention
#### :purple_heart:制作背景
**雑誌やSNSで話題の”骨格診断”をご存知ですか？**  
骨格診断とは、体の特徴や肌の質感により３タイプに分類し、  
タイプごとに最も似合うデザイン・カラー・素材を知ることが出来る基準です。  
<br>
<strong>自分の骨格を知ることによりこれらが改善されます！</strong>
- おしゃれをしても垢抜けない  
- 買っても着ない洋服がある
- 「着痩せ」または「自分を魅力的に見せたい」  
<br>
しかし、パーソナルスタイリストに診断＆ショッピング同行のサービスを受けるには<br>
<strong>2時間程度で3~4万円も料金が掛かる</strong>のが一般的です。<br>
<br>
これでは、人気の骨格診断やパーソナルスタイリストのサービスを受けられるのは<br>
一部の限られた人だけになってしまいます。<br>
<br>
そこで！！！<br>
<strong>オンラインで診断＆ネットショッピング同行のサービスを展開</strong>することで<br>
人気のサービスをより手軽に、そして多くの人に利用して頂けるのが<br>
<strong>ConnectStylist</strong>です。






#### テーブル設計

### users テーブル

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


#### Association

- has_many :reservations
- has_one  :room
- has_many :messages


### reservations テーブル

| Column              | Type          | Options                        |
| ------------------- |  ------------ | ------------------------------ |
| date                | date          | null: false                    |
| time_zone_id        | integer       | null: false                    |
| purpose_id          | integer       | null: false                    |
| style_id            | integer       | null: false                    |
| remarks             | text          |                                |
| user                | references    | null: false, foreign_key: true |

#### Association

- belongs_to :user
- has_one    :room

### rooms テーブル

| Column              | Type          | Options                        |
| ------------------- |  ------------ | ------------------------------ |
| user                | references    | null: false, foreign_key: true |
| stylist             | references    | foreign_key: true              |
| reservation         | references    | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :stylist
- belongs_to :reservation
- has_many :messages

### stylist テーブル

| Column               | Type          | Options                        |
| -------------------  |  ------------ | ------------------------------ |
| email                | string        | null: false, unique:true       |
| password             | string        | null: false                    |
| encrypted_password   | string        | null: false                    |
| last_name            | string        | null: false                    |
| first_name           | string        | null: false                    |
| license              | text          | null: false                    |
| profile              | text          | null: false                    |

#### Association

- has_many :messages
- has_one :room

### messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

#### Association

- belongs_to :room
- belongs_to :user


# :star:AboutMe
#### :purple_heart:作者
趣味はデジタルイラストを描くこととインテリア。<br>
0→1で作ることも、既存のものを組み合わせて作ることも<br>
とにかくモノづくりが好きです。<br>
<br>
幼少期からエンジニアであった父の影響で<br> 
自分のイラストを掲載するホームページを作ったり<br>
職務経歴でもWEB販促やECを担当していました。

