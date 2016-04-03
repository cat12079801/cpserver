# Competition Programming Server

### Middleware version

<dl>
  <dt>Ruby</dt>
  <dd>2.3.0p0</dd>
  <dt>Rails</dt>
  <dd>5.0.0.beta3</dd>
  <dt>MySQL</dt>
  <dd>5.6.23</dd>
  <dt>Redis</dt>
  <dd>3.0.7</dd>
  <dt>Sidekiq</dt>
  <dd>4.1.1</dd>
</dl>

### Install and Run

```
$ git clone https://github.com/cat12079801/cpserver.git
$ cd cpserver
$ bundle install --path vendor/bundle
$ cp config/database.yml.default config/database.yml
$ vim config/database.yml # set username, password, socket
$ ./bin/rails db:create
$ ./bin/rails db:migrate
$ ./bin/rails db:seed
$ ./bin/rails s
```

```
$ redis-server
```

```
$ cd cpserver
$ bundle exec sidekiq
```
