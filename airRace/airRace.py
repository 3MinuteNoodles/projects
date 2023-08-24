"""
Welcome to the Python skeleton file for the 2023 CS113/114 project, Air-Race!

This skeleton is designed to provide you with a starting point for your project. Below is a brief explanation of how to use the skeleton. For more information, please refer to the [specification on the project website](https://www.cs.sun.ac.za/courses/cs114/).

At first, the skeleton might seem slightly overwhelming. There is a lot of text, the majority of which is documentation that explains some aspect of the project. Do not let this intimidate you. The skeleton is designed to help you. It is not designed to make your life more difficult. If you are confused about something, please ask us. We are here to help you. The project team's contact details are available on the project website. However, we encourage you to ask questions on the project's MS Teams channel. This way, other students can benefit from the answers as well.

We have included a few functions that you may find useful during the development of your project. In some cases, the functions are incomplete or do not work as intended. You must complete these functions or at least implement the functionality they represent as you see fit. You are not required to use all of the functions provided in this skeleton. So, unless we explicitly ask you to use a function, you may modify or delete them. Similarly, some of the code provided in the skeleton must be used exactly as it is given. Therefore, please make sure that you do not remove or rewrite the parts of the skeleton that must remain unaltered. Doing so may cause your program to behave in unexpected ways. Use the comments provided in the skeleton to help you understand what you are allowed to change and what you are not allowed to change.

The skeleton functions are highly documented, often providing helpful hints on how you can implement something. Keep an eye out for comments that start with `TODO`. These are comments that indicate that you must do something. They are usually placed in places where you must add code. You may also find comments that start with `NOTE`. These are comments that provide additional information about something.

Before submitting your project, please remember to rename your file to `SUxxxxxxxx.py`, where `xxxxxxxx` is your student number. This is important because we will use your student number to identify your submission. If you do not rename your file, we will not be able to mark your submission.

The skeleton is divided into sevral parts:
    - Imports:
        Here, we import the required packages such as stdio.
    - Constants:
        Constant variables are variables whose values do not change during the execution of the program. Constants are usually represented by variable names that are written in all capital letters. You do not have to use these, but you may find it useful to do so. It is important that you do not modify the constants that are given in the skeleton. Some of the functions we provide in the skeleton use them.
    - Error messages:
        These are variables that contain the text values of the error messages you will print to standard output when terminating the program. You must use these variables when terminating the program. You are given several of these variables. You must decide when to use which variable. See the project specification for more details.
    - Questions / Statements:
        These are variables that contain the text values of the messages you will print to standard output when asking the players to do something, or when providing them with game event information. You must use these variables when printing such information. Do not modify them. There are several such variables. You must decide when to use them according to the project specification website.
    - Global variables:
        These are variables that are defined outside of any function. The skeleton only defines one global variable, game_over, which indicates whether or not the game has ended. There is also a temporary global variable called PLACE_HOLDER_BOOLEAN, which we use throughout the skeleton as a placeholder to indicate missing functionality which you must implement. See the comments written underneath their definition for more information about these variables. You are allowed to add other global variables if you wish. However, try not to add too many of them.
    - Helper functions:
        These are functions that perform general tasks. Please refer to the documentation of each function to learn more about how you should/can use them. You are welcome to add more helper functions and are not required to place them in this section.
    - Gameplay functions:
        These are functions that control certain functionalities within the game. Many of the functions we provide in the skeleton are incomplete. You must complete them. You are not required to use many of these functions. Unless we explicitly ask you to use a function, you may modify or delete them. These functions often provide helpful hints.
    - Controller functions:
        These are functions that control the flow of the game. You may change or remove them, as long as you implement the functionalities they represent. They provide several helpful hints on how you can implement certain features.
    - Printing functions:
        These are the functions that you must call when printing certain things to the standard output. Since we mark your submission by comparing your program's output with the expected output, you should not modify the printing functions. Doing so may change the way your program writes output to standard output. If this were to happen, your output would not match the expected output. An important function is the `termination(msg)` function, which prints a message to standard output before terminating the program. Here, the `msg` parameter MUST be one of the error message variables that the skeleton provides. This ensures that your program will print messages as we expect them to be printed.
"""
###############################################################################################
########################################### Imports ###########################################
###############################################################################################
# Here, we import the required packages such as stdio.
# You may only use the patched version of the textbook's standard library packages.
# The patched version of the standard libraries can be found on the project website.
# You may also not explicitly import numpy. Use standard libraries' functions instead.
###############################################################################################

import os
os.environ["PYGAME_HIDE_SUPPORT_PROMPT"] = str(1)
# Do not remove this! It is used to hide the pygame welcome message which would break your program's output.
import stdio
import stdarray
import sys
import stddraw

#From second skeleton code:
import pygame
from picture import Picture
from color import Color

###############################################################################################
########################################## Constants ##########################################
###############################################################################################
# Constants are variables whose values do not change during the execution of the program.
# Constants are indicated by variable names that are written in all capital letters.
# You should not need to modify these constants, unless instructed to do so.
###############################################################################################

AIRPORTS = 10
# The number of airports in the game.
INITIAL_BALANCE = 100.0
# The initial balance of each player.
PLAYERS = 2
# The number of players in the game.
MAX_SUITCASE_VAL = 10
# The maximum number behind a suitcase.
SUITCASES_PER_AIRPORT = 4
# The number of suitcases at each airport.
NUM_OBSTACLE_DISKS = 6
# The number of obstacle disks each player has at the start of the game.
# However, only the red disk should be implemented for the first hand-in.

### These constants represent the indexes that correspond to each of the obstacle disks.
## For example, RED_DISK is the index of the red disk.
RED_DISK = 0
GREEN_DISK = 1
YELLOW_DISK = 2
CYAN_DISK = 3
BLACK_DISK = 4
MAGENTA_DISK = 5
# OBSTACLE_DISK_COLOURS = [stddraw.RED, stddraw.GREEN, stddraw.YELLOW, stddraw.CYAN, stddraw.BLACK, stddraw.MAGENTA]
# Colour constants for the obstacle disks for the second hand-in.
OBSTACLE_DISK_STRINGS = ['RED', 'GREEN', 'YELLOW', 'CYAN', 'BLACK', 'MAGENTA']

### Constants for drawing the game components. Do not modify!
WALL = '|'
CORN = '+'
LINE = '-'

#GUI variables from second hand in skeleton code:
# GUI constant variables that you can modify if you really want to:
CARD_WIDTH = 100
CARD_HEIGHT = 150
OBSTACLE_DISK_RADIUS = 30
CELL_RADIUS = 20
FONT_SIZE = 20
HEADER_HEIGHT = 40
GRID_HEIGHT = 200
SHOW_DELTA = 200 # The time in milliseconds to wait between showing the GUI
LONG_PAUSE = 1000 # The time in milliseconds to wait between showing the GUI when a long pause is needed.

# GUI constant variables that you should not modify at all:
DEFAULT_PEN_RADIUS = 2.0
MAX_OUTPUT_LINES = 10
X_MAX = 1000 # The maximum x value of the GUI
Y_MAX = 740 # The maximum y value of the GUI
OUTPUT_AREA_HEIGHT = 500 # The height of the output area
OUTPUT_AREA_WIDTH = 500 # The width of the output area
GUI_OUTPUT_FONT = pygame.font.SysFont('Consolas', 15)
MAP_BACKGROUND_IMG_PATH = os.path.join("./assets_gui/", "map_background.jpg")
P1_PLANE_IMG_PATH = os.path.join("./assets_gui/", "p1.png")
P2_PLANE_IMG_PATH = os.path.join("./assets_gui/", "p2.png")
S1_SUITCASE_IMG_PATH = os.path.join("./assets_gui/", "s1.png")
S2_SUITCASE_IMG_PATH = os.path.join("./assets_gui/", "s2.png")
S3_SUITCASE_IMG_PATH = os.path.join("./assets_gui/", "s3.png")

#######################################################################################
################################### Error messages ####################################
#######################################################################################
# When your program terminates, it should print an appropriate message.
# You must call the function `termination(msg)` in such cases.
# The function `termination(msg)` prints a message before terminating the program.
# You must use the error messages below when calling the function `termination(msg)`.
# Error messages must be printed exactly as they are given here. Do not modify them!
# We compare your program's output to our expected output using these error messages.
# If you modify them, your program will not pass the tests.
# NOTE: The value 'Q' is always a valid option.
# NOTE: Players are allowed to terminate the game at any time by entering 'Q'.
# NOTE: In that case, terminate the game with the MSG_USER_TERMINATION message instead.
#######################################################################################
### Command-line-argument-related termination messages:
# You MUST use the following error messages when reporting errors about the command line arguments.
# See the read_command_line_args() function for an example of how you will use them.
ERR_TOO_FEW_ARGS = 'Too few command-line arguments were given.'
# This should terminate the program when too few command-line arguments are given.
ERR_TOO_MANY_ARGS = 'Too many command-line arguments were given.'
# This should terminate the program when too many command-line arguments are given.
ERR_UNIMPLEMENTED = 'This feature is not implemented for the current game mode!'
# Use this error message when the player tries to do something that is not yet implemented. This is only relevant during the first hand-in.
# For example, if the value of the command-line argument corresponding to the graphics mode is '1', this error message should be used, because the graphics mode is not yet supported during the first hand-in.
# Similarly, if a player tries to play an obstacle disk that is not supported in the current game mode, this error message should be used.
# NOTE: if a player enters an entirely invalid obstacle disk option, the error message ERR_INVALID_DISK should be used instead.
# Similarly, in game mode 2, players cannot ask their opponent to move from their current airport, so use ERR_UNIMPLEMENTED if they try to do this.

ERR_UNEXPECTED = 'Unexpected input!'
# A generic error message that can be used when the input is unexpected. This will only be used in cases where no other error message is appropriate.
# Currently, this error message should not be used unless instructed to do so.
# We include this in the skeleton in case the project team finds a case where it is appropriate.
# Only if the project team finds a case where this error message is appropriate should you use it. You may use this error message in your own tests, but there is currently no case that specifies using this error message. Do not include this error message in your submission, except in the unlikely event where the project team notifies you of an overlooked termination event.
MSG_NO_NEW_GAME_TERMINATION = 'The game has ended.'
# When the user has indicated they do not want to play another game after the previous game has ended, print this message and terminate the program using the `termination(msg)` function.
ERR_INVALID_TURN_MENU_OPTION = 'Invalid turn menu option!'
# Use this error message when a player is prompted to choose whether they want to
#   - (A)sk their opponent to leave their current airport,
#   - (S)tay at their current airport,
#   - (F)ly to a different airport, or
#   - (U)se one of their obstacle disks:
#   - and they enter a value that does not correspond with one of the expected answers (A, S, F, U).
ERR_FLOAT_EXPECTED = 'A floating point number was expected!'
# Use this error message we expect a floating point number as input, but the associated value cannot be parsed as a float.
ERR_NOT_YES_OR_NO = 'Expected "Y" or "N" as input!'

#### Airport/ Flight related termination messages:
ERR_INVALID_AIRPORT = 'Invalid airport!'
# Use this error message when an invalid airport is given as input.
# For example, if the player enters 'Z' when they are asked to enter an airport, this error message should be used.
ERR_FLYING_TO_SAME_AIRPORT = 'You are already at this airport!'
# Use this error message when a player tries to fly to the airport they are already at.
ERR_FLYING_TO_OPPONENT_AIRPORT = 'You cannot fly to an airport that is occupied by your opponent!'
# Use this error message when a player tries to fly to an airport that is occupied by their opponent.

#### Suitcase-related termination messages:
ERR_FLIPPING_COLLECTED_SUITCASE = 'This suitcase cannot be flipped as it has already been collected.'
# Use this error message when a player tries to flip a suitcase that has already been collected by either player.
ERR_FLIP_RESTRICTED = 'You are not allowed to flip this suitcase. You are trying to flip a suitcase that you have already flipped during your visit.'
# Use this error message when a player tries to flip a suitcase that they have already flipped during their current stay at their current airport. The flip restriction is reset when the player leaves the airport, when they collect a suitcase, or when a helpful obstacle disk is played.
ERR_INVALID_SUITCASE_POSITION = 'Invalid suitcase position!'
# When giving the position of a suitcase as input, we expect a value between 1 and 4, both inclusive.
ERR_INVALID_SUITCASE_NUMBER = 'Invalid suitcase number! The number behind a suitcase must be a value between 1 and 10.'
# Use this error message when the number behind a suitcase is given as input and it is not a value between 1 and 10, both inclusive.
ERR_BALANCE = 'Insufficient funds!'
# Use this error message when a player tries to do something that would bankrupt themselves. For example, if they try to fly to another airport when they can't afford it.
ERR_CANT_STAY = 'You cannot stay at this airport! You cannot flip any suitcases here.'
# Use this error message when a player tries to stay at their current airport even though there are no suitcases left for them to flip.
ERR_CANT_ASK = 'You have already asked your opponent if they want to move this turn!'
# Use this error message when the player tries to ask their opponent to move to another airport after they have already done so during the current round.
ERR_EMPTY_STD_INPUT = 'Standard input is empty!'
# Use this error message when the standard input is empty.
MSG_USER_TERMINATION = 'Player terminated the game.'
# Use this termination message when the user enters 'Q' to quit the game.

#### Obstacle disk-related termination messages:
ERR_NO_DISKS = 'You have no obstacle disks that may be played at the moment!'
# Use this error message when the player tries to play an obstacle disk when they have no disks left or cannot currently play any of their remaining disks.
# For example, if the player enters 'U' when asked what they want to do, and they have no obstacle disks left or have already played an obstacle disk during this turn, this error message should be used.
# NOTE: The player can ONLY play the red disk directly after their opponent has refused their request to leave their current airport. If they enter 'U' on the options menu when their opponent has not refused to fly to another airport during this turn, and they have no other disks left, this error message should be used, even if the current player has not yet played their red disk.
# NOTE: This also has other implications. Say the current player has asked their opponent to leave their current airport, and the opponent has refused. Assume the current player has not played their red disk yet. Then, the current player can now play the red disk after they enter 'U' on the options menu. However, no other obstacle disks should be displayed at this point, as the current player can ONLY play their red obstacle disk after their opponent has refused their request to fly to another airport. Even if the current player still has other obstacle disks left, they should not be displayed at this point -- only the red disk should be displayed (assuming you have correctly validated whether or not the red disk can be played according to the specification on when a player can and cannot play the red disk).
# NOTE: Similarly, although mostly related to the requirements for the second hand-in, if the current player selects the 'U' option on the options menu but their opponent was not asked leave their current airport, then ONLY the (available, valid, and implemented) non-red obstacle disks should be displayed -- even if the current player has not yet played their red disk. The red disk may only be displayed directly after the opponent has refused the current player's request to fly to another airport -- in that case, only the red obstacle disk may be displayed, the other obstacle disks cannot be played in the turn where you ask your opponent to fly to another airport. If you don't ask your opponent to fly to another airport, the red disk cannot be played, no matter what.
ERR_INVALID_DISK = 'Invalid obstacle disk option given as input!'
# Use this error message when a player gives an invalid obstacle disk as input. For example, if they are asked to choose which disk to play and they enter 'Z'.
# The following are valid obstacle disk options: ['R', 'G', 'Y', 'C', 'B', 'M']

### NOTE: The following error messages are only relevant for the second hand-in.
ERR_ALREADY_PLAYED_DISK = 'You have already played this obstacle disk!'
# Use this error message when the player tries to play an obstacle disk that they have already played.
ERR_CANT_PLAY_RED_DISK = 'You can only play the red obstacle disk directly after your opponent has refused your request for them to leave their current airport'
# Use this error message when the player tries to play the red disk before their opponent has refused to leave their current airport.
# This may happen when a player enters 'U' when asked what they want to do during their turn, and they enter 'R' to play the red disk even though their opponent had not refused (or been asked) their request to leave during this turn. This will only be relevant for the second hand-in since the 'U' option will not be displayed when the red obstacle disk cannot be played during the first hand-in.
ERR_CANT_PLAY_CYAN_DISK = 'You cannot play the cyan disk until your opponent has moved from their first airport!'
# Use this error message when the player tries to play the cyan disk before their opponent has moved from their first airport.
ERR_CANT_PLAY_MAGENTA_DISK = 'You can only play the magenta disk if your opponent has collected more suitcases that you have.'
# Use this error message when the player tries to play the magenta disk while their opponent has not collected more suitcases than the player has.
ERR_CANT_PLAY_BLACK_DISK = 'You cannot play the black disk when you are not allowed to flip any of the suitcases at your current airport!'
# Use this error message when the player tries to play the black disk when there are no suitcases that they are allowed to flip at their current airport.
# This could happen when the player has already flipped all of the uncollected suitcases during their visit to their current airport.
ERR_MUST_PLAY_HELPFUL_DISK = 'You must play a helpful disk, given your current predicament!'
# Not relevant for the first hand-in.
# Use this error message when the player tries to play a disk that is not helpful to them but the only way for them to avoid losing was to play a helpful obstacle disk. For example, if they have no suitcases left to flip, cannot afford to fly, still have a yellow disk available, and try to play the green disk (which is assumed to be available as well).

