# ![Figaro](https://i.imgur.com/uG0EFjh.png)

# REQUIREMENTS

* Ruby Version

  ```2.6.0```

* Configuration 
  
  ```yml
  #config/application.yml
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
  just push on heroku lol
```

# TODO

- [x] steam login
- [x] home page
- [x] implement docker for deploys
- [x] test suite
- [x] omniauth-steam test
- [ ] automated tests
- [ ] implement pusher for chat
- [ ] improve home page 