# テーブル設計
## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |


### Association
- has_many :dresses

### dresses テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | -------------------------------|
| genre_id    | integer    | null: false                    |
| brand       | text       | null: false                    |
| size_id     | integer    | null: false                    |
| date        | date       | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

- belongs_to :dress
- has_many :categories

### Association
- belongs_to :user
- has_many :comments