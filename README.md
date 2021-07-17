# アプリ概要
## アプリ名
### Textboox

## 概要

個別指導型の塾において特に力を発揮する、進捗記録管理アプリです。
個別指導型の塾は先生と生徒が一対一であるからこそ、分からない箇所や苦手な部分を集中的に克服できるメリットがあります。しかしながら、どこの理解が浅いのかは生徒が自ら先生に伝えるか、先生が実際に生徒が問題を解いているところをみて見極めなければなりません。「Textboox」では、生徒がどこが分からないのかを課題などの家庭学習の内に先生に伝えることで、先生側は苦手箇所の把握を前もってしておき、授業開始から問題解決へ挑むことができます。また生徒はテキストの進捗を日記感覚で記録していき、分からなかったところを感想のように残すことで、先生に伝えることができます。さらに「Textboox」では先生が受け持っている生徒は、その先生が公開しているテキストをフォローしているような形になるので、容易に生徒とテキストの管理が可能になります。自分が受け持つ生徒全員の進捗を把握しきれない先生と分からない箇所を伝えたい生徒の課題を同時に解決できるアプリです。

### 全員の進捗を把握しきれない先生
### 分からないと箇所を伝えたい生徒

個別指導型の塾や、学校で自分のペースで進めていくドリルなどを扱う教育現場で活用できる
テキストや参考書の進捗状況を管理することができる

# 課題解決

|  ユーザーストーリーから考える課題       |                     課題解決                          |
| --------------------------------- | ---------------------------------------------------- |
| 先生側は自分が担当の参考書と生徒の管理がしにくい  | 先生が担当する参考書を投稿し、生徒がそれに参加することで自分が受け持っている生徒と参考書を結びつけることができる |
| 先生側は生徒がどこでつまづいているのか授業中に生徒が教えてくれないと分からない  | 生徒が記録する進捗記録で把握できるようになる。またコメント機能でより詳しく知ることができる  |
| 生徒側は分からない箇所をうまく口で伝えられないことがある  | 1日の進捗と分からないところを文字で書き残すことで先生側へ伝えることができる。  |

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