
# In All Media mini project

This project contains the test automation for a simple workflow involving google searching for 'in all media' page, 
navigating to it, and making sure 'InAllMedia' logo is displayed.  

The project consists of three layers:

* First layer is a feature written in Gherkin, which uses the:
* Second layer, step definitions written in ruby, which in turn use a:
* Third layer, a series of Page Objects that utilizes a:
* Fourth layer, a couple of util libs that interact with the objects themselves.
 
 I could've used Capybara for this fourth layer.  However, libraries were 
 already there and I'm not as familiar with Capybara as I'm with these libs.
 
 Also, the page object structure was already built, and can be found on [my 
 repo](https://github.com/jomarnavarro/ruby-poc).
 
## Prerequisites

  In order to run the automation framework:

 * First install required gems (They're quite a few)
 * Run cucumber command or use your favorite IDE.
 
## Run command

To run the test, use the following command:

```
cucumber
```