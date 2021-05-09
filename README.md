# Rails Project - Tripper

Phase 3 Flatiron project.


Tripper is a trip planner that let's you choose a destination and plan itineraries with activities. Tripper will help you keep your vacation on track!


## Installation

Execute:

    bundle install
    rails db:migrate
    rails db:seed

#Logging in through a google account:
    https://console.developers.google.com/apis
    > "Credentials"
    > "+ Create Credentials" 
    > "OAuth Client ID"
    > Application type > "Web Application"
    > Name > repository name
    > "CREATE"
    > Copy the Client ID and Secret Key and paste them in a file

    Git clone the repository
    Create an .env file in the root directory of the repository with:
        GOOGLE_CLIENT_ID = <paste Your Client ID here>
        GOOGLE_SECRET_CLIENT = <paste Your Client Secret here>
    Add .env inside .gitignore file


## Usage

Start the application in terminal by system command: `rails s`

Go to `http://localhost:3000/` in your browser to view the application.

If you're a new user, click on the signup link. After creating your account, you can start planning your trips!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ang-lam/rails-travel-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ang-lam/rails-travel-app/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the UniquelyYou project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ang-lam/rails-travel-app/blob/master/CODE_OF_CONDUCT.md).