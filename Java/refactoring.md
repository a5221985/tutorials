# Code Refactoring #
## Code Refactoring ##
1. How to write code that is easy to modify and easy to understand
2. What is refactoring?
	1. Refactoring makes code understandable and easy to extend (design change)
		1. Otherwise code becomes difficult to extend while remaining error free
		2. If new feature needs to be added and if it is difficult to add, refactor the code first and then easily add the feature
	2. Refactoring makes it quicker to build complicated systems
3. Why should you refactor?
	1. Remove excess code (duplicate code) so it is easier to understand and modify (because it is less code)
	2. Refactoring enables us to understand others code
		1. System is understood
		2. Easier to find bugs
	3. Eliminates having to remember what old code does
	4. Minimizes complex conditional logic
	5. We can write code quicker
4. Better design is simple goal of refactoring
	1. Pull in or away from design patterns
5. What are bad smells?
	1. Common design problems
		1. Language design problems
	2. Bad design is normally unclear, complicated or duplicated
6. The Bad Smells:
	1. Duplicated Code:
		1. same code repeated
		2. Logic repeated with different code
	2. Long Methods:
		1. Difficult to understand
		2. <= 10 lines, av 5 lines
	3. Complex Conditional Statements
		1. Limits ability to extend the system and provide re-use
		2. Makes it hard to understand the system over time
	4. Primitive Obsession
		1. ints, doubles, ...
		2. One needs to move away from primitives - More cleaner and more extensible
	5. Indecent Exposure
		1. Methods and classes are made visible when it is better to keep them private
	6. Solution Sprawl
		1. Code to solve an issue is sprawled across numerous classes which is better to keep all of them in one
	7. Alternative Classes with Different Interfaces
		1. Interfaces are different from two classes but classes themselves are not different.
			1. Refactor different interfaces into one
	8. Lazy Classes
		1. Refers to classes that can be consolidated because they don't do much on their own
	9. Large Classes
		1. Classes that have too many responsibilities
			1. Can be spotted if many instances of the classes are being used to solve many different problems
	10. Switch Statements (or if/else statements)
		1. Eliminated if it makes sense to eliminate and replace with polymorphic solution
	11. Combinatorial Explosions
		1. When many methods are used to perform actions when it could be done with one method
			1. Many methods for different queries instead of one method that could run different queries. 
	12. Oddball Solutions
		1. Occurs when we solve same problem in many different ways
			1. Select one best solution and delete the duplicates
7. Creation Problems
	1. Creation method (method that returns a new instance of a class)
		1. Replace constructors with creation methods
			1. Reasons:
				1. Which constructor should be called?
				2. Wish constructors had descriptive names?
				3. Constructors can't have the same attribute signatures
	2. No `new`
	3. Example: FootballPlayer

			public class FootballPlayer {
				private double passerRating; // Specific to QBs
				private int rushingYards; // Specific to RBs & QBs
				private int receivingYards; // Specific to RBs & WRs
				private int totalTackles; // Specific to DEF
				private int interceptions; // Specific to DEF
				private int fieldGoals; // Specific to Kickers
				private double avgPunt; // Specific to Punters
				private double avgKickoffReturn; // Specific to Special Teams
				private double avgPuntReturn; // Specific to Special Teams

				FootballPlayer(double passerRating, int rushingYards) {
					this.passerRating = passerRating;
					this.rushingYards = rushingYards;
				}

				FootballPlayer(int rushingYards) {
					this.rushingYards = rushingYards;
				}

				FootballPlayer(int receivingYards) { // compilation error
					this.receivingYards = receivingYards;
				}
			}

		1. Solution:

				...
				// Catch all constructor
				FootballPlayer(double passerRating, int rushingYards, int receivingYards, int totalTackles, int interceptions, int fieldGoals, double avgPunt, double avgKickoffReturn, double avgPuntReturn) {
					this.passerRating = passerRating;
					this.rushingYards = rushingYards;
					this.receivingYards = receivingYards;
					this.totalTackles = totalTackles;
					this.interceptions = interceptions;
					this.fieldGoals = fieldGoals;
					this.avgPunt = avgPunt;
					this.avgKickoffReturn = avgKickoffReturn;
					this.avgPuntReturn = avgPuntReturn;
				}

				public double getPasserRating() { return passerRating; }

				public static FootballPlayer createQB(double passerRating, int rushingYards) {
					return new FootballPlayer(passerRating, rushingYards, 0, 0, 0, 0, ..., 0);
				}

				public static void main(String[] args) {
					FootballPlayer aaronRodgers = FootballPlayer.createQB(108.0, 259);
					System.out.println("Aaron Rodgers Passer Rating: " + aaronRodgers.getPasserRating());
				}

