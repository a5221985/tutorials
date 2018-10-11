# Learn to Construct WordPress Themes by Building 10 Projects #

## Course Intro ##
### Introduction ###
1. Course Description
	1. Building 10 Wordpress themes from start to finish
	2. Fundamentals needed to build great themes
2. Topics
	1. 10 Projects/ Sections
	2. 6 - 10 Lectures Per Section
	3. 1 - 3 Videos Per Lecture
	4. 1 Section Quiz
3. What you should know
	1. HTML/ CSS
	2. PHP (basics)
	3. Wordpress (general idea)
	4. Programming Fundamentals (arrays, variables, loops, if statements, ...)
4. Technologies and concepts
	1. HTML5
	2. CSS3
	3. PHP
	4. Wordpress
	5. Post Loop (main loop that grabs posts from database)
	6. Hooks/ Actions
	7. Functions.php (dynamic code)
	8. Widgets
	9. WP_Query (custom queries)
	10. Theme Customizer (store settings and values for themes)
	11. Twitter Bootstrap
	12. Foundation
	13. Ink
	14. Gridism (css)
	15. W3 CSS
5. Projects Overview
	1. Simple Theme - Introductory theme (syntax)
	2. Advanced Theme - In depth theme (archive and search pages)
	3. Photo Gallery - W3.CSS Framework, Simple Animation
	4. Wordstrap - Twitte Bootstrap, Dropdown menu, wp_navwalker (drop down menus)
	5. Ecommerce Theme - Foundation framework
	6. Business Theme - Theme Customizer, Font Awesome
	7. CleanCut Theme - Twitter Bootstrap, Animate.css
	8. WPNews - Ink Framework (news based, sliders, js widgets)
	9. FourCorners - Foundation Framework, Hover.css (nice animations on hover)
	10. Dynamo Theme - Gridism, UnSlider, jQuery Tabs, Color Customization (light and dark pre-set)

## Building a Simple Theme ##
### Project Intro ###
1. Explain files
2. Syntax
3. Dynamic things
4. Example: Simple website

### Installing & Setting Up Wordpress ###
1. Fresh installation
2. Focus: Code
3. Simple style
4. Server setup: ampps, xampp, wampp, mamp
5. Wordpress.org: Download package
	1. Ampps/www
		1. wpthemes
			1. copy all the files from wordpress package
6. Database: MySQL
	1. phpMyAdmin: http://localhost/phpmyadmin
		1. Databases: New database > wpthemes
		2. **wp-config-sample.php** > **wp-config.php**

				DB_NAME: wpthemes
				DB_USER: root
				DB_PASSWORD: password
				
		3. http://localhost/wpthemes
			1. Site title: WordpressDEV
			2. Username: admin
			3. Password: admin
			4. Your Email: ...
		4. Login
7. Open site

### Required Files & Head Code ###
1. Go to wpthemes folder
	1. wpcontent > themes
	2. New folder: simple
		1. style.css (search for wordpress style.css)

				/*
					Theme Name: Simple
					Author: Brad Traversy
					Author URI: http://eduonix.com
					Description: Very Simple Wordpress Theme
					Version: 1.0
				*/
		
		2. index.php
		3. Put screenshot.png in themes/simple folder
2. Open theme: Nothing
	1. Add `TEST` in index.php
3. `index.php`

		<!DOCTYPE html>
		<html <?php language_attributes(); ?>>
			<head>
				<meta charset="<?php bloginfo('charset'); ?>">
				<title><?php bloginfo('name'); ?></title>
				<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>">
				<?php wp_head(); ?> <!-- Includes additional information needed into head (plugin stylesheet etc...) -->
			</head>
			<body>
		
			</body>
		</html>
			
4. `style.css`

		body {
			background: black;
		}

### Looping Through Posts ###
1. Body

		<header>
			<div class="container">
				<h1><?php blogpost('name'); ?></h1>
				<span><?php bloginfo('description'); ?></span>
			</div>
		</header>
		
		<div class="main">
			<div class="container">
				<?php if(have_posts()) : ?>
					<?php while(have_posts()) : the_post(); ?>
						<h3><?php the_title(); ?></h3>
						<div class="meta">
					Constructed By <?php the_author(); ?> on <?php the_date(); ?>
						</div>
						<?php the_content(); ?>
					<?php endwhile; ?>
				<?php else : ?>
					<?php echo wpautop('Sorry, No posts were found'); ?>
				<?php endif; ?>
			</div>
		</div>
		
		<footer>
			<div class="container">
				<p>&copy; <?php the_date('Y'); ?> - <?php bloginfor('name'); ?></p>
			</div>
		</footer>
		
		<?php wp_footer(); ?> <!-- dispays admin bar -->
		
	1. Settings > Site Title: My Website
	2. Settings > Tagline: The best site ever
	3. Move helloworld post to trash (restore it)
	4. Add another post: My Blog Post
		1. Get lorem ipsum and paste it
		2. Add `<p>`s to get two paragraphs
		3. Publish
	5. Use php date formatting options in manual

			the_date('l js \of F Y h:i:s A');
			the_time('F j, Y g:i:a');
			
2. `style.css`

		body {
			font-family: Arial;
			font-size: 15px;
			color: #333;
			background: #f4f4f4;
			margin: 0;
			padding: 0;
			line-height: 1.7em;
		}
		
		header {
			background: #393939;
			color: #fff;
			padding: 20px 10px;
		}
		
		header h1 {
			color: #fff;
			margin: 0;
			padding: 0;
			padding-bottom: 10px;
		}
		
		.container {
			width: 1020px;
			margin: 0 auto;
			overflow: auto;
		}
		
		.main {
			margin: 15px 0;
		}
		
		footer {
			background: #393939;
			color: #fff;
			padding: 20px 10px;
			text-align: center;
		}
		
	1. Common practice: Break header and footer into their own files and include them in index.php
		1. header.php - copy upto `</header>`
			1. index.php

					<?php get_header(); ?>
		
		2. footer.php - copy upto `<footer>`
			1. index.php

					<?php get_footer(); ?>

