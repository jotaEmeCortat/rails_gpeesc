- create pages controller
  - create pages#index
- add routes for pages
- create views for pages
- add bootstrap
- add simple_form
- add faker

- create author crud
```
rails g model author name academic_degree lattes avatar_img member:boolean
rails g controller authors

class Author < ApplicationRecord
  DEGREES = %w[Associado Mestre Doutor Pós-Doutor]
  has_many :repositories
  has_many :publications, through: :repositories
end
```

- create publication crud
```
rails g model publication title year:integer abstract:text theme category
rails g controller publications

class Publication < ApplicationRecord
  THEMES = %w[bullying corpo educação esporte idosos ]
  CATEGORIES = %w[artigo dissertação tese]
  has_many :repositories
  has_many :authors, through: :repositories
end
```

- add frendly_id


```bash

rails g model book title year:integer abstract:text cover_img
rails g model repository author:references publication:references book:references
```
