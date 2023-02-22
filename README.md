# 💎 Ruby on 🛤️ Rails: 🚀LinkedIn Learning Course
## 📝 Class notes

## Controller generation

- `rails generate controller ControllerName actions`
- `rails generate controller Tasks index new edit` (for course example)

## Routing
### Match Route

We have several ways in order to specify a route

- `get “main/index”` —> In this case the controller and action name, must be the same as the route
- `match “main/index”, to: “main#index”, via: :get`: Long way
- `match “tasks/I:id”, to: “task#show”, via: :get`: Parametric route
- `root "main#index"`: To define root route
- `match "/", to: "main#index", via: :get`

### Parametric routes paths
#### Accessing Parameters inside a controller
We can access parameters as they are key on a Ruby hash:
- `params[:id]`
- `params['id']`

## Variables vs Instance variables
- A regular variable has scope inside a particular action
- An instance variable `@var_name` has scope throught an entire class and is available in all method in the class.
- We use instance variables `@var_name` to past data from controller to a view.

## Project database
### Managing database tables
We have several ways in order to edit or add table in our DB:
- Can use legacy database table
- Can manually manage database tables
- Ca use **Ruby on Rails** `migratrions`

#### Migration
- A migration is a set of database instructions written in Ruby
- Migrations allows us **migrate** a database from one state to another:
  - Add a table
  - Add a colum
  - Change the name of a colum
  - And much more
- Allows move from a new or a previous state
- Allows handle SQL database or any other writing code in Ruby instead of SQL language.
- The migration code is a `Ruby Class` with two methods `up` (create) and `down` (undo - drop).

## CLI to generate migrations
We can generate migrations from the CLI using:
- `rails generate migration <MigrationName>`
- Migrations methods:
  - `create_table`
  - `drop_table`
  - `rename_table`
  - `add_column`
  - `remove_column`
  - `rename_column`

### Table columns Types
1. string
2. integer
3. boolean
4. text
5. decimal
6. datetime
7. date
8. time
9. binary

## Migrations from models
We can generate migrations from **models generations**:
- `rails generate model <ModelName> colums`
- For example:
  - `rails generate model Task name:string description:text position:integer completed:boolean`
  - Run migrations: `rails db:migrate`
    - After generate a model, you have to run `rails db:migrate RAILS_ENV=development` in order to be able to run your project, now we the generate model available.
    - Interesting CLI commands:
      - `rails db:migrate:status`
      - `rails db:migrate VERSION=0`: To reset
      - `rails db:migrate VERSION=20230222182956` to restore to some particular migration ID state (timestamping)

## Active Record