### Single Post & Thumbnails ###
1. index.php

		<?php while(have_posts() : the_post(); ?>
			<article>
				<h3>
				<a href="<?php the_permalink(); ?>">
					<?php the_title(); ?>
				</a>
				</h3>
				...
				<a class="button" href="<?php the_permalink(); ?>">
					Read More
				</a>
			</article>
		<?php endwhile; ?>
		
2. style.css

		a {
			color: #333;
		}
		
		article.post {
			border-bottom: 1px #ccc solid;
			overflow: hidden;
		}
		
		article.post a.button {
			display: inline-block;
			background: #333;
			color: #fff;
			padding: 10px 5px;
			margin-bottom: 10px;
			text-decoration: none;
		}
		
	1. Open single page:
		1. New file: **single.php**

				TEST
				
		2. Copy everything from index.php
			1. Remove `<a ...>` tag
			2. Remove `<a ...>` from read more
3. style.css

		.meta {
			background: #333;
			color: #fff;
			padding: 5px;
		}
		
4. Featured image box:
	1. themes/functions.php

			<?php
			function simple_theme_setup() {
				// Featured Image Support
				add_theme_support('post-thumbnails');
			}
			
			add_action('after_setup_theme', 'simple_theme_setup');
			
		1. Open featured image box
			1. Upload files
				1. blog1
			2. Update
5. index.php

		<?php if(has_post_thumbnail()) : ?>
			<div class="post-thumbnail">
				<?php the_post_thumbnail(); ?>
			</div>
		<?php endif; ?>
		
6. style.css

		.post-thumbnail img {
			width: 100%;
			height: auto;
		}
		
7. Copy the image and paste in single.php
8. index.php
	1. change `the_content()` to `the_excerpt()`
9. functions.php

		// Excerpt Length
		function set_excerpt_length() {
			return 60;
		}
		
		add_filter('excerpt_length', 'set_excerpt_length'); // used to change something

### Pages & Menus ###
1. Pages > New Page
	1. About
	2. Paste content (lorem ipsum)
	3. Publish
2. Pages > New Page
	1. Services
	2. Paste content
	3. Publish
3. functions.php

		function simple_theme_setup() {
			...
			// Menus
			register_
		}

### Widget Locations & Comments ###
1. index.php

		<div class="sidebar">
			
		</div>
		
		<div class="clr"></div>
		
2. Put container above main

3. style.css

		.clr {
			clear: both;
		}

		.main {
			...
			float: left;
			width: 68%
		}
		
		.sidebar {
			float: right;
			width: 28%;
		}
		
4. function.php

		// Widget Locations
		function init_widgets($id) {
			register_sidebar(array(
				'name' => 'Sidebar',
				'id' => 'sidebar',
				'before_widget' => '<div class="side-widget">',
				'after_widget' => '</div>',
				'before_title' => '<h3>',
				'after_title' => '</h3>'
			)); // whereever widget is this is used
		}
		
		add_action('widgets_init', 'init_widgets');
		
	1. Widgets is shown in admin screen
		1. Pull Sidebar
		2. Pull Recentposts
5. index.php

		<div class="sidebar">
			<?php if(is_active_sidebar('sidebar')) : ?>
				<?php dynamic_sidebar('sidebar'); ?>
			</?php endif; ?>
		</div>
		
		<div class="clr"></div>
		
6. style.css

		.side-widget {
			border: 1p #ccc solid;
			padding: 10px 10px;
			margin-bottom: 20px;
			margin-top: 20px;
		}
		
		.side-widget li {
			list-style: none;
			line-height: 2.2em;
			border-bottom: dotted solid 1px #ccc;
		}
		
		.side-widget a {
			text-decoration: none;
		}
		
7. page.php
	1. Copy sidebar and clear from index.php to the place
	2. Put container above main
8. single.php
	1. Do the same
9. Put the sidebar and clear in footer.php
10. Comments section: index.php

		<?php comments_template() ?>
		
	1. Check the source to get the css classes
11. index.php: Author section

		<a href="<?php get_author_posts_url(get_the_author_meta('ID')); ?>
			<?php the_author(); ?>
		</a>
		
12. style.css

		.meta a {
			color: #fff;
		}

## Constructing an Advanced Theme ##
### Project Intro ###
1. Showcase
2. Freebox
3. Post types: Gallary posts, link posts, blog posts, comments form
4. Example: Company layout, sub menu (children), archive listing, search

### HTML Template Part A ###
1. index.html
	
		<!DOCTYPE html>
		<html>
			<head>
				<title>Advanced WP Theme</title>
				<link rel="stylesheet" href="style.css">
			</head>
			<body>
				<header>
					<div class="container">
						<h1>
							<a href="index.html">
								Advanced Wordpress Theme
							</a>
							<small>Another Wordpress Theme</small>
						</h1>
						<div class="h_right">
							<form>
								<input type="text" placeholder="Search...">
							</form>
						</div>
					</div>
				</header>
				
				<nav class="nav main-nav">
					<div class="container">
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="about.html">About</a><li>
							<li><a href="#">Services</a></li>
						</ul>
					</div>
				</nav>
				
				<div class="container content">
					<div class="main block"> <!-- block can have a border -->
						<article class="post">
							<h2>Blog Post 1</h2>
							<p class="meta">Posted at 11:00 on May 9 by admin</p>
							<p>Lorem ipsum...</p>
							<p>Lorem ipsum...</p>
						</article>
					</div>
					
					<div class="side">
						<div class="block">
							<h3>Sidebar Head</h3>
							<p>Lorem ipsum...</p>
							<a class="button">More</a>
						</div>
					</div>
				</div>
				
				<footer class="main-footer">
					<div class="container">
						<div class="f_left">
							<p>&copy; 2016 - Advanced WP Theme</p>
						</div>
						<div class="f_right">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li><a href="about.html">About</a><li>
								<li><a href="#">Services</a></li>
							</ul>
						</div>
					</div>
				</footer>
			</body>
		</html>

### HTML Template Part B ###
1. style.css

		body {
			font-family: Arial;
			color: #333;
			margin: 0;
			padding: 0;
		}
		
		ul {
			margin: 0;
			padding: 0;
		}
		
		a {
			color: #009acd;
			text-decoration: none;
		}
		
		a:hover {
			color: #333
		}
		
		.container {
			width: 960px;
			margin: auto;
			overflow: auto;
		}
		
		header {
			background: #f4f4f4;
			padding: 10px;
			border-bottom: 3px solid #009acd;
		}
		
		header h1 {
			margin: 0;
			padding: 0;
			color: #009acd;
			float: left;
		}
		
		header h1 a {
			color: #009acd;
			text-decoration: none;
		}
		
		header small {
			color: #666;
			margin-left: 1px;
			font-size: 13px;
		}
		
		header .h_right {
			float: right;
		}
		
		header .h_right input[type="text"] {
			width: 250px;
			padding: 5px;
			margin-top: 5px;
		}
		
		nav.nav li {
			float: left;
			display: inline;
			padding-right; 15px;
		}
		
		nav.nav a {
			text-decoration: none;
		}
		
		nav.main-nav {
			height: 45px;
			overflow: hidden;
			background: #333;
			color: #fff;
			padding-top: 7px;
		}
		
		nav.main-nav li {
			height: 40px;
			line-height: 40px;
		}
		
		nav.main-nav a {
			color: #fff;
			text-decoration: none;
			padding: 8px;
		}
		
		nav.main-nav a:hover {
			color: #009acd;
		}

		.content {
			margin-top: 30px;
			line-height: 1.5em;	
		}
		
		.main {
			float: left;
			width: 65%;
		}
		
		.side {
			float: right;
			width: 30%;
		}
		
		.block {
			border: #ccc 1px solid;
			padding: 5px 15px 25px 15px;
			background: #fcfcfc;
			overflow: hidden;
		}
		
		.block h3 {
			border-bottom: #ccc solid 1px;
			padding-bottom: 10px;
		}
		
		article.post {
			border-bottom: #ccc solid 1px;
			margin-bottom: 10px;
			padding-bottom: 20px;
		}
		
		article.post .meta {
			background: #009acd;
			color: #fff;
			padding: 7px;
		}
		
		.button {
			background: #009acd;
			color: #fff;
			padding; 10px 15px;
			display: inline-block;
		}
		
		footer.main-footer {
			margin-top: 40px;
			text-align: center;
			background: #333;
			color: #fff;
			height: 60px;
			padding-top: 10px;
			overflow: auto;
		}
		
		footer.main-footer .f_left {
			float: left;
		}
		
		footer.main-footer .f_right {
			float: right;
			margin-top: 15px;
		}
		
		footer.main-footer ul {
			display: inline;
		}
		
		footer.main-footer li {
			float: left;
			padding-right: 10px;
			list-style: none;
		}
		
		footer.main-footer a {
			color: #fff;
		}

### Theme Setup, Navbar & Header ###
1. themes/advanced-wp
	1. style.css

			/*
				Theme Name: Advanced WP
				Author: Brad Traversy
				Author URI: http://eduonix.com
				Description: Advanced Wordpress Theme
				Version: 1.0
			*/
			
		1. copy all from html template and paste it
	
	2. screenshot.png
		1. Activate the theme
	3. index.php
		1. paste all from previous theme

				<html <?php language_attributes(); ?>>
					<head>
						<meta charset="<?php bloginfo('charset'); ?>">
						<meta name="viewport" content="width=device-width, initial-scale=1.0">
						<title><?php bloginfo('name'); ?></title>
						<link rel="stylesheet" href="<?php blog_info('stylesheet_url'); ?>">
						<?php wp_head(); ?>
					</head>
					<body <?php body_class(); ?>>
						...
						<a href="index.html">
							<?php bloginfo('name'); ?>
						</a>
						<small<?php bloginfo('description'); ?></small>
						...
						</header>
						
						<nav ...>
							<div class="container">
								<?php
									$args = array(
										'theme_location' => 'primary'
									);
								?>
								
								<?php wp_nav_menu($args); ?>
							</div>
						</nav>
						<div class="h_right">
							<form method="get" action="<?php esc_url(home_url('/')); ?>">
								<input type="text" name="s" placeholder="Search...">
							</form>
							...
							
						</footer>
						<?php wp_footer(); ?>
						
	4. functions.php

			<?php
				// Theme Support
				function adv_theme_support() {
					// Nav Menus
					register_nav_menus(array(
						'primary' => __('Primary Menu'),
						'footer' => __('Footer Menu')
					));
				}
					
				add_action('after_setup_theme', 'adv_theme_support');
			?>

2. Open Menus in admin console
	1. Menu Name: Main Menu
	2. Our Team, About pages
		1. Add to Menu
	3. Pages:
		1. Our Team
			1. Parent: About
		2. FAQ
			1. This is the FAQ Page	
			2. Parent: About		
		3. Services
			1. This is services Page
	4. Put services in the middle

### Displaying Blog Posts Part A ###
1. index.php
	1. Delete last two article posts
	2. Remove paragraphs
	3. Make Lorem ipsum short

			<a href="<?php echo home_url('/'); ?>">
				...

			<div class="main block">
				<?php if(have_posts)) : ?>
					<?php while(have_posts()) : the_post(); ?>
						<article class="post">
							<h2><?php the_title(); ?></h2>
							<p class"meta">
							Posted at
							<?php the_time('F j, Y g:i a'); ?>
							by
							<a href="<?php echo get_author_posts_url(get_the_author_meta('ID')); ?>">
							<?php the_author(); ?>
							</a> |
							Posted In
							<?php
								$categories = get_the_category();
								$separator = ", ";
								$output = '';
								
								if($categories) {
									foreach($categories as $category) {
										$output .= '<a href="'.get_category_link($category->term_id).'">'.$category->cat_name.'</a>'.$seperator;
									}
								}
								
								echo trim($output, $seperator);
							?>
							</p>
							<?php the_excerpt(); ?>
							
							<a ... href="<?php the_permalink(); ?>">...</a>
						</article>
					<?php endwhile; ?>
				<?php else : ?>
					<?php echo apautop('Sorry, no posts were found'); ?>
				<?php endif : ?>
				
		1. Add few blog posts
2. style.css

		article.post .meta a {
			color: #fff;
		}
		
3. functions.php

		// Excerpt Length
		function adv_set_excerpt_length() {
			return 25;
		}
		
		add_filter('excerpt_length', 'adv_set_excerpt_length');

### Displaying Blog Posts Part B ###
1. functions.php

		function adv_theme_support() {
			// Fetured Image Support
			add_theme_support('post-thumbnails');
			...
		}
		
2. Click on Featured Image
	1. Upload file: _images folder
		1. Choose phones image
	2. Set category to technology
	2. Do the same for blog post 2
3. index.php

		<?php if(has_post_thumbnail()) : ?>
			<div class="post-thumbnail">
				<?php the_post_thumbnail(); ?>
			</div>
		<?php endif; ?>
		
4. style.css

		article .post-thumbnail img {
			width: 100%;
			height: auto;
		}
	
5. header.php
	1. Cut everything belonging to header from index.php
6. footer.php
	1. Cut everything belonging to footer from index.php
7. index.php

		<?php get_header(); ?>
		...
		<?php get_footer(); ?>
	
5. single.php
	1. Copy everything from index.php
	
			<?php the_content(); ?>
			<!-- remove readmore link -->
			

### Archive & Search Results ###
1. themes/advanced-wp/archive.php
	1. Copy index.php
		1. Remove the article tag

				<div class="container content">
					<div class="main block">
						<h1 class="page-header">
							<?php
								if(is_category()) {
									single_cat_title();
								} else if(is_author()) {
									the_post();
									echo 'Archives By Author: ' .get_the_author();
									rewind_posts();
								} else if(is_tag()) {
									single_tag_title();
								} else if(is_day()) {
									echo 'Archives By Day: ' .get_the_date();
								} else if(is_month()) {
									echo 'Archives By Month: ' .get_the_date('F Y');
								} else if(is_year()) {
									echo 'Archives By Year: ' .get_the_date('Y');
								} else {
									echo 'Archives';
								}
							?>
						</h1>
					<?php while...?>
					<div class="archive-post">
						<h4>
							<a href="<?php the_permalink(); ?>">
								<?php the_title(); ?>
							</a>
						</h4>
						<p>Posted On: <?php the_time('F j, Y g:i a'); ?></p>
					</div>
					<?php endwhile; ?>
				
2. style.css

		.archive-post {
			border-bottom: #ccc 1px solid;
			padding-bottom: 10px;
			margin-bottom: 10px;
		}
		
		.archive-post h4, .archive-post p {
			margin: 0;
			padding: 0;
		}
		
3. search.php
	1. Paste what is in archive.php
	2. Change if statements to

			<h1 ...>
				Search Results
			</h1>
			
	3. Make sure search works
4. Appearance/Menus
	1. Custome Links
		1. URL: http://localhost/wpthemes
		2. Text: Home
	2. Pull home to top

### Post Formats Part A ###
1. Post types:
	1. Galleries
	2. Links
	3. Images
	4. Quotes
	5. Status updates
2. Formatting
3. Get template part: stop repeating ourselves
4. Cut the following from index.php and save it in content.php

		<article ...>
		</article>

