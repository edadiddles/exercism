// Please implement the `ComputationError.IllegalArgument` error.
pub const ComputationError = error {
    IllegalArgument,
};

pub fn steps(number: usize) anyerror!usize {
    if (number == 0) {
        return ComputationError.IllegalArgument;
    }

    var num_steps: usize = 0;
    var n = number;
    while (n != 1) {
        num_steps += 1;
        if (n % 2 == 0) {
            n /= 2;
        } else {
            n *= 3;
            n += 1;
        }
    }

    return num_steps;
}
