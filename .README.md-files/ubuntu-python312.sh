lxc launch ubuntu:22.04 c1 \
&& lxc exec c1 -- cloud-init status --wait \
&& ansible \
    --inventory=c1, \
    --connection=community.general.lxd \
    --module-name=include_role \
    --args=name=maxwellk.general.python \
    --extra-vars=python_version=3.12 \
    all