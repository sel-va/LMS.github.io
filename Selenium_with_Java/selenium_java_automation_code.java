Selenium shortcut
==================
	System.out.println(" "); → Type 'Sysout' and ‘Syso’ then press ctrl + space
	To align → Ctrl+Shift+F
	Class name - 1st letter is caps all other small (Camel case)
	Variable name always start with small letter
	But second word 1st letter is caps Eg: mousePad, totalSumValue, 
	Right click code line → watch (to know how it gives o/p, there edit ccode)
	Headless mode → execute w/o open browser → faster results

//---------------------------------------------------------------------------------------------------------	

Install Java & Selenium -Get Started with basic Steps of the Selenium WebDriver
===============================================================================
	Download JDK file and install → copy JDK path
	To know system java path →  set system variables
	— control panel → adv system setting → envir variable → new → paste path → ok

	Download Eclipse for java developer with maven integration
	file new java project → Don't create module

	→ Maven repository (all java projects) to give selenium knowledge
	→ search selenium java → copy dependency code

	click → new - configure- covert to maven project
	group id → company name
	artifact id → project name
	pom.xml → within create - <dependencies> (plural - within paste multiple dependency) and paste that maven selenium dependency code

	lly paste TEST-NG dependency

	src folder - new - class - name - select public static void main - finish

	<hr>

	Class is the basic unit of OOP (or) group of objects, consists llr type of variables(properties) and methods(actions).

	static or public attributes
	--static method accessed without creating an object of the class 
	--public only be accessed by objects

	Invoking browser using driver (chromedriver.exe)

	Chromedriver driver = new Chromedriver(); (use only 4r chrome automation)
	Class object = memory_allocation Class();

	Webdriver driver = new Chromedriver(); (use 4r all browser automation)
	Interface object = memory_allocation Class(); 

	Interface is group of related methods with empty bodies
	WebDriver interface from ChromeDriver/FirefoxDriver/safariDriver class.

	Class(chromedriver) = WebDriver(interface) methods + personal methods
//-------------------------------------------------------------------------------------------------------------------

	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.chrome.ChromeDriver;
	import org.openqa.selenium.edge.EdgeDriver;
	import org.openqa.selenium.firefox.FirefoxDriver;

	public class SelIntroduction 
	{
		public static void main(String[] args) {

			//Invoking Browser
			//Chrome
			System.setProperty("webdriver.chrome.driver", "/Users/rahulshetty/Documents/chromedriver");
			WebDriver driver = new ChromeDriver();

			//Firefox
			System.setProperty("webdriver.gecko.driver", "/Users/rahulshetty/Documents/geckodriver");
			WebDriver driver1 = new FirefoxDriver();

			//Microsoft Edge
			System.setProperty("webdriver.edge.driver", "/Users/rahulshetty/Documents/msedgedriver");
			WebDriver driver2 = new EdgeDriver();

			driver.get("https://rahulshettyacademy.com");
			System.out.println(driver.getTitle());
			System.out.println(driver.getCurrentUrl());
			driver.close();
			//driver.quit();

		}
	}

//-----------------------------------------------------------------------------------------------------------------

Java Concepts for Selenium Automation
=====================================
	Variables & Data types in Java
	Working with Arrays
	Loops 	& Conditions
	Strings and its functions
	Importance of Array Lists 	
	Array list operations and conversion of Array to List
	Declaring Methods 	
	Accessing Methods in class & Static keyword


public class CoreJavaBrushUp1 {

	public static void main(String[] args) {
		
		// TODO Auto-generated method stub
		
		int myNum = 5; 
		String website = "Rahul Shetty Academy";   //Data_types, class is also datatype
		char letter = 'r';
		double dec = 5.99;
		boolean myCard = true;

		System.out.println(myNum+"is the value stored in the myNum variable");
		System.out.println(website);

		//Arrays
		int[] arr = new int[5];  // [ ] Denotes array, declared & allocated memory
		arr[0] = 1;                  //use when value get/extract from web browser
		arr[1] = 2;   //assign values by index
		arr[2]= 4;
		arr[3]= 5;
		arr[4]= 6;

		int[] arr2 = {1,2,4,5,6};  //declare & assign values   //use when already know value

		System.out.println(arr2[0]);

		//For loop arr.length - 5
		for(int i = 0; i< arr.length; i++) //4
		{
			System.out.println(arr[i]);
			break;    //stop in 1st loop when its execute
		}

		//String array
		String[] name = {"rahul", "shetty", "selenium"};

		for(int i =0; i<name.length;i++)
		{
		  System.out.println(name[i]);
		}

		for( String s: name)        //Enhanced for_loop, lly condition works like for_loop
		{
		   System.out.println(s);
		}

		//class object = memory_allocate class();
		ArrayList<String> a = new ArrayList<String>();       //Arraylist lly like OOPS
		a.add(“ ”);
		a.add(“ ”); 
		a.add(“ ”);
		a.remove(2);
		System.out.println(a.get(1));

		}
  }

