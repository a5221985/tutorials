<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1565423849878" ID="ID_1197903451" MODIFIED="1565423860010" TEXT="Algorithmic Lower Bounds">
<node CREATED="1565423861897" ID="ID_1811087199" MODIFIED="1565423865387" POSITION="right" TEXT="Overview">
<node CREATED="1565424085339" ID="ID_980937616" MODIFIED="1565424097849" TEXT="Practical guide to prove problems hard">
<node CREATED="1565441051947" ID="ID_130235567" MODIFIED="1565441056118" TEXT="Techniques">
<node CREATED="1565441191999" ID="ID_1290861110" MODIFIED="1565441200086" TEXT="Key problems to reduce from my problem"/>
</node>
<node CREATED="1565441083302" ID="ID_1944969267" MODIFIED="1565441085223" TEXT="Why?">
<node CREATED="1565441085662" ID="ID_1076984482" MODIFIED="1565441129496" TEXT="When designing algorithms is possible and not possible"/>
<node CREATED="1565441168074" ID="ID_1495730597" MODIFIED="1565441178006" TEXT="When to use fixed param algorithms"/>
<node CREATED="1565441178189" ID="ID_539192754" MODIFIED="1565441184919" TEXT="When to use approximation algorithms"/>
</node>
</node>
<node CREATED="1565441209481" ID="ID_1736133221" MODIFIED="1565441213794" TEXT="Gadgets">
<node CREATED="1565441214015" ID="ID_1807982228" MODIFIED="1565441224766" TEXT="Taking small components and gathering them to gether"/>
</node>
<node CREATED="1565441228530" ID="ID_1724533996" MODIFIED="1565441245523" TEXT="Most problems in the class are equivalent"/>
<node CREATED="1565441252368" ID="ID_1622650224" MODIFIED="1565441272859" TEXT="Proving problems are hard are like playing puzzles"/>
<node CREATED="1565441383658" ID="ID_581303223" MODIFIED="1565441386589" TEXT="Topics">
<node CREATED="1565441386878" ID="ID_35589444" MODIFIED="1565441394637" TEXT="NP-Completeness"/>
<node CREATED="1565441400534" ID="ID_543235247" MODIFIED="1565441408447" TEXT="PSPACE, EXPTIME, EXPSPACE"/>
<node CREATED="1565441409986" ID="ID_1171449194" MODIFIED="1565441416243" TEXT="Games, Puzzles and Computation"/>
<node CREATED="1565441416980" ID="ID_960502016" MODIFIED="1565441430493" TEXT="Inapproximability"/>
<node CREATED="1565441430734" ID="ID_1585529284" MODIFIED="1565441436744" TEXT="Fixed-parameter algorithms">
<node CREATED="1565441453335" ID="ID_213535717" MODIFIED="1565441468686" TEXT="Fast algorithms when the optimal solutions happens to be small"/>
</node>
<node CREATED="1565441527277" ID="ID_1952638354" MODIFIED="1565441556049" TEXT="Counting problems"/>
<node CREATED="1565441556751" ID="ID_241280775" MODIFIED="1565441560929" TEXT="Solutions uniqueness"/>
<node CREATED="1565441562082" ID="ID_337564029" MODIFIED="1565441565633" TEXT="Game theory"/>
<node CREATED="1565441566062" ID="ID_1537879004" MODIFIED="1565441598474" TEXT="Existential theory"/>
<node CREATED="1565441603660" ID="ID_348250970" MODIFIED="1565441608228" TEXT="Undecidability">
<node CREATED="1565441608620" ID="ID_977339727" MODIFIED="1565441626234" TEXT="No algorithm given any finite amount to time"/>
</node>
<node CREATED="1565441658498" ID="ID_1131500205" MODIFIED="1565441663356" TEXT="Crash-course">
<node CREATED="1565441663854" ID="ID_748054683" MODIFIED="1565441667566" TEXT="Computational complexity">
<node CREATED="1565441934228" ID="ID_1467992035" MODIFIED="1565446997402">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      P - { problems that can be solved in polynomial time }
    </p>
    <p>
      
    </p>
    <p>
      Polynomial - n^O(1)
    </p>
    <p>
      These are good algorithms
    </p>
    <p>
      
    </p>
    <p>
      NP - { decision problems solvable in polynomial time via a &quot;lucky&quot; algorithm }
    </p>
    <p>
      Lucky algorithm: when it comes to decision, it always makes the right one
    </p>
    <p>
      N - Non deterministic
    </p>
    <p>
      Model
    </p>
    <ol>
      <li>
        algorithm makes guesses &amp; then says Yes/No
      </li>
      <li>
        Guesses guaranteed to lead to YES assuming if possible

        <ol>
          <li>
            If guesses lead to a NO, then what choices we make, it leads to a NO
          </li>
          <li>
            If guesses lead to a YES, then there are some choices that leads to a YES
          </li>
          <li>
            Asymmetric
          </li>
        </ol>
      </li>
      <li>
        Co-NP: filp YES/NO<br />
      </li>
    </ol>
    <p>
      
    </p>
    <p>
      EXP - { problems that can be solved in exponential time }
    </p>
    <p>
      Exponential time - 2^n^O(1)
    </p>
    <p>
      
    </p>
    <p>
      R = { Recursively ennumerable problems }
    </p>
    <p>
      Recursively enumerable - finite time
    </p>
    <p>
      
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1565442147926" ID="ID_1424898530" MODIFIED="1565445690240">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;NP-Complete&#160;&#160;&#160;EXP-Complete
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|
    </p>
    <p>
      ----|------|-----|--|------------&gt; &quot;computational difficulty&quot;
    </p>
    <p>
      |&#160;&#160;p&#160;&#160;|
    </p>
    <p>
      |&#160;&#160;&#160;&#160;&#160;&#160;NP&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|
    </p>
    <p>
      |&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;exp&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|
    </p>
    <p>
      |&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;PSPACE&#160;&#160;&#160;&#160;&#160;|
    </p>
    <p>
      |&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;R&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|&#160;&#160;&#160;&#160;EXP-hard -&gt;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;NP-hard -&gt;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;|&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;P-hard (notion of parallel computing)
    </p>
    <p>
      
    </p>
    <p>
      Anything that can be solved in P time can be solved in exp time etc...
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1565444349622" ID="ID_1429957847" MODIFIED="1565444371648" TEXT="Every problem that can be solved in polynomial time can be solved in NP time"/>
<node CREATED="1565444390111" ID="ID_1200845481" MODIFIED="1565444394216" TEXT="NP -&gt; EXP">
<node CREATED="1565444394483" ID="ID_339635193" MODIFIED="1565444407720" TEXT="Run NP for each choice of input">
<node CREATED="1565444414160" ID="ID_685806830" MODIFIED="1565444418368" TEXT="Depth first search"/>
</node>
</node>
<node CREATED="1565444459533" ID="ID_130983884" MODIFIED="1565444475499" TEXT="NP - P">
<node CREATED="1565444483036" ID="ID_1811812448" MODIFIED="1565444541754" TEXT="P == NP? Believed to be No">
<node CREATED="1565444489505" ID="ID_1653344811" MODIFIED="1565444504759" TEXT="We can make random choice"/>
<node CREATED="1565444505040" ID="ID_1288265552" MODIFIED="1565444510002" TEXT="We can make multiple choices"/>
<node CREATED="1565444516888" ID="ID_164184320" MODIFIED="1565444525345" TEXT="Not always make the right choice at each step"/>
</node>
</node>
<node CREATED="1565445212590" ID="ID_1519742207" MODIFIED="1565445244506" TEXT="NP-hard - every problem here is at least as hard as the hardest problem in NP"/>
<node CREATED="1565445282736" ID="ID_617421954" MODIFIED="1565445289999" TEXT="EXP-hard - chess">
<node CREATED="1565445293176" ID="ID_169559163" MODIFIED="1565445309520" TEXT="It is at-least as hard as the hardest problem in EXP"/>
</node>
</node>
<node CREATED="1565442370684" ID="ID_1708248702" MODIFIED="1565442375405" TEXT="Examples">
<node CREATED="1565442375669" ID="ID_783990613" MODIFIED="1565442379062" TEXT="n x n chess">
<node CREATED="1565442379514" ID="ID_735626779" MODIFIED="1565442386959" TEXT="white to move and can he win">
<node CREATED="1565442389587" ID="ID_62011336" MODIFIED="1565442398630" TEXT="EXP &amp; not in P"/>
</node>
</node>
<node CREATED="1565442400531" ID="ID_533419898" MODIFIED="1565442404237" TEXT="tetris">
<node CREATED="1565442407479" ID="ID_932741632" MODIFIED="1565442424212" TEXT="Assuming we know the sequence of pieces">
<node CREATED="1565442424595" ID="ID_1099303664" MODIFIED="1565442441955" TEXT="EXP but we don&apos;t know if it is in P"/>
</node>
</node>
<node CREATED="1565442461443" ID="ID_1900579588" MODIFIED="1565442465183" TEXT="Halting problem">
<node CREATED="1565442465576" ID="ID_1536802218" MODIFIED="1565442476192" TEXT="Given an algorithm, does it terminate">
<node CREATED="1565442477176" ID="ID_1630904928" MODIFIED="1565442482952" TEXT="Not in R"/>
</node>
</node>
<node CREATED="1565442486111" ID="ID_297021221" MODIFIED="1565442497874" TEXT="Most decision problem are not in R">
<node CREATED="1565442509601" ID="ID_1974421492" MODIFIED="1565442518858" TEXT="problems ~ 2^N">
<node CREATED="1565442566162" ID="ID_1561533969" MODIFIED="1565442580908" TEXT="Mapping of inputs to yes/no">
<node CREATED="1565442584033" ID="ID_778705084" MODIFIED="1565442640262" TEXT="Yes or No is 2 and inputs are N">
<node CREATED="1565442649957" ID="ID_1182918808" MODIFIED="1565442655451" TEXT="R - real numbers">
<node CREATED="1565442655908" ID="ID_1713784014" MODIFIED="1565442658404" TEXT="R &gt; N"/>
</node>
</node>
</node>
</node>
<node CREATED="1565442527961" ID="ID_1364785154" MODIFIED="1565442533369" TEXT="algorithms ~ N">
<node CREATED="1565442537863" ID="ID_1895245405" MODIFIED="1565443020934" TEXT="it can be thought of as a giant integer"/>
</node>
</node>
</node>
<node CREATED="1565443585352" ID="ID_894205260" MODIFIED="1565443644349" TEXT="NP - { decision problems with solutions that can be &quot;checked&quot; in polynomial time } &#xa;&#xa;Checkable efficiently If we know what is the right sequence of guesses, then we can run the algorithms (because we know it is polynomial) &#xa;Conversely: If we don&apos;t have a solution to the algorithm we can guess the solution and check it">
<node CREATED="1565443655679" ID="ID_340440452" MODIFIED="1565443709653" TEXT="If we are given a lucky algorithm we  can get the checking algorithms"/>
<node CREATED="1565443667854" ID="ID_1592160147" MODIFIED="1565443734336" TEXT="If we are given a checking algorithm we can convert to the lucky algorithm"/>
<node CREATED="1565443750184" ID="ID_1765675124" MODIFIED="1565443755904" TEXT="Examples">
<node CREATED="1565443756207" ID="ID_161630322" MODIFIED="1565443765425" TEXT="Tetris">
<node CREATED="1565444208101" ID="ID_507363674" MODIFIED="1565444212123" TEXT="in NP"/>
<node CREATED="1565444231546" ID="ID_820503609" MODIFIED="1565444245249" TEXT="How to prove that we survive the sequence of pieces">
<node CREATED="1565444259837" ID="ID_1303983691" MODIFIED="1565444267453" TEXT="Where we need to drop a piece"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1565444568164" ID="ID_1014414538" MODIFIED="1565444591921" TEXT="X-Hard: &quot;as hard as&quot; every problem belonging to X">
<node CREATED="1565444606115" ID="ID_1362789222" MODIFIED="1565444613325" TEXT="hardest problem in X"/>
</node>
<node CREATED="1565445351703" ID="ID_1377329439" MODIFIED="1565445358473" TEXT="X-complete">
<node CREATED="1565445358906" ID="ID_616197623" MODIFIED="1565445365553" TEXT="X-hard AND in X"/>
</node>
<node CREATED="1565445568334" ID="ID_1671344502" MODIFIED="1565445593998" TEXT="PSPACE = { problems solvable in polynomial space }">
<node CREATED="1565445600778" ID="ID_862980869" MODIFIED="1565445611459" TEXT="These problems are generally solvable in exponential time">
<node CREATED="1565445619039" ID="ID_322382819" MODIFIED="1565445635102" TEXT="If polynomial space, there are only exponential states of the machine"/>
</node>
</node>
<node CREATED="1565445700418" ID="ID_1130407014" MODIFIED="1565445704697" TEXT="Examples">
<node CREATED="1565445704919" ID="ID_1975594406" MODIFIED="1565445708857" TEXT="Rush Hour">
<node CREATED="1565445709206" ID="ID_1168884641" MODIFIED="1565445713522" TEXT="PSPACE-complete"/>
</node>
</node>
<node CREATED="1565445802297" ID="ID_576280264" MODIFIED="1565445806556" TEXT="Interleaving">
<node CREATED="1565445806847" ID="ID_1554748645" MODIFIED="1565445810316" TEXT="P Time"/>
<node CREATED="1565445822659" ID="ID_1644193810" MODIFIED="1565445825045" TEXT="NP"/>
<node CREATED="1565445810772" ID="ID_779971478" MODIFIED="1565445816628" TEXT="PSPACE"/>
<node CREATED="1565445826012" ID="ID_630906733" MODIFIED="1565445828828" TEXT="EXP">
<node CREATED="1565447450724" ID="ID_1806273388" MODIFIED="1565447493772" TEXT="SAT has no sub-exp algorithm">
<node CREATED="1565447477333" ID="ID_367988235" MODIFIED="1565447482758" TEXT="Nothing to o(n)"/>
</node>
</node>
<node CREATED="1565445829505" ID="ID_973533430" MODIFIED="1565445833661" TEXT="EXPSPACE"/>
<node CREATED="1565445836396" ID="ID_1072787036" MODIFIED="1565445841981" TEXT="Doubly EXP"/>
<node CREATED="1565445842463" ID="ID_1514785272" MODIFIED="1565445850796" TEXT="Doubly EXPSPACE"/>
</node>
<node CREATED="1565445887458" ID="ID_1651863034" MODIFIED="1565445892646" TEXT="PSPACE = NPSPACE">
<node CREATED="1565445902191" ID="ID_418718256" MODIFIED="1565445910455" TEXT="NP uses atmost polynomial space">
<node CREATED="1565445985894" ID="ID_1528103829" MODIFIED="1565445990936" TEXT="Rush Hour is in PSPACE"/>
</node>
</node>
<node CREATED="1565445994733" ID="ID_409511296" MODIFIED="1565445997705" TEXT="As hard as">
<node CREATED="1565446202145" ID="ID_1286255291" MODIFIED="1565446208670" TEXT="Reduction from A to B:">
<node CREATED="1565446218915" ID="ID_143318306" MODIFIED="1565446225584" TEXT="Algorithm">
<node CREATED="1565446226048" ID="ID_376159238" MODIFIED="1565446231174" TEXT="Usually poly-time"/>
<node CREATED="1565446243116" ID="ID_1791969671" MODIFIED="1565446268856" TEXT="It converts an instance (input) of A to an instance (input) of B problem">
<node CREATED="1565446271085" ID="ID_349655026" MODIFIED="1565446280652" TEXT="Such that solution to A = solution of B"/>
</node>
<node CREATED="1565446298860" ID="ID_1450691814" MODIFIED="1565446301072" TEXT="Why?">
<node CREATED="1565446301336" ID="ID_1085570152" MODIFIED="1565446305257" TEXT="If we can solve B">
<node CREATED="1565446306166" ID="ID_1602273245" MODIFIED="1565446309241" TEXT="Then we can solve A"/>
</node>
</node>
<node CREATED="1565446337457" ID="ID_1859527534" MODIFIED="1565446342152" TEXT="B is as hard as A">
<node CREATED="1565446357209" ID="ID_887220428" MODIFIED="1565446363642" TEXT="&quot;one-call&quot; reduction"/>
<node CREATED="1565446367835" ID="ID_1818495485" MODIFIED="1565446378706" TEXT="Karp-style reduction"/>
<node CREATED="1565446446076" ID="ID_1571508877" MODIFIED="1565446455027" TEXT="From existing problem"/>
</node>
<node CREATED="1565446488363" ID="ID_1629245347" MODIFIED="1565446491981" TEXT="Example in P">
<node CREATED="1565446492293" ID="ID_616214633" MODIFIED="1565446507863" TEXT="Reduce unwighted shorted path problem to weighted shortest path"/>
</node>
<node CREATED="1565446528334" ID="ID_1182779954" MODIFIED="1565446551483" TEXT="We are showing A is a special case of B">
<node CREATED="1565446566014" ID="ID_1169613626" MODIFIED="1565446573807" TEXT="B has at-least as many cases as in A"/>
</node>
<node CREATED="1565446606172" ID="ID_1471052899" MODIFIED="1565446610488" TEXT="Example">
<node CREATED="1565446610824" ID="ID_1472911048" MODIFIED="1565446627936" TEXT="Find a path with smallest product">
<node CREATED="1565446634693" ID="ID_848834239" MODIFIED="1565446640528" TEXT="Take log"/>
</node>
</node>
</node>
<node CREATED="1565446689576" ID="ID_604894585" MODIFIED="1565446708308" TEXT="if A -&gt; B &amp; A is X-hard then B is X-hard"/>
<node CREATED="1565446742971" ID="ID_1536652874" MODIFIED="1565446764442" TEXT="if B is in X, then A is in X"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1565441693650" ID="ID_1290211490" MODIFIED="1565441847877" TEXT="Recommended text books/ resources">
<node CREATED="1565441701842" ID="ID_1065731122" MODIFIED="1565441748646" TEXT="Computers and Intractability: A Guide to the Theory of NP-Completeness - Michael T. Garey"/>
<node CREATED="1565441763722" ID="ID_78068820" MODIFIED="1565441792122" TEXT="Games, Puzzles &amp; Computation: Eric Damaine">
<node CREATED="1565441794228" ID="ID_1248621411" MODIFIED="1565441799159" TEXT="E-Book available"/>
</node>
<node CREATED="1565441879666" ID="ID_153749854" MODIFIED="1565441885291" TEXT="NP-Completeness Columns"/>
<node CREATED="1565441830853" ID="ID_22324423" MODIFIED="1565441834768" TEXT="Complexity Zoo"/>
<node CREATED="1565441892416" ID="ID_881211108" MODIFIED="1565441903737" TEXT="A Compendium of NP Optimization Problems"/>
</node>
</node>
<node CREATED="1565423867034" ID="ID_525533761" MODIFIED="1565423873410" POSITION="left" TEXT="3-Partition I"/>
<node CREATED="1565423879873" ID="ID_1132640494" MODIFIED="1565423884563" POSITION="left" TEXT="3-Partition II"/>
<node CREATED="1565423888546" ID="ID_523422025" MODIFIED="1565423891194" POSITION="left" TEXT="SAT I"/>
<node CREATED="1565423895314" ID="ID_1574561464" MODIFIED="1565423898922" POSITION="left" TEXT="SAT Reductions"/>
<node CREATED="1565423902351" ID="ID_165846081" MODIFIED="1565423904987" POSITION="left" TEXT="Circuit SAT"/>
<node CREATED="1565423905237" ID="ID_239596853" MODIFIED="1565423910371" POSITION="left" TEXT="Planar SAT"/>
<node CREATED="1565423910627" ID="ID_1848266587" MODIFIED="1565423916795" POSITION="left" TEXT="Hamiltonicity"/>
<node CREATED="1565423917513" ID="ID_1251951087" MODIFIED="1565423922707" POSITION="left" TEXT="Graph Problems"/>
<node CREATED="1565423925738" ID="ID_965460710" MODIFIED="1565423934503" POSITION="left" TEXT="Inapproximability Overview"/>
<node CREATED="1565423937653" ID="ID_1692963271" MODIFIED="1565423943187" POSITION="left" TEXT="Inapproximability Examples"/>
<node CREATED="1565424040311" ID="ID_1776578632" MODIFIED="1565424051757" POSITION="left" TEXT="3 SUM and APSP Hardness"/>
<node CREATED="1565423952406" ID="ID_948194549" MODIFIED="1565423968597" POSITION="right" TEXT="Gaps and PCP"/>
<node CREATED="1565423969043" ID="ID_261320596" MODIFIED="1565423976279" POSITION="right" TEXT="W Hierarchy"/>
<node CREATED="1565423977524" ID="ID_353748813" MODIFIED="1565423982599" POSITION="right" TEXT="ETH and Planar FPT"/>
<node CREATED="1565423985874" ID="ID_1577682556" MODIFIED="1565423990309" POSITION="right" TEXT="#P and ASP"/>
<node CREATED="1565423991101" ID="ID_335775103" MODIFIED="1565423996315" POSITION="right" TEXT="NP and PSPACE Video Games"/>
<node CREATED="1565423996667" ID="ID_1082924357" MODIFIED="1565424007052" POSITION="right" TEXT="Nondeterministic Constraint Logic"/>
<node CREATED="1565424007256" ID="ID_464795919" MODIFIED="1565424015341" POSITION="right" TEXT="0- and 2-Player Games"/>
<node CREATED="1565424017995" ID="ID_1367833715" MODIFIED="1565424021653" POSITION="right" TEXT="Unbounded Games"/>
<node CREATED="1565424022627" ID="ID_133026762" MODIFIED="1565424029075" POSITION="right" TEXT="Undecidable and P-Complete"/>
<node CREATED="1565424058034" ID="ID_1297272107" MODIFIED="1565424060304" POSITION="right" TEXT="PPAD"/>
<node CREATED="1565424061332" ID="ID_1551964430" MODIFIED="1565424065047" POSITION="right" TEXT="PPAD Reductions"/>
</node>
</map>