5. index.php - paste the following in the place

		<?php get_template_part('content.php'); ?>
		
6. content.php on top

		<?php if(is_search() || is_archive()) : ?>
			<!-- copy from archive page -->
		<?php else : ?>
			<!-- cut everything from content.php and paste here
		<?php endif; ?>

	1. Paste the following in archives.php and in search.php

			<?php while(have_posts()) : the_post(); ?>
				<?php get_template_part('content'); ?>
			<?php endwhile; ?>
			
7. Replace `<article>` with the following in simgle.php

		<?php get_template_part('content'); ?>
		
8. content.php

		<?php if(is_single()) : ?>
			<?php the_content(); ?>
		<?php else; ?>
			<?php the_excerpt(); ?>
			<a class="button" href="<?php the_permalink(); ?>">Read More</a>
		<?php endif; ?>
		
9. Gallary: functions.php

		function adv_theme_support() {
			...
			// Post Format Support
			add_theme_support('post-formats', array('aside', 'gallary', 'link'));
		}

### Post Formats Part B ###
1. Check documentation for other formats
	2. Posts/Format in admin
	3. Add a post called Sample Aside
		1. Paste Lorem ipsum
		2. choose Aside
		3. choose business
		4. publish
2. index.php, archive.php, search.php, single.php

		<?php get_template_part('content', get_post_format()); ?>

3. content-aside.php

		<article class="post post-aside">
			<div class="well">
				<small><?php the_author(); ?>@<?php the_data(); ?></small>
				<?php the_content(); ?>
			</div>
		</article>

4. content-gallary.php

		<article class="post post-gallary">
			<h2><?php the_title(); ?></h2>
			<?php the_content(); ?>
		</article>
		
	1. Add new post
		1. Add media
			1. Create gallary
				1. Upload more images from _images
				2. Select all images, click create new gallary
			2. Choose Format as gallary
		2. Publish
		3. Edit to select Link To Media File in Gallary Settings

5. content-link.php
	1. Copy what is in aside

			<div class="well">
				<a href="<?php echo get_the_content(); ?>"><?php echo the_title(); ?></a>
			</div>

	2. Add post
		1. Link
		2. Title: Get awesome web dev courses at Eduonix
		3. Content: http://www.eduonix.com

6. style.css

		article.post-aside small {
			font-wight: bold;
		}
		
		article.post-aside .well {
			background: #e0eefc;
			padding: 10px;
		}
		
		article.post-link .well {
			background: #f4f4f4;
			padding: 10px;
		}
		
		article.post-gallary {
			background: #333;
			color: #fff;
			padding: 5px 10px;
			margin-top: 5px;
		}

### Pages, Custom Templates & Sub Navigation ###
1. page.php
	1. Paste index.php
		1. Remove get_template part

				<?php
				/*
					Template Name: Company Layout
				*/
				?>
				...
				<?php while(have_posts()) ...?>
					<article class="page">
						<h2><?php the_title(); ?></h2>
						<p class="phone">Call Us: 1-800-555-5555</p>
						<?php the_content(); ?>
					</article>
				<?php endwhile; ?>
				
2. style.css

		.phone {
			background: #f4f4f4;
			border: 1px solid #ccc;
			padding: 8px;
			font-weight: bold;
		}
		
	1. pages/About
		1. Template/company layout
	2. pages/Services
		1. Template/company layout

3. Links for child pages
	1. page.php

			<article ...>
				<?php if(page_is_parent() || $post->post_parent > 0) : ?>
					<nav class="nav sub-nav">
						<ul>
							<span class="parent-link"><a href="<?php echo get_the_permalink(get_top_parent()); ?>"><?php echo get_the_title(get_top_parent()); ?></a></span>
							<?php
								$args = array(
									'child_of' => get_top_parent(),
									'title_li' => ''
								);
							?>
							<?php wp_list_pages($args); ?>
						</ul>
					</nav>
				<?php endwhile; ?>
				
4. functions.php

		function get_top_parent() {
			global $post;
			if ($post->post_parent) {
				$ancestors = get_post_ancestors($post->ID);
				return $ancestors[0];
			}
			
			return $post->ID;
		}
		
		function page_is_parent() {
			global $post;
			$pages = get_pages('child_of='.$post->ID);
			return count($pages);
		}
		
5. style.css

		.sub-nav {
			margin-top: 10px;
			float: right;
			width: 300px;
		}
		
		.sub-nave ul {
			float: right;
		}
		
		.sub-nav .parent-link {
			font-weight: bold;
			color: #000;
			float: left;
			margin-right: 20px;
			padding-right: 20px;
			border-right: 1px solid #009acd;
		}
		
		.sub-nav .parent-link a {
			font-weight: bold;
			color: #000;
		}
		
		.sub-nav .current_page_item {
			font-weight: bold;
		}

### Theme Widgets ###
1. functions.php

		// Widget Locations
		
		function init_widgets($id) {
			register_sidebar(array(
				'name' 				=> 'Sidebar',
				'id' 					=> 'sidebar',
				'before_widget' 		=> '<div class="block sidewidget">',
				'after_widget' 		=> '</div>',
				'before_title' 		=> '<h3>',
				'after_title' 		=> '</h3>'
			));
		}
		
		add_action('widgets_init', 'init_widgets');
		
2. index.php
	1. Remove everything inside side div

			<div class="side">
				<?php if(is_active_sidebar('sidebar')) : ?>
					<?php dynamic_sidebar('sidebar');
				<?php endif; ?>
			</div>
			
3. Do the same in archive.php, page.php, single.php, company_template.php and search.php
4. Reload backend
	1. Appearance > Widget
		1. Custom text widget
			1. Title: My text widget
			2. Content: Lorem ipsum
				
					<br><br>
					<button class="button">More</button>
					
5. Dynamic widgets:
	1. Categories
6. style.css

		.side-widget {
			margin-bottom: 20px;
		}
		
		.side-widget li {
			list-style: none;
			line-height: 2.1em;
			border-bottom: 1px dotted #ccc;
		}
		
7. Add Recent posts
	1. 3
8. Gallary title
	1. The title
		1. Photo Gallary
9. Paste register_sidebar four times
	1. name: Box i
	2. id: boxi
	3. class = "box boxi"
10. Check in backend if widgets appear

### Custom Homepage ###
1. front-page.php
	1. Copy from page.php
2. Pages
	1. New pages
		1. Home (publish)
		2. Blog (publish)
3. Settings
	1. Front Page: Home
	2. Posts Page: Blog
4. Appearance/Menus
	1. Add blog to the menu
	2. Move it below About
5. front_page.php
	1. Remove main class in `<div...>`
	2. Remove `<div class="side"...`
6. Showcase widget

		<div class="container content">
			<?php if(is_active_sidebar('showcase')) : ?>
				<?php dynamic_sidebar('showcase'); ?>
			<?php endif; ?>
			...
				<?php if(is_active_sidebar('box1')) : ?>
					<?php dynamic_sidebar('box1'); ?>
				<?php endif; ?>
			
				<?php if(is_active_sidebar('box2')) : ?>
					<?php dynamic_sidebar('box2'); ?>
				<?php endif; ?>
			
				<?php if(is_active_sidebar('box3')) : ?>
					<?php dynamic_sidebar('box3'); ?>
				<?php endif; ?>
			</div>
		<?php get_footer(); ?>
		
	1. Widgets
		1. Text

				<h1>Welcome To Our Site</h1>
				<p>Lorem ipsum...</p>
				<a class="button" href="">Get Started</a>
				
		2. Text put it in Box1
			1. Title: Box 1 Heading
			2. Content

					Lorem ipsum ...
					
		3. Text put it in Box2
			1. Title: Box 2 Heading
			2. Content

					Lorem ipsum ...
					
		4. Grab recent post and put it in Box3
			1. Title: News
			2. Content

					Lorem ipsum ...
					
7. style.css

		.side-widget li, .box li {
			...
		}

		.showcase {
			background: #e0eefc;
			padding: 40px;
			margin-bottom: 30px;
			text-align: center;
		}
		
		.showcase h1 {
			text-align: center;
		}
		
		.box {
			width: 32%;
			float: left;
			padding: 0 6px;
		}
		
		.box h3 {
			text-align: center;
			background: #009acd;
			padding: 5px;
			color: #fff;
		}
		
	1. Set number of posts to 3

### Comment Functionality ###
1. single.php

		<div class="main block">
			...
			<?php comments_template(); ?>
		</div>
		
2. New file: comments.php

		<h2>Comments</h2>
		<?php $args = array(
			'walker'				=> null,
			'max_depth'			=> '',
			'style'				=> 'ul',
			'callback'			=> null,
			'end-callback'		=> null,
			'type'					=> 'all',
			'reply_text'			=> 'Reply',
			'page'					=> '',
			'per_page'			=> '',
			'avatar_size'			=> 80,
			'reverse_top_level'	=> null,
			'reverse_children'	=> '',
			'format'				=> 'html5', // or 'xhtml' if no 'HTML5' theme support
			'short_ping'			=> false,	// @since 3.6
			'echo'					=> true	// boolean, default is true
		); ?>
		
		<?php wp_list_comments($args, $comments); ?>
		
		<?php
		$form_args = array(
				// change the title of send button
				'label_submit' => 'Send',
				// change the title of the reply section
				'title_reply' => 'Write a Reply or Comment',
				// remove "Text or HTML to be displayed after the set of comment fields"
				'comment_notes_after' => '',
				// redefine your own textarea (the comment body)
				'comment_field' => '<p class="comment-form-comment"><label for="comment">' . _x( 'Comment', 'noun' ) . '</label><br /><textarea id="comment" name="comment" cols="45" rows="8" aria-required="true"></textarea></p>',
		);
		
		comment_form($comments_args);
		
3. style.css

		.comment-body {
			border: #ccc 1px solid;
			margin-bottom: 10px;
			padding: 20px 10px;
		}
		
		.comment-meta img {
			float: left;
			margin-right: 10px;
		}
		
		.comment-meta time {
			margin-left: 12px;
		}
		
		.comment-reply-link {
			background: #009acd;
			color: #fff;
			display: inline-block;
			padding: 10px 15px;
		}
		
		.comment-form input, .comment-form textarea {
			width: 100%;
			padding: 3px;
			border: #ccc 1px solid;
			margin-bottom: 20px;
		}
		
		.comment-form input {
			height: 30px;
		}

## Photo Gallery Theme ##
### Project Intro ###
1. W3.CSS framework (easy to work with and looks good)
	1. Animations
	2. JS Widgets
