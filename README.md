# Ansible Collection - maxwellk.general

An Ansible collection for Linux system administration on Ubuntu 22.04 and
Fedora 40.

Command to install this collection from GitHub:

    ansible-galaxy collection install git+https://github.com/maxwell-k/general.git

Command to install this collection from a local clone:

<!--
trash ~/.ansible/collections
-->

<!-- embedme .README.md-files/install-pwd.sh -->

```sh
ansible-galaxy collection install "git+file://$PWD"
```

Originally this collection used LXD, however [in 2024] LXD lost access to images
from the Linux Containers project including Fedora. Instead the collection uses a
combination of [Incus] and LXD. To work with Incus, it may be necessary to upgrade
to a more recent version of the `community.general` collection:

    ansible-galaxy collection install community.general --upgrade

[in 2024]:
  https://discuss.linuxcontainers.org/t/important-notice-for-lxd-users-image-server/18479
[Incus]: https://github.com/lxc/incus

## Example usage

Each section includes a command to launch a new LXD container and apply a role.

<!-- toc -->

- [Fedora 40](#fedora-40)
  - [python](#python)
  - [pipx](#pipx)
  - [nox](#nox)
- [Ubuntu 22.04](#ubuntu-2204)
  - [python](#python-1)
  - [pipx](#pipx-1)
  - [nox](#nox-1)

<!-- tocstop -->

### Fedora 40

#### python

Python 3.11 by default:

<!-- embedme .README.md-files/fedora-python311.sh -->

```sh
incus launch images:fedora/40/cloud c1 \
&& incus exec c1 -- cloud-init status --wait \
&& ansible \
    --inventory=c1, \
    --connection=community.general.incus \
    --module-name=include_role \
    --args=name=maxwellk.general.python \
    all
```

#### pipx

<!-- embedme .README.md-files/fedora-pipx.sh -->

```sh
incus launch images:fedora/40/cloud c1 \
&& incus exec c1 -- cloud-init status --wait \
&& ansible \
    --inventory=c1, \
    --connection=community.general.incus \
    --module-name=include_role \
    --args=name=maxwellk.general.pipx \
    all
```

#### nox

<!-- embedme .README.md-files/fedora-nox.sh -->

```sh
incus launch images:fedora/40/cloud c1 \
&& incus exec c1 -- cloud-init status --wait \
&& ansible \
    --inventory=c1, \
    --connection=community.general.incus \
    --module-name=include_role \
    --args=name=maxwellk.general.nox \
    all
```

### Ubuntu 22.04

#### python

Python 3.11 by default:

<!-- embedme .README.md-files/ubuntu-python311.sh -->

```sh
lxc launch ubuntu:22.04 c1 \
&& lxc exec c1 -- cloud-init status --wait \
&& ansible \
    --inventory=c1, \
    --connection=community.general.lxd \
    --module-name=include_role \
    --args=name=maxwellk.general.python \
    all
```

Python 3.12:

<!-- embedme .README.md-files/ubuntu-python312.sh -->

```sh
lxc launch ubuntu:22.04 c1 \
&& lxc exec c1 -- cloud-init status --wait \
&& ansible \
    --inventory=c1, \
    --connection=community.general.lxd \
    --module-name=include_role \
    --args=name=maxwellk.general.python \
    --extra-vars=python_version=3.12 \
    all
```

#### pipx

<!-- embedme .README.md-files/ubuntu-pipx.sh -->

```sh
lxc launch ubuntu:22.04 c1 \
&& lxc exec c1 -- cloud-init status --wait \
&& ansible \
    --inventory=c1, \
    --connection=community.general.lxd \
    --module-name=include_role \
    --args=name=maxwellk.general.pipx \
    all
```

#### nox

<!-- embedme .README.md-files/ubuntu-nox.sh -->

```sh
lxc launch ubuntu:22.04 c1 \
&& lxc exec c1 -- cloud-init status --wait \
&& ansible \
    --inventory=c1, \
    --connection=community.general.lxd \
    --module-name=include_role \
    --args=name=maxwellk.general.nox \
    all
```

<!-- Clean up:

lxc delete --force c1 \
&& ssh-keygen -R c1.lxd

-->

<!--
README.md
Copyright 2023 Keith Maxwell
SPDX-License-Identifier: CC0-1.0
-->

<!-- vim: set filetype=markdown.htmlCommentNoSpell.markdown-toc.embedme  : -->
