# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
- 2.3.1

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Database Design

## users table

|Column|Type|Option|
|------|----|------|
|name|string|index: true, null: fales, unique: true|
|email|string|unique: true, null: false|

### Association

- has_many :groups , through :members
- has_many :messages
- has_many :members

## messages table

|Column|Type|Option|
|------|----|------|
|body|text|null: fales|
|image|string|null: true|
|group_id|integer|null: fales, foreign_key: true|
|body|integer|null: fales, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :group

## groups table

|Column|Type|Option|
|------|----|------|
|group_name|string|index: true, null: fales, unique: true|

### Association

## members table

|Column|Type|Option|
|------|----|------|
|user_id|integer|null: fales, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :group
