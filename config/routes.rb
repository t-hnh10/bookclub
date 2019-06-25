Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "books#index"
  get "/books", to: "books#index", as: "books"
  get "/books/new", to: "books#new", as: "new_book"
  post "/books", to: "books#create"
  get "/books/add", to: "books#add", as: "add_book_to_list"
  delete "books/:id", to: 
  "book_list_items#destroy"
  get "/books/:id", to: "books#show", as: "book"
  get "/authors", to: "authors#index", as: "authors"
  get "/authors/:id", to: "authors#show", as: "author"
  get "/mylist", to: "book_list_items#index", as: "book_list_items"
  get "/mylist/:id/edit", to: "book_list_items#edit", as: "edit_book_list_item"
  put "/mylist/:id", to: "book_list_items#update"
  patch "/mylist/:id", to: "book_list_items#update", as: "book_list_item"
end