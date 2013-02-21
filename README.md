![Get shit done](http://f.cl.ly/items/312R313g121Z3t0h2Y30/Screen%20Shot%202013-02-17%20at%209.39.50%20PM.png)

Get Shit Done
===========
### Dead stupid todo app with Ruby on Rails and Backbone.js

Get shit done is a simple todo app developed using Ruby on Rails and Backbone.js. The main purpose is to have an easy way to organize my everyday workflow and my tasks in a dead stupid way, with three lists: in queue, doing, done. Also, it's very useful to showcase the process of developing with Backbone.js and Rails, and make a proof of concept with the combination of both.

### Deploy

First, you need to clone the git repository.
```
git clone https://github.com/Geembo/getshitdone.git
```
or grab the ssh link above, if you use git with ssh.

Then, you need to need to folow this steps.

```
cd getshitdone
rake db:setup
rake assets:precompile
unicorn_rails -E production -D 
```
By default, the project uses in development sqlite3 and in production postgresql.
Feel free to change it according to your wishes.
If you are bored to get some data in there and you want to quickly see what's up with it, just run the following command.
```
rake db:seed
```

### Contribute

1. Fork the repo
2. Do your mojo
3. Open pull request
4. Discuss

### Demo

You may find a demo version of this app @ http://geembogetshitdone.herokuapp.com

You can login with these credentials
```
email: demo@geembo.com
password: password
```

or register for your own account

That's all folks! Many updates will follow soon.
