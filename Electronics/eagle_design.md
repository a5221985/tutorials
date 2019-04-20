# Tutorial 1 for Eagle: Schematic Design #
1. Download eagle free version
	1. Limitations - but enough for hobbeists
	2. Run as freeware
2. Open eagle control panel
	1. Design rules
	2. Scripts - automation
	3. CMS Jobs - export to gerber files
3. Example: 555 timer to generate square waves
	1. Size of components
		1. Schematic view
		2. Board view

## Schematic ##
1. New Project (folder: C:/Program Files/Eagle/...)
	1. Blinky Board (New)
	2. Edit description (HTML formatting allowed)

			<b>Blinky Board Blinker</b>
			<p>This is a blinky board PCB</p>
2. Right click on project > New schematic
	1. Add components
		1. Download eagle library from github
			1. Adafruit eagle library
			2. Download zip file
			3. Copy to eagle-<version>/library
		2. Library > Use
			1. Select A and open
	2. Click add button
		1. adafruit
			1. CR1220
				1. Surface mount
		2. Esc for opening the window again
			1. 555
				1. LM555D
		3. Esc
			1. C-US
				1. C-USC0805
					1. 2 of those
		4. Esc
			1. R-US
				1. US-R0805
		5. Esc
			1. LED
				1. LEDCHIPLED_0805
	3. Wiring
		1. Click move to move around
		2. Click and drag to move a group
			1. ctrl + left click and move
		3. Click rotate to rotate
		4. Delete button to delete
		5. Click copy to duplicate
		6. Thick one for bus
			1. click and drag from point to point
		7. Click on ADD
			1. Search for GND
			2. Add each one to the parts
		8. Connect Q to between first resistor and second LED
		9. DMS to between other two resistors
		10. Top of resistor to battery connector
		11. ...
		12. Combine? ok
		13. Unified source is possible
			1. Supply
				1. VCC
					1. Esc twice to get out
		14. Labeling nets
			1. Delete the wire
				1. Add connectors (dots)
				2. Give same name to the two nets (they get connected in board layout)
					1. Tag is added on both ends without physically connected
				3. Give the same name to both tags
					1. CONN
		15. Values
			1. Click on value button
			2. Click on part
				1. 100 (for resistor)
				2. 22uF (capacitor)
				3. green (LED)
				4. CR1220 (Battery)
					1. Rename (BATT)
		16. File > Run (there are many scripts for different operations)
			1. renumber-sch.ulp
				1. Renumbers
3. Design link
	1. Click on top right drop down
		1. Schematic
			1. Searches for parts in database
				1. Give 0.01uF 0805 (with space)
				2. Select
				3. LED:
					1. LED 0805 green
	2. Bill of materials gets generated
		1. We can continue lookup if we don't find
	3. Add to shopping cart (link) or export

## Tutorial 2 for Eagle: Printed Circuit Board Layout ##
1. Open schematic
2. Click Board button
	1. Yes
	2. Selector
		1. Drag the components
		2. Rotate if required
		3. Shortest connections possible and shortest amount of vias as possible
			1. via: connection between top and bottom layer of the board
				1. 2 layer circuit board
				2. 1 layer circuit board
				3. ...
				4. 8 layer circuit board
					1. few layers are GND or VCC (Motherboards usually)
			2. Layers:
				1. Turn off all
				2. Turn on the following:
					1. Top (pads)
					2. Bottom
					3. Pads
					4. Vias
					5. Unrouted
					6. Dimension
					7. tPlace (silksreen)
					8. bPlace
					9. tOrigins (cross air?)
					8. tNames
					9. tValues (component names and values)
					10. tStop (where openings are on top)
					11. tCream (for automated manufacturing - applying solder paste for auto mounting)
					12. Drills
					13. Holes
					14. tDocu (where actual components fit - yellow - does not end up in board - avoids overlapping)
			3. Zoom in and out using mouse 
			4. Clicks Ratsnets button (shortest paths)
			5. Dimensions of board
				1. Change it to reasonable size
				2. Move the board to origin
			6. Ground Plane:
				1. Dissipates heat (helps in soldering as well)
				2. Easier to connect all grounds
				3. Draw a polygon (turn grid on)
					1. Select top layer
						1. Draw around the board (turns to dotted line)
					3. Click on define name
						1. Click polyton
						2. GND
							1. Connects the GNDS of components
				4. Remove silk screens
					1. Smash
						1. select on all components (origins)
						2. Delete values
						3. Move the names around if required
				5. We can change grid spacing
					1. Click on info and we can define the coordinates of components in the grid
					2. We can redefine origin (bottom left, bottom right, ...)
				6. If we make changes, we need to hit rats nest again
			7. Rules:
				1. Edit > Net classes
					1. default:
						1. width: 12mil
						2. Drill: 20mil
						3. Clearance: 10mil
					2. Trace width is determined by the current we need to push through the line
						1. Large current more width
						2. Large clearance for less interference
			8. Click Autorouter Setup
				1. Routing Grid: 10 (mil)
				2. Ok
			9. Draw another polygon
				1. GND
				2. Rats nest
				3. Click via
					1. Add via
						1. Rename via to GND
				4. More vias can be placed for good connections (connecting bottom layer to top)