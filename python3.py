def largest_number(str_list):
    sorted_ls = sorted(str_list, key=lambda x: x * 5, reverse=True)
    result = ''.join(sorted_ls)
    return result


input_list = ["41", "4", "005", "89"]
result = largest_number(input_list)
print(result)