      STUDENT ACTIVITY SCORE SYSTEM

def calculate_average(activity1, activity2, activity3):
    return (activity1 + activity2 + activity3) / 3


def get_status(average):
    if average >= 90:
        return "Excellent"
    elif average >= 80:
        return "Very Good"
    elif average >= 75:
        return "Passed"
    else:
        return "Failed"


students = int(input("How many students will be processed? "))

while students < 3:
    print("Please enter at least 3 students.")
    students = int(input("How many students? "))

for student_number in range(1, students + 1):
    print("\nStudent", student_number)

    name = input("Enter student name: ")
    activity1 = float(input("Activity 1: "))
    activity2 = float(input("Activity 2: "))
    activity3 = float(input("Activity 3: "))

    average = calculate_average(activity1, activity2, activity3)
    status = get_status(average)

    print("\nName:", name)
    print("Activity 1:", activity1)
    print("Activity 2:", activity2)
    print("Activity 3:", activity3)
    print("Average:", round(average, 2))
    print("Status:", status)