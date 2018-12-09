# Database Design

## users table

|Column|Type|Option|
|------|----|------|
|name|string|index: true, null: fales, unique: true|
|email|string|unique: true, null: false|

### Association

- has_many :groups, through: :members
- has_many :messages
- has_many :members

## messages table

|Column|Type|Option|
|------|----|------|
|body|text|null: fales|
|image|string|null: true|
|group_id|references|null: fales, foreign_key: true|
|user_id|references|null: fales, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :group

## groups table

|Column|Type|Option|
|------|----|------|
|name|string|index: true, null: fales, unique: true|

### Association

- has_many :users, through: :members
- has_many :messages
- has_many :members

## members table

|Column|Type|Option|
|------|----|------|
|user_id|references|null: fales, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :group
