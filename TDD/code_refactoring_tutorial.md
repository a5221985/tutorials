# Code Refactoring #
## Code Refactoring 1 ##
1. How to write great code that is easy to modify and understand
2. What is refactoring?
	1. Refactoring makes code understandable and easy to extend
		1. Improves code design
	2. Refactoring makes it quicker to construct complicated systems
		1. If any feature needs to be added, refactoring makes it easier to add the feature now rather than later
3. Why should you refactor?
	1. Remove escess code so it is easier to understand & modify
		1. Duplicate code removal reduces the amount of code
	2. By refactoring code you can better understand others code
		1. We can understand how the system works
			1. Easier to spot bugs
	3. Eliminate having to remember what old code does
	4. Write code quicker
4. We can pull in design patterns or pull away design patterns
5. What are bad smells?
	1. Bad smells are common design problems
	2. Bad design is normally unclear, complicated or duplicated
	3. Examples:
		1. Duplicate code
			1. subtle - different code doing similar thing
		2. Long Methods
			1. Breaking methods
			2. Small methods are easier to understand
				1. <= 10 lines, ~ 5 lines on an average
		3. Complex conditional statements
			1. Limit ability to extend and re-use
			2. Makes it difficult to understand the system over time
		4. Primitive Obsession
			1. Constantly using primitives over objects
				1. int, double, ...
			2. Moving away from primitives makes code cleaner and extensible
		5. Indecent exposure
			1. When methods and classes are made visible when it is better to keep them private
		6. Solution sprawl
			1. Code is used to solve an issue that is sprawled across numerous classes when it is better to keep all of them in one
		7. Alternative classes with different interfaces
			1. Interfaces of classes are different but the classes themselves are not different
			2. Refactor interfaces into one
		8. Lazy classes
			1. Need to be consolidated
				1. They don't do much on their own
		9. Large classes
			1. If we move too many lazy classes into one
			2. Class has too many responsibilities
			3. Way to spot?
				1. If we are using too many instances of the class over and over to solve many different problems
		10. Switch statements (and if then else statements)
			1. Need to be eliminated if they make system restrictive 
				1. Solution: Replace with object polymorphic solution
		11. Combinatorial explosions
			1. When we use many methods to perform actions which could be done with one method that isn't as specialized
				1. Example: a method for each DB query rather than one method that can handle numerous queries
		12. Oddball solutions
			1. Solving the same problem in many different ways
				1. Solution: Identify the best one solution and remove all the other duplicates that don't work so well
