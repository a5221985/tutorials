<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1573695387518" ID="ID_1548920405" MODIFIED="1573695404060" TEXT="Graph Algorithms">
<node CREATED="1573695419545" ID="ID_1811214844" MODIFIED="1573695429541" POSITION="right" TEXT="1. Graph Theory Introduction">
<node CREATED="1573695924171" ID="ID_629441939" MODIFIED="1573695978301" TEXT="How to store represent and traverse"/>
<node CREATED="1573695981332" ID="ID_781954237" MODIFIED="1573695986935" TEXT="Algorithms and implementation details">
<node CREATED="1573695987246" ID="ID_235590306" MODIFIED="1573695991142" TEXT="Com Sci point of view"/>
</node>
<node CREATED="1573695997647" ID="ID_1349348714" MODIFIED="1573696011589" TEXT="Brief Introduction">
<node CREATED="1573696011767" ID="ID_742322036" MODIFIED="1573696031751" TEXT="Graph Theory is the mathematical theory of the properties and applications of graphs (networks)."/>
<node CREATED="1573696032965" ID="ID_188611191" MODIFIED="1573696049327" TEXT="The goal of this series is to gain an understanding of how to apply graph theory to real world applications."/>
<node CREATED="1573696076446" ID="ID_720005258" MODIFIED="1573696109444" TEXT="A graph theory problem might be: Given the constraints above, how many different sets of clothing can I make by choosing an article from each category?">
<node CREATED="1573696154753" ID="ID_507584791" MODIFIED="1573696162849" TEXT="Visualization is possible"/>
</node>
<node CREATED="1573696166546" ID="ID_1702786956" MODIFIED="1573696186314" TEXT="The canonical graph theory example is a social network of friends.">
<node CREATED="1573696191568" ID="ID_45873772" MODIFIED="1573696237366" TEXT="Enables interesting questions such as: how many friends does person X have? Or how many degress of separation are there between person X and person Y?"/>
</node>
<node CREATED="1573696261474" ID="ID_812471411" MODIFIED="1573696263451" TEXT="Types">
<node CREATED="1573696264196" ID="ID_1858726627" MODIFIED="1573696268107" TEXT="Undirected Graph">
<node CREATED="1573696268324" ID="ID_1829472180" MODIFIED="1573696289116" TEXT="An undirected graph is a graph in which edges have no orientation. The edge (u, v) is identical to the edge (v, u). - Wiki">
<node CREATED="1573696289665" ID="ID_1885434100" MODIFIED="1573696310901" TEXT="Nodes could represent cities and an edge could represent a bidirectional road."/>
</node>
</node>
<node CREATED="1573696323287" ID="ID_368010190" MODIFIED="1573696329301" TEXT="Directed Graph (Digraph)">
<node CREATED="1573696329638" ID="ID_368378225" MODIFIED="1573696353263" TEXT="A directed graph or digraph is a graph in which edges have orientations. For example, the edge (u, v) is the edge from node u to node v.">
<node CREATED="1573696356063" ID="ID_1572252291" MODIFIED="1573696381551" TEXT="Nodes could represent people and an edge (u, v) could represent that person u bouth person v a gift."/>
</node>
</node>
<node CREATED="1573696409707" ID="ID_1121624774" MODIFIED="1573696413991" TEXT="Weighted Graphs">
<node CREATED="1573696414200" ID="ID_1168813154" MODIFIED="1573696450937" TEXT="Many graphs can have edges that contain a certain weight to represent an arbitrary value such as cost, distance, quantity, etc...">
<node CREATED="1573696453536" ID="ID_940247906" MODIFIED="1573696484311" TEXT="Note: Edge can be denoted as a triplet (u, v, w) and specify if the graph is directed or undirected"/>
</node>
</node>
<node CREATED="1573696534023" ID="ID_658052470" MODIFIED="1573696539234" TEXT="Special Graphs">
<node CREATED="1573696539472" ID="ID_1702151708" MODIFIED="1573696540626" TEXT="Tree">
<node CREATED="1573696542529" ID="ID_281972725" MODIFIED="1573696570946" TEXT="A tree is an undirected graph with no cycles. Equivalently, it is connected graph with N nodes and N-1 edges"/>
<node CREATED="1573696581012" ID="ID_121691472" MODIFIED="1573696583987" TEXT="Rooted Trees!">
<node CREATED="1573707381331" ID="ID_1865944826" MODIFIED="1573707449284" TEXT="A rooted tree is a tree with a designated root node where every edge either points away from or towards the root node. When edges point away from the root the graph is called an arborescence (out-tree) and anti-arborescence (in-tree) otherwise">
<node CREATED="1573707465136" ID="ID_1779085711" MODIFIED="1573707473370" TEXT="Out-tree is common"/>
</node>
</node>
</node>
</node>
<node CREATED="1573707481033" ID="ID_1158285946" MODIFIED="1573707489553" TEXT="Directed Acyclic Graphs (DAGs)">
<node CREATED="1573707490441" ID="ID_1635052197" MODIFIED="1573707498350" TEXT="DAGs are directed graphs with no cycles."/>
<node CREATED="1573707503105" ID="ID_1497162066" MODIFIED="1573707520595" TEXT="These graphs play an important role in representing structures with dependencies."/>
<node CREATED="1573707520987" ID="ID_1465223152" MODIFIED="1573707533066" TEXT="Several efficient algorithms exist to operate on DAGs">
<node CREATED="1573707697304" ID="ID_468200431" MODIFIED="1573707703167" TEXT="Finding shortest paths"/>
<node CREATED="1573707703400" ID="ID_284349538" MODIFIED="1573707708381" TEXT="Topological ordering of nodes">
<node CREATED="1573707711223" ID="ID_1901095439" MODIFIED="1573707772807" TEXT="How to process nodes in a graph that tells you how to not perform tasks before completing all of it&apos;s dependencies">
<node CREATED="1573707777305" ID="ID_1051562140" MODIFIED="1573707781824" TEXT="Class pre-requisites">
<node CREATED="1573707784823" ID="ID_1253053489" MODIFIED="1573707802101" TEXT="Intro-Biology, Intro-Chemisitry -&gt; Genomics"/>
</node>
</node>
</node>
</node>
<node CREATED="1573707533585" ID="ID_1316914706" MODIFIED="1573707535771" TEXT="Cool fact">
<node CREATED="1573707536180" ID="ID_185135062" MODIFIED="1573707551602" TEXT="All out-trees are DAGs but not all DAGs are out-trees"/>
</node>
<node CREATED="1573707644020" ID="ID_1112612821" MODIFIED="1573707662946" TEXT="DAGs can be used to represent structures with dependencies">
<node CREATED="1573707663172" ID="ID_1302122342" MODIFIED="1573707665238" TEXT="Scheduler"/>
<node CREATED="1573707665480" ID="ID_1114515802" MODIFIED="1573707667470" TEXT="Build System"/>
<node CREATED="1573707667716" ID="ID_1931429878" MODIFIED="1573707669126" TEXT="Compiler"/>
<node CREATED="1573707675727" ID="ID_226550640" MODIFIED="1573707685069" TEXT="University Class pre-requisites"/>
</node>
</node>
<node CREATED="1573707807929" ID="ID_866883909" MODIFIED="1573707811912" TEXT="Bipartite Graph">
<node CREATED="1574020788802" ID="ID_938375036" MODIFIED="1574020817771" TEXT="A bipartite graph is one whose vertices can be split into two independent groups U, V such that every edge connects between U and V."/>
<node CREATED="1574020822329" ID="ID_1789618780" MODIFIED="1574020884049" TEXT="Other definitions">
<node CREATED="1574020828126" ID="ID_1399592194" MODIFIED="1574020858350" TEXT="The graph is two colourable or there is no odd length cycle."/>
</node>
<node CREATED="1574020985211" ID="ID_397657341" MODIFIED="1574020986799" TEXT="Problems">
<node CREATED="1574020987011" ID="ID_1488807646" MODIFIED="1574021000840" TEXT="Maximum Matching on a bipartite graph">
<node CREATED="1574021017864" ID="ID_1211269075" MODIFIED="1574021027469" TEXT="How many people can be matched to jobs?"/>
</node>
<node CREATED="1574021063423" ID="ID_1845717183" MODIFIED="1574021066249" TEXT="Network flow"/>
</node>
<node CREATED="1574021092202" ID="ID_667062270" MODIFIED="1574021097610" TEXT="Interesting situations">
<node CREATED="1574021037592" ID="ID_1052203853" MODIFIED="1574021043121" TEXT="Lesser edges"/>
<node CREATED="1574021043368" ID="ID_665497230" MODIFIED="1574021047969" TEXT="Tougher constraints"/>
<node CREATED="1574021055898" ID="ID_273318170" MODIFIED="1574021059217" TEXT="More conflicts"/>
</node>
</node>
<node CREATED="1574021114425" ID="ID_769771793" MODIFIED="1574021118226" TEXT="Complete Graphs">
<node CREATED="1574021118523" ID="ID_1157041057" MODIFIED="1574021145295" TEXT="A complete graph is one where there is a unique edge between every pair of nodes. A complete graph with n vertices is denoted as the graph Kn">
<node CREATED="1574021154371" ID="ID_809570198" MODIFIED="1574021157876" TEXT="K1"/>
<node CREATED="1574021213305" ID="ID_1446692475" MODIFIED="1574021215316" TEXT="K2"/>
<node CREATED="1574021215810" ID="ID_1247034177" MODIFIED="1574021216833" TEXT="..."/>
<node CREATED="1574021217273" ID="ID_1256964777" MODIFIED="1574021219425" TEXT="K6"/>
</node>
<node CREATED="1574021234933" ID="ID_242945499" MODIFIED="1574021243325" TEXT="Worst case possible graphs">
<node CREATED="1574021243614" ID="ID_1464904315" MODIFIED="1574021249334" TEXT="Used to test performance"/>
</node>
</node>
</node>
<node CREATED="1574021259204" ID="ID_659099630" MODIFIED="1574021264189" TEXT="Representing Graphs">
<node CREATED="1574021265118" ID="ID_662137555" MODIFIED="1574021269092" TEXT="Data Structures">
<node CREATED="1574021274726" ID="ID_80160820" MODIFIED="1574021278437" TEXT="Adjacency Matrix">
<node CREATED="1574021280468" ID="ID_16899792" MODIFIED="1574021319734" TEXT="An adjacency matrix m is a very simple way to represent a graph. The idea is that the cell m[i][j] represents the edge weight of going from node i to node j."/>
<node CREATED="1574021322085" ID="ID_1806267672" MODIFIED="1574021340390" TEXT="Note: It is often assumed that the edge of going from a node to itself has a cost of zero.">
<node CREATED="1574021383165" ID="ID_814478067" MODIFIED="1574021388213" TEXT="Diagonal has 0s"/>
</node>
<node CREATED="1574021392485" ID="ID_895590187" MODIFIED="1574021395302" TEXT="Pros">
<node CREATED="1574021398366" ID="ID_459296064" MODIFIED="1574021414290" TEXT="Space efficient for representing dense graphs">
<node CREATED="1574021479611" ID="ID_1627247711" MODIFIED="1574021484214" TEXT="lot of edges"/>
</node>
<node CREATED="1574021417156" ID="ID_1704531640" MODIFIED="1574021423154" TEXT="Edge weight lookup is O(1)"/>
<node CREATED="1574021424120" ID="ID_1946712215" MODIFIED="1574021430146" TEXT="Simplest graph representation"/>
</node>
<node CREATED="1574021433337" ID="ID_1455087765" MODIFIED="1574021434227" TEXT="Cons">
<node CREATED="1574021434803" ID="ID_213087473" MODIFIED="1574021441187" TEXT="Requires O(V^2) space">
<node CREATED="1574021513321" ID="ID_1918766719" MODIFIED="1574021521672" TEXT="10000 nodes or more is almost infeasible"/>
</node>
<node CREATED="1574021441543" ID="ID_1493392630" MODIFIED="1574021451950" TEXT="Iterating over all edges takes O(V^2) time">
<node CREATED="1574021525669" ID="ID_212851130" MODIFIED="1574021535483" TEXT="fine for dense graphs but not good for sparse graphs"/>
</node>
</node>
</node>
<node CREATED="1574021537787" ID="ID_1575546663" MODIFIED="1574021546395" TEXT="Adjacency List">
<node CREATED="1574021549716" ID="ID_1824517851" MODIFIED="1574021569482" TEXT="An adjacency list is a way to represent a graph as a map from nodes to lists of edges">
<node CREATED="1574021571813" ID="ID_1992465243" MODIFIED="1574021619186">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      A -&gt; [(B,4),(C,1)]
    </p>
    <p>
      B -&gt; [(C,6)]
    </p>
    <p>
      C -&gt; [(A,4),(B,1),(D,2)]
    </p>
    <p>
      D-&gt;[]
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1574021659480" ID="ID_911935228" MODIFIED="1574021660806" TEXT="Pros">
<node CREATED="1574021661191" ID="ID_1246041180" MODIFIED="1574021671272" TEXT="Space efficient for representing sparse graphs">
<node CREATED="1574021671565" ID="ID_113569335" MODIFIED="1574021684743" TEXT="No additional allocation of memory"/>
</node>
<node CREATED="1574021694025" ID="ID_1481361900" MODIFIED="1574021700824" TEXT="Iterating over all edges is efficient"/>
</node>
<node CREATED="1574021702847" ID="ID_821514361" MODIFIED="1574021703656" TEXT="Cons">
<node CREATED="1574021703902" ID="ID_1699343231" MODIFIED="1574021714233" TEXT="Less space efficient for denser graphs"/>
<node CREATED="1574021715206" ID="ID_1102456696" MODIFIED="1574021721777" TEXT="Edge weight lookup is O(E)"/>
<node CREATED="1574021723007" ID="ID_913214227" MODIFIED="1574021731199" TEXT="Slightly more complex graph representation"/>
</node>
</node>
<node CREATED="1574021752048" ID="ID_879454412" MODIFIED="1574021754111" TEXT="Edge List">
<node CREATED="1574021754348" ID="ID_1641797928" MODIFIED="1574021835137" TEXT="An edge list is a way to represent a graph simply as an unordered list of edges. Assume the notation for any triplet (u, v ,w) means: &quot;the cost from node u to node is w&quot;">
<node CREATED="1574021850710" ID="ID_1477027391" MODIFIED="1574021877074" TEXT="[(C,A,4), (A,C,1), (B,C,6), (A,B,4), (C,B,1), (C,D,2)]"/>
</node>
<node CREATED="1574021882366" ID="ID_1918510075" MODIFIED="1574021913931" TEXT="This representation is seldomly used because of its lack of structure. However, it is conceptually simple and practical in a handful of algorithms"/>
<node CREATED="1574021990216" ID="ID_534554958" MODIFIED="1574021991327" TEXT="Pros">
<node CREATED="1574021994548" ID="ID_1213124694" MODIFIED="1574022006405" TEXT="Space efficient for representing sparse graphs"/>
<node CREATED="1574022006714" ID="ID_1864644914" MODIFIED="1574022014033" TEXT="Iterating over all edges is efficient"/>
<node CREATED="1574022015065" ID="ID_1735787385" MODIFIED="1574022018361" TEXT="Very simple structure"/>
</node>
<node CREATED="1574021991839" ID="ID_1218844874" MODIFIED="1574021993760" TEXT="Cons">
<node CREATED="1574022021041" ID="ID_1053784555" MODIFIED="1574022029121" TEXT="Less space efficient for denser graphs."/>
<node CREATED="1574022030017" ID="ID_106638854" MODIFIED="1574022036001" TEXT="Edge weight lookup is O(E)"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1573695432998" ID="ID_273323376" MODIFIED="1573695438710" POSITION="left" TEXT="2. Problems in Graph Theory">
<node CREATED="1574022090241" ID="ID_641331821" MODIFIED="1574022097956" TEXT="Common graph theory problems">
<node CREATED="1574022101122" ID="ID_962527425" MODIFIED="1574022114398" TEXT="Many problems can be reduced to these common problems"/>
<node CREATED="1574022124622" ID="ID_392851982" MODIFIED="1574022137150" TEXT="For the upcoming problems ask yourself:">
<node CREATED="1574022139013" ID="ID_703648456" MODIFIED="1574022146701" TEXT="Is the graph directed or undirected?"/>
<node CREATED="1574022147193" ID="ID_1351295664" MODIFIED="1574022153174" TEXT="Are the edges of the graph weighted?"/>
<node CREATED="1574022153406" ID="ID_1957554251" MODIFIED="1574022166560" TEXT="Is the graph I will encounter likely to be sparse or dense with edges?"/>
<node CREATED="1574022171783" ID="ID_1790808875" MODIFIED="1574022204089" TEXT="Should I use an adjacency matrix, adjacency list, an edge list or other structure ot represent the graph efficiently?"/>
</node>
<node CREATED="1574022217508" ID="ID_60877473" MODIFIED="1574022223127" TEXT="Shortest path problem">
<node CREATED="1574022225887" ID="ID_1645117808" MODIFIED="1574022240010" TEXT="Given a weighted graph, find the shortest path of edges from node A to node B"/>
<node CREATED="1574022252698" ID="ID_1102774473" MODIFIED="1574022284445" TEXT="Algorithms: BFS (unweighted graph), Dijkstra&apos;s, Bellman-Ford, Floud-Warshall, A*, and many more."/>
<node CREATED="1574022298244" ID="ID_1210540824" MODIFIED="1574022301677" TEXT="Example: Road system"/>
</node>
<node CREATED="1574022326687" ID="ID_1366218853" MODIFIED="1574022330182" TEXT="Connectivity">
<node CREATED="1574022332654" ID="ID_792370894" MODIFIED="1574022341933" TEXT="Does there exist a path between node A and node B?"/>
<node CREATED="1574022344534" ID="ID_1552482754" MODIFIED="1574022364480" TEXT="Typical solution: Use union find data structure or any search algorithm (e.g DFS)"/>
</node>
</node>
</node>
<node CREATED="1573695439413" ID="ID_1974938315" MODIFIED="1573695445742" POSITION="right" TEXT="3. Depth First Search Algorithm"/>
<node CREATED="1573695446821" ID="ID_194963675" MODIFIED="1573695454946" POSITION="left" TEXT="4. Breadth First Search Algorithm"/>
<node CREATED="1573695455765" ID="ID_35539480" MODIFIED="1573695468843" POSITION="right" TEXT="5. Breadth First Search Grid Shortest Path"/>
<node CREATED="1573695470588" ID="ID_981637395" MODIFIED="1573695481725" POSITION="left" TEXT="6. Dijkstra&apos;s Shortest Path Algorithm">
<node CREATED="1574202001438" ID="ID_1073521853" MODIFIED="1574202013182" TEXT="What is Dijkstra&apos;s algorithm?">
<node CREATED="1574202013485" ID="ID_428867860" MODIFIED="1574202038640" TEXT="Dijkstra&apos;s algorithm is a Single Source Shortest Path (SSSP) algorithm for graphs with non-negative edge weights."/>
<node CREATED="1574202041590" ID="ID_1068399905" MODIFIED="1574202074466" TEXT="Depending on how the algorithm is implemented and what data structures are used the time complexity is typically O(E*log(V)) which is competitive against other shortest path algorithms.">
<node CREATED="1574202095961" ID="ID_1135346152" MODIFIED="1574202099353" TEXT="Specify start node"/>
<node CREATED="1574202103168" ID="ID_713388275" MODIFIED="1574202113521" TEXT="Shortest paths to all other nodes"/>
</node>
</node>
<node CREATED="1574202129828" ID="ID_903422183" MODIFIED="1574202137251" TEXT="Algorithm prerequisites">
<node CREATED="1574202137712" ID="ID_1502250360" MODIFIED="1574202180428" TEXT="One constraint for Dijstra&apos;s algorithm is that the graph must only contain non-negative edge weights. This constraint is imposed to ensure that once a node has been visited its optimal distance cannot be improved."/>
<node CREATED="1574202183825" ID="ID_261564831" MODIFIED="1574202218333" TEXT="This property is especially important because it enables Dijkstra&apos;s algorithms to act in a greedy manner by always selecting the next most promising node."/>
</node>
<node CREATED="1574202251899" ID="ID_1001233433" MODIFIED="1574202254217" TEXT="Outline">
<node CREATED="1574202256802" ID="ID_1933994612" MODIFIED="1574202284896" TEXT="The goal of this slide deck is for you to understand how to implement DIjkstra&apos;s algorithm and implement it efficiently">
<node CREATED="1574202285896" ID="ID_341979423" MODIFIED="1574202292386" TEXT="Lazy Dijkstra&apos;s animation">
<node CREATED="1574202376962" ID="ID_1649240511" MODIFIED="1574202379050" TEXT="Most common"/>
</node>
<node CREATED="1574202293296" ID="ID_898621662" MODIFIED="1574202309697" TEXT="Lazy Dijkstra&apos;s pseudo-code"/>
<node CREATED="1574202310642" ID="ID_1112711517" MODIFIED="1574202319410" TEXT="Finding SP + stopping early optimization"/>
<node CREATED="1574202320434" ID="ID_1704455508" MODIFIED="1574202331874" TEXT="Using indexed priority and increase performance"/>
<node CREATED="1574202335266" ID="ID_46088274" MODIFIED="1574202342636" TEXT="Eager Dijkstra&apos;s animation">
<node CREATED="1574202382944" ID="ID_19804833" MODIFIED="1574202423212" TEXT="Uses indexed-priority queue">
<node CREATED="1574202413827" ID="ID_459633546" MODIFIED="1574202436019" TEXT="decrease Q operation"/>
</node>
</node>
<node CREATED="1574202343497" ID="ID_28138040" MODIFIED="1574202353453" TEXT="Eager Dijkstra&apos;s pseudo-code"/>
<node CREATED="1574202353827" ID="ID_1688490257" MODIFIED="1574202363572" TEXT="Heap optimization with D-ary heap">
<node CREATED="1574202445821" ID="ID_164158034" MODIFIED="1574202451294" TEXT="Further boost to performance"/>
</node>
</node>
</node>
<node CREATED="1574202454611" ID="ID_1422446751" MODIFIED="1574202461014" TEXT="Quick Algorithm Overview">
<node CREATED="1574202504271" ID="ID_74545419" MODIFIED="1574202681122" TEXT="Maintain a &apos;dist&apos; array where the distance to every node is positive infinity. Mark the distance to the start node &apos;s&apos; to be 0.&#xa;&#xa;Maintain a PQ of key-value pairs of (node index, distance) pairs which tell you which node to visit next based on sorted min value.&#xa;&#xa;Insert (s, 0) into the PQ and loop while PQ is not empty pulling out the next most promising (node index, distance) pair.&#xa;&#xa;Iterate over all edges outwards from the current node and relax each edge appending a new (node index, distance) key-value pair to the PQ for every relaxation.">
<node CREATED="1574203020849" ID="ID_1959459337" MODIFIED="1574203060071">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (index, dist)
    </p>
    <p>
      (0, 0)
    </p>
    <p>
      (1, 4)
    </p>
    <p>
      (2, 1)
    </p>
    <p>
      (1, 3)
    </p>
    <p>
      (3, 6)
    </p>
    <p>
      (3, 4)
    </p>
    <p>
      (4, 7)
    </p>
  </body>
