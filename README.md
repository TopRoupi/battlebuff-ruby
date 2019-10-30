# ![](https://i.imgur.com/uG0EFjh.png)

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