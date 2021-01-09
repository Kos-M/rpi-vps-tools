# Instuctions to setup passwordless git operations.

- Generate  SSH key pairs (email must be the same  you see with : ``` git config user.email ```)

Select save default to ~/.ssh/id_rsa
When ask for pass hit enter , else you must type that pass everytime you use the keys.
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

id_rsa.pub --> public key
id_rsa --> private key

- GITHUB Copy the contents of the file `~/.ssh/id_rsa.pub` to your SSH keys in your GitHub account settings (https://github.com/settings/keys).
- GOGS   Copy the contents of the file `~/.ssh/id_rsa.pub` to your SSH keys in your GitHub account settings (https://<GOGS_PUBLIC_URL>/user/settings/ssh).

- Create file ~/.ssh/config

```bash
Host <Custom Host>
  HostName 10.10.1.1
  User git
  IdentityFile ~/.ssh/id_rsa
  IdentitiesOnly yes
#example 
Host local
  HostName 10.10.1.1 # ip of custom gogs , can be github.com or any git server
  User git  # git user
  IdentityFile ~/.ssh/id_rsa # our private key
  IdentitiesOnly yes # tells to git should only use the authentication identity files above 
 #exampleEnd
```

Update existing repo with remote ( key enabled access )

```bash
git remote set-url origin git@<Custom Host>:username/your-repository.git # git remote set-url origin git@local:kosm/myrepo.git
```

Setup in new repo:

```bash
touch README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@<Custom Host>:username/your-repository.git   # git remote add origin git@local:kosm/myrepo.git
git push -u origin master
```

You should not be asked for a username or password. If it works, your SSH key is correctly configured.
Done