2. Backend
	1. Photos - upload feature image
		1. Time, description
		2. Gallary post format

### Homepage HTML & CSS ###
1. New Folder: photogenic_html
	1. index.html

			<!DOCTYPE html>
			<html>
				<head>
					<title>PhotoGenik</title>
					<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
					<link rel="stylesheet" href="style.css">
				</head>
				<body>
					<header class="w3container w3-teal">
						<div class="w3-row">
							<div class="w3-col m9 l9">
								<h1><span>Photo</span>Genik</h1>
							</div>
							<div class="w3-col m3 l3">
								<input class="w3-input" type="text" placeholder="Search...">
								</p>
							</div>
						</div>
					</header>
					
					<div class="w3-row">
						<div class="w3-row">
							<div class="w3-col m3 l3">
								<ul class="w3-ul">
									<li><a href="#">Nature</a></li>
									<li><a href="#">Animals</a></li>
									<li><a href="#">Objects</a></li>
									<li><a href="#">People</a></li>
									<li><a href="#">Abstract</a></li>
								</ul>		
							</div>
							<div class="w3-col m9 l9">
								<div class="w3-row">
									<div class="w3-col m4 l4 pic">
										<a href="single.html">
											<img src="images/1.jpg" class="w3-animate-opacity">
											<p>Lorem ipsum...</p>
										</a>
									</div>
									<div class="w3-col m4 l4 pic">
										<img src="images/2.jpg" class="w3-animate-opacity">
										<p>Lorem ipsum...</p>
									</div>
									<div class="w3-col m4 l4 pic">
										<img src="images/3.jpg" class="w3-animate-opacity">
										<p>Lorem ipsum...</p>
									</div>
									<div class="w3-col m4 l4 pic">
										<img src="images/4.jpg" class="w3-animate-opacity">
										<p>Lorem ipsum...</p>
									</div>
									<div class="w3-col m4 l4 pic">
										<img src="images/5.jpg" class="w3-animate-opacity">
										<p>Lorem ipsum...</p>
									</div>
									<div class="w3-col m4 l4 pic">
										<img src="images/6.jpg" class="w3-animate-opacity">
										<p>Lorem ipsum...</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<footer>
						<p>PhotoGenik &copy; 2016</p>
					</footer>
				</body>
			</html>
	
	2. style.css

			body {
				background: #000;
				color: #fff;
			}
			
			a {
				text-decoration: none;
			}
			
			li {
				list-style: none;
			}
			
			input {
				color: #333;
			}
			
			img {
				width: 100%;
			}

			header input {
				margin-top: 15px;
			}
			
			.pic {
				text-align: center;
			}
			
			footer {
				text-align: center;
				margin-top: 40px;
				border-top: #333 solid 1px;
			}
	
	3. folder: images

### Animation & Photo Page HTML ###
1. single.html
	1. copy and paste from index.html
	2. Empty 9 column div and put single image

			<article class="post">
				<p class="meta">
					Posted at 2:00 pm on 03-29-2016 by Brad
				</p>
					
				<hr />
					
				<img src="images/1.jpg" class="w3-animate-right">
					
				<div class="w3-row">
					<div class="w3-col l2">
						<br />
						<a href="index.html" class="w3-btn w3-red">Back</a>
					</div>
					<div class="w3-col l10">
						<h1>Photo Title</h1>
						<p>Lorem...</p>
					</div>
				</div>
			</article>

2. style.css

		.post {
			padding: 20px;
		}

### Theme Header & Footer ###
1. wp-content/themes/photogenic
	1. style.css

			/*
				Theme Name: PhotoGenik
				Author: Brad Traversy
				Author URI: http://eduonix.com
				Description: Photo gallery theme
				Version: 1.0.0
			*/
			
	2. index.php
		1. Appearance/Themes
2. wp-themes/photogenic folder in computer
	1. Add screenshot.png in wordpress folder in ampps
3. open style.css in html template and paste everything into style.css
4. index.php
	1. copy everything in index.html file

				<meta charset="<?php bloginfo('charset'); ?>">
				<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>"> <!-- remove style.css -->
				<?php wp_head(); ?>
				
			<body <?php body_class(); ?>>
				<header ...>
					<div class ...>
						<div class ...>
							<h1><?php bloginfo('name'); ?></h1>
			...
			<footer>
				<p><?php bloginfo('name'); ?> &copy; 2016</p>
			</footer>
			
5. header.php
	1. Cut everything from top to `<div class="w3-row">`

6. footer.php
	1. Cut everything under the following and put it in footer

			<div class="w3-col m4 l4 pic">
				...
			</div>
			
7. Include header and footer

		<?php get_header(); ?>
		...
		<?php get_footer(); ?>
		
8. Change name of site
	1. Settings/General
		1. Photogenik

### The Post Loop ###
1. functions.php

		<?php
		
		// Theme Support
		function theme_setup() {
			// Featured Image Support
			add_theme_support('post-thumbnails');
			
			set_post_thumbnail_size(900, 600);
			
			// Post Format Support
			add_theme_support('post-formats', array('gallery'));
		}
		
		add_action('after_setup_theme', 'theme_setup');
		
	1. photogenik/content.php
		1. index.php - remove all content except header and footer

				<?php if(have_posts()) : ?>
					<?php while(have_posts()) : the_post(); ?>
						<?php get_template_part('content', get_post_format()); ?>
					<?php endwhile; ?>
				<?php else : ?>
					<?php echo wpautop('Sorry, there are no posts'); ?>
				<?php endif; ?>
				
		2. content.php
			1. Add a new post
				1. TEST
				2. Choose gallery
	2. photogenik/gallery.php

### Displaying Post Content ###
1. content.php

		<article class="post">
			<h2><?php echo the_title(); ?></h2>
			<p class="meta">
				Posted at <?php the_time(); ?> on
				<?php the_date(); ?> by
				<a href="<?php echo get_author_posts_url(get_the_author_meta('ID')); ?>"><?php the_author(); ?></a>
			</p>
			
			<?php if(has_post_thumbnail()) : ?>
				<div class="post-thumbnail">
					<?php the_post_thumbnail(); ?>
				</div>
			<?php endif; ?>
			<br />
			<?php the_content(); ?>
		</article>
		
2. Grab the following from index.html into content-gallery.php

		<div class="w3-col m4 l4 pic">
			<?php if(has_post_thumbnail()) : ?>
				<div class="post-thumbnail">
					<?php
						$attr = array(
							'class' => 'w3-animate-opacity w3-hover-opacity'
						);
					?>
					
					<a href="<?php echo the_permalink(); ?>">
						<?php echo get_the_post_thumbnail($id, 'large', $attr); ?>
					</a>
				</div>
			<?php endif; ?>
			<?php the_content(); ?>
		</div>
		
	1. All Posts
		1. Delete both posts (dummy ones)
		2. New post
			1. Photo One
			2. Lorem ipsum ...
			3. Choose format as Gallery
			4. Add Category
				1. Nature (choose)
				2. Objects
				3. People
				4. Places
				5. Abstract
		3. Featured Image/ Set featured image
			1. Upload a file
				1. html template - grab first image
				2. Title: Photo1
					1. Caption
					2. Description
		4. Publish
2. style.css

		.pic img {
			width: 100% !important;
			height: 100% !important;
		}

3. Upload rest of the photos
	1. Title: Photo Two
	2. Animals
	3. ...

### Category Widget & Search ###
1. functions.php

		// Widget Locations
		function init_widgets($id) {
			register_sidebar(array(
				'name' => 'Sidebar',
				'id' => 'sidebar'
			)); // doesn't have to be a sidebar to use this
		}
		
		add_action('widgets_init', 'init_widgets');
		
		// Register Widgets
		function custom_register_widgets() {
			register_widget('WP_Widget_Categories_Custom');
		}
		
		add_action('widgets_init', 'custom_register_widgets');
		
2. themes/photogenik/widgets/class-wp-widget-categories.php
	1. Copy from wp-includes/widgets/...categories.php to here
	
			class WP_Widget_Categories_Custom ...
			
3. functions.php

		require_once('widgets/class-wp-widget-categories.php');
		
	1. Appearance/Widgets
		1. Drag Categories
			1. Title: Categories

4. header.php
	1. Remove `ul`
	2. Add the following

			<?php if(is_active_sidebar('sidebar')) : ?>
				<?php dynamic_sidebar('sidebar'); ?>
			<?php endif; ?>
			
	3. Test it
5. class-wp-widget-categories.php
	1. Remove title

			if ( $title ) {
				// echo $args['before_title'] . $title . $args['after_title'];
			}
			
		1. Goto `<ul>`

				<ul class="w2-ul">
				<li><a href="/wpthemes">All Photos</a></li>
				
6. footer.php

		<?php wp_footer() ?>
		
7. header.php

		<form method="get" action="<?php echo esc_url(home_url('/')); ?>">
			<input name="s" class="w3-input" type="text" ... "Search...">
		</form>

### Single Post ###
1. photogenik/single.php
	1. Copy from index.php

			<?php while ...?>
				<!-- copy article from single.html -->
				<p class="meta">
					...
					<p class="meta">
						Posted at <?php the_time(); ?> on <?php the_date(); ?> by
					<a href="<?php echo get_author_posts_url(get_the_author_meta('ID')); ?>"><?php the_author(); ?></a>
				</p>
				...
				<?php if(has_post_thumbnail())...?> <!-- from content-gallery.php -->
					...
					'class' => 'w3-animate-right'
					<!-- remove <a ...> and </a> tags -->
				...
				<a href="<?php echo site_url(); ?>"...>Back</a>
				<h1><?php the_title(); ?></h1>
				<p><?php the_content(); ?></p>

## Wordstrap Theme ##
### Project Intro ###
1. Integration of Bootstrap with Wordpress
2. `wp-bootstrap-navwalker` - navbar with dropdown
3. Search box - posts and pages
4. Backend:
	1. Posts
	2. Featured image
	3. Click on title, inner page is opened
	4. Comments
5. Bootstrap list group

