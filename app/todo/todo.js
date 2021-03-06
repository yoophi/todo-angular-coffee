// Generated by CoffeeScript 1.10.0
(function() {
  (function() {
    var TodoCtrl;
    TodoCtrl = function($scope) {
      var addTodo, archive, ctrl, init, remaining;
      init = (function(_this) {
        return function() {
          _this.todos = [
            {
              text: "learn angular",
              done: true
            }, {
              text: "buld an angular app",
              done: false
            }
          ];
          _this.addTodo = addTodo;
          _this.remaining = remaining;
          return _this.archive = archive;
        };
      })(this);
      addTodo = (function(_this) {
        return function() {
          _this.todos.push({
            text: $scope.todoText,
            done: false
          });
          return $scope.todoText = "";
        };
      })(this);
      remaining = (function(_this) {
        return function() {
          var count;
          count = 0;
          angular.forEach(_this.todos, function(todo) {
            return count += todo.done ? 0 : 1;
          });
          return count;
        };
      })(this);
      archive = (function(_this) {
        return function() {
          var oldTodos;
          oldTodos = _this.todos;
          _this.todos = [];
          return angular.forEach(oldTodos, function(todo) {
            if (!todo.done) {
              return _this.todos.push(todo);
            }
          });
        };
      })(this);
      init();
      return ctrl = this;
    };
    return angular.module('myApp.todo', ['ngRoute']).config([
      '$routeProvider', function($routeProvider) {
        $routeProvider.when('/todo', {
          templateUrl: 'todo/todo.html',
          controller: 'TodoCtrl',
          controllerAs: 'ctrl'
        });
      }
    ]).controller('TodoCtrl', TodoCtrl);
  })();

}).call(this);

//# sourceMappingURL=todo.js.map
