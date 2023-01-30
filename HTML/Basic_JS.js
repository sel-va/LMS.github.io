basic JavaScript tutorial that covers several key topics:
============================================================

Variables: Learn how to declare variables in JavaScript and the different data types that are available.
===========
 
let age = 25; //declaring variable with let keyword
const name = "John"; //declaring variable with const keyword

//-----------------------------------------------------------------------------------------------------------------------

Control Flow: Learn how to control the flow of your program using if-else statements, loops, and ternary operators.
==============
 
let age = 25;
if(age > 21) {
    console.log("You are of legal age.");
} else {
    console.log("You are not of legal age.");
}

 
for(let i=0; i<5; i++) {
    console.log(i);
}

//-----------------------------------------------------------------------------------------------------------------------
Functions: Learn how to define and call functions in JavaScript.
===========
 
function printName(name) {
    console.log("Your name is: " + name);
}

//-----------------------------------------------------------------------------------------------------------------------
Objects: Learn how to create and manipulate objects in JavaScript.
=========
 
let person = {
    name: "John",
    age: 25,
    printInfo: function() {
        console.log(this.name + " is " + this.age + " years old.");
    }
};

//-----------------------------------------------------------------------------------------------------------------------
Arrays: Learn how to declare and use arrays in JavaScript.
========
 
let numbers = [1, 2, 3, 4, 5];
console.log(numbers[2]);

//-----------------------------------------------------------------------------------------------------------------------
DOM Manipulation: Learn how to manipulate the Document Object Model (DOM) to change the structure and content of a web page.
==================
 
let h1 = document.querySelector("h1");
h1.innerHTML = "Hello World!";

//-----------------------------------------------------------------------------------------------------------------------
Events: Learn how to handle events such as clicks and mouseovers in JavaScript.
=========
 
let button = document.querySelector("button");
button.addEventListener("click", function() {
    console.log("Button was clicked!");
});

//-----------------------------------------------------------------------------------------------------------------------

AJAX: Learn how to use Asynchronous JavaScript and XML (AJAX) to dynamically update web pages without refreshing the browser.
======
 
let xhr = new XMLHttpRequest();
xhr.open("GET", "data.json", true);
xhr.onload = function() {
    if(xhr.status === 200) {
let data = JSON.parse(xhr.responseText);
console.log(data);
}
}
xhr.send();
 
//-----------------------------------------------------------------------------------------------------------------------

JavaScript Libraries and Frameworks: Learn how to use popular JavaScript libraries and frameworks such as jQuery, AngularJS, ReactJS and VueJS.
=====================================

//jQuery example
$("button").click(function() {
console.log("Button was clicked!");
});

 

//-----------------------------------------------------------------------------------------------------------------------

ES6: Learn about the new features in ECMAScript 6 (ES6) such as arrow functions, template literals, destructuring and more.
=====

//Arrow function example
let numbers = [1, 2, 3, 4, 5];
numbers.forEach(number => console.log(number));