//-------------------------------------------------------------------------------------------------------------

public class CoreJavaBrushUp3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//string is an object in java that rep sequence of characters

		// String s1 = "Rahul Shetty Academy";  //String literal (same memory allocation)
		String s5 = "hello";

		//new
		String s2 = new String("Welcome");     //New memory allocate
		String s3 = new String("Welcome");

		String s = "Rahul Shetty Academy";
		String[] splittedString = s.split("Shetty");        //splittedString 
		System.out.println(splittedString[0]);
		System.out.println(splittedString[1]);
		System.out.println(splittedString[1].trim());     //trim remove white space 


		for(int i =s.length()-1;i>=0;i--)                  //print in reverse order
		{
			System.out.println(s.charAt(i));               //string is collection of characters 
		}
	}
}

//************************************Methods Code *****************************************
//To reuse code again and again 
//create methods and make a block(class)

public class MethodsDemo {
	public static void main(String[] args) {                       //Execution Block (don't declare methods)

		MethodsDemo d = new MethodsDemo();
		String name = d.getData();
		System.out.println(name);

		MethodsDemo2 d1 = new MethodsDemo2();          //access from outside class
		d1.getUserData();

		getData2();                 //execute w/o object bcoz static (access inside class)

	}         //Access_modifiers  Datatype  Method_name()
	public String getData()                                               //Outside Execution Block (Declare Methods)
	{
		System.out.println ("hello world");
		return "rahul shetty";
	}
	public static String getData2()
	{
		System.out.println ("hello world");
		return "rahul shetty";
	}
	
}
//----------------------------------------------------------------------------------------------------------------------

//Locator Techniques & Tools used to identify Objects
=======================================================

	ID
	Xpath
	CSS Selector
	name
	Class Name
	Tag Name
	Link Text
	Partial Link Text

	<input type="text" placeholder="Username" id= “inputUsername” value=" ">

	Input -> tag name
	Red-> attribute
	Green-> attribute associated value.

//--------------------------------------------------------------------------------------

//All locators in one program
===============================

import java.time.Duration;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class Locators {
	public static void main(String[] args) throws InterruptedException {

	System.setProperty("webdriver.chrome.driver", "/Users/rahulshetty/Documents/chromedriver");

	WebDriver driver = new ChromeDriver();

	driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));   //implicit wait - define after driver - import^

	driver.get("https://rahulshettyacademy.com/locatorspractice/");

	driver.findElement(By.id("inputUsername")).sendKeys("rahul");

	driver.findElement(By.name("inputPassword")).sendKeys("hello123");

	driver.findElement(By.className("signInBtn")).click();

	System.out.println(driver.findElement(By.cssSelector("p.error")).getText());

	driver.findElement(By.linkText("Forgot your password?")).click();                   //LinkText

	Thread.sleep(1000);

	driver.findElement(By.xpath("//input[@placeholder='Name']")).sendKeys("John");

	driver.findElement(By.cssSelector("input[placeholder='Email']")).sendKeys("john@rsa.com");

	driver.findElement(By.xpath("//input[@type='text'][2]")).clear();

	driver.findElement(By.cssSelector("input[type='text']:nth-child(3)")).sendKeys("john@gmail.com");

	driver.findElement(By.xpath("//form/input[3]")).sendKeys("9864353253");

	driver.findElement(By.cssSelector(".reset-pwd-btn")).click();                          //without Tagname

	System.out.println(driver.findElement(By.cssSelector("form p")).getText());      //parent to child in Css    

	driver.findElement(By.xpath("//div[@class='forgot-pwd-btn-conainer']/button[1]")).click();  //all combin Example

	Thread.sleep(1000);           //1sec wait to avoid interception error at page transition state

	driver.findElement(By.cssSelector("#inputUsername")).sendKeys("rahul");      //Css only using id

	driver.findElement(By.cssSelector("input[type*='pass']")).sendKeys("rahulshettyacademy");  //find by partial text

	driver.findElement(By.id("chkboxOne")).click();

	driver.findElement(By.xpath("//button[contains(@class,'submit')]")).click();   // partial text by Regular expresstion

	}
}


//---------------------------------------------------------------------------------------------------------------------------

Tools - SelectorHub (or) Cropath
=================================
To Test Manually
	Inspect → console → (for css) → $(‘CssSelector’)
	Inspect → console → (for xpath) → $x(‘xpath’)

