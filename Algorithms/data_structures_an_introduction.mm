<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1566197217632" ID="ID_556969350" MODIFIED="1566197386270" TEXT="Data Structures an Introduction">
<node CREATED="1566197252373" ID="ID_464704206" MODIFIED="1566197259623" POSITION="right" TEXT="Section 1: Introduction">
<node CREATED="1566197395904" ID="ID_683410589" MODIFIED="1566197410154" TEXT="What is a Data Structure?">
<node CREATED="1566197411297" ID="ID_1969956520" MODIFIED="1566197433650" TEXT="A data structure (DS) is a way of organizing data so that it can be used effectively">
<node CREATED="1566197453859" ID="ID_643181285" MODIFIED="1566197460970" TEXT="CRUD quickly and easily"/>
</node>
</node>
<node CREATED="1566197463188" ID="ID_252141143" MODIFIED="1566197467601" TEXT="Why Data Structures?">
<node CREATED="1566197474602" ID="ID_1138256410" MODIFIED="1566197488787" TEXT="They are essential ingredients in constructing fast and powerful algorithms"/>
<node CREATED="1566197492702" ID="ID_1736306619" MODIFIED="1566197499642" TEXT="They help to manage and organize data">
<node CREATED="1566197533934" ID="ID_842995807" MODIFIED="1566197536337" TEXT="Natural way"/>
</node>
<node CREATED="1566197501870" ID="ID_1263391578" MODIFIED="1566197512276" TEXT="They make code cleaner and easier to understand">
<node CREATED="1566197548836" ID="ID_531073462" MODIFIED="1566197571343" TEXT="Best programmers know how and when to use the appropriate data structure">
<node CREATED="1566197584356" ID="ID_628505518" MODIFIED="1566197608514" TEXT="Differentiates between outstanding program and mediocre program"/>
</node>
</node>
</node>
<node CREATED="1566197623665" ID="ID_1723338526" MODIFIED="1566197632489" TEXT="Abstract Data Types vs. Data Structures">
<node CREATED="1566197634054" ID="ID_26025262" MODIFIED="1566197638746" TEXT="Abstract Data Type">
<node CREATED="1566197641921" ID="ID_1834098109" MODIFIED="1566197712297" TEXT="An abstract data type (ADT) is an abstraction of a data structure which provides only the interface to which a data structure must adhere to."/>
<node CREATED="1566197726606" ID="ID_1205214095" MODIFIED="1566197754250" TEXT="Interface does not give any specific details about how something should be implemented or in what programming language">
<node CREATED="1566197781569" ID="ID_416365885" MODIFIED="1566197929819" TEXT="Example:">
<node CREATED="1566197784929" ID="ID_1144571860" MODIFIED="1566197925112" TEXT="Motor transportation (ADT)">
<node CREATED="1566197799588" ID="ID_1790995194" MODIFIED="1566197803465" TEXT="Modes or transportation">
<node CREATED="1566197804787" ID="ID_711608430" MODIFIED="1566197903294" TEXT="Walking (data structure)"/>
<node CREATED="1566197807002" ID="ID_1896006024" MODIFIED="1566197808897" TEXT="Biking"/>
<node CREATED="1566197809174" ID="ID_1198459029" MODIFIED="1566197811812" TEXT="Train"/>
</node>
</node>
</node>
<node CREATED="1566197942542" ID="ID_661883879" MODIFIED="1566197945872" TEXT="Examples">
<node CREATED="1566197947683" ID="ID_527477138" MODIFIED="1566197954124" TEXT="Abstraction (ADT)">
<node CREATED="1566197966151" ID="ID_1681627057" MODIFIED="1566197967890" TEXT="List"/>
<node CREATED="1566197968201" ID="ID_1558588051" MODIFIED="1566197969904" TEXT="Queue"/>
<node CREATED="1566197970373" ID="ID_605061990" MODIFIED="1566197971328" TEXT="Map"/>
<node CREATED="1566197971547" ID="ID_922951041" MODIFIED="1566197973544" TEXT="Vehicle"/>
</node>
<node CREATED="1566197954808" ID="ID_396753785" MODIFIED="1566197963752" TEXT="Implementation (DS)">
<node CREATED="1566197998932" ID="ID_303758415" MODIFIED="1566198000204" TEXT="List">
<node CREATED="1566198001415" ID="ID_1901834493" MODIFIED="1566198004673" TEXT="Dynamic Array">
<node CREATED="1566198120184" ID="ID_1297389026" MODIFIED="1566198126818" TEXT="CRUD on elements"/>
</node>
<node CREATED="1566198004938" ID="ID_1062876491" MODIFIED="1566198009190" TEXT="Linked List">
<node CREATED="1566198128932" ID="ID_1151707816" MODIFIED="1566198131537" TEXT="CRUD on elements"/>
</node>
</node>
<node CREATED="1566198010486" ID="ID_1832281810" MODIFIED="1566198012460" TEXT="Queue">
<node CREATED="1566198013641" ID="ID_1938419739" MODIFIED="1566198019375" TEXT="Linked List based Queue"/>
<node CREATED="1566198019866" ID="ID_1416874171" MODIFIED="1566198024384" TEXT="Array based Queue"/>
<node CREATED="1566198024654" ID="ID_1606390169" MODIFIED="1566198028328" TEXT="Stack based Queue">
<node CREATED="1566198191805" ID="ID_1911293237" MODIFIED="1566198196279" TEXT="Not very efficient"/>
</node>
</node>
<node CREATED="1566198029797" ID="ID_1265076867" MODIFIED="1566198030709" TEXT="Map">
<node CREATED="1566198032375" ID="ID_1525366928" MODIFIED="1566198034439" TEXT="Tree Map"/>
<node CREATED="1566198034641" ID="ID_770105619" MODIFIED="1566198040391" TEXT="Hash Map/ Hash Table"/>
</node>
<node CREATED="1566198041569" ID="ID_990248574" MODIFIED="1566198043167" TEXT="Vehicle">
<node CREATED="1566198044370" ID="ID_627097823" MODIFIED="1566198047075" TEXT="Golf Cart"/>
<node CREATED="1566198047288" ID="ID_934749524" MODIFIED="1566198049699" TEXT="Bicycle"/>
<node CREATED="1566198049895" ID="ID_1351481121" MODIFIED="1566198052454" TEXT="Smart Car"/>
</node>
</node>
</node>
</node>
<node CREATED="1566198214356" ID="ID_85741363" MODIFIED="1566198227335" TEXT="It defines how a data structure should behave and what methods it should have">
<node CREATED="1566198238838" ID="ID_380586691" MODIFIED="1566198246187" TEXT="Not how the methods are implemented"/>
</node>
</node>
</node>
</node>
<node CREATED="1566197266752" ID="ID_319202765" MODIFIED="1566197274258" POSITION="left" TEXT="Section 2: Static and Dynamic Arrays">
<node CREATED="1566198260550" ID="ID_1096094062" MODIFIED="1566198266530" TEXT="Computational Complexity Analysis">
<node CREATED="1566198270061" ID="ID_754204145" MODIFIED="1566198272051" TEXT="Performance"/>
<node CREATED="1566198274897" ID="ID_1370292680" MODIFIED="1566198285334" TEXT="Complexity Analysis">
<node CREATED="1566198286607" ID="ID_729403749" MODIFIED="1566198303319" TEXT="As programmers, we often find ourselves asking the same two questions over and over again:">
<node CREATED="1566198305066" ID="ID_985947810" MODIFIED="1566203020959">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      How much <b>time</b>&#160;does this algorithm need to finish?
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1566203065098" ID="ID_207052074" MODIFIED="1566203078671" TEXT="If algorithm takes lifetime of universe to complete it is no good"/>
<node CREATED="1566203129992" ID="ID_1220697796" MODIFIED="1566203135235" TEXT="Big-O Notation">
<node CREATED="1566203140319" ID="ID_1073958637" MODIFIED="1566203234782" TEXT="Big-O Notation gives an upper bound of the complexity in the worst case, helping to quantify performance as the input size becomes arbitrarily large.">
<node CREATED="1566203292456" ID="ID_236651934" MODIFIED="1566203297750" TEXT="worst case only">
<node CREATED="1566203302094" ID="ID_1145371620" MODIFIED="1566203303950" TEXT="Example">
<node CREATED="1566203304955" ID="ID_424536427" MODIFIED="1566203307250" TEXT="Sort"/>
<node CREATED="1566203336879" ID="ID_836406397" MODIFIED="1566203339158" TEXT="Search">
<node CREATED="1566203340287" ID="ID_82046860" MODIFIED="1566203345544" TEXT="Randomly arranged elements">
<node CREATED="1566203346365" ID="ID_1778583527" MODIFIED="1566203349782" TEXT="O(n)"/>
</node>
</node>
</node>
<node CREATED="1566203386493" ID="ID_1088412820" MODIFIED="1566203399438" TEXT="n - The size of the input">
<node CREATED="1566203401283" ID="ID_1957265799" MODIFIED="1566203412059" TEXT="Complexities ordered in from smallest to largest">
<node CREATED="1566203413052" ID="ID_1966936565" MODIFIED="1566203419461" TEXT="Constant Time: O(1)"/>
<node CREATED="1566203420003" ID="ID_1210759593" MODIFIED="1566203430450" TEXT="Logarithmic Time: O(log(n))"/>
<node CREATED="1566203430898" ID="ID_1702183041" MODIFIED="1566203438316" TEXT="Linear Time: O(n)"/>
<node CREATED="1566203438893" ID="ID_1349993364" MODIFIED="1566203454846" TEXT="Linearithmic Time: O(nlog(n))"/>
<node CREATED="1566203455400" ID="ID_90731520" MODIFIED="1566203467234" TEXT="Quadratic Time: O(n^2)"/>
<node CREATED="1566203467822" ID="ID_1615096796" MODIFIED="1566203477731" TEXT="Cubic Time: O(n^3)"/>
<node CREATED="1566203481342" ID="ID_785114559" MODIFIED="1566203494953" TEXT="Exponential Time: O(b^n), b &gt; 1"/>
<node CREATED="1566203495645" ID="ID_1309608680" MODIFIED="1566203504350" TEXT="Factorial Time: O(n!)"/>
</node>
<node CREATED="1566203561226" ID="ID_1380544244" MODIFIED="1566203594895" TEXT="Multiplicative factors and other constants are ignored">
<node CREATED="1566203680861" ID="ID_1047746356" MODIFIED="1566203685765" TEXT="Big-O Properties">
<node CREATED="1566203687119" ID="ID_1435700115" MODIFIED="1566203693067" TEXT="O(n + c) = O(n)"/>
<node CREATED="1566203693352" ID="ID_794468221" MODIFIED="1566203700227" TEXT="O(cn) = O(n), c &gt; 0"/>
<node CREATED="1566203703042" ID="ID_1932561836" MODIFIED="1566203730679" TEXT="Let f be a function that describes the running time of a particular algorithm for an input of size n:">
<node CREATED="1566203732245" ID="ID_202917891" MODIFIED="1566203753206" TEXT="f(n) = 7log(n)^3 + 15n^2 + 2n^3 + 8">
<node CREATED="1566203755291" ID="ID_1358566233" MODIFIED="1566203763317" TEXT="O(f(n)) = O(n^3)">
<node CREATED="1566203800236" ID="ID_582661488" MODIFIED="1566203804386" TEXT="When n -&gt; infinty">
<node CREATED="1566203814442" ID="ID_1698206981" MODIFIED="1566203835167" TEXT="multiply factor or add constant to infinity then the result is still infinity"/>
</node>
</node>
</node>
<node CREATED="1566205083071" ID="ID_1710158350" MODIFIED="1566205088329" TEXT="Examples">
<node CREATED="1566205089413" ID="ID_1320378273" MODIFIED="1566205098471" TEXT="Constant time: O(1)">
<node CREATED="1566205100269" ID="ID_1849554903" MODIFIED="1566205125082">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      a := 1
    </p>
    <p>
      b := 2
    </p>
    <p>
      c := a + 5 * b
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1566205126831" ID="ID_580809276" MODIFIED="1566205142661">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      i := 0
    </p>
    <p>
      while i &lt; 11 Do
    </p>
    <p>
      &#160;&#160;&#160;&#160;i = i + 1
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1566205167932" ID="ID_1674224139" MODIFIED="1566205172242" TEXT="Does not depend on n"/>
</node>
</node>
<node CREATED="1566205197466" ID="ID_1585750151" MODIFIED="1566205202638" TEXT="Linear time: O(n)">
<node CREATED="1566205204107" ID="ID_22003612" MODIFIED="1566205235567">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      i := 0
    </p>
    <p>
      While i &lt; n Do
    </p>
    <p>
      &#160;&#160;&#160;&#160;i = i + 1
    </p>
    <p>
      
    </p>
    <p>
      f(n) = n
    </p>
    <p>
      O(f(n)) = O(n)
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1566205237041" ID="ID_156709972" MODIFIED="1566205269576">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      i := 0
    </p>
    <p>
      While i &lt; n Do
    </p>
    <p>
      &#160;&#160;&#160;&#160;i = i + 3
    </p>
    <p>
      
    </p>
    <p>
      f(n) = n/3
    </p>
    <p>
      O(f(n)) = O(n)
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1566205322331" ID="ID_1931717442" MODIFIED="1566205340846" TEXT="Quadratic time: O(n^2)">
<node CREATED="1566205362842" ID="ID_75750156" MODIFIED="1566205425229">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      For (i := 0; i &lt; n; i = i + 1)
    </p>
    <p>
      &#160;&#160;&#160;&#160;For (j := 0; j &lt; n; j = j + 1)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;
    </p>
    <p>
      f(n) = n * n = n^2
    </p>
    <p>
      O(f(n)) = O(n^2)
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1566205428289" ID="ID_1353233104" MODIFIED="1566205519374">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      For (i := 0; i &lt; n; i = i + 1)
    </p>
    <p>
      &#160;&#160;&#160;&#160;For (j := i; j &lt; n; j++)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;
    </p>
    <p>
      f(n) = n + n - 1 + n - 2 + .... + 1
    </p>
    <p>
      f(n) = n(n + 1) / 2 = O(n^2)
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1566206428992" ID="ID_1470268946" MODIFIED="1566206506742">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      i := 0
    </p>
    <p>
      While i &lt; n Do
    </p>
    <p>
      &#160;&#160;&#160;&#160;j =0
    </p>
    <p>
      &#160;&#160;&#160;&#160;While j &lt; 3 * n Do
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;j = j + 1
    </p>
    <p>
      &#160;&#160;&#160;&#160;j = 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;While j &lt; 2 * n Do
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;j = j + 1
    </p>
    <p>
      &#160;&#160;&#160;&#160;i = i + 1
    </p>
    <p>
      
    </p>
    <p>
      f(n) = n * (3n + 2n) = 5n^2
    </p>
    <p>
      O(f(n)) = O(n^2)
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1566205665165" ID="ID_684180572" MODIFIED="1566205675796" TEXT="Logarithmic: O(log(n))">
<node CREATED="1566205688574" ID="ID_853974240" MODIFIED="1566205858788" TEXT="Suppose we have a sorted array and we want to find the index of a particular value in the array, if it exists. What is the time complexity of the following algorithm?">
<node CREATED="1566205860402" ID="ID_892861549" MODIFIED="1566205946937">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      low := 0
    </p>
    <p>
      high := n - 1
    </p>
    <p>
      While low &lt;= high Do
    </p>
    <p>
      &#160;&#160;&#160;&#160;mid := (low + high) / 2
    </p>
    <p>
      &#160;
    </p>
    <p>
      &#160;&#160;&#160;&#160;If array[mid] == value: return mid
    </p>
    <p>
      &#160;&#160;&#160;&#160;Else If array[mid] &lt; value: lo = mid + 1
    </p>
    <p>
      &#160;&#160;&#160;&#160;Else if array[mid] &gt; value: hi = mid - 1
    </p>
    <p>
      
    </p>
    <p>
      return -1 // Value not found
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1566206226864" ID="ID_1612786329" MODIFIED="1566206400824">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      n, n/2, n/2^2, n/2^3, .... n/2^k
    </p>
    <p>
      n/2^k = 1
    </p>
    <p>
      2^k = n
    </p>
    <p>
      log_2(2^k) = log_2(n)
    </p>
    <p>
      k = log_2(n)
    </p>
    <p>
      
    </p>
    <p>
      f(n) = f(n/2) + c
    </p>
    <p>
      O(f(n)) = O(log(n))
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
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1566198314272" ID="ID_1809127098" MODIFIED="1566203012499">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      How much <b>space</b>&#160;does this algorithm need for its computation?
    </p>
  </body>
