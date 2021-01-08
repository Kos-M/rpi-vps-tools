Create a new repository, or reuse an existing one.

Generate a new SSH key:
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

id_rsa.pub must exist on github/gogs account as ssh key.

Copy the contents of the file `~/.ssh/id_rsa.pub` to your SSH keys in your GitHub account settings (https://github.com/settings/keys).


Change directory into the local clone of your repository (if you're not already there) and run:

```
git remote set-url origin git@<Custom Host>:username/your-repository.git
```
Edit ~/.ssh/config
```
Host got
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa
  IdentitiesOnly yes


Host <Custom Host>
  HostName 10.10.1.1
  User git
  IdentityFile ~/.ssh/id_rsa
  IdentitiesOnly yes
```

Now try editing a file (try the README) and then do:

```
$ git commit -am "Update README.md"
$ git push
```

You should not be asked for a username or password. If it works, your SSH key is correctly configured.
Done
