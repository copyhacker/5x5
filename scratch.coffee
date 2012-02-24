# clearArray = (arr) ->
#   console.log "clearing #{arr}"
#   arr.splice 0, arr.length
#   arr
#   
# # a = [1,2,3]
# # console.log clearArray(a)
# # console.log a
# 
# run = (func, args...) -> func(args) 
# 
# console.log run(clearArray, [1,2,3])

xInContext = ->
  console.log @x
  
what = { x: 'QE'}

xInContext.apply what