</html>
</richcontent>
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1566203098106" ID="ID_507989585" MODIFIED="1566203119008" TEXT="If algorithm takes up all the bytes in the computer and the entire internet, it is useless"/>
<node CREATED="1566203360985" ID="ID_922559866" MODIFIED="1566203366327" TEXT="Big-O Notation"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1566197275391" ID="ID_305857712" MODIFIED="1566197282537" POSITION="right" TEXT="Section 3: Linked Lists"/>
<node CREATED="1566197283900" ID="ID_86889199" MODIFIED="1566197289506" POSITION="left" TEXT="Section 4: Stacks"/>
<node CREATED="1566197290757" ID="ID_1489315291" MODIFIED="1566197295684" POSITION="right" TEXT="Section 5: Queues"/>
<node CREATED="1566197297933" ID="ID_1188082753" MODIFIED="1566197307988" POSITION="left" TEXT="Section 6: Priority Queues"/>
<node CREATED="1566197309189" ID="ID_1071548486" MODIFIED="1566197320677" POSITION="right" TEXT="Section 7: Union Find/ Disjoint Set"/>
<node CREATED="1566197321957" ID="ID_1394071926" MODIFIED="1566197330290" POSITION="left" TEXT="Section 8: Binary Search Trees"/>
<node CREATED="1566197331396" ID="ID_853716125" MODIFIED="1566197337168" POSITION="right" TEXT="Section 9: Hash Tables"/>
<node CREATED="1566197338487" ID="ID_1552422169" MODIFIED="1566197350012" POSITION="left" TEXT="Section 10: Fenwick Tree/ Binary Indexed Tree"/>
<node CREATED="1566197352242" ID="ID_163578906" MODIFIED="1566197363554" POSITION="right" TEXT="Section 11: AVL Tree"/>
<node CREATED="1566197368045" ID="ID_1501679824" MODIFIED="1566197376493" POSITION="left" TEXT="Section 12: Indexed Priority Queue"/>
</node>
</map>
