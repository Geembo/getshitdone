![Get shit done](http://f.cl.ly/items/312R313g121Z3t0h2Y30/Screen%20Shot%202013-02-17%20at%209.39.50%20PM.png)

Get Shit Done
===========
### Dead stupid todo app with Ruby on Rails and Backbone.js

Get shit done is a simple todo app developed using Ruby on Rails and Backbone.js. The main purpose is to have an easy way to organize my everyday workflow and my tasks in a dead stupid way, with three lists: in queue, doing, done. Also, it's very useful to showcase the process of developing with Backbone.js and Rails, and make a proof of concept with the combination of both.

### Run the app

First, you need to clone the git repository.
```
git clone http://github.com/tsironis/getshitdone
```
or grab the ssh link above, if you use git with ssh.

Then, you need to start the Rails app.

```
cd getshitdone
rails s
```
By default the project uses a basic sqlite3 databases but you can change the adapter according to your wish.
If you are bored to get some data in there and you want to quickly see what's up with it, just run the following command.
```
rake db:seed
```

That's all folks! Many updates will follow soon.
