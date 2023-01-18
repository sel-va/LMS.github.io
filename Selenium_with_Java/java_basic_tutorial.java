//Basic Java tutorial that covers several key topics:

//Variables: Learn how to declare variables in Java and the different data types that are available.

int age = 25; //declaring variable with int data type
String name = "John"; //declaring variable with String data type

//-----------------------------------------------------------------------------------------------------------------------
//Control Flow: Learn how to control the flow of your program using if-else statements, loops, and switch statements.

int age = 25;
if(age > 21) {
    System.out.println("You are of legal age.");
} else {
    System.out.println("You are not of legal age.");
}
//------------------------------------------------------

for(int i=0; i<5; i++) {
    System.out.println(i);
}


//-----------------------------------------------------------------------------------------------------------------------

Methods: Learn how to define and call methods in Java.

public static void printName(String name) {
    System.out.println("Your name is: " + name);
}

//-----------------------------------------------------------------------------------------------------------------------

Classes and Objects: Learn how to define and create classes and objects in Java.

class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getAge() {
        return age;
    }
}

//-----------------------------------------------------------------------------------------------------------------------

Arrays: Learn how to declare and use arrays in Java.

int[] numbers = new int[5];
numbers[0] = 1;
numbers[1] = 2;
numbers[2] = 3;
numbers[3] = 4;
numbers[4] = 5;

//-----------------------------------------------------------------------------------------------------------------------

Exception Handling: Learn how to handle exceptions in Java using try-catch blocks.

try {
    int result = 5 / 0;
    System.out.println(result);
} catch (ArithmeticException e) {
    System.out.println("Error: Cannot divide by zero");
}

//-----------------------------------------------------------------------------------------------------------------------

Input and Output: Learn how to read and write data in Java using input and output streams.

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class WriteToFile {
    public static void main(String[] args) {
        try {
            File file = new File("example.txt");
            FileWriter writer = new FileWriter(file);
            writer.write("Hello World!");
            writer.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}

//-----------------------------------------------------------------------------------------------------------------------

Collections: Learn about the different collection classes in Java such as ArrayList, LinkedList, HashMap and HashSet.

import java.util.ArrayList;

public class ArrayListExample {
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<String>();
        list.add("Apple");
        list.add("Banana");
        list.add("Cherry");
        System.out.println(list);
    }
}

//-----------------------------------------------------------------------------------------------------------------------
