# Unity 3D #
## Introduction ##
1. 30 hrs of content
2. Topics
	1. Download install
	2. Build games
	3. Pricing plans
	4. Basics of C#
	5. Haunted Zombie Rush game
	6. Defender 2D game
	7. Legend of Devsopes Fantasy 3D game
	8. Advanced lighting
	9. Cinematics and animation
	10. Skeletons vs zombies MOBA with Multiplayer
	11. Minecraft clone for iOS and Android
	12. Virtual reality
	13. Good clean code

## Download and Install ##
1. `unity3d.com`
	1. It is free (Personal)
	2. We can publish for free but logo on screen
		1. < $100,000
	3. Download:
		1. Select
			1. Default options
2. Register
	1. Open unity app
	2. enter email and password
3. New project
	1. Project Name: testProject
4. May need graphics card (NVidia, ATI radion)

### On Windows ###
1. Download and install Google chrome
2. Download free version
3. Keep the default option
	1. Microsoft Visual Studio Community 2015
	2. Remove standard assets
4. Sign into an account
5. Opens the app in Visual Studio
	1. Alternative: Visual Studio Code

## Zombie Roller: First Game ##
1. Download the starter project
2. Open the zip
3. Open `Roll-A-Zombie-...` project in Unity
4. Start with a scene
	1. Open `Assets`>`Prefabs`
	2. Drag `Floor` to the Scene window
5. Moves:
	1. Alt > drag (drags floor)
	2. Q > drag (pan)
6. Give floor a texture:
	1. Open `Assets` > `Floor`
	2. Drag `Wood Texture Floor` and drop it on `Floor` in the Scene window
7. Change the block colors
	1. Goto `Materials`
	2. Drag `Green` to the first box
	3. Drag `Blue` to the second box
	4. Drag `Red` to the thirst box
	5. Drag `Yello` to the fourth box
8. Zombies
	1. Open `Assets` > `Prefabs`
	2. Drag the four zombies to the hierarchy in `Hierarchy` panel
9. Tilt floor:
	1. Select `Floor` in `Hierarchy` panel
	2. Press `E`
	3. Click `Red` circle and rotate
10. Adding physics to zombies
	1. Click a zombie and hit shift and click the other three
	1. Select `Add Component`
	2. Select `Physics`
	3. Select `Rigid Body`
	4. Check `Gravity`
11. Colider
	1. Select all zombies
	2. Click `Add Component`
	3. Select `Physics`
	4. Select `Sphere Collider`
	5. Increase `y` by dragging it up
	6. Increase radius to `0.56`

### Script to select a zombie and move up ###
1. Right click `Assets`
2. `Create` > `C# Script`
3. `GameManager`
4. Drag it to `Main Camera` (applies to the object)
5. Open the file (Opens Mono Develop)
	1. `start()`: function that is run when the game starts
	2. `update()`: function that is called over and over (once per frame say 60 frames per second)
6. Code

		using System.Collections.Generic;

		public GameObject selectedZombie;
		public List<GameObject> zombies;
7. Add zombies to list
	1. Goto screen
	2. Increase `Size` to 4
	3. Drag and drop each zombie to each `Element x`
8. Increase size of zombies
	1. Select a zombie
	2. Press `Alt`
	3. Increase size by dragging after pressing `W`
9. Save sizes in script

		public Vector3 selectedSize;
		public Vector3 defaultSize;
10. Change scales
	1. Select Main Camera
	2. Selected Size:
		1. X = 1.4, Y = 1.4, Z = 1.4
	3. Default Size:
		1. X = 1, Y = 1, Z = 1
11. Select a zombie
	1. Drag and drop `yellozombie` from `Hierarcy` panel to the `Inspector` panel's `Selected Zombie` variable 
11. 

		void Start() {
			SelectedZombie (selectedZombie);
		}

		void SelectZombie(GameObject newZombie) {
			newZombie.transform.localScale = selectedSize;
		}