#######################################################################################
############################### Questions / Statements ################################
#######################################################################################
# These messages must be used to ask the user for input or to provide information.
# Do not call the termination function in these cases.
# You must call the appropriate stdio.write*() function to print these messages.
# If a message contains a format specifier (like %d) you must call stdio.writef() and
# pass the appropriate arguments.
# For example, if a message requires the player number, you must call stdio.writef().
# If the message does not contain a format specifier, you must call stdio.writeln().
# These messages must be printed exactly as they are given here. Do not modify them!
# We compare your program's output to our expected output using these messages.
# If you modify them, your program will not pass the tests.
#######################################################################################
# Command-line-argument-related messages:
MSG_INVALID_GAME_MODE = 'Invalid game mode argument. Using the default value for game_mode instead.'
# This does not terminate the program. It just prints the error message and uses the default value for the game mode instead.
MSG_INVALID_GRAPHICS_MODE = 'Invalid graphics mode indicator argument. Using the default value for graphics_mode instead.'
# This does not terminate the program. It just prints the error message and uses the default value for graphics mode instead.

### Flight:
ASK_AIRPORT_DESTINATION = 'Player %d, please select the airport you would like to go to. (A-J)\n'
# Print this message when the player is asked to select an airport to fly to.
SAY_INITIAL_AIRPORT = 'Player %d has selected Airport %s as their first airport.\n\n'
# Print this message when the player selects their first airport. This should only happen once for each player per game.
SAY_FLIGHT_INFO = 'Player %d has flown from Airport %s to Airport %s at a cost of R%.2f.\n\n'
# Print this message when the player flies from one airport to another.

### Asking your opponent to leave their current airport:
SAY_REQUEST_LEAVE = 'Player %d has asked Player %d if they would like to leave the airport.\n\n'
# Print this message when the player asks their opponent to leave their current airport.
ASK_WANT_TO_LEAVE = 'Player %d, would you like to leave the airport? (Y/N)\n'
# Print this message when the asking the opponent if they want to leave their current airport after being asked to do so.
SAY_PLAYER_LEFT = 'Player %d has left their airport upon Player %d\'s request.\n'
# Print this message when the opponent leaves their current airport after being asked to do so.
SAY_REFUSED_TO_LEAVE = 'Player %d has refused Player %d\'s request to leave their airport.\n\n'
# Print this message when the opponent refuses to leave their current airport after being asked to do so.

### Obstacle disks:
SAY_PLAY_OBSTACLE_DISK = 'Player %d has played their %s obstacle disk.\n\n'
# Print this message when the player plays an obstacle disk. NOTE: The second format specifier represents the name of the obstacle disk that the player played.
# The name of the obstacle disk is one of the following: 'RED', 'GREEN', 'YELLOW', 'CYAN', 'BLACK', or 'MAGENTA'.
# For safety, you can use the array OBSTACLE_DISK_STRINGS alongside the obstacle disk index constants to get the name of the obstacle disk.
# For example, if the player played the red disk, you can use the following code to get the name of the disk:
#   `disk_name = OBSTACLE_DISK_STRINGS[RED_DISK]`
# Then you should call stdio.writef() with the following format string:
#   `stdio.writef(SAY_PLAY_OBSTACLE_DISK, player_index + 1, disk_name)` # Where the value of player_index is 0 for player 1 and 1 for player 2.
# NOTE: Only the red obstacle disk is available during the first hand-in. You only need to use the messages that are relevant to the red obstacle disk during the first hand-in, the other obstacle disks should trigger an error if the player attempts to play any of them.
SAY_RED_DISK = 'Player %d, you are forced to move from your current airport, but Player %d will pay for your flight.\n'
# Use this message when the player is forced to move from their current airport because their opponent played the red obstacle disk.
SAY_RED_DISK_DEDUCTION = 'Player %d, you have paid for Player %d\'s flight at a cost of R%.2f. Your new balance is R%.2f\n\n'
# Use this message when the player is forced to pay for their opponent's flight because their opponent played the red obstacle disk.

ASK_WHICH_OBSTACLE_DISK = 'Player %d, which obstacle disk would you like to use? (R/G/Y/C/B/M)\n'
# This message should be printed when the player is asked to select an obstacle disk to play after they have entered 'U' as their option. See the `show_options()` function for more details.
# NOTE: The red disk is included in this message because it is the ONLY valid obstacle disk option when the current player is asked to select an obstacle disk to play, immediately after their opponent has refused the current player's request to fly to another airport (assuming the other restrictions on when the red obstacle disk can be played are taken into account).
# Players may only play the red disk after their opponent has refused to leave their current airport.
# You should call the `print_obstacle_disks()` function to print the obstacle disks that the player can play after selecting 'U' as their option in `show_options()`.
# If the player uses the 'U' option to print the red obstacle disk after their opponent has refused to leave their current airport, you are not allowed to display any other obstacle disks, even if they are available and valid according to the individual obstacle disk's rules. Only the red disk can be played after the opponent has refused to leave their current airport. This works both ways; if the opponent has not refused to leave their current airport, the current player is not allowed to play the red disk. However, since the other obstacle disks are not implemented during the first hand-in, the restriction is rather simplified for the other obstacle disks. Just make sure you print the correct error message when the player tries to play an obstacle disk that is not available to them at the time.
# TODO: The following messages about the obstacle disks are only relevant to the second hand-in.
SAY_GREEN_DISK = 'The positions of the four suitcases have been shuffled, at each airport.\n\n'
# Print this message when the player plays the green disk.
ASK_YELLOW_DISK_AIRPORT = 'Player %d, please select the airport whose suitcases will be swapped with the suitcases at your current airport. (A-J)\n'
# Ask the player who plays their yellow disk to select an airport whose suitcases will be swapped with the suitcases at their current airport.
SAY_YELLOW_DISK_AIRPORT = 'Player %d has swapped the suitcases of Airport %s with that of Airport %s.\n\n'
# Print this message when the player after the player has selected which airport's suitcases should be swapped with their current airport.
# The first string format specifier represents the player's current airport. The second string format specifier represents the airport whose suitcases were swapped with the player's current airport.
SAY_CYAN_DISK = 'Player %d is forced to pay R%.2f in taxes. Their new balance is R%.2f.\n\n'
# Print this message when the player plays the cyan disk, forcing their opponent to pay taxes equal to the cost of flying from the opponent's previous airport to the opponent's current airport.
SAY_BLACK_DISK = 'The black disk has revealed the following suitcases at Airport %s.\n\n'
# Print this message when the player plays the black disk. Afterwards, you should call the `black_disk_print()` function to print the suitcase numbers that are now revealed at that airport.
SAY_MAGENTA_DISK = 'The magenta disk has added R%.2f to the balance of Player %d. Their new balance is R%.2f.\n\n'
# Print this message when the player plays the magenta disk.

### The four options that the player can choose from during their turn:
# You must only display the options that are available to the player. For example, if a player cannot afford to fly to any other airport, you should not display the option to fly to another airport.
OPT_HEADER = 'Player %d, you can do the following:\n'
OPT_ASK_OPPONENT_TO_MOVE = '\t(A)sk your opponent to leave their airport.'
OPT_STAY_AT_CURRENT_AIRPORT = '\t(S)tay at your current airport.'
OPT_FLY_TO_ANOTHER_AIRPORT = '\t(F)ly to a different airport.'
OPT_USE_OBSTACLE_DISK = '\t(U)se one of your available obstacle disks.\n'

### Suitcase flipping:
ASK_SUITCASE_POSITION = 'Player %d, please enter the position of the suitcase you would like to flip. (1-4)\n'
# Print this message when a player needs to flip one of the four suitcases at their current airport.
SAY_SUITCASE_FLIPPED = 'Player %d has flipped the suitcase at position %d of airport %s to reveal:\n\n'
# Print this message when a player flips a suitcase at their current airport. After printing this message, you should call `print_single_suitcase_number()` to reveal the number behind the suitcase that was just flipped.
SAY_COLLECTED = 'Player %d has collected the suitcase at position %d of airport %s.\n\n'
# Print this message when a player collects a suitcase at their current airport. This should directly follow the call to `print_single_suitcase_number()`, if the player could collect the suitcase they have just flipped.
SAY_NOT_COLLECTED = 'Player %d could not collect the suitcase at position %d of airport %s.\n\n'
# Print this message when a player cannot collect the suitcase that they have just flipped. This should directly follow the call to `print_single_suitcase_number()`, if the player could not collect the suitcase they have just flipped.

### Win / Loss messages:
LOSS_NO_MORE_MOVES = 'Player %d cannot make any more moves!\n'
# Print this message when a player loses the game because they cannot make any more moves. This should happen when the player has no more suitcases to collect, cannot afford to fly to another airport, and has no more helpful obstacle disk left to play.
LOSS_BANKRUPT = 'Player %d has been bankrupted!\n'
# Print this message when a player loses the game because they have been bankrupted. This should happen when the player has a negative balance.
WIN_COLLECTED_ALL_SUITCASES = 'Player %d has collected all of their suitcases!\n'
# Print this message when a player wins the game because they have collected all 10 suitcase numbers in sequence.
WIN_MESSAGE = 'Player %d has won the game!\n\n'
# Print this after printing one of the three messages above.

### New game:
ASK_NEW_GAME = 'Do you want to start a new game? (Y/N)'
# Print this message when the player is asked if they want to start a new game.
SAY_YES_NEW_GAME = 'A new game is starting!\n'
# Print this message when the user has indicated they want to play another game after the previous game has ended.

#######################################################################################
################################## Global variables ###################################
#######################################################################################
# Global variables are variables that are defined outside of any function.
# You may add or remove global variables. Just make sure you do so correctly.
#######################################################################################

game_over = False
costs = []
cases = []
casesBackup = stdarray.create2D(10,4,0)
flippable = stdarray.create2D(10,4,True)
collected = stdarray.create2D(10,4,False)

#global variables from second hand in skeleton code:
# New global variable to store list of output messages. Do not modify this.
output_text_list = []
# New global variable to store the images. Do not modify these
map_image = None
p1_image = None
p2_image = None
s1_image = None
s2_image = None
s3_image = None

PLACE_HOLDER_BOOLEAN = False # TODO: remove this variable once you have added the missing functionalities it represents.
# This is only a placeholder variable.
# We use this placeholder variable throughout the skeleton to indicate missing functionality.
# Whenever you see this variable, you should replace it with the correct value/ functionality.
# You may delete this variable once you have implemented the functionalities that are currently missing.

###############################################################################################
###################################### Helper functions #######################################
###############################################################################################
# You may add helper functions here if you wish.
# The following functions are provided to help you get started.
# Some of these functions are incomplete. You must complete them.
###############################################################################################

def end_game():
    """
    This function is called when the game is over.
    Remember to reset the global variables to their initial values when starting a new game.
    To seperate global variables from local variables, global variables are changed in their own function. While this is not required, it is considered good practice.
    You may delete this function if you wish.
    """
    global game_over
    game_over = True

def get_opponent(player):
    """
    Given the index associated with a player, this function returns the index of the opponent.
    NOTE: These are indexes, not player numbers. The player numbers are 1 and 2, but the indexes are 0 and 1.

    You are not required to use this function. You may delete it if you wish. Furthermore, while the skeleton often uses indexes when referring to players, there are other ways to implement this. The project team felt this was the most versatile way to implement it. NOTE: some of the printing functions assume that the player index is 0 or 1. If you choose to use a different way to represent players, you must keep the printing functions in mind. You should not modify the printing functions. Doing so may change the way your program writes output to standard output. If this were to happen, your output would not match the expected output.

    Parameters
    ----------
    player
        The index of the current player. (0 for player 1, 1 for player 2)

    Returns
    -------
        The index of the opponent. (0 for player 1, 1 for player 2)
    """
    return 1 - player

def check_stdio_empty(graphics_mode):
    """
    Check whether standard input is empty. If it is, terminate the game and display the associated error message.
    The code within this function should give you an idea of how you should terminate the program when an error occurs, using the appropriate error message.
    You are not required to use this function, but you MUST use the variable `ERR_EMPTY_STD_INPUT` to terminate the program using the error message associated with an empty standard input.
    """
    if stdio.isEmpty():
        termination(ERR_EMPTY_STD_INPUT, graphics_mode)

def int_to_char(index):
    """
    Convert an integer to a character.

    This function is the inverse of `char_to_int(ch)`. This is used to convert airport indices to their corresponding letters. It works by adding 65 (the ASCII code for 'A') to the given integer. You are allowed to modify or delete this function if you wish.

    Keep in mind that this function performs no error checking. If you accidentally pass an invalid index, your program may behave incorrectly.

    Parameters
    ----------
    index
        An integer value that corresponds to the index of an airport that will be converted to its associated upper case letter. Since the airports are represented by the letters A-J, the index should fall between 0 and 9, both inclusive.

    Returns
    -------
        The character corresponding to the given integer. Python interprets the returned value as a string.

    Examples
    --------
    >>> stdio.writeln(int_to_char(0))
    A
    >>> stdio.writeln(int_to_char(1))
    B
    >>> stdio.writeln(int_to_char(9))
    J
    """
    return chr(index + 65)

def char_to_int(ch):
    """
    Converts a character to an integer.

    This function is the inverse of `int_to_char`. It is used to convert airport letters to their corresponding indices. It works by subtracting 65 (the ASCII value 'A') from the given character. Consequently, this function expects the parameter `ch` to be an upper-case letter. You are allowed to modify or delete this function if you wish.

    This function does not check perform any validation on the parameter `ch`. If you accidentally pass an invalid character, your program may behave incorrectly.

    Parameters
    ----------
    ch
        The character (given as a string of length 1) corresponding to the upper-case airport letter.

    Returns
    -------
        The index of the airport corresponding to the given character.

    Examples
    --------
    >>> stdio.writeln(char_to_int('A'))
    0
    >>> stdio.writeln(char_to_int('B'))
    1
    >>> stdio.writeln(char_to_int('J'))
    9
    """
    return ord(str(ch).upper()) - 65

def read_command_line_args():
    """
    Read the command-line arguments.

    The game client should take two command-line arguments as input, in the following order:
    1. The game mode (default is 0):
       - 0 means the game functions according to the specification for the first hand-in.
       - 1 means the game functions according to the specification for the second hand-in.
       - 2 invokes the automatic solver.
    2. The GUI indicator (default is 0):
       - 0 means the game is played in the terminal (text mode).
       - 1 means the game is played in the GUI (graphical mode).

    You must perform input validation on the command-line arguments. A command-line argument is invalid if it is not one of the values listed above.
    If the value of a command-line argument is invalid, you must print a message using the appropriate message variable and set the value of the corresponding variable to its default value. Invalid command-line arguments do not terminate the program. Instead, the program should use the default value and inform the user with a message.
    During the first hand-in, the program only supports game mode 0 and graphics mode 0. If the user tries to use any other game mode or graphics mode, terminate the program using the appropriate error message. You should remove this check during the second hand-in, at which time the program should support all game modes and graphics modes.

    You may change the structure of this function if you wish, but you MUST use the constant variables that correspond to the correct error/information messages. When terminating the program, you MUST use the `termination(msg)` function.

    Returns
    -------
        A list containing the values of the arguments game_mode and graphics_mode. The first element is the game mode, the second element is the graphics mode.
    """
    game_mode = 0 # The default game mode is 0.
    graphics_mode = 0 # The default graphics mode is 0.
    #Me
    # TODO: Check whether the expected number of command-line arguments were passed to the program.
    if len(sys.argv) < 3: # TODO: Replace PLACE_HOLDER_BOOLEAN with the correct condition or rewrite this if statement without it.
        # Below is an example of what we mean by using the error messages defined at the beginning of the skeleton file to terminate the program.
        # This terminates the program with the error message ERR_TOO_FEW_ARGS, when the condition above is True.
        # Specifically, call the `termination(msg)` with the error message variable ERR_TOO_FEW_ARGS when too few command line arguments are given.
        # The code below serves as a guideline on how to terminate the program with an appropriate message.
        termination(ERR_TOO_FEW_ARGS, 0)
    elif len(sys.argv) > 3: # TODO: Replace PLACE_HOLDER_BOOLEAN with the correct condition or rewrite this if statement without it.
        # Similarly, call the `termination(msg)` function with the error message variable ERR_TOO_MANY_ARGS when too many command line arguments are given.
        termination(ERR_TOO_MANY_ARGS, 0)

    # TODO: Read the game mode and the graphics mode from the command line arguments.
    # NOTE: Do not call the termination() function if the value of either argument is invalid.
    # Instead, print the associated information message (MSG_INVALID_GAME_MODE or MSG_INVALID_GRAPHICS_MODE) using stdio.writeln and set the associated variable to its default value.
    # If the value of only one argument is invalid, you must still read the other argument. Only if both arguments are invalid should you use both default values.
    # Remember, there is a difference between an invalid argument value and a currently unimplemented argument value.
    # An invalid argument value is one that is not one of the specifiec options. For example, if the game mode is 'A', it is invalid.
    # An unimplemented argument value is one that is valid, but the functionality is not yet implemented. For example, if the game mode is '1', it is unimplemented during the first hand-in.
    #Me
    game_mode = sys.argv[1]
    if game_mode not in {'0','1','2'}:
        stdio.writeln(MSG_INVALID_GAME_MODE)
        game_mode = 0
    else: game_mode = int(game_mode)

    graphics_mode = sys.argv[2]
    if graphics_mode not in {'0','1'}:
        stdio.writeln(MSG_INVALID_GRAPHICS_MODE)
        graphics_mode = 0
    else: graphics_mode = int(graphics_mode)
    
    # Do some validation checks on the arguments and set the game mode and graphics mode accordingly.
    # TODO: If the game mode is invalid, print the message MSG_INVALID_GAME_MODE. You may want to modify this to include some sort of if-else logic.
    #stdio.writeln(MSG_INVALID_GAME_MODE) If the game mode is invalid, print this message.

    # TODO: If the graphics mode is invalid, print the message MSG_INVALID_GRAPHICS_MODE. You may want to modify this to include some sort of if-else logic.
    #stdio.writeln(MSG_INVALID_GRAPHICS_MODE) If the graphics mode is invalid, print this message.


    # If the argument value is a valid option, but the functionality is not yet implemented, you should terminate the program.
    #if game_mode == 2:
        #termination(ERR_UNIMPLEMENTED)

    # Return a list containing the values of the arguments game_mode and graphics_mode.
    # You may change the way this function returns the values if you wish.
    return [game_mode, graphics_mode]

