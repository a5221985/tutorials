# On Pair Programming #
1. It pays of more in the medium and long-term
2. It is not as simple as two people working on the same computer
3. It is vital for collaborative teamwork and high quality software
4. Best programs and designs could be done by pairs
	1. We can criticise each other
	2. We can find each other's errors
	3. We can use the best ideas
5. Write all prod programs with two peaple sitting on one machine
	1. Kent Beck
6. Extreme programming - Kent Beck
	1. Pairing was introduced to wider audience
7. Pair programming:
	1. Two people write code together on one machine
	2. It involves a lot of communication
	3. They plan and discuss their work
	4. They clarify ideas on the way
	5. They discuss approaches and come to better solutions
8. [How to Pair](https://martinfowler.com/articles/on-pair-programming.html#HowToPair)
	1. Practical approaches to pair programming
	2. For starters or for betterment
9. [Benefits](https://martinfowler.com/articles/on-pair-programming.html#Benefits), [Challenges](https://martinfowler.com/articles/on-pair-programming.html#Challenges)
	1. Dive deeper into the
		1. Goals of pair programming
		2. Challenges that can keep us from those goals
	2. To understand why pair programming is good for software and team
	3. To get ideas on what to improve
10. [To pair or not to pair?](https://martinfowler.com/articles/on-pair-programming.html#ToPairOrNotToPair), [But really, why bother?](https://martinfowler.com/articles/on-pair-programming.html#ButReallyWhyBother)

## How to Pair ##
### Styles ###
#### Driver and Navigator ####
1. Role definitions
	1. Driver:
		1. person at the wheel (keyboard)
			1. Focuses on completing tiny goal at hand
			2. Ignores larger issues for the moment
			3. Needs to talk through what she is doing while doing it
	2. Navigator:
		1. Observer position:
			1. Observes while driver is typing
			2. She reviews the code on-the-go
			3. Gives directions and shares thoughts
			4. Has an eye on
				1. Larger issues
				2. Bugs
			3. Makes notes of potential next steps or obstacles
2. Why division?
	1. To have two different perspectives on the code
		1. Driver: 
			1. More tactial
			2. Thinks about details
			3. Thinks about lines of code at hand
		2. Navigator:
			1. More strategic
				1. Observing
				2. Have big picture in mind
3. Common flow:
	1. Start with reasonably well defined task
	2. Agree on one tiny goal at a time
		1. Can be defined by unit test
		2. Can be defined by commit message
		3. Can be written on a sticky note
	3. Switch keyboard and roles regularly
		1. Shared active participation keeps energy level up
		2. We can understand things better
	4. As navigator:
		1. Avoid "tactical" mode of thinking
			1. Leave details of code to driver
		2. Complement pair's tactical mode with medium-term thinking
		3. Park the following on sticky notes
			1. Next steps
			2. Potential obstacles
			3. Ideas
		4. Discuss the items on sticky notes after tiny goal is done (do not interrupt driver's flow)

#### Ping Pong ####
1. Technique: Embraces TDD [TDD](https://martinfowler.com/bliki/TestDrivenDevelopment.html)
	1. It is perfect when we have a clearly defined task and can be implemented in TDD way
2. Steps:
	1. "Ping": Developer A writes a failing test
	2. "Pong": Developer B writes the implementation to make it pass
	3. Developer B then starts the next "Ping"
	4. Each "Pong" can be followed by refactoring together (before moving onto the next failing test)
		1. Red-green-refactor approach
			1. Red: Write a failing test
			2. Green: Make it pass with minimum necessary means
			3. Refactor: [Refactor](https://martinfowler.com/tags/refactoring.html)
3. [Examples](https://www.sandimetz.com/99bottles/sample/)

#### Strong-Style Pairing ####
1. Style for knowledge transfer:
	1. [Llewellyn Falco Description](https://llewellynfalco.blogspot.com/2014/06/llewellyns-strong-style-pairing.html)
2. Rule:
	1. For idea to go from my head into computer MUST go through someone else's hands
	2. Navigator:
		1. Experienced person with setup or task at hand
	3. Driver:
		1. Novice (with language, tool, codebase, ...)
	4. Experienced person mostly stays in navigator role and guides novices
3. Driver trusts the navigator:
	1. He/she should be comfortable with incomplete understanding
		1. "Why" and challenges should be discussed after implementation session
	2. Very effective for total novices
4. Could be like micromanagement but useful onboarding tool to 
	1. Favor active "larning by doing"
	2. Unfavor passive "learning by watching"
5. Good for initial KT
6. Must not be overused
7. Actual goal: Switch roles (after sometime)
	1. If it is happening subsequently, it is a sign that KT worked

#### Pair Development ####
1. It is a mindset to have
	1. [Sarah Mei's Twitter account](https://twitter.com/sarahmei/status/877738639991611392)
2. [User story](https://martinfowler.com/bliki/UserStory.html)
	1. Requires other tasks too
		1. Must take care of all those things

##### Planning - What's Our Goal? #####
1. Don't jump immediately to coding
2. Catch misunderstandings
3. Catch missing prerequisites
4. **Understand the problem**
	1. Read through story and play back to each other how we understood it
	2. Clear open questions & potential misunderstandings with product owner
	3. If [Definition of Ready](https://www.agilealliance.org/glossary/definition-of-ready/) exists:
		1. Go through and ensure everything to get started exists
5. **Come up with a solution**
	1. Brainstorm potential solutions for the problem
	2. Together or split up and present each other's ideas to the other
		1. Depends on if solution is well-defined
		2. Depends on individual style
			1. Loud thinker
			2. Solo thinker
	3. If one of the pair is less familiar with domain or tech
		1. Take time to share necessary context with each other
6. **Plan the approach**
	1. Write the following in sticky notes:
		1. Steps to reach the solution
		2. Order of tasks
		3. Testing strategy
	2. Record to remember

##### Research and Explore #####
1. If both are unfamiliar with a technology
	1. Reasearch and explore
		1. This is not clean-cut, driver-navigator or ping-pong
2. Approach for pair development:
	1. Define list of questions (to be answered to come up with a suitable solution)
	2. Split up - divide questions or try to find answers for same questions separately
		1. Search internet separately
		2. Search other resources separately
		3. Read up on concept separately
	3. Get back together (after agreed upon timebox)
		1. Discuss and share what has been found 

##### Documentation #####
1. Work together on documentation
	1. Decide together if any documentation is required for what is done
	2. Write documentation together or one of us can write it and other can review
2. Helps discipline ourselves because it is often the last task and due to it's annoyance, it might be skipped otherwise

### Time Management ###
1. Pomodoro technique:
	1. Time management method
		1. Breaks work into chunks of time
			1. 25 minutes
				1. Separated by short breaks
2. Keeps focussed
3. Since pairing is exhaustive, take breaks and switch keyboard regularly
4. Example:
	1. Decide on what to work on next
	2. Set timer for 25 minutes
		1. pomodoro browser extensions
		2. Tomato shaped ketchup timer...
	3. Do some work without interruptions
	4. Pause work when timer rings
		1. Start short breaks (5 - 10 minutes)
			1. Used to really take break (tank energy)
				1. Get water
				2. Get coffee
				3. Use bathroom
				4. Get fresh air
				5. Don't do other work
		2. After 3 or 4 of "pomodoros", take long break (15-30 minutes)

### Pair Rotations ###
1. Rotating pairs:
	1. After working together for a while, one half leaves and other person is onboarded to continue
	2. Anchor: Person who stays
2. Why to rotate
	1. Lgoistics
		1. Could be sick or going on holiday
		2. Working remotely on a day (but work requires physical presence)
			1. Hardware setup say
	2. Mixing things:
		1. Cabin fever due to spending too much time together
		2. Tidious and energy draining tasks
		3. New person can bring fresh perspectives and energy
	3. Avoiding knowledge silos
	4. Increase collective code ownership
	5. More code reviews on the go
3. Frequency:
	1. Opinion: 2-3 days (to ensure sufficient knowledge spread and quality)
4. Cost of rotations:
	1. Onboard time
	2. Context switch cost
5. If no anchor:
	1. risk that knowledge about problem and solution space may get lost
6. Junior developers:
	1. Can stay a bit longer (sufficient time to immerse themselves in a topic - gives more knowledge and time to settle)
	2. Show and tell: regularly scheduled developer huddle
		1. Time of week where developers discuss
			1. Tech debt
			2. Learnings
			3. And share significant piece of new code with each other
			4. ...
7. If there is already high quality knowledge sharing with team "show and tells", readable code and good documentation, think about trade offs between costs and benefits of frequency of rotations

### Plan the Day ###
1. Pairing requires scheduling and coordination
2. Start with a calendar check
	1. Agree on number of hours to pair
	2. Plan around meetings and other tasks
	3. If one needs to work on themselves, prepare for things to continue without other person (not using other person's code say)
	4. Keep reminders if there are meetings (especially working on partner's machine)
	5. If team members pair by default
		1. Schedule regular coding hours for everyone (simplifies scheduling)

### Physical Setup ###
1. Need to work closely together in physical space of shared desk
	1. Need to have attention on each other's needs
	2. Figure out comfortable setup for both
2. Rules and/or Guidelines:
	1. Both need enough space (clear up desk if necessary)
	2. Both chairs should have enough space
		1. Clear waste bins and back packs
	3. Use either one or two keyboards and/or mice
		1. Whatever works based on following factors
			1. Take care of hygiene
			2. Are we good at sharing keyboard time
			3. Do we have enough space
	4. One or two external monitors
		1. Or screenshare (as in remote pairing)
			1. Each can use their own laptop keyboards
	5. Check with partner for particular preferences or needs (large font size, higher contrast, ...)
	6. Check with partner for unusual IDE or keyboard
		1. Check if it can be simply switched to standard configuration
3. Agree on default setup (don't have to discuss again and again) 

### Remote Pairing ###
1. Use if
	1. Distributed team
	2. Team members work from home
		1. Ensure stable internet access

#### The Setup ####
1. A screen sharing solution with the following features:
	1. See other's machine
	2. Control other's machine (switching keyboard)
2. Try company's VC tool first
3. Open Source tools:
	1. [jitsi](https://jitsi.org/) - good for lower bandwidths
	2. [ssh with tmux](https://www.hamvocke.com/blog/remote-pair-programming-with-tmux/)
	3. [Live Share extension for Visual Studio Code](https://visualstudio.microsoft.com/services/live-share/)

#### Tips ####
1. **Use video**
	1. People communicate through gestures, facial expressions
		1. Share screen and see pairing partner's video
			1. Open up an additional call if required
2. **Planning and designing**
	1. Use collaborative visualization tools
		1. Reproduce experience of sketching out things on paper and whiteboard
3. **Audio experience**
	1. Go to quiet area
	2. Use good headset
		1. With directional microphone if possible
		2. If noisy: Use push to speak functionality
		3. Use noise cancelling headphones if possible
4. [Chelsea Troy's blog on remote pairing](https://chelseatroy.com/2017/04/01/advanced-pair-programming-pairing-remotely/)
5. **Network lag**
	1. Switch computers regularly to ensure working on own machine (without lag)
	2. If scrolling through files
		1. Use keyboard shortcuts for opening different parts of file or use collapse/un-collapse functionality

#### The Human Part ####
1. If few of us are remote
	1. Try to include remote partners in all discussions
2. If remote person is not known
	1. Try to have remote coffee together
3. It can be easier than pairing on site (easier with headphones)

### Have a Donut Together ###
1. Celebrate when accomplished a task together (can energize and get you ready for next task)

### Things to Avoid ###
1. Pitfalls to avoid:

#### Drifting Apart ####
1. Avoid reading emails or use phone while pairing
	1. May be disrespectful to pair
	2. May distract from the task being worked on
2. If something really needs attention, be transparent and tell why
3. Take enough breaks to read emails
4. Take individual time each day

#### Micro-Management Mode ####
1. Doesn't give room for other person to think
	1. Don't give instructions like:
		1. Now type "System, dot, print, ..."
		2. Now we need a new class called ...
		3. Press command shift O ...

#### Impatience ####
1. Apply 5 seconds rule
	1. If driver has done something wrong, wait for 5 seconds for commenting
		1. Driver might already be having it in mind (it may interrupt the flow)
2. As navigator:
	1. Do not immediately point out error
	2. Do not immediately point out upcoming obstacle (may be disruptive to driver's thinking process)
		1. Wait for driver to correct
		2. Write a sticky note

#### Keyboard Hogging ####
1. Am I controlling it all the time?
2. Am I not letting pairing partner do some typing?
	1. May limit active participation and can give hard time for partner to focus
		1. Switch the keyboard frequently

#### Pairing 8 Hours Per Day ####
1. It is not sustainable
	1. Too exhausting
	2. Impractical
		1. May need to check emails
		2. May need to have 1:1
		3. May need to go to meeting
		4. May need to research/ learn
2. Plan the day for not 100% coding together

### There is Not "THE" Right Way ###
1. There are many approaches
	1. Depends on
		1. Styles
		2. Personalities
		3. Experience
		4. Situation
		5. Task
		6. ...
2. Question: Are we getting the promised benefits out of it?
	1. If not, try out something else, reflect and adjust

## Benefits ##
1. Main goals supported by pair programming:
	1. Software quality
	2. Team flow
2. Benefits of pair programming:
	1. Knowledge sharing
	2. Reflection
	3. Focus
	4. Collective code ownership
	5. 2 modes of thinking
	6. Code review "on-the-go"
	7. Keeping the "wip" low
3. Result:
	1. Quality: 
		1. Less errors
		2. Evolvability
	2. Team flow

### Knowledge Sharing ###
1. Pairing helps spread knowledge on technology, domain on daily basis
2. Pairing prevents silos of knowledge on technology
3. Two minds discussing a problem improves chances of finding good solution
	1. Different experiences and perspectives come into play to consider alternatives

#### Practical Tips ####
1. Must not shy away from pairing on tasks when there is no idea on technology involved or domain
	1. Must not keep working in area we feel most comfortable and not miss out on learning new things
2. If team members are working on same topics all the time, mix it up to spread their expertise
3. Skill matrix:
	1. Columns: Business topics and tech topics
	2. Rows: Team members
	3. Values: Strengths and gaps in each area
4. Skill matrix can be put on a wall and spreading of knowledge can be planned

### Reflection ###
1. Pair programming enables discussion of approaches and solutions
	1. We don't have to think through them in our own head
	2. Saying and explaining things loud pushes us to reflect (if we have the right understanding or have a good solution)
		1. Applies to code and technical design
		2. Applies to user stories

#### Practical Tips ####
1. Pre-requisite: Trust between both to ask questions and speak openly about things we don't understand
	1. Build relationships within the team
		1. Take time for 1:1 and feedback sessions

### Keeping Focus ###
1. Have a structured approach
2. Communicate explicitly 
	1. What we are doing
	2. Where we are heading
3. Working in solo: Can distract by quickly trying different approach without thinking it through (it may take hours to get back)
	1. Pairing partner prevents this by focusing on what is important to finish task or story
		1. Helps each other stay on track

#### Practical Tips ####
1. Plan together
2. Discuss task at hand
3. Think about steps to make to reach the goal
4. Put steps on sticky notes
	1. If remotely:
		1. Subtasks in ticket management system
	2. Bring them in the order and go one by one
5. Try with [Pomodoro technique](https://martinfowler.com/articles/on-pair-programming.html#TimeManagement)
	1. Try to finish one goal with one pomodoro
6. Communicate well
	1. Talk about what we are doing
	2. Demand communication from each other

### Code Review on-the-go ###
1. Pairing involves 4 eyes on little and bigger things as we proceed
	1. More errors are likely to get caught on the way instead of after we are finished
2. [Refactoring](https://martinfowler.com/tags/refactoring.html)
	1. It is part of coding
	2. It is part of pair programming
	3. It is easier to improve code when you have someone beside you to discuss approaches or naming things (say)
3. Code reviews after the fact:
	1. Disadvantages:
		1. [To pair or not to pair](https://martinfowler.com/articles/on-pair-programming.html#ToPairOrNotToPair)

#### Practical Tips ####
1. Ask each other questions
2. Questions: Powerful tool to understand what we are doing and come to better solutions
	1. If code is not easy to read and understand for one of us:
		1. Try different way that is easier to understand
3. 

### Two Modes of Thinking Combined ###
### Collective Code Ownership ###
### Keeps the Team's WIP Low ###
### Fast Onboarding of New Team Members ###

## Challenges ##
### Pairing Can be Exhausting ###
### Intense Collaboration Can be Hard ###
### Interruptions by Meetings ###
### Different Skill Levels ###
### Power Dynamics ###
### Pairing with Lots of Unknowns ###
### No Time for Yourself ###
### Rotations Lead to Context Switching ###
### Pairing Requires Vulnerability ###
### Convincing Managers and Co-Workers ###

## To Pair or Not to Pair ##
### Boring Tasks ###
### "Could I Really Do This By Myself?" ###
### Code Review vs. Pairing ###

## But Really, Why Bother? ##