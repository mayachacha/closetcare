# README
### アプリケーション名  
Closet Care  

### アプリケーション概要  
自宅にある自分の服を管理するアプリ。
購入日、サイズ、ブランド等の基本情報を画像とともに保存し、カテゴリーごとに見ることができる。  

### URL 
  http://52.68.116.195:3000/  

### テスト用アカウント  
- メールアドレス：aaa@aaa
- ログインパスワード：aaa111  

### 利用方法  
#### 服の保存  
1.ログインページよりユーザー新規登録を行う。  
2.ヘッダーボタンから、服の情報(ジャンル、ブランド、サイズ、購入日、価格、メモ)を入力し服の収納(=保存)を行う。

#### 服を見返す  
1.一覧ページから服をクリックして服の詳細を確認する。
2.詳細ページから服の情報編集、削除を行う。  
3.マイリストに追加したい服があれば、一覧ページまたは詳細ページのボタンからマイリストへ追加する。  
4.ヘッダーボタンから、マイリスト一覧を確認する。  

### アプリケーションを作成した背景  
近年ネットで気軽に服を買えるようになった分、自分の服の管理が難しくなった。どこで買ったのか、いつ、どのサイズを買ったのか、すべて把握するのは難しい。そこで写真と共に服の情報を記録できるアプリがあれば、買い物中も、電車の中でネットショッピングしている時も、いつでも見返せて便利だと思い、このアプリを開発することにした。

### 要件定義  
  (https://docs.google.com/spreadsheets/d/1q8pd3_UsBF_f3HcpR1JlYPxU_rwwvWo6DpdcFyMNL3I/edit#gid=1785908763)

### 現在の実装内容（主要部のみ）  
- 一覧ページ 
[![Image from Gyazo](https://i.gyazo.com/bb0d72add29ee991ebd2d2a80319aee7.gif)](https://gyazo.com/bb0d72add29ee991ebd2d2a80319aee7)
- カテゴリ別一覧ページ
[![Image from Gyazo](https://i.gyazo.com/1074de112ae984cb99aa75f48768181f.gif)](https://gyazo.com/1074de112ae984cb99aa75f48768181f)
- マイリスト追加・一覧ページ
[![Image from Gyazo](https://i.gyazo.com/b478751a139c314b7ea45d437c5c85cd.gif)](https://gyazo.com/b478751a139c314b7ea45d437c5c85cd)
- 服保存ページ
[![Image from Gyazo](https://i.gyazo.com/c85b9b3ab7c399269ddffc0847a6b70d.png)](https://gyazo.com/c85b9b3ab7c399269ddffc0847a6b70d)
[![Image from Gyazo](https://gyazo.com/9c4ae94d69af412f0f74cda0ff274e2a.png)](https://gyazo.com/9c4ae94d69af412f0f74cda0ff274e2a)
- 服詳細ページ
[![Image from Gyazo](https://i.gyazo.com/ef0d9c37f53bd7a01a0c20bec68e84ea.png)](https://gyazo.com/ef0d9c37f53bd7a01a0c20bec68e84ea)  

### 実装予定の機能  
1.サブカテゴリーを追加予定。  
2.季節ごとのタグつけ機能を追加予定。  

# データベース設計 
 [![Image from Gyazo](https://i.gyazo.com/dc91def7fc8543689e919ce4f75f884d.png)](https://gyazo.com/dc91def7fc8543689e919ce4f75f884d)

## users テーブル  
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |


### Association  
- has_many :dresses
- has_many :mylists  

### dresses テーブル  
| Column      | Type       | Options                        |
| ----------- | ---------- | -------------------------------|
| genre_id    | integer    | null: false                    |
| brand       | text       |                                |
| size_id     | integer    | null: false                    |
| date        | date       |                                |
| price       | integer    |                                |
| memo        | text       |                                |
| user        | references | null: false, foreign_key: true |

### Association  
- belongs_to :user
- has_one :mylist  

### mylists テーブル  
| Column      | Type       | Options                        |
| ----------- | ---------- | -------------------------------|
| user        | references | null: false, foreign_key: true |
| dress       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :dress

### 開発環境  
・フロントエンド：HTML/CSS Javascript
・バックエンド：Ruby/Ruby on Rails
・テキストエディタ：Visual Studio Code
・デプロイ：AWS
・タスク管理：GitHub  


### 工夫したポイント  
1.フロントエンドに関して  
服のアプリということで、見た目は洗練されたシンプルなものになるよう、一覧表示のレイアウトやボタンの配置にはこだわって作成。またジャンル別表示、マイリスト追加は非同期を取り入れ、ユーザーのストレス軽減に努めた。  
2.バックエンドに関して  
自分の服を管理するアプリなので、情報はなるべく自由に保存できるよう、ジャンルとサイズのみnull falseに設定しました。これからサブカテゴリーによって分けて表示もできるよう、実装予定。  

### 改善点 
1.サイズ×ジャンル、ジャンル×ブランドなど複雑な検索機能が未実装。  
2.画像は複数保存できるので、一覧表示で他の画像のプレビューを非同期で表示できるようにしたい。  