def generate_cost_matrix(airport_coordinates_matrix):
    """
    Returns a cost matrix used to look up the cost of traveling between from one airport to another.

    # TODO: call this function to generate the cost matrix from the airport coordinates.

    The cost matrix is calculated from the airport coordinates which were previously read from the input file, which are given as a parameter to this function.
    Do not modify the contents of this function unless you are sure you know what you are doing. If the cost matrix is not generated correctly, the game will not work properly.

    You are not required to understand how this function calculates the cost matrix entries. You just need to be able to use the cost matrix this function returns. In short, this function calculates the cost of traveling between two airports by calculating the Euclidean distance between the two airports and scaling that value a bit.

    Once you get the cost matrix, you can use it to look up the cost of traveling between two airports. For example, if you want to know the cost of traveling from airport A (index 0) to airport B (index 1), you can use the following code:
        `cost_from_A_to_B = cost_matrix[0][1]`
    Since the cost matrix will always be symmetric, you can also use the following code to get the same result:
        `cost_from_B_to_A = cost_matrix[1][0]` # This will give the same result as the previous line (cost_from_A_to_B).
    Similarly, the cost matrix entries on the diagonal will always be 0. For example, the cost of traveling from airport A (index 0) to airport A (index 0) is 0:
        `cost_from_A_to_A = cost_matrix[0][0]` # This will always be 0.

    Make sure that the you understand how the parameter `airport_coordinates_matrix` should be populated. This parameter is a 2D array of size `10 x 2` which corresponds to the `x` and `y` coordinates of each airport. For example, the `x` coordinate of the airport at index 0 (airport A) is `airport_coordinates_matrix[0][0]` and the `y` coordinate of the same airport is `airport_coordinates_matrix[0][1]`. Similarly, the `x` coordinate of the airport at index 9 (airport J) is `airport_coordinates_matrix[9][0]` and the `y` coordinate of the same airport is `airport_coordinates_matrix[9][1]`.

    You should only need to call this function once -- before the first game starts.

    Parameters
    ----------
    airport_coordinates_matrix
        A 2D array of size 10 x 2 which corresponds to the `x` and `y` coordinates of each airport.
        For example, the `x` coordinate of the airport at index 0 (airport A) is `airport_coordinates_matrix[0][0]` and the `y` coordinate of the same airport is `airport_coordinates_matrix[0][1]`.

    Returns
    -------
        A 2D array of size `10 x 10`, where each entry corresponds to the cost of traveling the two associated airports.
    """
    max_c = float('-inf')
    min_c = float('+inf')
    new_cost_matrix = stdarray.create2D(AIRPORTS, AIRPORTS, 0.0)
    for a1 in range(AIRPORTS):
        new_cost_matrix[a1][a1] = 0.0
        for a2 in range(a1 + 1, AIRPORTS):
            new_cost_matrix[a1][a2] = (airport_coordinates_matrix[a1][0] - airport_coordinates_matrix[a2][0])**2
            new_cost_matrix[a1][a2] += (airport_coordinates_matrix[a1][1] - airport_coordinates_matrix[a2][1])**2
            new_cost_matrix[a1][a2] = new_cost_matrix[a1][a2]**0.5
            new_cost_matrix[a2][a1] = new_cost_matrix[a1][a2]
            if new_cost_matrix[a2][a1] < min_c:
                min_c = new_cost_matrix[a2][a1]
            if new_cost_matrix[a2][a1] > max_c:
                max_c = new_cost_matrix[a2][a1]
    # Scale the cost matrix values to be between 0 and upper_limit.
    upper_limit = 20.0
    for a1 in range(AIRPORTS):
        for a2 in range(a1 + 1, AIRPORTS):
            new_cost_matrix[a1][a2] = upper_limit*((new_cost_matrix[a1][a2] - min_c) / (max_c - min_c))
            new_cost_matrix[a2][a1] = new_cost_matrix[a1][a2]
    # Return the cost matrix, as calculated above.
    return new_cost_matrix

def calculate_magenta_disk_bonus(player_last_suitcase, opponent_last_suitcase):
    """
    Calculates the bonus that the player receives if they play their magenta obstacle disk.

    NOTE: You do not need to use this function during your implementation of the first hand-in. In fact, you should only try to use it if you are done with the implementation for the first hand-in and you want to start with the implementation of the second hand-in early on. The magenta disk should only be implemented for the second hand-in.

    The magenta disk can be played to add money to the player's wallet. The magenta disk only benefits a player if they have collected fewer suitcases than their opponent.
    This function calculates the bonus that the player receives if they play their magenta disk using the following formula:

    Let `x` = the number of suitcases collected by the player who plays the magenta disk.
    Let `y` = the number of suitcases collected by the opponent of the player who plays the magenta disk.
        `bonus = (9 - x) * max(0, y - x)`

    Parameters
    ----------
    player_last_suitcase
        The last suitcase number collected by the player who plays the magenta disk. This is equal to the number of suitcases collected by the player.
    opponent_last_suitcase
        The last suitcase number collected by the opponent of the player who plays the magenta disk. This is equal to the number of suitcases collected by the opponent.

    Returns
    -------
        The bonus that the player receives if they play their magenta disk.
    """
    return (9 - player_last_suitcase) * max(0, opponent_last_suitcase - player_last_suitcase)

def generate_AI_game(coords):
    global costs, cases, flippable, collected, game_over
    lastCase = [0,0]
    airport = ['Z', 'Z'] #initialises each player's current airport
    visited = stdarray.create2D(2,10,False) #each player has an array of airports they have visited (this array resets if they have visited all the airports)
    knowledge = stdarray.create2D(2,10,"Z") #Each player can remember the last airport at which they saw a suitcase
    roundsSinceCollected = [0,0] #this keeps track of how many rounds it has been since each player has collected a suitcase
    wallet = [100.0,100.0]
    game_over = False
    player = 1

    for i in range(2): #this loops does the starting airports that are read in from the file
        airport[i] = readString(0) 
        visited[i][char_to_int(airport[i])] = True #keeps track of which airports the player has visited
        stdio.write(airport[i] + ' ') #writes the input to standard output so that the programme makes a complete input file
        flip = readInt('F', 0)
        stdio.write(str(flip) + ' ')
        flippable[char_to_int(airport[i])][flip - 1] = False
        roundsSinceCollected[i] += 1 #adds one round since the player has collected a suitcase
        knowledge[i][cases[char_to_int(airport[i])][flip - 1] - 1] = airport[i] #updates the players memory of where they last saw the suitcase that they just picked up
        if cases[char_to_int(airport[i])][flip - 1] == lastCase[i] + 1: #this checks if the player can collected the suitcase
            lastCase[i] += 1
            roundsSinceCollected[i] = 0 #resets the rounds nice collecting a suitcase
            collected[char_to_int(airport[i])][flip - 1] = True
            for j in range(4): #resets which cases can be flipped at the airport
                flippable[char_to_int(airport[i])][j] = True

    while not game_over: #the primary game loop for the AI solver
        if player == 1:
            player = 0
            stdio.writeln() #makes a new line every time player 0 starts their turn
        else:
            player = 1

        end_game = True
        for i in range(10):#checks if the player can afford any flights
            if costs[char_to_int(airport[player])][i] <= wallet[player] and i != char_to_int(airport[player]) and i != char_to_int(airport[get_opponent(player)]):
                end_game = False
        
        for i in range(4): #checks if the player can collect any suitcases
            if not collected[char_to_int(airport[player])][i] and flippable[char_to_int(airport[player])][i]:
                end_game = False
        
        if end_game: #if neither of the two checks were positive then sets game_over to true
            game_over = True
        
        for i in range(2): #checks if either player has one the game
            if lastCase[i] == 10:
                game_over = True

        choice = generate_AI_choice(player,airport, roundsSinceCollected, visited, knowledge, lastCase, wallet) #generates the AI choice

        show_S = True #this is used when writing the players choices to standard output.

        if choice in {'A','B','C','D','E','F','G','H','I','J'}: #if the AI has decided to fly then runs this
            stdio.write('F ' + str(choice) + ' ') #writes the players choice to standard output
            wallet[player] -= costs[char_to_int(airport[player])][char_to_int(choice)]
            for i in range(4): #resets the which cases are flippable at the players airport before they fly
                flippable[char_to_int(airport[player])][i] = True
            airport[player] = choice #sets the players airport to their new one
            visited[player][char_to_int(airport[player])] = True #updates which airports the player has visited
            choice = generate_AI_choice(player,airport, roundsSinceCollected, visited, knowledge, lastCase, wallet)  #generates the next AI choice which would be which case to flip
            show_S = False

        if choice in {1,2,3,4}: #runs this when the AI has chosen a suitcase to flip, either without flying or after flying
            if show_S:
                stdio.write('S' + ' ' + str(choice) + ' ')
            else:
                stdio.write(str(choice) + ' ')

            flippable[char_to_int(airport[player])][choice - 1] = False 
            roundsSinceCollected[player] += 1
            knowledge[player][cases[char_to_int(airport[player])][choice - 1] - 1] = airport[player] #updates the players memory of where they have last seen this suitcase
            if cases[char_to_int(airport[player])][choice - 1] == lastCase[player] + 1: #collects the suitcase if they player can collect it
                lastCase[player] += 1
                roundsSinceCollected[player] = 0 #resets how many rounds it has been since the player collected a suitcase
                collected[char_to_int(airport[player])][choice - 1] = True

                for i in range(4): #resets the flip restrictions at the airport
                    flippable[char_to_int(airport[player])][i] = True

def generate_AI_choice(player, airport, roundsSinceCollected, visited, knowledge, lastCase, wallet): #This function generates the AI choice
    global costs, cases, flippable, collected, game_over
    
    if game_over: #if the game is over then the AI outputs that it does not want to play a new game
        stdio.write('N')
        sys.exit(0)

    for i in range(4): #if the player can flip a suitcase at their airport then they will do so
        if flippable[char_to_int(airport[player])][i] and not collected[char_to_int(airport[player])][i]:
            return i + 1
    
    minCost = 20.0 #initialises the minimum cost that the AI can fly for
    destination = 'Z' #initialises the destination variable
    if knowledge[player][lastCase[player]] != 'Z': #if the player remembers seeing the next suitcase they need then they will fly there if they can
        if costs[char_to_int(airport[player])][char_to_int(knowledge[player][lastCase[player]])] <= wallet[player] and knowledge[player][lastCase[player]] != airport[player] and knowledge[player][lastCase[player]] != airport[get_opponent(player)]:
            destination = knowledge[player][lastCase[player]]
            knowledge[player][lastCase[player]] = "Z"
    if roundsSinceCollected[player] > 8 and destination == 'Z': #if the player has not collected a suitcase in more than 8 rounds then they will try and fly to an airport they haven't been to yet
        for i in range(2):#if the player has visited all airports then the list of airports they have visited is reset
            resetVisited = True
            for j in range(10):
                if visited[i][j] == False:
                    resetVisited = False
                    break

            if resetVisited:
                for j in range(10):
                    visited[i][j] = False
        
        for i in range(10): #goes to an airport the player hasn't visited yet
            if costs[char_to_int(airport[player])][i] < minCost and i != char_to_int(airport[player]) and i != char_to_int(airport[get_opponent(player)]) and not visited[player][i]:
                bValid = False
                for j in range(4):
                    if not collected[i][j]:
                        bValid = True

                if bValid:
                    minCost = costs[char_to_int(airport[player])][i]
                    destination = int_to_char(i)

    if destination == "Z": #if the player could not fly to an airport that they haven't visited or it has not been 8 rounds since they collected a suitcase then they will fly to an airport they haven't been to yet
        for i in range(10):
            if costs[char_to_int(airport[player])][i] < minCost and i != char_to_int(airport[player]) and i != char_to_int(airport[get_opponent(player)]):
                bValid = False
                for j in range(4):
                    if not collected[i][j]:
                        bValid = True
                if bValid:
                    minCost = costs[char_to_int(airport[player])][i]
                    destination = int_to_char(i)

    if destination == 'Z': #if all of the previous loops failed to set a destination it is because the player can only fly to an airport where all the suitcases are collected. This will make the AI fly there and then set the game to be over
        for i in range(10):
            if costs[char_to_int(airport[player])][i] < minCost and i != char_to_int(airport[player]) and i != char_to_int(airport[get_opponent(player)]):
                minCost = costs[char_to_int(airport[player])][i]
                destination = int_to_char(i)
                game_over = True

    return destination #returns the players destination

###############################################################################################
##################################### Gameplay functions ######################################
###############################################################################################
# The following functions are used to control certain functionalities during the game.
# You may change the structure of these functions or opt not to use them.
# You may also add additional functions if you wish.
# Some of these functions are incomplete. You must complete them.
###############################################################################################
    
