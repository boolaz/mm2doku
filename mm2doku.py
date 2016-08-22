#!/usr/bin/python
# -*- coding: utf-8 -*-
# ----------------------------------------------------
# Name 		: mm2doku
# Author 	: Bruno Valentin (bruno@boolaz.com)
# date 		: 10/08/2016
# Revision	: 1.0
# Purpose	: Convert freemind maps to dokuwiki
# ----------------------------------------------------

import re,sys

all_lines=list() #global array containing all the lines for mm file

#-------------------------
def usage():
    """Usage"""
    print """Usage: mm2dokuwiki.py freemind_map.mm output_file.txt
    """

#-------------------------
def get_rid_of_html(mystring):
    """replace HTML characters in strings"""
    html_table = {"&amp;":"&","&quot;":'"',"&apos;":"'","&gt;":">",
                  "&lt;":"<", "&#xa;":"\n","&#x9;":"\t","&#xa7;":"§",
                  "&#xc0;":"À","&#xc1;":"Á","&#xc2;":"Â","&#xc3;":"Ã",
                  "&#xc4;":"Ä","&#xc5;":"Å","&#xc7;":"Ç","&#xc8;":"È",
                  "&#xc9;":"É","&#xca;":"Ê","&#xcb;":"Ë","&#xcc;":"Ì",
                  "&#xcd;":"Í","&#xce;":"Î","&#xcf;":"Ï","&#xd1;":"Ñ",
                  "&#xd2;":"Ò","&#xd3;":"Ó","&#xd4;":"Ô","&#xd5;":"Õ",
                  "&#xd6;":"Ö","&#xd8;":"Ø","&#xd9;":"Ù","&#xda;":"Ú",
                  "&#xdb;":"Û","&#xdc;":"Ü","&#x0178;":"Ÿ","&#xe0;":"à",
                  "&#xe1;":"á","&#xe2;":"â","&#xe3;":"ã","&#xe4;":"ä",
                  "&#xe5;":"å","&#xe7;":"ç","&#xe8;":"è","&#xe9;":"é",
                  "&#xea;":"ê","&#xeb;":"ë","&#xec;":"ì","&#xed;":"í",
                  "&#xee;":"î","&#xef;":"ï","&#x0131;":"ı","&#xf1;":"ñ",
                  "&#xf2;":"ò","&#xf3;":"ó","&#xf4;":"ô","&#xf5;":"õ",
                  "&#xf6;":"ö","&#xf8;":"ø","&#xf9;":"ù","&#xfa;":"ú",
                  "&#xa3;":"£","&#x20ac;":"€", "&#xfb;":"û","&#xfc;":"ü",
                  "&#xff;":"ÿ","#xb0;":"°"}
    for src,dst in html_table.iteritems():
        mystring=mystring.replace(src,dst)
    return (mystring)

#-------------------------
def process_option(line):
    """gets the options for a node"""
    options=list()

    # font
    if re.match("^<font", line, re.IGNORECASE):
        if re.search("BOLD=\"true\"",line, re.IGNORECASE):
            options.append("bold")
        if re.search("ITALIC=\"true\"",line, re.IGNORECASE):
            options.append("italic")

    # icon
    elif re.match("^<icon BUILTIN=\".+\"", line, re.IGNORECASE):
        values=re.search("BUILTIN=\"(.+)\"",line, re.IGNORECASE)
        options.append(values.group(1))

    return(options)

#-------------------------
def export_dokuwiki(f):
    """exports dokuwiki-style output file"""
    global all_lines
    titles=["====== {0} ======","====== {0} ======","===== {0} =====", \
            "==== {0} ====","=== {0} ===","== {0} =="]

    # process all the lines
    for line in all_lines:
        node_id,texte,creation,modification,level,node_type,node_options=line

        # Title in capital letters
        if node_type=="root":
            texte=texte.upper()
            title=titles[level].format(get_rid_of_html(texte))
            f.write("{0}\n".format(title))

        # opennode
        elif node_type in ['opennode']:
            # This is a title
            if 'forward' in node_options:
                title=titles[level].format(get_rid_of_html(texte))
                f.write("{0}\n".format(title))
            # this is a bulletpoint
            else:
                # node options
                if 'messagebox_warning' in node_options:
                    texte="{0} :!:".format(texte)
                if 'yes' in node_options:
                    texte="{0} :!:".format(texte)
                if 'help' in node_options:
                    texte="{0} :?:".format(texte)
                if 'button_cancel' in node_options:
                    texte="{0} DELETEME".format(texte)
                if 'idea' in node_options:
                    texte="{0} FIXME".format(texte)
                if 'bold' in node_options:
                    texte="**{0}**".format(texte)
                if 'italic' in node_options:
                    texte="//{0}//".format(texte)

                # identation
                for i in range(2,level):
                    f.write("  ")
                if re.match("^script", texte, re.IGNORECASE):
                    script=texte.split(" ")
                    f.write("  * {0}".format(get_rid_of_html(script[0])))
                else:
                    f.write("  * {0}\n".format(get_rid_of_html(texte)))

        # openscript
        elif node_type in ['openscript']:
            f.write("  *")

        # openfile
        elif node_type in ['openfile']:
            f.write("  *")

        # bulletpoint
        elif node_type=="bulletpoint":
            for i in range(2,level):
                f.write("  ")
            f.write("  * {0}\n".format(get_rid_of_html(texte)))

        # bloc/file/script
        elif node_type=="bloc":
            bloc_type=node_options[0]
            if bloc_type=='script':
                language=node_options[1]
                texte=get_rid_of_html(texte)
                f.write("<code {1}>{0}</code>\n".format(texte,language))
            elif bloc_type=='file':
                file_name=node_options[1]
                language=node_options[2]
                texte=get_rid_of_html(texte)
                f.write("<file {2} {1}>{0}</file>\n".\
                       format(texte,file_name,language))

