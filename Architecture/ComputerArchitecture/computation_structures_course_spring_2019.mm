<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1570438891618" ID="ID_1133246887" MODIFIED="1570438904037" TEXT="Computation Structures Course Spring 2019">
<node CREATED="1570438906315" ID="ID_430186735" MODIFIED="1570438909702" POSITION="right" TEXT="Introduction">
<node CREATED="1570440560276" ID="ID_1337668853" MODIFIED="1570440570935" TEXT="Focus: Design of General Purpose Processors">
<node CREATED="1570440586204" ID="ID_218215652" MODIFIED="1570440599705" TEXT="Microprocessors are the basic building block of computer systems">
<node CREATED="1570440600783" ID="ID_1690629587" MODIFIED="1570440615033" TEXT="Understanding them is crucial even if you do not plan to work as a hardware designer"/>
</node>
<node CREATED="1570440629328" ID="ID_895967730" MODIFIED="1570440641810" TEXT="Microprocessors are the most sophisticated digital systems that exist today">
<node CREATED="1570440642728" ID="ID_967091330" MODIFIED="1570440652205" TEXT="Understanding them will help you design all kinds of hardware">
<node CREATED="1570440655888" ID="ID_1836580900" MODIFIED="1570440676530" TEXT="Incorporates many techniques"/>
</node>
</node>
<node CREATED="1570440686858" ID="ID_1564727744" MODIFIED="1570440706291" TEXT="By the end of the term you would have designed many RISC-V processors from scratch!">
<node CREATED="1570440721496" ID="ID_844195657" MODIFIED="1570440726207" TEXT="They will all run the same software"/>
<node CREATED="1570440728062" ID="ID_1132930249" MODIFIED="1570440732118" TEXT="They are different internally">
<node CREATED="1570440735271" ID="ID_1844263077" MODIFIED="1570440737920" TEXT="Efficiency"/>
<node CREATED="1570440744219" ID="ID_1446654160" MODIFIED="1570440746590" TEXT="Low power"/>
</node>
</node>
</node>
<node CREATED="1570440754253" ID="ID_1056706555" MODIFIED="1570440759430" TEXT="General Purpose Processor">
<node CREATED="1570440760187" ID="ID_372541851" MODIFIED="1570440788490" TEXT="It would be highly desirable if the same hardware could execute programs written in Python, Java, C, or for that matter in any high-level language">
<node CREATED="1570440790571" ID="ID_1570998208" MODIFIED="1570440796430" TEXT="Hardware should be universal">
<node CREATED="1570440797251" ID="ID_1917948692" MODIFIED="1570440801009" TEXT="Not just for Python"/>
<node CREATED="1570440814359" ID="ID_1616532564" MODIFIED="1570440821081" TEXT="Should execute any HLL">
<node CREATED="1570440822633" ID="ID_1589308351" MODIFIED="1570440833053" TEXT="We don&apos;t pay attention to low level hardware"/>
</node>
<node CREATED="1570440846661" ID="ID_1353534722" MODIFIED="1570440850810" TEXT="New language should also run"/>
</node>
</node>
<node CREATED="1570440854098" ID="ID_1635547880" MODIFIED="1570440872021" TEXT="It is also not sensible to execute every feature of a high-level language directly in hardware">
<node CREATED="1570440873844" ID="ID_1896835343" MODIFIED="1570440880161" TEXT="Software is better for certain things"/>
<node CREATED="1570440880711" ID="ID_366043341" MODIFIED="1570440887741" TEXT="What is easy to do in hardware"/>
</node>
<node CREATED="1570440898792" ID="ID_1784324012" MODIFIED="1570440904956" TEXT="Machine (Assembly) Language">
<node CREATED="1570440907588" ID="ID_1287046181" MODIFIED="1570440919122" TEXT="Python, Java, C, Scheme, ... compile to this"/>
<node CREATED="1570440920335" ID="ID_342201701" MODIFIED="1570440926053" TEXT="Microprocessor understands this">
<node CREATED="1570440975237" ID="ID_1153911451" MODIFIED="1570440980619" TEXT="Direct Hardware execution"/>
</node>
<node CREATED="1570440930569" ID="ID_1831486247" MODIFIED="1570440937702" TEXT="This is the HW-SW interface">
<node CREATED="1570440942182" ID="ID_1060873901" MODIFIED="1570440947010" TEXT="We need to learn this interface"/>
<node CREATED="1570440950316" ID="ID_664125562" MODIFIED="1570440957324" TEXT="Designed extremely carefully"/>
<node CREATED="1570440962261" ID="ID_169813152" MODIFIED="1570440967232" TEXT="Log or research done"/>
</node>
<node CREATED="1570440984935" ID="ID_1071658058" MODIFIED="1570440991318" TEXT="It should be suitable for HLL">
<node CREATED="1570440997343" ID="ID_1989086146" MODIFIED="1570441002015" TEXT="HLL is translated to LLL"/>
</node>
<node CREATED="1570441041140" ID="ID_438629059" MODIFIED="1570441045885" TEXT="Isolates HLL from Hardware"/>
</node>
</node>
<node CREATED="1570441065333" ID="ID_1933289132" MODIFIED="1570441067558" TEXT="Some facts">
<node CREATED="1570441068348" ID="ID_117929150" MODIFIED="1570441084833" TEXT="All modern electronic computers are digital, i.e, compute with 1s and 0s">
<node CREATED="1570441091939" ID="ID_226628938" MODIFIED="1570441094351" TEXT="More resilient"/>
<node CREATED="1570441094870" ID="ID_581774396" MODIFIED="1570441100254" TEXT="Mathematically more efficient"/>
<node CREATED="1570441104413" ID="ID_1342230519" MODIFIED="1570441107806" TEXT="Good at building it"/>
</node>
<node CREATED="1570441110886" ID="ID_936812600" MODIFIED="1570441127574" TEXT="All the information is converted into binary form and all operations are carried out on these binary forms"/>
<node CREATED="1570441128648" ID="ID_976821889" MODIFIED="1570441151302" TEXT="It is possible to implement simple operations like +, &gt;, AND, etc. on binary numbers in hardware super efficiently"/>
</node>
</node>
<node CREATED="1570438911792" ID="ID_554215305" MODIFIED="1570438917367" POSITION="left" TEXT="RISC-V Assembly"/>
<node CREATED="1570438918143" ID="ID_1208728853" MODIFIED="1570438928556" POSITION="right" TEXT="Compiling Code, Procedures, and Stacks"/>
<node CREATED="1570438929303" ID="ID_625812190" MODIFIED="1570438933654" POSITION="left" TEXT="Procedures and MMIO"/>
<node CREATED="1570438934246" ID="ID_1979956756" MODIFIED="1570438937742" POSITION="right" TEXT="Combinational Logic"/>
<node CREATED="1570438938339" ID="ID_1665305302" MODIFIED="1570438948303" POSITION="left" TEXT="Barrel Shifter, Boolean Optimizations, and Logic"/>
<node CREATED="1570438949014" ID="ID_1110080540" MODIFIED="1570438962204" POSITION="right" TEXT="Complex Combinational Circuits in Bluespec"/>
<node CREATED="1570438963519" ID="ID_476333980" MODIFIED="1570438972382" POSITION="left" TEXT="Design Tradeoffs in Arithmetic Circuits"/>
<node CREATED="1570438974087" ID="ID_1362622601" MODIFIED="1570438978935" POSITION="right" TEXT="Sequential Circuits"/>
<node CREATED="1570438981511" ID="ID_1563272102" MODIFIED="1570439008472" POSITION="left" TEXT="Sequential Circuits: Modules with Guarded Interfaces"/>
<node CREATED="1570439010783" ID="ID_1730805459" MODIFIED="1570439017772" POSITION="right" TEXT="Hardware Synthesis in Bluespec"/>
<node CREATED="1570439020524" ID="ID_1332962136" MODIFIED="1570439026598" POSITION="left" TEXT="Module Interfaces and Concurrency"/>
<node CREATED="1570439027376" ID="ID_143352903" MODIFIED="1570439036622" POSITION="right" TEXT="Implementing RISC-V Processor in Hardware"/>
<node CREATED="1570439039120" ID="ID_486415446" MODIFIED="1570439045168" POSITION="left" TEXT="Multicycle Processors"/>
<node CREATED="1570439046248" ID="ID_1945260343" MODIFIED="1570439050384" POSITION="right" TEXT="The Memory Hierarchy"/>
<node CREATED="1570439052777" ID="ID_1158413041" MODIFIED="1570439059173" POSITION="left" TEXT="Memory Systems: Design and Implementation"/>
<node CREATED="1570439059960" ID="ID_1135697528" MODIFIED="1570439065136" POSITION="right" TEXT="Operating Systems"/>
<node CREATED="1570439065809" ID="ID_1305872688" MODIFIED="1570439069216" POSITION="left" TEXT="Virtual Memory"/>
<node CREATED="1570439069846" ID="ID_1182501336" MODIFIED="1570439074789" POSITION="right" TEXT="Introduction to Pipelining"/>
<node CREATED="1570439075425" ID="ID_649835535" MODIFIED="1570439080729" POSITION="left" TEXT="Processor Pipelining"/>
<node CREATED="1570439083497" ID="ID_1028089288" MODIFIED="1570439088785" POSITION="right" TEXT="Implementing Pipelines"/>
<node CREATED="1570439089401" ID="ID_1351657016" MODIFIED="1570439093105" POSITION="left" TEXT="Synchronization"/>
<node CREATED="1570439093646" ID="ID_235847428" MODIFIED="1570439101513" POSITION="right" TEXT="Implementing Processor Pipelines"/>
<node CREATED="1570439102841" ID="ID_356527345" MODIFIED="1570439110847" POSITION="left" TEXT="The Digital Abstraction and Sequential Timing"/>
<node CREATED="1570439111393" ID="ID_1716933023" MODIFIED="1570439115344" POSITION="right" TEXT="Cache Coherence"/>
<node CREATED="1570439118501" ID="ID_562714443" MODIFIED="1570439125856" POSITION="left" TEXT="Overlord - AInz vs Shalltear"/>
</node>
</map>