def show_options(player, can_ask_opponent_to_leave, can_play_obstacle, game_mode, airport, wallet, refused_to_leave, disks, lastCase, hasMoved, fee, graphics_mode):
    """
    At the start of their turn, show the player what they can do at their current airport.

    The name '`show_options`' is quite vague, considering you are presented with several options throughout the game. Feel free to rename it. You may interpret this function as a 'main menu' of sorts since it is the entry point of a decision tree during every turn (except for the initial airport selection phase). As with most main menu's, no move is made when a player enters one of the options `(A, S, F, U)`. Instead, the player will presented with new questions based on their choice, usually leading to an actual gameplay-related interaction -- unless the input of `show_options` is invalid, in which case we terminate the game (with the appropriate error message).

    A player has four possible options at this stage:
        - Ask the opponent to leave their airport.
        - Stay at the current airport.
        - Fly to another airport.
        - Use an obstacle disk.

    NOTE: The menu is dynamically generated based on the player's current state. Consider how you will implement the following:
        - When the player has already asked their opponent to leave their airport during this turn, the option to ask the opponent to leave their airport is not shown.
        - When the player cannot afford to fly to another airport, the option to fly to another airport is not shown.
        - When the player has no obstacle disks that they can use when the menu is printed, the option to use an obstacle disk is not shown.
        - When the player cannot flip any of the suitcases at the current airport (e.g., as a result of the flip restriction rule or suitcases that have already been collected), the option to stay at the current airport is not shown.

    NOTE: You must decide how you will implement the above. This will be a crucial part of your implementation. Since the menu is printed at least once per turn, broken functionality will deviate from the expected behaviour of the game. We mark your implementation by comparing your program's output with the expected output. Thus, if your menu does not behave as expected, your program will produce output that will differ from the expected output throughout the rest of the marking process. Thus, even if your implementation of some other functionality is completely correct, a broken menu that results in output differing from the expected output will still result in you receiving 0 for any test case where the menu is not printed correctly. This is an extremely important point to consider.

    You may modify certain parts of this function. However, ensure you do not disturb how the output is printed. If you want to remove or add any parameters, you may do so. The current parameters are provided as a guide.

    Parameters
    ----------
    player
        The index of the player (an index of 0 means player 1, and a index of 1 means player 2).
    can_ask_opponent_to_leave
        A Boolean variable. True if the player can ask the opponent to leave their airport, False otherwise. This happens when the player has not already asked the opponent to leave their airport during this turn, for example.
    can_play_obstacle
        A Boolean variable. True if the player is allowed to play an obstacle disk at the moment, False otherwise. NOTE: this variable is not used to indicate the case where all obstacle disks have already been used, or even whether or not the rules of the individual obstacle disks do not allow them being played. For example, lack of restrictions associated with playing the yellow disk rarely results in the yellow disk not being played. However, the yellow disk is cannot be played when the player has already asked the opponent to leave their airport during this turn, since only the red obstacle disk can be played after such a request -- of course, this example assumes you have considered the other rules/restrictions associated with playing the red obstacle disk as well.
    game_mode
        The game mode, with value according to the first command-line argument. This is either 0, 1, or 2. There are much more efficient ways to implement this functionality, but it was easiest to illustrate how we use the `game_mode` variable by simply specifying it as a parameter.
    """
    #if game_mode == 2:
        # Furthermore, when the game_mode variable is set to 2, indicating AI game-play, then the (AI) players cannot use obstacle disks.
        #can_play_obstacle = False
        #can_ask_opponent_to_leave = False

    global flippable
    global collected
    minval = 20.0 #caluclates the minimum value of a flight that the player can make (the default is 20.0 since that is the max value)
    for i in range(0,10): 
        if i != char_to_int(airport[player]) and i != char_to_int(airport[get_opponent(player)]) and (costs[char_to_int(airport[player])][i] < minval):
            minval = costs[char_to_int(airport[player])][i]
            
    bStay = False
    for i in range(0,4): #checks that there is at least 1 suitcase that is not collected and they can flip
        if flippable[char_to_int(airport[player])][i] and collected[char_to_int(airport[player])][i] == False:
            bStay = True

    can_fly = wallet[player] >= minval #checks that the player can afford to fly to the cheapest airport
    can_stay = bStay #the player can stay if the airport has one flippable suitcase
    
    # The four Boolean variables above indicate whether the player can do the corresponding action.
    # For example, if the player can ask the opponent to leave their airport, then the can_ask_opponent_to_leave variable will be set to True.
    #               This may be false if the player has already asked the opponent to leave their airport during this round.
    # The can_fly variable indicates whether the player can fly to another airport.
    # The can_stay variable indicates whether the player can stay at their current airport.
    # The can_play_obstacle variable indicates whether the player can play an obstacle disk.
    # NOTE: the current player can only play the red obstacle disk immediately after their opponent has refused the current player's request to fly to another airport -- assuming the current player has not yet played their red disk.
    # For the first hand-in, only the red obstacle disk is implemented. A player can only play the red obstacle disk when they have already asked the opponent to leave their airport, and the opponent has refused to leave. This implies that the red obstacle disk is only displayed sometimes!
    # When the show_options function is called after the opponent has refused to fly to a different airport, the current player will be able to select the 'U' option, but it will only display the red obstacle disk (assuming the current player has not played the red disk yet) -- no other disks should be displayed in this case!
    # If the current player has already used their red obstacle disk, the 'U' option should not be displayed after calling show_options after the opponent has refused the current player's request.
    # If the current player did not ask their opponent to leave their airport, the 'U' option should only display the other obstacle disks (depending on the non-red disks' availabilities), even if the player has not used the red disk yet.
    # Since the other disks will only be implemented for the second hand-in, only the red disk should be displayed here (noting the aforementioned rules about when the red disk can be used).

    # TODO: Replace the following placeholder code with your own code.
    # Here, you want to check if the player has lost the game because they cannot make a move that would benefit their case.
    # If the player cannot make a move that would benefit their case, they lose.
    # You may want to use a combination of the boolean variables above, as well as the helpful_disk_available() function.

    # DO NOT MODIFY THE FOLLOWING PRINT MESSAGES. These are the options to present to the player.
    # The options are only printed if the player can make that move.
    # For example, if the player cannot fly to another airport, then the option to fly is not printed.
    # If you feel the need to change the logic of the if statements, you may do so.
    # Just be sure that the options are only printed if the player can make that move and that the options are printed in the same order as they are listed below.
    # To reiterate, you may change the logic of the if statements, but you may not change the print messages.

    canPlay = [False, False, False, False, False, False] #initialises this array, this array is passed back to the game function so that the game function knows which disks can be played
    bUse = False #initialises bUse to say that the player cannot play an obstacle disk
    if can_play_obstacle: #can_play_obstacle is false if the player has played their red disk and thus can not play another obstacle disk
        if disks[player][RED_DISK] and refused_to_leave: #If the player has not played their red disk and the player has just refused to leave
            canPlay[RED_DISK] = True
            for i in range(10): #checks that the player can actually afford to pay for the red disk
                if wallet[player] < costs[char_to_int(airport[get_opponent(player)])][i] and i != char_to_int(airport[player]) and i != char_to_int(airport[get_opponent(player)]):
                    canPlay[RED_DISK] = False
            if canPlay[RED_DISK]:
                bUse = True #sets bUse to true since the player can play at least one disk

        if game_mode == 1: #  the other disks only need to be checked if the game mode is 1
            if disks[player][GREEN_DISK] or disks[player][YELLOW_DISK]: #The green and yellow disk have not requirements other than not being played yet (unless a helpful disk is needed but that is checked for later)
                canPlay[GREEN_DISK], canPlay[YELLOW_DISK] = disks[player][GREEN_DISK], disks[player][YELLOW_DISK]
                bUse = True #sets bUse to true since the player can play at least one disk
            if disks[player][BLACK_DISK]:
                bBlack = False 
                for i in range(0,4):
                    if not collected[char_to_int(airport[player])][i] and flippable[char_to_int(airport[player])][i]:
                        bBlack = True
                if bBlack:
                    bUse = True #sets bUse to true since the player can play at least one disk
                    canPlay[BLACK_DISK] = True
            if disks[player][CYAN_DISK] and hasMoved[get_opponent(player)]:
                bUse = True #sets bUse to true since the player can play at least one disk
                canPlay[CYAN_DISK] = True
            if disks[player][MAGENTA_DISK] and lastCase[player] < lastCase[get_opponent(player)]:
                bUse = True #sets bUse to true since the player can play at least one disk
                canPlay[MAGENTA_DISK] = True

    helpNeeded = False
    if not(can_stay) and not(can_fly): #if the player has no moved except disks then the following runs to check which disk they can play if any
        magentaHelp = False
        if canPlay[MAGENTA_DISK]:
            for i in range(10): #checks that the magenta disk will allow the player to move to the cheapest airport at least
                if i != char_to_int(airport[player]) and i != char_to_int(airport[get_opponent(player)]) and costs[char_to_int(airport[player])][i] < wallet[player] + max(0, 9-lastCase[player])*max(0, lastCase[get_opponent(player)]-lastCase[player]):
                    magentaHelp = True
        
        cyanHelp = wallet[get_opponent(player)] - fee[get_opponent(player)] < 0 and canPlay[CYAN_DISK] #checks that the cyan disk would bankrupt the opponent

        if not(magentaHelp) and not(cyanHelp) and not(canPlay[YELLOW_DISK]): #displays a loss message if the player can't do anything
            stdio.writef(LOSS_NO_MORE_MOVES, player + 1)
            stdio.writef(WIN_MESSAGE, get_opponent(player) + 1)
            end_game()
        else: #if the player can play a disk the sets the not helpful disks to not be playable and sets it so the player can't ask their opponent to leave
            canPlay[BLACK_DISK] = False
            canPlay[GREEN_DISK] = False
            canPlay[RED_DISK] = False
            canPlay[MAGENTA_DISK] = magentaHelp
            canPlay[CYAN_DISK] = cyanHelp
            helpNeeded = True
            can_ask_opponent_to_leave = False

    if not game_over: #if the game isn't over then the option messages are printed, either in the GUI or the terminal depending on the graphics mode  
        if graphics_mode == 0:
            stdio.writef(OPT_HEADER, player + 1)
            if can_ask_opponent_to_leave:
                stdio.writeln(OPT_ASK_OPPONENT_TO_MOVE)
            if can_stay:
                stdio.writeln(OPT_STAY_AT_CURRENT_AIRPORT)
            if can_fly:
                stdio.writeln(OPT_FLY_TO_ANOTHER_AIRPORT)
            if bUse:
                stdio.writeln(OPT_USE_OBSTACLE_DISK)
                print_obstacle_disks(canPlay)
            stdio.writeln() 
        else:
            rect_border(0,0,500,250) #clears the bottom left section of the GUI
            x = 250
            y = 200
            stddraw.setFontSize(18)
            if can_ask_opponent_to_leave:
                stddraw.text(x,y,'(A)sk your opponent to leave their airport.')
                y -= 50
            if can_stay:
                stddraw.text(x,y,"(S)tay at your current airport.")
                y -= 50
            if can_fly:
                stddraw.text(x,y,"(F)ly to a different airport.")
                y -= 50
            if bUse:
                stddraw.text(x,y,"(U)se one of your available obstacle disks.")
            stddraw.setFontSize(20)
            stdio.writef(OPT_HEADER, player + 1)
                        
        # You will need to modify the function arguments in the previous line appropriately.
        # The majority of the `print_obstacle_disks` function is mainly applicable to the second hand-in, since the red disk is the only obstacle disk implemented for the first hand-in. Ensure that you understand when you need to display the red obstacle using `print_obstacle_disks` disk, however!
    
    return canPlay, can_fly, helpNeeded #returns the list of playable obstacle disks, and returns whether the player needs to play a helpful disk
    
def fly(player, wallet, airport, lastCase, reason, hasMoved, fee, graphics_mode, coords, can_fly): #This function is called each time a player needs to fly to another airport
    global costs
    global collected
    global flippable

    if not can_fly:
        termination(ERR_BALANCE, graphics_mode)

    if graphics_mode == 1: draw_available_airports(player,airport,wallet) #if graphics mode is 1 then draws the available airports in the bottom left of the GUI
    stdio.writef(ASK_AIRPORT_DESTINATION, player+1)
    
    destination = readString(graphics_mode) #Checking for Q is done inside this function
    
    if destination in {"A","B","C","D","E","F","G","H","I","J"}: #Checks that the enetered airport is a valid one
        if destination == airport[player]:
            termination(ERR_FLYING_TO_SAME_AIRPORT, graphics_mode)
        elif destination == airport[get_opponent(player)]:
            termination(ERR_FLYING_TO_OPPONENT_AIRPORT, graphics_mode)
            
        for i in range(0,4): #Removes flip restrictions since the player is leaving the airport
            flippable[char_to_int(airport[player])][i] = True
            
        if reason == 'F': #runs this if the player is flying because they selected F during their turn
            wallet[player] -= costs[char_to_int(airport[player])][char_to_int(destination)]
            fee[player] = costs[char_to_int(airport[player])][char_to_int(destination)]
            if wallet[player] < 0.00:
                termination(ERR_BALANCE, graphics_mode)
            stdio.writef(SAY_FLIGHT_INFO, player + 1, airport[player], destination, costs[char_to_int(airport[player])][char_to_int(destination)])
            
        elif reason =='A': #runs this if the player is flying because their opponent asked them to
            fee[player] = costs[char_to_int(airport[player])][char_to_int(destination)]
            stdio.writef(SAY_FLIGHT_INFO, player + 1, airport[player], destination, 0.00)
            
        elif reason == 'U': #runs this if the player is flying because their opponent played the red disk
            wallet[get_opponent(player)] -= costs[char_to_int(airport[player])][char_to_int(destination)]
            deduction = costs[char_to_int(airport[player])][char_to_int(destination)]
            fee[player] = costs[char_to_int(airport[player])][char_to_int(destination)]
            if wallet[get_opponent(player)] <= 0.00: #Subtracts the cost from the opponents wallet because of the red disk
                termination(ERR_BALANCE, graphics_mode)
            stdio.writef(SAY_FLIGHT_INFO, player + 1, airport[player], destination, 0.00)
            
        airport[player] = destination #Sets the players airport to their new destination after all the checks and deductions have been completed

        hasMoved[player] = True #since the player has moved this variable
        
        #printing:
        print_airport_grid(char_to_int(airport[0]), char_to_int(airport[1])) 
        if graphics_mode == 1: draw_airport_map(airport[0], airport[1], coords, costs, player) #draws the airport map to reflect the fact that the player has moved
        print_airport_suitcases(cases[char_to_int(airport[player])], collected[char_to_int(airport[player])], flippable[char_to_int(airport[player])])
        bNoMoreMoves = True
        for i in range(0,4): #checks that the player can collect at least one one suitcase at their new airport
            if collected[char_to_int(airport[player])][i] == False:
                bNoMoreMoves = False
        if bNoMoreMoves: #does the loss message if the player can not flip any of the suitcases
            stdio.writef(LOSS_NO_MORE_MOVES, player + 1)
            stdio.writef(WIN_MESSAGE, get_opponent(player) + 1)
            end_game()
        
        if not game_over: #only does the following if the player hasn't already lost
            print_suitcase_grid(lastCase[0], lastCase[1])
            #Doing the suitcase flipping that must be done after each flight
            stdio.writef(ASK_SUITCASE_POSITION, player + 1)
            flip = readInt('F', graphics_mode) #some validation is done in the readInt function
            if not flip in {1,2,3,4}: #checks that it is a valid position
                termination(ERR_INVALID_SUITCASE_POSITION, graphics_mode)
                
            if collected[char_to_int(airport[player])][flip - 1] == True: #checks that the case hasn't already been collected
                termination(ERR_FLIPPING_COLLECTED_SUITCASE, graphics_mode)
            elif flippable[char_to_int(airport[player])][flip - 1] == False: #checks that the case hasn't already been flipped
                termination(ERR_FLIP_RESTRICTED, graphics_mode)
                
            flippable[char_to_int(airport[player])][flip - 1] = False #sets that suitcases flippable value to false since it has just been flipped
            stdio.writef(SAY_SUITCASE_FLIPPED, player + 1, flip, airport[player])
            print_single_suitcase_number(cases[char_to_int(airport[player])][flip - 1])
                
            if cases[char_to_int(airport[player])][flip - 1] == lastCase[player] + 1: #checks to see if the suitcase is the next one the player needs
                lastCase[player] += 1
                stdio.writef(SAY_COLLECTED, player + 1, flip, airport[player])
                collected[char_to_int(airport[player])][flip - 1] = True
                for i in range(4):
                    flippable[char_to_int(airport[player])][i] = True
                    
            else: stdio.writef(SAY_NOT_COLLECTED, player + 1, flip, airport[player])
            print_suitcase_grid(lastCase[0], lastCase[1])

            if lastCase[player] == 10: #checks to see that the suitcase is the final one
                    stdio.writef(WIN_COLLECTED_ALL_SUITCASES,player+1)
                    stdio.writef(WIN_MESSAGE, player+1)
                    end_game()
    else:
        termination(ERR_INVALID_AIRPORT, graphics_mode) #if the input wasn't a valid airport
    if reason != "U":
        return wallet, airport, lastCase, hasMoved #returns these so the variables under the game function can be modified
    else:
        return wallet, airport, lastCase, deduction, hasMoved #The deduction only needs to be returned if the player is flying because of a red disk so that the red disk reduction message can be displayed

def flipCase(player, airport, lastCase, graphics_mode):
    global flippable
    global collected
    global cases

    bStay = False
    for i in range(0,4): #checks that they may stay at their airport
        if flippable[char_to_int(airport[player])][i] == True and collected[char_to_int(airport[player])][i] == False:
            bStay = True
    if not bStay:
        termination(ERR_CANT_STAY, graphics_mode)
                        
    print_airport_suitcases(cases[char_to_int(airport[player])], collected[char_to_int(airport[player])], flippable[char_to_int(airport[player])])
    print_suitcase_grid(lastCase[0], lastCase[1])
                    
    stdio.writef(ASK_SUITCASE_POSITION, player + 1)
    flip = readInt('F', graphics_mode) #reads which suitcase the player would like to flip
    if not flip in {1,2,3,4}: #checks that the entered value is the correct range
        termination(ERR_INVALID_SUITCASE_POSITION, graphics_mode)

    if collected[char_to_int(airport[player])][flip - 1] == True: #checks that the suitcase isn't already collected
        termination(ERR_FLIPPING_COLLECTED_SUITCASE, graphics_mode)
    elif flippable[char_to_int(airport[player])][flip - 1] == False: #checks that the suitcase isn't already flipped
        termination(ERR_FLIP_RESTRICTED, graphics_mode)
                    
    flippable[char_to_int(airport[player])][flip - 1] = False #sets it so the suitcase may not be flipped since it has just been flipped
    stdio.writef(SAY_SUITCASE_FLIPPED, player + 1, flip, airport[player])
    print_single_suitcase_number(cases[char_to_int(airport[player])][flip - 1])
        
    if cases[char_to_int(airport[player])][flip - 1] == lastCase[player] + 1: #checks if the suitcase is the next one the player needs and collects it if it is
        lastCase[player] += 1
        stdio.writef(SAY_COLLECTED, player + 1, flip, airport[player])
        collected[char_to_int(airport[player])][flip - 1] = True
        for i in range(4):
            flippable[char_to_int(airport[player])][i] = True
                        
    else: stdio.writef(SAY_NOT_COLLECTED, player + 1, flip, airport[player])
            
    print_suitcase_grid(lastCase[0], lastCase[1])

    if lastCase[player] == 10: #checks if the player has collected all suitcases
        stdio.writef(WIN_COLLECTED_ALL_SUITCASES,player+1)
        stdio.writef(WIN_MESSAGE, player+1)
        end_game()

    return(lastCase)

