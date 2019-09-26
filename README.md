# ![Figaro](https://i.imgur.com/uG0EFjh.png)

# Description

Dota 2 in-house

### live-demo
https://battlebuff.herokuapp.com

# REQUIREMENTS

* Ruby Version

  ```2.6.0```

* Configuration

  ```yml
  #config/application.yml

  #https://steamcommunity.com/dev/apikey
  STEAM_KEY: <your key>
  ```

* System dependencies

  ```Postgresql 11.5```

* Database setup

  ```sh
  rails db:create
  rails db:migrate
  ```

* How to run the test suite

  ```sh
  bundle exec rake spec
  ```

<!-- * Services -->

* Deployment instructions

  ```
    heroku git:remote -a battlebuff
    git push origin heroku
  ```

# TODO

- [x] steam login
- [x] home page
- [x] test suite
- [x] omniauth-steam test
- [x] implement rails_channels for chat
- [ ] improve home page
- [ ] page to report bugs
- [ ] fix the action_cable indentify by cookie