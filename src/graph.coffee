class Graph
  constructor:(num_verticies,edges) ->
    @num_verticies = num_verticies
    @adjlist = []
    @adjlist.push([])  for [1..@num_verticies]
    @adjlist[edge[0]].push([edge[1],edge[2]]) for edge in edges

  dijkstra:  (start,goal) ->
    #distances are all Infinity
    distance = []
    distance.push(Number.POSITIVE_INFINITY) for [1..@num_verticies]
    distance[start] = 0

    #prevs are all -1
    prev     = []
    prev.push(-1) for [1..@num_verticies]

    #visited are all false
    visited  = []
    visited.push(false) for [1..@num_verticies]

    for count in [0 .. (@num_verticies - 1) ] 
      min = Number.POSITIVE_INFINITY
      minimum_distance_vertex   = 0

      for i in [0 .. (@num_verticies - 1) ] 
        if distance[i] < min  && !visited[i]
          min = distance[i]
          minimum_distance_vertex   = i

      visited[minimum_distance_vertex] = true
      for successor in @adjlist[minimum_distance_vertex]
        continue if visited[successor[0]]
        new_distance = distance[minimum_distance_vertex]  +  successor[1]
        if distance[successor[0]] > new_distance
          distance[successor[0]] = new_distance
          prev[successor[0]] = minimum_distance_vertex

    path = []
    p = goal
    while p != start
      path.unshift  p
      p = prev[p]
    path.unshift  start
    path

exports.Graph = Graph