</html></richcontent>
<node CREATED="1574203068228" ID="ID_624552329" MODIFIED="1574203083766" TEXT="dist: [0, 3, 1, 4, 7]"/>
<node CREATED="1574220433195" ID="ID_321734175" MODIFIED="1574220594575">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      0 -4-&gt;1 -1-&gt; 3 -3-&gt;4
    </p>
    <p>
      &#160;\&#160;&#160;&#160;^&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;^
    </p>
    <p>
      &#160;1&#160;&#160;&#160;2&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;/
    </p>
    <p>
      &#160;&#160;&#160;\ |&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;/
    </p>
    <p>
      &#160;&#160;&#160;&#160;2-5-----
    </p>
  </body>
</html></richcontent>
<node CREATED="1574222058760" ID="ID_1452448885" MODIFIED="1574222302945">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # Runs Dijkstra's algorithm and returns an array that contains
    </p>
    <p>
      # the shortest distance to every node from the start node s.
    </p>
    <p>
      # g - adjacency list of weighted graph
    </p>
    <p>
      # n - the number of nodes in the graph
    </p>
    <p>
      # s - the index of the starting node (0 &lt;= s &lt; n)
    </p>
    <p>
      function dijkstra(g, n, s):
    </p>
    <p>
      &#160;&#160;vis = [false, false, ..., false] # size n
    </p>
    <p>
      &#160;&#160;dist = [inf, inf, ..., inf, inf] # size n
    </p>
    <p>
      &#160;&#160;dist[s] = 0
    </p>
    <p>
      &#160;&#160;pq = empty priority queue
    </p>
    <p>
      &#160;&#160;pq.insert((s, 0))
    </p>
    <p>
      &#160;&#160;while pz.size() != 0:
    </p>
    <p>
      &#160;&#160;&#160;&#160;index, minValue = pq.poll()
    </p>
    <p>
      &#160;&#160;&#160;&#160;vis[index] = true
    </p>
    <p>
      &#160;&#160;&#160;&#160;for (edge : g[index]):
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;if vis[edge.to] : continue
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;newDist = dist[index] + edge.cost
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;if newDist &lt; dist[edge.to]:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;dist[edge.to] = newDist
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;pq.insert((edge.to, newDist))
    </p>
    <p>
      &#160;&#160;&#160;&#160;return dist
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1591118854272" ID="ID_131077759" MODIFIED="1591118864510" POSITION="left" TEXT="6.1. Introduction to Trees">
<node CREATED="1591119010533" ID="ID_1774129512" MODIFIED="1591119021080" TEXT="Definitions and storage representation">
<node CREATED="1591119023460" ID="ID_1789855975" MODIFIED="1591119027741" TEXT="What is a tree?">
<node CREATED="1591119044951" ID="ID_1850401848" MODIFIED="1591119053825" TEXT="A tree is an undirected graph with no cycles."/>
<node CREATED="1591119063760" ID="ID_76257827" MODIFIED="1591119078721" TEXT="Equivalently, a tree it is a connected graph with N nodes and N-1 edges"/>
</node>
</node>
<node CREATED="1591119089438" ID="ID_1584314376" MODIFIED="1591119092017" TEXT="Examples">
<node CREATED="1591119093342" ID="ID_1701038051" MODIFIED="1591119102121" TEXT="Filesystem structures are inherently trees"/>
<node CREATED="1591119103058" ID="ID_737120553" MODIFIED="1591119109698" TEXT="Social hierarchies"/>
<node CREATED="1591119117476" ID="ID_927950573" MODIFIED="1591119135825" TEXT="Abstract syntax trees to decompose source code and mathematical expressions for easy evaluation"/>
<node CREATED="1591119138712" ID="ID_1387623406" MODIFIED="1591119147341" TEXT="Every webpage is a tree as an HTML DOM structure"/>
<node CREATED="1591119149412" ID="ID_678744449" MODIFIED="1591119169193" TEXT="The decision outcomes in game theory are often modeled as trees for ease of representation"/>
<node CREATED="1591119174096" ID="ID_1620578485" MODIFIED="1591119178835" TEXT="Other applications">
<node CREATED="1591119179424" ID="ID_1275098408" MODIFIED="1591119182867" TEXT="Family trees"/>
<node CREATED="1591119183709" ID="ID_971802274" MODIFIED="1591119194939" TEXT="File parsting/HTML/JSON/Syntax trees"/>
<node CREATED="1591119196204" ID="ID_326687146" MODIFIED="1591119206028" TEXT="Many data structures use/are trees:">
<node CREATED="1591119206635" ID="ID_1651851854" MODIFIED="1591119236532" TEXT="AVL trees, B-tree, red-black trees, segment trees, fenwick trees, treaps, suffix trees, tree maps/sets, etc..."/>
</node>
<node CREATED="1591119237996" ID="ID_78053448" MODIFIED="1591119243570" TEXT="Game theory decision trees"/>
<node CREATED="1591119244260" ID="ID_1854913015" MODIFIED="1591119248132" TEXT="Organization structures"/>
<node CREATED="1591119248955" ID="ID_1603640349" MODIFIED="1591119252532" TEXT="Probability trees"/>
<node CREATED="1591119252902" ID="ID_1445229423" MODIFIED="1591119256759" TEXT="Taxonomies"/>
<node CREATED="1591119257534" ID="ID_1615860033" MODIFIED="1591119258412" TEXT="..."/>
</node>
</node>
<node CREATED="1591119294987" ID="ID_1969402793" MODIFIED="1591119300561" TEXT="Storing undirected trees">
<node CREATED="1591119301169" ID="ID_182686649" MODIFIED="1591119310739" TEXT="Start by labelling the tree nodes from [0 n)">
<node CREATED="1591119316592" ID="ID_1725889976" MODIFIED="1591119337822" TEXT="edge list storage representation: [(0, 1), (1, 4), ...]">
<node CREATED="1591119341805" ID="ID_1229041536" MODIFIED="1591119400653" TEXT="Pros: super fast and easy to iterate over, cheap to store"/>
<node CREATED="1591119404251" ID="ID_1400996602" MODIFIED="1591119446519" TEXT="Cons: storing a tree as a list lacks the structure to efficiently query all the neighbors of a nodee"/>
</node>
</node>
<node CREATED="1591119453824" ID="ID_1152927696" MODIFIED="1591119460018" TEXT="Adjacency list representation">
<node CREATED="1591119463565" ID="ID_1075413015" MODIFIED="1591119525362">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      0 -&gt; [1]
    </p>
    <p>
      1 -&gt; [0, 3, 4]
    </p>
    <p>
      2 -&gt; [3]
    </p>
    <p>
      3 -&gt; [1, 2, 6, 7]
    </p>
    <p>
      4 -&gt; [1, 5, 8]
    </p>
    <p>
      5 -&gt; [4]
    </p>
    <p>
      6 -&gt; [3, 9]
    </p>
    <p>
      7 -&gt; [3]
    </p>
    <p>
      8 -&gt; [4]
    </p>
    <p>
      9 -&gt; [6]
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1591119543430" ID="ID_999315505" MODIFIED="1591119551759" TEXT="Adjacency Matrix">
<node CREATED="1591119562233" ID="ID_440824386" MODIFIED="1591119592240" TEXT="In practice, avoid storing a tree as an adjacency matrix! It&apos;s a huge waste of space to use n^2 memory and only use 2(n - 1) of the matrix cells"/>
</node>
</node>
<node CREATED="1591119618946" ID="ID_1993574608" MODIFIED="1591119624122" TEXT="Rooted Trees!">
<node CREATED="1591119625469" ID="ID_1962514633" MODIFIED="1591119645331" TEXT="One of the more interesting types of trees is a rooted tree which is a tree with a designated root node">
<node CREATED="1591119646405" ID="ID_1282380769" MODIFIED="1591119649312" TEXT="Rooted tree">
<node CREATED="1591119674515" ID="ID_1773048532" MODIFIED="1591119689361" TEXT="Possible for edges to point towards root but rare"/>
</node>
</node>
<node CREATED="1591119887911" ID="ID_384953960" MODIFIED="1591119913202" TEXT="In practice, you always maintain a pointer reference to the root node so that you can access the tree and its contents">
<node CREATED="1591119928276" ID="ID_1320884854" MODIFIED="1591119941450" TEXT="Each node has access to a list of all its children"/>
</node>
<node CREATED="1591119956162" ID="ID_315410286" MODIFIED="1591119979675" TEXT="Sometimes it&apos;s also useful to maintain a pointer to a node&apos;s parent node effectively making edges bidirectional.">
<node CREATED="1591119990772" ID="ID_1446072480" MODIFIED="1591119994610" TEXT="To traverse upwards"/>
<node CREATED="1591120010784" ID="ID_1024269480" MODIFIED="1591120034790" TEXT="However, this isn&apos;t usually necessary because you can access a node&apos;s parent on a recursive functions callback">
<node CREATED="1591120054493" ID="ID_65448357" MODIFIED="1591120060201" TEXT="as we pop frames off the stack"/>
</node>
</node>
<node CREATED="1591120065985" ID="ID_1625925276" MODIFIED="1591120070389" TEXT="Storing rooted trees">
<node CREATED="1591120070812" ID="ID_1523536275" MODIFIED="1591120083817" TEXT="If your tree is a binary tree, you can store it in a flattened array">
<node CREATED="1591120093557" ID="ID_1938308463" MODIFIED="1591120147563" TEXT="9 8 7 6 5 1 2 / 2 3 4 / / 2 1">
<node CREATED="1591120154042" ID="ID_67170925" MODIFIED="1591120178372" TEXT="Value of node is stored in the array and an index is associated with each node"/>
<node CREATED="1591120204680" ID="ID_1569077391" MODIFIED="1591120225696" TEXT="In this flattened array representation, each node has an assigned index position based on where it is in the tree"/>
<node CREATED="1591120233272" ID="ID_1750516046" MODIFIED="1591120259600" TEXT="Even nodes which aren&apos;t currently present have an index because they can be mapped back to a unique position in the &quot;index tree&quot; (gray tree)"/>
<node CREATED="1591120279288" ID="ID_653124397" MODIFIED="1591120298464" TEXT="The root node is always at index 0 and the children of the current node i are accessed relative to position i">
<node CREATED="1591120302394" ID="ID_809450905" MODIFIED="1591120309804" TEXT="Let i be the index of the current node">
<node CREATED="1591120310622" ID="ID_529711437" MODIFIED="1591120317585" TEXT="left node: 2*i + 1"/>
<node CREATED="1591120318282" ID="ID_574294239" MODIFIED="1591120325607" TEXT="right node: 2*i + 2"/>
</node>
<node CREATED="1591120336231" ID="ID_697272267" MODIFIED="1591120350146" TEXT="Reciprocally, the parent of node i is: floor((i - 1)/2)"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1591119695520" ID="ID_162449792" MODIFIED="1591119700267" TEXT="Binary Tree (BT)">
<node CREATED="1591119703824" ID="ID_1153488989" MODIFIED="1591119723529" TEXT="Related to rooted trees are binary trees which are trees for which every node has at most two child nodes.">
<node CREATED="1591119755633" ID="ID_1464834733" MODIFIED="1591119765370" TEXT="Used for efficient operations"/>
</node>
<node CREATED="1591119770386" ID="ID_1521059671" MODIFIED="1591119778122" TEXT="Binary Search Trees (BST)">
<node CREATED="1591119782016" ID="ID_1279079472" MODIFIED="1591119819245" TEXT="Related to binary trees are binary search trees which are trees which satisfy the BST invariant which states that for every node x: x.left.value &lt;= x.value &lt;= x.right.value">
<node CREATED="1591119854996" ID="ID_1262184122" MODIFIED="1591119874221" TEXT="Unique values: x.left.value &lt; x.value &lt; x.right.value"/>
</node>
</node>
</node>
</node>
<node CREATED="1591118865991" ID="ID_1867038761" MODIFIED="1591118874460" POSITION="left" TEXT="6.2. Beginner tree algorithms">
<node CREATED="1591120515315" ID="ID_107907078" MODIFIED="1591120524088" TEXT="Problem 1: leaf node sum">
<node CREATED="1591120592561" ID="ID_1325092169" MODIFIED="1591120614891" TEXT="When dealing with rooted trees you begin with having a reference to the root node as a starting point for most algorithms">
<node CREATED="1591120663218" ID="ID_725080659" MODIFIED="1591120672971" TEXT="For rooted trees we can use DFS">
<node CREATED="1591120703729" ID="ID_1579069319" MODIFIED="1591120707807" TEXT="Algorithm">
<node CREATED="1591120708863" ID="ID_1223956598" MODIFIED="1591120814872">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # Sums up leaf node values in a tree.
    </p>
    <p>
      # Call function like: leafSum(root)
    </p>
    <p>
      function leafSum(node):
    </p>
    <p>
      &#160;&#160;&#160;&#160;# Handle empty tree case
    </p>
    <p>
      &#160;&#160;&#160;&#160;if node == null:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;return 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;if isLeaf(node):
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;return node.getValue()
    </p>
    <p>
      &#160;&#160;&#160;&#160;total = 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;for child in node.getChildNodes();
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;total += leafSum(child)
    </p>
    <p>
      &#160;&#160;&#160;&#160;return total
    </p>
    <p>
      
    </p>
    <p>
      function isLeaf(node):
    </p>
    <p>
      &#160;&#160;&#160;&#160;return node.getChildNodes().size() == 0
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1591120852963" ID="ID_1503960985" MODIFIED="1591120858845" TEXT="Problem 2: Tree Height">
<node CREATED="1591120859786" ID="ID_109350164" MODIFIED="1591120881957" TEXT="Find the height of a binary tree. The height of a tree is the number of edges from the root to the lowest leaf">
<node CREATED="1591667526401" ID="ID_1727269534" MODIFIED="1591667538350" TEXT="Let h(x) be the height of the subtree rooted at node x">
<node CREATED="1591667570004" ID="ID_116793590" MODIFIED="1591667575281" TEXT="h(a) = 3"/>
</node>
<node CREATED="1591667577400" ID="ID_398622863" MODIFIED="1591667619680" TEXT="By themselves, leaf nodes such as node e don&apos;t have children, so they don&apos;t add any additional height to the tree">
<node CREATED="1591667626698" ID="ID_1403985887" MODIFIED="1591667633864" TEXT="base case: h(leaf node) = 0"/>
</node>
<node CREATED="1591667654544" ID="ID_1693478240" MODIFIED="1591667697017" TEXT="Assume node x is not a leaf node, we&apos;re able to formulate a recurrence for the height: h(x) = max(h(x.left), h(x.right)) + 1"/>
<node CREATED="1591667810364" ID="ID_1103895738" MODIFIED="1591667903722">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # The height of a tree is the number of
    </p>
    <p>
      # edges from the root to the lowest leaf.
    </p>
    <p>
      function treeHeight(node):
    </p>
    <p>
      &#160;&#160;# Handle empty tree case
    </p>
    <p>
      &#160;&#160;if node == null:
    </p>
    <p>
      &#160;&#160;&#160;&#160;return -1
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;# Identify leaf nodes and return zero
    </p>
    <p>
      &#160;&#160;if node.left == null and node.right == null:<br />&#160;&#160;&#160;&#160;return 0
    </p>
    <p>
      &#160;
    </p>
    <p>
      &#160;&#160;return max(treeHeight(node.left), treeHeight(node.right)) + 1
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1591667971538" ID="ID_1113569893" MODIFIED="1591668025227">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # The height of a tree is the number of
    </p>
    <p>
      # edges from the root to the lowest leaf.
    </p>
    <p>
      function treeHeight(node):
    </p>
    <p>
      &#160;&#160;# Handle empty tree case
    </p>
    <p>
      &#160;&#160;if node == null:
    </p>
    <p>
      &#160;&#160;&#160;&#160;return -1
    </p>
    <p>
      &#160;
    </p>
    <p>
      &#160;&#160;return max(treeHeight(node.left), treeHeight(node.right)) + 1
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1591668072493" ID="ID_953923820" MODIFIED="1591668083789" TEXT="null nodes make tree taller by 1 unit"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1591118875523" ID="ID_1295837721" MODIFIED="1591118881812" POSITION="left" TEXT="6.3. Rooting a tree">
<node CREATED="1591668737413" ID="ID_1162012728" MODIFIED="1591668760465" TEXT="Sometimes it&apos;s useful to root an undirected tree to add structure to the problem you&apos;re trying to solve">
<node CREATED="1591668767386" ID="ID_1265358235" MODIFIED="1591668780043" TEXT="Example: Undirected graph - adjacency list:">
<node CREATED="1591668780715" ID="ID_1566795335" MODIFIED="1591668820686">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      0 -&gt; [2, 1, 5]
    </p>
    <p>
      1 -&gt; [0]
    </p>
    <p>
      2 -&gt; [3, 0]
    </p>
    <p>
      3 -&gt; [2]
    </p>
    <p>
      4 -&gt; [5]
    </p>
    <p>
      5 -&gt; [4, 6, 0]
    </p>
    <p>
      6 -&gt; [5]
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1591668839427" ID="ID_281521771" MODIFIED="1591668855667" TEXT="We can have directed edges instead of undirected edges"/>
<node CREATED="1591668944917" ID="ID_1770732135" MODIFIED="1591668951873" TEXT="Ensure well balanced tree"/>
<node CREATED="1591668956541" ID="ID_1895078593" MODIFIED="1591668968589" TEXT="In some situations it&apos;s also useful to keep have a reference to the parent node"/>
</node>
</node>
</node>
<node CREATED="1591669824991" ID="ID_23258873" MODIFIED="1591669837635" TEXT="Rooting a tree is easily done depth first">
<node CREATED="1591669855379" ID="ID_308839063" MODIFIED="1591669924925">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # TreeNode object structure.
    </p>
    <p>
      class TreeNode:
    </p>
    <p>
      &#160;&#160;# Unique integer id to identify this node.
    </p>
    <p>
      &#160;&#160;int id;
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;# Pointer to parent TreeNode reference. Only the
    </p>
    <p>
      &#160;&#160;# root node has a null parent TreeNode reference.
    </p>
    <p>
      &#160;&#160;TreeNode parent;
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;# List of pointers to child TreeNodes.
    </p>
    <p>
      &#160;&#160;TreeNode[] children;
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1591669971862" ID="ID_71560819" MODIFIED="1591670307307">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # g is the graph/tree represented as an adjacency
    </p>
    <p>
      # list with undirected edges. If there's an edge between
    </p>
    <p>
      # (u, v) there's also an edge between (v, u).
    </p>
    <p>
      # rootId is the id of the node to root the tree from.
    </p>
    <p>
      function rootTree(g, rootId = 0):
    </p>
    <p>
      &#160;&#160;root = TreeNode(rootId, null, [])
    </p>
    <p>
      &#160;&#160;return buildTree(g, root, null)
    </p>
    <p>
      
    </p>
    <p>
      # Build tree recursively depth first.
    </p>
    <p>
      function buildTree(g, node, parent):<br />&#160;&#160;for childId in g[node.id]:
    </p>
    <p>
      &#160;&#160;&#160;&#160;# Avoid adding an edge pointing back to the parent.
    </p>
    <p>
      &#160;&#160;&#160;&#160;if parent != null and childId == parent.id:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;continue
    </p>
    <p>
      &#160;&#160;&#160;&#160;child = TreeNode(childId, node, [])
    </p>
    <p>
      &#160;&#160;&#160;&#160;node.children.add(child)
    </p>
    <p>
      &#160;&#160;&#160;&#160;buildTree(g, child, node)
    </p>
    <p>
      &#160;&#160;return node<br />
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
<node CREATED="1591118882434" ID="ID_1900103747" MODIFIED="1591118888836" POSITION="left" TEXT="6.4. Finding tree center(s)">
<node CREATED="1591670466017" ID="ID_1228471589" MODIFIED="1591670471966" TEXT="Center(s) of undirected tree">
<node CREATED="1591670473643" ID="ID_1548643729" MODIFIED="1591670501587" TEXT="An interesting problem when you have an undirectd tree is finding the tree&apos;s center node(s). This could come in handy if we wanted to select a good node to root our tree"/>
<node CREATED="1591670641961" ID="ID_1806695114" MODIFIED="1591670658019" TEXT="Notice that the center is always the middle vertex or middle two vertices in every longest path along the tree"/>
<node CREATED="1591670688619" ID="ID_1809278916" MODIFIED="1591670708625" TEXT="Another approach to find the center is to interatively pick off each leaf node layer like we were peeling an onion">
<node CREATED="1591670727815" ID="ID_788409326" MODIFIED="1591670743357" TEXT="remove outer layers until we reach the center">
<node CREATED="1591670747204" ID="ID_1897560317" MODIFIED="1591670791302" TEXT="The orange circles represent the degree of each node. Observe that each leaf node will have a degree of 1">
<node CREATED="1591670819007" ID="ID_1225393624" MODIFIED="1591670875460" TEXT="As we prune nodes also reduce the node degree values. and update the degrees after pruning">
<node CREATED="1591670908061" ID="ID_1167690851" MODIFIED="1591672347910">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # g - tree represented as an undirected graph
    </p>
    <p>
      function treeCenters(g):
    </p>
    <p>
      &#160;&#160;n = g.numberOfNodes()
    </p>
    <p>
      &#160;&#160;degree = [0, 0, ..., 0] # size n
    </p>
    <p>
      &#160;&#160;leaves = []
    </p>
    <p>
      &#160;&#160;for (i = 0; i &lt; n; i++):
    </p>
    <p>
      &#160;&#160;&#160;&#160;degree[i] = g[i].size()
    </p>
    <p>
      &#160;&#160;&#160;&#160;if degree[i] == 0 or degree[i] == 1:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;leaves.add(i)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;degree[i] = 0
    </p>
    <p>
      &#160;&#160;count = leaves.size()
    </p>
    <p>
      &#160;&#160;while count &lt; n:
    </p>
    <p>
      &#160;&#160;&#160;&#160;new_leaves = []
    </p>
    <p>
      &#160;&#160;&#160;&#160;for (node : leaves):
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;for (neighbor : g[node]):<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160; degree[neighbor] = degree[neighbor] - 1
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;if degree[neighbor] == 1:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;new_leaves.add(neighbor)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;degree[node] = 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;count += new_leaves.size()
    </p>
    <p>
      &#160;&#160;&#160;&#160;leaves = new leaves
    </p>
    <p>
      &#160;&#160;return leaves # center(s)
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1591118889565" ID="ID_1669381314" MODIFIED="1591118898422" POSITION="left" TEXT="6.5. Identifying Isomorphic Trees">
<node CREATED="1591672653627" ID="ID_322669985" MODIFIED="1591672659215" TEXT="A question of equality"/>
<node CREATED="1591672662130" ID="ID_108712374" MODIFIED="1591672667942" TEXT="Graph isomorphism">
<node CREATED="1591672674727" ID="ID_1927672848" MODIFIED="1591672697742" TEXT="The question of asking whether two graphs G1 and G2 are isomorphic is asking whether they are structurally the same"/>
<node CREATED="1591672702897" ID="ID_1381316039" MODIFIED="1591672722171" TEXT="Even though G1 and G2 are labelled differently and may appear different they are structurally the same graph"/>
<node CREATED="1591672765904" ID="ID_1978622061" MODIFIED="1591672782842" TEXT="We can also define the notion of a graph isomorphism more rigorously:">
<node CREATED="1591672784954" ID="ID_5718401" MODIFIED="1591672837634" TEXT="G1(V1, E1) and G2(V2, E2) are isomorphic if there exists a bijection phi between the sets V1 -&gt; V2 such that: For all u, v in V1, (u, v) in E1 &lt;=&gt; (phi(u), phi(v)) in E2">
<node CREATED="1591672842640" ID="ID_1701332869" MODIFIED="1591672868561" TEXT="In simple terms, for an isomorphism to exist there needs to be a function phi which can map all the nodes/edges in G1 to G2 and vice-versa"/>
</node>
<node CREATED="1591673174494" ID="ID_1920099007" MODIFIED="1591673201502" TEXT="Determining if two graphs are isomorphic is not only not obvious to the human ey, but also a difficult problem for computers"/>
<node CREATED="1591673203284" ID="ID_463019782" MODIFIED="1591673234937" TEXT="It is still an open question as to whether the graph isomorphism problem is NP complete. However, many polynomial time isomorphism algorithms exist for graph subclasses such as trees">
<node CREATED="1591673276220" ID="ID_200538298" MODIFIED="1591673280028" TEXT="Isomorphic Trees"/>
<node CREATED="1591673395460" ID="ID_819277811" MODIFIED="1591673402025" TEXT="Identifying Isomorphic Trees"/>
</node>
</node>
</node>
</node>
<node CREATED="1591118907712" ID="ID_180265680" MODIFIED="1591118940490" POSITION="left" TEXT="6.6. Identifying Isomorphic Trees Source Code"/>
<node CREATED="1591118917677" ID="ID_1412600373" MODIFIED="1591118961386" POSITION="left" TEXT="6.7. Topological sort algorithm"/>
<node CREATED="1591118963218" ID="ID_1270187582" MODIFIED="1591118980202" POSITION="left" TEXT="6.8. Shortest/longest path on a Directed Acyclic Graph (DAG)"/>
<node CREATED="1573695488375" ID="ID_1462754315" MODIFIED="1573695507915" POSITION="right" TEXT="7. Dijkstra&apos;s Shortest Path Algorithm | Source Code"/>
<node CREATED="1573695509430" ID="ID_988963723" MODIFIED="1578431050242" POSITION="left" TEXT="8. Topological Sort Algorithm">
<node CREATED="1578429683039" ID="ID_1258968491" MODIFIED="1578429709330" TEXT="Many real world situations can be modelled as a graph with directed edges where some events must occur before others">
<node CREATED="1578429710866" ID="ID_42060496" MODIFIED="1578429719879" TEXT="School class prerequisites"/>
<node CREATED="1578429720123" ID="ID_47988740" MODIFIED="1578429725716" TEXT="Program dependencies"/>
<node CREATED="1578429726236" ID="ID_777107703" MODIFIED="1578429732060" TEXT="Event scheduling"/>
<node CREATED="1578429732292" ID="ID_322422765" MODIFIED="1578429737564" TEXT="Assembly instructions">
<node CREATED="1578429766719" ID="ID_306041567" MODIFIED="1578429768542" TEXT="Ordering"/>
</node>
<node CREATED="1578429737829" ID="ID_496892979" MODIFIED="1578429738940" TEXT="..."/>
</node>
<node CREATED="1578429771269" ID="ID_625191236" MODIFIED="1578429773485" TEXT="Example">
<node CREATED="1578429773757" ID="ID_72854892" MODIFIED="1578429837167" TEXT="Suppose you&apos;re a student at university X and you want ot take class H, then you must take classes A, B, D and E as prerequisites. In this sense there is an ordering on the nodes of the graph">
<node CREATED="1578429839799" ID="ID_601255374" MODIFIED="1578429884246" TEXT="Topsort algo can tell us the order in which we need to enroll in classes meeting prerequisites"/>
</node>
<node CREATED="1578429907431" ID="ID_1894757230" MODIFIED="1578429955281" TEXT="Another canonical example where an ordering on the nodes of the graph matters is for program build dependencies. A program cannot be built unless its dependencies are first built."/>
</node>
<node CREATED="1578430034504" ID="ID_410603240" MODIFIED="1578430066852" TEXT="A topological ordering is an ordering of the nodes in a directed graph where for each directed edge from node A to node B, node A appears before node B in the ordering.">
<node CREATED="1578430196392" ID="ID_542981325" MODIFIED="1578430215895" TEXT="Informally, we can line all the nodes in such a way that all edges point to the right"/>
</node>
<node CREATED="1578430088979" ID="ID_1853195438" MODIFIED="1578430104317" TEXT="The topological sort algorithm can find a topological ordering in O(V + E) time!"/>
<node CREATED="1578430105202" ID="ID_1733912006" MODIFIED="1578430114662" TEXT="NOTE: Topological orderings are not unique"/>
<node CREATED="1578430245263" ID="ID_1450250542" MODIFIED="1578430258136" TEXT="Directed Acyclic Graphs (DAG)">
<node CREATED="1578430261551" ID="ID_980441431" MODIFIED="1578430287833" TEXT="Not every graph can have a topological ordering. A graph which contains a cycle cannot have a valid ordering:"/>
<node CREATED="1578430326711" ID="ID_1103106341" MODIFIED="1578430349531" TEXT="The only type of graph which has a valid topological ordering is a DAG. These are graphs with directed edges and no cycles."/>
<node CREATED="1578430350418" ID="ID_124912035" MODIFIED="1578430368658" TEXT="Q: How do I verify that my graph does not contain a directed cycle?">
<node CREATED="1578430371403" ID="ID_1878487932" MODIFIED="1578430390003" TEXT="A: One method is to use Tarjan&apos;s strongly connected component algorithm which can be used to find these cycles."/>
</node>
<node CREATED="1578430368905" ID="ID_1819460658" MODIFIED="1578430433597" TEXT="By definition, all rooted trees have a topological ordering since they do not contain any cycless">
<node CREATED="1578430439445" ID="ID_226125541" MODIFIED="1578430480488" TEXT="Method to get topological ordering">
<node CREATED="1578430481069" ID="ID_1957300436" MODIFIED="1578430537397">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ol>
      <li>
        iteratively pick leaves from right to left
      </li>
      <li>
        When root is reached then stop
      </li>
    </ol>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1578430547309" ID="ID_1413639137" MODIFIED="1578430559359" TEXT="Method">
