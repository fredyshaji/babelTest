# PROJECT DOCUMENTATION :

1.Time Invested:

Day One ( 2 - 3 hours ) 
- made a rough UI design
- created a git repository named babelTest
- created a project named BabbelTest and created an initial UI and pushed to repo.
- created a question loading logic (Milestone 1)

Day Two ( 2 - 3 hours )
- improved the loading logic so that true percent is close to 25% and never less that 25%
- added timer, spanish label animation and an exit logic(Milestone 2)
- added alert to restart or exit (Milestone 3)

Day Two ( 1 - 2 hours )
- added some unit tests and UI tests
- fixed a bug in timerAction
- created documentation

concept - 30% 
model layer - 10%
view(s) - 20%, 
game mechanics - 40%

2. Decisions made
- Decided to use MVVM architecture since the app was not very heavy
- Initial logic used to load the question was to fetch two random pairs of words and set them as spanish and english and when true percent goes below 25 show a correct pair.
- Decided to change the logic since one in every question started to be true and looked like a repeating pattern
- In new logic, took 4 random pairs and return a english word and spanish word from these. And to ensure that true percent is atleast 25% added a check to return a true pair question
- decided that the smallest data set will be 3.
- would like to improve the question loading logic if provided more time
- would like to improve UI and animation if provided more time
- did not create a seperate strings file as there was only one view controller

Code Coverage - 75.6%

3. Git Branching strategy
- A master branch from which releases are taken
- a develop branch were development happens
- individual feature and bug branches which are merged on to develop after raising pull request
- fully tested develop is merged into master
