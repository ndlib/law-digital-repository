LawDigitalRepository::Application.routes.draw do
  resources :journals
  resources :journal_volumes
  resources :journal_articles
end
