# Write a function that accepts two square matrices (N x N two dimensional arrays), and return the sum of the two.

# |1 2 3|     |2 2 1|     |1+2 2+2 3+1|     |3 4 4|
# |3 2 1|  +  |3 2 3|  =  |3+3 2+2 1+3|  =  |6 4 4|
# |1 1 1|     |1 1 3|     |1+1 1+1 1+3|     |2 2 4|


def matrix_addition(a, b):
    rs = []
    for i in range(len(a)):
        rs.append([])
        for j in range(len(b)):
            rs[i].append(a[i][j] + b[i][j])

    return rs