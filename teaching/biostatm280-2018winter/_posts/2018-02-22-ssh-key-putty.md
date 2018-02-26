---
layout: post_teaching
title: Establishing SSH Key Authentication on Windows
category: biostatm280winter2018
---

This tutorial details the steps to establish SSH authentication for connecting to a Linux machine from a Windows machine. 

We assume that programs `PuTTY` and `PuTTYgen` are installed on the Windows machine. 

0. Generate a pair of SSH keys. If you already have them on the Linux machine, you can skip this step. Log in to a Linux machine and generate an SSH key pair named `id_rsa` by
```
ssh-keygen -t rsa -f id_rsa -C yourname
```
Replace `yourname` by any comment you want. This will produce a public key file `id_rsa.pub` and a private key file `id_rsa`.

0. Now we want to put the private key on the Windows machine so we can use it to connect to the Linux machine. You can use `WinSCP` or any other program to transfer this file to your Windows machine, or simply copy the content of `id_rsa` and paste to a text file on Windows. Let's assume the private key file on Windows machine is still named `id_rsa`. 

0. Unfortunately the private key format used by `PuTTY` is different from that of Linux. We use the `PuTTYgen` program to convert it to an appropriate format for `PuTTY`. Open `PuTTYgen`, go to menu `Conversions` -> `Import Key`, and select the `id_rsa` file. Click the `Save private key` button to save it as say `id_rsa_putty.ppk`. This is the private key file `PuTTY` will use.

0. Open `PuTTY` 

	0. enter Host Name (or IP address)

	0. From `Connection` -> `Data`, enter your username on the Linux machine to `Auto-login username`.

	0. From `Connection` -> `SSH` -> `Auth`, load the `id_rsa_putty.ppk` file to `Private key file for authentication`.

	0. From `Session`, provide a session name to `Saved Sessions` and click `Save`. 

	0. Now each time double-clicking the saved session will connect to the Linux machine via SSH key.