def playObstacle(graphics_mode, game_mode, canPlay, player, disks, asked, fee, hasMoved, lastCase, airport, wallet, helpNeeded, coords):
    bCheck = False
    for i in range(6):
        if canPlay[i]:
            bCheck = True
    if not bCheck:
        termination(ERR_NO_DISKS, graphics_mode)
    #this function is called when the player plays an obstacle disk
    if graphics_mode == 1: display_obstacle_disks(canPlay) #displays the gui disks if in gui  mode
    stdio.writef(ASK_WHICH_OBSTACLE_DISK, player + 1)
    choice = readString(graphics_mode) #reads the disk the player would like to use
    if choice in {"R", "G", "Y", "C", "B", "M"}: #checks that the disk entered is a valid one
        if game_mode == 0: #runs this if game mode is 0 because only the red disk can be played in that gamemode
            if choice == "R":
                if not asked: #if the player hasn't asked their opponent to move they cannot play the red disk
                    termination(ERR_CANT_PLAY_RED_DISK, graphics_mode)
                if not disks[player][RED_DISK]: #if the player has already played the red disk they can not play it
                    termination(ERR_ALREADY_PLAYED_DISK, graphics_mode)
                elif not canPlay[RED_DISK]: #canPlay was obtained from the show_options function and if the player has asked and still can not play the red disk they do not have a high enough balance
                    termination(ERR_BALANCE, graphics_mode)
                else: #calls the function to play the red disk
                    redDisk(player, asked, game_mode, disks, graphics_mode, fee, hasMoved, lastCase, airport, canPlay, wallet, coords)
                    if game_over: return #leaves this function if the game ended when the red disk was played

            else:
                termination(ERR_UNIMPLEMENTED, graphics_mode)
        
        elif game_mode == 1: #runs the following if the game mode is one so that all the obstacle disks can be played
            bCanPlay = False
            for i in range(6): #checks that the player can play at least one disk
                if disks[player][i]:
                    bCanPlay = True
            if not bCanPlay: #if the player can not play any disks then the programme terminates
                termination(ERR_NO_DISKS, graphics_mode)
            else:
                if choice in {"R", "G", "Y", "C", "B", "M"}: #checks that the disk entered is a valid one
                    if choice == "R": #does the red disk as above
                        if helpNeeded:
                            termination(ERR_MUST_PLAY_HELPFUL_DISK, graphics_mode)
                        if not asked:
                            termination(ERR_CANT_PLAY_RED_DISK, graphics_mode)
                        if not disks[player][RED_DISK]:
                            termination(ERR_ALREADY_PLAYED_DISK, graphics_mode)
                        elif not canPlay[RED_DISK]:
                            termination(ERR_BALANCE, graphics_mode) #in this instance the player can not have asked their opponent to move yet and thus the red disk will never be playable
                        redDisk(player, asked, game_mode, disks, graphics_mode, fee, hasMoved, lastCase, airport, canPlay, wallet, coords)
                        if game_over: return
                                
                    elif choice == "G": #runs the green disk checks
                        if helpNeeded:#if the player must play a helpful disk then they may not play the green disk
                            termination(ERR_MUST_PLAY_HELPFUL_DISK, graphics_mode)
                        if not disks[player][GREEN_DISK]: #if the player can't play the green disk for any other reason then they must have already played it
                            termination(ERR_ALREADY_PLAYED_DISK, graphics_mode)
                        else:
                            greenDisk(player, airport) #runs the green disk function
                            disks[player][GREEN_DISK] = False #sets it so that the player can never play the green disk again

                    elif choice == "Y": #runs the yellow disk checks
                        if not disks[player][YELLOW_DISK]: #if the player can not play the yellow disk it must be because they already played it
                            termination(ERR_ALREADY_PLAYED_DISK, graphics_mode)
                        else:
                            yellowDisk(player, airport, graphics_mode)#runs the yellow disk function
                            disks[player][YELLOW_DISK] = False

                    elif choice == "C": #does the cyan disk checks
                        if disks[player][CYAN_DISK] and helpNeeded and not canPlay[CYAN_DISK] and hasMoved[player]: #if the player has moved airports and has not played the cyan disk and the player needs help and the player can not play the cyan disk, then it must be because the disk is not helpful in this intance
                            termination(ERR_MUST_PLAY_HELPFUL_DISK, graphics_mode)
                        if not disks[player][CYAN_DISK]: #checks if the player has already played their cyan disk
                            termination(ERR_ALREADY_PLAYED_DISK, graphics_mode)
                        elif not canPlay[CYAN_DISK]: #after the previous checks if the player can not play is must be because they have not moved airports
                            termination(ERR_CANT_PLAY_CYAN_DISK, graphics_mode)
                        else:
                            wallet = cyanDisk(player, fee, wallet) #runs the cyan disk function
                            disks[player][CYAN_DISK] = False

                    elif choice == "B": #does the black disk checks
                        if helpNeeded: # if the player needs help they may not play the 
                            termination(ERR_MUST_PLAY_HELPFUL_DISK, graphics_mode)
                        if not disks[player][BLACK_DISK]: # checks if the player has already played their black disk
                            termination(ERR_ALREADY_PLAYED_DISK, graphics_mode)
                        elif not canPlay[BLACK_DISK]: #if the player has not played their black disk but can not now then diskplays the following error message
                            termination(ERR_CANT_PLAY_BLACK_DISK, graphics_mode)
                        else:
                            blackDisk(player, airport) #runs the black disk function
                            disks[player][BLACK_DISK] = False

                    elif choice == "M": #does the magenta disk checks
                        if disks[player][MAGENTA_DISK] and helpNeeded and not canPlay[MAGENTA_DISK] and (9 - lastCase[player]) * max(0, lastCase[get_opponent(player)] - lastCase[player]) > 0:
                            termination(ERR_MUST_PLAY_HELPFUL_DISK, graphics_mode) #displays this error if the player has not played their magenta disk and needs to play a helpful disk yet they can not play the disk even though they are allowed to based on the number of suitcases collected by each player
                        if not disks[player][MAGENTA_DISK]:#checks that the player has not already played thier magenta disk
                            termination(ERR_ALREADY_PLAYED_DISK, graphics_mode)
                        elif not canPlay[MAGENTA_DISK]:#after the previous checks the only reason the player would not be able to play the disk is that the requirements regarding number of cases each player has collected have not been met
                            termination(ERR_CANT_PLAY_MAGENTA_DISK, graphics_mode)
                        else:
                            wallet = magentaDisk(player, lastCase, wallet) #runs the magenta disk funcion
                            disks[player][MAGENTA_DISK] = False
                                        
    else:
        termination(ERR_INVALID_DISK, graphics_mode) #if the player did not enter a valid letter for an obstacle disk this message is displayed

########################## DISC FUNCTIONS ##########################

def redDisk(player, asked, game_mode, disks, graphics_mode, fee, hasMoved, lastCase, airport, canPlay, wallet, coords):
    stdio.writef(SAY_PLAY_OBSTACLE_DISK, player + 1, "RED")
    stdio.writef(SAY_RED_DISK, get_opponent(player)  +1, player+1)

    wallet, airport, lastCase, deduction, hasMoved = fly(get_opponent(player), wallet, airport, lastCase, "U", hasMoved, fee, graphics_mode, coords, True) #runs the fly funciton for the opponent since they have been forced to fly by the red disk
    if game_over: return

    stdio.writef(SAY_RED_DISK_DEDUCTION, player + 1, get_opponent(player) + 1, deduction, wallet[player]) #says the deduction for the red disk
    disks[player][RED_DISK] = False

    canPlay, can_fly, helpNeeded = show_options(player, not(asked), False, game_mode, airport, wallet, False, disks, lastCase, hasMoved, fee, graphics_mode) #lets the player take their turn now that their opponent has moved
    if game_over: return

    choice = readString(graphics_mode) #reads the players choice
    if not choice in {'A','S','F','U'}: #checks that the player entered a valid choice:
        termination(ERR_INVALID_TURN_MENU_OPTION, graphics_mode)

    if choice == "S": #runs the following if the player wishes to stay
        lastCase = flipCase(player, airport, lastCase, graphics_mode)
        if game_over: return

    elif choice == "F":#runs the fly function if the player selects they want to fly
        wallet, airport, lastCase, hasMoved = fly(player, wallet, airport, lastCase, "F", hasMoved, fee, graphics_mode, coords, can_fly)
        if game_over: return

    elif choice == "U": #the player has just played their red disk and thus may not play another obstacle disk
        termination(ERR_NO_DISKS, graphics_mode)

    elif choice == "A": #the player may not ask at this point
        termination(ERR_CANT_ASK, graphics_mode)

def greenDisk(player, airport):
    global flippable
    global collected
    global cases

    #Sets the suitcases at both players airports to be flippable
    for i in range(4):
        flippable[char_to_int(airport[player])][i] = True
        flippable[char_to_int(airport[get_opponent(player)])][i] = True

    #Shuffles the suitcases one to the right at each airport (and moves the collected array one to the right as well to match the moving suitcases)
    for i in range(10):
        collected[i][0], collected[i][1], collected[i][2], collected[i][3] = collected[i][3], collected[i][0], collected[i][1], collected[i][2]
        cases[i][0], cases[i][1], cases[i][2], cases[i][3] = cases[i][3], cases[i][0], cases[i][1], cases[i][2]

    stdio.writef(SAY_PLAY_OBSTACLE_DISK, player+1, "GREEN")
    stdio.writeln(SAY_GREEN_DISK)

def yellowDisk(player, airport, graphics_mode):
    global flippable
    global collected
    global cases

    stdio.writef(ASK_YELLOW_DISK_AIRPORT, player+1)

    target = readString(graphics_mode)

    stdio.writef(SAY_PLAY_OBSTACLE_DISK, player+1, "YELLOW")

    
    
    if target == airport[player]: #Checks that the player is not trying to swap suitcases with their own airport
        termination(ERR_FLYING_TO_SAME_AIRPORT, graphics_mode)

    #Swaps the cases and collected suitcases at the players airport and the target airport
    cases[char_to_int(airport[player])], cases[char_to_int(target)] = cases[char_to_int(target)], cases[char_to_int(airport[player])]
    collected[char_to_int(airport[player])], collected[char_to_int(target)] = collected[char_to_int(target)], collected[char_to_int(airport[player])]

    #Sets all the suitcases at the two airports to be flibbable
    flippable[char_to_int(airport[player])] = [True, True, True, True]
    flippable[char_to_int(target)] = [True, True, True, True]

    #Shuffles the cases one card to the right
    cases[char_to_int(target)][0], cases[char_to_int(target)][1], cases[char_to_int(target)][2], cases[char_to_int(target)][3] = cases[char_to_int(target)][3], cases[char_to_int(target)][0], cases[char_to_int(target)][1], cases[char_to_int(target)][2]
    cases[char_to_int(airport[player])][0], cases[char_to_int(airport[player])][1], cases[char_to_int(airport[player])][2], cases[char_to_int(airport[player])][3] = cases[char_to_int(airport[player])][3], cases[char_to_int(airport[player])][0], cases[char_to_int(airport[player])][1], cases[char_to_int(airport[player])][2]

    #Shuffles which of the cases are collected one card to the right because the cards moved
    collected[char_to_int(target)][0], collected[char_to_int(target)][1], collected[char_to_int(target)][2], collected[char_to_int(target)][3] = collected[char_to_int(target)][3], collected[char_to_int(target)][0], collected[char_to_int(target)][1], collected[char_to_int(target)][2]
    collected[char_to_int(airport[player])][0], collected[char_to_int(airport[player])][1], collected[char_to_int(airport[player])][2], collected[char_to_int(airport[player])][3] = collected[char_to_int(airport[player])][3], collected[char_to_int(airport[player])][0], collected[char_to_int(airport[player])][1], collected[char_to_int(airport[player])][2]    

    stdio.writef(SAY_YELLOW_DISK_AIRPORT, player+1, airport[player], target)
    
def cyanDisk(player, fee, wallet):
    stdio.writef(SAY_PLAY_OBSTACLE_DISK, player+1, "CYAN")
    
    wallet[get_opponent(player)] -= fee[get_opponent(player)] #subtracts the cost of the players previous flight from their wallet

    stdio.writef(SAY_CYAN_DISK, get_opponent(player)+1, fee[get_opponent(player)], wallet[get_opponent(player)])
    
    if wallet[get_opponent(player)] < 0: #checks if the player has been bankrupted
        stdio.writef(LOSS_BANKRUPT, get_opponent(player)+1)
        stdio.writef(WIN_MESSAGE, player+1)
        end_game()

    return wallet

def blackDisk(player, airport): #this function is self explanatory
    global collected
    global cases
    
    stdio.writef(SAY_PLAY_OBSTACLE_DISK,player+1,"BLACK")
    
    stdio.writef(SAY_BLACK_DISK,airport[player])

    black_disk_print(cases[char_to_int(airport[player])], collected[char_to_int(airport[player])]) 

def magentaDisk(player, lastCase, wallet):
    stdio.writef(SAY_PLAY_OBSTACLE_DISK,player+1,"MAGENTA")
    
    compensation = max(0, 9-lastCase[player])*max(0, lastCase[get_opponent(player)]-lastCase[player]) #calculates the compensation the player must receive

    wallet[player] += compensation #adds the compensation to the players wallet

    stdio.writef(SAY_MAGENTA_DISK, compensation, player+1, wallet[player])

    return wallet

###################### END OF DISC FUNCTIONS #######################

def readInt(reason, graphics_mode): #Function to validate and read integers
    s = readString(graphics_mode)
    bValid = True
    for i in range(0, len(s)):
        if s[i] not in {'1','2','3','4','5','6','7','8','9','0'}: #Checks that each digit is a number
            bValid = False
            
    #gives error based on what the programme is trying to read:
    if reason == 'A' and not bValid:
        termination(ERR_INVALID_SUITCASE_NUMBER, graphics_mode)
    elif reason == 'F' and not bValid:
        termination(ERR_INVALID_SUITCASE_POSITION, graphics_mode)
    return(int(s)) #returns the integer value

def readString(graphics_mode): 
    check_stdio_empty(graphics_mode) #checks that there is actually input
    s = stdio.readString() #reads the input
    if s == "Q":#checks that a Q was not entered
        termination(MSG_USER_TERMINATION, graphics_mode)
    return s

def readFloat(graphics_mode):
    s = readString(graphics_mode)
    if not is_float(s): termination(ERR_FLOAT_EXPECTED, graphics_mode) #uses the function from prof Nel to validate whether the given value is a float
    return(float(s))

def is_float(str_val: str) -> bool: #this function was given by prof Nel on teams to validate floats
    if str_val.isdigit(): return True
    if str_val.lower().count('e') > 1: return False
    if 'e' in str_val.lower():
        base, exp = str_val.lower().split('e')
        if len(exp) == 0 or len(base) == 0: return False
    else:
        base, exp = str_val, ""
    if base.count('.') > 1: return False
    if base.startswith('-') or base.startswith('+'):
        base = base[1:]
        if len(base) == 0: return False
    if '.' in base:
        int_part, frac_part = base.split('.')
        if not int_part and not frac_part: return False
    else:
        int_part = base
        frac_part = ""
    if int_part and not int_part.isdigit(): return False
    if frac_part and not frac_part.isdigit(): return False
    if exp:
        if exp.startswith('-') or exp.startswith('+'):
            exp = exp[1:]
            if len(exp) == 0: return False
        if not exp.isdigit(): return False
    return True

###############################################################################################
#################################### Controller functions #####################################
###############################################################################################
# The following functions are used to control the flow of the game.
# You may change the structure of these functions, as long as everything works correctly.
# You may also add additional functions if you wish.
# Some of these functions are incomplete. You must complete the functionality they represent.
###############################################################################################

