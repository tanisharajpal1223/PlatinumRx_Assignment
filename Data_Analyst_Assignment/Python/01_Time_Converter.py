def convertMinutes(minutes):
    hours = minutes // 60
    remainingTime = minutes % 60

    if hours == 1:
        return f"{hours} hr {remainingTime} minutes"
    else:
        return f"{hours} hrs {remainingTime} minutes"


print(convertMinutes(130))
print(convertMinutes(110))
# output: 2 hrs 10 minutes , 1 hr 50 minutes
