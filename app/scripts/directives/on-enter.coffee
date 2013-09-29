angular.module('firebangularApp')
  .directive 'onEnter', () ->
    (scope, element, attrs) ->
      element.bind "keydown keypress", (event) ->
        if event.which is 13 and element.val().length > 0
          scope.$apply () ->
            scope.$eval(attrs.onEnter)
          event.preventDefault()
