                          ___     _       _          
                         |__ \   | |     | |         
      _ __ ___  _ __ ___    ) |__| | ___ | | ___   _
     | '_ ` _ \| '_ ` _ \  / // _` |/ _ \| |/ / | | |
     | | | | | | | | | | |/ /| (_| | (_) |   <| |_| |
     |_| |_| |_|_| |_| |_|____\__,_|\___/|_|\_\\__,_|


mm2doku
=======

The purpose of this tool is to convert Freemind maps to dokuwiki syntax

![freemind map](https://github.com/boolaz/mm2doku/blob/master/sample/2-freemind_scr.jpg)

![dokuwiki page](https://github.com/boolaz/mm2doku/blob/master/sample/4-dokuwiki_scr.png)


Prerequisites
-------------

mm2doku has been developed in python 2.7 and has been successfully tested on Linux Ubuntu 14.04 LTS and MacOSX 10.11.6 El Capitan

This tool doesn't require any additional python modules to be run.

Syntax
------

You just have to execute the script with two parameters

    $ mm2doku.py src_file.mm dst_file.txt

As an output, you'll get a text file containing the converted document that you can paste to your dokuwiki page.

Todo list
---------
- Adding support for additional icons
- compiled binary version for windows

Stay tuned for updates and please, feel free to report any bug to the author.
