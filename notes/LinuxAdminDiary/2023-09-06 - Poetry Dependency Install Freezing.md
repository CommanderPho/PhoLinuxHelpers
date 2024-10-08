# Poetry was infinitely freezing upon installing any dependencies. It would be stuck at "Pending..." and clearing caches, reinstall poetry, and more didn't help.

The solution seemed to be KDEWallet keychain related. I couldn't get it to work over SSH (headless) no matter what I tried, but after RDP'ing in I got a KWallet unlock GUI prompt. 
After typing the login password poetry seemed to work as expected.

