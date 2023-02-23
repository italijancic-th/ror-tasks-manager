# 💎 Ruby on 🛤️ Rails: 🚀LinkedIn Learning Course
## 📝 Class notes

## Controller generation

- `rails generate controller ControllerName actions`
- `rails generate controller Tasks index new edit` (for course example)

## Routing
### Match Route

We have several ways in order to specify a route

- `get “main/index”`: In this case the controller and action name, must be the same as the route
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
- Design pattern for relational databases
- Retrieve and manipulate data as objects, not as statics rows
- **Active records Objects** are **Intelligent:**
  - Understand the structure of the table
  - Contain data from table rows
  - Know how te create, read, update, and delete rows
  - Add complex functionality
  - Can be manipulated as objects, then saved easily

## Record and Update technics
1. Find + Save:
   - `Find` record and create a new instance
   - `Set` values on instance
   - `Save` instance variable on DB
2. Find + Update:
   - Find record
   - Set values and save

## Delete records:
Is a two steps process:
1. Find the record and save in an instance variable
2. Call `destroy method`: `model_name.destroy`

## Query conditions
- `Task.where(completed: false)`
- `Task.where('completed = 0 AND position < 10')`
- **NEVER USE** an interpolate string in a query: Can create a vulnerability for SQL injection!
  - `Task.where('first_name LIKE #{@query}')`
  - Instead use: `Task.where(['first_name LIKE ?', @query])`
- **Find first:**
  - `Task.where(visible: true).first`
- `Task.find_by(visible: true)`
- **NOTE:** This methods will always return and object or `nil`.
- **Order:** `Task.order('opsition ASC')`
- **Limit:** `Task.limit(20)`
- **Combination:** `Task.where(completed: true).order(:position).limit(5).offset(10)`

## Relational Database Associations
In this case we can have different types of associations:
- One-to-one: Is te most common type (Example: relations between teacher and courses)
- One-to-many
- Mant-to-many

### Associations in RoR
- Create relationship in database
- Define relationship in models, both sides
- Use relationship

## CRUD in RoR
CRUD is stands for:
- Create
- Read
- Update
- Delete

## REST
- Rest is stands for **Representational state transform**
- Instead of performing procedures, perform **state transformations on resources**

### REST HTTP Verbs
- **GET:** `{objetive: Retrieve items from resource - usage: Links}`
- **POST:** `{objetive: Create new item in resource - usage: Forms}`
- **PATCH:** `{objetive: Update item in resource - usage: Forms}`
- **DELETE:** `{objetive: Delete existing item in resource - usage: Links, Forms}`

## Resourceful Routes
Using this syntax: 

```ruby
resource :tasks
resource :categories
```

The correspondents routes for a full REST API implementation are automatically generated by rails.

### Omit resourceful Routes
You can also omit some route if yu want or need it:
```ruby
resource :users, except: [:show]
resource :products, only: [:index, :show]
```

## Add Resourcefull Routes
For example **delete** actions is not included by default, so you can add

```ruby
resorces :tasks do
  
  # To operate over one element
  member do
    get :delete
  end
  
  # To operate over entire collections of items
  colletion do
    get :export
  end
  
end
```

## Resourceful URL Helpers
- Using helpers, instead of do this: `{controller: 'tasks', action: 'show', id: 5}`, you can do this:
```ruby
  tasks_path(5)
```

