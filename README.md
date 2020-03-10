Group Project 
===

# Buddy Bill

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)

## Overview
### Description
Convenient way to split a bill among friends. 
Snap a picture of the receipt and tap the items to claim them. 
This iOS app will generate what each person will pay, including the tax and tip.


### App Evaluation
- **Category:** Social/ Finance
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on a computer. 
- **Story:** Allows user to take a picture of their receipt. Each person can select the items that they ordered, and multiple people can select the same item if they shared it. The tax and tip are divided proportionally.  
- **Market:** Anyone who needs group pay! 
- **Habit:** This app could be used as often as the individual has to split bills with a group.
- **Scope:** Large potential to become widely used like Venmo and traditional calculators!

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [ ] User can take a picture of the receipt
- [ ] User can select which items each person ordered
- [ ] The tab will be displayed with each person’s name and total.

**Optional Nice-to-have Stories**

- [ ] Venmo integration
- [ ] Profiles
- [ ] Past transactions
- [ ] Real time sync with different accounts 



### 2. Screen Archetypes

* Start Screen
    * Allows user to take picture of receipt or select from gallery
* Confirmation Screen
    * Asks user if these are the correct items and prices
* Count Screen
    * Asks user for names of friends
* Select Screen
    * Select which items each person ordered
* Results Screen
    * Displays name of each person and amount they need to pay
    * User can scan again


### 3. Navigation

**Tab Navigation** (Tab to Screen)

Optional:
* Back
* Profile

**Flow Navigation** (Screen to Screen)

* Start Screen
    * Scan Receipt Button -> Lens / Gallery -> Confirmation Screen
* Confirmation Screen
    * Yes Button -> Count Screen
    * No Button -> Start Screen
* Count Screen
    * Add More Button -> enter names bar
    * Done Button -> Select Screen
* Select Screen
    * Done -> Moves to next name of person
    * If all friends have selected (last person clicks done) -> Results Screen
* Results Screen
    * Scan Again Button -> Start Screen

## Wireframes

![wireframe1](https://user-images.githubusercontent.com/47064584/76282274-7cdf3800-6254-11ea-8625-6f292992719e.png)
![wireframe2](https://user-images.githubusercontent.com/47064584/76282276-7ea8fb80-6254-11ea-93b2-c4ad1bdc3b73.png)