def runner():  
    game_mode, graphics_mode = read_command_line_args() #read the command line args

    if graphics_mode == 1 and game_mode != 2:  #does initialisation of the gui and changes the writing functions to write to the gui
        initialise_gui()
        draw_empty_gui()
        change_writing_functions_to_gui()

    # Print the command line arguments.
    if game_mode != 2:
        print_command_line_args(game_mode, graphics_mode)

    global costs
    global cases
    global casesBackup
    coords = [] #initialises a list of coords of the airports
    for i in range (0, 10):#for each of the 10 rows containing airport info
        row = []#initialises the row of suitcases
        x = readFloat(graphics_mode)#reads the x coord
        y = readFloat(graphics_mode)#reads the y coord
        if game_mode == 2:
            stdio.write(str(x) + ' ' + str(y))
    
        for i in range(0,4):#reads the 4 cases at the airport
            row += [readInt('A', graphics_mode)]
            if game_mode == 2:
                stdio.write(' ' + str(row[i]))
        if game_mode == 2:
            stdio.writeln()
        for i in range(0,4):#checks that each of the 4 cases are in the acceptable range
            if row[i] not in {1,2,3,4,5,6,7,8,9,10}:
                termination(ERR_INVALID_SUITCASE_NUMBER, graphics_mode)
        cases += [row] #adds the row of cases to the cases array
        coords += [[x,y]]#adds the coords to the coords array
   
    costs = generate_cost_matrix(coords) #generates the cost matrix and saves it to the global variable costs
    for i in range(10):
        for j in range(4):
            casesBackup[i][j] = cases[i][j]
    if game_mode == 2:
        generate_AI_game(coords)
    else:
        game(game_mode, graphics_mode, coords) #runs the game

def game(game_mode, graphics_mode, coords):
    wallet = [100.0,100.0] #initialises each players wallet
    airport = ["Z","Z"] #initialises each players airport to an airport outside the valid range so they are not displayed on the airport grid
    roundNum = 1
    player = 0
    lastCase = [0,0] #sets each players last case to 0 since they have each collected 0 cases
    if game_mode == 0:
        disks = [[True, False, False, False, False, False],[True, False, False, False, False, False]] #array of useable obstacle disks for each player (only red usable in gm 0
    elif game_mode == 1:
        disks = [[True, True, True, True, True, True], [True, True, True, True, True, True]] #All disks available to play in gm 1
    canPlay = [False, False, False, False, False, False]
    hasMoved = [False, False]
    fee = [0.0,0.0]
    #global variables:
    global costs, collected, flippable, game_over, cases, casesBackup
    game_over = False 
    helpNeeded = False  
    
    #This loop does the starting positions of the players and displays the appropriate outputs, it runs once for each player
    for i in range(0,2):
        player = i #sets to i so the loop runs for each player
        if graphics_mode == 0: #prints/displays the appropriate info for the player
            print_cost_matrix(costs,player,wallet[player],roundNum)
        else:
            display_player_details(player,wallet[player],roundNum)
            draw_airport_map(airport[0], airport[1], coords, costs, player)
        
        if graphics_mode == 1: draw_available_airports(player,airport,wallet) #shows the player the available airports
        stdio.writef(ASK_AIRPORT_DESTINATION, player + 1)
        
        airport[player] = readString(graphics_mode) #gets the inital airport of the player
        stdio.writef(SAY_INITIAL_AIRPORT, player + 1, airport[player])
        print_airport_grid(char_to_int(airport[0]), char_to_int(airport[1]))
        if graphics_mode == 1: draw_airport_map(airport[0], airport[1], coords, costs, player)

        lastCase = flipCase(player, airport, lastCase, graphics_mode)
        if game_over: break

    while not game_over: #this is the loop of the game it runs twice for each round (once for each players turn during the round)
        if player == 0: player = 1 #changes the player
        else:
            player = 0
            roundNum += 1 #increases the roundnum each time the player is set back to player 0
        
        asked = False #This variable is used to check if the player has already asked the other player to move(to check if the red disk can be played)
        
        if graphics_mode == 0:
            print_cost_matrix(costs,player,wallet[player],roundNum)
        else:
            display_player_details(player,wallet[player],roundNum)
            draw_airport_map(airport[0], airport[1], coords, costs, player)

        print_airport_grid(char_to_int(airport[0]), char_to_int(airport[1]))     
        
        canPlay, can_fly, helpNeeded = show_options(player, not(asked), True, game_mode, airport, wallet, False, disks, lastCase, hasMoved, fee, graphics_mode) #does the options
        if game_over: break #if a win/loss condition was fulfilled while displaying options then this terminates the game loop
        choice = readString(graphics_mode) #reads the string using a function I wrote that does validation
        if not choice in {'A','S','F','U'}: #checks that the entered option is valid
            termination(ERR_INVALID_TURN_MENU_OPTION, graphics_mode)
            
        #If the player decides to stay at their airport the following is done    
        if choice == "S":
            lastCase = flipCase(player, airport, lastCase, graphics_mode)
            if game_over: break
                
        #Runs the fly function if the player selected fly
        elif choice == "F":
            wallet, airport, lastCase, hasMoved = fly(player, wallet, airport, lastCase, "F", hasMoved, fee, graphics_mode, coords, can_fly)
            if game_over: break
            
        #the player cannot play disks during the first hand in if they have not already asked the opponent to move therefore no checks need to be done to accertain that the player may not play a disk
        elif choice == "U":
            playObstacle(graphics_mode, game_mode, canPlay, player, disks, asked, fee, hasMoved, lastCase, airport, wallet, helpNeeded, coords)
            if game_over: break
                                
                

        #if the player selects A then runs the code for that
        elif choice == "A":
            asked = True #sets the asked variable to true since the player has just asked their opponent to move
            stdio.writef(SAY_REQUEST_LEAVE, player + 1, get_opponent(player) + 1)
            if graphics_mode == 0:
                stdio.writef(ASK_WANT_TO_LEAVE, int(get_opponent(player) + 1))
            elif graphics_mode == 1:
                draw_YN()
                stdio.writef('Player %d, would you like to leave the airport?', get_opponent(player) + 1)
            choice = readString(graphics_mode) #reads the string using a function I wrote
            #if the player selects that they want to leave then runs the following code:
            if choice == "Y": 
                stdio.writef(SAY_PLAYER_LEFT, get_opponent(player) + 1, player + 1)
                
                wallet, airport, lastCase, hasMoved = fly(get_opponent(player), wallet, airport, lastCase, "A", hasMoved, fee, graphics_mode, coords, True) #runs the fly function for the opponent to fly to a new airport

                #lets the original player take their turn now that their opponent has flown
                canPlay, can_fly, helpNeeded = show_options(player, not(asked), True, game_mode, airport, wallet, False, disks, lastCase, hasMoved, fee, graphics_mode)
                if game_over: break

                choice = readString(graphics_mode)
                if not choice in {'A','S','F','U'}:
                    termination(ERR_INVALID_TURN_MENU_OPTION, graphics_mode)
                
                if choice == "S": #If the player says they wish to stay runs the following code
                    lastCase = flipCase(player, airport, lastCase, graphics_mode)
                    if game_over: break

                elif choice == "F": #runs the fly function if the player selects fly
                    wallet, airport, lastCase, hasMoved = fly(player, wallet, airport, lastCase, "F", hasMoved, fee, graphics_mode, coords, can_fly)
                    if game_over: break

                elif choice == "A": #the player has just asked their opponent to move and thus can not ask again
                    termination(ERR_CANT_ASK, graphics_mode)

                elif choice == "U":
                    asked = False
                    playObstacle(graphics_mode, game_mode, canPlay, player, disks, asked, fee, hasMoved, lastCase, airport, wallet, helpNeeded, coords)
                    if game_over: break
                        
            elif choice == "N":#runs the following code if the players opponent does not wish to move
                stdio.writef(SAY_REFUSED_TO_LEAVE, get_opponent(player) + 1, player+1)
                
                canPlay, can_fly, helpNeeded = show_options(player, not(asked), True, game_mode, airport, wallet, True, disks, lastCase, hasMoved, fee, graphics_mode) #shows the player their options now that their opponent hasn't moved
                if game_over: break

                choice = readString(graphics_mode)
                if not choice in {'A','S','F','U'}: #checks that a valid option was selected
                    termination(ERR_INVALID_TURN_MENU_OPTION, graphics_mode)

                if choice == "S": #runs the following if the player wishes to fly
                    lastCase = flipCase(player, airport, lastCase, graphics_mode)
                    if game_over: break
                        
                elif choice == "F": #runs the fly function if the player selects that they want to fly to a new airport
                    wallet, airport, lastCase, hasMoved = fly(player, wallet, airport, lastCase, "F", hasMoved, fee, graphics_mode, coords, can_fly)
                    if game_over: break

                elif choice == "A": #the player may not ask since they have already done so
                    termination(ERR_CANT_ASK, graphics_mode)

                elif choice == "U": #runs the following if the player selects they want to use an obstacle disk
                    playObstacle(graphics_mode, game_mode, canPlay, player, disks, asked, fee, hasMoved, lastCase, airport, wallet, helpNeeded, coords)
                    if game_over: break

    if graphics_mode == 0:
        stdio.writeln(ASK_NEW_GAME)#asks if the player would like to play a new game
    elif graphics_mode == 1:
        draw_YN()
        stdio.writeln("Do you want to start a new game?")

    choice = readString(graphics_mode)#reads the players choice
    if choice == "Y":#if the player would like new game then resets some variables and runs the game function again
        for i in range(0,10):
            for j in range(0,4):
                collected[i][j] = False
                flippable[i][j] = True
                cases[i][j] = casesBackup[i][j]
        stdio.writeln(SAY_YES_NEW_GAME)
        game(game_mode, graphics_mode, coords)
    elif choice == "N": #termnatis if the player would not like a new game
        termination(MSG_NO_NEW_GAME_TERMINATION, graphics_mode)
    else:
        termination(ERR_NOT_YES_OR_NO, graphics_mode)

###############################################################################################
##################################### Printing functions ######################################
###############################################################################################
# The following functions are used to print the game state to standard output.
# DO NOT MODIFY THESE FUNCTIONS.
# We expect a very specific output format since we will be using an automated marking script.
# During marking, we compare the output of your program with the expected output.
# If the output does not match, your program will be marked as incorrect.
###############################################################################################

def termination(msg, graphics_mode):
    """
    Terminate the program and display an appropriate message.

    This function should be called when user input should cause the program to terminate.
    This is the only function that should be used to terminate the program and print the associated termination message.

    Parameters
    ----------
    msg
        The message to be displayed to the user before terminating. This message should correspond to one of the constants defined at the top of the program. Ensure that you specify the correct constant when calling this function, according to the error that has occurred. See the project specification for more details.
    """
    stdio.writef('Termination: %s', str(msg))
    if graphics_mode == 1:
        do_countdown() 
    sys.exit(0)

def print_obstacle_disks(can_play_disk_array):
    """
    Print the obstacle disks available to the given player.

    NOTE: The Red disk should only be displayed here after the player has asked their opponent to leave their airport, and the opponent has refused to leave -- assuming they have not used it previously. In the case where it is possible to display the red disk, no other obstacle disks should be displayed, even if they have not been played yet. In the case where the player did not ask their opponent to leave their airport, only the non-red obstacle disks should be displayed (noting that, for the first hand-in, the non-red obstacle disks will never be available).

    Parameters
    ----------
    player
        the index of the current player. `0` for `P1` and `1` for `P2`.
    can_play_disk_array
        an array of six Booleans (`True` or `False`) corresponding to whether or not the disk at that index can be played or not.
        NOTE: the order of the array elements are important: `[can_play_red, can_play_green, can_play_yellow, can_play_cyan, can_play_black, can_play_magenta]`. When it is possible for can_play_red to be `True`, the others should be false, even if the player has not played any of the non-red disks yet. Similarly, when the other values can possibly be `True`, the red disk should not be `True`, even if the player has not played their red obstacle disk yet since the red obstacle disk can only and is the only obstacle disk that can played immediately after the current player has asked their opponent to leave their airport, and the opponent has refused to do so.
    """
    if game_over: return
    middle = ' x%11sx '
    outer1 = '     x x x     '
    outer2 = '  x         x  '
    colour_characters_array = ['R', 'G', 'Y', 'C', 'B', 'M']
    for row in range(7):
        for disk in range(len(colour_characters_array)):
            if disk == 0: stdio.write('\t')
            if not can_play_disk_array[disk]: continue
            if row == 0 or row == 6:
                stdio.write(outer1)
            elif row == 1 or row == 5:
                stdio.write(outer2)
            elif row == 2 or row == 4:
                stdio.writef(middle, ' ')
            else:
                stdio.writef(middle, colour_characters_array[disk].center(10))
        stdio.writeln()

def black_disk_print(suitcase_numbers_array, collected_array):
    """
    This function reveals the numbers behind the suitcases at their current airport. It also shows which of these suitcases have already been collected by either player.

    This function must only be called after a player correctly plays their black card. ''Correcly'', here, implies that you still have to perform logical checks to see whether the player is allowed to play their black card before calling this function.

    Parameters
    ----------
    suitcase_numbers_array
        A one-dimensional array with four elements. The elements are integer values -- the (usually hidden) numbers of each corresponding suitcase index. The array must contain four integer values, each between 1 and 10. These are the numbers the player needs to collect in sequence. The index of each number in the array corresponds to the index of the corresponding suitcase at the aiport.
    collected_array
        A one-dimensional array with four elements. The elements are boolean values, indicating whether or not a suitcase has already been collected by either player. If a suitcase at index `x` has been collected by either player, the value of `collected_array[x]` will be `True`. In contrast, if the suitcase at index `x` has not yet been collected, the value of `collected_array[x]` will be `False`.
        This variable is used to decide whether a cross should be drawn through the card. If the suitcase has been collected, a cross is drawn through the card and the number corresponding to that suitcase is displayed in the middle of the card. If the suitcase has not been collected, the number is displayed in the middle of the card, but no cross is drawn through the card.
        The index of each Boolean in the array corresponds to the index of the corresponding suitcase at the aiport.
    """
    if game_over: return
    space = ' '*5
    card_edge = '%5s' + CORN + LINE * 7 + CORN
    inside = space + WALL + '%-7s' + WALL
    empty = ' '*7
    uncollected = [empty, empty, ' ' * 3, empty, empty]
    taken1 = 'x     x'
    taken2 = ' x   x '
    collected = [taken1, taken2, ' ' * 3, taken2, taken1]

    for card_pos in range(SUITCASES_PER_AIRPORT):
        stdio.writef(card_edge, space)
    stdio.writeln()

    for i in range(5):
        for card_pos in range(SUITCASES_PER_AIRPORT):
            val = str(suitcase_numbers_array[card_pos]) if i == 2 else ''
            if collected_array[card_pos]:
                stdio.writef(inside, collected[i] + val)
            else:
                stdio.writef(inside, uncollected[i] + val)
        stdio.writeln()

    for card_pos in range(SUITCASES_PER_AIRPORT):
        stdio.writef(card_edge, str(card_pos+1) + '. ')
    stdio.writeln('\n')

def print_single_suitcase_number(number):
    """
    Print an image of a single suitcase with the given number. This is used to reveal the number behind a suitcase when a player flips it.

    Do not use this function to display suitcase numbers when a black obstacle disk is played. Use the `black_disk_print()` function instead.
    This function only prints the number behind a single suitcase. You must perform the logical checks involved in flipping a suitcase before you call this function to print the number behind that suitcase.

    Parameters
    ----------
    number
        The number behind the suitcase that has just been flipped. This must be an integer between 1 and 10, both inclusive.
    """
    if game_over: return
    card_edge = CORN + LINE * 7 + CORN
    middle = WALL + '%7s' + WALL + '\n'
    blank = ' '*7
    card_number = str(number).center(7)
    stdio.writeln(card_edge)
    for i in range(5):
        stdio.writef(middle, card_number if i == 2 else blank)
    stdio.writeln(card_edge + '\n')

