1) copy config and id_rsa, if in your system, there is id_rsa, rename it. then change in config 

2) The first step

chmod og-rwx id_rsa
chmod og-rwx config


3) Then run ssh -T git@github.com to test password. 

If you dont' want to acccess git@github.com, you can skip previous three steps. 

4) run install.sh 

5) open vim and run :PluginInstall

6) install chrome.  Change font and theme in terminal preference.

