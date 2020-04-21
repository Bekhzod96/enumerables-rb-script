# Enumerables methods

**In this project, I implement my own version of Ruby’s enumerable methods**

>Enumerable module that gets mixed into the Array and Hash classes (among others) and provides you with lots of handy iterator methods. To prove that there’s no magic to it, I rebuilt those methods.


Ruby makes this easy for you because any class or module can be added to without trouble.

>Here is list of methods and descriptions:
- each - Calls the given block once for each element in self, passing that element as a parameter. Returns the array itself.

- each_with_index -Calls block with two arguments, the item and its index, for each item in enum. Given arguments are passed through to each().

- select - Returns an array containing all elements of enum for which the given block returns a true value. The find_all and select methods are aliases. There is no performance benefit to either.

- all? - Passes each element of the collection to the given block. The method returns true if the block never returns false or nil. 

- any? - Passes each element of the collection to the given block. The method returns true if the block ever returns a value other than false or nil.

- none? - Passes each element of the collection to the given block. The method returns true if the block never returns true for all elements. 

- count  - Returns the number of items in enum through enumeration. If an argument is given, the number of items in enum that are equal to item are counted. 

- map - Returns a new array with the results of running block once for every element in enum.

- inject - Combines all elements of enum by applying a binary operation, specified by a block or a symbol that names a method or operator.The inject and reduce methods are aliases. There is no performance benefit to either. 


## Built With

- Ruby 2.6

## Getting start

In order to start with the project:

1. You need to have ruby environment installed. [Click here for instructions](https://www.ruby-lang.org/en/documentation/installation/)
2. Clone this repository `https://github.com/Bekhzod96/Enumerables.git`
3. Run the algorithm file
    - In a terminal window write `ruby `*`[your_file_path]`*`Enumerables.rb`

## Author

👤 **Bekhzod Akhrorov**

- Github:[@Bekhzod96](https://github.com/Bekhzod96)
- Twitter: [ @Begzod](https://twitter.com/25d47e8987f740b)
- Linkedin:[@Bekhzod AKhrorov](https://www.linkedin.com/in/bekhzod-akhrorov-b24232113/)



