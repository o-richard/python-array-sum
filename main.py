num_list = []
max_elements = None

while not max_elements:
    try:
        max_elements = int(input("Enter the maximum number of elements to add to the list: "))
    except ValueError:
        print("Please enter a valid integer.")

for i in range(max_elements):
    while True:
        try:
            number = int(input(f"\nEnter a number {i + 1}: "))
            num_list.append(number)
            break
        except ValueError:
            print("\nSorry, you have to input an integer.")

element_sum = sum(num_list)

print(f"\nThe sum of the entered numbers is {element_sum}.")
