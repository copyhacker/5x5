fs = require 'fs'

GRID_SIZE = 5

owl2 = fs.readFileSync 'OWL2.txt', 'utf8'

wordList = owl2.match /^(\w+)/mg
wordList = (word for word in wordList when word.length <= GRID_SIZE)

console.log wordList.length

isWord = (str) -> str.toUpperCase() in wordList

console.log isWord('aedlhd')
console.log isWord 'qi'