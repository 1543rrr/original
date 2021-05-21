# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## DB

# user table
|name   |string  |null :false|
|email  |string  |null :false|
|password|string |null :false|
|password_confirmation|string|null :false|

has_many: comments
has_many: posts
has_many: likes

# posts table
|title|string |null :false|
|content|text|null :false|
| user      | references | foreign_key :true |

has_many: comments
has_many: likes
has_many: photos
belongs_to :user

# photos table
