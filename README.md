# csc453-fall15-hw1-2-tests


## Running tests

Clone this into your project's root

```sh
git clone git://github.com/luigiinred/csc453-fall15-hw1-2-tests.git
```

Add this command for myhtml2txt:

```sh
(cd csc453-fall15-hw1-2-tests && ./run.zsh)
```

Your output and the output of diff will be saved into each test's directory.


Part 2's myhtml2txt executable is not up yet. I will generate failing tests once I get that.  



## Errors

Each test will have either test.out or test.err

If there is an test.err file in a test's directory I will assume the exit status should be 1

I am assuming all errors are formatted "Error on line x" (I will change this once I think of something I like)
