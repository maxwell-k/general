incus launch images:fedora/40/cloud c1 \
&& incus exec c1 -- cloud-init status --wait \
&& ansible \
    --inventory=c1, \
    --connection=community.general.incus \
    --module-name=include_role \
    --args=name=maxwellk.general.pipx \
    all