### Index, Header, and Footer ###
1. Default installation of wordpress
2. Open wp installation in editor
	1. themes/wordstrap
		1. style.css

				/*
					Theme name: Wordstrap
					Author: Brad Traversy
					Author URI: http://eduonix.com
					Description: Simple Bootstrap Theme For Wordpress
					Version: 1.0
				*/
				
		2. index.php
			1. Apperance/themes/wordstrap
			2. screenshot.png (wordstrap)
		
					<!DOCTYPE html>
					<html>
						<head>
							<title>Wordstrap</title>
							<link rel="stylesheet" href="<?php bloginfo('template_directory'); ?>/css/bootstrap.css">
							<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>">
						</head>
						<body>
							<!-- remove container-fluid and make it contianer, remove comments -->
							...
							<a class="navbar-brand" herf="<?php bloginfo('url'); ?>"><?php bloginfo('name'); ?></a>
							...
							<!-- remove ul - nav navbar-nav in form -->
							<!-- remove everything from form -->
							<!-- remove ul below -->
							
							<div class="container index">
								<div class="row">
									<div class="col-md-8">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h3 class="panel-title">Blog Posts</h3>
											</div>
											<div class="panel-body">
												<?php if(have_posts()): ?>
					<?php while(have_posts()) : the_post(); ?>
						<div class="row">
							<div class="col-md-3">
								IMAGE HERE
							</div>
							<div class="col-md-9">
								<h2><?php echo the_title(); ?></h2>
							</div>
						</div>	
					<?php endwhile; ?>
												<?php endif; ?>
											</div>
										</div>
									</div>
									<div class="col-md-4">
					<?php if(is_active_sidebar('sidebar')) : ?>
						<?php dynamic_sidebar('sidebar'); ?>
					<?php endif; ?>
									</div>
								</div>
							</div>
							
							<div class="container">
								<hr>
								<footer>
									<p>&copy; 2016 WordStrap</p>
								</footer>
							</div>
							
							<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
							<script src="<?php bloginfo('template_directory'); ?>/js/bootstrap.js"></script>
						</body>
					</html>
					
		3. Download bootstrap
		4. Construct a css folder in wordstrap folder
			1. copy boostrap.css
		5. Construct a js folder in wordstrap folder
			1. copy bootstrap.js
3. Goto bootstrap site
	1. Components/navbar: copy the whole thing and put it in body
4. Grab top to end of nav and put it in header.php
	1. index.php

			<?php get_header(); ?>
			
5. Grab from `<div class="container"><hr>...` to bottom and paste it in footer.php
	1. index.php

			<?php get_footer(); ?>

### The Post Loop Wordstrap Theme ###
1. functions.php

		<?php
		
		function theme_setup() {
			// Featured Image Support
			add_theme_support('post-thumbnails');
		}
		
		add_action('after_setup_theme', 'theme_setup');
		
	1. Add categories
		1. Technology (check)
		2. Food
		3. Entertainment
		4. Business
	2. New Post
		1. Title: Blog Post 1
		2. Description: Lorem ipsum
		3. Featured image: Microsoft Surface
		4. Publish
	3. New Post
		1. Title: Blog Post 2
		2. Category: Food
		3. Description: Lorem ipsum
		4. Featured image: Burger image
		5. Publish
2. index.php

		<?php while(have_posts()) ...?>
			<?php if(have_posts()) : the_post(); ?>
				<article class="post">
			<div class="row">
				<?php if(has_post_thumbnail()): ?>
					<div class="col-md-3">
						<div class="post-thumbnail">
							<?php the_post_thumbnail(); ?>
						</div>
						...
						<a href="<?php echo the_permalink(); ?>">
							<?php echo the_title(); ?></h2>
						</a>
						</h2>
						
						<p class="meta">
						Posted at
							<?php the_time(); ?> on
							<?php the_date(); ?> by
							<strong><?php the_author(); ?></strong>
						</p>
						
						<div class="excerpt">
							<?php echo get_the_excerpt(); ?>
						</div>
						<br/>
						<a class="btn btn-default" href="<?php the_permalink(); ?>">
							Read More &raquo;
						</a>
						...
					</div>
				<?php else: ?>
					<div class="col-md-12">
						<!-- copy everthing from <h2> to </a> -->
					</div>
				<?php endif; ?>
				...
				</article>
			<?php endwhile; ?>
			
3. style.css

		article.post {
			border-bottom: #ccc solid 1px;
			padding-bottom: 20px;
			margin-bottom: 30px;
		}
		
		article.post:last-child {
			border-bottom: none;
		}

		article.post img {
			width: 100%;
			height: auto;
			margin-top: 30px;
		}
		
		article.post .meta {
			background: $f4f4f4;
			padding: 8px 12px;
			color: #333;
		}

### Navbar & Widgets Part A ###
1. wp-bootstrap-navwalker - github page and download
	1. Copy the php file into the folder
2. functions.php

		<?php 

		require_once('wp_bootstrap_navwalker.php');
		
3. Copy the nav from the navwalker and paste it in div above form in header.php

		<div class="collapse navbar-collapse" ...>
			<?php
				wp_nav_menu( array(
				    'theme_location'    => 'primary',
				    'depth'             => 2,
				    'container'         => false,
				    'menu_class'        => 'nav navbar-nav',
				    'fallback_cb'       => 'WP_Bootstrap_Navwalker::fallback',
				    'walker'            => new WP_Bootstrap_Navwalker(),
				) );
			?>
			
4. functions.php

		function theme_setup() {
			...
			register_nav_menus(array(
				'primary' => __('Primary Menu')
			));
		}
		
5. Backend:
	1. Appearance/Menus
	2. New Page
		1. About
		2. This is the about page
		3. publish
	3. New Page
		1. Our Team
		2. This is our team
		3. publish
	4. Menus
		1. Create Menus
		2. Check primary menu
		3. Save
	5. Drop down:
		1. Put Sample page under About
		2. Put Our team under About
6. functions.php

		// Widget Locations
		function init_widgets($id) {
			register_sidebar(array(
				'name'				=> 'Sidebar',
				'id' 				=> 'sidebar',
				'before_widget'	=> '<div class="panel panel-default">',
				'after_widget' 	=> '</div></div>',
				'before_title'	=> '<div class="panel-heading"><h3 class="panel-title">',
				'after_title'		=> '</h3></div><div class="panel-body">'
			));
		}
		
		add_action('widgets_init', 'init_widgets');
		
8. Appearance/Widgets
	1. Sidebar
		1. Pull Categories under it

### Navbar & Widgets Part B ###
1. Title: Categories
2. Pull Recent Posts under Sidebar
	1. Title: Recent Posts
	2. Change it to 3
3. Pull Recent Comments under Sidebar
4. themes/wordstrap/widgets (copy the following from wp-includes/widgets)
	1. wp-includes/class-...-categories.php
		1. Change class name to WP_Widget_Categories_Custom
		2. goto ul

				<ul class="list-group">
				
		3. functions.php

				<?php
				
				require_once('widgets/class-wp-widget-recent-posts.php');
				require_once('widgets/class-wp-widget-recent-comments.php');
				require_once('widgets/class-wp-widget-categories.php');
				...
				// Adds 'list-group-item' to categories li
				function add_new_class_list_categories($list) {
					$list = str_replace('cat-item', 'cat-item list-group-item', $list);
					return list;
				}
				
				add_filter('wp_list_categories', 'add_new_class_list_categories');	// used for changing something
				
				// Register Widgets
				function wordstrap_register_widgets() {
					register_widget('WP_Widget_Recent_Posts_Custom');
					register_widget('WP_Widget_Recent_Comments_Custom');
					register_widget('WP_Widget_Recent_Categories_Custom');
				}
				
				add_action('widgets_init', 'wordstrap_register_widgets');
	
	2. wp-includes/class-...-recent-comments.php
		1. Change class name to WP_Widget_Recent_Comments_Custom
		2. goto ul

				<ul class="list-group" id="recentcomments">
				...
					<li class="list-group-item recentcomments">
	
	3. wp-includes/class-...-recent-posts.php
		1. Change class name to WP_Widget_Recent_Posts_Custom
		2. goto ul

				<ul class="list-group">
					...
					<li class="list-group-item">

### Search & Single Post Page ###
1. header.php

		<form method="get" class="navbar-form navbar-right" role="search" action="<?php echo esc_url(home_url('/')) ?>">
			<label for="navbar-search" class="sr-only"><?php_e('Search', 'textdomain'); ?></label> <!-- localization -->
			<div class="form-group">
				<input type="text" class="form-control" name="s" id="navbar-search">
			</div>
			<button type="submit" class="btn btn-default"><?php_e('Search', 'textdomain'); ?></button>
		</form>
		
2. single.php (automatically picked up)
	1. Copy everything from index.php
		1. Remove

				<?php if(has_post_thumbnail()); ?>
					...
				<?php else : ?>
				
		2. Remove

				<?php endif; ?>
				
	2. Put the image

			</h2>
			
				<?php if(has_post_thumbnail()) : ?>
					<div class="post-thumbnail">
						<?php the_post_thumbnail(); ?>
					</div>
				<?php endif; ?>
				<br/>
				
			...
	
		1. Remove read more
		2. Change `get_excerpt()` to `the_content()` and remove `echo`

				<div class="content">
					<?php the_content(); ?>
				</div>

### Comment Functionality ###
1. single.php

		<?php comments_template(); ?>
		
2. comments.php

		<div class="comments">
			<?php if(have_comments()): ?>
				<h3 class="comments-title">
					<?php
						if(get_comments_number() == 1) {
							echo get_comments_number() . 'Comment';	
						} else {
							echo get_comments_number() . 'Comments';
						}
					?>
				</h3>
				<ul class="row comment-list">
					<?php
						wp_list_comments(array(
							'avatar_size'		=> 90,
							'callback'		=> 'add_theme_comments'
						));
				</ul>
			<?php endif; ?>
			
			<?php
				// If comments are closed and there are comments, let's leave a little note, shall we?
				if ( ! comments_open() && '0' != get_comments_number() && post_type_suppors( get_post_type(), 'comments' ) ) :
				?>
					<p class="no-comments"><?php _e( 'Comments are closed.', 'dazzling' ); ?></p>
			<?php endif; ?>
		</div>
		
		<hr>
		
		<?php
		
				$comments_args = array(
					// change the title of send button
					'label_submit'	=> 'Send',
					// change the title of the reply section
					'title_reply'		=> 'Write a reply or Comment',
					// remove "Text or HTML to be displayed after the set of comment fields"
					'comment_notes_after'	=> '',
					// redefine your own textarea (the comment body)
					'comment_field'	=> '<p class="comment-form-comment"><label for="comment">' . _x( 'Comment', 'noun' ) . '</label><br /><textarea class="form-control" id="comment" name="comment" aria-required="true"></textarea></p>',
				);
				
				comment_form($comments_args);

