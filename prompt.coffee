stdin = process.openStdin()
stdin.setEncoding 'utf8'

GRID_SIZE = 5

inputCallback = null

stdin.on 'data', (input) ->
  inputCallback input

promptForTile1 = ->
  console.log "Enter coordinates for the first tile:"
  inputCallback = (input) -> promptForTile2() if strToCoordinates input
  
promptForTile2 = ->
  console.log "Enter coordinates for the second tile:"
  inputCallback = (input) ->
    if strToCoordinates input
      console.log "Swapping tiles..."
      promptForTile1()

strToCoordinates = (input) ->
  halves = input.split ','
  if halves.length is 2
    x = parseFloat halves[0]
    y = parseFloat halves[1]
    
    if !isInteger(x) or !isInteger(y)
      console.log "Each coordinate must be an integer"
    else if not inRange(x - 1, y - 1)
      console.log "Each coordinate must be between 1 and #{GRID_SIZE}"
    else
      { x, y }
  else
    console.log 'Input must be of the form "x,y"'
  
inRange = (coords...) ->
  (0 <= n < GRID_SIZE for n in coords).reduce (t, s) -> t and s

isInteger = (num) -> num is Math.round(num)

console.log "Welcome to 5x5!"
promptForTile1()
