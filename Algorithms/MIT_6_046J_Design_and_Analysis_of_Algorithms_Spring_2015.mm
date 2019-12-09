<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1575128420571" ID="ID_176961956" MODIFIED="1575128442923" TEXT="MIT 6.046J Design and Analysis of Algorithms, Spring 2015">
<node CREATED="1575128450464" ID="ID_1659611006" MODIFIED="1575128461783" POSITION="right" TEXT="1. Course Overview, Interval Scheduling">
<node CREATED="1575224724739" ID="ID_1231120085" MODIFIED="1575224732211" TEXT="Topics of Class">
<node CREATED="1575224448639" ID="ID_991795752" MODIFIED="1575224454782" TEXT="Divide and Conquer">
<node CREATED="1575224455394" ID="ID_1758407072" MODIFIED="1575224457931" TEXT="Merge Sort"/>
</node>
<node CREATED="1575224480493" ID="ID_1834222873" MODIFIED="1575224483505" TEXT="Optimization">
<node CREATED="1575224483833" ID="ID_512307952" MODIFIED="1575224491785" TEXT="Greedy algorithm">
<node CREATED="1575224496321" ID="ID_1631881113" MODIFIED="1575224502377" TEXT="Dijkstra&apos;s"/>
</node>
<node CREATED="1575224492086" ID="ID_1499940342" MODIFIED="1575224495554" TEXT="Dynamic programming"/>
</node>
<node CREATED="1575224517181" ID="ID_232800209" MODIFIED="1575224521131" TEXT="Network Flow">
<node CREATED="1575224548000" ID="ID_309528596" MODIFIED="1575224557059" TEXT="Pushing as much commodity as possible"/>
</node>
<node CREATED="1575224559971" ID="ID_1038997736" MODIFIED="1575224566563" TEXT="Intractability">
<node CREATED="1575224595621" ID="ID_1754892193" MODIFIED="1575224601183" TEXT="Theoretical">
<node CREATED="1575224601538" ID="ID_1171709439" MODIFIED="1575224612832" TEXT="Polynomial time is tractible"/>
<node CREATED="1575224622789" ID="ID_347125708" MODIFIED="1575224628829" TEXT="Exp are intractible">
<node CREATED="1575224631315" ID="ID_1594694498" MODIFIED="1575224633365" TEXT="Solution">
<node CREATED="1575224633645" ID="ID_35075968" MODIFIED="1575224636460" TEXT="Approximation">
<node CREATED="1575224641301" ID="ID_997630518" MODIFIED="1575224678382" TEXT="Within certain fraction of  optimal guaranteed and runs in polynomial time"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575224687335" ID="ID_849110134" MODIFIED="1575224694024" TEXT="Advanced topics">
<node CREATED="1575224694289" ID="ID_120489108" MODIFIED="1575224697560" TEXT="Distributed algorithms"/>
<node CREATED="1575224697958" ID="ID_1045842892" MODIFIED="1575224701336" TEXT="Cryptography">
<node CREATED="1575224702308" ID="ID_1488365727" MODIFIED="1575224705786" TEXT="Number theory algos"/>
</node>
</node>
</node>
<node CREATED="1575224752924" ID="ID_1301852270" MODIFIED="1575224758637" TEXT="Theme of today&apos;s lecture">
<node CREATED="1575224784516" ID="ID_121182280" MODIFIED="1575224798662" TEXT="Small changes in problem statements can end up with different situations"/>
<node CREATED="1575224852886" ID="ID_1275936501" MODIFIED="1575224864368" TEXT="P - class of problems solvable in polynomial time">
<node CREATED="1575224865657" ID="ID_1508684171" MODIFIED="1575224873361" TEXT="O(n^k) for some constant k">
<node CREATED="1575224898067" ID="ID_584232075" MODIFIED="1575224905495" TEXT="Shortest path: O(v^2)"/>
</node>
</node>
<node CREATED="1575224912562" ID="ID_695205058" MODIFIED="1575224929120" TEXT="NP - class of problems verifiable in polynomial time">
<node CREATED="1575224937407" ID="ID_1326686711" MODIFIED="1575224952560" TEXT="Hamiltonian cycle">
<node CREATED="1575224953119" ID="ID_1549968170" MODIFIED="1575387729756" TEXT="Given  adirected graph, find a single cycle (cannot repeat vertices)"/>
</node>
</node>
<node CREATED="1575387811525" ID="ID_788475824" MODIFIED="1575387816032" TEXT="NP-complete">
<node CREATED="1575387819041" ID="ID_1385823318" MODIFIED="1575387826766" TEXT="Hardest problems in NP">
<node CREATED="1575387829726" ID="ID_1806344921" MODIFIED="1575387835945" TEXT="Hamiltonian cycle is one of them"/>
<node CREATED="1575387846821" ID="ID_862454709" MODIFIED="1575387868202" TEXT="If we can solve one NP-Complete problem then we can solve all NP problems in polynomial time"/>
</node>
<node CREATED="1575387887305" ID="ID_554832427" MODIFIED="1575387900286" TEXT="Problem is in NP and is as hard as any problem in NP"/>
<node CREATED="1575387912325" ID="ID_1453621925" MODIFIED="1575387913572" TEXT="Others">
<node CREATED="1575387913821" ID="ID_499072336" MODIFIED="1575387916118" TEXT="SAT"/>
</node>
</node>
<node CREATED="1575389454491" ID="ID_237380627" MODIFIED="1575389471887" TEXT="P - small change -&gt; P (complex) - small change -&gt; NP complete">
<node CREATED="1575389479655" ID="ID_1961765854" MODIFIED="1575389486974" TEXT="We need to understand where the problems reside"/>
<node CREATED="1575389490183" ID="ID_208820172" MODIFIED="1575389494583" TEXT="Reductions">
<node CREATED="1575389502876" ID="ID_597830992" MODIFIED="1575389514604" TEXT="An existing hard problem can be translated to my problem"/>
</node>
</node>
</node>
<node CREATED="1575389615814" ID="ID_789000312" MODIFIED="1575389621182" TEXT="Interval scheduling problem">
<node CREATED="1575389637111" ID="ID_819604653" MODIFIED="1575389641945" TEXT="Resources &amp; requests">
<node CREATED="1575389642496" ID="ID_222583249" MODIFIED="1575389649088" TEXT="Single resource"/>
<node CREATED="1575389650176" ID="ID_1263332114" MODIFIED="1575389654563" TEXT="Requests 1,...,n">
<node CREATED="1575389657841" ID="ID_1414291937" MODIFIED="1575389667795" TEXT="Require time on each resource"/>
<node CREATED="1575389674474" ID="ID_795556395" MODIFIED="1575389718211" TEXT="s(i) - start time of ith request"/>
<node CREATED="1575389687481" ID="ID_930725158" MODIFIED="1575389697504" TEXT="f(i) - finish time of ith request">
<node CREATED="1575389700234" ID="ID_429945306" MODIFIED="1575389710675" TEXT="s(i) &lt; f(i)"/>
</node>
</node>
<node CREATED="1575389727814" ID="ID_1374746922" MODIFIED="1575389751820" TEXT="Two requests i &amp; j are compatible provided they don&apos;t overlap">
<node CREATED="1575389755769" ID="ID_203877337" MODIFIED="1575389778172" TEXT="f(i) &lt;= s(j) or f(j) &lt;= s(i)"/>
</node>
</node>
<node CREATED="1575389856967" ID="ID_1464903476" MODIFIED="1575389864715" TEXT="Optimization problem">
<node CREATED="1575389911058" ID="ID_290948051" MODIFIED="1575389936555" TEXT="Select compatible subset of requests/intervals that is of max size">
<node CREATED="1575389941804" ID="ID_1556308031" MODIFIED="1575389947778" TEXT="Do it efficiently"/>
</node>
</node>
<node CREATED="1575390005437" ID="ID_1176869" MODIFIED="1575390007845" TEXT="Solution">
<node CREATED="1575390008197" ID="ID_771473264" MODIFIED="1575390017401" TEXT="Possible greedy heuristics">
<node CREATED="1575390017767" ID="ID_1401333174" MODIFIED="1575390026136" TEXT="Smallest request">
<node CREATED="1575390105381" ID="ID_938691298" MODIFIED="1575390110132" TEXT="Collect as many as possible"/>
</node>
</node>
</node>
<node CREATED="1575390031624" ID="ID_1151648501" MODIFIED="1575390040690" TEXT="Claim: We can solve this problem using a greedy algorithm">
<node CREATED="1575390043032" ID="ID_1454628512" MODIFIED="1575390045473" TEXT="What is it?">
<node CREATED="1575390050391" ID="ID_510311805" MODIFIED="1575390053812" TEXT="Myopic">
<node CREATED="1575390054342" ID="ID_1769755052" MODIFIED="1575390080476" TEXT="Looks to maximize the very first thing that you can maximize"/>
</node>
<node CREATED="1575390130857" ID="ID_799067557" MODIFIED="1575390168786" TEXT="A greedy algorithm is myopic algorithm that processes the input one piece at a time with no apparent look ahead">
<node CREATED="1575390199948" ID="ID_1496954673" MODIFIED="1575390209701" TEXT="Look at a small part of problem instance">
<node CREATED="1575390210314" ID="ID_1004676273" MODIFIED="1575390218187" TEXT="Solve the part"/>
<node CREATED="1575390218451" ID="ID_1682541453" MODIFIED="1575390226906" TEXT="Rest of the problem has got simplified"/>
</node>
</node>
</node>
</node>
<node CREATED="1575390257187" ID="ID_911537708" MODIFIED="1575390263184" TEXT="Greedy Interval Scheduling">
<node CREATED="1575390264062" ID="ID_1447433673" MODIFIED="1575390350101">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ol>
      <li>
        Use a simple rule to select a request i
      </li>
      <li>
        Reject all requests incompatible with i
      </li>
      <li>
        Repeat until all requests are processed
      </li>
    </ol>
  </body>
