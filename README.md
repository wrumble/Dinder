This was a job coding challenge

# Dinder

So i decided to use a basic MVVM architecture. Now that i have finished the project, i can see that i should have made the voting buttons into their own ViewController/ViewModel like the Filter has. After having done this i would have created a viewless RootViewController/RootViewModel that controlled the Home, Filter and Button ViewControllers/Models but ive run out of time.

One main issue i ran out of time to debug is that the `loadingView` doesnt show when selecting a new dog breed. It's due to a threading issue, but i cant figure out how to solve it yet.

The next step after this for me would have been to add swiping to vote for the dogs which would require pagination and i didnt have time to implement this.

From here it a shouldn't be to hard to add implement state so that you could switch between the dog an cat API.

I completely forgot about git control after creating the repo, this is not my normal way of working, im ashamed.

## To run

Download and Install Xcode then:

`git clone git@github.com:wrumble/Dinder.git`

`cd Dinder` 

`open open DogTinder.xcodeproj`

`press play button in top left corner`
