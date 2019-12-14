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
</html></richcontent>
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
</html></richcontent>
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
<node CREATED="1575858657082" ID="ID_1906009459" MODIFIED="1575858660652" TEXT="Representations:">
<node CREATED="1575858661015" ID="ID_20754717" MODIFIED="1575858668068" TEXT="A: Coefficient vector"/>
<node CREATED="1575858669616" ID="ID_479726426" MODIFIED="1575858795820" TEXT="B: roots">
<node CREATED="1575858805541" ID="ID_968618370" MODIFIED="1575858819672" TEXT="Every polynomial is uniquely determined by it&apos;s roots">
<node CREATED="1575858827016" ID="ID_1108355138" MODIFIED="1575858832338" TEXT="It has exactly n roots">
<node CREATED="1575858835699" ID="ID_338338531" MODIFIED="1575858846035" TEXT="r0, r1, ..., rn-1"/>
<node CREATED="1575858852230" ID="ID_985351953" MODIFIED="1575858869251" TEXT="c(x - r0)(x - r1) ... (x - rn-1)">
<node CREATED="1575858873393" ID="ID_1091471427" MODIFIED="1575858884231" TEXT="There is not way with the current model to obtain roots">
<node CREATED="1575858931775" ID="ID_1732312636" MODIFIED="1575858965724" TEXT="Going from coefficient vector to roots takes infinite time (almost)"/>
<node CREATED="1575858988126" ID="ID_1537707682" MODIFIED="1575858992124" TEXT="Multiplication is easy">
<node CREATED="1575858993026" ID="ID_1887070048" MODIFIED="1575858997699" TEXT="justs c s"/>
</node>
<node CREATED="1575858999762" ID="ID_1404909949" MODIFIED="1575859002315" TEXT="Addition is hard">
<node CREATED="1575859010194" ID="ID_1467055711" MODIFIED="1575859035842" TEXT="There is no relationship between sum of the polynomials and it&apos;s roots"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575858706345" ID="ID_617882435" MODIFIED="1575858708591" TEXT="C: Samples">
<node CREATED="1575858714383" ID="ID_1531153650" MODIFIED="1575858732347" TEXT="(xk,yk) for k = 0,1,...,n-1">
<node CREATED="1575858746494" ID="ID_1947141166" MODIFIED="1575858753607" TEXT="A(xk) = yk">
<node CREATED="1575858754577" ID="ID_725667271" MODIFIED="1575858773631" TEXT="There is only one polynomial that can pass through all points"/>
</node>
</node>
</node>
</node>
<node CREATED="1575859089390" ID="ID_1836089864" MODIFIED="1575859092995" TEXT="Algorithms">
<node CREATED="1575859093288" ID="ID_707047665" MODIFIED="1575859095898" TEXT="Evaluation">
<node CREATED="1575859114088" ID="ID_1340645518" MODIFIED="1575859119920" TEXT="Coefficients">
<node CREATED="1575859127384" ID="ID_1640474807" MODIFIED="1575859133477" TEXT="O(n)"/>
</node>
<node CREATED="1575859121107" ID="ID_908230648" MODIFIED="1575859123598" TEXT="Roots">
<node CREATED="1575859237404" ID="ID_1603924483" MODIFIED="1575859239862" TEXT="O(n)"/>
</node>
<node CREATED="1575859123913" ID="ID_98487399" MODIFIED="1575859126473" TEXT="Samples">
<node CREATED="1575859371913" ID="ID_1579523118" MODIFIED="1575859378802" TEXT="Needs polynomial interpolation">
<node CREATED="1575859379062" ID="ID_673176924" MODIFIED="1575859385092" TEXT="Evaluate at x&apos;">
<node CREATED="1575859386914" ID="ID_1939238629" MODIFIED="1575859390011" TEXT="O(n^2)">
<node CREATED="1575859390296" ID="ID_760977930" MODIFIED="1575859392987" TEXT="Best known"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575859096425" ID="ID_802057249" MODIFIED="1575859098523" TEXT="Addition">
<node CREATED="1575859138614" ID="ID_1689157739" MODIFIED="1575859142134" TEXT="Coefficients">
<node CREATED="1575859179504" ID="ID_1783266313" MODIFIED="1575859181096" TEXT="O(n)"/>
</node>
<node CREATED="1575859142473" ID="ID_1257115594" MODIFIED="1575859143661" TEXT="Roots">
<node CREATED="1575859210322" ID="ID_786119391" MODIFIED="1575859220210" TEXT="inf (almost)"/>
</node>
<node CREATED="1575859143886" ID="ID_1381648133" MODIFIED="1575859145101" TEXT="Samples">
<node CREATED="1575859354464" ID="ID_1725467506" MODIFIED="1575859355871" TEXT="O(n)"/>
</node>
</node>
<node CREATED="1575859099169" ID="ID_967191220" MODIFIED="1575859101347" TEXT="Multiplication">
<node CREATED="1575859146243" ID="ID_1567816173" MODIFIED="1575859148854" TEXT="Coefficients">
<node CREATED="1575859183248" ID="ID_414873986" MODIFIED="1575859200553" TEXT="O(n^2)"/>
</node>
<node CREATED="1575859149087" ID="ID_319266420" MODIFIED="1575859150102" TEXT="Roots">
<node CREATED="1575859244044" ID="ID_1684502013" MODIFIED="1575859246327" TEXT="O(n)"/>
</node>
<node CREATED="1575859150394" ID="ID_962898009" MODIFIED="1575859152046" TEXT="Samples">
<node CREATED="1575859340578" ID="ID_924948752" MODIFIED="1575859342378" TEXT="O(n)"/>
</node>
</node>
<node CREATED="1575859432596" ID="ID_985560824" MODIFIED="1575859452684" TEXT="We can convert between coefficents and Samples representations in O(n log n)">
<node CREATED="1575859466520" ID="ID_1072414661" MODIFIED="1575859489497" TEXT="To multiply in coefficents form, convert it into samples form , do the multiplication and convert it back">
<node CREATED="1575859501121" ID="ID_1762412701" MODIFIED="1575859509634" TEXT="The transformation is called FFT">
<node CREATED="1575859512047" ID="ID_928075783" MODIFIED="1575859515696" TEXT="DFT">
<node CREATED="1575859515878" ID="ID_1510948187" MODIFIED="1575859544064" TEXT="Mathematical transformation"/>
</node>
<node CREATED="1575859520863" ID="ID_862641914" MODIFIED="1575859521889" TEXT="FFT">
<node CREATED="1575859522182" ID="ID_1950895065" MODIFIED="1575859524433" TEXT="Algorithm"/>
</node>
</node>
</node>
</node>
<node CREATED="1575860439978" ID="ID_819282513" MODIFIED="1575860442637" TEXT="Matrix view:">
<node CREATED="1575860442976" ID="ID_729104975" MODIFIED="1575860544667">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1 x0 x0^2 ... x0^n-1] [a0] = [y0]
    </p>
    <p>
      1 x1 x1^2 ... x1^n-1] [a1] = [y1]
    </p>
    <p>
      ...
    </p>
  </body>
