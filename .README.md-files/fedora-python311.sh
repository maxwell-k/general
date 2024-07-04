incus launch images:fedora/39/cloud c1 \
&& incus exec c1 -- cloud-init status --wait \
&& ansible \
    --inventory=c1, \
    --connection=community.general.incus \
    --module-name=include_role \
    --args=name=maxwellk.general.python311 \
    all