6. Creation problems
	1. Creation method
		1. For instance of an object
	2. Replace constructors with creation methods
		1. Which constructor should be called?
			1. Programmers might get confused if there are many constructors
			2. Parameter passing is not easy
		2. Wish constructors had descriptive names?
		3. Constructors can't have the same attribute signatures
			1. Same number of attributes
			2. Same types of attributes
	3. Solutions: Not using new
	4. Example:

			public class FootballPlayer {
				private double passerRating; // SPecific to QBs
				private double rushingYards; // Specific to RBs & QBs
				private double receivingYards; // Specific to RBs & WRs
				private int totalTackles; // Specific to DEF
				private int interceptions; // Specific to DEF
				private int fieldGoals; // Specific to Kickers
				private double avgPunt; // Specific to Punters
				private double avgKickoffReturn; // Specific to Special Teams
				private double ovgPuntReturn; // Specific to Special Teams
				
				FootballPlayer(double passerRating, int rushingYards) {
					this.passerRating = passerRating;
					this.rushingYards = rushingYards;
				}
				
				FootballPlayer(double rushingYards) {
					this.rushingYards = rushingYards;
				}
				
				FootballPlayer(double receivingYards) { // not allowed!!!
					receivingYards = receivingYards;
				}
			}
			
		1. Solution:

				public class FootballPlayer {
					private double passerRating; // SPecific to QBs
					private double rushingYards; // Specific to RBs & QBs
					private double receivingYards; // Specific to RBs & WRs
					private int totalTackles; // Specific to DEF
					private int interceptions; // Specific to DEF
					private int fieldGoals; // Specific to Kickers
					private double avgPunt; // Specific to Punters
					private double avgKickoffReturn; // Specific to Special Teams
					private double ovgPuntReturn; // Specific to Special Teams
					
					FootballPlayer(double passerRating, int rushingYards, int receivingYards, int totalTackles, int interceptions, int fieldGoals, double avgPunt, double avgKickoffReturn, double avgPuntReturn) {
						this.passerRating = passerRating;
						this.rushingYards = rushingYards;
						this.receivingYards = receivingYards;
						this.totalTackles = totalTackles;
						this.interceptions = interceptions;
						this.fieldGoals = fieldGoals;
						this.avgPunt = avgPunt;
						this.avgKickoffReturn = avgKickoffReturn;
						this.avgPuntReturn avgPuntReturn;
					}
					
					public static FootballPlayer createQB(double passerRating, int rushingYards) {
						return new FootballPlayer(passerRating, rushingYards, 0, 0, 0, 0, 0.0, 0.0, 0.0);
					}
					
					public static void main(String[] args) {
						FootballPlayer aaronRodgers = FootballPlayer.createQB(108.0, 259);
						
						System.out.println("Aaron Rodgers Passer Rating: "  + aaronRodgers.getPasserRating());
					}
				}
				
	5. Avoid duplication & chain constructors
		1. More constructors, more problems
			1. If one of one of the constructor is updated but not the others, then it may cause problems
		2. General purpose constructors save the day
			1. Solution: Few constructors can call general purpose constructor
		3. Example:

				public class FootballPlayer2 {
					private String playerName = "";
					private String college = "";
					private double fortyYardDash = 0.0;
					private int repsBenchPress = 0;
					private double sixtyYardDash = 0.0;
					
					public String getPlayerName() { return playerName; }
					public String getCollege() { return college; }
					public double get40YdDash() { return fortyYardDash; }
					public int getRepsBenchPress() { return repsBenchPress; }
					public double get60YdDash() { return sixtyYardDash; }
					
					public FootballPlayer2(String playerName, String college, double fortyYardDash, double sixtyYardDash) {
						this.playerName = playerName;
						this.college = college;
						this.fortyYardDash = fortyYardDash;
						this.sixtyYardDash = sixtyYardDash;
					}
					
					public FootballPlayer2(String playerName, String college, double fortyYardDash, int repsBenchPress) {
						this.playerName = playerName;
						this.college = college;
						this.fortyYardDash = fortyYardDash;
						this.repsBenchPress = repsBenchPress;
					}
					
					public FootballPlayer2(String playerName, String college, double fortyYardDash, int repsBenchPress, double sixtyYardDash) {
						this.playerName = playerName;
						this.college = college;
						this.fortyYardDash = fortyYardDash;
						this.repsBenchPress = repsBenchPress;
						this.sixtyYardDash = sixtyYardDash;
					}
				}
				
			1. Solution: Chaining constructors - catch all constructor

					public class FootballPlayer2 {
						private String playerName = "";
						private String college = "";
						private double fortyYardDash = 0.0;
						private int repsBenchPress = 0;
						private double sixtyYardDash = 0.0;
						
						public String getPlayerName() { return playerName; }
						public String getCollege() { return college; }
						public double get40YdDash() { return fortyYardDash; }
						public int getRepsBenchPress() { return repsBenchPress; }
						public double get60YdDash() { return sixtyYardDash; }
						
						public FootballPlayer2(String playerName, String college, double fortyYardDash, int repsBenchPress, double sixtyYardDash) {
							this.playerName = playerName;
							this.college = college;
							this.fortyYardDash = fortyYardDash;
							this.repsBenchPress = repsBenchPress;
							this.sixtyYardDash = sixtyYardDash;
						}
						
						public FootballPlayer2(String playerName, String college, double fortyYardDash, int repsBenchPress) {
							this(playerName, college, fortyYardDash, repsBenchPress, 0.0);
						}
						
						public FootballPlayer2(String playerName, String college, double fortyYardDash, int repsBenchPress, double sixtyYardDash) {
							this(playerName, college, fortyYardDash, 0, sixtyYardDash);
						}
						
						public static void main(String[] args) {
							FootballPlayer2 jamellFlemming = new FootballPlayer2("Jamell Flemming", "Oklahoma", 4.53, 10.75);
							
							System.out.println(jammelFlemming.getPlayerName());
						}
					}

## Code Refactoring 2 ##
1. How to extract methods
	1. Used to turn code fragments into a method with a descriptive name
	2. Used to make code as readable as comments
2. Why to extract?
	1. If method is too busy
	2. Turn code fragments into nice neat methods with descriptive names
		1. Goal: To make code as readable as comments in code
