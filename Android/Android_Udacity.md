# Android Development #

## Creation of Project Sunshine ##
### Introduction ###
### Are you ready? ###
### Introducing Project Sunshine ###
### A Brief Intro to Angroid Studio ###
### Codin, GitHub, and Flow ###
### Quiz: Coding, GitHub, and Fl... ###
### Creation of First Project ###
### Android Min and Target Versions ###
### Setting Min and Target ###
### Running Code ###
### Android Software Stack ###
### Acitivites, Packages, and Layout Introduction ###
1. Activity:
	1. Component responsible for user interaction
	2. Single focused thing that user can do.
	3. Responsible for creation of window that app uses to draw and receive events from system
	4. Series of activities are stacked to maintain context
		1. Back button returns to previous activity and then to launcher
2. Android application: A collection of components that work with each other and outside
3. 4 types of components:
	1. Activity
	2. Service
	3. Broadcase Receiver
	4. Content Provider
4. Each component is registered in manifest
5. Each activity contains layout that provides system with detailed info about what to display and how to display it.
6. `res`
	1. for different types of devices
		1. images
	2. acitivity_main.xml
		1. Stores layouts
		2. view object hierarchy
		3. `setContentView(R.layout.activity_main)` - deflates objects into view objects in memory

### Android Layouts Primer ###
1. Android Layouts Primer
	1. Review of concepts
2. Activities and Layouts 
	1. Activity: Single focused thing that a user can do.
		1. Activities initiate creation of window that app uses to draw and receive events from system.
		2. Written in Java (extend `Activity` class)
		3. Activity generates views to show user info and let user interact with activity.
			1. `View`: Class in Android UI framework
				1. Responsible for drawing and handling events
			2. Activity determines the view and where to put them by reading xml layout file.
				1. xml files are in `res` folder inside `layouts`
3. Layout XML
	1. Example:

			<?xml version="1.0" encoding="utf-8"?>
			<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
				xmlns:tools="http://schemas.android.com/tools"
				android:layout_width="match_parent"
				android:layout_height="match_parent"
				android:orientation="vertical"
				android:padding="16dp"
				tools:context="com.example.android.exampleapp.MainActivity">

				<EditText
					android:id="@+id/edit_text_name_input"
					android:layout_width="match_parent"
					android:layout_height="wrap_content"
					android:background="@color/colorAccent"
					android:hint="Enter your name"
					android:padding="4dp"
					android:textSize="24sp" />

				<TextView
					android:id="@+id/text_view_name_display"
					android:layout_width="wrap_content"
					android:layout_height="wrap_content"
					android:layout_gravity="center"
					android:layout_marginTop="8dp"
					android:text="Your name appears here"
					android:textSize="30sp" />
			</LinearLayout>

4. Type of View: UI Components
	1. Two categories:
		1. UI Components that may be interactive
			1. Examples:
				1. TextView: text on screen, non interactive in general
				2. EditView: text input on screen
				3. ImageView: image on screen
				4. Button: button on screen
				5. Chrnometer: simple timer on screen
			2. `android.widget`: package that contains most UI view classes
		2. Layout or Container views
5. Type of View: Container View
	1. They extend `ViewGroup`
		1. They contain a group of views
		2. Example:

				<?xml version="1.0" encoding="utf-8"?>
				<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
					xmlns:tools="http://schemas.android.com/tools"
					android:layout_width="match_parent"
					android:orientation="vertical"
					tools:context="com.example.android.exampleapp.MainActivity">
					<TextView
						android:layout_width="wrap_content"
						android:layout_height="wrap_content"
						android:layout_gravity="center"
						android:text="A"
						android:textSize="30sp" />
					<TextView
						android:layout_width="wrap_content"
						android:layout_height="wrap_conent"
						android:layout_gravity="center"
						android:text="B"
						android:textSize="30sp" />
					<TextView
						android:layout_width="wrap_content"
						android:layout_height="wrap_content"
						android:layout_gravity="center"
						android:text="C"
						android:textSize="30sp" />
				</LinearLayout>

	2. Examples of Container views
		1. LinearLayout: displays views in single column or row
		2. RelativeLayout: Displays views positioned relative to each other and this view
		3. FrameLayout: meant to contian single child view
		4. SrollView: FrameLayout designed to let user scroll through content in view
		5. ConstraintLayout: positions views in flexible way
	3. Layout views can be nested

