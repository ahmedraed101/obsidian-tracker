
# 🧠 Obsidian Tracker

**Track your Obsidian notes automatically by syncing changes to GitHub.**

`obsidian-tracker` is a simple Bash script that checks for changes in your Obsidian vault, commits them with a timestamp, and pushes them to a remote GitHub repository. It’s ideal for users who want to back up their notes regularly without manual git commands.

---

## 🚀 Features

- Detects changes in your Obsidian vault folder (a Git repo).
- Commits the changes with the current date/time.
- Pushes to your configured GitHub remote.
- Can be run on a schedule using `cron`.
- Logs output to `~/logs/obsidian_tracker.log`.

---

## 🛠 Setup Instructions

### 1. 🗂️ Initialize a Git repository in your Obsidian vault (if not already)

```bash
cd ~/path/to/your/obsidian-vault
git init
git remote add origin git@github.com:yourusername/your-repo.git
```

> Make sure you’ve set up SSH access to GitHub for passwordless push.

---

### 2. 📄 Add the script

Copy the `track_vault.sh` script to your Obsidian vault directory:

```bash
cp path/to/track_vault.sh ~/path/to/your/obsidian-vault/
chmod +x ~/path/to/your/obsidian-vault/track_vault.sh
```

---

### 3. ⏰ Set up a cron job

Edit your crontab:

```bash
crontab -e
```

Add the following line to run the script every 10 minutes and log output:

```bash
*/10 * * * * /bin/bash /home/youruser/path/to/your/obsidian-vault/track_vault.sh >> ~/logs/obsidian_tracker.log 2>&1
```

📁 Create the log directory if it doesn’t exist:

```bash
mkdir -p ~/logs
```

---

## 📌 Notes

* Ensure your SSH key is loaded at boot (use [keychain](https://wiki.archlinux.org/title/Keychain) or `ssh-add` in your session).
* The script checks for changes with `git status --porcelain` and only commits if changes exist.
* Commit messages include the current date and time in a readable format.

---

## ✅ Example Commit Message

```
Sat Jun(06) 14 2025 07-00-01 PM
```

---

## 🙏 Contributions

This is a minimal personal tool, but feel free to fork, modify, or contribute if you find it useful.

---
testing push 