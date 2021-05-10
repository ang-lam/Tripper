Specs:

 - [x] Using Ruby on Rails for the project - used rails framework for project
 - [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - Itinerary has_many Activities
 - [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - Activity belongs to Itinerary
 - [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - User has_many Destinations through Itineraries, Destination has_many Users through Itineraries
 - [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - Destination and User are many-to-many
 - [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - Itineraries has date attribute
 - [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - validate format and presence of required data
 - [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - included several scope methods in models to organize data, e.g. top_destinations
 - [x] Include signup (how e.g. Devise) - signup through Users controller/routes/actions
 - [x] Include login (how e.g. Devise) - login through Sessions controller
 - [x] Include logout (how e.g. Devise) - destroy session to logout
 - [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Used omniauth to add google oauth for third party signup/login
 - [x] Include nested resource show or index (URL e.g. users/2/recipes) - Nested itineraries in destinations e.g. /destinations/:id/itineraries
 - [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - have /destinations/:id/itineraries/new
 - [x] Include form display of validation errors (form URL e.g. /recipes/new) - display validaiton errors in all forms in application (errors partial)

Confirm:

 - [x] The application is pretty DRY
 - [x] Limited logic in controllers
 - [x] Views use helper methods if appropriate
 - [x] Views use partials if appropriate