3. Example:

		public class FootballPlayer {
			private String name = "";
			private double[] fortyYardDashTimes = null;
			
			public String getName() { return name; }
			
			public double[] get40YardDashTimes() { return fortyYardDashTimes; }
			
			FootballPlayer(String name, double[] fortyYardDashTimes) {
				this.name = name;
				this.fortyYardDashTimes = fortyYardDashTimes;
			}
		}
		
		public class util.ArrayList;
		
		public class FootballPlayer40YardDashInfo {
			ArrayList<FootballPlayer> players = new ArrayList<FootballPlayer>();
			
			public void addFootballPlayer(FootballPlayer player) {
				players.add(player);
			}
			
			public void printPlayerInfo() {
				double avg40YdTime = 0.0;
				
				System.out.println("%-15s %15s", "Name", "Avg 40 Times\n");
				
				// Print dashes under titles
				for (int i = 0; i < 30; i++) { System.out.print("_"); }
				
				System.out.println();
				
				for (FootballPlayer player : players) {
					System.out.println("%-19s", player.getName());
					
					double total40YdDashTimes = 0.0;
					
					double[] fortyYardDashTimes = player.get40YardDashTimes();
					
					for (int i = 0; i < player.get40YardDashTimes().length; i++) {
						total40YdDashTimes += fortyYardDashTimes[i];
					}
					
					avg40YdTime = total40YdDashTimes / player.get40YardDashTimes().length;
					
					System.out.println("%1$.2f", avg40YdTime);
					
					System.out.println();
				}
			}
			
			public static void main(String[] args) {
				FootballPlayer40YardDashInfo fb40Dash = new FootballPlayer40YardDashInfo();
				
				// Add Clark Kent for example
				
				double cKent40YdDashTimes[] = {4, 36, 4.39, 4.41};
				FootballPlayer clarkKent = new FootballPlayer("Clark Kent");
				fb40Dash.addFootballPlayer(clarkKent);
				
				// Add Bruce Wayne for example
				
				double bWayne40YdDashTimes[] = {4.42, 4.43, 4.49};
				FootballPlayer bruceWayne = new FootballPlayer("Bruce Wayne");
				fb40Dash.addFootballPlayer(bruceWayne);
				
				fb40Dash.printPlayerInfo();
			}
		}
		
3. Solution:

		public class FootballPlayer {
			private String name = "";
			private double[] fortyYardDashTimes = null;
			
			public String getName() { return name; }
			
			public double[] get40YardDashTimes() { return fortyYardDashTimes; }
			
			FootballPlayer(String name, double[] fortyYardDashTimes) {
				this.name = name;
				this.fortyYardDashTimes = fortyYardDashTimes;
			}
		}
		
		public class util.ArrayList;
		
		public class FootballPlayer40YardDashInfo {
			ArrayList<FootballPlayer> players = new ArrayList<FootballPlayer>();
			
			public void addFootballPlayer(FootballPlayer player) {
				players.add(player);
			}
			
			public void printPlayerInfo() {
				
				printTitles();
								
				printPlayersWith40Avg();
			}
			
			public void printTitles() {
				System.out.println("%-15s %15s", "Name", "Avg 40 Times\n");
				printCharMultTimes('_', 30);
			}
			
			public void printCharMultTimes(char charToPrint, int howManyTimes) {
				// Print dashes under titles
				for (int i = 0; i < howManyTimes; i++) { System.out.print(charToPrint); }
				System.out.println();
			} 
			
			public void printPlayersWith40Avg() {
				for (FootballPlayer player : players) {
					System.out.println("%-19s", player.getName());
					
					double total40YdDashTimes = 0.0;
					
					double[] fortyYardDashTimes = player.get40YardDashTimes();
					
					for (int i = 0; i < player.get40YardDashTimes().length; i++) {
						total40YdDashTimes += fortyYardDashTimes[i];
					}
					
					double avg40YdTime = total40YdDashTimes / player.get40YardDashTimes().length;
					
					System.out.println("%1$.2f", avg40YdTime);
					
					System.out.println();
				}
			}
			
			public static void main(String[] args) {
				FootballPlayer40YardDashInfo fb40Dash = new FootballPlayer40YardDashInfo();
				
				// Add Clark Kent for example
				
				double cKent40YdDashTimes[] = {4, 36, 4.39, 4.41};
				FootballPlayer clarkKent = new FootballPlayer("Clark Kent");
				fb40Dash.addFootballPlayer(clarkKent);
				
				// Add Bruce Wayne for example
				
				double bWayne40YdDashTimes[] = {4.42, 4.43, 4.49};
				FootballPlayer bruceWayne = new FootballPlayer("Bruce Wayne");
				fb40Dash.addFootballPlayer(bruceWayne);
				
				fb40Dash.printPlayerInfo();
			}
		}
		
3. Example:

		double average = 0.0;
		double[] dashTimes {4.36, 4.39, 4.41};
		for (int i = 0; i < dashTimes.length; i++) {
			totalDashTimes += dashTimes;
		}
		
		average = totalDashTimes / dashTimes.length;
		
	1. Extracting:

			double[] dashTimes {};
			double average = getAvgDashTime(dashTimes);
			
			public static double getAvgDashTime(double[] dashTimes) {
				double totalDashTimes = 0.0;
				for (int i = 0; i < dashTimes.length; i++) {
					totalDashTimes += dashTimes;
				}
				return totalDashTimes / dashTimes.length;
			}

## Code Refactoring 3 ##
## Code Refactoring 4 ##
## Code Refactoring 5 ##
## Code Refactoring 6 ##
## Code Refactoring 7 ##
## Code Refactoring 8 ##
## Code Refactoring 9 ##
## Code Refactoring 10 ##
## Code Refactoring 11 ##
## Code Refactoring 12 ##
## Code Refactoring 13 ##
## Code Refactoring 14 ##
## Code Refactoring 15 ##
## Code Refactoring 16 ##
## Code Refactoring 17 ##
## Code Refactoring 18 ##