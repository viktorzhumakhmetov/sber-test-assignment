def distribute(n, k, distances):
    dct = {key: [value] for key, value in enumerate(distances)}
    
    for _ in range(k):
        max_distance = max(distances)
        max_distance_index = distances.index(max_distance)
        for key, value in dct.items():
            if max(value) == max_distance:
                divider = len(value) + 1
                avg = sum(value) / divider
                dct[key] = [avg] * divider
                distances[max_distance_index] = avg

    result = [round(item,1) for i in dct.values() for item in i]
    return result


n = 5
k = 3
distances = [100,30,20,80]

output = distribute(n, k, distances)
print(output)

