- create pages controller
  - create pages#index
- add routes for pages
- create views for pages
- add bootstrap
- add simple_form
- add faker
- create author crud
  rails g model author name academic_degree lattes avatar_img member:boolean
- create publication crud
  rails g model publication title year:integer abstract:text theme category
- create book crud
  rails g model book title year:integer abstract:text cover_img



- add frendly_id


```bash

rails g model repository author:references publication:references book:references
```
