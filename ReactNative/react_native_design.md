# React Native - Design #

## React Native Flex Basics ##
1. Flex:
	1. flex = 1 for each of the three boxes
		1. Ratio is 1/3 of the total space
2. flexDirection:
	1. column (default)
	2. row
	3. row-reverse
3. justifyContent: 'space-around': equal space around main axis (works along main axis)
	1. 'space-between'
4. alignItems: 'flex-end' (works with the cross axis)
	1. 'flex-start'

## React Native Practical Flex Layout ##
1. Pintarest: Cards with single pin view
	1. Header component
		1. Two components
			1. One with four components with icons each
	2. Image component
	3. Meta info component
		1. two other components
	4. Description component
		1. Avatar component
		2. 4 Text components
2. SVG project
	1. thenounproject.com
	
			<Svg height="26.5" width="32">
			<Path d="M16,...>
			<Path d="M27.3,...>
			<Path d="M4.6,8.6C2.1...>
			</Svg>

3. Example:

		import Pin from './app/components/Pin'

		<View style={styles.container}>
			<Pin />
		</View>
		
		
	1. pin.js
	
			import React, { Component } from 'react'
			
			import {
				StyleSheet,
				View,
				Text
			} from 'react-native'
			
			import {
				Back,
				Heart,
				More,
				PinIcon,
				Share
			} from '../util/icons'
			
			export default class Pin extends Component {
				render() {
					return (
						<View style={styles.PinContainer}>
							<View style={styles.PinHeader}>
								<View style={styles.UtilityNav}>
									<Back />
									<Heart />
									<Share />
									<More />
								</View>
								<View style={styles.PinButtonContainer}>
									<View style={styles.PinButton}>
										<PinIcon />
										<Text styles={styles.PinButtonText}>Save</Text>
									</View>
								</View>
							</View>
							
							<View style={styles.PinContent}>
								<Text style={styles.ImagePlaceholder}>Placeholder</Text>
							</View>
							
							<View style={styles.PinMeta}>
								<View style={styles.PinMetaTextContainer}>
									<Text style={styles.PinMetaText}>Save from</Text>
									<Text style={styles.PinMetaText}>website.com</Text>
								</View>
								<View style={styles.PinButtonContainer}>
									<View style={styles.PinButton}>
										<Text styles={styles.PinButtonText}>Save</Text>
									</View>
								</View>
							</View>
							
							<View style={styles.PinUser}>
								<View style={styles.PinUserAvatar}>
									<Text>Placeholder</Text>
								</View>
								<View style={styles.PinUserContainer}>
									<Text style={styles.PinUserText}>
										<Text style={styles.TextBold}>User Name</Text> 
										saved to 
										<Text style={styles.TextBold}>
										Space</Text>
									</Text>
									<Text style={styles.PinUserText}>Lorem Ipsum</Text>
								</View>
							</View>
						</View>
					)
				}
			}
			
			const styles = StyleSheet.create({
				PinContainer: {
					flex: 1,
					alignSelf: 'stretch'
				},
				PinHeader: {
					backgroundColor: 'white'
					flexDirection: 'row',
					alignItems: 'flex-end',
					justifyContent: 'space-between',
					flex: 1,
					padding: 8
				},
				UtilityNav: {
					flexDirection: 'row',
					justifyContent: 'space-between',
					flex: 1
				},
				PinButton: {
					flexDirection: 'row',
					backgroundColor: 'red',
					padding: 8,
					borderRadius: 6,
					justifyContent: 'space-between'
					width: 60
				},
				PinButtonText: {
					color: 'white'
				},
				PinButtonContainer: {
					flex: 1,
					alignItems: 'flex-end'
				},
				PinContent: {
					flex: 3,
					justifyContent: 'center',
					alignItems: 'center',
					paddingLeft: 8
					paddingRight: 8
				},
				ImagePlaceholder: {
					backgroundColor: '#1e1e1e',
					alignSelf: 'stretch'
					flex: 1,
					borderRadius: 6
				},
				PinMeta: {
					flex: 1,
					flexDirection: 'row'
					paddingTop: 16,
					paddingRight: 8,
					paddingBottom: 16,
					paddingLeft: 8
				},
				PinMetaTextContainer: {
					
				},
				UtilityButton: {
					backgroundColor: '#cecece'
				},
				PinUser: {
					flex: 5
				}
			})
			
		1. Install `react-native-svg`

## React Native Styling With Props ##

## React Native Scaling Local Images ##

## React Native Flex Layout and minHeight ##

## React Native Masonry Layouts - Part I ##

## React Native Masonry Layouts - Part II ##