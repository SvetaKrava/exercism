"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""

EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time

def elapsed_time_in_minutes(number_of_layers, time=EXPECTED_BAKE_TIME):
    """Calculate the total elapsed time in minutes.

    :param number_of_layers: int - number of layers added to the lasagna.
    :return: int - total time (in minutes) spent cooking the lasagna.

    This function takes the number of layers added to the lasagna as
    an argument and returns the total time spent cooking the lasagna,
    which is the sum of the preparation time and the baking time.
    """

    preparation_time = preparation_time_in_minutes(number_of_layers)
    total_time = preparation_time + time
    return total_time

def preparation_time_in_minutes(number_of_layers, time=PREPARATION_TIME):
    """Calculate the preparation time in minutes.

    :param number_of_layers: int - number of layers added to the lasagna.
    :return: int - total preparation time (in minutes).

    This function takes the number of layers added to the lasagna as
    an argument and returns the total preparation time.
    """

    return number_of_layers * time
