class Todo.Views.Task extends Backbone.View

  template: JST['tasks/task']
  tagName: 'li'

  events:
    'click #delete': 'remove'
    'click span': 'edit'

  initialize: ->
    this.$el.attr( "id", "task" )

  render: ->
    $(@el).html(@template(task: @model))
    @

  remove: ->
    @model.destroy()

  edit: (event) ->
      $('').toggle()
      $('#edit-task').toggle()
      this.input.focus()