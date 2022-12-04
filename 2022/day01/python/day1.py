with open('DAY1INPUT.txt') as file:
    elves = file.read().split('\n\n')
    calories = []
    for elf in elves:
        foods = filter(None, elf.split('\n'))
        calories.append(sum([int(i) for i in foods]))
    calories.sort()
    print("Maior", calories[-1])
    print("Soma", calories[-1] + calories[-2] + calories[-3])