</html></richcontent>
<node CREATED="1575860546332" ID="ID_409121850" MODIFIED="1575860550527" TEXT="Vandermond matrix">
<node CREATED="1575861433771" ID="ID_1847658680" MODIFIED="1575861442198" TEXT="Vjk = Xj^k">
<node CREATED="1575861470541" ID="ID_287873578" MODIFIED="1575861488432" TEXT="Coefficients to samples = V. A">
<node CREATED="1575861488683" ID="ID_135233511" MODIFIED="1575861491396" TEXT="O(n^2)"/>
</node>
<node CREATED="1575861515570" ID="ID_1101295266" MODIFIED="1575861535703" TEXT="Samples to coefficients = V \ A">
<node CREATED="1575861564354" ID="ID_313845683" MODIFIED="1575861570011" TEXT="Gaussian elimination">
<node CREATED="1575861570231" ID="ID_1895361476" MODIFIED="1575861577931" TEXT="O(n^3)">
<node CREATED="1575861578178" ID="ID_1601887662" MODIFIED="1575861579116" TEXT="Bad"/>
<node CREATED="1575861588505" ID="ID_1664937011" MODIFIED="1575861599166" TEXT="Little better with fixed coefficients"/>
</node>
<node CREATED="1575861604257" ID="ID_434930751" MODIFIED="1575861608595" TEXT="V^-1 . A">
<node CREATED="1575861609290" ID="ID_850848792" MODIFIED="1575861614417" TEXT="But need to do it only once">
<node CREATED="1575861617330" ID="ID_1078320164" MODIFIED="1575861621338" TEXT="It can be stored"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575861665841" ID="ID_1947415120" MODIFIED="1575861670301" TEXT="We can choose xk">
<node CREATED="1575861671374" ID="ID_177090450" MODIFIED="1575861680797" TEXT="To convert it into O(n log n)"/>
<node CREATED="1575861808789" ID="ID_159041499" MODIFIED="1575861825033" TEXT="Divide &amp; Conquer">
<node CREATED="1575861827671" ID="ID_1167704393" MODIFIED="1575861868419" TEXT="Goal: A(x) for x belongs to X">
<node CREATED="1575861849021" ID="ID_630266174" MODIFIED="1575861853284" TEXT="x are samples"/>
</node>
<node CREATED="1575861873245" ID="ID_784188506" MODIFIED="1575861874468" TEXT="Steps">
<node CREATED="1575861874741" ID="ID_256357059" MODIFIED="1575861877164" TEXT="1. Divide">
<node CREATED="1575861884674" ID="ID_81602043" MODIFIED="1575861916003" TEXT="Even entries, Odd entries">
<node CREATED="1575861916225" ID="ID_405316917" MODIFIED="1575861927590" TEXT="Even coefficients, Odd coefficients">
<node CREATED="1575861928961" ID="ID_249692153" MODIFIED="1575861974539" TEXT="A_even(x) = sigma_k=0_to_n/2-1 a_2k.x^k = &lt;a0, a2, ...&gt;"/>
<node CREATED="1575862185229" ID="ID_1037761695" MODIFIED="1575862225113" TEXT="A_odd(x) = sigma_k=0_to_n/2 a_2k+1.x^k = &lt;a1, a3, ...&gt;"/>
<node CREATED="1575862356040" ID="ID_1606464612" MODIFIED="1575862373535" TEXT="A(x) = A_even(x^2) + x.A_odd(x^2)">
<node CREATED="1575862382568" ID="ID_1898558611" MODIFIED="1575862390967" TEXT="for x belongs to X">
<node CREATED="1575862391341" ID="ID_843027597" MODIFIED="1575862398212" TEXT="O(1)"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575861877426" ID="ID_307508731" MODIFIED="1575861879915" TEXT="2. Conquer">
<node CREATED="1575862408999" ID="ID_1375077208" MODIFIED="1575862426158" TEXT="Recursively compute A_even(y) &amp; A_odd(y) for y in X^2">
<node CREATED="1575862427420" ID="ID_1256272036" MODIFIED="1575862439894" TEXT="X^2 = {x^2 | x in X}">
<node CREATED="1575934721047" ID="ID_1249786484" MODIFIED="1575934732820" TEXT="X^2 has same size as X"/>
</node>
<node CREATED="1575934743642" ID="ID_1123842873" MODIFIED="1575934806910" TEXT="T(n, |X|) = 2T(n/2, |X|) + O(n + |X|)">
<node CREATED="1575934926193" ID="ID_1216868957" MODIFIED="1575935000524">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;n
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;n&#160;&#160;&#160;&#160;&#160;&#160;n
    </p>
    <p>
      &#160;&#160;&#160;&#160;n&#160;&#160;n&#160;&#160;n&#160;&#160;&#160;n
    </p>
    <p>
      &#160;&#160;&#160;&#160;....
    </p>
    <p>
      n n&#160;&#160;n n n n n n -&gt; 2^log n ns
    </p>
    <p>
      &#160;
    </p>
  </body>
