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

## Form Helpers
Rails helpers to made easy our job in order to create forms for create or edit a resource.
- Form parameters are grouped
- Form inputs are easier and more consistent
- Fields are pre-populated with objects attributes
- Form action/method check `object.new_record?`

## Partials
- Better code organization
- Don't repeat yourself
- Partials are partial templates

# Controller and Views Course
## Cookies
### Set a Cookie
To set a cookie inside a controller code, you must to work with Ruby hash data type:

```ruby
cookies[:username] = 'itlaijancic'

# You can wor with simple string or even with objects

cookies[:username] = { 
        value: 'itlaijancic',
        expires: 1.week.from_now }
```

### Reading a cookie

```ruby
# Example for read a cookie and assign to an instance variable
@username = cookies[:username]
```

### Limitations of cookies
- Maximun data size: 4k (about 4.000 characters)
- Do not store model instances inside a cookies, they used to be to large
- Reside on te user's computers
- Can be reade, deleted, or altered **So don't store sensitive data in cookies**

# Sessions
- Web servers sends a sessions ID to the browser, which then saves it in a cookie
- Browser sends session ID with each feature request to that web server
- Web server uses session ID to locate the session file

## Set and read session data
```ruby
# Set a session value
session[:language] = 'en'

# Read a sesion value
@language = session[:language]
```

## Limitations of sessions
- Requires time to retrieve the session file
- Session files accumulate on server
- Sessions cookies resides on the user's computer
- Session cookie can be deleted or hijacked

## Session storage estrategies
- File storage `(:file_store)`
- Database storage `(:active_record_store)`
- Cache storage `(:cache_store)`
- Cookie storage `(:cookie_store)`

### Session cookie storage: default ruby setting
- Stored in each user's browser
- Encrypted and digitally signed
- Fast, no lookup needed
- No file or database load
- **Limitation:** 4K maximum size

## Session Configuration
Rails by default config sessions file for us:
- `config/master.key` key to encrypt data on cookies
- `config/credentials.yml.enc`
- This config files include data to encrypt and digitally sign cookies
- Keep master key secret (listed in .gitignore by default)

## Flash Hash
- Stores a message in session data
- Use for message needed after a redirect
- Store text, not objects or other data
- Clear old messages after every request

Some examples of **Flash Hash** messages are:

```ruby
# Success flash
flash[:notice] = 'Product created successfully.'
# Error flash
flash[:error] = 'Category could not be found.'
# Alert flash
flash[:alert] = 'Not enough access privileges.'
```

# Log: for server and application
## Logs Files
The log files are in the application root, inside log folder:
- log/development.log
- log/production.log
- log/test.log

## Log levels
- `:debug`: Database queries
- `:info`: All less database request: for example Request/render details
- `:warn`: Deprecations, Standard errors and fatal errors
- `:error`: Standard errors and Fatal errors
- `:fatal`: Fatal errors

## Clear Log Files
```shell
rails log:clear
```

## Insert data into log file
```ruby
# Debug level
logger.debug("The name is #{@subject.name}")
# Info level
logger.info("Starting the subject update...")
# Warning level
logger.warn("Invalid log in by #{params[:username]}")
# Error level
logger.error("Page #{params[:id]} not found")
# Fatal level
logger.fatal("Necessary RubyGem not loaded")
```

## Controller filter
There are tree types
- `before_action`
- `after_action`
- `around_action`: Execute a code before and after the action method inside a controller

# Render and Redirect
- An action may only call render or redirect **once**
- `Render` does not immediately render; it sets the template to be rendered
- `Redirect` does not immediately redirect; it sets a value in the HTTP response
- `Render` and `redirect` do not terminate the action

## Render types
```ruby
# Render template by name
render('show')

# Render partial
render(partial: 'form', locals: {})

# Render plain text
render(plain: 'Just render text')
# Plain message and status code for HTTP request
render(plain: 'OK', status: 200)

# Render html
render(html: '<strong>HTML text</strong>')

# Render json (render a hash or ruby object)
render(json: @customer)

# Render xml
render(xml: %w[cat dog mouse])

# Render a file
render(file: '/path/to/file.html')

# Send file - to download a file 
send_file('/path/to/file.html')

# Render to string
render_to_string(file: '/path/to/file.html')
```

## Capture Content
```ruby
content_for(name, content)

content_for?(name)
```

# Add Style Sheets
We have different options at time to work with statics style sheets:
- Static style sheet in public directory `/public/stylesheets`
- Asset pipelines

## Asset pipeline benefits
- Concatenate style sheet files
- Precompile CSS
- Compresses and minifies files
- Allows writing styles in other languages
- Adds asset fingerprinting

### Write statics style sheets
- Location: `app/assets/stylesheets`
- File name should end in `.css` 

### Style sheets in asset pipeline
- Asset precompile `list include manifest`
- **Manifest file** includes style sheets
- Style sheet link tag loads the compiled style sheet in the HTML page
- Precompile assets for deployment


### Precompile Assets for Production
```shell
export RAILS_ENV=production

bundle exec rails assets:precompile
```

# Add images
We have two ways to add images to our source code:
- Static images in public directory `public/images`
- Asset pipeline

## Benefits of wor with images in assets pipeline
- Assets pipeline makes easy for helper methods to find images
- Performs asset fingerprinting
- Location: `app/assets/images`

## Image Helpers
```html
# We can add our image in the template with the html tag
<image src="/assets/logo.png"/>
```
Or rails helpers
```erbruby
<%= image_tag('logo.png') %>
<%= image_tag('logo.png', size: '90x55', alt: 'logo') %>
<%= image_tag('logo.png', width: 90, height: 55) %>
```

# Helpers
- `word_wrap`
- `simple_format(text)`
- `truncate(text, {lenght:28})`
- `pluralize`
- 

# Models and associations
## Smart models by design
- `Fat model, skinny controller`
- Move most business logic to models
- Define instance methods for things and instance of class should "_know_"
- Models can leverage attributes and associations

## Named Scopes
- Commonly-used queries defined in a model
- Defined using built-in query methods
- Use a lambda function, a block of code for a later use

## Instance Attributes
Types:
- `attr_reader`
- `attr_writer`
- `attr_accessor`
Characteristics:
- Attributes are methods to access values of `Active records objects`
- Useful for setting temporary states in object
- Values will not be stored in database
- Can affect the values and behaviors of the methods

## Validations
- This are like rules defined in models that data must complain
- Ensure data meets requirements before saving to database
- Validation code resides in models
- **Failed validations:** record will not save, will track errors
