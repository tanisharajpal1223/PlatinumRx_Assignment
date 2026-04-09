def removeDuplicates(s):
    freq = {}
    Unique_str = ""

    for char in s:
        if char not in freq:
            freq[char] = 1
            Unique_str += char
        else:
            freq[char] += 1

    return Unique_str


print(removeDuplicates("programming"))

# output: progamin
