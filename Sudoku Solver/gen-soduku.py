from z3 import *
from pprint import pprint

sudoku_board = []

for i in range(9):  #generate 9x9 sudoku board
    row = [BitVec(f'x{i if i != 0 else ""}{j}', 6) for j in range(1, 10)]
    sudoku_board.append(row)

s = Solver()

for row_num in range(9): # add row condition
    row = [sudoku_board[row_num][col_num] for col_num in range(9)]
    s.add(sum(row) == 45)

for col_num in range(9): # add column condition
    column = [sudoku_board[row_num][col_num] for row_num in range(9)]
    s.add(sum(column) == 45)
    
for row_num in range(9): # add condition that each element should be from 1 to 9
    for col_num in range(9):
        s.add(
            And(
                    sudoku_board[row_num][col_num] > 0,
                    sudoku_board[row_num][col_num] < 10
                )
        )

for row_num in range(9): # add condition that no element in row should be same
    row = [sudoku_board[row_num][col_num] for col_num in range(9)]
    s.add(Distinct(row))
    # for i in range(9):
        # for j in range(i, 9):
            # if i == j:
                # continue
            # s.add(row[i] != row[j])


for col_num in range(9): # add condition that no element in column should be same
    column = [sudoku_board[row_num][col_num] for row_num in range(9)]
    s.add(Distinct(column))
    # for i in range(9):
        # for j in range(i, 9):
            # if i == j:
                # continue
            # s.add(column[i] != column[j])

for block_row in range(3): # add condition that no element should repeat in 3*3 block. Generated by chatgpt.
    for block_col in range(3):
        block_values = [sudoku_board[row_num][col_num] for row_num in range(block_row * 3, (block_row + 1) * 3) for col_num in range(block_col * 3, (block_col + 1) * 3)]
        s.add(Distinct(block_values))


if s.check() == sat:
    print(f"Solution Found")
    model = s.model()
    for i in range(9):
        row_values = [model[sudoku_board[i][j]].as_long() for j in range(9)]
        print(row_values)