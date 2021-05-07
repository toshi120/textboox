# テーブル設計

## students テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- | 
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many :student_books


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

### Association

- belongs_to :teacher
- has_many :student_books


## student_books テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ | 
| student  | references | null: false, foreign_key: true |
| textbook | references | null: false, foreign_key: true |

### Association

- belongs_to :student
- belongs_to :textbook
- has_one :progress


## progress テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ | 
| page          | integer    | null: false                    |
| student_books | references | null: false, foreign_key: true |
| comment       | text       |                                |

### Association

- belongs_to student_book