def print_airport_suitcases(suitcase_numbers_array, collected_array, allowed_to_flip_array):
    """
    Print the four cards representing the suitcases at an airport. This function is only used for printing purposes only -- it does not perform logic checking. You must ensure that the values you give as arguments to this function are correct before you call this function.

    DO NOT MODIFY the contents of this function. If you do, you risk changing the way the suitcases are printed. That would be a disaster.

    The parameters of this function will give you a good idea of what you should keep track of. Each parameter is a one dimensional array with four entries. Each entry corresponds to information about the suitcase at that index. Make sure that the elements of each array correspond with the index of the suitcases at the current airport. For example, the first card at an airport has an index of 0. For each parameter, the array entry at index 0 must correspond to the information about the first suitcase. See the argument explanations below for more details.

    Parameters
    ----------
    suitcase_numbers_array
        A one-dimensional array with four elements. The elements are integer values -- the (usually hidden) numbers of each corresponding suitcase index. The array must contain four integer values, each between 1 and 10. These are the numbers the player needs to collect in sequence. This function uses the `suitcase_numbers_array` to determine whether or which numbers to print on the cards. If the suitcase has not yet been collected, the number is not printed. If the card was already collected by either player, the number is printed, but the card will have a cross drawn through it. See the explanation on the parameter `collected_array` for more details.

        For example, let's say the third suitcase at this airport corresponds to the number 7. If we want to know the number of the suitcase at index 2 (the THIRD suitcase at this airport), we can use the following code:

        >>> suitcase3_number = suitcase_numbers_array[2]
        >>> stdio.writeln(suitcase3_number)
        7
    collected_array
        A one-dimensional array with four elements. The elements are boolean values, indicating whether or not a suitcase has already been collected by either player. If a suitcase at index `x` has been collected by either player, the value of `collected_array[x]` will be `True`. In contrast, if the suitcase at index `x` has not yet been collected, the value of `collected_array[x]` will be `False`.
        This variable is used to decide whether a cross should be drawn through the card. If the card has been collected, a cross is drawn through the card and the number corresponding to that card is displayed in the middle of the cross.
    allowed_to_flip_array
        A one-dimensional array with four elements. The elements are boolean values, indicating whether or not a suitcase can be flipped by the current player because they might have already flipped that card during their current visit to their airport. If a player flips a card, they cannot flip it again until the flip restriction is lifted. This is to avoid players simply flipping cards forever. Note: this variable only checks the flip restriction. It does not take into account whether a card has already been collected, for example.
        If the current player has not yet flipped the suitcase at position `x` since the last reset of their flip restrtiction, the value of `allowed_to_flip_array[x]` will be `True`. In contrast, if the current player has already flipped the suitcase at position `x` during their visit to this airport (and the flip restriction has not yet been reset), the value of `allowed_to_flip_array[x]` will be False.
        If `allowed_to_flip_array[x]` is `True`, the suitcase at position `x` will not be displayed to the player. It will simply not be printed. Make sure the flip restriction does not prevent already collected cards from being printed.
    """
    if game_over: return
    space = ' '*5
    card_edge = '%5s' + CORN + LINE * 7 + CORN
    inside = space + WALL + '%-7s' + WALL
    empty = ' '*7
    unflipped = ['   _   ', ' xX Xx ', ' x   x ', ' xXXXx ', empty]
    taken1 = 'x     x'
    taken2 = ' x   x '
    collected = [taken1, taken2, ' ' * 3, taken2, taken1]
    stdio.writeln('Suitcases at the current airport:')

    for card_pos in range(SUITCASES_PER_AIRPORT):
        if allowed_to_flip_array[card_pos]:
            stdio.writef(card_edge, space)
    stdio.writeln()

    for i in range(5):
        for card_pos in range(SUITCASES_PER_AIRPORT):
            if not allowed_to_flip_array[card_pos]:
                continue
            if collected_array[card_pos]:
                val = str(suitcase_numbers_array[card_pos]) if i == 2 else ''
                stdio.writef(inside, collected[i] + val)
            else:
                stdio.writef(inside, unflipped[i])
        stdio.writeln()

    for card_pos in range(SUITCASES_PER_AIRPORT):
        if allowed_to_flip_array[card_pos]:
            stdio.writef(card_edge, str(card_pos+1) + '. ')
    stdio.writeln('\n')

def write_center(text, length=5):
    stdio.writef(' %s |', text.center(length))

def print_cost_matrix(flight_cost_matrix, cur_player, cur_player_wallet, cur_round_number):
    """
    Print the given cost matrix to standard output. DO NOT THE CONTENTS MODIFY THIS FUNCTION!

    Modifying this function may affect how the cost matrix is printed. Since we mark via differencing, you may lose points if your cost matrix is not displayed as we expect it to be.

    The cost matrix is printed in a table format, with a header providing information about the game state.
    The header contains the round number on the left, the player number in the middle, and the player's balance on the right.
    Header information must be passed as arguments to this function.

    Parameters
    ----------
    flight_cost_matrix
        The cost matrix to be printed. The parameter `flight_cost_matrix` must be given in the expected format. The contents of `flight_cost_matrix` should be equal to that which was previously obtained by calling the `generate_cost_matrix()` function. Make sure you correctly applied the `generate_cost_matrix()` function.
    cur_player
        The index of the current player (0 for P1, 1 for P2). The parameter cur_player must be an integer between 0 and 1.
    cur_player_wallet
        The balance of the current player. The parameter cur_player_wallet must be a float.
    cur_round_number
        The current round number. The parameter cur_round_number must be an integer, indicating the current round number.
    """
    if game_over: return
    header_line = WALL + ' %-28s%s%28s ' + WALL
    stdio.writeln(CORN + LINE * (87) + CORN)
    round_info = f'Round {cur_round_number}'
    player_info = f'Player {cur_player + 1}'.center(29)
    wallet_info = f'Balance: R{float(cur_player_wallet):.2f}'
    stdio.writef(header_line, round_info, player_info, wallet_info)
    edge = '\n' + CORN + (LINE * 7 + CORN) * 11
    stdio.writeln(edge)
    stdio.writef('%s', WALL)
    write_center(' ', length=5)
    for col in range(AIRPORTS):
        write_center(int_to_char(col))
    stdio.writeln(edge)
    for row in range(AIRPORTS):
        stdio.writef('%s', WALL)
        write_center(int_to_char(row), length=5)
        for col in range(AIRPORTS):
            write_center(f'{float(flight_cost_matrix[row][col]):.2f}')
        stdio.writeln()
    stdio.writeln(edge[1:] + '\n')

def print_suitcase_grid(p1_last_suitecase, p2_last_suitecase):
    """
    Print the grid of suitcases to standard output indicating which suitcases each player has already collected.

    The grid is a `2 x 5` grid, where each cell represents a number between 1 and 10. The grid will show the players' last suitcase numbers, or a blank space if they have not yet collected a suitcase. Thus, if player 1 has collected all suitcases up to and including 5, the grid indicate that player one is currently on the cell with 5. Similarly, if player 2 has collected all suitcases up to and including 8, the grid will indicate that player 2 is currently on the cell with 8. All other cells will be blank. If a player has not yet, the value of the corresponding argument should be 0.

    Please make sure you give the correct values of each player's last suitcase number as the arguments of this function. If you do not, the grid will not be printed correctly.

    Do not modify the contents of this function.

    Parameters
    ----------
    p1_last_suitecase
        The number corresponding to the last suitcase collected by player 1. This must be an integer between 0 and 10.
    p2_last_suitecase
        The number corresponding to the last suitcase collected by player 2. This must be an integer between 0 and 10.
    """
    header = 'Player Suitcases'
    generic_grid_print(header, p1_last_suitecase, p2_last_suitecase, True, False)

def print_airport_grid(p1_airport_id, p2_airport_id):
    """
    Print the airport grid to standard output. The airport grid displays the positions of the two players on the grid. The grid is a 2x5 grid, where each cell represents an airport. The grid will show the players' positions, or a blank space if they are not on that airport. Thus, if player 1 is on airport A, the grid will indicate that player one is currently on the cell with A. Similarly, if player 2 is on airport D, the grid will indicate that player 2 is currently on the cell with D. All other cells will be blank.

    Please note: the parameters `p1_airport_id` and `p2_airport_id` expect integer values that correspond to the INDEX of the associated airport. Thus, if player `1` is on airport `A`, the value of `p1_airport_id` should be `0`. If player `2` is on airport `D`, the value of `p2_airport_id` should be `3`. If a player is not currently at an airport, the value of the corresponding argument should be an integer that does NOT fall between `0` and `9`, both inclusive. For example, a value of `-1` is acceptable and indicates that the player is not currently at an airport.

    Furthermore, P1 and P2 are never allowed to be on the same airport at the same time. If they are, you have made a mistake somewhere.

    Do not modify the contents of this function.

    Parameters
    ----------
    p1_airport_id
        The index of the airport that player 1 is currently on. This must be an integer.
    p2_airport_id
        The index of the airport that player 2 is currently on. This must be an integer.
    """
    header = 'Airplane Locations'
    generic_grid_print(header, p1_airport_id, p2_airport_id, False, True)

def generic_grid_print(header_text, p1_position, p2_position, seperate_players, use_letters):
    """
    This function controls the printing of the airport and suitcase grid. DO NOT MODIFY IT!

    This function is called by print_airport_grid and print_suitcase_grid. It is not intended to be called by the student.

    We mark your code based on the difference between the expected output and that of your implementation. If you modify this function, there is a large risk that you will modify how the grids are printed.
    """
    if game_over: return
    p1 = 'P1'
    p2 = 'P2'
    player_indicator = ' %2s'+ ' '*5 + '%2s ' + WALL
    centre_indicator = ' '*5 + '%-2s' + ' '*4 + WALL
    seperator = CORN + (LINE * 11 + CORN) * 5
    stdio.writeln(CORN + LINE * (12 * 5 - 1) + CORN)
    stdio.writef('%s%s%s\n', WALL, header_text.center(len(seperator) - 2), WALL)
    for row in range(2):
        stdio.writef('%s\n', seperator)
        for i in range(5):
            stdio.write(WALL)
            for col in range(5):
                cell = row * 5 + col
                if i == 2:
                    stdio.writef(centre_indicator, int_to_char(cell) if use_letters else cell + 1)
                elif seperate_players and i == 0:
                    stdio.writef(player_indicator, p1 if cell+1 == p1_position else ' ', p2 if cell+1 == p2_position else ' ')
                elif seperate_players and i == 4:
                    stdio.writef(player_indicator, p2 if cell+1 == p2_position else ' ', p1 if cell+1 == p1_position else ' ')
                elif cell == p1_position and (i == 0 or i == 4):
                    stdio.writef(player_indicator, p1, p1)
                elif cell == p2_position and (i == 0 or i == 4):
                    stdio.writef(player_indicator, p2, p2)
                else:
                    stdio.writef(centre_indicator, ' ')
            stdio.write('\n')
    stdio.writef('%s\n\n', seperator)

def print_command_line_args(game_mode_val, graphics_mode_val):
    """
    Prints the command line arguments to standard output.

    Call this after the command line arguments have been parsed.

    Parameters
    ----------
    game_mode_val
        The value of the game mode command line argument. (0, 1, or 2)
    graphics_mode_val
        The value of the graphics mode command line argument. (0 or 1)
    """
    stdio.writef('Game mode: %d\nGraphics mode: %d\n\n', game_mode_val, graphics_mode_val)
    
###############################################################################################
###############################################################################################
####################### NEW FUNTIONS FROM SECOND HAND IN SKELETON CODE ########################
###############################################################################################
###############################################################################################

def read_images():
    """
    Read all of the images and store them in global variables.
    Do not modify this function.
    """
    global map_image, p1_image, p2_image, s1_image, s2_image, s3_image
    if not os.path.exists(MAP_BACKGROUND_IMG_PATH):
        raise FileNotFoundError(f'Could not find the map image at {MAP_BACKGROUND_IMG_PATH}.')
    if not os.path.exists(P1_PLANE_IMG_PATH):
        raise FileNotFoundError(f'Could not find the player 1 image at {P1_PLANE_IMG_PATH}.')
    if not os.path.exists(P2_PLANE_IMG_PATH):
        raise FileNotFoundError(f'Could not find the player 2 image at {P2_PLANE_IMG_PATH}.')
    if not os.path.exists(S1_SUITCASE_IMG_PATH):
        raise FileNotFoundError(f'Could not find the suitcase image at {S1_SUITCASE_IMG_PATH}.')
    if not os.path.exists(S2_SUITCASE_IMG_PATH):
        raise FileNotFoundError(f'Could not find the suitcase image at {S2_SUITCASE_IMG_PATH}.')
    if not os.path.exists(S3_SUITCASE_IMG_PATH):
        raise FileNotFoundError(f'Could not find the suitcase image at {S3_SUITCASE_IMG_PATH}.')
    map_image = Picture(MAP_BACKGROUND_IMG_PATH)
    p1_image = Picture(P1_PLANE_IMG_PATH)
    p2_image = Picture(P2_PLANE_IMG_PATH)
    s1_image = Picture(S1_SUITCASE_IMG_PATH)
    s2_image = Picture(S2_SUITCASE_IMG_PATH)
    s3_image = Picture(S3_SUITCASE_IMG_PATH)

def change_writing_functions_to_gui():
    """
    Change the writing functions to use the GUI instead of the console.
    Call this if GUI mode is enabled.
    """
    global print_obstacle_disks, black_disk_print, print_single_suitcase_number, print_airport_suitcases, print_suitcase_grid, print_airport_grid
    

    stdio.writeln = gui_write
    stdio.writef = gui_writef
    stdio.write = gui_write

    print_obstacle_disks = display_obstacle_disks
    black_disk_print = display_black_disk
    print_single_suitcase_number = display_single_suitcase_number
    print_airport_suitcases = display_airport_suitcases
    print_suitcase_grid = display_suitcase_grid
    print_airport_grid = display_airport_grid

def gui_writef(fmt, *args):
    """
    Use exactly the same syntax as stdio.writef, but instead of writing to the console, write to the GUI.
    Do not modify this function.
    """
    text = (fmt.strip()) % args
    gui_write(text)

def gui_write(text=''):
    """
    Use exactly the same syntax as stdio.write, but instead of writing to the console, write to the GUI.
    Do not modify this function.
    """
    global output_text_list
    text = text.replace('\n', ' ').strip()
    max_width = OUTPUT_AREA_WIDTH - 20
    max_entries = (OUTPUT_AREA_HEIGHT/2) // GUI_OUTPUT_FONT.size(' ')[1]
    words = text.split(' ')
    while len(words) > 0:
        line_words = []
        while len(words) > 0 and GUI_OUTPUT_FONT.size(' '.join(line_words + [words[0]]))[0] < max_width:
            line_words.append(words.pop(0))
        output_text_list.append((' '.join(line_words)).strip())
        while GUI_OUTPUT_FONT.size(output_text_list[-1])[0] < max_width: output_text_list[-1] += ' '
    output_text_list.append('')
    while len(output_text_list) > max_entries or (len(output_text_list) > 0 and output_text_list[0].strip() == ''):
        output_text_list.pop(0)
    draw_message_area()
    stddraw.show(SHOW_DELTA)

def rect_border(x0, y0, xl, yl):
    """
    Draw a filled rectangle with a border.
    Do not modify this function.
    """
    stddraw.setPenColor(stddraw.LIGHT_GRAY)
    stddraw.filledRectangle(x0, y0, xl, yl)
    draw_border_lines(x0, y0, xl, yl)

def draw_border_lines(x0, y0, xl, yl):
    """
    Draw the border lines of a rectangle. Not filled.
    Do not modify this function.
    """
    stddraw.setPenRadius(DEFAULT_PEN_RADIUS)
    stddraw.setPenColor(stddraw.DARK_GRAY)
    stddraw.line(x0, y0, x0 + xl, y0)
    stddraw.line(x0, y0, x0, y0 + yl)
    stddraw.line(x0 + xl, y0, x0 + xl, y0 + yl)
    stddraw.line(x0, y0 + yl, x0 + xl, y0 + yl)

def draw_message_area():
    """
    Draw the message area.
    Do not modify this function.
    """
    x0 = 0
    y0 = OUTPUT_AREA_HEIGHT/2
    rect_border(x0, OUTPUT_AREA_HEIGHT/2, OUTPUT_AREA_WIDTH, OUTPUT_AREA_HEIGHT/2)
    if len(output_text_list) > 0:
        x_center = x0 + OUTPUT_AREA_WIDTH/2
        stddraw.setFontSize(15)
        stddraw.setPenColor(stddraw.BLACK)
        for i in range(len(output_text_list)):
            y_center = y0 + (i + 1) * (15)
            stddraw.text(x_center, y_center, output_text_list[len(output_text_list) -1 -i])
        stddraw.setFontSize(FONT_SIZE)

def get_flight_connection_colour(flight_cost: float):
    """
    Get the colour of the flight connection based on the flight cost.
    Use this to colour the flight connections on the map.
    Do not modify this function.

    Parameters
    ----------
    flight_cost
        The cost of the flight connection.

    Returns
    -------
    Color
        The colour of the flight connection.
    """
    h = max(0.3, min(0.2 + (flight_cost/20.0)*0.9, 1.0))
    i = int(h * 6.0)
    f = int(255*((h * 6.0) - i))    
    rgbs = [(255, f, 0), (255-f, 255, 0), (0, 255, f), (0, 255-f, 255), (f, 0, 255), (255, 0, 255-f)]
    return Color(*rgbs[i % 6])

