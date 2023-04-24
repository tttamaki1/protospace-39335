# README

## usersテーブル

### 概要

ユーザーアカウントの情報を保持する。

### カラム

| 列名                 | データ型 | NOT NULL | ユニーク制約 | 説明       |
| :-------------------| :------ | :------- | :---------- | :--------- |
| email                | string  | Yes      | Yes         | メールアドレス |
| encrypted_password   | name   | Yes      | No          | パスワードのハッシュ値 |
| name                 | string  | Yes      | No          | 名前       |
| profile              | text    | Yes      | No          | プロフィール   |
| occupation           | text    | Yes      | No          | 職業       |
| position             | text    | Yes      | No          | 役職       |

### アソシエーション

- 一対多: usersテーブル has_many prototypesテーブル
- 一対多: usersテーブル has_many commentsテーブル

## prototypesテーブル

### 概要

プロトタイプの情報を保持する。

### カラム

| 列名         | データ型  | NOT NULL | 説明          |
| :-----------| :------- | :-------| :-------------|
| title        | string   | Yes      | タイトル        |
| catch_copy   | text     | Yes      | キャッチコピー   |
| concept      | text     | Yes      | コンセプト      |
| user_id      | references | Yes    | usersテーブルの外部キー |

### アソシエーション

- 一対多: prototypesテーブル belongs_to usersテーブル
- 一対多: prototypesテーブル has_many commentsテーブル

## commentsテーブル

### 概要

コメントの情報を保持する。

### カラム

| 列名         | データ型  | NOT NULL | 説明                   |
| :-----------| :------- | :-------| :-----------------------|
| content      | text     | Yes      | コメント内容             |
| prototype_id | references | Yes    | prototypesテーブルの外部キー |
| user_id      | references | Yes    | usersテーブルの外部キー       |

### アソシエーション

- 一対多: commentsテーブル belongs_to prototypesテーブル
- 一対多: commentsテーブル belongs_to usersテーブル

以上の設計において、usersテーブルとprototypesテーブル、usersテーブルとcommentsテーブル、prototypesテーブルとcommentsテーブルの間には、それぞれ一対多のアソシエーションがあります。