3. functions.php

		// Add Comments
		function add_theme_comments($comment, $args, $depth) {
			$GLOBALS['comment'] = $comment;
			extract($args, EXTR_SKIP);
			
			if ( 'div' == $args['style'] ) {
				$tag = 'div'; // can be styled
				$add_below = 'comment';
			} else {
				$tag = 'li class="well comment-item"';
				$add_below = 'div-comment';
			}
		}
		
		?>
		
		// paste from https://codex.wordpress.org/Function_Reference/wp_list_comments
		
		<<?php echo $tag; ?> <?php
		comment_class( empty( $args['has_children'] ) ? '' : 'parent' ); ?> id="comment-<?php comment_ID() ?>"><?php 
		if ( 'div' != $args['style'] ) { ?>
		<div id="div-comment-<?php comment_ID() ?>" class="comment-body"><?php
		} ?>
		<div class="comment-author vcard"><?php 
			if ( $args['avatar_size'] != 0 ) {
				echo get_avatar( $comment, $args['avatar_size'] ); 
			} 
			printf( __( '<cite class="fn">%s</cite> <span class="says">says:</span>' ), get_comment_author_link() ); ?>
			</div><?php 
				if ( $comment->comment_approved == '0' ) { ?>
					<em class="comment-awaiting-moderation"><?php _e( 'Your comment is awaiting moderation.' ); ?></em><br/><?php 
				} ?>
				<div class="comment-meta commentmetadata">
					<a href="<?php echo htmlspecialchars( get_comment_link( $comment->comment_ID ) ); ?>"><?php
                /* translators: 1: date, 2: time */
                		printf( 
                			__('%1$s at %2$s'), 
                			get_comment_date(),  
                			get_comment_time() 
                		); ?>
                	</a><?php 
            		edit_comment_link( __( '(Edit)' ), '  ', '' ); ?>
				</div>

				<?php comment_text(); ?>

				<div class="reply"><?php 
					comment_reply_link( 
						array_merge( 
							$args, 
							array( 
								'add_below' => $add_below, 
								'depth'     => $depth, 
								'max_depth' => $args['max_depth'] 
							) 
						) 
					); ?>
				</div><?php 
				if ( 'div' != $args['style'] ) : ?>
					</div><?php 
				endif;
				
4. style.css

		.comment-list {
			list-style: none;
			margin: 0 !important;
			padding: 0;
		}

		.comment-item {
			overflow:auto;
		}

## Foundation Ecommerce Theme ##
### Project Intro ###
### Ecommerce HTML Template Part A ###
### Ecommerce HTML Template Part B ###
### Theme Setup, Logo & Navigation ###
### Custom Showcase Widget Plugin ###
### Sidebar Widgets Setup ###
### Main Product Posts Page ###
### Single Product & Single Page ###

## Business Theme ##
### Project Intro ###
1. Twitter Bootstrap
3. Font awesome
4. Theme customizer
5. Clean design
6. Icons
7. More widgets
8. Contents
	1. Home
	2. Blog
	3. About
	4. Services
9. Backend:
	1. Themes
		1. Customize
			1. Upload logo
			2. Banner (image, text) - updates live
			3. Button (url, text)
			4. Fonts

### Business Theme HTML & CSS Part A ###
1. First HTML template
	1. Example template: Bootstrap.com
		1. Narrow Jumbotron (template)
2. business_html/css/bootstrap.min.css
3. business_html/js/bootstrap.min.js
4. business_html
	1. index.html
		1. Paste source code and paste it (from Narrow Jubotron)
		2. Remove comments
		3. Remove meta tags below viewport
		4. title: Business Theme
		5. Point to bootstrap
		6. Remove rest of the content in head
		7. Point to style.css

				<link rel="stylesheet" href="css/style.css">
				
5. Download font awesome (4.6.2)
	1. Copy css file to css folder and fonts folder to root folder
	2. Link

			<link rel="stylesheet" href="css/font-awesome.min.css">
			
	3. Nav

			<body>
				...
				<nav>
					<li ...href="index.html">Home</li>
					<li ...href="about.html">About</li>
					<li ...href="blog.html">Blog</li>
				...
				<img src="img/logo.png"> <!-- copy from project files -->
			</div>
			
		1. new folder img
			1. Paste the logo

	4. Jumbotron - keep it
		1. Copy everything from jumbotron-narrow.css to style.css (open source code)
			1. Remove comments
		2. Remove media queries
		3. Remove 

				.header,
				.marketing,
				.footer {
					...
				}
				
		4. Add the following

				.container {
					max-width: 1020px;
				}
				
6. index.html

			...>Sign up today</a></p>
		</div>

		<section class="row marketing">
			<div class="col-lg-4">
				<i class="fa fa-bar-chart fa-3"></li>
				<h3>Subheading</h3>
				<p>...</p>
			</div>
		
			<div class="col-lg-4">
				<i class="fa fa-code fa-3"></li>
				<h3>Subheading</h3>
				<p>...</p>
			</div>
			
			<div class="col-lg-4">
				<i class="fa fa-desktop fa-3"></li>
				<h3>Subheading</h3>
				<p>...</p>
			</div>
		</section>
		
		<section class="row content-region-1 pt50 pb40">
			<div class="container">
				<div class="col-md-12">
					<h1>Clean Bootstrap Wordpress Theme</h1>
					<p class="lead">Lorem ...</p>
				</div>
			</div>
		</section>
		
		<section class="row content-region-2 pt40 pb40">
			<div class="container">
				<div class="col-md-5">
					<img src="img/pic1.jpg"> <!-- get it from project files -->
				</div>
				<div class="col-md-7">
					<h3>Theme Features</h3>
					<ul class="list-group">
						<li class="list-group-item"><i class="fa fa-check" aria-hidden="true"></i> Clean Code</li>
						<li class="list-group-item"><i class="fa fa-check" aria-hidden="true"></i> Clean Code</li>
						<li class="list-group-item"><i class="fa fa-check" aria-hidden="true"></i> Clean Code</li>
						<li class="list-group-item"><i class="fa fa-check" aria-hidden="true"></i> Clean Code</li>
					</ul>					
				</div>
			</div>
		</section>
		
		<footer>
			<div class="container">
				<div class="col-lg-4">
					<h4>Heading</h4>
					<p>Lorem...</p>
				</div>
			
				<div class="col-lg-4">
					<h4>Heading</h4>
					<ul>
						<li><a href="#">...</li>
						<li><a href="#">...</li>
						<li><a href="#">...</li>
						<li><a href="#">...</li>
					</ul>
				</div>
				
				<div class="col-lg-4">
					<h4>Contact Us</h4>
					<form>
						<div>
							<input type="text" placeholder="Name">
						</div>
						<div>
							<input type="text" placeholder="Email Address">
						</div>
						<div>
							<textarea placeholder="Message"></textarea>
						</div>
						<input class="btn btn-primary" type="submit" value="Send">
					</form>
				</div>
			</div>
		</footer>

### Business Theme HTML & CSS Part B ###
1. about.html
	1. Copy from index and paste
		1. Remove jumbotron
		2. Remove next section `<section class="row marketing">`
		3. Title bar area:
			1. Copy `<section class="row content-region-1 pt50 pb40">...` to under `img/logo.png` section
				1. Keep only `row title-bar` classes

							<div class="col-md-12">
								<h1>About Us</h1>
							</div>
						
						<section class="row marketing">
							<div class="container">
								<div class="col-md-8">
									<p>Lorem...</p>
									<p>Lorem...</p>
									<br>
									<a class="btn btn-primary-reverse btn-block">Contact Us</a>
								</div>
								<div class="col-md-4">
									<div class="side-widget">
										<h3>Text Widget</h3>
										<p>Lorem...</p>
									</div>
									
									<div class="side-widget">
										<h3>Categories</h3>
										<ul class="list-group">
											<li class="list-group-item"><a href="#">Business</a></li>
											<li class="list-group-item"><a href="#">Technology</a></li>
											<li class="list-group-item"><a href="#">Food</a></li>
											<li class="list-group-item"><a href="#">Family</a></li>
										</ul>
									</div>
								</div>
							</div>
						</section>
						
			4. Remove `class="active"` from home `li` and put it on `about`

2. blog.html
	1. Copy from about page and paste
		1. Change `About Us` to `Blog`
	2. Change 8 column div

			<div class="col-md-8">
				<article class="post">
					<div class="col-md-5">
						<img src="img/blog1.jpg">
						<a href="single.html" class="btn btn-primary btn-block">Read More</a>
					</div>
					<div class="col-md-7">
						<ul class="meta">
							<li>By <a href="#">Admin</a></li>
							<li>May 11, 2016</li>
							<li><a href="#">Business</a></li>
						</ul>
						<h3>Lorem Ipsum</h3>
						<p>Lorem...</p>
					</div>
				</article>
				<div class="clr"></div>
				<article class="post">
					<div class="col-md-5">
						<img src="img/blog2.jpg">
						<a href="single.html" class="btn btn-primary btn-block">Read More</a>
					</div>
					<div class="col-md-7">
						<ul class="meta">
							<li>By <a href="#">Admin</a></li>
							<li>May 11, 2016</li>
							<li><a href="#">Business</a></li>
						</ul>
						<h3>Lorem Ipsum</h3>
						<p>Lorem...</p>
					</div>
				</article>
				<article class="post">
					<div class="col-md-5">
						<img src="img/blog3.jpg">
						<a href="single.html" class="btn btn-primary btn-block">Read More</a>
					</div>
					<div class="col-md-7">
						<ul class="meta">
							<li>By <a href="#">Admin</a></li>
							<li>May 11, 2016</li>
							<li><a href="#">Business</a></li>
						</ul>
						<h3>Lorem Ipsum</h3>
						<p>Lorem...</p>
					</div>
				</article>
				
3. style.css

		article.post img {
			width: 100%;
		}
		
4. single.html
	1. Copy from blog and paste
	2. Keep only one article (remove the other two)

			<article...>
				<img src="img/blog1.jpg">
				<ul class="meta">
					<li>By <a href="#">Admin</a></li>
					<li>May 11, 2016</li>
					<li><a href="#">Business</a></li>
				</ul>
				<hr>
				<p>Lorem...</p>
				<p>Lorem...</p>
			</article>
			
5. Move active to blog li

### Business Theme HTML & CSS Part C ###
1. style.css

		body {
			...
			font-size: 15px;
			color: #7a7a7a;
			line-height: 1.7em;
		}
		
		a {
			color: #0faf97;
		}
		
		.btn-primary {
			backgroun: #0faf97;
			color: #fff;
			border-color: #fff;
		}
		
		...
		.nav-pills > li.active > a,
		.nav-pills > li.active > a:hover,
		.nav-pills > li.active > a:focus {
			background: #0faf97;
		}
		
		.jumbotron {
			text-align: center;
			border-bottom: 1px solid #e5e5e5;
			padding-top: 90px;
			padding-bottom: 90px;
			background: url('../img/banner.jpg') 0 -80px;
			color: #fff;
		}
		