6. XML Attributes
	1. Attributes control properties of view.
	2. Example:

			<?xml version="1.0" encoding="utf-8"?>
			<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
				xmlns:tools="http://schemas.android.com/tools"
				android:layout_width="match_parent"
				android:layout_height="match_parent"
				android:orientation="vertical"
				android:padding="16dp"
				tools:context="com.example.android.exampleapp.MainActivity">

				<EditText
					android:id="@+id/edit_text_name_input"
					android:layout_width="match_parent"
					android:layout_height="wrap_content"
					android:background="@color/colorAccent"
					android:hint="Enter you name"
					android:padding="4dp"
					android:textSize="24sp" />

				<TextView
					android:id="@+id/text_view_name_display"
					android:layout_width="wrap_content"
					android:layout_height="wrap_content"
					android:layout_gravity="center"
					android:layout_marginTop="8dp"
					android:text="Your name appears here"
					android:textSize="30sp" />
			</LinearLayout>

		1. `textSize`
		2. `padding`
	3. Determine specifics of how view looks and interacts
	4. Examples:
		1. Text: `android:text="Your name appears here"`
		2. Width and height
			1. Must be defined
			2. May define in pixels, or dp (density-independent pixels)
			3. Examples:
				
					android:layout_width="200dp"
					android:layout_height="300dp"
		3. Responsive layout (for different devices)
			1. `wrap_content`: will shrik view to wrap whatever is displayed inside view
			2. `match_parent`: expands size of view to be as large as parent view
		4. Padding and Margin
			1. `padding`: space withing boundaries of view
			2. `layout_margin`: space outside boundaries of view

7. How do XML Layouts relate to Java Activities
	1. To associate a layout with an activity, use `onCreate` of `Activity` with method `setContentView`. Pass reference to layout file as `R.layout.name_of_layout`
		1. Example:

				public class MainActivity extends AppCompatActivity {
					@Override
					protected void onCreate(Bundle savedInstanceState) {
						super.onCreate(savedInstanceState);
						setContentView(R.layout.activity_main);
						// other code to setup the activity
					}
					// other code
				}
	2. R Class
		1. When app is compiled, R class gets generated.
			1. Constants are created in R which allows us to dynamically identify contents of `res` folder
	3. `setContentView`: inflates layout. Andoid reads xml file and generates Java objects for each tag in layout file. We can edit the objects in java code by calling method on Java objects.
8. Additional resources
	1. 

### Exercise: Framing Favorite T...###
1. Select **Import Project**
	1. We can see `TODO` comments
2. `app/build.gradle`: delete `ConstraintLayout` dependency
3. `activity_main.xml`: layout file to determine what must be shown in `MainActivity.java`
	1. `ConstraintLayout`: change it to `FrameLayout` (contains one view or overlapping views)

### Exercise: Toying with Favorite ... ###
1. Open Project tab
2. Open `MainActivity.java`
	
		TextView mToysListTextView;
		...
		@Override
		protected void onCreate(...) {
			mToysListTextView = (TextView) findViewById(R.id.tv_toy_names);
			...
			for (String toyName: toyNames) {
				mToysListTextView.append(toyName + "\n\n\n");
			}		
		}

	1. `R`: class is autogenerated by Android tool chain
	2. `.`: / is replaced since Java does not allow /
	3. `\n\n\n`: In android it is `\n`

3. Open `activity_main.xml`

		<TextView
			android:id="@+id/tv_toy_names"
			... />

	1. `@`: not treat content in quotes as string literal but look for content inside android resources
	2. `+`: If id does not exist it may be created
	3. `id`: tells that it is id

### Exercise: See More Favorite T... ###
1. Add a scroll view

		<ScrollView
			android:layout_width="match_parent"
			android:layout_height="wrap_content"
			<TextView
				... />
		</ScrollView>

### Visual Layout Editor ###
1. We can place stuff
	1. Text
	2. Images
	3. ...
	4. Widget
2. New project
	1. LayoutPlayspace
3. Constraint layout: special, complex constraints on child views that allow for dynamic layouts for different window sizes
	1. activity_main.xml

			<android.support.constraint.ConstraintLayout xmlns ...>
				
			</android.support.constraint.ConstraintLayout>