Css Selector
============
	Class name →  tagname.classname → Button.signInBtn  -> .error
	Id →  tagname#id -> input#inputUsername
	Tagname[attribute=’value’]     //no class and id
	Eg: <input type="text" placeholder="Username” value=" ">
	Input [placeholder=’ Username’]
	Parent to Child
	//Tagname[@attribute=’value’]:nth-child(index). 	- Child items
	Parenttagname childtagname
	input[type*='pass']      //find using partial text of password with help of *
	tagname                       //Only using tagname 


Xpath 
======
	//Tagname[@attribute=’value’]

	Eg: <input type="text" placeholder="Name">
	//input[@placeholder=’ Name’]

Parent to Child
================
	//Tagname[@attribute=’value’][index]
	//parentTagname/childTagname
	//button[contains(@class,'submit')]. 	 //find using partial text using Regular expression 	
	//tagname
	//header/div/button[1]/following-sibling::button[1]  	 //travel b/w near tags
	//header/div/button[1]/parent::div                     //travel from child to parent
	
//---------------------------------------------------------------------------------------------

//program to click forget pwd → get and trim that pwd → use that new password
import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.testng.Assert;

public class Locators2 {

	public static void main(String[] args) throws InterruptedException {

		String name = "rahul";
		System.setProperty("webdriver.chrome.driver", "/Users/rahulshetty/Documents/chromedriver");
		WebDriver driver = new ChromeDriver();

		// System.setProperty("webdriver.edge.driver", "/Users/rahulshetty/Documents/msedgedriver");
		// WebDriver driver = new EdgeDriver();

		driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
		String password = getPassword(driver);
		driver.get("https://rahulshettyacademy.com/locatorspractice/");
		driver.findElement(By.id("inputUsername")).sendKeys(name);
		driver.findElement(By.name("inputPassword")).sendKeys(password);
		driver.findElement(By.className("signInBtn")).click();
		Thread.sleep(2000);
		System.out.println(driver.findElement(By.tagName("p")).getText());
		Assert.assertEquals(driver.findElement(By.tagName("p")).getText(), "You are successfully logged in.");  //testNG
		Assert.assertEquals(driver.findElement(By.cssSelector("div[class='login-container'] h2")).getText(),"Hello "+name+",");
		driver.findElement(By.xpath("//*[text()='Log Out']")).click();     //find using only name via xpath
		driver.close();

		}

	public static String getPassword(WebDriver driver) throws InterruptedException
	{
		driver.get("https://rahulshettyacademy.com/locatorspractice/");
		driver.findElement(By.linkText("Forgot your password?")).click();
		Thread.sleep(1000);
		driver.findElement(By.cssSelector(".reset-pwd-btn")).click();
		String passwordText =driver.findElement(By.cssSelector("form p")).getText();
		String[] passwordArray = passwordText.split(" ' ");                  //Please use 'rahulshettyacademy' to Login.
		// String[] passwordArray2 = passwordArray[1].split("'");         //became.... [0]’[1]........
		// passwordArray2[0]
		String password = passwordArray[1].split("'")[0];        //Again backside split [1] and save [0] as password
		return password;
	}
}

//-------------------------------------------------------------------------------------------------------------

// Advanced Locators Identification & Interview Que on Parsing Text

	Absolute Xpath (long, from top) → /html/body/header/h1[0]
	Relative xpath (short,direct) → //header/h1[0]
	
//child to parent & parent to child & siblings
	import org.openqa.selenium.By;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.chrome.ChromeDriver;

	public class Locators3 {
		public static void main(String[] args) 
		{
			System.setProperty("webdriver.chrome.driver", "/Users/rahulshetty/Documents/chromedriver");
			WebDriver driver = new ChromeDriver();
			// Sibling - Child to parent traverse
			//header/div/button[1]/following-sibling::button[1]
			driver.get("https://rahulshettyacademy.com/AutomationPractice/");
			System.out.println(driver.findElement(By.xpath("//header/div/button[1]/following-sibling::button[1]")).getText());
			System.out.println(driver.findElement(By.xpath("//header/div/button[1]/parent::div/button[2]")).getText());
		}
	}

******************************************************************************************************************

	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.chrome.ChromeDriver;

	public class WindowActivities {
		public static void main(String[] args) 
		{

		System.setProperty("webdriver.chrome.driver", "/Users/rahulshetty/Documents/chromedriver");
		WebDriver driver = new ChromeDriver();
		driver.manage().window().maximize();    //To maximise screen
		driver.get("http://google.com");              //get command wait until page fully loaded
		driver.navigate().to("https://rahulshettyacademy.com");   //navigate cmd not wait until page load
		driver.navigate().back();
		driver.navigate().forward();

		}
	}