1. index.html
	1. Remove top level `<div class="container">` in `body`
	2. Remove `<script src="../../">` at the bottom
	3. Add container to heading and box area

			<div class="header clearfix">
				<div class="container">
					...
			...
			<section class="row marketing">
				<div class="container">
					<div class="col-lg-4">
						...
						
			<div class="jumbotron">
				<div class="container">
					<h1>Jumbotron</h1>
						...
						<a class="btn btn-lg btn-primary" ...></a>
	
3. style.css

		.btn-primary:hover {
			background: #fff;
			color: #0faf97;
			border-color: #0faf97;
		}
		
		.btn-primary-reverse {
			background: #fff;
			color: #0faf97;
			border-color: #0faf97;
		}
		
		.btn-primary-reverse:hover {
			background: #0faf97;
			border-color: #fff;
		}
		
		...
		
		.block {
			border: #ccc solid 1px;
			padding: 20px 20px 30px 20px;
			text-align: center;
		}
		
		.block h3 {
			color: #0faf97;
		}
		
		.fa {
			color: #0faf97;
		}
		
		.fa-3 {
			font-size: 4em !important;
		}
		
		.marketing {
			margin: 40px 0;
		}
		
		.content-region-1 {
			background: #0faf97;
			color: #0faf97;
			text-align: center;
		}
		
		.content-region-2 {
			background: #f4f4f4;
			color: #333333;
		}
		
		.content-region-3 {
			background: #000000;
			color: #ffffff;
		}
		
		.content-region-2 img {
			width: 100%:
		}
		
		.content-regions-3 h4 {
			border-left: 5px #0faf97 solid;
			padding-left: 8px;
			margin-bottom: 20px;
		}
		
		.content-region-1 h1, .content-region-2 h1 {
			margin: 0;
			padding: 0;
			padding-bottom: 15px;
			font-size: 40px;
		}
		
		.pt20 { padding-top: 20px; }
		.pb20 { padding-bottom: 20px; }
		.pt30 { padding-top: 30px; }
		.pb30 { padding-bottom: 30px; }
		.pt40 { padding-top: 40px; }
		.pb40 { padding-bottom: 40px; }
		.pt50 { padding-top: 50px; }
		.pb50 { padding-bottom: 50px; }
		.pt60 { padding-top: 60px; }
		.pb60 { padding-bottom: 60px; }
		
4. Wrap in block class

		<div class="block">
			<i class="fa ...>
		</div>
		
		<div class="block">
			<i class="fa ...>
		</div>
		
		<div class="block">
			<i class="fa ...>
		</div>
		
5. footer

		<footer ... content-region-3 pt30 pb40">
		
6. style.css

		body {
			// remove padding-botton
			...
		}
		...
		.content-region-3 form input[type="text"], .content-region-3 form textarea {
			width: 100%;
			padding: 5px;
			background: #333;
			color: #fff;
			margin-bottom: 10px;
			border: 0;
		}
		
7. About page: about.html
	1. Remove top container
	2. Remove bottom section
	3. Header: Add container

			<div class="container">
				<nav>
					...
				</nav>
			</div>
			...
			<footer class="footer content-region-3 pt30 pb40">
			
8. style.css

		.side-widget {
			margin-bottom: 40px;
		}
		
		.side-widget h3 {
			border-left: 5px #0faf97 solid;
			padding-left: 10px;
			margin-bottom: 15px;
		}
		
9. blog.html, single.html

		<footer class="footer content-region-3 pt30 pb40">
			...
			
	1. Remove top level container
	2. Remove bottom script
	3. Add container to head

			<div class="container">
				<nav>
					...
					
10. Title bar: style.css

		.title-bar {
			background: #0faf97;
			color: #ffffff;
			padding-bottom: 10px;
			border-bottom: 6px #ddd solid;
		}
		
		article.post {
			border-bottom: 1px #ccc solid;
			overflow: auto;
			padding-bottom: 30px;
			margin-bottom: 40px;
		}
		
		article.post .meta {
			border-top: #ccc solid 1px;
			border-bottom: #ccc solid 1px;
			overflow: auto;
			list-style: none;
			margin: 0;
			padding: 5px 0;
		}
		
		article.post .meta li {
			float: left;
			margin-right: 20px;
		}
		
		article.post img {
			width: 100px;
			margin-bottom: 20px;
		}
		
11. single.html
	1. Remove top container
	2. Remove bottom script

			<body>
				<div class="header...">
					<div class="container">
						<nav>
							...

### Navigation and Custom Logo Upload ###
1. wpthemes/themes/business
	1. style.css

			/* 
				Theme Name: Business Theme
				Author: Brad Traversy
				Author URI: http://eduonix.com
				Description: Simple Business Theme
				Version: 1.0
			*/
			
			/* paste everything for style.css */
			
	2. index.php
		1. Copy from index.html
	3. copy bootstrap.css and font-awesome.css into css folder in wordpress business theme
	4. copy fonts js and img folders into wordpress business theme
	5. Copy `screenshot.png` in root
2. index.php

		<html <?php language_attributes(); ?>>
			<head>
				<meta charset="<?php bloginfo('charset'); ?>">
				...
				<title><?php bloginfo('name'); ?></title>
				
				<link href="<?php bloginfo('template_url'); ?>/css/bootstrap.css" ...>
				<link href="<?php bloginfo('template_url'); ?>/css/font-awesome.css" ...>
				<link href="<?php bloginfo('stylesheet_url'); ?>" ...>
				<?php wp_head(); ?>
			</head>
			
			<body <?php body_class(); ?>>
				...
				<nav> <!-- remove this -->
				<?php
					wp_nav_menu(array(
						'theme_location'	=> 'primary',
						'depth'			=> 2,
						'container'		=> false,
						'menu_class'		=> 'nav nav-pills pull-right',
						'fallback'		=> 'wp_bootstrap_navwalker::fallback',
						'walker'			=> new wp_boostrap_navwalker()	
					));
				
	
	1. copy wp_bootstrap_navwalder.php from project folder into root
3. functions.php

		<?php 
		require_once('wp_bootstrap_navwalker.php'); 
		
		// Theme Support
		function business_theme_setup() {
			// Logo Support
			add_theme_support('custom-logo')
			
			register_nav_menus(array(
				'primary'	=> __('Primary Menu')
			));
		}
		
		add_action('after_setup_theme', 'business_theme_setup');
		
4. In backend: Open Menus option
	1. Theme locations: Primary menu (save)
5. index.php

		<img ...> <!-- remove -->
		<?php if(has_custom_logo()) : ?>
			<?php the_custom_logo(); ?>
		<?php else : ?>
			<h1><?php bloginfo('name'); ?></h1>
		<?php endif; ?>
		
6. Customize/Site Identity/Logo
	1. Select logo.png
	2. Crop image
	3. Save
7. Admin menu: index.php

		<?php wp_footer(); ?>
		
8. header.php
	1. Cut from top to `div` above jumbotron from index.php

			<?php get_header(); ?> <!-- index.php -->
			
	2. Paste in header.php
9. footer.php
	1. Cut from `footer` to bottom

			<?php get_footer(); ?> <!-- index.php -->

### Adding Customizer Sections & Settings ###
1. New file: front-page.php
	1. Copy everything from index.php and paste
2. Goto Customizer
3. Goto pages:
	1. Home
	2. Blog
4. Settings:
	1. Front page displays: A static page (select below)
	2. Front page: Home
	3. Posts page: Blog
