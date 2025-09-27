"""Solution to Ellen's Alien Game exercise."""


class Alien:
    """Create an Alien object with location x_coordinate and y_coordinate.

    Attributes
    ----------
    (class)total_aliens_created: int
    x_coordinate: int - Position on the x-axis.
    y_coordinate: int - Position on the y-axis.
    health: int - Number of health points.

    Methods
    -------
    hit(): Decrement Alien health by one point.
    is_alive(): Return a boolean for if Alien is alive (if health is > 0).
    teleport(new_x_coordinate, new_y_coordinate): Move Alien object to new coordinates.
    collision_detection(other): Implementation TBD.
    """

    total_aliens_created: int = 0
    x_coordinate: int
    y_coordinate: int
    health: int

    def __init__(self, x: int = 0, y: int = 0, health: int = 3):
        Alien.total_aliens_created += 1
        self.x_coordinate = x
        self.y_coordinate = y
        self.health = health

    def hit(self):
        self.health -= 1

    def is_alive(self):
        return self.health > 0

    def teleport(self, new_x_coordinate: int, new_y_coordinate: int):
        self.x_coordinate = new_x_coordinate
        self.y_coordinate = new_y_coordinate

    def collision_detection(self, other):
        pass


def new_aliens_collection(start_positions: tuple[int, int]):
    aliens: list[Alien] = []
    for pos in start_positions:
        aliens.append(Alien(pos[0], pos[1]))

    return aliens
