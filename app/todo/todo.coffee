(->
  TodoCtrl = ($scope) ->
    ctrl = @
    ctrl.todos = [
      text: "learn angular"
      done: true
    ,
      text: "buld an angular app"
      done: false
    ]

    ctrl.addTodo = ->
      ctrl.todos.push({ text: $scope.todoText, done: false })
      $scope.todoText = ""

    ctrl.remaining = ->
      count = 0
      angular.forEach ctrl.todos, (todo) ->
        count += if todo.done then 0 else 1
          
      count

    ctrl.archive = ->
      oldTodos = ctrl.todos
      ctrl.todos = []
      angular.forEach oldTodos, (todo) ->
        ctrl.todos.push(todo) unless todo.done

    return

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