5. functions.php

		function business_customize_register($wp_customize) {
			// Banner Section
			$wp_customize->add_section('banner', array(
				'title' => __('Banner', 'business'),
				'description' => sprintf(__('Options for homepage banner', 'business')),
				'priority' => 130
			));
			
			// Heading Setting
			$wp_customize->add_setting('banner_heading', array(
				'default'			=> _x('Banner Heading', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Heading Control
			$wp_customize->add_control('banner_heading', array(
				'label'			=> __('Heading', 'business'),
				'section'			=> 'banner',
				'priority'		=> 20
			));
			
			// Text Setting
			$wp_customize->add_setting('banner_text', array(
				'default'			=> _x('Welcome to the Wordpress Business Theme. This theme uses the Twitter Bootstrap 3 framework and can be customized to your liking', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Text Control
			$wp_customize->add_control('banner_text', array(
				'label'			=> __('Text', 'business'),
				'section'			=> 'banner',
				'priority'		=> 20
			));
			
			// Button Setting
			$wp_customize->add_setting('banner_btn_text', array(
				'default'			=> _x('Sign Up', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Button Control
			$wp_customize->add_control('banner_btn_text', array(
				'label'			=> __('Button Text', 'business'),
				'section'			=> 'banner',
				'priority'		=> 20
			));
			
			// Button URL Setting
			$wp_customize->add_setting('banner_btn_url', array(
				'default'			=> _x('http://test.com', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Button URL Control
			$wp_customize->add_control('banner_btn_url', array(
				'label'			=> __('Button URL', 'business'),
				'section'			=> 'banner',
				'priority'		=> 20
			));
			
			// Button Image Setting
			$wp_customize->add_setting('banner_btn_url', array(
				'default'			=> get_bloginfo('template_directory').'/img/banner.jpg',
				'type'				=> 'theme_mod'
			));
			
			// Button Image Control
			$wp_customize->add_control(new WP_Customize_Image_Control($wp_customize, 'banner_image', array(
				'label'		=> __('Background Image', 'business'),
				'section'		=> 'banner',
				'settings'	=> 'banner_image' 
			)));
			
			// Boxes Section
			$wp_customize->add_section('boxes', array(
				'title'		=> __('Boxes', 'business'),
				'description'	=> sprintf(__('Options for homepage boxes', 'business')
				),
				'priority'	=> 130
			));
			
			// BOX 1
			// Box 1 Heading Setting
			$wp_customize->add_setting('box1_heading', array(
				'default'			=>	_x('Box 1 Heading', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Box 1 Heading Control
			$wp_customize->add_control('box1_heading', array(
				'label'			=> __('Box 1 Heading', 'business'),
				'section'			=> 'boxes',
				'priority'		=> 20
			));
			
			// Box 1 Text Setting
			$wp_customize->add_setting('box1_text', array(
				'default'			=>	_x('Macenas sed diam eget risus varius bladit sit amet non magna.', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Box 1 Heading Control
			$wp_customize->add_control('box1_text', array(
				'label'			=> __('Box 1 Text', 'business'),
				'section'			=> 'boxes',
				'priority'		=> 20
			));
			
			// Box 1 Icon Setting
			$wp_customize->add_setting('box1_icon', array(
				'default'			=>	_x('bar-chart', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Box 1 Icon Control
			$wp_customize->add_control('box1_icon', array(
				'label'			=> __('Box 1 Icon', 'business'),
				'section'			=> 'boxes',
				'priority'		=> 20
			));
			
			// BOX 2
			// Box 2 Heading Setting
			$wp_customize->add_setting('box2_heading', array(
				'default'			=>	_x('Box 2 Heading', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Box 2 Heading Control
			$wp_customize->add_control('box2_heading', array(
				'label'			=> __('Box 2 Heading', 'business'),
				'section'			=> 'boxes',
				'priority'		=> 20
			));
			
			// Box 2 Text Setting
			$wp_customize->add_setting('box2_text', array(
				'default'			=>	_x('Macenas sed diam eget risus varius bladit sit amet non magna.', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Box 2 Heading Control
			$wp_customize->add_control('box2_text', array(
				'label'			=> __('Box 2 Text', 'business'),
				'section'			=> 'boxes',
				'priority'		=> 20
			));
			
			// Box 2 Icon Setting
			$wp_customize->add_setting('box2_icon', array(
				'default'			=>	_x('icon', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Box 2 Icon Control
			$wp_customize->add_control('box2_icon', array(
				'label'			=> __('Box 2 Icon', 'business'),
				'section'			=> 'boxes',
				'priority'		=> 20
			));
			
			// BOX 3
			// Box 3 Heading Setting
			$wp_customize->add_setting('box3_heading', array(
				'default'			=>	_x('Box 3 Heading', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Box 3 Heading Control
			$wp_customize->add_control('box3_heading', array(
				'label'			=> __('Box 3 Heading', 'business'),
				'section'			=> 'boxes',
				'priority'		=> 20
			));
			
			// Box 3 Text Setting
			$wp_customize->add_setting('box3_text', array(
				'default'			=>	_x('Macenas sed diam eget risus varius bladit sit amet non magna.', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Box 3 Heading Control
			$wp_customize->add_control('box3_text', array(
				'label'			=> __('Box 3 Text', 'business'),
				'section'			=> 'boxes',
				'priority'		=> 20
			));
			
			// Box 3 Icon Setting
			$wp_customize->add_setting('box3_icon', array(
				'default'			=>	_x('desktop', 'business'),
				'type'				=> 'theme_mod'
			));
			
			// Box 1 Icon Control
			$wp_customize->add_control('box3_icon', array(
				'label'			=> __('Box 3 Icon', 'business'),
				'section'			=> 'boxes',
				'priority'		=> 20
			));
		}
		
		add_action('customize_regisiter', 'business_customize_register');
		
6. Cut everything from functions.php from business_customize... add_action and paste in
	1. inc/customizer.php
	2. functions.php

			// Customizer File
			require get_template_directory(). '/inc/customizer.php';

### Implementing Customizer Settings ###
1. front-page.php

		<h1><?php echo get_theme_mod('banner_heading', 'Banner Heading'); ?></h1>
		<p class="lead"><?php echo get_theme_mod('banner_text', 'Welcome to the Wordpress Business Theme. This theme uses the Twitter Bootstrap 3 framework and can be customized to your liking'); ?></p>
		<p><a ... href="<?php echo get_theme_mod('banner_btn_url', 'http://test.com'); ?>"><?php echo get_theme_mod('banner_btn_text', 'Sing Up Today'); ?></a></p>
		
2. If we change the text in backend, it changes
3. style.css
	1. Cut `background: url...` and paste in header.php as follows:

			<style>
				.jumbotron {
					background: url(<?php echo get_theme_mod('banner_image', get_blog_info('template_url').'/img/banner.jpg'); ?>) ...;
				}
			</style>
			
4. Boxes:
	1. front-page.php

			<section class="row marketing">
				<div ...>
					<div ...>
						<div ...>
							<i class="fa fa-<?php echo get_theme_mod('box1_icon', 'bar-chart'); ?> ..."></i>
							<h3><?php echo get_theme_mod('box1_heading', 'Box 1 Heading'); ?></h3>
							<p><?php echo get_theme_mod('box1_text', 'Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum.'); ?></p>
				...
				<div class="col-lg-4">
					<div ...>
						<i class="fa fa-<?php echo get_theme_mod('box2_icon', 'code'); ?> fa-3"></i>
						<h3><?php echo get_theme_mod('box2_heading', 'Box 2 Heading'); ?></h3>
						<p><?php echo get_theme_mod('box2_text', 'Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum.'); ?></p>
						
				<div class="col-lg-4">
					<div ...>
						<i class="fa fa-<?php echo get_theme_mod('box3_icon', 'desktop'); ?> fa-3"></i>
						<h3><?php echo get_theme_mod('box3_heading', 'Box 1 Heading'); ?></h3>
						<p><?php echo get_theme_mod('box3_text', 'Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum.'); ?></p>

### Theme Widget Positions ###
1. Widgets:
2. functions.php

		// Widget Locations
		function init_widgets($id) {
			register_sidebar(array(
				'name'				=> 'Content Region 1',
				'id'				=> 'content-region-1',
				'before_widget'	=> '',
				'after_widget'	=> '',
				'before_title'	=> '',
				'after_title'		=> ''
			));
		}
		
3. cut the following from front-page.php

		<section class="row content-region-1 pt50 pb40">
			<div class="container">
				<div class="col-md-12">
				
	1. Take the following from front-page.php (closing of the above)

					</div>
				</div>
			</section>
				
	2. Paste it in functions.php

			// Widget Locations
			function init_widgets($id) {
				...
				'before_widget'	=> '<section class="row content-region-1 pt50 pb40"><div class="container"><div class="col-md-12">',
				'after_widget'	=> '</div></div></section>',
				'before_title'	=> '<h1>'
			}
			
	3. Change the following in front-page.php

			<h1>Clean Bootstrap Wordpress Theme</h1>
			<p class="lead">Lorem ipsum ...</p>
			
		1. to

				<?php if(is_active_sidebar('content-region-1')) : ?>
					<?php dynamic_sidebar('content-region-1'); ?>
				<?php endif; ?>
				
	4. Do the above for content-region-2

			register_sidebar(array(
				'name'					=> 'Content Region 2',
				'id'					=> 'content-region-2',
				'before-widget'		=>	'<section class="row content-region-1 pt50 pb40"><div class="container">',
				'after_widget'		=> '</div></section>',
				'before_title'		=> '<h1>',
				'after_title'			=> '</h1>'
			));
			
	5. front-page.php

			<?php if(is_active_sidebar('content-region-2')) : ?>
				<?php dynamic_sidebar('content-region-2'); ?>
			<?php endif; ?>
			
	6. front-page.php
		1. Replace the following

				<div class="col-md-5">
					<img src="img/pic1.jpg">
				</div>
				<div class="col-md-7">
					<h3>Theme Features</h3>
					<ul class="list-group">
						...
				</div>
				
			1. with

					<?php if(is_active_sidebar('content-region-1')) : ?>
						<?php dynamic_sidebar('content-region-1'); ?>	
					<?php endif; ?>
					
					<?php if(is_active_sidebar('content-region-2')) : ?>
						<?php dynamic_sidebar('content-region-2'); ?>	
					<?php endif; ?>
					
4. functions.php

		add_action('widgets_init', 'init_widgets');
		
5. Backend:
	1. Content Region 1
		1. Bring Text
			1. Title: Clean Bootstrap WordPress Theme
			2. Text: Paste lorem...
	2. Content Region 2
		1. Bring Text
			1. Title: Nothing
			2. Content: Paste the 5 column div with image and 7 column div with `Theme Features` section
6. functions.php

		register_sidebar(array(
			'name'		=> 'Footer 1',
			'id'		=> 'footer-1',
			'before_widget'	=> '',
			'after_widget'	=> '',
			'before_title'	=> '<h4>',
			'after_title'		=> '</h4>'
		));
		
		register_sidebar(array(
			'name'		=> 'Footer 2',
			'id'		=> 'footer-2',
			'before_widget'	=> '',
			'after_widget'	=> '',
			'before_title'	=> '<h4>',
			'after_title'		=> '</h4>'
		));
		
		register_sidebar(array(
			'name'		=> 'Footer 3',
			'id'		=> 'footer-3',
			'before_widget'	=> '',
			'after_widget'	=> '',
			'before_title'	=> '<h4>',
			'after_title'		=> '</h4>'
		));
		
7. footer.php

		

### Blog Index Page ###
### Single Posts & Comments ###

## CleanCut Theme ##
### Project Intro ###
1. animate.css
	1. Toggle animation
2. bootstrap
3. Drop downs (wp-walker)
	1. Animation effects
4. Photo gallary
5. A lot of customization

### Website HTML Template Part A ###
### Website HTML Template Part B ###
### CleanCut Theme Setup & Menu ###
### Showcase & Social Customization ###
### Banner & Animation Control ###
### Blog Posts & Custom Query Part A ###
### Blog Posts & Custom Query Part B ###
### Single Post & Comments ###
### Pages & Sub Navigation ###
### Post Formats & Bottom Widget ###

## WPNews Theme ##
### Project Intro ###
1. Template for news website
	1. inc.css framework (similar to bootstrap and better - widgets, extra features)

### Ink HTML Template ###
### WPNews Theme Setup & Menu ###
### Main Post Loop ###
### Custom Query Loops ###
### Single Post Page ###
### Archive, Search & Pages ###

## FourCorners Theme ##
### Project Intro ###
1. Elegent theme
2. Font awesome
3. Featured posts (different look)
4. hover.css - library for hover effects
5. Customization

### FourCorners HTML Template Part A ###
1. Libraries
	1. Foundation
	2. Font Awesome
	3. Hover.css
2. Color scheme can be changed
3. Color theme can be changed

### FourCorners HTML Template Part B ###
### FourCorners HTML Template Part C ###
### FourCorners Theme Setup ###
### Homepage Posts ###
### Blog, Archive & Search Pages ###
### Single Posts, Pages & Widgets ###
### Gallery Posts ###

## Dynamo Theme ##
### Project Intro ###
1. Technologies:
	1. Slider - unslider
	2. jQuery tabs - jQuery UI
	3. gridism - responsive CSS grid (similar to bootstrap grids)
		1. Lightweight

### Dynamo HTML Template Part A ###
### Dynamo HTML Template Part B ###
### Slideshow & Tabs JavaScript ###
### Dynamo Theme Files & Menu Setup ###
### Homepage Posts With Slideshow & Tabs ###
### Blog Page & Single Posts ###
### Color Customizations ###

## Course Summary ##
### Summary ###