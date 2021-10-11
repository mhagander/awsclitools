# Some minor awscli tools

Nothing in particular, but enough people asked me to share that it
made more sense to just put them in a repo.

## Profile selector

A simple CLI profile selector that will allow a selection of the
currently configured profile and propagate that into the environment
for use.

To use, simply add something like:

```
alias awsprofile="source /some/where/awsprofile.sh"
```

in your `~/.bashrc` file.

## Credentials storage for secret-tool

A simple credentials helper that will store access and secret keys
using `secret-tool`, instead of exposing them in the `credentials`
file. This also comes with the benefit of locking them when the screen
is locked, and getting the same kind of timeout-lock as everything
else stored in the password store.

To enable, configure something like:

```
[profile whatever]
region = some-region
credential_process = /some/where/awscred.sh get
```

In your `~/.aws/config` file. Note that the entries for this profile
have to be *removed* from `~/.aws/credentials` if they exist, or that
will take precedence.

Sadly it does not appear to be possible to set the credentials
process as the default one, it has to be copy/pasted once for each
profile.


## Prompt highlighting the selected profile

This is something that probably needs more custom integration, but can
serve as an example.

To get the currently selected AWS profile listed in the prompt, put
something like:

```
source /some/where/awsprompt.sh
```

in your `~/.bashrc` file.
