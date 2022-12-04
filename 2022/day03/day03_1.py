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
    for line in file:
        parte1 = line[0:len(line)//2]
        parte2 = line[len(line)//2:-1]
        for letra in parte1:
            if letra in parte2:
                sum += priorities[letra]
                break
    print(sum)