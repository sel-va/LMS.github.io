//This program demonstrates several key concepts of Java and OOP, including:

//Defining classes and objects
//Encapsulation (using private fields and public methods)
//Constructors
//Inheritance (not demonstrated in this example, but could be added by creating a subclass of Person)
//Polymorphism (using the sayHello method in different ways for different Person objects)
//Collections (using an ArrayList)


import java.util.ArrayList;

public class Person {
    // Define fields (instance variables)
    private String name;
    private int age;
    
    // Define constructor
    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
    // Define methods
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public int getAge() {
        return age;
    }
    
    public void setAge(int age) {
        this.age = age;
    }
    
    public void sayHello() {
        System.out.println("Hello, my name is " + name);
    }
    
    // Main method
    public static void main(String[] args) {
        // Create an ArrayList of Person objects
        ArrayList<Person> people = new ArrayList<>();
        
        // Create some Person objects and add them to the ArrayList
        Person person1 = new Person("Alice", 25);
        Person person2 = new Person("Bob", 30);
        people.add(person1);
        people.add(person2);
        
        // Loop through the ArrayList and call the sayHello method for each person
        for (Person person : people) {
            person.sayHello();
        }
    }
}