12. Selecting Zombie using arrow keys

		private int selectedZombiePosition = 0;

		void Update() {
			if (Input.GetKeyDown ("left")) {
				GetZombieLeft();
			}

			if (Input.GetKeyDown ("right")) {
				GetZombieRight();
			}

			if (Input.GetKeyDown ("up")) {
				
			}
		}

		void GetZombieLeft() {
			if (selectedZombiePosition == 0) {
				selectedZombiePosition = 3;
				SelectZombie (zombies[3]);
			} else {
				selectedZombiePosition = selectedZombiePosition - 1;
				GameObject newZombie = zombies[selectedZombiePosition];
				SelectZombie(newZombie);
			}
		}

		void GetZombieRight() {
			if (selectedZombiePosition == 3) {
				selectedZombiePosition = 0;
				SelectZombie(zombies[0]);
			} else {
				selectedZombiePosition = selectedZombiePosition + 1;
				SelectZombie (zombies[selectedZombiePosition]);
			}
		}

		void SelectZombie(GameObject newZombie) {
			selectedZombie.transform.localScale = defaultSize;
			selectedZombie = newZombie;
			...
		}

13. Apply force to an object

		pushUp();

		void PushUp() {
			RigidBody rb = selectedZombie.GetComponent<RigidBody>();
			rb.AddForce(0, 0, 10, ForceMode.Impulse);
		}

14. Move zombies initially
	1. Move a few zombies up

15. Adding drag to objects
	1. Red:
		1. Angular Drag: 2.38
	2. Green:
		1. Angular Drag: 0.26
	2. Yellow:
		1. Angular Drag: 0

16. Move the zombies back
17. Add scoreboard
	1. Right Click
	2. UI > Text
	2. Add Text
	3. Increase X, Y position
	4. Increase Font size
18. Changing score
		
		using UnityEngine.UI;	

		public Text scoreText;
		private int score = 0;

		start() {
			scoreText.text = "Score: " + score;
		}

		public void AddPoint() {
			score = score + 1;
			scoreText.text = "Score: " + score;
		}

19. Hitting cubes and increase score
	1. Add another script `Tile`
	2. Click `Open` C# project
	3. script

			public GameManager gameManager;

			void OnTriggerEnter(Collider other) {
				gameManager.AddPoint();
			}
	4. Select the script, drag it to `Add Component`
		1. Drag Main Camera to Game Manager
	5. Click Main Camera
		1. Drag Text to Score Text

20. Add box collider
	1. Add Component
	2. Physics
	3. Box collider
21. Add script to cubes
	1. Select all four cubes
	2. Drag the script to Add Component
	3. Drag Main camera to Game Manager

22. Music:
	1. Select Camera
	2. Add Component 
	3. Audo > Source
	4. Drag and drop game_music to `AudioClip`
	5. Make sure
		1. Play On Awake is checked
		2. Loop is checked
23. Beep when zombies hit the cubes
	1. Tile

			public AudioClip hit;
			AudioSource source;

			void start() {
				source = GetComponent<AudioSource> ();
			}

			void OnTriggerEnter() {
				source.PlayOneShot (hit);
			}

24. Select all tiles
	1. Open Audio Source
	2. Drag Beep audio to Hit

25. Change camera view:
	1. Select Main Camera
	2. Different views

### Pricing Models ###
1. Pro Editor UI Skin
	1. Free - light grey
2. Performance ...
	1. Free - no
3. Multiplayer:
	1. Free - 20 (free)
	2. unity3d.com/services/multiplayer
		1. Pricing: 
4. Splash screen
	1. free - says made with unity

### Unity 3D Computer System Requirements ###
1. Unity 3D Specs:
	1. See the website

### How to Acess Community ###
1. devslopes.com
	1. hamburger menu
		1. Free Chat room
			1. Discord
2. discordapp.com
	1. ios, android
3. look and feel
	1. topics
	2. Teacher aids
4. Events

### Big discount on Bitgem 3D assets on this lecture ###
1. [bitgem.com assets](bitgem.com)
	1. Coupon code: mark_price_unity_3d_course

