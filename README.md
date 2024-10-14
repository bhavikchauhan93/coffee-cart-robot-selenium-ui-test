# Web automation testing project using [Robot framework](https://robotframework.org/) and [Selenium](https://www.selenium.dev/)


### Test site used for this project: [coffee-cart app](https://coffee-cart.app/).

#### Libraries used for testing
* [**BuiltIn**](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
    * Bundled with the framework
    * Provides a set of often needed generic keywords.
* [**SeleniumLibrary**](https://github.com/robotframework/SeleniumLibrary/)
    * Web testing library that uses popular Selenium tool internally.
* [**JSONLibrary**](https://robotframework-thailand.github.io/robotframework-jsonlibrary/JSONLibrary.html)
    * Robotframework testlibrary for manipulating JSON object (dictionary)
* [**Collections**](https://robotframework.org/robotframework/latest/libraries/Collections.html)
    * Bundled with the framework
    * Provides a set of keywords for handling Python lists and dictionaries.

## Instructions to install framework and libraries (on Linux)
Precondition: [Install Python](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#python-installation)

```
#Install and upgrade robotframework
pip install --upgrade robotframework

```

If Libraries are missing, install using pip
```
#Install robotframework-jsonlibrary
pip install -U robotframework-jsonlibrary
```

 If need to upgrade SeleniumLibrary
```
pip install --upgrade robotframework-seleniumlibrary
```

## How to run tests
On terminal, navigate to the project directory. Use the following command to run tests:
```
#Run all tests in Test folder
robot -d Results Tests/Test-coffee-cart.robot

#Run specific tests using tags
robot -i <tag-for-specific-test-cast> -d Results Tests/Test-coffee-cart.robot

Example:
robot -i discount -d Results Tests/Test-coffee-cart.robot

```

## Test result

![Test result screenshot](Test_result.png "Test result screenshot.")