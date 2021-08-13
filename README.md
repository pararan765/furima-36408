# テーブル設計

## users テーブル
| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null: false |
| password        | string   | null: false |
| email           | string   | null: false |
| last_name       | string   | null: false |
| first_name      | string   | null: false |
| last_name_kana  | string   | null: false |
| first_name_kana | string   | null: false |
| birthday        | datetime | null: false |

### Association

- has_many :items
- has_many :pays
- has_many :posts

## items テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | text       | null: false                    |
| concept    | text       | null: false                    |
| category   | text       | null: false                    |
| state      | string     | null: false                    |
| delivery   | string     | null: false                    |
| local      | string     | null: false                    |
| category   | string     | null: false                    |
| days       | string     | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |


### Association 

- belongs_to :user
- has_one    :pay

## pays テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | integer    | null: false                    |
| card_month    | integer    | null: false,                   |
| card_year     | integer    | null: false                    |
| card_security | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :post

## posts テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | integer    | null: false                    |
| Prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| pay              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :pay