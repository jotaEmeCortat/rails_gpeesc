- create pages controller
  - create pages#index
  - create pages#members
  - create pages#publications
  - create pages#books
- add routes for pages#index, pages#members, pages#publications, pages#books
- create views for pages#index, pages#members, pages#publications, pages#books
- add bootstrap
- add simple_form
- add faker
- Create author crud
  ```
  rails g model author name academic_degree lattes avatar_img member:boolean
  rails g controller authors

  class Author < ApplicationRecord
    DEGREES = %w[Associado Mestre Doutor Pós-Doutor]
    has_many :repositories
    has_many :publications, through: :repositories
  end
  ```

```bash
rails g model publication title year:integer abstract:text theme category
rails g model book title year:integer abstract:text cover_img
rails g model repository author:references publication:references book:references
```
