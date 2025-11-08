pub const Coordinate = struct {
    // This struct, as well as its fields and methods, needs to be implemented.
    x: f32,
    y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{
            .x = x_coord,
            .y = y_coord,
        };
    }
    pub fn score(self: Coordinate) usize {
        const rad_sq = self.x*self.x + self.y*self.y;

        if (rad_sq > 100) {
            return 0;
        } else if (rad_sq > 25) {
            return 1;
        } else if (rad_sq > 1) {
            return 5;
        } else {
            return 10;
        }
    }
};
