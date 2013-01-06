class Todo.Collections.Tasks extends Backbone.Collection
  url: '/api/tasks.json'
  #GET /entries
  #POST /entries etc
  model: Todo.Models.Task
