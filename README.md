
# アプリケーション名
**Good Closet**

# アプリケーション概要
 ファッションの悩みを相談したり、自分の服などのファッションアイテムを管理することができるWebアプリケーションを開発しました。

# URL
<https://good-closet.herokuapp.com/>

# Basic認証
- ID:admin
- Pass:2222

# テスト用アカウント
- email:test@gmail.com
- password:closet123

# 利用方法
- 接続先およびログイン情報については、上記の通りです。
- ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- テストアカウントでログイン→トップページのメニューから「ファッション相談」押下→相談情報入力→相談投稿
- テストアカウントでログイン→トップページの相談一覧からタイトル（件名）押下→相談詳細画面→コメント投稿
- テストアカウントでログイン→トップページの相談一覧からタイトル（件名）押下→相談詳細画面→「投稿者のクローゼットを見に行く」押下→クローゼットの閲覧
- テストアカウントでログイン→トップページのメニューから「my closet」押下→クローゼット確認→「アイテム追加」押下→クローゼットへのアイテム追加
- テストアカウントでログイン→トップページのメニューから「天気を見る」押下→天気確認
- 確認後、ログアウト処理をお願いします。

# 目指した課題解決
私の友人が、「コーディネートについて、この合わせ方は変じゃないか。」など、気になって誰かに聞きたいことがあると言っていました。その話を聞いて、毎日のコーディネートの悩みや普段とは違うアイテムを買ってみたけれど、合わせ方がわからないといったファッションに関する悩みを持った人の課題の解決ができるアプリケーションを目指し、実装をしました。また、買い物の際に、すでに持っている似たような服を買ってしまったという私自身の経験から、自分が持っているファッションアイテムの把握が難しいという課題の解決も同時に解消することを目指しました。

# 要件
###### ユーザー管理機能
- 目的: ユーザー管理をするため。
- 詳細: ユーザー管理機能を実装し、ユーザーと投稿やコメントを結びつける。また、ログインすることでより多くの情報が閲覧できるようにする。

###### 相談投稿機能
- 目的: ファッション相談を投稿するため。
- 詳細: ログインしているユーザーが投稿できる。相談のタイトル(件名)、相談内容を投稿し、服などのアイテム画像を2枚まで添付できる。

###### 投稿一覧表示機能
- 目的: 投稿一覧を閲覧できるようにするため。
- 詳細: 最新の投稿順に一覧表示をする。相談者のニックネーム、タイトル(件名)、添付されていれば画像が閲覧できる。

###### 投稿詳細表示機能
- 目的: 投稿の詳細を把握したり、コメントを見るため。
- 詳細: 詳細表示ページでは、相談内容を閲覧することができる。また、投稿に対するコメントを見ることができる。

###### 投稿編集機能
- 目的: 投稿内容を投稿者が編集するため。
- 詳細: 投稿者は投稿した相談を編集できる。

###### 投稿削除機能
- 目的: 投稿内容を投稿者が削除するため。
- 詳細: 投稿者は投稿した相談を削除できる。

###### コメント機能
- 目的: 相談投稿に対する回答などのやりとりをユーザー同士で行うため。
- 詳細: ログインしているユーザーは、詳細表示ページから投稿に対しコメントができる。

###### マイページ（my closet）機能
- 目的: ユーザーそれぞれが自分のファッションアイテムを管理する、また他のユーザーが閲覧できるようにするため。
- 詳細: ログインしているユーザーは、「my closet」に自分のファッションアイテムの画像を投稿しておくおことができる。また、他のユーザーが相談投稿者のクローゼットを見ることもでき、相談への回答の際に参考にすることができる。

###### 天気確認機能
- 目的: 天気を確認できるようにするため。
- 詳細: コーディネートをする上で必要な天気の情報を確認できる。

# イメージ
![image](https://user-images.githubusercontent.com/68307067/93343833-ee371d80-f86b-11ea-8d93-37ef6bfeb75e.gif)


# テーブル設計

## users テーブル
| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |

### Association 
- has_many :posts
- has_many :items
- has_many :comments

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :image

## posts テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| text             | text       | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user
- has_many_attached :images

## comments テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| comment          | text       | null: false                    |
| post             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user

## ER図
<img src="public/ER.png">

# 使用技術
- Ruby 2.6.5
- Rails 6.0.0
- javascript
- jQuery
- MySQL
- Heroku
- AWS/S3

# API
- OpenWeatherMap API
https://openweathermap.org/

# ローカルでの動作方法
### コマンド
1. リポジトリをローカルにクローン
```
git clone https://github.com/saki0508/closet.git
```
2. ディレクトリの移動
```
cd closet
```
3. 必要なGemをインストール
```
bundle install
```
4. javascriptパッケージ群のインストール
```
yarn install
```
5. データベースを設定
```
rails db:create
rails db:migrate
```
6. サーバーの起動
```
rails s
```
その後localhost:3000にアクセスして下さい。
