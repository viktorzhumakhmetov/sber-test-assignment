import re
    
def to_good_number(input_str):
    cleaned_str = re.sub(r'[^0-9\\]', '', input_str)
    pattern = r'(\d{2,4})\\(\d{2,5})'

    def get_special(match):
        first_number = match.group(1).zfill(4)  
        second_number = match.group(2).zfill(5)
        return f'{first_number}\\{second_number}'

    result = re.sub(pattern, get_special, cleaned_str)
    return result


input_str = "Адрес 5467\\456. Номер"
output = to_good_number(input_str)
print(output)