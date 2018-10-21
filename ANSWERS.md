# Q0: Why are these two errors being thrown?

1. The "Pending Migrations exist" error means we need to import the changes to our database made by the skeleton files and update the actual database based on them. The "uninitialized constant HomeController::Pokemon" error is because we have not created the Pokemon class yet.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *

The random pokemon are appearing because of the following lines of code: 

```
  def index
    trainerless_pokemon = Pokemon.where(trainer: nil)
    @pokemon = trainerless_pokemon.sample
  end
```

This code searches for and returns an array for all pokemon that have no trainer (are wild pokemon), and returns a random one of them (`trainerless_pokemon.sample`).

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

This line creates an HTML button with the CSS classes `button` and `medium`. The button is a patch button, which means that it updates some parameters. The button goes to the `capture_path(id: @pokemon)` path, which is the path with prefix `capture`, to which we assigned in `routes.rb` the function that captures Pokemon.

# Question 3: What would you name your own Pokemon?

I would call my Pokemon Manchu!

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

I had the following code: `redirect_to trainer_path(id: @curr_pokemon.trainer.id)`. This would properly redirect to the landing page of the trainer of the current pokemon.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

This line flashes on the screen the errors of the `@pokemon` object. If the `@pokemon` object was not validated properly, then it will have some errors, and these would be displayed on the screen before redirecting to the Pokemon creation page.

# Give us feedback on the project and decal below!

# Extra credit: Link your Heroku deployed app
