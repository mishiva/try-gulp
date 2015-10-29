class Animal
  constructor: (@name) ->

class Snake extends Animal
  move: (m) ->
    console.log "move to #{m} meters!"

snake = new Snake 'Big buddhas snake'
snake.move 5