</html>
</richcontent>
<node CREATED="1575390362744" ID="ID_657277644" MODIFIED="1575390366601" TEXT="What is the rule?">
<node CREATED="1575390506024" ID="ID_705985426" MODIFIED="1575390512758" TEXT="lowest to highest"/>
<node CREATED="1575390513099" ID="ID_1459625008" MODIFIED="1575390515375" TEXT="shortest time">
<node CREATED="1575390599521" ID="ID_1219285694" MODIFIED="1575390603198" TEXT="doesn&apos;t work"/>
</node>
<node CREATED="1575390516534" ID="ID_540051124" MODIFIED="1575390520590" TEXT="earliest finish time">
<node CREATED="1575391035635" ID="ID_971455235" MODIFIED="1575391042735" TEXT="correct and works in every case"/>
<node CREATED="1575393136094" ID="ID_1743328034" MODIFIED="1575393137598" TEXT="Proof">
<node CREATED="1575393137891" ID="ID_1108329722" MODIFIED="1575393222575" TEXT="Claim: Given a list of intervals L, greedy algorithm with earliest finish time produces k* internals, where k* is maximum">
<node CREATED="1575393235884" ID="ID_77859393" MODIFIED="1575393239791" TEXT="Proof by induction">
<node CREATED="1575393242936" ID="ID_735702280" MODIFIED="1575393247369" TEXT="Induction on k*"/>
<node CREATED="1575393250161" ID="ID_40581595" MODIFIED="1575393256953" TEXT="Base case: k* = 1">
<node CREATED="1575393258535" ID="ID_1750418144" MODIFIED="1575393296984" TEXT="Any interval works">
<node CREATED="1575393298509" ID="ID_300853133" MODIFIED="1575393306190" TEXT="all intervals overlap"/>
</node>
<node CREATED="1575393308432" ID="ID_1161674721" MODIFIED="1575393315839" TEXT="Optimal schedule has cardinality 1"/>
</node>
<node CREATED="1575393361670" ID="ID_935710418" MODIFIED="1575393389426" TEXT="Suppose claim holds for k* and we are given a list of intervals whose optimal scheudle has k* + 1 intervals">
<node CREATED="1575415690823" ID="ID_769769732" MODIFIED="1575415774667" TEXT="S*[1,2,...k*+1] = &lt;S(j1),f(j1),...&lt;S(jk*+1),f(jk*+1)&gt;"/>
</node>
<node CREATED="1575415875160" ID="ID_1608732809" MODIFIED="1575415943291" TEXT="S[1,...,k] = &lt;s(i1),f(i1)&gt;,...,&lt;s(ik),f(ik)&gt;">
<node CREATED="1575415983582" ID="ID_975441690" MODIFIED="1575415991854" TEXT="k,k* are not comparable"/>
<node CREATED="1575416011973" ID="ID_776719521" MODIFIED="1575416018649" TEXT="f(i1) &lt;= f(j1)">
<node CREATED="1575416060439" ID="ID_1620685657" MODIFIED="1575416113847" TEXT="S**=&lt;s(i1),f(i1)&gt;,&lt;s(j2),f(j2)&gt;....&lt;s(jk*+1),f(jk*+1)&gt;"/>
<node CREATED="1575416204264" ID="ID_353943617" MODIFIED="1575416224679" TEXT="Define L&apos; = set of intervals s(i) &gt;= f(i1)">
<node CREATED="1575416297463" ID="ID_99597412" MODIFIED="1575416330339" TEXT="Since S** is optimal for L then S**[2,...,k*+1] is an optimal for L&apos;">
<node CREATED="1575416387315" ID="ID_105322535" MODIFIED="1575416431819" TEXT="If I can substitute the rest of them with some other intervals, then S* would shrink which is a contradition"/>
<node CREATED="1575416530389" ID="ID_1649041650" MODIFIED="1575416543137" TEXT="Therefore optimal schedule for L&apos; has k* size">
<node CREATED="1575416544342" ID="ID_92267672" MODIFIED="1575416734037">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      By inductive hypothesis, run the greedy algorithm on L' should produce a schedule of size k*
    </p>
    <p>
      By construction, greedy on L' gives S[2,...,k] of size k - 1
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1575416819333" ID="ID_1218634722" MODIFIED="1575416837365" TEXT="k - 1 = k* and therefor k = k* + 1"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575390611167" ID="ID_1971234737" MODIFIED="1575390627517" TEXT="find the number of incompatible requests for each request">
<node CREATED="1575390654501" ID="ID_1752597267" MODIFIED="1575390664882" TEXT="Select the one with min incompatible requests">
<node CREATED="1575390999460" ID="ID_1276108051" MODIFIED="1575391007412" TEXT="does not work"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575416934827" ID="ID_395173397" MODIFIED="1575416941990" TEXT="Weighted interval scheduling">
<node CREATED="1575416942389" ID="ID_1249724645" MODIFIED="1575416959832" TEXT="Each request has weight w(i), shedule subset of requests with max weight"/>
<node CREATED="1575418092815" ID="ID_1911749708" MODIFIED="1575418096593" TEXT="Dynamic programming">
<node CREATED="1575418097028" ID="ID_315602978" MODIFIED="1575418118670" TEXT="R^x = {reques j belongs to R | S(j) &gt;= x}">
<node CREATED="1575418130071" ID="ID_1312837687" MODIFIED="1575418134448" TEXT="x = f(i)">
<node CREATED="1575418138055" ID="ID_13485270" MODIFIED="1575418157766" TEXT="All the requests that come after finish of ith request are in R^x">
<node CREATED="1575418181832" ID="ID_1209966204" MODIFIED="1575418190196" TEXT="Not all of them are compatible with ith request"/>
<node CREATED="1575418268787" ID="ID_482427105" MODIFIED="1575418279458" TEXT="n: number of requests">
<node CREATED="1575418279739" ID="ID_942495972" MODIFIED="1575418284025" TEXT="#subproblems = n"/>
<node CREATED="1575418305657" ID="ID_1675491271" MODIFIED="1575418315780" TEXT="Solve each subproblem once &amp; memoize"/>
<node CREATED="1575418318068" ID="ID_586808682" MODIFIED="1575418335331" TEXT="#subproblems * time to solve each subproblem (assumes O(1) for lookups)">
<node CREATED="1575418341179" ID="ID_1352666962" MODIFIED="1575418348909" TEXT="Recursion is O(1)"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575418401420" ID="ID_1137425746" MODIFIED="1575418405837" TEXT="DP guessing">
<node CREATED="1575418409197" ID="ID_737497500" MODIFIED="1575418418965" TEXT="Try each request i as a possible FIRST request"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575128462725" ID="ID_700048212" MODIFIED="1575128475792" POSITION="left" TEXT="2. Divide &amp; Conquer: Convex Hull, Median Finding"/>
<node CREATED="1575128476501" ID="ID_1636109882" MODIFIED="1575128485937" POSITION="right" TEXT="3. Divide &amp; Conquer: FFT">
<node CREATED="1575856285542" ID="ID_1440740367" MODIFIED="1575856308870" TEXT="Topics">
<node CREATED="1575856309237" ID="ID_916892701" MODIFIED="1575856315516" TEXT="Fast Forier Transform"/>
<node CREATED="1575856315759" ID="ID_414832134" MODIFIED="1575856329685" TEXT="Polynomial operations vs representations"/>
<node CREATED="1575856330003" ID="ID_1880763490" MODIFIED="1575856344725" TEXT="Divide &amp; conquer algorithm"/>
<node CREATED="1575856346901" ID="ID_498257770" MODIFIED="1575856356972" TEXT="Collapsing samples/roots of unity"/>
<node CREATED="1575856357971" ID="ID_1169711212" MODIFIED="1575856375895" TEXT="FFT, IFFT &amp; polynomial multiplication"/>
<node CREATED="1575857607078" ID="ID_430172281" MODIFIED="1575857657845" TEXT="Polynomial: A(x) = ao + a1x + a2x^2 + ... + an-1x^n-1">
<node CREATED="1575857640002" ID="ID_388687766" MODIFIED="1575857651491" TEXT="sigma akx^k"/>
<node CREATED="1575857661718" ID="ID_1614313120" MODIFIED="1575857672491" TEXT="&lt;a0, a1, ..., an-1&gt;">
<node CREATED="1575857702296" ID="ID_621074530" MODIFIED="1575857705850" TEXT="Sampling audio"/>
</node>
<node CREATED="1575857713057" ID="ID_1868689669" MODIFIED="1575857718481" TEXT="Operations on polynomials">
<node CREATED="1575857719502" ID="ID_1578389540" MODIFIED="1575857727643" TEXT="Evaluations">
<node CREATED="1575857728733" ID="ID_1207284542" MODIFIED="1575857737856" TEXT="A(x) &amp; x0 -&gt; A(x0)">
<node CREATED="1575857816560" ID="ID_1680421691" MODIFIED="1575857837080" TEXT="Horner&apos;s Rule:">
<node CREATED="1575857839519" ID="ID_125491706" MODIFIED="1575857858512" TEXT="A(x) = a0 + x(a1 + x(a2 + ... + x(an-1))...)">
<node CREATED="1575857869709" ID="ID_384203675" MODIFIED="1575857880828" TEXT="O(n) - additions and multiplication"/>
</node>
</node>
</node>
</node>
<node CREATED="1575857912976" ID="ID_1423162113" MODIFIED="1575857934232" TEXT="Addition: A(x) &amp; B(x) -&gt; C(x) = A(x) + B(x) for all x">
<node CREATED="1575857955346" ID="ID_23253454" MODIFIED="1575857958883" TEXT="ck = ak = bk">
<node CREATED="1575857959793" ID="ID_1848850670" MODIFIED="1575857962706" TEXT="O(n)"/>
</node>
</node>
<node CREATED="1575857966625" ID="ID_1596801369" MODIFIED="1575857991012" TEXT="Multiplication: A(x), B(x) -&gt; C(x) = A(x) * B(x)">
<node CREATED="1575858007714" ID="ID_1237917160" MODIFIED="1575858009568" TEXT="How?">
<node CREATED="1575858009827" ID="ID_540250736" MODIFIED="1575858035305" TEXT="(a0 + a1x + a2x + ....) * (b1 + b2x + b3x^2 + ...)">
<node CREATED="1575858037434" ID="ID_1704621928" MODIFIED="1575858099274" TEXT="a0.b0 + (a1.b0 + a0.b1)x + (a2.b0 + a1.b1 + a0.b2)x^2 + ...">
<node CREATED="1575858099969" ID="ID_1093756426" MODIFIED="1575858122856" TEXT="ck = sigma aj.bk-j">
<node CREATED="1575858123080" ID="ID_1744675655" MODIFIED="1575858125655" TEXT="O(n^2)">
<node CREATED="1575858128290" ID="ID_444107709" MODIFIED="1575858129249" TEXT="Bad"/>
</node>
<node CREATED="1575858145422" ID="ID_361261101" MODIFIED="1575858148920" TEXT="Better algorithm">
<node CREATED="1575858149137" ID="ID_851777518" MODIFIED="1575858158985" TEXT="O(n log n)"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575858174916" ID="ID_887256627" MODIFIED="1575858180527" TEXT="Why multiplication?">
<node CREATED="1575858180727" ID="ID_1947599628" MODIFIED="1575858249138" TEXT="Convolution of vectors A &amp; reverse (B)">
<node CREATED="1575858200727" ID="ID_1665681898" MODIFIED="1575858207858" TEXT="Used in image processing and editing">
<node CREATED="1575858289159" ID="ID_548323258" MODIFIED="1575858312855" TEXT="Apply dot product of gaussian function and the sound waves">
<node CREATED="1575858320322" ID="ID_108091876" MODIFIED="1575858327325" TEXT="Smoothing to remove noise"/>
<node CREATED="1575858350205" ID="ID_346173977" MODIFIED="1575858380398" TEXT="One vector is shifted and a dot product is taken with other vectors"/>
<node CREATED="1575858390724" ID="ID_1508380981" MODIFIED="1575858390724" TEXT=""/>
</node>
</node>
<node CREATED="1575858536542" ID="ID_1307437753" MODIFIED="1575858541843" TEXT="reverse (B)">
<node CREATED="1575858542106" ID="ID_1643236813" MODIFIED="1575858549900" TEXT="bk-j -&gt; bk+j"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575128487017" ID="ID_909750081" MODIFIED="1575128504163" POSITION="left" TEXT="4. Divide &amp; Conquer: van Emde Boas Trees"/>
<node CREATED="1575128505011" ID="ID_1585701604" MODIFIED="1575128514741" POSITION="right" TEXT="5. Amortization: Amortized Analysis"/>
<node CREATED="1575128515795" ID="ID_1184758006" MODIFIED="1575128527826" POSITION="left" TEXT="6. Randomization: Matrix Multiply, Quicksort"/>
<node CREATED="1575128529126" ID="ID_1679522484" MODIFIED="1575128540630" POSITION="right" TEXT="7. Randomization: Skip Lists"/>
<node CREATED="1575128541314" ID="ID_1002558514" MODIFIED="1575128556030" POSITION="left" TEXT="8. Randomization: Universal &amp; Perfect Hashing"/>
<node CREATED="1575128556609" ID="ID_437743897" MODIFIED="1575128565026" POSITION="right" TEXT="9. Augmentation: Range Trees"/>
<node CREATED="1575128565722" ID="ID_505078054" MODIFIED="1575128574949" POSITION="left" TEXT="10. Dynamic Programming: Advanced DP"/>
<node CREATED="1575128578747" ID="ID_824053924" MODIFIED="1575128595130" POSITION="right" TEXT="11. Dynamic Programming: All-Pairs Sortest Paths"/>
<node CREATED="1575128597572" ID="ID_309855821" MODIFIED="1575128610219" POSITION="left" TEXT="12. Greedy Algorithms: Minimum Spanning Tree"/>
<node CREATED="1575128610931" ID="ID_584218558" MODIFIED="1575128623220" POSITION="right" TEXT="13. Incremental Improvement: Max Flow, Min Cut"/>
<node CREATED="1575128623972" ID="ID_727944462" MODIFIED="1575128633538" POSITION="left" TEXT="14. Incremental Improvement: Matching"/>
<node CREATED="1575128634518" ID="ID_1238648892" MODIFIED="1575128646202" POSITION="right" TEXT="15. Linear Programming: LP, reductions, Simplex"/>
<node CREATED="1575128647035" ID="ID_1204642290" MODIFIED="1575128670999" POSITION="left" TEXT="16. Complexity: P, NP, NP-Completeness, Reductions"/>
<node CREATED="1575128675493" ID="ID_1396131334" MODIFIED="1575128685090" POSITION="right" TEXT="17. Complexity: Approximation Algorithms"/>
<node CREATED="1575128685812" ID="ID_126710843" MODIFIED="1575128695471" POSITION="left" TEXT="18. Complexity: Fixed-Parameter Algorithms"/>
<node CREATED="1575128696120" ID="ID_233130072" MODIFIED="1575128722108" POSITION="right" TEXT="19. Synchronous Distributed Algorithms: Symmetry-Breaking. Shortest-Paths Spanning Trees"/>
<node CREATED="1575128723487" ID="ID_257815467" MODIFIED="1575128748097" POSITION="left" TEXT="20. Asynchronous Distributed Algorithms: Shortest-Paths Spanning Trees"/>
<node CREATED="1575128752544" ID="ID_1554720755" MODIFIED="1575128761781" POSITION="right" TEXT="21. Cryptography: Hash Functions"/>
<node CREATED="1575128762688" ID="ID_178988316" MODIFIED="1575128769471" POSITION="left" TEXT="22. Cryptography: Encryption"/>
<node CREATED="1575128773007" ID="ID_453735574" MODIFIED="1575128783673" POSITION="right" TEXT="23. Cache-Oblivious Algorithms: Medians &amp; Matrices"/>
<node CREATED="1575128788607" ID="ID_1905066703" MODIFIED="1575128801518" POSITION="left" TEXT="24. Cache-Oblivious Algorithms: Searching &amp; Sorting"/>
<node CREATED="1575128807321" ID="ID_152927996" MODIFIED="1575128824290" POSITION="right" TEXT="R1. Matrix Multiplication and the Master Theorem"/>
<node CREATED="1575128825811" ID="ID_970726683" MODIFIED="1575128833319" POSITION="left" TEXT="R2. 2-3 Trees and B-Trees"/>
<node CREATED="1575128838161" ID="ID_986747565" MODIFIED="1575128852530" POSITION="right" TEXT="R3. Randomized Select and Randomized Quicksort"/>
<node CREATED="1575128853691" ID="ID_790525664" MODIFIED="1575128881475" POSITION="left" TEXT="R5. Dynamic Programming"/>
<node CREATED="1575128887665" ID="ID_309317023" MODIFIED="1575128895211" POSITION="right" TEXT="R6. Greedy Algorithms"/>
<node CREATED="1575128895906" ID="ID_1535815746" MODIFIED="1575128903081" POSITION="left" TEXT="R7. Network Flow and Matching"/>
<node CREATED="1575128907083" ID="ID_37718225" MODIFIED="1575128914745" POSITION="right" TEXT="R8. NP-Complete Problems"/>
<node CREATED="1575128919843" ID="ID_117100556" MODIFIED="1575128934626" POSITION="left" TEXT="R9. Approximation Algorithms: Travelling Salesman Problem"/>
<node CREATED="1575128938492" ID="ID_418849174" MODIFIED="1575128944686" POSITION="right" TEXT="R10. Distributed Algorithms"/>
<node CREATED="1575128948165" ID="ID_684251560" MODIFIED="1575128957237" POSITION="left" TEXT="R11. Cryptography: More Primitives"/>
</node>
</map>
