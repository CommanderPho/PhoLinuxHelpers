# Increasing Swap Space

What worked was using the graphical disk partitioning software disk "KDE Partition Manager" and creating an extra "linuxswap"-format partition in the free space. 

I tried manually setting up using `mkswap` commands and such but despite creating the swap file with `dd` it didn't work.

Not sure if the swap will activate correctly at startup or if I need modify /etc/fstab


