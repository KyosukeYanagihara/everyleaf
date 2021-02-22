# README
## __table__
#### Userテーブル
| Column          | Type   | 
| :-------------  | :----  | 
| name            | string | 
| email           | string | 
| password_digest | string | 
#### Taskテーブル
| Column      | Type     | 
| :---------  | :------  | 
| name        | string   | 
| description | text     | 
| deadline    | datetime | 
| status      | string   | 
| priority    | string   | 
| user_id     | index    | 
#### Labelテーブル
| Column  | Type    | 
| :-----  | :-----  | 
| task_id | integer | 
| name    | string  | 
