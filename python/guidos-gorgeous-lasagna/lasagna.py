"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""


EXPECTED_BAKE_TIME=40

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    
    return EXPECTED_BAKE_TIME-elapsed_bake_time


def preparation_time_in_minutes(number_of_layers):
    """Calculate the preparation time

    :param number_of_layers: int - number of layers that the lasagna will be made from
    :return: int - amount of time it will take to prepare the lasagna

    Function that takes the number of layers in the lasagna and computes the time it will take to 
    assemble the lasagna
    """
    
    return number_of_layers*2


def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the time elapsed since starting

    :param number_of_layers: int - number of layers that the lasagna will be made from
    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - amount of time that has elapsed since starting to prep the lasagna

    Funtion that takes the number of layers and elapse bake time and computes the total number of 
    minutes that have elapsed since starting.
    """
    prep_time = preparation_time_in_minutes(number_of_layers)
    time_remaining = bake_time_remaining(elapsed_bake_time)
    if time_remaining <= 0:
        return prep_time+EXPECTED_BAKE_TIME

    return prep_time + elapsed_bake_time