4. Turn off constraints
	1. Disable magnet button
	2. Switch to landscope view
	3. Add widgets
		1. text: TextView
			1. text: Today, Wed

### Handling Different Screen ###
1. Do not use constraint layout
2. Tools for layouts:
	1. Layout inference
	2. Separate layouts for different screens

### Responsive Design ###
1. Consider different screens
	1. Phone, tab, tv, wearable
2. There are three layouts
	1. Linear layout
	2. Constraint layout
	3. Grid layout
3. The layouts can dynamically adap to any screen following the principle of responsive design

### Layout Managers ###
1. Set alternative layouts for different screen sizes
	1. Layouts inerit from ViewGroup class
	2. Use simple layout
	3. Frame layout: single child view like list view that fills the content area
		1. Multiple views may overlap
		2. We can set positions relative
	4. Linear layout: for stacking views vertically or horizontally
		1. Breaks up layout proportionally
	5. Constraint Layout: bit complicated
		1. Each views position can be positioned relative to parent

### Exercise: Update Sunshine L ... ###
1. Follow the todos

### Exercise: Add Scrolling Weat ... ###
1. Open project
2. Add id for text view in the layout
3. Member variable for text view
4. Append weather strings and line separators to text view

### Solution: Add Scrolling Weat ... ###
1. `findViewById`: gets view from XML layout by it's ID and stores it in Java object
2. `setText`: overwrites content
3. `append`: adds text

## Connect to the Internet ##
### Introduction ###
### Loggin ###
1. Determine logging level
	1. Error (release version has)
	2. Warn (release version has)
		1. Low disk space
	3. Info (release version has)
	4. Debug
	5. Verbose
2. Syntax:
	1. `Log.x(String TAG, String message)`
		1. `TAG`: Any string but classname is preferred
	2. `Log.e()`: errors
	3. `Log.w()`: warning messages
	4. `Log.i()`: info (connected to internet ...)
	5. `Log.d()`: debug info
		1. URL
		2. 
	6. `Log.v()`: granular info
3. More severe level than error: WTF (What a Terrible Failure)
	1. Errors that should never ever ever ever ever .... happen
	2. Device can halt and output debug report
	3. May not be used in general


