# goto
A Unix file system's version of the c-family's goto idiom.

###SYNOPSIS

       goto [KEY[/SUBPATH]] [--list] [--add KEY [PATH]] [--setdef] [--find [-k|-v] KEY] [--remove KEYS...] [--help]

###DESCRIPTION

       The  goto  utility  shall  change  the working directory by using the given KEY's associated
       value (by default the key is __DEFAULT__) in its .goto_list file.

       This file contains on each line a KEY and a PATH separated by a space. The file  is  located
       in the home directory of the calling user (~/.goto_list).
       
       If the KEY is followed by a path then it will be used as subpath
       for the keys directory.

       For  its  update  on the working directory to be applied, goto requires to be defined as the
       following alias in the .bashrc of the user:
          alias goto="source _goto"

###OPTIONS

       The goto utility supports the following options:

       --list    Lists all the KEYs contained in the .goto_list file.

       --add     Adds the KEY to the .goto_list file with, as value, either the PATH if it's given.
                 Otherwise the current working dirrectory.

       --setdef  Sets the default KEY that is used when calling goto without
                 any arguments.
                 Equivalent to : --add __DEFAULT__ [PATH]

       --find    Lists all keys, along with their values, starting with the given argument.
                 Options:
                     -k lists only the keys
                     -v lists only the paths

       --remove  For each argument remove all matching keys after printing them and asking
                 for confirmation.

       --help    print on the standard output a small description of goto's usage.

###EXAMPLES

        $ pwd
        ~/folder/projects
        $ goto --add gotoProject;
        $ mkdir subfolder;
        $ cd;
        $ goto gotoProject subfolder;
        $ pwd;
        ~/folder/projects/goto/subfolder
        $ goto --setdef;
        $ cd ;
        $ goto;
        $ pwd
        ~/folder/projects/goto/subfolder;
        $ goto list;
        gotoProject
        __DEFAULT__
        $ goto --find gotoProj;
        gotoProject /home/user/folder/projects/goto/subfolder
        $ goto --find -k gotoProj;
        gotoProject
        $ goto --find -v gotoProj;
        /home/user/folder/projects/goto/subfolder

###SEE ALSO

       cd(P), sed(1)

###AUTHOR

       Bastien Penavayre ( bastienPenava@gmail.com )

1.0                                         06 June 2016
