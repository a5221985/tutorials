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
<node CREATED="1565441934228" ID="ID_1467992035" MODIFIED="1565443580712">
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
<node CREATED="1565442147926" ID="ID_1424898530" MODIFIED="1565442697841">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      -------------------------------&gt; &quot;computational difficulty&quot;
    </p>
    <p>
      |&#160;&#160;p&#160;&#160;|
    </p>
    <p>
      |&#160;&#160;&#160;&#160;&#160;&#160;NP&#160;&#160;&#160;&#160;&#160;&#160;&#160;|
    </p>
    <p>
      |&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;exp&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|
    </p>
    <p>
      |&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;R&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;|
    </p>
    <p>
      
    </p>
    <p>
      Anything that can be solved in P time can be solved in exp time etc...
    </p>
  </body>
</html>
</richcontent>
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
