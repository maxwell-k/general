# Ansible Collection - maxwellk.general

An Ansible collection for Linux system administration.

Command to install this collection:

    ansible-galaxy collection install git+https://github.com/maxwell-k/general.git

## Example usage

Command to apply this role to a LXD container:

_Fedora 39_

    lxc launch images:fedora/39/cloud c1 \
    && ansible \
        --inventory=c1, \
        --connection=community.general.lxd \
        --module-name=include_role
        --args=name=maxwellk.general.python311 \
        all

<!-- Clean up

lxc delete --force c1 \
&& ssh-keygen -R c1.lxd

-->

<!--
README.md
Copyright 2023 Keith Maxwell
SPDX-License-Identifier: CC0-1.0
-->

<!-- vim: set filetype=markdown.htmlCommentNoSpell  : -->
