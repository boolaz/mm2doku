                          ___     _       _          
                         |__ \   | |     | |         
      _ __ ___  _ __ ___    ) |__| | ___ | | ___   _
     | '_ ` _ \| '_ ` _ \  / // _` |/ _ \| |/ / | | |
     | | | | | | | | | | |/ /| (_| | (_) |   <| |_| |
     |_| |_| |_|_| |_| |_|____\__,_|\___/|_|\_\\__,_|


# mm2doku

The purpose of this tool is to convert Freemind maps to dokuwiki syntax.

## Prerequisites

mm2doku has been developed in python 2.7 and has been successfully tested on Linux Ubuntu 14.04 LTS and MacOSX 10.11.6 El Capitan. This tool doesn't require any additional python modules to be run.

## Context

For many years I'm taking all my notes (meetings, readings, researchs) in a personal wiki stored locally in my computer. For the purpose of this, I adopted dokuwiki because it just needs an HTTP server, and doesn't require any database. Also, printing or making a PDF file from dokuwiki is very straightforward and produces a very good result in terms of presentation. And obviously, after 12 years, I know dokuwiki syntax very well.

But, what I also like to use is mind managers. They are really doing a great job when I have to take notes rapidly without using any syntax, just organizing objects in a graphical interface, creating nodes and subnodes with tab and enter. Although they are faster than wiki for that, it is more tricky when it comes to organizing and archiving notes. As my mind manager, I use Freemind since it is available on all plateforms.

So I thought to myself "is it possible to optimize the actions of taking notes, printing them for reporting in a way that I can control (with a CSS), and storing them for archiving and searching ?". That's why I decided to develop this tool, to make the most of both freemind (to take notes rapidly and easily) and dokuwiki (for printing, archiving and indexing).

## Example

Let's say we took some notes on a freemind map : [lamp.mm original file](https://github.com/boolaz/mm2doku/blob/master/sample/1-freemind_lamp.mm)

If you open the file in freemind, you'll get the following view

![lamp.mm](https://github.com/boolaz/mm2doku/blob/master/sample/2-freemind_scr.jpg)

With mm2doku, you can easily convert your map file to this file : [lamp.txt](https://github.com/boolaz/mm2doku/blob/master/sample/3-lamp_exported.txt)

When you paste the code above in dokuwiki, you'll be presented with the following page and the text will be indexed for search.

![dokuwiki page](https://github.com/boolaz/mm2doku/blob/master/sample/4-dokuwiki_scr.png)

Eventually, if you print the page in PDF, you'll obtain the following file

[dokuwiki-printed.pdf](https://github.com/boolaz/mm2doku/blob/master/sample/5-dokuwiki_printed.pdf)

## Syntax

You just have to execute the script with two parameters

    $ mm2doku.py src_file.mm dst_file.txt

As an output, you'll get a text file containing the converted document that you can paste to your dokuwiki page.

## Todo list

- Adding support for additional icons
- compiled binary version for windows

Stay tuned for updates and please, feel free to report any bug to the author.
