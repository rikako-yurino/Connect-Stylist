![ConnectStylist](https://user-images.githubusercontent.com/79197015/113973607-8a138f80-9877-11eb-909d-1787a6e94cdc.png)
<h4 align="center">Development environment</h4>
<p align="center">
  <a href="https://www.ruby-lang.org/en/about/"><img src="https://user-images.githubusercontent.com/79197015/113974271-9b10d080-9878-11eb-9e64-7335daa36fb5.png" width="50px;" /></a>
  <a href="https://rubyonrails.org/"><img src="https://user-images.githubusercontent.com/79197015/113974312-a82dbf80-9878-11eb-8ccf-cbcb9b6faf33.png" height="50px;" /></a>
  <a href="https://jquery.com/"><img src="https://user-images.githubusercontent.com/79197015/113974345-b67bdb80-9878-11eb-916c-9933e5e3ca2a.png" height="25px;" /></a>
  <a href="https://www.mysql.com/jp/"><img src="https://user-images.githubusercontent.com/79197015/113974369-c1367080-9878-11eb-8750-525d3c343ef3.png" height="50px;" /></a>
  <a href="https://aws.amazon.com/jp/"><img src="https://user-images.githubusercontent.com/79197015/114863980-67f7af80-9e2b-11eb-83d3-7dbead94923d.png" height="45px;" /></a>
  <a href="https://yhbt.net/unicorn/"><img src="https://user-images.githubusercontent.com/79197015/114864064-82318d80-9e2b-11eb-8126-ba8221ec3390.png" height="50px;" /></a>
  <a href="https://www.nginx.com/"><img src="https://user-images.githubusercontent.com/79197015/114864541-13a0ff80-9e2c-11eb-9e2a-b9fe5e61ba78.png" height="50px;" /></a>
  <a href="https://capistranorb.com/"><img src="https://user-images.githubusercontent.com/79197015/114864727-4ba84280-9e2c-11eb-9853-02d6295fb6f0.png" height="50px;" /></a>
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
- <strong>👉 User</strong><br>
  - できること
    - 質問形式のセルフ骨格診断
    - スタイリストにチャットでアドバイスをもらう
  - 操作手順
    - トップページから「骨格診断」へ移動し、セルフ診断をする
    - その後トップページページから新規会員登録
    - 新規会員登録・ログイン後はトップページの「チャット予約」から予約
    - 予約が完了したらマイページの予約一覧より入室
    - チャットルームでスタイリストとメッセージが出来る<br><br>
- <strong>👉 Stylist</strong><br>
  - できること
    - ユーザーの骨格タイプをもとにチャットでスタイリングをアドバイスする
  - 操作手順
    - スタイリスト専用トップページから新規会員登録
    - 新規会員登録・ログイン後はトップページの予約一覧からチャットルームに入室
    - ユーザーとチャットルームでメッセージが出来る
<br>


# :star:URL & Test account
#### このアプリケーションには<br>『ユーザー専用ページ』と『スタイリスト専用ページ』があります<br>

<!-- #### :point_right:Basic認証
UserID:  admin <br>
Password:  2222 <br>
<br> -->

#### :bust_in_silhouette:User
URL: http://54.64.102.18/<br>
email:  test@com  <br>
password:  test123  <br>
<br>

#### :bust_in_silhouette:Stylist
URL: http://54.64.102.18/stylists  <br>
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
- 買っても着ない服がある・クローゼットが服でいっぱい

<br>
しかし、パーソナルスタイリストに診断&ショッピング同行のサービスを受けるにはサービス料が高く、<br>
<strong>3~5万円の料金が掛かる</strong>ことが一般的です。<br>
これではスタイリストのサービスを受けられるのは、<strong>一部の限られた人だけ</strong>になってしまいます。<br>
<br>
<br>
そこで、<strong>オンラインで診断＆ネットショッピングのアドバイス</strong><br>を展開することで、プロのサービスをより手軽に、<br>
そして多くの人に利用して頂くことを目指したのが<strong>Connect Stylist</strong>です👍
<br>
<br>

# :star:Task
#### :crystal_ball: どのような課題に対してアプローチしているか
  <strong>👀 総合的視点</strong><br>
|                  現状課題                                                                                           |     課題改善                                                                                                        |
| --------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| 骨格診断やパーソナルスタイリストが注目されているにも関わらず、高単価なサービスが多いため利用者が限られている        |オンライン完結することで低単価を実現し、サービスを受けられるユーザーの幅を広げる                                     |
| コロナ渦においてEC化率を加速させる企業が多い中、ネット上での接客サービスの不足感がある                              |アパレルメーカーと提携することでEC販促に課題を抱えている企業のサポート                                               |
<br>

  <strong>👀 ユーザー視点</strong><br>
|                  現状課題                                                   |     課題改善                                                                                                                                | 
| ----------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| 自分に似合うファッションが分からない、調べる時間がない                      |ユーザーの骨格タイプや好きなファッションジャンルを考慮し、プロが最適な選択肢を提案してくれるので、悩む時間や無駄な買い物を削減できる         |
| TPOに合った服装に関して不安がある                                           |知識のあるスタイリストのアドバイスにより、様々なシーンに適したスタイリングの不安を解消                                                       |
| ネットショッピングだと失敗しやすく、買っても着ない服ばかりある              |洋服のシルエットや素材に詳しいスタイリストが吟味することで、自力で目利きする必要がなく、ネットショッピングの失敗を防げる                     |
<br>

  <strong>👀 スタイリスト視点</strong><br>
|                  現状課題                                             |     課題改善                                                                                                      | 
| ----------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| パーソナルスタイリストという人材の認知度を上げたい                    |オンラインでサービスを展開することで、利用者数を増やして認知度をアップ                                             |
| 若年層の顧客を増やしたい                                              |オンライン完結による低単価の実現で若年層のサービス利用が期待できる                                                 |
| 対面式のサービスだけでなく、ネットショッピングにも対応したい          |オンライン完結のサービスのため対面する必要がなく、コロナ渦における活動縮小を解消できる                             |
<br>

# :star:Demo
#### :crystal_ball: 実際の操作画面
<br><strong> 👉 骨格診断</strong><br>
診断中
[![Image from Gyazo](https://i.gyazo.com/74b1fb3d7a5e3289a837dddab25bbc60.gif)](https://gyazo.com/74b1fb3d7a5e3289a837dddab25bbc60)
<br>
診断結果
[![Image from Gyazo](https://i.gyazo.com/6b9efaca26125fd0c461ccaf5e44b8b0.jpg)](https://gyazo.com/6b9efaca26125fd0c461ccaf5e44b8b0)

<br><strong> 👉 ユーザー管理機能</strong><br>
User
[![Image from Gyazo](https://i.gyazo.com/c2bacf8c340387a0fe499be9e67bdad3.gif)](https://gyazo.com/c2bacf8c340387a0fe499be9e67bdad3)
<br>
Stylist
[![Image from Gyazo](https://i.gyazo.com/ad6d904f5de8df11dc37f9ecc5299523.gif)](https://gyazo.com/ad6d904f5de8df11dc37f9ecc5299523)

<br><strong> 👉 予約機能</strong><br>
[![Image from Gyazo](https://i.gyazo.com/4072c37e839ba443924befd951598423.gif)](https://gyazo.com/4072c37e839ba443924befd951598423)

<br><strong> 👉 チャット機能</strong><br>
[![Image from Gyazo](https://i.gyazo.com/31c6c9b7218685c310dc07cc98a4cd8f.gif)](https://gyazo.com/31c6c9b7218685c310dc07cc98a4cd8f)

<br>

# :star:Ingenuity
#### :crystal_ball: 工夫した点
- <strong>jQueryによるインタラクティブなUIを実現</strong><br>
「骨格診断」と検索して流入するユーザーが多いことを想定し、ヘッダーとトップページ中部に２箇所遷移ボタンを設置しました。診断機能はアプリケーションの入口となるコンテンツなので、jQueryによるインタラクティブなUIを実現し、診断の手軽さを表現しました。<br><br>
- <strong>Action Cableを用いた非同期チャットにチャレンジ</strong><br>
チャット機能においては当初は同期型でしたが、追加実装としてAction Cableを用いた非同期チャットにしました。
正直まだ調整が必要なレベルではありますが、初めてのオリジナルアプリにおいて、新しい機能にチャレンジすることができました。<br><br>
- <strong>顧客ターゲットを意識したデザイン</strong><br>
ビューに関してはファッションにまつわるサービスのため、トレンド感のあるグラデーションを基調としたデザインに統一し、若年層獲得というアプリの狙いを意識しました。<br>
<br>

# :star:Plans
#### :crystal_ball: 今後の実装予定
- 予約日時の制御
- チャット内の画像送信機能
- 購入機能
  - PAY.JPによる月額制の会員


# :star:Build
#### ローカル環境構築
$ git clone https://github.com/rikako-yurino/Connect-Stylist.git<br>
$ cd Connect-Stylist<br>
$ bundle install<br>
$ rails db:create<br>
$ rails db:migrate<br>
$ rails s<br>
:point_right: http://localhost:3000<br>



# :star:Database
#### :crystal_ball: DB設計

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


# :star:About Me
#### :crystal_ball: 製作者
趣味はデジタルイラストを描くこと、インテリア収集。<br>
0→1で作ることも、既存のものを組み合わせて作ることも<br>
とにかくモノづくりが好きです。<br>
<br>
幼少期からエンジニアであった父の影響で<br> 
自分のイラストを掲載するホームページを作ったりと<br>
コンピューターが身近な環境で育ちました。<br><br>
経歴: 新卒で入社したアパレル企業にてWEB販促やECをメインに担当し、<br>
営業職や企画職も経験。

