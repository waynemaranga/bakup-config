# LINUX BAKUP-CONFIG
## A shell script to backup config files
The BAKUP-CONFIG shell script backs up most of the essential and several non-essential configuration files for a Linux system.
It backs up by
Other personal config. files can also be added at the users pleasure.
It is useful mostly for single-user systems, but can be adjusted by server users by adding.

### How To Use
1. Clone the repo
2. Read through the script and uncomment code blocks to run them. Most of these are distro-specific. You can also comment out backups you find unecessary. For easy uncommenting/commenting, use multicursor functionality e.g in VS Code, add more cursors is with ***Shift +Alt + Down/Up*** (PC) or **⌥ + ⌘ + ↓/↑** (Mac) that insert cursors below or above, as demonstrated:

    ![multicursor](multicursor.gif)

3. Open a terminal in the cloned directory and run bash *bakup-config.sh*

### Risks & Errors
There is ZERO risk of system damage when the script has run, since none of the files are edited, changed or moved.
Copies of the files are made, archived using *tar* and compressed using *gzip*.
The archiving command used is *tar -rvpf [ARCHIVE] [FILE]* as explained below:
1. tar - The GNU version of the tar archiving utility
2. r - append files to the end of an archive
3. v - verbosely list files processed
4. f - use archive file or device ARCHIVE

However, the initial command is *tar -cvpf* where the *c* option creates the archive.
The default storage of the backup is $HOME, but can be adjusted at the end of the script to preferred destination.

The other errors to expect are:
```
tar: /home/USER_NAME/...: Cannot stat: No such file or directory
tar: Exiting with failure status due to previous errors
```
which only means the files/folders in question do not exist, such as files specific to distributions and are not strictly within [the FHS Standard](https://refspecs.linuxfoundation.org/fhs.shtml). These files can be added manually before the script is run as well as any other desired files for backup. The rest of the files will be archived normally before and after the errors.