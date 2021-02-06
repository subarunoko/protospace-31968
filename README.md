# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| profile    | text   |             |
| occupation | text   |             |
| position   | text   |             |

### Association
- has_many :prototypes
- has_many :comments



## prototype テーブル

| Column     | Type         | Options                        |
| --------   | ------       | -----------                    |
| title      | string       | null: false                    |
| catch_copy | text         |                                |
| concept    | text         |                                |
| image      | activestrage | null: false                    |
| user       | references   | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_many :comments



## comment テーブル

| Column    | Type       | Options                        |
| -------   | ---------- | ------------------------------ |
| text      | text       |                                |
| user      | references | null: false, foreign_key: true |
| phototype | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :prototype