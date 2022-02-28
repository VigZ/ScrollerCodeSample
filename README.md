# ScrollerCodeSample
This is a code sample from the Scroller Project and is a bit more emblematic of my production code and coding style.

## Introduction
This project is a sample and example of a project I have worked on and is only a small portion of a larger modular system.
Featured here are two components of the Core Module (Fundamental entities of the app's architecture) and a few components from the Remote Module.
I strive to the best of my ability to produce a clean and loosely coupled design, which I hope I have demonstrated here.

## Core Module Overview
The Core Module for this example consists of two components: The ScrollerFeedImage, which represents the an indivual image item that is drawn to the mobile device's screen, and the ScrollerFeedLoader protocol, which is a an interface specification and boundry for the module, that external modules will implement. This component is responsible for loading the feed, and handling the response with a callback.

## Remote Module Overview
The Remote Module consists of multiple components: the RemoteScrollerFeedLoader, which is a concrete implementation of the ScrollerFeedLoader protocol,
the ScrollerFeedMapper which is responsible for mapping the DTO RemoteScrollerFeedImage to the ScrollerFeedImages used by the Core Module, and the HTTPClient protocol, which is an interface for handling URL requests and returning a Result type.


## Dependency Diagram
A proper modular system generally attempts to minimize source code dependencies (usually direct imports), and while this example isn't TRULY free from source code depenency, as the project is a monolith, the production code is linked and packaged seperately. The seperation not only helps ease the of development between different teams, but also for myself - as I can be certain any changes I make in a module will only affect the current module. (This helps avoid terrible breaking changes propogating across the entire application.)

I typically will construct a Composition Root module, which composes every other module together, and this allows me to inject the dependencies through the system, passing only what is truly needed for each module. (Trying to keep those SOLID principles throughout!)

The above diagram illustrates the dependencies of each individual component with solid arrows pointing to a dependency and dotted arrows pointing to a concrete implementation of a protocol interface. I attempted to eliminate dependencies between modules provide a small surface area of contact, and such that all modules point towards the core data types of the application. (Note the URLSession concrete implemenation is not included in this example, but is included here in the diagram as an example of an HTTPClient implementation. This could easily be an external framework or whatever interpretation of Remote suits the business needs.)

## Testing
I also included some tests for the example, covering the loading from remote use case. Each test follows a Given-When-Then approach, given a criteria, when the system under test does something, then assert some value. As this project was for IOS, I am using the XCTestFramework, but have used similar such frameworks amongst different languages. To make the tests more readable, reasonable, and manageable to myself and fellow developers, I usually attempt to implement a kind of DSL to better articulate the intents for the tests. Swift actually lends itself to that very nicely, allowing for very descriptive and inituitive code. This both cleans up the testing methods, and allows me to remember exact intent of each behavioral test.

I will usually strive to have a healthy count of unit tests, testing the behavior of each function and flow within a module, as well as integration tests (though fewer in number) that test the integration of modules with one another. Testing each module indiviually is pretty cheap, but testing every integration together on every build can be very time intensive, so I usually seperate the test builds and run the smaller unit tests often, while the larger integration tests less often. Typically, on larger projects I will set up a continuous integration pipeline to handle automated testing of both unit and integration tests upon pushing code live.






