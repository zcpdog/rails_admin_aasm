# Rails Admin State Machine
### Properly manage AASM states from rails_admin

Allows easily sending state_machine events to a model from Rails Admin, including support for
ActiveRecord \ Mongoid and custom state field name and multiple state machines per model.

## Installing

Add this line to your application's Gemfile:

    gem 'rails_admin_aasm'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_admin_aasm

## Usage

Add the state action:

    RailsAdmin.config do |config|
      config.actions do
        ......
        state
      end
    end

Mark the field you need display as state:

    rails_admin do
      list do
        field :state, :state
        ...
      end
      edit do
        field :state, :state
        ...
      end
      ...
    end

### States and event button/label custom classes:

    rails_admin do
      list do
        field :state, :state
        ...
      end
      ...
      state({
        events: {dead: 'btn-danger', drain: 'btn-warning', alive: 'btn-success'},
        states: {dead: 'label-important', drain: 'label-warning', alive: 'label-success'}
        disable: [:dead] # disable some events so they are not shown.
      })

    end

Some classes are preset by default (published, deleted, etc)
  
### CanCan integration

    cannot :manage, Recipes::Recipe
    can :read, Recipes::Recipe
    can :state, Recipes::Recipe # required to do any transitions
    can :all_events, Recipes::Recipe

### i18n (state and event names):

Just as usual for state_machine, see:

http://rdoc.info/github/pluginaweek/state_machine/master/StateMachine/Integrations/Mongoid

http://rdoc.info/github/pluginaweek/state_machine/master/StateMachine/Integrations/ActiveRecord

For namespaced models use "/", just as usual: "Blog::Post" is "blog/post"

State name set this way is also used in .human_state_name, error messages, etc

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