</html></richcontent>
<node CREATED="1575935125200" ID="ID_1501301573" MODIFIED="1575935436947">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      |X| = 1, X = {1}
    </p>
    <p>
      |X| = 2, X = {-1, 1}
    </p>
    <p>
      |X| = 4, X = {i, -i, -1, 1}
    </p>
    <p>
      |X| = 8, X = {+/-rt(2)/2(1 + i) + +/1rt(2)/2(i - 1), i, -i, -1, 1}
    </p>
  </body>
</html></richcontent>
<node CREATED="1575935501571" ID="ID_944436387" MODIFIED="1575935507709" TEXT="Complex plane">
<node CREATED="1575935508473" ID="ID_611624280" MODIFIED="1575935512948" TEXT="Im/R">
<node CREATED="1575935513681" ID="ID_843316802" MODIFIED="1575935517620" TEXT="Unit Circle"/>
</node>
</node>
<node CREATED="1575936103606" ID="ID_139110974" MODIFIED="1575936110402" TEXT="nth root of unity">
<node CREATED="1575936963845" ID="ID_1899161117" MODIFIED="1575936984075" TEXT="(cos Theta, sin Theta)">
<node CREATED="1575936987391" ID="ID_846048564" MODIFIED="1575936996448" TEXT="cos theta + i.sin theta">
<node CREATED="1575937013544" ID="ID_204934310" MODIFIED="1575937092831" TEXT="for theta = 0, tau/n, 2 tau/n, ... (n -1)/n tau">
<node CREATED="1575937101156" ID="ID_1967089900" MODIFIED="1575937107353" TEXT="Tau = 2 pi"/>
</node>
<node CREATED="1575937122797" ID="ID_1712567249" MODIFIED="1575937129266" TEXT="= e^i theta"/>
</node>
</node>
<node CREATED="1575937196373" ID="ID_1375072252" MODIFIED="1575937205184" TEXT="e^i k tau/n">
<node CREATED="1575937223764" ID="ID_1730585026" MODIFIED="1575937316286" TEXT="(e^i theta) = e^i(2 theta) = e ^i (2 theta mod tau)">
<node CREATED="1575937331621" ID="ID_661738374" MODIFIED="1575937347832" TEXT="e^i tau = 1"/>
<node CREATED="1575937464438" ID="ID_801907938" MODIFIED="1575937476262" TEXT="n = 2^k =&gt; nth roots of unity are collapsing">
<node CREATED="1575937478460" ID="ID_609233418" MODIFIED="1575937489636" TEXT="x_k = e^ik tau/n">
<node CREATED="1575937490558" ID="ID_44750646" MODIFIED="1575937495828" TEXT="Computed only once"/>
</node>
<node CREATED="1575937541771" ID="ID_1689264012" MODIFIED="1575937552970" TEXT="n -&gt; n/2 -&gt; n/4 -&gt; ..."/>
</node>
</node>
</node>
<node CREATED="1575937503714" ID="ID_71533073" MODIFIED="1575937515264" TEXT="Choose n uniformly spaced points on a unit circle"/>
</node>
</node>
<node CREATED="1575935194638" ID="ID_899615993" MODIFIED="1575935228956" TEXT="Collapsing set X if |X^2| = |X|/2 &amp; X^2 is collapsing"/>
</node>
</node>
</node>
<node CREATED="1575937580699" ID="ID_1138701255" MODIFIED="1575937589004" TEXT="Fast Forier Transfer (FFT)">
<node CREATED="1575937589282" ID="ID_1849861466" MODIFIED="1575937599687" TEXT="Divide &amp; conquer algorithm for DFT">
<node CREATED="1575937600328" ID="ID_1639740521" MODIFIED="1575937606466" TEXT="Discrete Forier Transform">
<node CREATED="1575937606728" ID="ID_1907454129" MODIFIED="1575937614918" TEXT="Mathematical transformation">
<node CREATED="1575937626356" ID="ID_714900745" MODIFIED="1575937642851" TEXT="V.A for x_k = e^i k tau/n">
<node CREATED="1575937653684" ID="ID_862479044" MODIFIED="1575937675422" TEXT="V_jk = x^k = e^ ijk tau/n"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575861880179" ID="ID_1134326279" MODIFIED="1575861883307" TEXT="3. Combine"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575937768045" ID="ID_1639162830" MODIFIED="1575937774748" TEXT="Fast Polynomial Multiplication">
<node CREATED="1575937775453" ID="ID_1690648651" MODIFIED="1575937780456" TEXT="A* = FFT(A)"/>
<node CREATED="1575937782169" ID="ID_1493308331" MODIFIED="1575937785934" TEXT="B* = FFT(B)">
<node CREATED="1575937799949" ID="ID_909101194" MODIFIED="1575937806793" TEXT="exact same points as samples of A"/>
</node>
<node CREATED="1575937811519" ID="ID_1806607179" MODIFIED="1575937833737" TEXT="C*_k = A*_k.B*_k for all k">
<node CREATED="1575937838332" ID="ID_693217240" MODIFIED="1575937842855" TEXT="C = IFFT(C*)">
<node CREATED="1575937893737" ID="ID_595892869" MODIFIED="1575937915327" TEXT="Claim: V^-1 = Complex Conjugate(V) / n">
<node CREATED="1575937918153" ID="ID_691767657" MODIFIED="1575937938002" TEXT="complex conjugate(a + ib) = a - ib"/>
</node>
<node CREATED="1575937956589" ID="ID_239713438" MODIFIED="1575938102211">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      x_k^-1 = (e^-ik tau/n)
    </p>
  </body>