#-------------------------
def process_lines(f):
    """split each and every line and append them in all_lines[]"""

    global all_lines
    level=line_nb=0
    lines = read_lines_from_file(f)

    while line_nb < len(lines):

        line=lines[line_nb]

        # SINGLE LINE NODE
        if re.match("^<node.+/>", line, re.IGNORECASE):
            values=re.search(\
              "CREATED=\"([^\"]+)\".+ID=\"([^\"]+)\".+MODIFIED=\"([^\"]+)\".+TEXT=\"([^\"]*)\"",\
              line, re.IGNORECASE)

            # if multiline bloc else bulletpoint
            if re.match(".*&#xa;.*", values.group(4), re.IGNORECASE):
                node_type="bloc"
                if 'bloc_options' in locals():
                    node_options=bloc_options
                    bloc_options=[]
            else:
                node_type="bulletpoint"
                node_options=[]

            all_lines.append([ \
                values.group(2),values.group(4), values.group(1), \
                values.group(3),level, node_type,node_options])

        # NEW NODE
        elif re.match("^<node.+[^/]>", line, re.IGNORECASE):
            node_options=list()

            # read until opening other node or closing the current node
            while not re.match("^</?node",lines[line_nb+1], re.IGNORECASE):
                line_nb+=1
                node_options=node_options+process_option(lines[line_nb])

            # parses the line
            values=re.search(\
              "CREATED=\"([^\"]+)\".+ID=\"([^\"]+)\".+MODIFIED=\"([^\"]+)\".+TEXT=\"([^\"]*)\"",\
              line, re.IGNORECASE)
            text_node=values.group(4)

            # type bloc
            if re.match(".*&#xa;.*", text_node, re.IGNORECASE):
                node_type="bloc"
                if 'bloc_options' in locals():
                    node_options=bloc_options
                    bloc_options=[]
            # type script
            elif re.match("^script", text_node, re.IGNORECASE):
                node_type="openscript"
                # keeps script options for the next bloc in bloc_options
                bloc_options=text_node.split(" ")
                if len(bloc_options) < 2:
                    bloc_options.append("raw")
            # type file
            elif re.match("^file", text_node, re.IGNORECASE):
                node_type="openfile"
                # keeps file options for the next bloc in bloc_options
                bloc_options=text_node.split(" ")
                if len(bloc_options) < 2:
                    bloc_options.append("file")
                if len(bloc_options) < 3:
                    bloc_options.append("raw")
            # root node
            elif level==0:
                node_type="root"
            # opennode
            else:
                node_type="opennode"

            all_lines.append([\
               values.group(2),text_node,values.group(1),\
               values.group(3),level,node_type,node_options])
            level+=1

        # END OF CURRENT NODE
        elif re.match("^</node>", line, re.IGNORECASE):
            level-=1

        line_nb+=1

#-------------------------
def read_lines_from_file(f):
    """parses signe-line files"""
    lignes=f.readlines()
    nblines=len(lignes)
    # print "{}".format(nblines)
    if len(lignes)==1:
        final_lines=lignes[0].replace("><", ">\n<").split("\n")
    else:
        final_lines=lignes
    return final_lines

#-------------------------
def dump_all_lines():
    """Display all the lines from the file"""
    for line in all_lines:
        print line

#-------------------------
def main():
    if not len(sys.argv) == 3 or sys.argv[1]=="--help":
        usage()
    else:
        del sys.argv[0]
        input_file,output_file=sys.argv

        # Imports data from freemind map
        try:
            ifh = open(input_file, 'r')
        except Exception as e:
            print "The input file does not exist"
        else:
            process_lines(ifh)
            ifh.close

        # Exports data to dokuwiki file
        try:
            ofh = open(output_file, 'w')
        except Exception as e:
            print "problem creating the destination file"
        else:
            export_dokuwiki(ofh)
            ofh.close

if __name__ == '__main__':
    main()