### Internet Toy App Intro ###
1. Open [https://api.github.com/search/repositories?q=android&sort=stars](https://api.github.com/search/repositories?q=android&sort=stars) in browser

### Exercise: Creation of Layout ###
1. Open T02.01-Exercise-CreateLayout
2. Open activity_main.xml
	1. Change to `LinearLayout`
	2. add `android:orientation="vertical"`
	3. Add padding

			android:paddingLeft="16dp"
			android:paddingRight="16dp"
			android:paddingTop="16dp"

	4. Remove TextView
	5. Add

			<EditText
				android:id="@+id/et_search_box"
				android:hint="Type a query for Github!"
				android:layout_width="wrap_content"
				android:layout_height="wrap_content" />
		
		1. Hint is displayed when edit text is empty

	6. Add a TextView for entering a URL

			<TextView
				android:id="@+id/tv_url_display"
				android:textSize="22sp"
				android:layout_marginTop="8dp"
				android:text="Enter a search query and your URL will show up here!"
				android:layout_width="wrap_content"
				android:layout_height="wrap_content" />

	7. Add ScrollView

			<ScrollView
				android:layout_width="match_parent"
				android:layout_height="wrap_content">
				<TextView
					android:id="@+id/tv_github_search_results_json"
					android:text="Make a search query and your URL will show up here!"
					android:textSize="22sp"
					android:layout_width="wrap_content"
					android:layout_height="wrap_content"

			</scrollView>

	8. MainActivity.java

			EditText mSearchBoxEditText;

			TextView mUrlDisplayTExtView;

			TextView mSearchResults;

			onCreate(...) {
				mSearchBoxEditText = (EditText) findViewById(R.id.et_search_box);
				mUrlDisplayTextView = (TextView) findViewById(R.id.tv_url_display);

				mSearchResults = (TextView) findViewById(R.id.tv_github_search_result_json);

			}

	9. build.gradle
		1. Remove `compile org....constraind-layout:1.0.0`
		2. Sync the project

### Resources ###
1. What is res Directory?
	1. Should contain images, strings, layouts
2. Different Resource Directories [here](https://developer.android.com/guide/topics/resources/providing-resources.html)
	1. Some Common Resource Types
		1. values: XML files that contain simple values (strings, integers)
		2. drawable: visual files, Bitmap files and shapes
		3. layouts
	2. Other Resource Types
		1. animator: XML files for property animations
		2. anim: XML files for tween animations
		3. color: XML files that define state list colors
		4. mipmap: Drawable files for launcher icons
		5. menu: XML files that define app menus
		6. raw: arbitrary files saved in raw form (audio files - can use [assets folder](https://developer.android.com/reference/android/content/res/AssetManager.html))
		7. xml: arbitrary xml (xml config files)
3. Why Resources
	1. separates file types
	2. Makes maintenance easy (example to match button images to new style)
	3. Different languages and screen size configurations (customization)
4. Using Resources in XML and Java
	1. `setContentView(R.layout.activity_main)`: usage of a resource `activity_main.xml`
	2. `R.layout`: static class generated automatically to reference resouces
	2. Working with strings.xml
		1. **res** -> **values** -> **strings.xml**
			1. `getString`: returns a string from **strings.xml**
				1. input: resource id which is in **strings.xml**
		2. Example:

				<string name="today">Today</string>

				<!-- For labelling tomorrow's forecast [CHAR LIMIT=15] -->
				<string name="tomorrow">Tomorrow</string>

				<!-- Date format [CHAR LIMIT=NONE] -->
				<string name="format_full_friendly_date">
					<xliff:g id="month">%1$s</xliff:g>, xliff:g id="day">%2$s</xliff:g>
				</string>

			1. `today` is id of string `Today`
			2. `format_full_friendly_date` is id of `<xliff:g id="month">%1$s</xliff:g>, <xliff:g id="day">%2$s</xliff:g>`
		
		3. To reference "Today"

				String myString = getString(R.string.today);
		4. To access a string in XML `@string` accessor method
		5. [documentation](https://developer.android.com/guide/topics/resources/string-resource.html)

### On Menus ###
1. Android has menus
	1. Menu is instantiated using resource

			<menu
				xmlns:android:http://schemas.android.com/apk/res/android">
				<item
					android:id="@+id/action_search"
					android:orderInCategory="1"
					android:title="Search" />
			</menu>

2. Action bar was added to the top of activity window in HoneyComb
	1. Actions appear as buttons
	2. Showing action

			<menu xmlns:android="http://schemas.android.com/apk/res/android"
				xmlns:app="http://schemas.android.com/apk/res-auto">
				<item
					android:id="@+id/action_search"
					android:orderInCategory="1"
					app:showAsAction="ifRoom"
					android:title="Search" />
			</menu>

		1. `app:showAsAction`:
			1. `app`: namespace because we are using appCompat to make app compatible with API level 10 Gingerbread devices

	3. Java

			@Override
			public boolean onCreateOptionsMenu(Menu menu) {
				getMenuInflater().inflate(R.menu.main, menu);
				return true;
			}

	4. To handle menu item selections

			@Override
			public boolean onOptionsItemSelected(MenuItem item) {
				int itemThatWasClickedId = item.getItemId();
				if (itemThatWasClickedId == R.id.action_search) {
					Context context = MainActivity.this;
					String textToShow = "Search clicked";
					Toast.makeText(context, textToShow, Toast.LENGTH_SHORT).show();
					return true;
				}
				return super.onOptionsItemSelected(item);
			}

### Exercise: Add a Menu ###
1. title in strings.xml

		<string name="search">Search</string>

2. Right click on res > New > AndroidResourceDirectory
	1. Select Menu for Resource type
3. Right click on menu resource directory > ResourceFile
	1. File name: main
	2. In the file add

			<menu ...
				xmlns:app="http://schemas.android.com/apk/res-auto" >

				<item
					android:title="@string/search"
					android:orderInCategory="1"
					app:showAsAction="ifRoom"
					android:id="@+id/action_search" />

		1. `orderInCategory`: if there are multiple items
		2. `app`: option/enter to add app namespace
4. MainActivity.java

		@Override
		public boolen onCreateOptionsMenu(Menu menu) {
			getMenuInflater().inflate(R.menu.main, menu);
			return true;
		}

		@Override
		public boolean onOptionsItemSelected(MenuItem item) {
			return super.onOptionsItemSelected(item);
		}

5. Toast: used to provide simple feedback about operation in popup
	1. Automatically disappers

			@Override
			public boolean onOpitonsItemSelected(MenuItem item) {
				int menuItemThatWasSelected = item.getItemId();
				if (menuItemThatWasSelected == R.id.action_search) {
					Context context = MainActivity.this;
					String message = "Search clicked";
					Toast.makeText(context, message, Toast.LENGTH_LONG).show();
				} // switch is peferred for lot of options
				return super.onOptionsItemSelected(item);
			}
		1. `show()`: shows the toast

### Exercise: Build our URL ###
1. Constants:

		final static String GITHUB_BASE_URL = "https://api.github.com/search/repositories";
		final static String PARAM_QUERY = "q";
		final static String PARAM_SORT = "sort";

2. Building search URL

		Uri.builtUri = Uri.parse(GITHUB_BASE_URL).buildUpon()
						.appendQueryParameter(PARAM_QUERY, githubSearchQuery)
						.appendQueryParameter(PARAM_SORT, sortBy)
						.build();

	1. `buildUpon()`: generates Uri.Builder
	2. `build()`: produces Uri
3. Produding URL

		URL url = null;
		try {
			url = new URL(builtUri.toString());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

4. MainActivity.java

		void makeGithubSearchQuery() {
			String githubQuery = mSearchBoxEditText.getText().toString();
			URL githubSearchUrl = NetworkUtils.buildUrl(githubQuery);
			mUrlDisplayTextView.setText(githubSearchUrl.toString());
		}

### Fetching an HTTP Request ###
### Permissions ###
### Quiz: Permissions ###
### Exercise: Connect to the Internet ###
### Thread Basics ###
### AsyncTask ###
### Quiz: AsyncTask ###
### Exercise: Creation of an AsyncTask ###
### Exercise: Missing Permissions ###
### Exercise: Add Polish ###
### JSON Format ###
### Quiz: JSON by Hand ###
### Quiz: Parse JSON ###
### Exercise: Networking ###
### Exercise: Menus ###
### Exercise: Add Loading Polish ###
### Refresh Bad!!! ###
### Recap ###

## RecyclerView ##
### Introduction ###
### Why RecyclerView? ###
### How RecyclerView Works ###
### Using RecyclerView ###
### Why ViewHolders? ###
### Quiz: findViewById() Calls ###
### Visualizing ViewHolders ###
### Creation of RecyclerView Layout ###
### Exercise: Creation of RecyclerView ###
### Items and ViewHolders ###
### Exercise: Items and ViewHolders ###
### RecyclerView and Adapters ###
### Quiz: Adapters and RecylerView ###
### Creation of an Adapter ###
### Exercise: Creation of an Adapter ###
### RecyclerView Layout Manager ###
### Wiring Up RecyclerView ###
### Exercise: Wiring Up RecyclerView ###
### Visualizing Recycling ###
### Responding to Item Clicks ###
### Exercise: Click Handling ###
### Exercise: Creation of RecyclerView ###
### Exercise: Click Handling ###
### Recap ###

## Intents ##
### Introduction ###
### Sunshine App UX Mocks ###
### Intents Framework ###
### Explicit Intent Toy App ###
### Creation of an Activity ###
### Exercise: Creation of an Activity ###
### Creation of an Intent ###
### Exercise: Start and Actvity ###
### Passing Data Between Activities ###
### Exercise: Pass Data ###
### What are Implicit Intents? ###
### Creation of Implicit Intents ###
### Exercise: Open a Web Page ###
### Understanding URIs ###
### Quiz: Identify Parts of URIs ###
### Creation of a Map Intent ###
### Exercise: Show a Map ###
### Sharing is Caring! ###
### Media Types ###
### Implementing a Share Intent ###
### Exercise: Creation of a Share Intent ###
### Quiz: Explicit vs Implicit Intent ###
### Exercise: Add a New Activity ###
### Exercise: Send Data ###
### Exercise: Add Sharing ###
### Recap ###

## Lifecycle ##
### Introduction ###
### Why We Need an Activity LifeCycle ###
### Android Activity Lifecycle ###
### Reto on the Android Acitivity Lifecycle ###
### Exercise: Lifecycle Events ###
### Why does this Happen? ###
### Save and Restore Instance S... ###
### Exercise: Persisting Data ###
### Exercise: Fix the Lifecycle Dis ... ###
### App Termination ###
### Preparing for Termination ###
### Persisting Data With an Old ... ###
### Exercise: Persisting Data Par ... ###
### AsyncTask and Loaders ###
### Quiz: AsyncTaskLoader Adva ... ###
### Leveraging Loaders ###
### Exercise: Add an AsyncTaskL... ###
### Caching with Loaders ###
### Exercise: Caching with Loaders... ###
### Exercise: AsyncTaskLoader i... ###
### Conclusion ###

## Preferences ##
### Introduction ###
### Introducing the Visualizer ###
### Visualizer Code ###
### Download the Code ###
### Data Persistence ###
### Quiz: Persistant Storage Options... ###
### Preference Fragments ###
### Setting up the Settings Activity ###
### Exercise: Setup Settings ###
### Making a PrerenceFragme... ###
### Exercise: Make a Preference... ###
### Reading From SharedPrefer... ###
### Exercise: Reading from Shar... ###
### Use Resources! ###
### Exercise: Use Resources ###
### Why Aren't The Preferences... ###
### Preference Change Listener ###
### Exercise: Preference Change... ###
### Add Two More Checkboxes ###
### Exercise: Add Two More Che... ###
### List Preference ###
### Exercise: List Preference ###
### Preference Summary ###
### Exercise: Preference Summary ###
### Edit Text Preference ###
### Exercise: Edit Text Preference ###
### Edit Size Crashes ###
### Edit Text Preference Constra... ###
### Exercise: Edit Test Preference... ###
### Preferences in Sunshine ###
### Should it be a Setting ###
### Exercise: Creation of Settings ###
### Solution: Creation of Settings ###
### Exercise: Creation of Preferences ###
### Exercise: Update the MainAc... ###
### Conclusion ###

## Storing Data in SQLite ##
### Introduction ###
### Why SQLite? ###
### Quiz: SQL Query ###
### Waitlist ToyApp ###
### Creation of Contract ###
### Running Unit Tests ###
### Exercise: Creation of Contract ###
### Creation of database ###
### Exercise: Creation of Database ###
### Querying All Guests ###
### Exercise: Query All Guests ###
### Updating the Adapter ###
### Exercise: Update The Adapter ###
### Adding Guests ###
### Exercise: Add Guests ###
### Removing Guests ###
### Exercise: Remove Guests ###
### Exercise: Sunshine Database ###
### Exercise: Invalid Inserts in ###
### Exercise: Resolve Conflicts ###

## Content Providers ##
### Introduction ###
### Content Providers ###
### Content Provider Advantages ###
### DroidTermsExample ###
### Exercise: Setup QuizExample ###
### Content Provider Permissions ###
### The Content Resolver ###
### Four Basic Operations ###
### Uniform Resource Identifier ###
### Quiz: TVTime ###
### Solution: TVTime 
### Quiz: Actor Query ###
### Solution: Actor Query ###
### Quiz: Calendar Provider ###
### Solution: Calendar Provider ###
### Calling the ContentProvider ###
### Exercise: Make an AsyncTask ###
### Structure of the Data ###
### Working with Cursors Review ###
### Exercise: Use the Cursor ###
### Solution: Use the Cursor ###
### Conclusion ###

## Building a Content Prov... ##
### Introduction ###
### ToDO List Code ###
### Exercise: Data Design ###
### Steps for Creation of Provider ###
### Creation of TaskConentProvider ###
### Exercise: Creation of Registe... ###
### Define the URI Structure ###
### Wildcard Characters ###
### Quiz: Design Task URIs ###
### Exercise: Change the Contract ###
### Build the URIMatcher ###
### Exercise: Which Match ###
### Solution: Which Match ###
### Exercise: Add a URIMatcher ###
### A Small Note on Testing ###
### Resolver to Database Flow ###
### Overview of Provider Function... ###
### Quiz: Determine the CRUD M... ###
### Insert ###
### Hook it up to the UI ###
### Exercise: Implement Insert ###
### Query ###
### Display the Tasks ###
### Exercise: Implement Query ###
### Query for One Item ###
### Query for One Item Part Two ###
### Exercise: Selection and Selec... ###
### Exercise: Implement Delete ###
### Exercise: Swipe to Delete ###
### Update ###
### getType ###
### Working ToDo List App! ###
### Applying This to Sunshine ###
### Testing ###
### Exercise: Sunshine Content ... ###
### Solution: Sunshine Content ... ###
### Exercise: bulkInsert ###
### Solution: bulkInsert ###
### Exercise: Add Delete Function ###
### Solution: Add Delete Function ###
### Exercise: Using a CursorLoa... ###
### Solution: Using a CursorLoa ###
### Exercise: More Weather Det... ###
### Solution: More Weather Det... ###
### Outro ###

## Background Tasks ##
### Introduction ###
### Running in the Background ###
### Hydration Reminder ###
### Services ###
### Services vs. Loaders ###
### Quiz: Services vs. Loaders ###
### Starting Services ###
### Running Services in the Back... ###
### Intent Services ###
### Starter Code ###
### Quiz: Get the Starter Code ###
### Plan for Adding an IntentSer... ###
### Exercise: Add an IntentServi... ###
### Notifications ###
### Pending Intents ###
### Exercise: Notifications ###
### Notification Actions ###
### Exercise: Adding Actions to N... ###
### Foreground Services ###
### Quiz: Application Priority ###
### Issuing Reminders ###
### Scheduling Jobs ###
### Exercise: Schedule with Fireb... ###
### Broadcast Reviewers ###
### Exercise: Show When Chargi... ###
### Exercise: Getting the Current... ###
### Syncing Sunshine ###
### Exercise: Synchronizing The ... ###
### Exercise: SmarterSyncing ###
### Exercise: Sunshine FirebaseJ... ###
### Exercise: Sunshine Notification... ###
### Conclusion ###

## Completing the UI ##
### Introduction ###
### Views & View Groups ###
### Quiz: What will this look like? ###
### Constraint Layout ###
### Installing the Constraint Lay... ###
### Design the Boarding Pass ###
### Adding Shapes and Images ###
### Adding Vector Images ###
### Exercise: Constraint Layout ###
### The Hierarchy Viewer ###
### Quiz: Which Layout performs... ###
### Data Binding ###
### Accessibility & Internationalization ###
### Accessibility ###
### Quiz: Accessibility ###
### Localization ###
### Responsive Design ###
### Exercise: Landscape Layout ###
### Exercise: Sunshine's New La... ###
### Solution: Sunshine's New La... ###
### Exercise: Sunshine Today's L... ###
### Solution: Sunshine Today's L... ###
### Exercise: Data Binding in Su... ###
### Solution: Data Binding in Su... ###

## Polishing the UI ##
### Introduction ###
### Android Design Principles ###
### Toy App ###
### Visual Mocks and keylines ###
### Color Guidelines ###
### Quiz: Choose a Color Scheme ###
### Solution: Choose a COlor Sch... ###
### Font Guidelines ###
### Changing Colors and Fonts ###
### Exercise: Add Colors and Fo... ###
### Styles and Themes ###
### Style a Mail Layout ###
### Style Inheritance ###
### Exercise: Creation of a New Style ###
### Desiging for Multiple Scree... ###
### Screen Density ###
### Different Layouts ###
### Resource Folder Qualifiers ###
### Smallest Width Qualifier ###
### Quiz: Choose the Qualifier ###
### Creation of a Tablet Layout ###
### Exercise: Code a Custom Lay... ###
### Touch Selectors ###
### Exercise: Code Your Own Sel... ###
### Moving on to Sunshine ###
### Exercise: Add Colors, Fonts, ... ###
### Solution: Add Colors, Fonts, ... ###
### Exercise: Creation and Application of S... ###
### Solution: Creation and Application of S... ###
### Exercise: Add a Touch Select... ###
### Solution: Add a Touch Select... ###
### Exercise: Add Resource Qual... ###
### Solution: Add Resource Qual... ###
### Outro of all Outros ###
### Next Steps! ###