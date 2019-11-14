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
<node CREATED="1573707520987" ID="ID_1465223152" MODIFIED="1573707533066" TEXT="Several efficient algorithms exist to operate on DAGs"/>
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
</node>
</node>
</node>
<node CREATED="1573695432998" ID="ID_273323376" MODIFIED="1573695438710" POSITION="left" TEXT="2. Problems in Graph Theory"/>
<node CREATED="1573695439413" ID="ID_1974938315" MODIFIED="1573695445742" POSITION="right" TEXT="3. Depth First Search Algorithm"/>
<node CREATED="1573695446821" ID="ID_194963675" MODIFIED="1573695454946" POSITION="left" TEXT="4. Breadth First Search Algorithm"/>
<node CREATED="1573695455765" ID="ID_35539480" MODIFIED="1573695468843" POSITION="right" TEXT="5. Breadth First Search Grid Shortest Path"/>
<node CREATED="1573695470588" ID="ID_981637395" MODIFIED="1573695481725" POSITION="left" TEXT="6. Dijkstra&apos;s Shortest Path Algorithm"/>
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
