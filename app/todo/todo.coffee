'use strict'

class TodoCtrl
  constructor: (@$scope) ->
    @$scope.todos = [
      text: "learn angular"
      done: true
    ,
      text: "buld an angular app"
      done: false
    ]

  addTodo: ->
    @$scope.todos.push({ text: @$scope.todoText, done: false })
    @$scope.todoText = ""

  remaining: ->
    count = 0
    angular.forEach(@$scope.todos, (todo) ->
      count += if todo.done then 0 else 1
    )
    count

  archive: ->
    oldTodos = @$scope.todos
    @$scope.todos = []
    angular.forEach(oldTodos, (todo) =>
      @$scope.todos.push(todo) unless todo.done
    )

TodoCtrl.$inject = ['$scope']

angular.module('myApp.todo', ['ngRoute']).config([
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider.when '/todo',
      templateUrl: 'todo/todo.html'
      controller: 'TodoCtrl'
      controllerAs: 'ctrl'
    return
]).controller 'TodoCtrl', TodoCtrl
