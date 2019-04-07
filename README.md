# Dinder

So i decided to use a basic MVVM architecture. Now that i have finished the project, i can see that i should have made the voting buttons into their own ViewController/ViewModel like the Filter has. After having done this i would have created a viewless RootViewController/RootViewModel that controlled the Home,Filter and Button ViewControllers/Models but ive run out of time.

One main issue i ran out of time to debug is that the `loadingView` doesnt show when selecting a new dog breed. Its due to a threading issue, but i cant figure out how to solve it yet.

The next step after this for me would have been to add swiping to vote for the dogs which would require pagination and i didnt have time to implement this.

## To run

Install Xcode then:

`git clone git@github.com:wrumble/Dinder.git`
`cd Dinder` 
`open open DogTinder.xcodeproj`
