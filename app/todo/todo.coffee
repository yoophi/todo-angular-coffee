(->
  TodoCtrl = ($scope) ->
    init = () =>
      @todos = [
        text: "learn angular"
        done: true
      ,
        text: "buld an angular app"
        done: false
      ]

      @addTodo = addTodo
      @remaining = remaining
      @archive = archive

    addTodo = =>
      @todos.push({ text: $scope.todoText, done: false })
      $scope.todoText = ""

    remaining = =>
      count = 0
      angular.forEach @todos, (todo) ->
        count += if todo.done then 0 else 1
      count

    archive = =>
      oldTodos = @todos
      @todos = []
      angular.forEach oldTodos, (todo) =>
        @todos.push(todo) unless todo.done

    init()
    ctrl = @


  angular
    .module('myApp.todo', ['ngRoute'])
    .config([
      '$routeProvider'
      ($routeProvider) ->
        $routeProvider.when '/todo',
          templateUrl: 'todo/todo.html'
          controller: 'TodoCtrl'
          controllerAs: 'ctrl'
        return
    ])
    .controller('TodoCtrl', TodoCtrl)
)()

