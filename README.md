# Rails Admin State Machine
### Properly manage AASM states from rails_admin

Allows easily sending state_machine events to a model from Rails Admin, including support for
ActiveRecord \ Mongoid and custom state field name and multiple state machines per model.

Based on https://github.com/rs-pro/rails_admin_state.
Since state_machine currently is not maintained, I turn to AASM https://github.com/aasm/aasm.

## Installing

Add this line to your application's Gemfile:

    #please use `0.1.1` if rails_admin <= `0.8.1`
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

Events:

```
activerecord:
    events:
      product_order:
        pay: 支付
        refund: 同意退款
        reject_refund: 拒绝退款
```

State:

```
product_order:
    status/unpaid: 未支付
```

notice the state must combine with `/`, see: [https://github.com/aasm/aasm/issues/38](https://github.com/aasm/aasm/issues/38)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
