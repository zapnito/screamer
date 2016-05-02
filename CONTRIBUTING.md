# Contributing

## Submitting a PR

* Create a topic branch from where you want to base your work.
- This is usually the master branch.
- To quickly create a topic branch based on master; git checkout -b fix/master/my_contribution master. Please avoid working directly on the master branch.
* Make commits of logical units.
( Check for unnecessary whitespace with git diff --check before committing.
* Make sure your commit messages are in the proper format.


## Commit messages
  - Subject is required, the body is optional
  - Separate subject from body with a blank line
  - Limit the subject line to 50 characters
  - Capitalize the subject line
  - Do not end the subject line with a period
  - Use the imperative mood in the subject line
  - Wrap the body at 72 characters
  - Use the body to explain what and why vs. how

```
Summarize changes in around 50 characters or less

More detailed explanatory text, if necessary. Wrap it to about 72
characters or so. In some contexts, the first line is treated as the
subject of the commit and the rest of the text as the body. The
blank line separating the summary from the body is critical (unless
you omit the body entirely); various tools like `log`, `shortlog`
and `rebase` can get confused if you run the two together.

Explain the problem that this commit is solving. Focus on why you
are making this change as opposed to how (the code explains that).
Are there side effects or other unintuitive consequenses of this
change? Here's the place to explain them.

Further paragraphs come after blank lines.

 - Bullet points are okay, too

 - Typically a hyphen or asterisk is used for the bullet, preceded
   by a single space, with blank lines in between, but conventions
   vary here

If you use an issue tracker, put references to them at the bottom,
like this:

Resolves: #123
See also: #456, #789
```


* Make sure you have added the necessary tests for your changes.
* Run all the tests to assure nothing else was accidentally broken.
