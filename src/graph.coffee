class Graph
  constructor:(num_verticies,edges) ->
    @num_verticies = num_verticies
    @adjlist = []
    @adjlist.push([])  for [1..@num_verticies]
    @adjlist[edge[0]].push([edge[1],edge[2]]) for edge in edges

  dijkstra:  (start,goal) ->
    distance = []
    distance.push(Number.POSITIVE_INFINITY) for [1..@num_verticies]
    distance[start] = 0

    prev     = []
    prev.push(-1) for [1..@num_verticies]

    visited  = []
    visited.push(false) for [1..@num_verticies]

    count = 0
    while count < @num_verticies
      min = Number.POSITIVE_INFINITY
      u   = 0

      for i in [0 .. (@num_verticies - 1) ] 
        if distance[i] < min  && !visited[i]
          min = distance[i]
          u   = i

      visited[u] = true
      count++
      for successor in @adjlist[u]
        continue if visited[successor[0]]
        new_distance = distance[u]  +  successor[1]
        if distance[successor[0]] > new_distance
          distance[successor[0]] = new_distance
          prev[successor[0]] = u

    path = []
    p = goal
    while p != start
      path.unshift  p
      p = prev[p]
    path.unshift  start
    path

exports.Graph = Graph
