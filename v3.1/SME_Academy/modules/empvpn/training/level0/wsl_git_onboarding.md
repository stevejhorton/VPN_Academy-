---
id: wsl_git_onboarding
title: WSL_and_Git_Onboarding
tags: [wsl, git, github, onboarding, level0]
levels: [level0]
platform: all
status: active
---

# WSL_and_Git_Onboarding

This is your first task before anything else in SME_Academy. No exceptions.
If you are on a Mac, you already have a Unix shell — skip to Step 3.

---

## Step 1 — Request WSL via the App Store

1. Open the internal App Store (Software Center / Company Portal depending on your build).
2. Search for **WSL** (Windows Subsystem for Linux).
3. Submit the request. It will be pushed to your machine — you do not need admin rights.
4. Once installed, search **Ubuntu** in the Start Menu and launch it.
5. Set a username and password when prompted. Remember the password — you will need it for `sudo`.

---

## Step 2 — Create a GHEC Account

1. Go to [https://github.com/enterprises/optum](https://github.com/enterprises/optum) *(link — confirm with your manager if this changes)*.
2. Create or link your account following your org's SSO instructions.
3. **Record your GHEC username in your SME_Academy profile** (Profile tab → GHEC Username field).
   This is how you get write access to your personal workspace directory in the repo.
4. Notify Horton of your username so he can grant access to `users/<your_id>/` in the repo.

---

## Step 3 — Create a Fine-Grained PAT

1. In GitHub: **Settings → Developer Settings → Personal Access Tokens → Fine-grained tokens → Generate new token**.
2. Set an expiration (90 days recommended — you will rotate it).
3. Under **Repository access**, select only `VPN_Academy-`.
4. Under **Permissions**, set:
   - Contents: **Read and Write**
   - Pull Requests: **Read and Write**
   - Metadata: **Read** (auto-selected)
5. Click **Generate token**. Copy it immediately — you will not see it again.
6. Store it at `~/creds/pat.txt` in your WSL/bash home directory:

```bash
mkdir -p ~/creds
chmod 700 ~/creds
echo "ghp_yourtoken..." > ~/creds/pat.txt
chmod 600 ~/creds/pat.txt
```

7. Enter the path `~/creds/pat.txt` in your SME_Academy Profile tab under **PAT Path**.

---

## Step 4 — Clone the VPN Academy Repo

```bash
mkdir -p ~/clones
cd ~/clones
git clone https://<YOUR_GHEC_USERNAME>:<YOUR_PAT>@github.com/stevejhorton/VPN_Academy- VPN_Academy
cd VPN_Academy
```

> **Note:** The repo URL with embedded credentials is for initial setup only.
> For ongoing use, configure Git credential storage:
> ```bash
> git config --global credential.helper store
> ```

---

## Step 5 — Verify Your Setup

```bash
cd ~/clones/VPN_Academy
git status
git log --oneline -5
```

You should see the repo history. If you see an error, check your PAT and that you were granted access.

---

## Step 6 — Set Your Git Identity

```bash
git config --global user.name "Your Name"
git config --global user.email "your.optum.email@optum.com"
```

---

## You Are Now Ready

Return to SME_Academy in your browser and complete your Profile tab:
- GHEC Username
- PAT Path (`~/creds/pat.txt`)
- Display Name

Then move on to **Level 1 Training**.

> Trap Door: Never commit your PAT to the repo. It lives in `~/creds/` only.
> If you accidentally commit it, rotate it immediately in GitHub Developer Settings.
