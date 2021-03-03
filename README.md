# README
## __table__
#### Userテーブル
| Column          | Type    | 
| :-------------  | :----   | 
| name            | string  | 
| email           | string  | 
| password_digest | string  | 
| admin           | boolean | 
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
# Herokuデプロイ手順

1. Herokuにログインする  
  $ heroku login  
  ※ ここで Waiting for login... で進まない場合は、  
  $ heroku login --interactive

1. コミットする  
  $ git add -A  
  $ git commit -m "init"  

1. Herokuに新しいアプリケーションを作成する  
  $ heroku create  

1. Heroku stackを変更する  
  $ heroku stack:set heroku-18  

1. Heroku stackが変更されたか確認  
  $ heroku stack  
  ※ heroku-18となっていればOK  

1. Heroku buildpackを追加する  
  $ heroku buildpacks:set heroku/ruby  
  $ heroku buildpacks:add --index 1 heroku/nodejs  

1. Herokuにデプロイをする  
  $ git push heroku master  

1. データベースの移行  
  $ heroku run rails db:migrate  

1. アプリケーションにアクセスする  
  Herokuアプリのアドレスはhttps://アプリ名.herokuapp.com/  