setTimeout ->
  console.log 'Hello'
, 1000
console.log 'World'

start = new Date().getTime()
while (new Date().getTime() < start + 1000)
  console.log 'Hige'
console.log 'Fuga'