</html></richcontent>
<node CREATED="1575938012750" ID="ID_1690150093" MODIFIED="1575938025781" TEXT="reflection about x axis"/>
</node>
<node CREATED="1575938070067" ID="ID_101342065" MODIFIED="1575938079357" TEXT="(nV^-1).A* = nA">
<node CREATED="1575938150873" ID="ID_24192129" MODIFIED="1575938174510" TEXT="divide each term by n"/>
<node CREATED="1575938653861" ID="ID_825423758" MODIFIED="1575938670622" TEXT="P = V.cc(V) = n I">
<node CREATED="1575938681576" ID="ID_1997148861" MODIFIED="1575938699325" TEXT="P_jk = row j of V . col k of cc(V)">
<node CREATED="1575938708151" ID="ID_299526737" MODIFIED="1575938817682" TEXT="sigma_m=0 to n - 1 e^i tau jm/n . e^-i tau mk/n = sigma_m=0 to n - 1 e^i tau m/n(j - k)">
<node CREATED="1575938842515" ID="ID_1313319988" MODIFIED="1575938853076" TEXT="n if j = k or 0 if j != k">
<node CREATED="1575938947185" ID="ID_1348370636" MODIFIED="1575938992842" TEXT="if j != k: sigma_m=0 to n - 1 e^(i tau (j - k)/n) m">
<node CREATED="1575938997251" ID="ID_772308262" MODIFIED="1575939001274" TEXT="Geometric series">
<node CREATED="1575939042227" ID="ID_1487563767" MODIFIED="1575939127858" TEXT="(e^i tau (j - k)/n)n - 1 ) / (e^i tau k/n - 1))">
<node CREATED="1575939128399" ID="ID_424683184" MODIFIED="1575939129218" TEXT="0">
<node CREATED="1575939131217" ID="ID_306970487" MODIFIED="1575939141568" TEXT="since e^i tau = 1"/>
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
</node>
<node CREATED="1575939306869" ID="ID_374033674" MODIFIED="1575939309115" TEXT="Applications">
<node CREATED="1575939309651" ID="ID_1761996096" MODIFIED="1575939317381" TEXT="Audio">
<node CREATED="1575939317682" ID="ID_925976093" MODIFIED="1575939336431" TEXT="IFFT is called Forier Transform"/>
<node CREATED="1575939341763" ID="ID_377257301" MODIFIED="1575939375068" TEXT="For every position in vector in fft is viewed as a trigonometric function">
<node CREATED="1575939379157" ID="ID_1182818183" MODIFIED="1575939395238" TEXT="Magnitude - how much of that frequency we have"/>
<node CREATED="1575939395737" ID="ID_806007276" MODIFIED="1575939408333" TEXT="Angle - how much is the trigonometric function shifted"/>
</node>
<node CREATED="1575939436784" ID="ID_1408954457" MODIFIED="1575939440095" TEXT="For Bell">
<node CREATED="1575939440325" ID="ID_1232312238" MODIFIED="1575939485815" TEXT="fft -&gt; one spike at a particular frequency and it is rotated depending on the phase"/>
</node>
<node CREATED="1575939500150" ID="ID_1349723741" MODIFIED="1575939510870" TEXT="High pass filters and low pass filters">
<node CREATED="1575939511151" ID="ID_985285097" MODIFIED="1575939532969" TEXT="convert using fft, remove high frequencies and low frequencies and convert it back"/>
</node>
</node>
<node CREATED="1575939553666" ID="ID_504858188" MODIFIED="1575939581453" TEXT="Any time based function can be thought of converting and doing manipulations">
<node CREATED="1575939582934" ID="ID_1805996564" MODIFIED="1575939585349" TEXT="Easy to perform"/>
</node>
<node CREATED="1575939590219" ID="ID_302677998" MODIFIED="1575939592006" TEXT="FFTW">
<node CREATED="1575939592220" ID="ID_1640273295" MODIFIED="1575939599686" TEXT="Fast Forier Transform in the West">
<node CREATED="1575939600030" ID="ID_856852582" MODIFIED="1575939602261" TEXT="Done at MIT">
<node CREATED="1575939610997" ID="ID_360308903" MODIFIED="1575939619415" TEXT="Software"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1575128487017" ID="ID_909750081" MODIFIED="1575128504163" POSITION="left" TEXT="4. Divide &amp; Conquer: van Emde Boas Trees"/>
<node CREATED="1575128505011" ID="ID_1585701604" MODIFIED="1575128514741" POSITION="right" TEXT="5. Amortization: Amortized Analysis">
<node CREATED="1576118051970" ID="ID_960643603" MODIFIED="1576118063761" TEXT="Especially if using DS when implementing algorithm"/>
<node CREATED="1576118082617" ID="ID_1978363410" MODIFIED="1576118101375" TEXT="We care about overall running time of the algorithm rather than individual operations">
<node CREATED="1576118115651" ID="ID_1687419423" MODIFIED="1576118121877" TEXT="Sum of all the operations"/>
</node>
<node CREATED="1576118125339" ID="ID_1205992599" MODIFIED="1576118126797" TEXT="Methods">
<node CREATED="1576118889594" ID="ID_683967097" MODIFIED="1576118894243" TEXT="Aggregate method">
<node CREATED="1576118894898" ID="ID_980621592" MODIFIED="1576118902211" TEXT="Weakest way">
<node CREATED="1576118918370" ID="ID_1824872163" MODIFIED="1576118927204" TEXT="Total cost of k ops % k">
<node CREATED="1576118942252" ID="ID_1415831452" MODIFIED="1576118947010" TEXT="Works for simple examples"/>
<node CREATED="1576118963649" ID="ID_1166482960" MODIFIED="1576118975982" TEXT="If inserts and deletes are mixed, the sum is not clear"/>
</node>
</node>
</node>
<node CREATED="1576118146306" ID="ID_692556853" MODIFIED="1576118150909" TEXT="Accounting method">
<node CREATED="1576121351760" ID="ID_1531102902" MODIFIED="1576121356866" TEXT="Bank teller&apos;s analysis">
<node CREATED="1576121437939" ID="ID_1175411129" MODIFIED="1576121453081" TEXT="Allow an operation to store credit in that bank account">
<node CREATED="1576121470622" ID="ID_1151213792" MODIFIED="1576121479061" TEXT="Must always be non-negative balance"/>
<node CREATED="1576121486823" ID="ID_1005315508" MODIFIED="1576121495610" TEXT="If we store, we pay for it">
<node CREATED="1576121512233" ID="ID_944691886" MODIFIED="1576121529865" TEXT="If I remove, the credit should never become 0">
<node CREATED="1576121546898" ID="ID_538602992" MODIFIED="1576121564527" TEXT="delete can be done if I have log n balance it the account"/>
</node>
</node>
</node>
<node CREATED="1576121594691" ID="ID_194984818" MODIFIED="1576121609573" TEXT="Allow an operation to to pay for time using credit stored in the bank"/>
<node CREATED="1576121614303" ID="ID_1120816656" MODIFIED="1576121621073" TEXT="Balance &gt;= 0"/>
<node CREATED="1576200461369" ID="ID_1279224765" MODIFIED="1576200469227" TEXT="Claim: O(log n) for insert (current value of n), 0 per delete, amortized">
<node CREATED="1576200478616" ID="ID_322956074" MODIFIED="1576200492686" TEXT="Put 1 coin worth O(log n) per insert"/>
<node CREATED="1576200493510" ID="ID_962168278" MODIFIED="1576200503007" TEXT="Delete consumes 1 coin"/>
<node CREATED="1576200505271" ID="ID_1550190533" MODIFIED="1576200529817" TEXT="Amortized cost = actual cost + deposits - withdrawals">
<node CREATED="1576200567205" ID="ID_591745959" MODIFIED="1576200574736" TEXT="Coin has different value based on current value of n">
<node CREATED="1576200616588" ID="ID_991986016" MODIFIED="1576200636515" TEXT="Invariant: one value of log i for i = 1, ...., n"/>
</node>
</node>
</node>
<node CREATED="1576200664260" ID="ID_362850967" MODIFIED="1576200671205" TEXT="Example Table Doubling:">
<node CREATED="1576200705565" ID="ID_1948054067" MODIFIED="1576200719402" TEXT="when insert, add coin on it">
<node CREATED="1576200727228" ID="ID_1158144076" MODIFIED="1576200738651" TEXT="Value of the coin: c = O(1)">
<node CREATED="1576200866800" ID="ID_38098326" MODIFIED="1576200890547" TEXT="n/2 coins are left each time we double">
<node CREATED="1576200899238" ID="ID_882680252" MODIFIED="1576200903135" TEXT="They get used up">
<node CREATED="1576200945508" ID="ID_1865190993" MODIFIED="1576200991268" TEXT="=&gt; Amortized cost = O(n) - c * n/2 = 0 if c is set to large value (2*(O (n)))"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1576118151124" ID="ID_655641239" MODIFIED="1576118154333" TEXT="Charging method">
<node CREATED="1576202065492" ID="ID_1065998889" MODIFIED="1576203454968" TEXT="Allow operations to charge cost retroactively to the past (not the future))">
<node CREATED="1576203497352" ID="ID_175531888" MODIFIED="1576203509801" TEXT="We are thinking about the future - what can potentially charege me"/>
</node>
<node CREATED="1576203528052" ID="ID_270209750" MODIFIED="1576203550626" TEXT="Amortized cost = actual cost - total charge to the past + total charge in future">
<node CREATED="1576203578288" ID="ID_1048446998" MODIFIED="1576203582996" TEXT="Example: Table doubling">
<node CREATED="1576203621964" ID="ID_1987966139" MODIFIED="1576203628868" TEXT="To half full to completely full">
<node CREATED="1576203629268" ID="ID_1821377952" MODIFIED="1576203635277" TEXT="n/2 insertions">
<node CREATED="1576203679000" ID="ID_1181307506" MODIFIED="1576203686658" TEXT="charge doubling to inserts since last doubling">
<node CREATED="1576203701435" ID="ID_1408198427" MODIFIED="1576203711954" TEXT="n/2">
<node CREATED="1576203712252" ID="ID_1912422545" MODIFIED="1576203892646" TEXT="charges theta(n) to make doubling free">
<node CREATED="1576203727636" ID="ID_355864685" MODIFIED="1576203732899" TEXT="Theta(1) for each">
<node CREATED="1576203905571" ID="ID_878192528" MODIFIED="1576203918046" TEXT="Uniformly distribute charge for each element"/>
<node CREATED="1576203936790" ID="ID_403419560" MODIFIED="1576203941306" TEXT="Insert is charged only once"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1576329542929" ID="ID_1526669753" MODIFIED="1576329550012" TEXT="100% full -&gt; double">
<node CREATED="1576329551161" ID="ID_166857648" MODIFIED="1576329560102" TEXT="1/4 full -&gt; halve">
<node CREATED="1576329560653" ID="ID_1091760561" MODIFIED="1576329566533" TEXT="constant amortized per operation">
<node CREATED="1576329569454" ID="ID_473734015" MODIFIED="1576329573222" TEXT="Complicated">
<node CREATED="1576329584692" ID="ID_473947273" MODIFIED="1576329586140" TEXT="Charging">
<node CREATED="1576329623077" ID="ID_1143053828" MODIFIED="1576329638386" TEXT="Whenever we double or shrink, the array is half full">
<node CREATED="1576329703973" ID="ID_955272341" MODIFIED="1576329729389" TEXT="If I double, I have to insert m/2 items"/>
<node CREATED="1576329730300" ID="ID_1273997281" MODIFIED="1576329864235" TEXT="If I have to shrink, I have to delete  atleast m/4 deletions">
<node CREATED="1576329875828" ID="ID_754352269" MODIFIED="1576329897051" TEXT="charge halving operation to &gt;= m/4 deletions since last resize of either type"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1576118154621" ID="ID_937311075" MODIFIED="1576118158453" TEXT="Potential method"/>
<node CREATED="1576118200928" ID="ID_869575092" MODIFIED="1576118202446" TEXT="Examples">
<node CREATED="1576118158678" ID="ID_1344977574" MODIFIED="1576118162293" TEXT="Table doubling">
<node CREATED="1576118208614" ID="ID_1538563173" MODIFIED="1576118210805" TEXT="HashTables">
<node CREATED="1576118211771" ID="ID_713177614" MODIFIED="1576118317430" TEXT="if we store n items in a hashtable of size m">
<node CREATED="1576118223047" ID="ID_478287707" MODIFIED="1576118326143" TEXT="Expected cost of O(1 + m/n)">
<node CREATED="1576118330056" ID="ID_663030316" MODIFIED="1576118338063" TEXT="m be atleast around n">
<node CREATED="1576118344751" ID="ID_106957708" MODIFIED="1576118352055" TEXT="Technique: If table is too small, double it">
<node CREATED="1576118360784" ID="ID_1282285820" MODIFIED="1576118379390" TEXT="If n grows to m, then double m =&gt; m&apos; = 2*m">
<node CREATED="1576118387977" ID="ID_1609369530" MODIFIED="1576118394834" TEXT="O(m) work">
<node CREATED="1576118404632" ID="ID_958162716" MODIFIED="1576118409175" TEXT="We double log(n) times"/>
</node>
</node>
<node CREATED="1576118417818" ID="ID_1559013747" MODIFIED="1576118820687" TEXT="Total cost for n insertions =  O(2^0 + 2^1 + ... + 2^log(n)) = O(n)">
<node CREATED="1576118826070" ID="ID_477435350" MODIFIED="1576118837425" TEXT="Amortized cost per operation is constant">
<node CREATED="1576118841580" ID="ID_1749123499" MODIFIED="1576118842935" TEXT="O(1)"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1576118163698" ID="ID_1626879631" MODIFIED="1576118169765" TEXT="binary counter"/>
</node>
</node>
<node CREATED="1576119037345" ID="ID_239991968" MODIFIED="1576119040477" TEXT="Amortized bounds">
<node CREATED="1576119045986" ID="ID_1391741679" MODIFIED="1576119082785" TEXT="assign amortized cost for each operation such that we &quot;preserve the sum&quot;">
<node CREATED="1576119084358" ID="ID_990567635" MODIFIED="1576119113664" TEXT="sigma_op amortized cost &gt;= sigma_op actual cost">
<node CREATED="1576119131998" ID="ID_26262562" MODIFIED="1576119152330" TEXT="This is good for algorithms such as Dijkstra&apos;s because we want total cost and not cost at time t"/>
<node CREATED="1576119164363" ID="ID_1829875210" MODIFIED="1576119169288" TEXT="Not good for real time systems"/>
</node>
</node>
<node CREATED="1576119353144" ID="ID_982661942" MODIFIED="1576119363909" TEXT="E.g: 2-3 trees achieve">
<node CREATED="1576119364154" ID="ID_1566761517" MODIFIED="1576119384743" TEXT="O(1) - worst case per construct an empty tree"/>
<node CREATED="1576119386387" ID="ID_1746305445" MODIFIED="1576119399857" TEXT="O(log n*) amortized per insert"/>
<node CREATED="1576119400184" ID="ID_1594061846" MODIFIED="1576119417237" TEXT="O(0) time per delete">
<node CREATED="1576119419225" ID="ID_1951306552" MODIFIED="1576119421812" TEXT="Free operation">
<node CREATED="1576119486627" ID="ID_1834978014" MODIFIED="1576119498975" TEXT="We cannot delete more elements than those I have inserted"/>
<node CREATED="1576119517687" ID="ID_181852679" MODIFIED="1576119544531" TEXT="total cost = O(c + i log n* + d log n*)">
<node CREATED="1576119546681" ID="ID_1301828377" MODIFIED="1576119549482" TEXT="d &lt;= i">
<node CREATED="1576119557466" ID="ID_1337416100" MODIFIED="1576119592369" TEXT="O(c + 2i log n) = O(c + i log n)">
<node CREATED="1576121164401" ID="ID_1559552431" MODIFIED="1576121171754" TEXT="n is current size of the structure">
<node CREATED="1576121304785" ID="ID_1566223745" MODIFIED="1576121310544" TEXT="n* is max size"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1576121330812" ID="ID_671295350" MODIFIED="1576121337483" TEXT="Works for any logarithmic structures"/>
</node>
</node>
</node>
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
