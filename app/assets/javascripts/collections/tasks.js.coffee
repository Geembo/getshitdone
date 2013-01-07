class Todo.Collections.Tasks extends Backbone.Collection
  url: '/api/tasks'
  #GET /entries
  #POST /entries etc
  model: Todo.Models.Task