<node CREATED="1578430559741" ID="ID_1792889959" MODIFIED="1578430656211">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Pick an unvisited node
    </p>
    <p>
      
    </p>
    <p>
      Beginning with the selected node, do a Depth First Search (DFS) exploring only unvisited nodes.
    </p>
    <p>
      
    </p>
    <p>
      On the recursive callback of the DFS, add the current node to the topological ordering in reverse order.
    </p>
  </body>
</html></richcontent>
<node CREATED="1578430883642" ID="ID_893719677" MODIFIED="1578431007557" TEXT="Add node if we backtrack from it">
<node CREATED="1578431015817" ID="ID_7008035" MODIFIED="1578431023482" TEXT="CBEFKADGHIJLM"/>
</node>
</node>
</node>
</node>
<node CREATED="1578430258375" ID="ID_52644035" MODIFIED="1578431060398" TEXT="Topsort pseudocode">
<node CREATED="1578431063207" ID="ID_1311577550" MODIFIED="1578431210668">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # Assumption: graph is stored as adjacency list
    </p>
    <p>
      function topsort(graph):
    </p>
    <p>
      &#160;&#160;&#160;&#160;N = graph.numberOfNodes()
    </p>
    <p>
      &#160;&#160;&#160;&#160;V = [false, ..., false] # Length N
    </p>
    <p>
      &#160;&#160;&#160;&#160;ordering = [0,...,0]&#160;&#160;# Length N
    </p>
    <p>
      &#160;&#160;&#160;&#160;i = N - 1 # Index for ordering array
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;for (at = 0; at &lt; N; at++):
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;if V[at] == false:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;visitedNodes = []
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;dfs(at, V, visitedNodes, graph)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;for nodeId in visitedNodes:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;ordering[i] = nodeId
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;i = i - 1
    </p>
    <p>
      &#160;&#160;&#160;&#160;return ordering
    </p>
  </body>
