// Functions

// Functions

func showMessage() { // Note that the name is in lowerCamelCase, and that parentheses are REQUIRED after the name of the function
    print("Function worked!")
}

showMessage()

// Passing through parameters
func printNumber(number: Int) { // This is the same as above, although I am feeding through a variable, of type Int, called number (again, naming is up to you)
    print("You passed in \(number)") // String interpolation to pull number from function
}

printNumber(number: 384)
// Note: unlike most languages, I can't just pass through through variable - I have to declare what variable I am passing through - called an argument label
// For example;
// printNumber(384) is INCORRECT, because I have not told swift what '384' is

// Passing through multiple parameters
func printScore(name: String, pos: Int, score: Int) { // Same as before, but with commas between the parameters
    print("Well done \(name)! You finished the round in \(pos) place, with a score of \(score)")
}

printScore(name: "Liam", pos: 39, score: 3848) // Same as before, but with commas between the parameters

// Another thing
// Passed in parameters ARE CONSTANTS BY DEFAULT
// Essentially, you want to either do the math before calling the function - if possible - or copying the value to a new function and editing it that way. There is another way - it will come later
// Example
func doSomeMath(number: Int) {
    var foo = number
    foo = foo + 39
    print(foo)
}

doSomeMath(number: 39)

// Returning values
func nuclearCodeGenerator(number: Int) -> Double { // The -> signifies that we are returning something here - after that I can return any type of variable/constant I want.
    let returnValue = Double(number) * 39482
    return returnValue
}

let returnValueFromFunction = nuclearCodeGenerator(number: 39) // This is where things change though. I can still call the function without passing a variable for it to return into
print(returnValueFromFunction)
nuclearCodeGenerator(number: 38) // This is still valid but not *really* correct.
print("This call does not have a return value as I never declared it, but I also did nothing with it")
// Because swift is essentially very angry at you all the time, and just wants you to tell it, excplicitly, what to do
_ = nuclearCodeGenerator(number: 34929) // Assigning it to _ means I know and understand that this returns something, but I don't care

// Ommitting arguments
// In the below, passing through string: "look this is a string" is a bit redundant - there is only one input, it's pretty obvious what it does
func showMessage(msg: String) {
    print("Printing \(msg)")
}

showMessage(msg: "look at this string")

func aBetterWayOfDoingTheAbove(_ msg: String) { // Note the _ before the msg. That means I can call it as I have on like 65
    print("Printing \(msg)")
}

aBetterWayOfDoingTheAbove("See look, its much cleaner!") // This only really makes sense when you have one or few arguments that are very obvious.

// Changing the name of the argument
func difference(between firstAmount: Int, and secondAmount: Int) -> Int { // First argument is the external argument, second one is internal
    if firstAmount > secondAmount {
        return firstAmount - secondAmount
    } else {
        return secondAmount - firstAmount
    }
}

let result = difference(between: 394, and: 39483939) // Can make external & Internal code much more readable
