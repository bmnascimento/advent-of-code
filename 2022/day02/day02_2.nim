import strutils

const rock = "A"
const paper = "B"
const scissors = "C"

proc myPlayPoints(play: string): int =
    result = case play:
        # Rock
        of rock:
            1
        # Paper
        of paper:
            2
        # Scissors
        of scissors:
            3
        else:
            0

proc pointsOutcome(opponent: string, me: string): int =
    # Rock
    if opponent == rock:
        # Rock
        if me == rock:
            result = 3
        # Paper
        if me == paper:
            result = 6
        # Scissors
        if me == scissors:
            result = 0
    # Paper
    if opponent == paper:
        # Rock
        if me == rock:
            result = 0
        # Paper
        if me == paper:
            result = 3
        # Scissors
        if me == scissors:
            result = 6
    # Scissors
    if opponent == scissors:
        # Rock
        if me == rock:
            result = 6
        # Paper
        if me == paper:
            result = 0
        # Scissors
        if me == scissors:
            result = 3

proc whatShape(opponent: string, me: string): string =
    # Rock
    if opponent == rock:
        # Lose
        if me == "X":
            result = scissors
        # Draw
        if me == "Y":
            result = rock
        # Win
        if me == "Z":
            result = paper
    # Paper
    if opponent == paper:
        # Lose
        if me == "X":
            result = rock
        # Draw
        if me == "Y":
            result = paper
        # Win
        if me == "Z":
            result = scissors
    # Scissors
    if opponent == scissors:
        # Lose
        if me == "X":
            result = paper
        # Draw
        if me == "Y":
            result = scissors
        # Win
        if me == "Z":
            result = rock

let file = readFile("input.txt")
let lines = file.split('\n')
var totalScorePart2 = 0
for line in lines:
    let columns = line.split()
    let opponentShape = columns[0]
    let myShape = whatShape(opponentShape, columns[1])
    totalScorePart2 += myPlayPoints(myShape) + pointsOutcome(opponentShape, myShape)
echo totalScorePart2

