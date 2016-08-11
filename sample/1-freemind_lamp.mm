<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1470597338390" ID="ID_1575092765" MODIFIED="1470822480359" STYLE="fork" TEXT="lamp server">
<font NAME="Arial" SIZE="10"/>
<node CREATED="1470822441567" HGAP="33" ID="ID_587946650" MODIFIED="1470826879081" POSITION="right" TEXT="linux" VSHIFT="6">
<icon BUILTIN="forward"/>
<node CREATED="1470822600252" HGAP="25" ID="ID_1291823549" MODIFIED="1470825967023" TEXT="Ubuntu 16.04" VSHIFT="-21">
<node CREATED="1470825967024" ID="ID_1486213474" MODIFIED="1470899136165" TEXT="released in april 2016"/>
<node CREATED="1470825980964" ID="ID_1196272031" MODIFIED="1470826001905" TEXT="codename: The Xenial Xerus">
<font BOLD="true" NAME="Arial" SIZE="10"/>
</node>
</node>
</node>
<node CREATED="1470822445528" HGAP="29" ID="ID_1665894601" MODIFIED="1470825799204" POSITION="right" TEXT="apache">
<icon BUILTIN="forward"/>
<node CREATED="1470823491281" ID="ID_533259276" MODIFIED="1470823497492" TEXT="conf">
<icon BUILTIN="forward"/>
<node CREATED="1470823498609" ID="ID_330214936" MODIFIED="1470823506488" TEXT="file /etc/apache2/ports.conf bash">
<node CREATED="1470823508355" ID="ID_596899561" MODIFIED="1470823546082" TEXT="Listen 80&#xa;&lt;IfModule ssl_module&gt;&#xa;&#x9;Listen 443&#xa;&lt;/IfModule&gt;&#xa;&lt;IfModule mod_gnutls.c&gt;&#xa;&#x9;Listen 443&#xa;&lt;/IfModule&gt;">
<font NAME="Courier New" SIZE="8"/>
</node>
</node>
<node CREATED="1470824526879" ID="ID_351627648" MODIFIED="1470824613713" TEXT="file /etc/apache2/conf-enabled/security.conf bash">
<node CREATED="1470824530931" ID="ID_1116765279" MODIFIED="1470824544274" TEXT="ServerTokens Prod&#xa;ServerSignature Off&#xa;TraceEnable Off">
<font NAME="Courier New" SIZE="8"/>
</node>
</node>
</node>
<node CREATED="1470822606787" ID="ID_447926929" MODIFIED="1470822836412" TEXT="logs">
<font NAME="Arial" SIZE="10"/>
<icon BUILTIN="forward"/>
<node CREATED="1470822610495" ID="ID_492657341" MODIFIED="1470822619234" TEXT="/var/log/access.log"/>
<node CREATED="1470822620627" ID="ID_1762648633" MODIFIED="1470822632874" TEXT="/var/log/error.log"/>
<node CREATED="1470823056741" ID="ID_1724343852" MODIFIED="1470823064149" TEXT="/var/log/old.log">
<node CREATED="1470823065717" ID="ID_286843313" MODIFIED="1470823074030" TEXT="to be erased">
<icon BUILTIN="button_cancel"/>
</node>
</node>
</node>
<node CREATED="1470822635107" ID="ID_588354285" MODIFIED="1470822836413" TEXT="status codes">
<font NAME="Arial" SIZE="10"/>
<icon BUILTIN="forward"/>
<node CREATED="1470822639017" ID="ID_1168004022" MODIFIED="1470826060758" TEXT="200">
<icon BUILTIN="forward"/>
<node CREATED="1470822649266" ID="ID_282907417" MODIFIED="1470822654249" TEXT="ok">
<node CREATED="1470823025981" ID="ID_796201472" MODIFIED="1470823047581" TEXT="to be detailed">
<icon BUILTIN="idea"/>
</node>
</node>
</node>
<node CREATED="1470822641538" ID="ID_1381367493" MODIFIED="1470826060760" TEXT="304">
<icon BUILTIN="forward"/>
<node CREATED="1470822701897" ID="ID_250419021" MODIFIED="1470822706112" TEXT="not modified"/>
</node>
<node CREATED="1470822673648" ID="ID_559132070" MODIFIED="1470826060760" TEXT="403">
<icon BUILTIN="forward"/>
<node CREATED="1470822678002" ID="ID_1887197471" MODIFIED="1470822683063" TEXT="forbidden"/>
</node>
<node CREATED="1470822643793" ID="ID_529852431" MODIFIED="1470826060760" TEXT="404">
<icon BUILTIN="forward"/>
<node CREATED="1470822709888" ID="ID_379306736" MODIFIED="1470822715288" TEXT="not found"/>
</node>
<node CREATED="1470822645754" ID="ID_1322861470" MODIFIED="1470826060760" TEXT="500">
<font BOLD="true" NAME="Arial" SIZE="10"/>
<icon BUILTIN="forward"/>
<node CREATED="1470822716695" ID="ID_774896432" MODIFIED="1470822725903" TEXT="internal server error">
<icon BUILTIN="messagebox_warning"/>
</node>
<node CREATED="1470826343812" ID="ID_286650701" MODIFIED="1470826355841" TEXT="important to avoid those errors">
<node CREATED="1470826356576" ID="ID_1494084433" MODIFIED="1470826496683" TEXT="leads to site not be accessible">
<font BOLD="true" NAME="Arial" SIZE="10"/>
<icon BUILTIN="yes"/>
</node>
</node>
</node>
<node CREATED="1470822737727" ID="ID_1329214333" MODIFIED="1470826060759" TEXT="607">
<font BOLD="true" NAME="Arial" SIZE="10"/>
<icon BUILTIN="forward"/>
<node CREATED="1470822739641" ID="ID_414682162" MODIFIED="1470822754085" TEXT="unknown">
<font ITALIC="true" NAME="Arial" SIZE="10"/>
<icon BUILTIN="help"/>
</node>
</node>
</node>
</node>
<node CREATED="1470822451934" HGAP="24" ID="ID_1010735674" MODIFIED="1470825802947" POSITION="right" TEXT="php" VSHIFT="-12">
<icon BUILTIN="forward"/>
<node CREATED="1470825256993" ID="ID_229610426" MODIFIED="1470825929289" TEXT="PHP is a server-side scripting language designed for web development but also used as a general-purpose programming language. Originally created by Rasmus Lerdorf in 1994, the PHP reference implementation is now produced by The PHP Group."/>
<node CREATED="1470825355621" HGAP="32" ID="ID_261301357" MODIFIED="1470825444116" TEXT="http://php.net/manual/en/funcref.php" VSHIFT="14"/>
<node CREATED="1470826850219" ID="ID_386756023" MODIFIED="1470826856001" TEXT="script php">
<node CREATED="1470826856495" ID="ID_1085937147" MODIFIED="1470826870755" TEXT="&lt;?php&#xa;header(&apos;Content-Type: text/html; charset=utf-8&apos;);&#xa;mb_internal_encoding(&quot;utf8&quot;);&#xa;$uploaddir = &apos;./&apos;;&#xa;$uploadfile = $uploaddir.&quot;test.csv&quot;;&#xa; &#xa;if (copy($_FILES[&apos;uploadfile&apos;][&apos;tmp_name&apos;], $uploadfile)){&#xa;    echo &quot;&lt;h3&gt;okay&lt;/h3&gt;&quot;.&quot;&lt;br&gt;&quot;;&#xa;}else{&#xa;    echo &quot;&lt;h3&gt;pb&lt;/h3&gt;&quot;;&#xa;    exit;&#xa;}">
<font NAME="Courier New" SIZE="8"/>
</node>
</node>
</node>
<node CREATED="1470822448510" HGAP="33" ID="ID_1462000711" MODIFIED="1470825810563" POSITION="right" TEXT="mysql" VSHIFT="-19">
<icon BUILTIN="forward"/>
<node CREATED="1470825880856" ID="ID_1028755757" MODIFIED="1470825910669" TEXT="The following variables have to be set to the corresponding values"/>
<node CREATED="1470822934169" ID="ID_902914934" MODIFIED="1470826580523" TEXT="script bash">
<font NAME="Arial" SIZE="10"/>
<node CREATED="1470824720188" ID="ID_1446799990" MODIFIED="1470824730501" TEXT="user&#x9;&#x9;= mysql&#xa;pid-file&#x9;= /var/run/mysqld/mysqld.pid&#xa;socket&#x9;&#x9;= /var/run/mysqld/mysqld.sock&#xa;port&#x9;&#x9;= 3306&#xa;basedir&#x9;&#x9;= /usr&#xa;datadir&#x9;&#x9;= /var/lib/mysql&#xa;tmpdir&#x9;&#x9;= /tmp&#xa;lc-messages-dir&#x9;= /usr/share/mysql">
<font NAME="Courier New" SIZE="8"/>
</node>
</node>
</node>
<node CREATED="1470825717318" HGAP="25" ID="ID_290273036" MODIFIED="1470826897465" POSITION="left" TEXT="others" VSHIFT="-111">
<icon BUILTIN="forward"/>
<node CREATED="1470825720339" ID="ID_1361543110" MODIFIED="1470899466424" TEXT="python script to parse the data">
<font BOLD="true" ITALIC="true" NAME="Arial" SIZE="10"/>
<node CREATED="1470825733340" FOLDED="true" ID="ID_1322244915" MODIFIED="1470901325873" TEXT="script python">
<node CREATED="1470825740781" ID="ID_1360222624" MODIFIED="1470825755845" TEXT="#!/usr/bin/python&#xa;# -*- coding: utf-8 -*-&#xa;&#xa;import os,sys,re&#xa;from sys import argv&#xa;import fnmatch&#xa;&#xa;extensions=[&quot;vmg&quot;]&#xa;&#xa;def main(argv): &#xa;&#xa;&#x9;print &apos;Argument List:&apos;, str(sys.argv)&#xa;&#x9;try:                                &#xa;&#x9;&#x9;chemin=sys.argv[1]&#xa;&#x9;except:          &#xa;&#x9;&#x9;print &quot;ParseSamsungSMS : Samsung SMS files (VMG files)&quot;                       &#xa;&#x9;&#x9;sys.exit(2) &#xa;&#xa;&#x9;fichier=GetFileList(chemin,extensions)&#xa;&#xa;if __name__ == &quot;__main__&quot;:&#xa;&#x9;main(sys.argv[1:])">
<font NAME="Courier New" SIZE="8"/>
</node>
</node>
</node>
</node>
<node CREATED="1470822466168" HGAP="16" ID="ID_866573672" MODIFIED="1470826910171" POSITION="left" TEXT="so cool !" VSHIFT="125">
<icon BUILTIN="forward"/>
<node CREATED="1470663311524" HGAP="32" ID="ID_1375208014" MODIFIED="1470822879788" STYLE="fork" TEXT="script" VSHIFT="4">
<font NAME="Arial" SIZE="10"/>
<node CREATED="1470816666900" HGAP="23" ID="ID_626509029" MODIFIED="1470822584740" TEXT="  _               __  __ _____  &#xa; | |        /\   |  \/  |  __ \ &#xa; | |       /  \  | \  / | |__) |&#xa; | |      / /\ \ | |\/| |  ___/ &#xa; | |____ / ____ \| |  | | |     &#xa; |______/_/    \_\_|  |_|_|   " VSHIFT="-35">
<font NAME="Courier New" SIZE="8"/>
</node>
</node>
</node>
</node>
</map>
