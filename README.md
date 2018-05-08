# Midterm

## Setup

 1. [Setup your Cloud9 workspace as usual.](https://guides.firstdraft.com/starting-on-a-project-in-cloud9), **except choose Private rather than Public**.
 1. In a Terminal, run `bin/setup` as usual.
 1. Click Run Project to start the app.
 1. Navigate to the app in Chrome.
 1. Note: as you are working and running into error messages, you may be prompted to run a different `bin/whitelist X.X.X.X` command each time your IP address/location changes; copy-paste it into a Terminal prompt if so in order to get much more helpful error messages, including an interactive console where you can poke at your variables to see what's going wrong.
 1. Check your progress/submit your work with `rails grade` as usual.

**If at any point `rails grade` or `rspec` fails with the message "Migrations are pending:**

Then open a Terminal prompt and run:

```
rails db:migrate RAILS_ENV=test
```

## Rules

You may refer to your notes, homeworks, the Ruby docs, GitHub, the forum, or anything else **except** for a live person (e.g., one of your classmates or a developer friend).

Close/put away/don't use any messaging client, including but not limited to email, Slack, SMS, smart watches, walkie talkies, or vocal chords.

## Hints

 - Navigate to `/git` and **commit often**; in particular, after you complete a problem and before you start the next.
 - Let Ruby's error messages guide you. They are trying to be helpful; they just have poor social skills. Try to make sense of their overly formal wording. The error pages also display helpful information like what controller and action were being routed to, and what was in the `params` hash.
 - Refer to your past work. This isn't a memorization competition.
 - **If you encounter an error that you think is environment related, ask a Private question on Piazza; we’ll tell you if it’s something you should be figuring out on your own or not.** If it's HTML, Ruby, RCAV, params, or CRUD-related, we can't help; but we can tell you the difference.
 - You don’t have to worry about CSS styling at all; just get the app to do the right thing.
 - **Use the server log** to verify that URLs are being routed to the actions you think they are, and to see what is coming in to the `params` hash.
 - In your browser, don’t get confused between the target app and your development app. Make sure you are refreshing your own app to test your work.
 - Don't get stuck on any one thing for too long; move on and score easy points on the next problem.

## Introduction

This application has 3 database tables:

 - coffee beans (columns: blend name, variety, origin, notes)
 - foods (columns: ingredient, spice, measurement, store address)
 - lists (columns: title, description)

Each resource needs 7 "golden" actions to allow users to interact with it:

### CREATE

 - new_form
 - create_row

### READ

 - index
 - show

### UPDATE

 - edit_form
 - update_row

### DELETE

 - destroy

For the first two, the Golden Seven exist but are buggy. **Your primary job** is to debug them all until you can create, read, update, and delete each of coffee beans, and foods without running into any issues. Your secondary job is to do a bit of geocoding on the show page of Foods.

Then you have to build the Golden Seven for Lists from scratch, the same way that you did for Photogram Golden 7. Hint: [the README for Photogram Golden 7](https://github.com/appdev-projects/photogram-golden-7#photogram-golden-seven) will come in handy.

### [Here is your target.](https://catalog-debug-target.herokuapp.com/)

Make yours work like it. Your local app is using a light theme, and the reference app is using a dark theme so that you don't get confused between tabs as you try to check your work.

Click through the app and debug. Try adding a new coffee bean, updating a coffee bean, looking at the details of a coffee bean, and deleting a coffee bean.

Sometimes you will get an error message; sometimes there won't be an error message, but the action just won't do its job. **Use the server log to help figure out what's going on.**

---

All in all, you need to:

 - Fix the Golden Seven for Coffee Beans.
 - Fix the Golden Seven for Foods.
 - Build the Golden Seven for Lists from scratch. I've already generated the model for you, so you just have to do the RCAVs.
 - Some geocoding: On the show page for each food, display the correct latitude and longitude of the food based on the value in its `store_address` column. Currently, every food shows the same latitude and longitude, which is wrong. Use Google's Geocoding API.

> **If you reach Google's Maps API free usage limit, use the following API URL stub:**

> https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyB_nAWVr-18Oi_XoadzVHmNT2vevvJfev4&address=LOCATION GOES HERE

> It contains my API token in one of the query string parameters, so should lift the limit.

---

**OPTIONAL:** Last, work on centering the embedded Google Map on the show page for each food on its real store address. Currently, every map is centered on the same location (the White House), which is wrong. Replace the static bits of the JavaScript that you want to be dynamic with embedded Ruby, the same as you do with HTML.
