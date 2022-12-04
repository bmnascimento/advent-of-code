import strutils

const rock = "A"
const paper = "B"
const scissors = "C"

proc myPlayPoints(play: string): int =
    result = case play:
        # Rock
        of "X":
            1
        # Paper
        of "Y":
            2
        # Scissors
        of "Z":
            3
        else:
            0

proc pointsOutcome(opponent: string, me: string): int =
    # Rock
    if opponent == rock:
        # Rock
        if me == "X":
            result = 3
        # Paper
        if me == "Y":
            result = 6
        # Scissors
        if me == "Z":
            result = 0
    # Paper
    if opponent == paper:
        # Rock
        if me == "X":
            result = 0
        # Paper
        if me == "Y":
            result = 3
        # Scissors
        if me == "Z":
            result = 6
    # Scissors
    if opponent == scissors:
        # Rock
        if me == "X":
            result = 6
        # Paper
        if me == "Y":
            result = 0
        # Scissors
        if me == "Z":
            result = 3

let file = readFile("input.txt")
let lines = file.split('\n')
var totalScorePart1 = 0
for line in lines:
    let columns = line.split()
    totalScorePart1 += myPlayPoints(columns[1]) + pointsOutcome(columns[0], columns[1])
echo totalScorePart1