</html></richcontent>
<node CREATED="1578431332996" ID="ID_1472840290" MODIFIED="1578431442528">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # Execute Depth First Search (DFS)
    </p>
    <p>
      function dfs(at, V, visitedNodes, graph):
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;V[at] = true
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;edges = graph.getEdgesOutFromNode(at)
    </p>
    <p>
      &#160;&#160;&#160;&#160;for edge in edges:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;if V[edge.to] == false:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;dfs(edge.to, V, visitedNodes, graph)
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;visitedNodes.add(at)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1578431499763" ID="ID_1951820161" MODIFIED="1578431508451" TEXT="Optimization">
<node CREATED="1578453250601" ID="ID_175289181" MODIFIED="1578453371173">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # Assumption: graph is stored as adjacency list
    </p>
    <p>
      function topsort(graph):
    </p>
    <p>
      &#160;&#160;&#160;
    </p>
    <p>
      &#160;&#160;&#160;&#160;N = graph.numberOfNodes()
    </p>
    <p>
      &#160;&#160;&#160;&#160;V = [false, ..., false]&#160;&#160;&#160;&#160;# Length N
    </p>
    <p>
      &#160;&#160;&#160;&#160;ordering = [0, ..., 0]&#160;&#160;&#160;# Length N
    </p>
    <p>
      &#160;&#160;&#160;&#160;i = N - 1&#160;&#160;&#160;# Index for ordering array
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;for (at = 0; at &lt; N; at++):
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;if V[at] == false:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;i = dfs(i, at, V, ordering, graph)
    </p>
    <p>
      &#160;
    </p>
    <p>
      &#160;&#160;&#160;&#160;return ordering
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1573695518527" ID="ID_1996042730" MODIFIED="1573695532822" POSITION="right" TEXT="9. Shortest/Longest Path on Directed Acyclic Graph (DAG)">
<node CREATED="1580779003981" ID="ID_371656419" MODIFIED="1580779029295" TEXT="Directed Acyclic Graph (DAG)">
<node CREATED="1580779030772" ID="ID_902354082" MODIFIED="1580779070265" TEXT="DAG is a graph with directed edges and no cycles. By definition this means all trees are automatically DAGs since they do not contain cycles.">
<node CREATED="1580779118215" ID="ID_499502059" MODIFIED="1580779124712" TEXT="Edges must be directed"/>
</node>
</node>
<node CREATED="1580779130910" ID="ID_617945022" MODIFIED="1580779134792" TEXT="SSSP on DAG">
<node CREATED="1580779135929" ID="ID_680666100" MODIFIED="1580779189720" TEXT="The Single Source Shortest Path (SSSP) problem can be solved efficiently on a DAG in O(V+E) time. This is due to the fact that the nodes can be ordered in a topological ordering via topsort and processed sequentially.">
<node CREATED="1580779267129" ID="ID_1629016761" MODIFIED="1580779271040" TEXT="Relaxing edges">
<node CREATED="1580779271216" ID="ID_853305731" MODIFIED="1580779274687" TEXT="Better values"/>
</node>
<node CREATED="1580779313561" ID="ID_1390356955" MODIFIED="1580779316120" TEXT="Example:">
<node CREATED="1580779317281" ID="ID_625577760" MODIFIED="1580779328780" TEXT="topsort: A, B, C, D, G, E, F, H">
<node CREATED="1580779332792" ID="ID_895709815" MODIFIED="1580779339664" TEXT="A - 0"/>
<node CREATED="1580779340512" ID="ID_1992210048" MODIFIED="1580779344424" TEXT="B - 3"/>
<node CREATED="1580779360094" ID="ID_620393437" MODIFIED="1580779362258" TEXT="C - 6"/>
<node CREATED="1580779377045" ID="ID_461366535" MODIFIED="1580779379809" TEXT="E - 14"/>
<node CREATED="1580779399003" ID="ID_191185766" MODIFIED="1580779400947" TEXT="D - 7"/>
<node CREATED="1580779415954" ID="ID_509278229" MODIFIED="1580779443852" TEXT="..."/>
</node>
</node>
</node>
</node>
<node CREATED="1580779511292" ID="ID_1366558161" MODIFIED="1580779516940" TEXT="Longest Path on DAG">
<node CREATED="1580779517257" ID="ID_902244700" MODIFIED="1580779546276" TEXT="What about the longest path? On a general graph this problem is NP-Hard, but on a DAG this problem is solvable in O(V+E)!">
<node CREATED="1580779565452" ID="ID_118689106" MODIFIED="1580779593445" TEXT="The trick is to multiply all edge values by -1 then find the shortest path and then multiply the edge values by -1 again!"/>
</node>
</node>
<node CREATED="1580779631252" ID="ID_1575184874" MODIFIED="1580779633933" TEXT="Source Code">
<node CREATED="1580779635296" ID="ID_531513948" MODIFIED="1580779648253" TEXT="Try"/>
</node>
</node>
<node CREATED="1573695533742" ID="ID_1398295416" MODIFIED="1573695541613" POSITION="left" TEXT="10. Bellman-Ford Algorithm">
<node CREATED="1580779730908" ID="ID_1392027441" MODIFIED="1580779767327" TEXT="In graph theory, the Bellman-Ford (BF) algorithm is a Single Source Shortest Path (SSSP) algorithm. This means it can find the shortest path from one node to any other node."/>
<node CREATED="1580779769584" ID="ID_239078602" MODIFIED="1580779823480" TEXT="However, BF is not ideal for most SSSP problems because it has a time complexity of O(EV) It is better to use Dijkstra&apos;s algorithm which is much faster. It is on the order of O((E+V)log(V)) when using a binary heap priority queue">
<node CREATED="1580779886454" ID="ID_620786156" MODIFIED="1580779941720" TEXT="However, Dijkstra&apos;s algorithm can fail when the graph has negative edge weights. This is when BF becomes really handy because it can be used to detect negative cycles and determine where they occur."/>
<node CREATED="1580779943247" ID="ID_1668586344" MODIFIED="1580779972530" TEXT="Finding negative cycles can be useful in many types of applications. One particularly neat application arises in finance when performing an arbitrage between two or more markets.">
<node CREATED="1580780013061" ID="ID_36526663" MODIFIED="1580780028418" TEXT="stock or currency"/>
</node>
<node CREATED="1580780046158" ID="ID_1134452445" MODIFIED="1580780050650" TEXT="Negative Cycles">
<node CREATED="1580780050923" ID="ID_962922063" MODIFIED="1580780062994" TEXT="Negative cycles can manifest themselves in many ways...">
<node CREATED="1580780167436" ID="ID_1763054225" MODIFIED="1580780174914" TEXT="Net change in a cycle can be negative"/>
</node>
</node>
</node>
<node CREATED="1580780201101" ID="ID_1110244610" MODIFIED="1580780207460" TEXT="BF Algorithm Steps">
<node CREATED="1580780208648" ID="ID_462001633" MODIFIED="1580780213342" TEXT="Let&apos;s define a few variables">
<node CREATED="1580780213547" ID="ID_310844545" MODIFIED="1580780219004" TEXT="Let E be the number of edges."/>
<node CREATED="1580780219252" ID="ID_1610539069" MODIFIED="1580780226571" TEXT="Let V be the number of vertices"/>
<node CREATED="1580780226795" ID="ID_761402269" MODIFIED="1580780234305" TEXT="Let S be the id of the starting node"/>
<node CREATED="1580780235150" ID="ID_1224821635" MODIFIED="1580780249893" TEXT="Let D be an array of size V that tracks the best distance from S to each node."/>
</node>
<node CREATED="1580780285921" ID="ID_1666248242" MODIFIED="1580780327439">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1) Set every entry in D to +infinity
    </p>
    <p>
      2) Set D[S] = 0
    </p>
    <p>
      3) Relax each edge V-1 times:
    </p>
  </body>
