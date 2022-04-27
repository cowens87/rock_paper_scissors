# RomCom

A boilerplate repo. 

## Set Up
1. ONE teammate: fork this boilerplate repository 
2. Clone down your new, forked repo
3. cd into the repository
4. Open it in your text editor
5. View the project in the browser by running `open index.html` in your terminal
6. Then:

- Explore the repository to see what’s going on in the code
- Look at each file: index.html, styles.css, data.js, Cover.js, main.js
- ***Note:*** no imports or exports are needed because each JS file is linked in the HTML
- Even if you don’t know what each piece of the code is doing, talk through what you think is going on
- What pieces of code might you use to complete iterations, and what pieces will you have to create?
- All of your work will take place in main.js - **you will not need to change any other files!**


## Iteration 0 - Main Page
### Homepage
- [&check;] When the page loads, we should see a cover with a randomly selected image, title, and tagline which includes two random descriptors

## Iteration 1 - Show Random Cover
### Randomize

- [] Every time the user clicks the Show New Random Cover button, a new random cover is created
> hint: you may need to update the value of the provided currentCover variable

> hint: use that Cover class!
- [] Every time the user clicks the Show New Random Cover button, the random cover is displayed
hint: you may need to create a function that displays information on the DOM


## Iteration 2 - Switching Views
```
NOTE: in this iteration, you are not worrying about making the form WORK, and you are not worrying about saving or displaying covers. You simply want to make sure the views can be switched when you click the appropriate buttons.
```
### Form view: Form
```
When a user clicks the “Make Your Own Cover” button, we should see the form, and the homepage view should be hidden
When the Form view is visible, the “Show New Random Cover” and “Save Cover” buttons should be hidden
When the Form view is visible, the “Home” button should be visible
```
### Saved covers view: Homepage
```
When a user clicks the “View Saved Covers” button, we should see the saved covers section, and the homepage view should be hidden
When the Saved Covers view is visible, the “Show New Random Cover” and “Save Cover” buttons should be hidden
When the Saved Covers view is visible, the “Home” button should be visible
```
### For both the Make New Cover form section and the Saved Covers section:
```
In summary: Be able to switch between the three views (main poster, form, and saved posters) on the correct button clicks
When a user clicks the “Home” button, we should only see the Home section
When a user clicks the “Home” button, the home button should be hidden
When a user clicks the “Home” button, the “Show New Random Cover” and “Save Cover” buttons should be visible again
Hint: go check out the HTML and CSS files to see how the form and saved covers sections are being hidden in the first place
```
## Iteration 3 - Creating a New Cover
```
In the new cover form view, users should be able to fill out the four input fields and then hit the Make My Book button
When the Make My Book button is clicked, several things will happen:
Save the submitted data into the respective arrays (cover URL into the covers array, title string into the titles array, etc) so that future random covers can use the user-created data
Use the values from the inputs to create a new instance of the Cover class
Change back to the main home view (hiding the form view again)
Display the newly created cover image, title, and descriptors in the main cover
```
## Iteration 4 - Saving & Viewing Covers
```
When a user clicks the “Save Cover” button, the current cover will be added to the savedCovers array
If a user clicks the “Save Cover” more than once on a single cover, it will still only be saved once (no duplicates)
When a user clicks the “View Saved Covers” button, we should see the saved covers section
All the covers in the savedCovers array should be displayed in the saved covers section
Note: None of this needs to persist on page load
```
## Iteration 5 - Deleting Saved Covers
```
From the saved covers view, if a user double clicks a saved poster, it will be deleted
Hint: How will you update the data model to achieve this? Hint: Look into this user event Note: None of this needs to persist on page load
```
## Optional Extensions - Gettin’ fancy
```
Here’s a list of possible extensions to implement - but ONLY IF your team has completed all the previous iterations AND have cleaned up your code to make it DRYer and more readable.

You are welcome to add your own extensions. Be sure they are thoughtful in terms of UX/UI, and that they do not break any prior functionality.

Implement data validation and error handling into the form (disable the button until all fields are filled, provide error messages if data entered is not correct, etc)
When a user single clicks a saved cover, create a modal to view it larger
Allow users to drag and drop saved posters into whatever order they want them to appear
```

