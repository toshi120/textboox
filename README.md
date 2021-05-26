# Textboox
## 教育現場で先生が生徒の学習進捗を確認できるアプリケーション

# 概要

## 全員の進捗を把握しきれない先生
## 分からないと箇所を伝えたい生徒

個別指導型の塾や、学校で自分のペースで進めていくドリルなどを扱う教育現場で活用できる
テキストや参考書の進捗状況を管理することができる

# 課題解決

|  ユーザーストーリーから考える課題       |                     課題解決                          |
| --------------------------------- | ---------------------------------------------------- |
| 先生側は自分が担当の参考書と生徒の管理が | 先生が担当する参考書を投稿し、生徒がそれに参加することで自分が |
| しにくい                            | 受け持っている参考書と生徒を結びつけることができる           |
| --------------------------------- | ----------------------------------------------------- |
| 先生側は生徒がどこでつまづいているのか授 | 生徒が記録する進捗記録で把握できるようになる。またコメント機能  |
| 業中に生徒が教えてくれないと分からない   | でより詳しく知ることができる                              |
| ---------------------------------- | -----------------------------------------------------|
| 生徒側は分からない箇所をうまく口で伝えら  | 1日の進捗と分からないところを文字で書き残すことで先生側へ伝え  |
| ないことがある                       | ることができる。                                        |
| -----------------------------------| -----------------------------------------------------|

# テーブル設計

## students テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- | 
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many textbooks, through: :student_books


## teachers テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- | 
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many :textbooks


## textbooks テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ | 
| name    | string     | null: false                    |
| note    | text       |                                |
| teacher | references | null: false, foreign_key: true |
| page    | integer    | null: false

### Association

- belongs_to :teacher
- has_many :students, through: :student_books


## student_books テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ | 
| student  | references | null: false, foreign_key: true |
| textbook | references | null: false, foreign_key: true |

### Association

- belongs_to :student
- belongs_to :textbook
- has_many :progress


## progress テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| page          | integer    | null: false                    |
| student_books | references | null: false, foreign_key: true |
| comment       | text       |                                |

### Association

- belongs_to student_book