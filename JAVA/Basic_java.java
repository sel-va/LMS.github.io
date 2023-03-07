//This program:

//Prints a welcome message to the console
//Declares a variable x and assigns it the value 5
//Prints the value of x to the console
//Uses a conditional statement (if, else if, else) to check if x is positive, negative, or zero
//Uses a loop (for) to print the value of i for each iteration
//Uses a Scanner to read a number from the user
//Calls a method add to calculate the sum of x and the user's input y, and prints the result to the console.



import java.util.Scanner;

public class JavaTutorial {

    public static void main(String[] args) {
        // Print a message to the console
        System.out.println("Welcome to the Java Tutorial!");
        
        // Declare a variable and assign a value
        int x = 5;
        
        // Print the value of the variable
        System.out.println("The value of x is " + x);
        
        // Use a conditional statement
        if (x > 0) {
            System.out.println("x is positive");
        } else if (x < 0) {
            System.out.println("x is negative");
        } else {
            System.out.println("x is zero");
        }
        
        // Use a loop
        for (int i = 0; i < x; i++) {
            System.out.println("i is " + i);
        }
        
        // Use a Scanner to read user input
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int y = scanner.nextInt();
        System.out.println("You entered " + y);
        
        // Use a method
        int sum = add(x, y);
        System.out.println("The sum of x and y is " + sum);
    }
    
    // Define a method
    public static int add(int a, int b) {
        return a + b;
    }

}
