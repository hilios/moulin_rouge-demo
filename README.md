# Moulin Rouge Demo App

This is a example application using [Moulin Rouge](https://github.com/hilios/moulin_rouge)
to manage [CanCan](https://github.com/ryanb/cancan) authorization system.

It is just a simple blog implementation with `:admin`, `:editor` and `:author` roles. You can see the abilities for each role under `app/authorizations` folder.

## Testing

This app uses *RSpec-2* and *Cucumber* gems with *Guard* to autotes. To run execute the following command:

    bundle exec guard

## License

MIT License. Copyright 2012 [Edson Hilios](http://edson.hilios.com.br).