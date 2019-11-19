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
</html>
</richcontent>
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
<node CREATED="1574202353827" ID="ID_1688490257" MODIFIED="1574202363572" TEXT="Heap optimization with D-ary heap"/>
</node>
</node>
</node>
<node CREATED="1573695488375" ID="ID_1462754315" MODIFIED="1573695507915" POSITION="right" TEXT="7. Dijkstra&apos;s Shortest Path Algorithm | Source Code"/>
<node CREATED="1573695509430" ID="ID_988963723" MODIFIED="1573695517720" POSITION="left" TEXT="8. Topological Sort Algorithm"/>
<node CREATED="1573695518527" ID="ID_1996042730" MODIFIED="1573695532822" POSITION="right" TEXT="9. Shortest/Longest Path on Directed Acyclic Graph (DAG)"/>
<node CREATED="1573695533742" ID="ID_1398295416" MODIFIED="1573695541613" POSITION="left" TEXT="10. Bellman-Ford Algorithm"/>
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
