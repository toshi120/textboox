# アプリ概要
## アプリ名
### Textboox
[本番環境はこちら](http://35.75.190.69/)  




## 概要

個別指導型の塾において特に力を発揮する、進捗記録管理アプリです。  
個別指導型の塾は先生と生徒が一対一であるからこそ、分からない箇所や苦手な部分を集中的に克服できるメリットがあります。しかしながら、どこの理解が浅いのかは生徒が自ら先生に伝えるか、先生が実際に生徒が問題を解いているところをみて見極めなければなりません。  
「Textboox」では、生徒がどこが分からないのかを課題などの家庭学習の内に先生に伝えることで、先生側は苦手箇所の把握を前もってしておき、授業開始から問題解決へ挑むことができます。また生徒はテキストの進捗を日記感覚で記録していき、分からなかったところを感想のように残すことで、先生に伝えることができます。さらに「Textboox」では先生が受け持っている生徒は、その先生が公開しているテキストをフォローしているような形になるので、生徒とテキストが結びつき、容易に管理が可能になります。  
自分が受け持つ生徒全員の進捗を把握しきれない先生と分からない箇所を伝えたい生徒の課題を同時に解決できるアプリです。


## 課題解決

|  ユーザーストーリーから考える課題       |                     課題解決                          |
| --------------------------------- | ---------------------------------------------------- |
| 先生側は自分が担当の参考書と生徒の管理がしにくい  | 先生が担当する参考書を投稿し、生徒がそれに参加することで自分が受け持っている生徒と参考書を結びつけることができる |
| 先生側は生徒がどこでつまづいているのか授業中に生徒が教えてくれないと分からない  | 生徒が記録する進捗記録で把握できるようになる。またコメント機能でより詳しく知ることができる  |
| 生徒側は分からない箇所をうまく口で伝えられないことがある  | 1日の進捗と分からないところを文字で書き残すことで先生側へ伝えることができる。  |


## 開発背景
私は個別指導型の塾へ通っていたことがあり、その頃から、授業の初めに小テストを行い、分からないところをあぶり出し、解説してもらうといった時間がものすごく無駄だと感じていました。それだけで20分から30分かかっていたからです。そのうえ、私はあまり人と話すことが得意ではなく、自分から分からないことを直接言えないということも多々あり、そのまま次の問題へ進んでいました。思い返すと個別指導のメリットが全く機能していませんでした。  
  
また、私は個別指導型の塾に講師としてアルバイトをしていた経験があり、そのときまさに昔の私のような無口で言われた問題だけ黙々とやる生徒を担当しました。そこで私が思ったのは「この子、どこが分からないとか言ってくれたらなあ」なんて考えていました。聞いても「大丈夫」と言われてしまうのでどうしようもなかったです。  
  
そんな私の経験を思い出して、インターネットで私と同じような経験した人いるのか調べてみると先生に質問がしにくかったり、できない生徒が結構いたのでその当時の課題を解決してくれるアプリを想像し、少しマニアックな内容であると思いながら開発を始めました。

|  疑問点があったら塾の先生に質問するか  |  Google検索予測 |
| -------------------------------- | -------------- |
| <img src="https://i.gyazo.com/7e7b387df56d02b38ab280ffd4a1a854.png"> | <img src="https://i.gyazo.com/28d0e40c7a3ef87321916d5145a6cd34.png"> |
  

参考：  
https://resemom.jp/article/2020/06/23/56878.html


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