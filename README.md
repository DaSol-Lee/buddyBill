# Buddy Bill
Created by Da Sol Lee & Greta Yu

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Networking] (#Networking)

## Overview
### Description
Buddy Bill provides a convenient way to split a bill among friends. 
Snap a picture of the receipt and tap your items to claim them. 
This iOS app will generate what each person will pay, including the tax and tip.

### App Evaluation
- **Category:** Social/Finance
- **Mobile:** This app is developed for mobile devices but would be just as viable on a computer. 
- **Story:** Users take a picture of their receipt. Each person can select the items that they ordered, and multiple people can select the same item if they shared it. The tax and tip are divided proportionally. A new 'bill' is generated indicating what each person will pay.
- **Market:** Anyone who needs to split the bill! 
- **Habit:** App usage depends on how often a user needs to split bills with others.
- **Scope:** Large potential to become widely used like Venmo and traditional calculators!

## Product Spec
### 1. User Stories (Required and Optional)
**Required Must-have Stories**
- [ ] User can take a picture of the receipt and generate the list of items
- [ ] User can set tax and tip
- [ ] User can enter names of people who are splitting the bill
- [ ] User can select which items each person ordered
- [ ] The bill will be displayed with each person’s name and total.

**Optional Nice-to-have Stories**
- [ ] Venmo integration
- [ ] Saved user profiles
- [ ] History of past transactions

### 2. Screen Archetypes
* Start Screen
    * Allows user to take picture of receipt or select from gallery
* Confirmation Screen
    * Asks user if these are the correct items and prices, if not the user can make changes
    * User can optionally add tax and tip
* Buddy Addition Screen
    * Asks user for names of friends
* Selection Screen
    * Select which items each person ordered
* Results Screen
    * Displays name of each person and amount they need to pay
    * User can process another receipt

### 3. Navigation
**Tab Navigation** (Tab to Screen)
* Receipt Processing (optional)
* User Profile (optional)

**Flow Navigation** (Screen to Screen)
* Start Screen
    * Scan Receipt Button -> Lens / Gallery -> Confirmation Screen
* Confirmation Screen
    * (optional) Scan Again Button -> Lens / Gallery -> Confirmation Screen
    * Looks Good Button -> Buddy Addition Screen
* Buddy Addition Screen
    * Add a Buddy Button -> Enter Names Bar
    * Done Button -> Selection Screen
* Selection Screen
    * Done -> Moves to next person
    * If all friends have selected (last person clicks done) -> Results Screen
* Results Screen
    * Scan Again Button -> Start Screen

## Wireframes
![wireframe1](https://user-images.githubusercontent.com/47064584/76282274-7cdf3800-6254-11ea-8625-6f292992719e.png)
![wireframe2](https://user-images.githubusercontent.com/47064584/76282276-7ea8fb80-6254-11ea-93b2-c4ad1bdc3b73.png)

## Networking
### APIs
Google Cloud Vision API, specifically Optimal Character Recognition (OCR)
[https://cloud.google.com/vision/docs/ocr](https://cloud.google.com/vision/docs/ocr)

```
from google.cloud import vision
client_options = {'api_endpoint': 'eu-vision.googleapis.com'}
client = vision.ImageAnnotatorClient(client_options=client_options)
```
