Rails.application.routes.draw do
 match ":controller(/:action(/:id))", :via => [:post, :get]
end
