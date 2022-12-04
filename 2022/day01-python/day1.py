with open('DAY1INPUT.txt') as file:
    gnomes = file.read().split('\n\n')
    calories = []
    for gnome in gnomes:
        foods = filter(None, gnome.split('\n'))
        calories.append(sum([int(i) for i in foods]))
    print(max(calories))
