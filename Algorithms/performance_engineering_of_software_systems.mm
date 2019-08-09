<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1565370315166" ID="ID_1718067867" MODIFIED="1565370329974" TEXT="Performance Engineering of Software Systems">
<node CREATED="1565370690597" ID="ID_270187223" MODIFIED="1565370696897" POSITION="right" TEXT="Motivation">
<node CREATED="1565370696898" ID="ID_861886790" MODIFIED="1565370704638" TEXT="Why does performance matter?">
<node CREATED="1565370705577" ID="ID_564068341" MODIFIED="1565370710805" TEXT="Matrix Multiply">
<node CREATED="1565370722143" ID="ID_729820792" MODIFIED="1565370724031" TEXT="Process"/>
<node CREATED="1565370751922" ID="ID_1709584779" MODIFIED="1565370977524" TEXT="Matrix mutiply is a fundamental operation in many computations - video encoding, weather simulation,&#xa;&#xa;for (int i = 0; i &lt; x; i++)&#xa;    for (int j = 0; j &lt; y; j++)&#xa;        for (int k = 0; k &lt; z; k++)&#xa;            A[i][j] = B[i][k] * C[k][j]">
<node CREATED="1565370998739" ID="ID_1486809919" MODIFIED="1565371013903" TEXT="Object oriented programming approach">
<node CREATED="1565371013904" ID="ID_262181606" MODIFIED="1565371020296" TEXT="Immutable classes"/>
<node CREATED="1565371022886" ID="ID_120563635" MODIFIED="1565371028823" TEXT="Represent integers and doubles">
<node CREATED="1565371112954" ID="ID_1441166485" MODIFIED="1565371116929" TEXT="Martix">
<node CREATED="1565371118193" ID="ID_1374300127" MODIFIED="1565371121690" TEXT="MatrixRow">
<node CREATED="1565371125758" ID="ID_320171718" MODIFIED="1565371127845" TEXT="IntegerRow"/>
<node CREATED="1565371128286" ID="ID_916178622" MODIFIED="1565371131549" TEXT="DoubleRow"/>
</node>
<node CREATED="1565371135303" ID="ID_1674084560" MODIFIED="1565371137677" TEXT="Value"/>
</node>
</node>
<node CREATED="1565371178023" ID="ID_1708754433" MODIFIED="1565371181744" TEXT="Code">
<node CREATED="1565371183108" ID="ID_1822518525" MODIFIED="1565371380274" TEXT="public class Value {&#xa;    final MatrixType type;&#xa;    final int iVal;&#xa;    final double dVal;&#xa;&#xa;    Value(int i) {}&#xa;&#xa;    Value(double d) {&#xa;        type = MatrixType.FLOATING_POINT;&#xa;        dVal = d;&#xa;        iVal = 0;&#xa;    }&#xa;&#xa;    int getInt() throws Exception {}&#xa;&#xa;    double getDouble() throws Exception {&#xa;        if (type == MatrixType.FLOATING_POINT;&#xa;            return dVal;&#xa;        else&#xa;            throw new Exception();&#xa;    }"/>
<node CREATED="1565371416355" ID="ID_962274256" MODIFIED="1565371604970">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      public class Matrix {
    </p>
    <p>
      &#160;&#160;&#160;&#160;final MatrixRow[] rows;
    </p>
    <p>
      &#160;&#160;&#160;&#160;final int nRows, nColumns;
    </p>
    <p>
      &#160;&#160;&#160;&#160;final MatrixType type;
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;Matrix (int rows, int cols, MatrixType type) {
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;this.type = type;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;this.nRows = rows;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;this.nColumns = cols;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;for (int i = 0; i &lt; this.nRows; i++)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;this.rows[i] = (type == MatrixType.INTEGER)? new IntegerRow(this.nColumns): new DoubleRow(this.nColumns);<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;}
    </p>
    <p>
      &#160;&#160;&#160;&#160;}
    </p>
    <p>
      }<br />
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1565371953038" ID="ID_1196357300" MODIFIED="1565372044567" TEXT="Update">
<node CREATED="1565371956082" ID="ID_383679276" MODIFIED="1565371972142" TEXT="New Matrix needs to be created"/>
</node>
</node>
<node CREATED="1565372017674" ID="ID_911394866" MODIFIED="1565372023841" TEXT="Is the performance good?">
<node CREATED="1565372028353" ID="ID_791600737" MODIFIED="1565372057152" TEXT="Knowing that we have a problem is a huge win">
<node CREATED="1565372729968" ID="ID_267026482" MODIFIED="1565372745845" TEXT="1024 * 1024 - 5 hours"/>
<node CREATED="1565372767377" ID="ID_1365931421" MODIFIED="1565372776532" TEXT="6 ops per multiply">
<node CREATED="1565372777281" ID="ID_1033707308" MODIFIED="1565372786794" TEXT="add and 3 index updates"/>
</node>
<node CREATED="1565372811445" ID="ID_826145755" MODIFIED="1565372843462" TEXT="8358 cycles per each visible operation"/>
</node>
<node CREATED="1565372864092" ID="ID_1970087987" MODIFIED="1565372983521" TEXT="Back of the envelope calculation">
<node CREATED="1565372984040" ID="ID_532683519" MODIFIED="1565373003804" TEXT="We can get a feel for where we stand that we are way off"/>
</node>
</node>
<node CREATED="1565372892217" ID="ID_1212169730" MODIFIED="1565372895441" TEXT="Solution">
<node CREATED="1565372895844" ID="ID_509635236" MODIFIED="1565372897912" TEXT="Profiling">
<node CREATED="1565372905783" ID="ID_1070146641" MODIFIED="1565372925442" TEXT="Look deeply into the program execution and find out where you are spending your time">
<node CREATED="1565372926181" ID="ID_1038328264" MODIFIED="1565372929041" TEXT="By method"/>
<node CREATED="1565372929290" ID="ID_938779109" MODIFIED="1565372931393" TEXT="By line"/>
</node>
<node CREATED="1565372968311" ID="ID_118108029" MODIFIED="1565373039036" TEXT="Find culprits">
<node CREATED="1565373039481" ID="ID_208504812" MODIFIED="1565373047749" TEXT="Easy way of triaging the problem"/>
</node>
<node CREATED="1565373058949" ID="ID_1355426616" MODIFIED="1565373065049" TEXT="Interesting information">
<node CREATED="1565373065374" ID="ID_1386472380" MODIFIED="1565373069297" TEXT="Time spent"/>
<node CREATED="1565373069943" ID="ID_399449327" MODIFIED="1565373075465" TEXT="Cumulative time spent"/>
<node CREATED="1565373076385" ID="ID_1443908858" MODIFIED="1565373079490" TEXT="Number of invocations"/>
<node CREATED="1565373080005" ID="ID_190262785" MODIFIED="1565373081953" TEXT="..."/>
</node>
<node CREATED="1565373099076" ID="ID_1606982273" MODIFIED="1565373114141" TEXT="It is a great way to zero in on what matters - Hotspots">
<node CREATED="1565373116380" ID="ID_801120112" MODIFIED="1565373145474" TEXT="If 90% time is in one routine, inefficiencies in the rest of the program doesn&apos;t matter"/>
<node CREATED="1565373145722" ID="ID_1473217185" MODIFIED="1565373170403" TEXT="Are the hotspots doing what they are expected to do?"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</map>
