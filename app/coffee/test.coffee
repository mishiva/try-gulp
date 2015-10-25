bb = (a) ->
  console.log a

obj =
  a: 'a'
  b: 'b'


window.CONST_MY = 2

class Animal
  constructor: (@name) ->

class Snake extends Animal
  move: (m) ->
    console.log "move to #{m}meters"

snake = new Snake 'snake on'
snake.move 5
