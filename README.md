# Lancet

A tool for slicing off a subset of a Git repository and sending
patches between the subset and progenitor repositories.

## Usage

Clone a subset of a Git repository into an output repository:

```
$ ls
README.md       pom.xml       src          target
$ lancet clone /tmp/subset-repo pom.xml src
...
Cloned subset of current Git repository into /tmp/subset-repo
```

After commits have been added to the subset repository, merge them
back into the progenitor:

```
$ lancet merge /tmp/subset-repo
Applying: A new commit
Applying: Some other commit
Applying: A third commit
```

Check the status of a progenitor or subset repository at any time:

```
$ lancet status
2 commits behind subset at /tmp/subset-repo
```

From within the subset repository, pull upstream commits from the
progenitor:

```
$ pwd
/tmp/subset-repo
$ lancet pull /path/to/progenitor/repo
patching file README.md
[master 1e756d9] Fast-forwarding to 09e2dcb8cad914966b0f9a8b8b7da3028b960756
 1 file changed, 1 insertion(+), 1 deletion(-)
```

## Why would I want this?

1. If you've hired a contractor to work on a project that is located
   in your company's monorepo. You don't want to give the contractor
   access too _all_ of your company's source code, so Lancet provides
   a means to grant them access to a narrow subset and maintain
   coherency between the two repositories.
2. If you want to open source a project taht is located in your
   company's monorepo.

## Doesn't $TOOL already solve this problem?

There are a few other tools with goals similar to those of
Lancet. [FBShipIt](https://github.com/facebook/fbshipit) and
[MOE](https://github.com/google/MOE) are two examples, from Facebook
and Google, respectively.

Both have very limited documentation and are thus difficult to learn
how to use. Both seem fairly heavy for the task at hand, MOE being a
JVM program and FBShipIt requiring HHVM. Additionally, I was turned
off by FBShipIt's use of PHP as a configuration language.

In short, I wanted something stupidly simple and with minimal
dependencies.

## License

Copyright 2017 Evan Meagher

Licensed under the MIT License. See LICENSE for details.
