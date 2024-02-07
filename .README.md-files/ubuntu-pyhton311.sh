lxc launch ubuntu:22.04 c1 \
&& ansible \
    --inventory=c1, \
    --connection=community.general.lxd \
    --module-name=include_role \
    --args=name=maxwellk.general.python311 \
    all