priorities = {}

value = 1
for i in range(ord('a'), ord('z')+1):
    priorities[chr(i)] = value
    value += 1

for i in range(ord('A'), ord('Z')+1):
    priorities[chr(i)] = value
    value += 1

with open('input.txt') as file:
    sum = 0
    lines = [i.strip() for i in file.readlines()]

    for i in range(0, len(lines), 3):
        parte1 = lines[i]
        parte2 = lines[i+1]
        parte3 = lines[i+2]
        for letra in parte1:
            if letra in parte2 and letra in parte3:
                sum += priorities[letra]
                break
                
    print(sum)