def draw_airport_map(p1_airport_id, p2_airport_id, airport_coordinate_matrix, flight_cost_matrix, cur_player):
    p1_airport_id = char_to_int(p1_airport_id)
    p2_airport_id = char_to_int(p2_airport_id)
    """
    An incomplete function to draw the airport map. You need to complete this function.

    Parameters
    ----------
    p1_airport_id
        The ID of the first player's airport.
    p2_airport_id
        The ID of the second player's airport.
    airport_coordinate_matrix
        The matrix of airport coordinates.
    flight_cost_matrix
        The matrix of flight costs. I.e., the cost matrix.
    cur_player
        The current player. Either 0 or 1.
    """
    # The ID of the current player's airport.
    cur_airport_id = p1_airport_id if cur_player == 0 else p2_airport_id

    # The coordinates of the airports scaled to the coordinates that wil be drawn on the map.
    map_coordinates = stdarray.create2D(AIRPORTS, 2, 0)

    # The padding between the border of the map and the border of the map image. (5%)
    padding = 0.05

    # The width and height of the map image.
    l = 500
    x0 = X_MAX - l
    y0 = 0

    # The minimum and maximum x and y coordinates of the airports.
    x_min = float('inf')
    x_max = float('-inf')
    y_min = float('inf')
    y_max = float('-inf')

    # Draw the map image.
    rect_border(x0, y0, l, l)
    stddraw.picture(map_image, x0 + l/2, y0 + l/2)
    draw_border_lines(x0, y0, l, l)

    # Resize the dimensions of the map to account for padding.
    x0 = x0 + l * padding
    y0 = y0 + l * padding
    l = l * (1 - padding*2)

    # Find the minimum and maximum x and y coordinates of the airports.
    for airport in range(AIRPORTS):
        x, y = airport_coordinate_matrix[airport]
        x_min = min(x_min, x)
        x_max = max(x_max, x)
        y_min = min(y_min, y)
        y_max = max(y_max, y)

    # Scale the coordinates of the airports to the coordinates that wil be drawn on the map.
    for airport in range(AIRPORTS):
        map_coordinates[airport][0] = x0 + ((airport_coordinate_matrix[airport][0] - x_min) / (x_max - x_min)) * l
        map_coordinates[airport][1] = y0 + ((airport_coordinate_matrix[airport][1] - y_min) / (y_max - y_min)) * l
    # TODO: The rest of the function is your duty to implement

    # Draw the connections between the airports and display the cost on top of the line:
    for airport in range(AIRPORTS):
        x1, y1 = map_coordinates[airport]
        for other_airport in range(AIRPORTS):
            if airport == other_airport:
                continue
            # Get the drawing coordinates of the other airport.
            x2, y2 = map_coordinates[other_airport]
            # Get the flight cost between these two airports
            f_cost = flight_cost_matrix[airport][other_airport]
            # If airport is the same as the current player's airport, draw a thicker line.
            if airport == cur_airport_id:
                stddraw.setPenRadius(2.0)
            else:
                stddraw.setPenRadius(0.5)
            # Draw the line and set the colour of the line based on the flight cost.
            stddraw.setPenColor(get_flight_connection_colour(f_cost))
            stddraw.line(x1, y1, x2, y2)
    # TODO: The rest of the function is your duty to implement
    # For example, you still need to draw the dots for the airports and the labels for the airports.
    # You also need to draw the plane icon on top of both players' airports.
    # You also need to draw the cost of the flight connection between the two airports on top of the line.
    # Only draw the cost of the flight connection if the line is drawn between the current player's airport and any other airport.
    # Tip: the midpoint of a line is given by the formula (x_mid, y_mid) = ((x1 + x2)/2, (y1 + y2)/2)

    for i in range(10): #draws points at each airports location
        x, y = map_coordinates[i]
        stddraw.setPenRadius(0.01)
        stddraw.setPenColor(stddraw.BLACK)
        stddraw.point(x,y)
        stddraw.text(x + 10,y - 10, int_to_char(i))

    if p1_airport_id != 25: #if the player has chosen an airport then prints their image above the airports point
        x, y = map_coordinates[p1_airport_id]
        stddraw.picture(p1_image, x, y + 10)
        
    if p2_airport_id != 25:
        x, y = map_coordinates[p2_airport_id]
        stddraw.picture(p2_image, x, y + 10)

    airportID = [p1_airport_id, p2_airport_id]
    if airportID[cur_player] != 25: #this loop draws the costs of each flight on the map
        x0,y0 = map_coordinates[airportID[cur_player]] #gets the coords of the players airport

        for i in range(10):
            if i != airportID[cur_player]:
                x1,y1 = map_coordinates[i] #getsthe coords of each other airport
                stddraw.text((x0 + x1)/2,(y0+y1)/2 + 5,str(round(flight_cost_matrix[airportID[cur_player]][i],2))) #draws the cost of the flight at the midpoint of the line
    stddraw.show(SHOW_DELTA)
        
###########################################################################
###########################################################################
######################## gui functions made by me #########################
###########################################################################
###########################################################################

def draw_empty_gui(): #this function is used in initialisation of the GUI to draw the empty GUI without any text on it
    rect_border(0,0,X_MAX,Y_MAX - 40)
    rect_border(0,0,X_MAX//2,Y_MAX - 40)

    rect_border(0,0,500,250)
    rect_border(0,700,X_MAX,40)

    stddraw.picture(map_image, X_MAX-500 + 500/2, 0 + 500/2)

    draw_grid(0,500,500,700)
    draw_grid(500,500,1000,700)

    draw_grid_text(50, 650, "L")
    draw_grid_text(550, 650)

def initialise_gui(): #this function initialises the gui
    read_images()

    global output_text_list
    output_text_list = []

    #sets all the stddraw parameters that need to be set
    stddraw.setCanvasSize(X_MAX,Y_MAX)
    stddraw.setXscale(0,X_MAX)
    stddraw.setYscale(0,Y_MAX)
    stddraw.setFontSize(FONT_SIZE)
    stddraw.setPenRadius(DEFAULT_PEN_RADIUS)
    stddraw.setPenColor(stddraw.DARK_GRAY)
    stddraw.setFontFamily("Consolas")

def draw_grid(x1,y1,x2,y2): #this function is used to draw the grids of the airport and suitcase grid
    rect_border(x1,y1,x2-x1,y2-y1) #draws the border
    stddraw.line(x1,(y2 + y1)/2,x1 + 500,(y2 + y1)/2) #draws a horizontal line across the middle
    for i in range(1,5):#draws vertical lines at regular intervals to form the rest of the grid lines
        stddraw.line(x1 + i * 100, y1, x1 + i * 100, y2)

def draw_grid_text(x, y, type = "I"): #this function is used to draw the text in the airport and suitcase grid. It takes a type argument to check whether it should draw integers or letters
    stddraw.setPenColor(stddraw.BLACK)
    for i in range(0,5): #draws the top 5 characters, either letters or numbers depending on the type
        if type == "L":
            stddraw.text(x + i * 100, y, int_to_char(i))
        else:
            stddraw.text(x + i * 100, y, str(i + 1))

    for i in range(5,10): #draws the bottom 5 characters
        if type == "L":
            stddraw.text(x + (i - 5) * 100, y - 100, int_to_char(i))
        else:
            stddraw.text(x + (i - 5) * 100, y - 100, str(i + 1))

def draw_card(x,y): #draws a generic card with nothing on it
    #takes the x and y of the bottom left corner

    #draws the white rectangle
    stddraw.setPenColor(stddraw.WHITE)
    stddraw.filledRectangle(x,y,CARD_WIDTH,CARD_HEIGHT)

    #draws the shadows of the card
    stddraw.setPenColor(stddraw.BLACK)
    stddraw.filledRectangle(x+3,y-5,CARD_WIDTH,5)
    stddraw.filledRectangle(x+CARD_WIDTH,y-5,5,CARD_HEIGHT)

    #draws the border of the card
    stddraw.setPenColor(stddraw.DARK_GRAY)
    draw_border_lines(x,y,CARD_WIDTH,CARD_HEIGHT)

def draw_available_airports(player,airport,wallet): #draws the text in the bottom left area of the GUI that show the available airports that the player can go to
    rect_border(0,0,500,250) #clears the bottom left area of the gui
    x = 50 #the coords of the first letter
    y = 180
    for i in range(0,10):#for each of the airports checks the following to determine the colour and then draws the letter of the airport
        if i == char_to_int(airport[0]) or i == char_to_int(airport[1]):#If either player is at the airport then the airport is unavailable to fly to and thus is grayed out
            stddraw.setPenColor(stddraw.GRAY)
        elif airport[player] == "Z":#if the player is not yet at an airport then they may fly to any airport(except where the opponent is)(Z is the default value for player airport)
            stddraw.setPenColor(stddraw.BLACK)
        elif wallet[player] >= costs[char_to_int(airport[player])][i]: #if the last checks failed then the player my fly to the airport if they can afford it
            stddraw.setPenColor(stddraw.BLACK)
        else: #otherwise the airport is grayed out
            stddraw.setPenColor(stddraw.GRAY)

        if i in range(5): #prints the top 5 letters
            stddraw.text(x + i * 100, y, str(int_to_char(i)))
        elif i in range(5,10): #prints the bottom 5 letters
            stddraw.text(x + (i - 5) * 100, y - 110, str(int_to_char(i)))

def draw_YN(): #draws the Yes/No text in the bottom left area of the gui
    rect_border(0,0,500,250)
    stddraw.text(125, 125, "(Y)es")
    stddraw.text(375, 122, "(N)o")

def do_countdown(): #does the termination countdown if the player terminates the game with a Q
    stddraw.setFontSize(50)

    for i in range(5): #draws the text for each of the 5 seconds of the countdown
        rect_border(0,0,500,250)
        stddraw.setPenColor(stddraw.RED)
        seconds = 5 - i
        stddraw.text(250, 175,"TERMINATING IN")
        stddraw.text(250, 100, str(seconds))
        stddraw.show(1000)

    sys.exit(0) #exits the programme
    
###############################################################################################
########################### replacement printing functions for gui ############################
###############################################################################################

def display_obstacle_disks(can_play_disk_array): #when the player selects to play in obstacle disk in graphics mode 1 then they are displayed using this function
    rect_border(0,0,500,250) #clears the bottom left of the GUI
    numPlayable = 0
    for canPlay in can_play_disk_array: #counts how many disks the player can play
        if canPlay:
            numPlayable += 1

    x = 500/(numPlayable + 1) #gets how many pixels apart the disks should be
    y = 125
    increment = 1 #increment is used to calculate where each disk should display
    arrColours = [stddraw.RED, stddraw.GREEN, stddraw.YELLOW, stddraw.CYAN, stddraw.BLACK, stddraw.MAGENTA]

    for i in range(6):  #prints the playable disk
        if can_play_disk_array[i]: #if the disk is black then the colours need to be different. There should be a white border and letter
            if i == 4:
                stddraw.setPenColor(stddraw.WHITE) 
                stddraw.filledCircle(x * (increment), y, OBSTACLE_DISK_RADIUS) #draws the border
                stddraw.setPenColor(arrColours[i])
                stddraw.filledCircle(x * (increment), y, OBSTACLE_DISK_RADIUS-1) #draws the disk
                stddraw.setPenColor(stddraw.WHITE)
                stddraw.text(x * (increment), y,OBSTACLE_DISK_STRINGS[i][0]) #draws the text on the disk
                increment += 1
            else:
                stddraw.setPenColor(stddraw.BLACK) #draws the border
                stddraw.filledCircle(x * (increment), y, OBSTACLE_DISK_RADIUS)
                stddraw.setPenColor(arrColours[i])  #draws the disk
                stddraw.filledCircle(x * increment, y, OBSTACLE_DISK_RADIUS-1)
                stddraw.setPenColor(stddraw.BLACK)#draws the text on the disk
                stddraw.text(x * (increment), y,OBSTACLE_DISK_STRINGS[i][0])
                increment += 1
            
def display_player_details(cur_player, cur_player_wallet, cur_round_number): #displays the players details in the top of the GUI
    rect_border(0,700,X_MAX,40) #clears the top
    stddraw.text(150,720,"Player " + str(cur_player + 1)) #draws the current player
    stddraw.text(500,720,"Round " + str(cur_round_number)) #draws the round number
    stddraw.text(850,720,"R" + str(round(cur_player_wallet,2))) #draws the player's wallet

def display_black_disk(suitcase_numbers_array, collected_array): #displays the suitcases at the players current airport if they have played the black disk
    rect_border(0,0,500,250) #clears the bottom left of the gui
    x = 20 #the coords of the bottome left of the first suitcase
    y = 50
    for i in range(4): #prints each of the 4 suitcases
        draw_card(x, y) #prints the card
        stddraw.text(x+ CARD_WIDTH/2, y + CARD_HEIGHT/2, str(suitcase_numbers_array[i])) #prints the number
        x += 120
    stddraw.show(LONG_PAUSE)
        
def display_single_suitcase_number(number): #prints a single suitcase when the player flips it
    rect_border(0,0,500,250) #clears the bottom left of the GUI
    draw_card(190,50) #draws the card
    stddraw.text(190+CARD_WIDTH/2,50+CARD_HEIGHT/2,str(number)) #draws the suitcase number
    stddraw.show(SHOW_DELTA)

def display_airport_suitcases(suitcase_numbers_array, collected_array, allowed_to_flip_array): #displays the suitcases at the player current airport when they are about to flip a suitcase
    rect_border(0,0,500,250) #clears the bottome left of the gui
    x = 20 #the coords of the bottom left of the first suitcase
    y = 50
    for i in range(4): #loops through the cases
        if allowed_to_flip_array[i]: #if the player may flip the suitcase (or it is collected) then displays the card
            draw_card(x, y) #draws the card

            stddraw.text(70 + i*120, 35, str(i + 1))

            if collected_array[i]:
                stddraw.text(x+ CARD_WIDTH/2, y + CARD_HEIGHT/2, str(suitcase_numbers_array[i])) #draws the number of the card
                #draws the lines on the collected suitcase:
                stddraw.line(x,y,x+40,y+60)
                stddraw.line(x + CARD_WIDTH,y,x + CARD_WIDTH-40,y+60)
                stddraw.line(x,y + CARD_HEIGHT,x + 40, y + CARD_HEIGHT - 60)
                stddraw.line(x + CARD_WIDTH,y + CARD_HEIGHT, x + CARD_WIDTH - 40, y + CARD_HEIGHT - 60)
            else:
                stddraw.picture(s3_image, x + CARD_WIDTH/2, y + CARD_HEIGHT/2) #if the suitcase is not collected the the suitcase image is printed on the card
        x += 120
                
def display_suitcase_grid(p1_last_suitecase, p2_last_suitecase): #updates the suitcase grid
    draw_grid(500,500,1000,700) #clears the grid
    draw_grid_text(550,650) #draws the number in the grid

    x = 500 #the coords of the bottom left of the first square of the grid
    y = 600
    #moves the x and y coords to the bottom left of the square corresponding to their last suitcase
    if p1_last_suitecase in range(1,6):
        x += (p1_last_suitecase - 1) * 100
    elif p1_last_suitecase in range(6,11):
        x += (p1_last_suitecase - 6) * 100
        y -= 100

    if p1_last_suitecase != 0: #pints the players suitcase images to show which case they last collected
        stddraw.picture(s1_image, x + 25, y + 75)
        stddraw.picture(s1_image, x + 75, y + 25)

    #does the same as above for player 2
    x = 500
    y = 600
    if p2_last_suitecase in range(1,6):
        x += (p2_last_suitecase - 1) * 100
    elif p2_last_suitecase in range(6,11):
        x += (p2_last_suitecase - 6) * 100
        y -= 100

    if p2_last_suitecase != 0:
        stddraw.picture(s2_image, x + 25, y + 25)
        stddraw.picture(s2_image, x + 75, y + 75)

def display_airport_grid(p1_airport_id, p2_airport_id, ): #displays the suitcase grid to show at which airport each player is
    draw_grid(0,500,500,700)
    draw_grid_text(50,650,"L")

    x = 0  #the coords of the bottom left of the first airports square
    y = 600
    #moves the coords to the bottom left of the players airport:
    if p1_airport_id in range(5):
        x += (p1_airport_id) * 100
    elif p1_airport_id in range(5,10):
        x += (p1_airport_id - 5) * 100
        y -= 100

    if p1_airport_id != 25: #prints the players plane images in the square
        stddraw.picture(p1_image, x + 25,y + 75)
        stddraw.picture(p1_image, x + 25,y + 25,)
        stddraw.picture(p1_image, x + 75,y + 75,)
        stddraw.picture(p1_image, x + 75,y + 25,)

    #does the same as above for player 2
    x = 0
    y = 600
    if p2_airport_id in range(5):
        x += (p2_airport_id) * 100
    elif p2_airport_id in range(5,10):
        x += (p2_airport_id - 5) * 100
        y -= 100
    

    if p2_airport_id != 25:
        stddraw.picture(p2_image, x + 25,y + 75)
        stddraw.picture(p2_image, x + 25,y + 25,)
        stddraw.picture(p2_image, x + 75,y + 75,)
        stddraw.picture(p2_image, x + 75,y + 25,)
        
###############################################################################################
##################################### The main function #######################################
###############################################################################################
# The following line is used to run the program.
# It basically says: "If this file is being run as a program, start here and call the function `runner()`."
# It should appear at the end of your program, after all of the functions have been defined.
# This ensures that all of your functions and variables are in scope when the program is run.
if __name__ == '__main__':
    runner()
