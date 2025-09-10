let rec sum x =
    if x <= 0 then
        0
    else
        x + sum (x-1)

let square_of_sum x = 
    sum x * sum x

let rec sum_of_squares x =
    if x <= 0 then
        0
    else
        x*x + sum_of_squares (x-1)

let difference_of_squares x =
    square_of_sum x - sum_of_squares x
