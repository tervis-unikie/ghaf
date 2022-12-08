# Contributing

The Ghaf project is free and open source. You can find the source code that we use in the following repositories:

* https://spectrum-os.org/git/
* https://github.com/tiiuae/build-configurations
* https://github.com/tiiuae/sbomnix

If you have ideas you want to experiment with, make a fork and see how it works. Use pull requests if you are unsure and suggest changes to other maintainers.


## Contributing Documentation

Improvements to the documentation are welcome! We would love to get contributions from you.

Our philosophy:

* Update docs with the code.
* Content is King, consistency is Queen.
* Do not assume that readers know everything you currently know.
* Avoid jargon and acronyms, if you can.
* Do not reference future development or features that do not yet exist.

Please follow the steps below to create a pull request:

1. Fork it.
2. Create a branch (`git checkout -b doc_my_changes`) with your changes.
3. Check what you wrote with a spellchecker to make sure you did not miss anything.
4. Commit your changes (`git commit -am "Add new section FAQ"`). Keep text hard-wrapped at 70 characters. For more inspiration, see [How to Write a Git Commit Message](https://cbea.ms/git-commit/).
5. Push to the branch (`git push origin doc_my_changes`).
6. After publishing keep your ear to the ground for any feedback and comments in [Pull requests](https://github.com/tiiuae/ghaf/pulls).

## Contributing Code

We like code commits a lot as they keep the project going.

Two main rules:

1. Use `git commit --signoff` to improve tracking of who did what. It should contain your real user name used for an open-source project.
2. The author cannot merge a pull request.

#### Commit Message Guidelines

We are using the Linux kernel compatible commit message format.

The seven rules of a great Git commit message:

1. Separate subject from body with a blank line.
2. Limit the subject line to 50 characters.
3. Capitalize the subject line. If you start subject with a filename, capitalize after colon: “approve.sh: Fix whitespaces”.
4. Do not end the subject line with a period.
5. Use the imperative (commanding) mood in the subject line.
>”Fix a bug causing reboots on nuc” rather than “Fixed a bug causing reboots on nuc”. 
>”Update weston to version 10.5.1” rather than ”New weston version 10.5.1”.

6. Wrap the body at 72 characters.
7. Use the body to explain what and why vs. how.

Example:
```
Subject line: explain the commit in one line

Body of commit message is a few lines of text, explaining things
in more detail, possibly giving some background about the issue
being fixed, etc etc.

The body of the commit message can be several paragraphs, and
please do proper word-wrap and keep columns shorter than about
72 characters or so. That way "git log" will show things
nicely even when it's indented.

Signed-off-by: Your Name <youremail@yourhost.com>
```

The seven rules of a great Git commit message are originally from Google. Original commit message example is from Linus Torvalds. Both have been modified.

Comments and suggestions are welcome.


## Communication

GitHub issues are the primary way for communicating about specific proposed changes to this project.

If you want to join the project team, just let us know.