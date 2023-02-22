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

