# 💎 Ruby on 🛤️ Rails:
## 🚀 LinkedIn Learning course

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




