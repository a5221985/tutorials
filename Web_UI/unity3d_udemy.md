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
	2. Different viewss