### C# Variables in Unity 3D ###
1. File > New Project
	1. LearnToCode
	2. Trun off analytics
2. Right click on Assets > New C# Script
	1. variables
3. Drag the script on Main Camera
	1. Save the scene as `Learn to Code`
4. Open the script

		void start() {
			string heroName = "Thanos";
			string equippedWeapon = "Infinity Gauntlet";
			string favoiriteFurniture = "Throne";

			string favoritePlanet;
			// Debug.Log(favoritePlanet);

			favoritePlanet = "Earth";

			Debug.Log(heroName);
			Debug.Log(equipmentWeapon);
			Debug.Log(favoriteFurniture);
		}

5. Running
	1. Open Console
	2. Click Run button
6. Other things

		Debug.Log(equippedWeapon.ToUpper());

### C# Numbers in Unity 3D ###
1. Code

		int hp = 100;
		float shieldPower = 76.5f;
		int laserDamage = 30;
		double actualDamagePercent = 0.05;		

		hp -= (int)(laserDamage * actualDamagePercent);

		shieldPower -= laserDamage - actualDamage

		Debug.Log("HP: " + hp); // hp = hp - actualDamage
		Debug.Log("Shield Power: " + shieldPower)

		int slices = 10 / 5;
		print (slices);
		
		int newDamage = 10 / 3;

		print (newDamage);

		int newDamageRemainder = 10 % 3;
		
		print("10 divided by 3 equals " + newDamage + " with a remainder of " + newDamageRemainder);

### C# Conditionals in Unity ###
1. Right click on `Assets` -> Create > C# script
	1. Conditionals
2. Open the script
	
		int health = 100;
		bool gameOver = false;
		int lives = 3;

		void start() {
			if (health <= 0 && lives == 0) {
				gameOver = true;
			}

			if (lives)

			if (gameOver == true) {
				Debug.Log("The game is over!");
			} else {
				Debug.Log("You're still alive buddy!");
			}
		}
3. Drag to script on to Main Camera
4. Example:
	
		int playerOneTowersRemaining = 2;
		int playerTwoTowersRemaining = 2;
		bool playerOneMainTowerDestroyed = false;
		bool playerOneMainTowerDestroyed = false;

		float timer = 200;

		void start() {
			if (playerOneMainTowerDestroyed || playerTwoMainTowerDestroyed) {
				if (playerOneMainTowerDestroyed) {
					Debug.Log("Player two wins!");
				} else {
					Debug.Log("Player one wins!");
				}
			} else if (timer <= 0) {
				if (playerOneTowersRemaining < playerTwoTowersRemaining) {
					Debug.Log("Player two wins!");
				} else if (playerTwoTowersRemaining < playerOneTowersRemaining) {
					Debug.Log("Player one wins!");
				} else {
					Debug.Log("The game was a draw");
				}
			}

			if (true == false || false != true && 1 == 1) {
				Debug.Log("Did we get here");
			} 
		}

### Arrays and Loops ###
1. Right click on Assets
2. New C# Script
3. `ListTimeBaby`
	
		string playerone = "JohnKiller25";
		string playertwo = "BamBamBunnyLover18";
		string playerthree = "Devslopes";
		string playerfour = "Ponylover";

		void start() {
			Debug.Log("Welcome: " + playerone);
			Debug.Log("Welcome: " + playertwo);
			Debug.Log("Welcome: " + playerthree);
			Debug.Log("Welcome: " + playerfour);
		}

4. Drag the script on to camera
5. DRY: Dont repeat yourself
6. Better way

		string[] players = new string[4];

		void start() {
			players[0] = "JonnyKiller25";
			players[1] = "BamBamBunnyHugger18";
			players[2] = "Devslopes";
			players[3] = "Ponylover";

			
		}

7. Rule: Dont access object or array that is not initialized

		string[] players = {"JonnyKill25", "BamBamBunnyHugger18", "Devslopes", "PonnyLover"};

8. Cubes using array

		GameObject[] cubes = new GameObject[5];

