<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1567936801753" ID="ID_359352354" MODIFIED="1567936820652" TEXT="Mulricore Memory Caching Issues - Cache Coherency">
<node CREATED="1567936835921" ID="ID_1721964252" MODIFIED="1567936844301" POSITION="right" TEXT="Symmetric MultProcessing">
<node CREATED="1567936846663" ID="ID_806828687" MODIFIED="1567936859395" TEXT="Each processor in an SMP has equal access to all parts of memory">
<node CREATED="1567936862920" ID="ID_581310156" MODIFIED="1567936870962" TEXT="same letency and bandwidth">
<node CREATED="1567936914000" ID="ID_1898403168" MODIFIED="1567936920454" TEXT="Bus/Interconnect is common"/>
</node>
</node>
<node CREATED="1567936961761" ID="ID_654830867" MODIFIED="1567936971453" TEXT="Single core processors"/>
</node>
<node CREATED="1567936979291" ID="ID_1774320099" MODIFIED="1567936984741" POSITION="left" TEXT="Multicore chips">
<node CREATED="1567936988585" ID="ID_1463526292" MODIFIED="1567937010106" TEXT="Now possible (and economically desirable) to place multiple processors on a chip"/>
<node CREATED="1567937030101" ID="ID_1775810895" MODIFIED="1567937042611" TEXT="From a programming perspective, this is largely irrelevant">
<node CREATED="1567937044997" ID="ID_589065456" MODIFIED="1567937056876" TEXT="simply a convenient way to build a small SMP">
<node CREATED="1567937137750" ID="ID_451173722" MODIFIED="1567937146144" TEXT="letency is lower and speed is higher"/>
</node>
<node CREATED="1567937058008" ID="ID_1795960677" MODIFIED="1567937067386" TEXT="on-chip buses can have very high bandwidth"/>
</node>
<node CREATED="1567937072736" ID="ID_1930372171" MODIFIED="1567937082236" TEXT="Main difference is that processors may share caches"/>
<node CREATED="1567937085602" ID="ID_1284214342" MODIFIED="1567937109873" TEXT="Typically, each core has its own level 1 and level 2 caches, but the level 3 cache is shared between cores"/>
<node CREATED="1567937295424" ID="ID_1870924601" MODIFIED="1567937319998" TEXT="This means that multiple cores on the same chip can communicate with low latency and high bandwidth">
<node CREATED="1567937322441" ID="ID_1486672923" MODIFIED="1567937334611" TEXT="via reads and writes which are cached in the shared cache"/>
</node>
<node CREATED="1567937338184" ID="ID_414355055" MODIFIED="1567937348932" TEXT="However, cores contend for space in hte shared cache">
<node CREATED="1567937350409" ID="ID_1335783414" MODIFIED="1567937370961" TEXT="one thread may suffer capacity and/or conflict misses caused by threads/processes on another core"/>
<node CREATED="1567937372155" ID="ID_936393832" MODIFIED="1567937383877" TEXT="harder to have precise control over what data is in the cache"/>
<node CREATED="1567937385034" ID="ID_1279769828" MODIFIED="1567937399870" TEXT="if only single core is running, then it may have access to the whole shared cache"/>
</node>
<node CREATED="1567937401916" ID="ID_1240641736" MODIFIED="1567937412028" TEXT="Cores also have to share off-chip bandwidth">
<node CREATED="1567937413539" ID="ID_214841320" MODIFIED="1567937417397" TEXT="for access to main memory"/>
</node>
</node>
</node>
</map>
