extends Node

# All variables that will need to be referenced in multiple scripts go here.
# Timers for all the cities
var cityOneTimer := 20
var cityTwoTimer := 40
var cityThreeTimer := 60
var cityFourTimer := 80
# Timer pauses
var cityOnePause := 0
var cityTwoPause := 0
var cityThreePause := 0
var cityFourPause := 0
# Main currency for the shops 
var survivalPoints := 0
# How many times a nuke has hit and survived
var fullCompletions := 0
# Checks if the walls for the buildings have been created or not 
var cityOneBuilt := false
var cityTwoBuilt := false
var cityThreeBuilt := false
var cityFourBuilt := false
var failure := false
var JUSTONCE := true
# Shop items
var woodForBuilding := 0
var freezeItem := 0