9. Open Unity
	1. Click scene
	2. Right click > 3D Object > Cube
	3. Click Inspector
		1. All coordinates must be 0
	4. Drag the cube to Assets folder
	5. Delete cube from game scene
10. Code

		public GameObject cubePrefab;
		GameObject[] cubes = new GameObject[5];

		float spacer = 0.5f;

		void start() {
			for (int i = 0; i < cubes.Length; i++) {
				// Run this code
				GameObject cube = Instantiate(cubePrefab);
				cubes[i] = cube;
				cube.transform.position = new Vector3(i + (spacer * 1), cube.transform.position.y);
			}
		}

### C# Functions and Methods in Unity 3D ###
1. `Start`: when game starts
2. `Update`: again and again for every frame rendered each second
3. Code

		int health = 100;
		int attackPower = 25;

		void Start() {
			Debug.Log("Health at start: " + health);

			Attack();
		}

		private void Attack() {
			health -= attackPower;
			Debug.Log("Health After Attack: " + health);
		}
4. Right click, > UI > Button
5. Change Text to Attack
6. On Click
7. Drag script to Main Camera
8. Drag Main Camera to On Click
9. Pick `UpTownFunctionYouUP`> `Attack()`

4. Heal

		public void Heal() {
			int healAmount = GetRamdomNumber();
			health += healAmount;

			Debug.Log ("Received " + healAmount + " health");
			Debug.Log ("You now have " + health + " health");
		}

		private int GetRandomNumber() {
			return Random.Range (2, 10);
		}

5. Sheild

		public void Attack() {
			int damageToInflict = GetAttackDamage(shieldOn, sheildAmt, attackPower);
			health -= damageToInflict;
		}

		...

		bool shieldOn = true;
		int shieldAmount = 15;

		private int GetAttackDamage(bool isShieldOn, int theShieldAmnt, int theAttackPower) {
			
			int damage = 0;
			if (isShieldOn) {
				damage = theAttackPower - (int)((float)theShieldAmnt * 0.10f);
			} else {
				damage = theAttackPower;
			}

			return damage; 
		}

## Object Oriented Programming ##
1. Car factory:
	1. Blueprint: Class
2. Example:

		public class Humanoid : MonoBehavior {
			//  
			void Start () {

			}

			// Update is called once per frame
			void Update () {

			}
		}

3. Unless class inherits `MonoBehavior`, we cannot attack it to object(s)
4. Plain class

		public class Humanoid : MonoBehavior {
			protected int health;
			protected int attackDamage;
			protected float movementSpeed;

			public virtual void TakeDamage(int damageToTake) {
				health -= damageToTake;
			}

			public virtual void Attack () {
				return attackDamage;
			}

			public virtual void Move () {
				transform.translate (Vector3.forward = Time.deltaTime);
			}

			public void Die () {

			}
		}

5. Another class

		public class Player : Humanoid {
			private int spinAttackDamage = 10;
			public override int Attack () {
				return attackDamage + spingAttackDamage;
			}
		}

6. Another class

		public class Zombie : Humanoid {
			private int poisonDamage = 3;

			public override void Move () {
				base.Move ();
				transform.Translate(Vector3.left * 3 * Time.deltaTime);
			}

			public int AcidPukeAttack() {
				return attackDamage + poisonDamage;
			}
		}

7. GameManager Script
	1. Drag it onto Main Camera
	
			public class GameManager : MonoBehavior {
				void Start () {
					Zombie zombie = new Zombie ();
					Player player = new Player();
					player.TakeDamage(zombie.Attack());
					player.TakeDamage(zombie.AcidPukeAttack ());

					player.Die();

					Zombie[] zombies = new Zombie [100];

					for (int x = 0; x < zombies.length; x++) {
						zombie [x] = new Zombie();
						Debug.Log("Creating Zombie #:" + x);
					}
				}
			}

