Graph = require("../src/graph").Graph

describe "Graph", ->
  describe "constructor test", -> 
    graph = new Graph(3,[])
    it "num_verticies equal 3", -> 
      expect(graph.num_verticies).toEqual 3
    it "adjlist length is 3", -> 
      expect(graph.adjlist.length).toEqual 3
    it "multi verticies", -> 
      graph = new Graph(9,[])
      expect(graph.adjlist.length).toEqual 9

  describe "dijkstra test", -> 
    graph = new Graph(9,
          [[0,1,2],[0,2,3],[0,3,5],[1,2,2],[1,4,4],[2,3,4],[2,4,5],[2,6,8],
           [3,5,2],[3,6,4],[4,7,2],[5,4,1],[5,8,3],[6,5,2],[6,8,3],[7,5,1],
           [7,8,5]])
    it "0 vertex vector", -> 
      expect(graph.adjlist[0].length).toEqual 3
    it "calc dijkstra", -> 
      expect(graph.dijkstra(0,8)).toEqual [0,3,5,8]
      expect(graph.dijkstra(3,8)).toEqual [3,5,8]
      expect(graph.dijkstra(5,8)).toEqual [5,8]
