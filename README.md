# Ansible Collection - maxwellk.general

An Ansible collection for Linux system administration.

Command to install this collection:

    ansible-galaxy collection install git+https://github.com/maxwell-k/general.git

<!-- Install from within a local clone:

trash-put ~/.ansible/collections \
; ansible-galaxy collection install --upgrade git+file://$PWD

-->

## Example usage

Each section includes a command to launch a new LXD container and apply a role.

<!-- toc -->

- [Fedora 39](#fedora-39)
  - [python311](#python311)
  - [pipx](#pipx)
  - [nox](#nox)
- [Ubuntu 22.04](#ubuntu-2204)
  - [python311](#python311-1)
  - [pipx](#pipx-1)
  - [nox](#nox-1)

<!-- tocstop -->

### Fedora 39

#### python311

    lxc launch images:fedora/39/cloud c1 \
    && ansible \
        --inventory=c1, \
        --connection=community.general.lxd \
        --module-name=include_role \
        --args=name=maxwellk.general.python311 \
        all

#### pipx

    lxc launch images:fedora/39/cloud c1 \
    && ansible \
        --inventory=c1, \
        --connection=community.general.lxd \
        --module-name=include_role \
        --args=name=maxwellk.general.pipx \
        all

#### nox

    lxc launch images:fedora/39/cloud c1 \
    && ansible \
        --inventory=c1, \
        --connection=community.general.lxd \
        --module-name=include_role \
        --args=name=maxwellk.general.nox \
        all

### Ubuntu 22.04

#### python311

    lxc launch ubuntu:22.04 c1 \
    && ansible \
        --inventory=c1, \
        --connection=community.general.lxd \
        --module-name=include_role \
        --args=name=maxwellk.general.python311 \
        all

#### pipx

    lxc launch ubuntu:22.04 c1 \
    && ansible \
        --inventory=c1, \
        --connection=community.general.lxd \
        --module-name=include_role \
        --args=name=maxwellk.general.pipx \
        all

#### nox

    lxc launch ubuntu:22.04 c1 \
    && ansible \
        --inventory=c1, \
        --connection=community.general.lxd \
        --module-name=include_role \
        --args=name=maxwellk.general.nox \
        all

<!-- Clean up:

lxc delete --force c1 \
&& ssh-keygen -R c1.lxd

-->

<!--
README.md
Copyright 2023 Keith Maxwell
SPDX-License-Identifier: CC0-1.0
-->

<!-- vim: set filetype=markdown.htmlCommentNoSpell.markdown-toc  : -->
