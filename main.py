empty_list = []

user_choice = None
counter = 0

# Allow user to input numbers to the list
while True:
    try:
        number = int(input(f"\nEnter a number {counter + 1}: "))
        empty_list.append(number)
        counter += 1
    except ValueError:
        print("\nSorry, you have to input an interger.")

    user_choice = input("Do you wish to continue(Type 'Y' for yes. Any other input means no.)? ")
    if user_choice.lower() != "y":
        break

element_sum = sum(empty_list)

print(f"\nThe sum of the entered numbers is {element_sum}.")
