- add bootstrap
- add simple_form
- add faker
- add friendly_id
- add font-awesome
- add autoprefixer
- add sassc-rails

- create pages controller, routes and views
  rails g controller pages home publications books
  
- create author crud
  rails g model author name qualification lattes avatar_img member:boolean

- create publication crud
  rails g model publication title year:integer abstract:text theme publication_type cover_img

- create repository model
  rails g model repository author:references publication:references
