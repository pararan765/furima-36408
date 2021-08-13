# テーブル設計

## users テーブル
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| encrypted_password | string   | null: false               |
| email              | string   | null: false, unique: true |
| last_name          | string   | null: false               |
| first_name         | string   | null: false               |
| last_name_kana     | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birthday           | date     | null: false               |

### Association

- has_many :items
- has_many :pays

## items テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| concept    | text       | null: false                    |
| category   | integer    | null: false                    |
| state      | integer    | null: false                    |
| delivery   | integer     | null: false                    |
| local      | integer    | null: false                    |
| category   | integer    | null: false                    |
| days       | integer    | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |


### Association 

- belongs_to :user
- has_one    :pay

## pays テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :post

## posts テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| pay              | references | null: false, foreign_key: true |

### Association

- belongs_to :pay