8. Avoid duplication of constructors (by chaining constructors)
	1. General purpose constructors save the day
	2. If more constructors are there, if any of the constructors is updated and if the other constructors are missed out, then problems occur
		1. Solution: Constructors call general purpose constructor
	3. Example: FootballPlayer2

			public class FootballPlayer2 {
				private String playerName = "";
				private String college = "";
				private double fortyYardDash = 0.0;
				private int repsBenchPress = 0.0;
				private double sixtyYardDash = 0.0;

				public String getPlayerName() { return playerName; }
				public String getCollege() { return college; }
				public double get40Yards() { return fortyYardDash; }
				public int getRepsBenchPress() { return repsBenchPress; }
				public double get60YdDash() { return sixtyYardDash; }

				/*
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
					this.respBenchPress = respBenchPress;
				}
				*/

				// Catch all constructor
				public FootballPlayer2(String playerName, String college, double fortyYardDash, int repsBenchPress, double sixtyYardDash) {
					this.playerName = playerName;
					this.college = college;
					this.fortyYardDash = fortyYardDash;
					this.respBenchPress = respBenchPress;
					this.sixtyYardDash = sixtyYardDash;
				}

				public FootballPlayer2(String playerName, String college, double fortyYardDash, double sixtyYardDash) {
					FootballPlayer2(playerName, college, fortyYardDash, 0, sixtyYardDash);
				}

				public FootballPlayer2(String playerName, String college, double fortyYardDash, int repsBenchPress) {
					FootballPlayer2(playerName, college, fortyYardDash, repsBenchPress, 0.0);
				}
			}

## Code Refactoring 2 ##
1. How to extract methods, when and when not to extract methods and temps
2. How to extract methods:
	1. Reasons:
		1. Used to turn code fragments into a method with a descriptive name
		2. Used to make code as readable as comments
3. Example:

		FootballPlayer {
			private String name = "";
			private double[] fortyYardDashTimes = null;

			public String getName() { return name; }

			public double[] get40YardDashTimes() { return fortyYardDashTimes; }

			FootballPlayer(String name, double[] fortyYardDashTimes) {
				this.name = name;
				this.fortyYardDashTimes = fortyYardDashTimes;
			}
		}

		import java.util.ArrayList;

		public class FootballPlayer40YardDashInfo {
			ArrayList<FootballPlayer> players = new ArrayList<>();

			public void addFootballPlayer(FootballPlayer player) {
				players.add(player);
			}

			public void printPlayerInfo() {
				// double avg40YdTime = 0.0;

				/*
				// title bar
				System.out.printf("%-15s %15s", "Name", "Avg 40 Time\n");

				// Print dashes under titles

				for (int i = 0; i < 30; i++) { System.out.print("_"); }
				*/

				printTitles();

				System.out.println();

				/*
				for (FootballPlayer player: players) {
					System.out.printf("%-19s", player.getName());

					double total40YdDashTimes = 0.0;

					double[] fortyYardDashTimes = player.get40YardDashTimes();

					for (int i = 0; i < player.get40YardDashTimes().length; i++) {
						total40YdDashTimes += fortyYardDashTimes[i];
					}

					avg40YdTime = total40YdDashTimes / player.get40YardDashTimes().length;
			
					System.out.println("%1$.2f", avg40YdTime);

					System.out.println();
				}
				*/
				printPlayersWith40Avg();
			}

			public void printTitles() {
				System.out.printf("%-15s %15s", "Name", "Avg 40 Time\n");

				// Print dashes under titles

				// for (int i = 0; i < 30; i++) { System.out.print("_"); }
				printCharMultTimes('_', 30);

				System.out.println();
			}

			public void printCharMultTimes(char charToPrint, int howManyTimes) {
				// Print dashes under titles
				for (int i = 0; i < howManyTimes; i++) { System.out.print(charToPrint); }
				System.out.println();
			}

			public void printPlayersWith40Avg() {
				for (FootballPlayer player: players) {
					System.out.printf("%-19s", player.getName());

					double total40YdDashTimes = 0.0;

					double[] fortyYardDashTimes = player.get40YardDashTimes();

					for (int i = 0; i < player.get40YardDashTimes().length; i++) {
						total40YdDashTimes += fortyYardDashTimes[i];
					}

					double avg40YdTime = total40YdDashTimes / player.get40YardDashTimes().length;
			
					System.out.printf("%1$.2f", avg40YdTime);

					System.out.println();
				}
			}
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