## Intro to Haunted Zombie Rush Game ##
1. Assets:
	1. [https://shop.bitgem3d.com](https://shop.bitgem3d.com)
		1. Cannot redistribute
		2. Cannot publish
		3. Cannot sell
	2. Play with models
		1. Texture files
		2. Tear them apart

### Interface Overview ###
1. Layout
	1. Window > Layout > 4 Split
	2. Window > Layout > Tall
	3. Window > Layout > Wide
2. Play button
3. Asset Store:
	1. Window > Asset Store
	2. Purchase
		1. 2D, 3D, Music, ...
	3. Web: Unity Asset Store
4. GameObject
	1. GameObject > 3D Object > Cube
		1. Alt > Keyboard
		2. Click arrows to move around
		3. E -> rotate with mouse
		4. R -> Scale across any access
		5. Q -> Pan
		6. W -> select
		7. Transform tool
5. Main Camera
	1. We can move camera (game scene)
	2. Components
		1. Meshfilter:
		2. Box collider: if something collides, it bounces off
		3. Mesh renderer
			1. Turning off makes object invisible

## Project Creation and Importing Assets into Unity 3D ##
1. Open Unity
2. New
	1. Haunted Zombie Rush
	2. Turn off analytics
3. Layouts > 2 by 3
	1. Put Project down
4. Save Scene as Game
5. Assets
	1. Drag `Fantasy Demon Caves` to Assets folder
6. Drag `Demo_Scene` to the Scene window

## Working with Lighting & Materials in Unity 3D ##
1. Default Skybox:
	1. New  project comes with defult lighting
2. Directional Light
	1. Turning off
3. Window > Lighting
	1. Scene
		1. Skybox
			1. None
4. Turn on light
5. Turn directional light on (to see the game)
6. Rotate with command to see the mouth
7. Delete things behind camera
	1. Hold shift and select or drag and ctrl + delete
8. GameObject > 3D Object > Plain
	1. Right click on Static > Reset
9. Rename Demo Scene to Background
10. Bring it up
11. Bring up Camera
12. Make plane very big
13. Rotate Background at an angle
14. Right click on Assets and Folder > Material (Call it Lava)
15. Albedo, Choose Lava texture
16. Set tiling to 10 and 10

## Altering Shaders in Unity 3D ##
1. Select an object
2. Shader > Unlit > Texture (lighting does not affect the object)
3. Turn the directional light off
	1. Plane > Unlit > Texture
4. Main Camera > Background > Black
5. Put some mountains behind 
	1. Select Mountain
	2. Cmd + D
	3. R to scale

## Switching Build Platform ##
1. File > Build Setting > iOS
2. Double click to install
3. Reopen Unity
4. Select iOS > Switch Platform
5. Change aspect ratio to ipad
6. Select Object and Make it Global

### Foreground ###
1. Select a stone_bridge platform to scene
2. Change Shader to Unlit Texture
3. Move it forward
4. Choose Module platform and drag it
5. cmd + d to duplicate
6. Connect it
7. cmd + d
8. New Empty object and call it Flat
9. Drag the flat components to Flat
10. Select and choose Center and rotate
11. New Emptry Object and call it Platform
	1. Select components and drag them into Platform

### Moving Objects in Unity 3D ###
1. Put the object in Prefab
	1. Right click on Assets > New Folder > Prefabs
	2. Drag the Platform to Prefabs folder
	3. Drag the Prefab from folder to Hierarchy
2. Script
	1. Right click on Assets > New Folder > Scripts
	2. Right Click on Scripts > Create > C# Script > Object1
3. Transform
	
		[SerializeField] private float objectSpeed = 1; // Can change from Unity
		private float resetPosition = -21.65f;
	
		void Update () {
			transform.Translate(Vector3.left * (objectSpeed * Time.deltaTime));

			if (transform.localPosition.x <= resetPosition) {
				Vector3 newPos = new Vector3(79.67, transform.position.y, transform.position.z);
				transform.position = newPos;
			}
		}

4. Drag script to Platform
5. cmd + D the Platform two times and attach them

### Co-Routines and Wait Time in Unity 3D ###
1. Drag Rock04_lava to screen
2. Increase the size and place it at the edge of a bridge
3. 



		