</html></richcontent>
<node CREATED="1580780363204" ID="ID_1142221885" MODIFIED="1580780429077">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      for (i = 0; i &lt; V-1; i = i + 1):
    </p>
    <p>
      &#160;&#160;&#160;&#160;for edge in graph.edges:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;// Relax edge (update D with shorter path)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;if (D[edge.from] + edge.cost &lt; D[edge.to])
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;D[edge.to] = D[edge.from] + edge.cost
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1573695542311" ID="ID_1791814029" MODIFIED="1573695557119" POSITION="right" TEXT="11. Floyd-Warshall All Pairs Shortest Path Algorithm"/>
<node CREATED="1573695558317" ID="ID_1923307945" MODIFIED="1573695575295" POSITION="left" TEXT="12. Floyd-Warshall All Pairs Shortest Path Algorithm | Source Code"/>
<node CREATED="1573695576252" ID="ID_1873645889" MODIFIED="1573695584557" POSITION="right" TEXT="13. Bridges &amp; Articulation Points"/>
<node CREATED="1573695585161" ID="ID_1740425975" MODIFIED="1573695676322" POSITION="left" TEXT="14. Bridges &amp; Articulation Points | Source Code"/>
<node CREATED="1573695598593" ID="ID_1715973873" MODIFIED="1573695687003" POSITION="right" TEXT="15. Tarjan&apos;s Strongly Connected Components Algorithms "/>
<node CREATED="1573695613281" ID="ID_1552302333" MODIFIED="1573695720987" POSITION="left" TEXT="16. Tarjan&apos;s Strongly Connected Components Algorithms| Source Code"/>
<node CREATED="1573695726937" ID="ID_1448151768" MODIFIED="1573695735694" POSITION="right" TEXT="17. Travelling Salesman Problem"/>
<node CREATED="1573695736501" ID="ID_1754498376" MODIFIED="1573695746852" POSITION="left" TEXT="18. Travelling Salesman Problem | Source Code"/>
<node CREATED="1573695747440" ID="ID_1537242303" MODIFIED="1573695758976" POSITION="right" TEXT="19. Existence of Eulerian Path and Circuit"/>
<node CREATED="1573695759700" ID="ID_522607463" MODIFIED="1573695767096" POSITION="left" TEXT="20. Eulerian Path Algorithm"/>
<node CREATED="1573695770657" ID="ID_1992345674" MODIFIED="1573695778606" POSITION="right" TEXT="21. Eulerian Path Source Code"/>
<node CREATED="1573695779326" ID="ID_1291553606" MODIFIED="1573695789991" POSITION="left" TEXT="22. Max Flow Ford Fulkerson | Network Flow"/>
<node CREATED="1573695790543" ID="ID_1184094292" MODIFIED="1573695800918" POSITION="right" TEXT="23. Max Flow Ford Fulkerson | Source Code"/>
<node CREATED="1573695801669" ID="ID_109413360" MODIFIED="1573695813839" POSITION="left" TEXT="24. Unweighted Bipartite Matching | Network Flow"/>
<node CREATED="1573695814584" ID="ID_1643689264" MODIFIED="1573695824179" POSITION="right" TEXT="25. Mice and Owls | Network Flow"/>
<node CREATED="1573695825049" ID="ID_991106264" MODIFIED="1573695834017" POSITION="left" TEXT="26. Elementary Math | Network Flow"/>
<node CREATED="1573695835146" ID="ID_1540209286" MODIFIED="1573695846472" POSITION="right" TEXT="27. Edmonds Karp | Network Flow"/>
<node CREATED="1573695847369" ID="ID_757480170" MODIFIED="1573695859224" POSITION="left" TEXT="28. Edmonds Karp | Network Flow | Source Code"/>
<node CREATED="1573695860090" ID="ID_677518640" MODIFIED="1573695868694" POSITION="right" TEXT="29. Capacity Scaling | Network Flow"/>
<node CREATED="1573695869456" ID="ID_1812346272" MODIFIED="1573695881529" POSITION="left" TEXT="30. Capacity Scaling | Network Flow | Source Code"/>
<node CREATED="1573695882196" ID="ID_1906045291" MODIFIED="1573695891368" POSITION="right" TEXT="31. Dinic&apos;s Algorithm | Network Flow"/>
<node CREATED="1573695892028" ID="ID_894090800" MODIFIED="1573695903249" POSITION="left" TEXT="32. Dinic&apos;s Algorithm | Network Flow | Source Code"/>
</node>
</map>
