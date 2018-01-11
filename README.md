
# Google Flights mini project

This project contains the test automation for a simple workflow involving google flights reservations.

## Test plan

The minimal 10-minute test plan can be found in [this document](https://docs.google.com/document/d/15s3mgTSQd49G-BBNWtpkn9VIJ-sCDL3f68utw63p46k/edit?usp=sharing)

## Requirements

The small set of requirements can be found [here](https://docs.google.com/document/d/1SfEcTNoagvE2vwiGcilRR0D8IAUW5wrzMEV99-4JMrA/edit?usp=sharing)

## Scenario checklist

A small set of test cases for this mini project can be found in [this document](https://docs.google.com/spreadsheets/d/177fzaEM2rVa2VIYH9jwD69q0PfVeJzvg0vhjXZPukSI/edit?usp=sharing)

## Test automation framework

The project consists of four layers:

* First layer is a feature written in Gherkin, which uses the:
* Second layer, step definitions written in ruby, which in turn use a:
* Third layer, a series of Page Objects that utilizes a:
* Fourth layer, a couple of util libs that interact with the objects themselves.
 
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