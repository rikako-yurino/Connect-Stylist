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
  
    
      


# :star: About "Connect Stylist" 
#### :crystal_ball: このアプリケーションについて
プロのファッションスタイリストとユーザーをチャットで繋ぎ、  
失敗しがちな服のネットショッピングをサポートするアプリケーションです。<br>

# :star:How to Use
#### :crystal_ball: 利用方法


# :star:URL & Test account
#### このアプリケーションには<br>『ユーザー専用ページ』と『スタイリスト専用ページ』があります<br>

#### :point_right:Basic認証
UserID:  admin <br>
Password:  2222 <br>
<br>

#### :bust_in_silhouette:user
URL: https://connect-stylist.herokuapp.com/ <br>
email:  test@com  <br>
password:  test123  <br>
<br>

#### :bust_in_silhouette:stylist
URL: https://connect-stylist.herokuapp.com/stylists  <br>
email:  test@com  <br>
password:  test123  <br>
<br>

# :star:Intention
#### :crystal_ball: 制作背景
**雑誌やSNSで話題の”骨格診断”をご存知ですか？**  
骨格診断とは、骨格の特徴や肌の質感により３タイプに分類し、  
タイプごとに最も似合うデザイン・カラー・素材を知ることが出来る基準です。  
これらは通常、パーソナルスタイリストと呼ばれるプロのアドバイザーが診断します。<br>
<br>
:tada:骨格タイプが分かるとこれらが改善されます！
- おしゃれをしても垢抜けない  
- 「着痩せ」または「自分を魅力的に見せたい」  
- 買っても着ない洋服がある・クローゼットが服でいっぱい

<br>
しかし、パーソナルスタイリストに診断＆ショッピング同行のサービスを受けるには<br>
<strong>3~5万円の料金が掛かる</strong>ことが一般的です。<br>
これではサービスを受けられるのは、<strong>一部の限られた人だけ</strong>になってしまいます。<br>
<br>
<br>
そこで、<strong>オンラインで診断＆ネットショッピングのアドバイス</strong>のサービスを展開し、<br>
プロのサービスをより手軽に、そして多くの人に利用して頂けることを目指したのが<br>
<strong>ConnectStylist</strong>です。
<br>
<br>

# :star:Task
#### :crystal_ball: 目指した問題解決

<strong>総合的問題</strong>
- 骨格診断やパーソナルスタイリストのサービスが注目されているにも関わらず、<br>
高単価なサービスが多いため利用者が限られている
- コロナ渦においてEC化率を加速させる企業が多い中、ネット上での接客サービスの不足感がある
<br>

<strong>ユーザー視点</strong><br>

- 自分に似合うファッションが分からない
- ファッションについて調べる時間がない
- どこで何を買うべきか分からない
- 毎日の服選びに失敗したくない
- 買っても着ない服ばかりある
- ネットショッピングだと失敗しやすい
<br>

<strong>スタイリスト視点</strong><br>

- 若年層の顧客を増やしたい
- 対面式のサービスだけでなく、ネットショッピングにも対応したい
<br>
<br>

# :star:Requirements
#### :crystal_ball: 要件定義


# :star:Function
#### :crystal_ball: 実装した機能

# :star:Plans
#### :crystal_ball: 今後の実装予定


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
#### :crystal_ball: 製作者
趣味はデジタルイラストを描くこととインテリア。<br>
0→1で作ることも、既存のものを組み合わせて作ることも<br>
とにかくモノづくりが好きです。<br>
<br>
幼少期からエンジニアであった父の影響で<br> 
自分のイラストを掲載するホームページを作ったり<br>
職務経歴でもWEB販促やECを担当していました。

