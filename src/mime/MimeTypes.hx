/*
 * Copyright (c) 2017 Grabli66
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" : res =WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
 * THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package mime;

import tarantool.fio.File;

/**
 *  MIME application base
 */
class ApplicationBase {
    /**
     *  Constructor
     */
    public inline function new () {}
    
    /**
     *  Key/value data with url encoding
     */
    public var x_www_form_urlencoded (default, null) = "application/x-www-form-urlencoded"; 
}

/**
 *  MIME application base
 */
class TextBase {
    /**
     *  Constructor
     */
    public inline function new () {}
        
    public var text_cmd (default, null) = "text/cmd";
    public var text_css (default, null) = "text/css";
    public var text_csv (default, null) = "text/csv";
    public var text_html (default, null) = "text/html";
    public var text_plain (default, null) = "text/plain";
    public var text_php (default, null) = "text/php";
    public var text_xml (default, null) = "text/xml";
}

/**
 *  MIME types
 */
class MimeTypes {

    /**
     *  Application base
     */
    public static var application (default, null) : ApplicationBase = new ApplicationBase ();

    /**
     *  Text base
     */
    public static var text (default, null) : TextBase = new TextBase ();    

    /**
     *  Get MIME type for file name
     */
    public static function getMimeType (path : String) : String {
        var ext = File.getExtension (path);
        var res = "application/octet-stream";
        switch (ext) {
            case "bas", "cc", "conf", "cpp", "c", 
                 "c++", "cxx", "def", "f77", "f90", 
                 "for", "f", "g", "hh", "h",
                 "idc", "java", "jav", "list",
                 "log", "lst", "mar", "m", "pl",
                 "sdml", "text", "txt" : res = text.text_plain;
            case "acgi", "htmls", "html", "htm", 
                 "htx", "shtml", "stm" : res = text.text_html;                 
            case "disco", "wsdl", "xml", "xsd", "xsl", "xslt" : res = text.text_xml;
            case "css" : res = text.text_css;
            case "323" : res = "text/h323";
            case "3dmf" : res = "x-world/x-3dmf";
            case "3dm" : res = "x-world/x-3dmf";
            case "3g2" : res = "video/3gpp2";
            case "3gp" : res ="video/3gpp";
            case "7z" : res ="application/x-7z-compressed";
            case "aab" : res ="application/x-authorware-bin";
            case "aac" : res ="audio/aac";
            case "aam" : res ="application/x-authorware-map";
            case "aas" : res ="application/x-authorware-seg";
            case "abc" : res ="text/vnd.abc";            
            case "acx" : res ="application/internet-property-stream";
            case "afl" : res ="video/animaflex";
            case "ai" : res ="application/postscript";
            case "aif" : res ="audio/aiff";
            case "aifc" : res ="audio/aiff";
            case "aiff" : res ="audio/aiff";
            case "aim" : res ="application/x-aim";
            case "aip" : res ="text/x-audiosoft-intra";
            case "ani" : res ="application/x-navi-animation";
            case "aos" : res ="application/x-nokia-9000-communicator-add-on-software";
            case "appcache" : res ="text/cache-manifest";
            case "application" : res ="application/x-ms-application";
            case "aps" : res ="application/mime";
            case "art" : res ="image/x-jg";
            case "asf" : res ="video/x-ms-asf";
            case "asm" : res ="text/x-asm";
            case "asp" : res ="text/asp";
            case "asr" : res ="video/x-ms-asf";
            case "asx" : res ="application/x-mplayer2";
            case "atom" : res ="application/atom+xml";
            case "au" : res ="audio/x-au";
            case "avi" : res ="video/avi";
            case "avs" : res ="video/avs-video";
            case "axs" : res ="application/olescript";            
            case "bcpio" : res ="application/x-bcpio";
            case "bin" : res ="application/octet-stream";
            case "bm" : res ="image/bmp";
            case "bmp" : res ="image/bmp";
            case "boo" : res ="application/book";
            case "book" : res ="application/book";
            case "boz" : res ="application/x-bzip2";
            case "bsh" : res ="application/x-bsh";
            case "bz2" : res ="application/x-bzip2";
            case "bz" : res ="application/x-bzip";
            case "cat" : res ="application/vnd.ms-pki.seccat";
            case "ccad" : res ="application/clariscad";
            case "cco" : res ="application/x-cocoa";            
            case "cdf" : res ="application/cdf";
            case "cer" : res ="application/pkix-cert";
            case "cha" : res ="application/x-chat";
            case "chat" : res ="application/x-chat";
            case "class" : res ="application/x-java-applet";
            case "clp" : res ="application/x-msclip";
            case "cmx" : res ="image/x-cmx";
            case "cod" : res ="image/cis-cod";
            case "coffee" : res ="text/x-coffeescript";            
            case "cpio" : res ="application/x-cpio";            
            case "cpt" : res ="application/x-cpt";
            case "crd" : res ="application/x-mscardfile";
            case "crl" : res ="application/pkix-crl";
            case "crt" : res ="application/pkix-cert";
            case "csh" : res ="application/x-csh";                        
            case "dart" : res ="application/dart";
            case "dcr" : res ="application/x-director";
            case "deb" : res ="application/x-deb";
            case "deepv" : res ="application/x-deepv";            
            case "deploy" : res ="application/octet-stream";
            case "der" : res ="application/x-x509-ca-cert";
            case "dib" : res ="image/bmp";
            case "dif" : res ="video/x-dv";
            case "dir" : res ="application/x-director";            
            case "dll" : res ="application/x-msdownload";
            case "dl" : res ="video/dl";
            case "doc" : res ="application/msword";
            case "docm" : res ="application/vnd.ms-word.document.macroEnabled.12";
            case "docx" : res ="application/vnd.openxmlformats-officedocument.wordprocessingml.document";
            case "dot" : res ="application/msword";
            case "dotm" : res ="application/vnd.ms-word.template.macroEnabled.12";
            case "dotx" : res ="application/vnd.openxmlformats-officedocument.wordprocessingml.template";
            case "dp" : res ="application/commonground";
            case "drw" : res ="application/drafting";
            case "dtd" : res ="application/xml-dtd";
            case "dvi" : res ="application/x-dvi";
            case "dv" : res ="video/x-dv";
            case "dwf" : res ="drawing/x-dwf (old)";
            case "dwg" : res ="application/acad";
            case "dxf" : res ="application/dxf";
            case "dxr" : res ="application/x-director";
            case "elc" : res ="application/x-elc";
            case "el" : res ="text/x-script.elisp";
            case "eml" : res ="message/rfc822";
            case "eot" : res ="application/vnd.bw-fontobject";
            case "eps" : res ="application/postscript";
            case "es" : res ="application/x-esrehber";
            case "etx" : res ="text/x-setext";
            case "evy" : res ="application/envoy";
            case "exe" : res ="application/octet-stream";                        
            case "fdf" : res ="application/vnd.fdf";
            case "fif" : res ="image/fif";
            case "flac" : res ="audio/x-flac";
            case "fli" : res ="video/fli";
            case "flo" : res ="image/florian";
            case "flr" : res ="x-world/x-vrml";
            case "flx" : res ="text/vnd.fmi.flexstor";
            case "fmf" : res ="video/x-atomic3d-feature";            
            case "fpx" : res ="image/vnd.fpx";
            case "frl" : res ="application/freeloader";            
            case "funk" : res ="audio/make";
            case "g3" : res ="image/g3fax";
            case "gif" : res ="image/gif";
            case "gl" : res ="video/gl";
            case "gsd" : res ="audio/x-gsm";
            case "gsm" : res ="audio/x-gsm";
            case "gsp" : res ="application/x-gsp";
            case "gss" : res ="application/x-gss";
            case "gtar" : res ="application/x-gtar";            
            case "gz" : res ="application/x-gzip";
            case "gzip" : res ="application/x-gzip";
            case "hdf" : res ="application/x-hdf";
            case "help" : res ="application/x-helpfile";
            case "hgl" : res ="application/vnd.hp-HPGL";            
            case "hlb" : res ="text/x-script";
            case "hlp" : res ="application/x-helpfile";
            case "hpg" : res ="application/vnd.hp-HPGL";
            case "hpgl" : res ="application/vnd.hp-HPGL";
            case "hqx" : res ="application/binhex";
            case "hta" : res ="application/hta";
            case "htc" : res ="text/x-component";                        
            case "htt" : res ="text/webviewhtml";            
            case "ice" : res ="x-conference/x-cooltalk";
            case "ico" : res ="image/x-icon";
            case "ics" : res ="text/calendar";            
            case "ief" : res ="image/ief";
            case "iefs" : res ="image/ief";
            case "iges" : res ="application/iges";
            case "igs" : res ="application/iges";
            case "iii" : res ="application/x-iphone";
            case "ima" : res ="application/x-ima";
            case "imap" : res ="application/x-httpd-imap";
            case "inf" : res ="application/inf";
            case "ins" : res ="application/x-internett-signup";
            case "ip" : res ="application/x-ip2";
            case "isp" : res ="application/x-internet-signup";
            case "isu" : res ="video/x-isvideo";
            case "it" : res ="audio/it";
            case "iv" : res ="application/x-inventor";
            case "ivf" : res ="video/x-ivf";
            case "ivr" : res ="i-world/i-vrml";
            case "ivy" : res ="application/x-livescreen";
            case "jam" : res ="audio/x-jam";
            case "jar" : res ="application/java-archive";
            case "jcm" : res ="application/x-java-commerce";
            case "jfif" : res ="image/jpeg";
            case "jfif-tbnl" : res ="image/jpeg";
            case "jpeg" : res ="image/jpeg";
            case "jpe" : res ="image/jpeg";
            case "jpg" : res ="image/jpeg";
            case "jps" : res ="image/x-jps";
            case "js" : res ="application/javascript";
            case "json" : res ="application/json";
            case "jut" : res ="image/jutvision";
            case "kar" : res ="audio/midi";
            case "ksh" : res ="text/x-script.ksh";
            case "la" : res ="audio/nspaudio";
            case "lam" : res ="audio/x-liveaudio";
            case "latex" : res ="application/x-latex";            
            case "lma" : res ="audio/nspaudio";            
            case "lsp" : res ="application/x-lisp";            
            case "lsx" : res ="text/x-la-asf";
            case "ltx" : res ="application/x-latex";
            case "m13" : res ="application/x-msmediaview";
            case "m14" : res ="application/x-msmediaview";
            case "m1v" : res ="video/mpeg";
            case "m2a" : res ="audio/mpeg";
            case "m2v" : res ="video/mpeg";
            case "m3u" : res ="audio/x-mpequrl";
            case "m4a" : res ="audio/mp4";
            case "m4v" : res ="video/mp4";
            case "man" : res ="application/x-troff-man";
            case "manifest" : res ="application/x-ms-manifest";
            case "map" : res ="application/x-navimap";            
            case "mbd" : res ="application/mbedlet";
            case "mc$" : res ="application/x-magic-cap-package-1.0";
            case "mcd" : res ="application/mcad";
            case "mcf" : res ="image/vasa";
            case "mcp" : res ="application/netmc";
            case "mdb" : res ="application/x-msaccess";
            case "mesh" : res ="model/mesh";
            case "me" : res ="application/x-troff-me";
            case "mid" : res ="audio/midi";
            case "midi" : res ="audio/midi";
            case "mif" : res ="application/x-mif";
            case "mjf" : res ="audio/x-vnd.AudioExplosion.MjuiceMediaFile";
            case "mjpg" : res ="video/x-motion-jpeg";
            case "mm" : res ="application/base64";
            case "mme" : res ="application/base64";
            case "mny" : res ="application/x-msmoney";
            case "mod" : res ="audio/mod";
            case "mov" : res ="video/quicktime";
            case "movie" : res ="video/x-sgi-movie";
            case "mp2" : res ="video/mpeg";
            case "mp3" : res ="audio/mpeg";
            case "mp4" : res ="video/mp4";
            case "mp4a" : res ="audio/mp4";
            case "mp4v" : res ="video/mp4";
            case "mpa" : res ="audio/mpeg";
            case "mpc" : res ="application/x-project";
            case "mpeg" : res ="video/mpeg";
            case "mpe" : res ="video/mpeg";
            case "mpga" : res ="audio/mpeg";
            case "mpg" : res ="video/mpeg";
            case "mpp" : res ="application/vnd.ms-project";
            case "mpt" : res ="application/x-project";
            case "mpv2" : res ="video/mpeg";
            case "mpv" : res ="application/x-project";
            case "mpx" : res ="application/x-project";
            case "mrc" : res ="application/marc";
            case "ms" : res ="application/x-troff-ms";
            case "msh" : res ="model/mesh";            
            case "mvb" : res ="application/x-msmediaview";
            case "mv" : res ="video/x-sgi-movie";
            case "my" : res ="audio/make";
            case "mzz" : res ="application/x-vnd.AudioExplosion.mzz";
            case "nap" : res ="image/naplps";
            case "naplps" : res ="image/naplps";
            case "nc" : res ="application/x-netcdf";
            case "ncm" : res ="application/vnd.nokia.configuration-message";
            case "niff" : res ="image/x-niff";
            case "nif" : res ="image/x-niff";
            case "nix" : res ="application/x-mix-transfer";
            case "nsc" : res ="application/x-conference";
            case "nvd" : res ="application/x-navidoc";
            case "nws" : res ="message/rfc822";
            case "oda" : res ="application/oda";
            case "ods" : res ="application/oleobject";
            case "oga" : res ="audio/ogg";
            case "ogg" : res ="audio/ogg";
            case "ogv" : res ="video/ogg";
            case "ogx" : res ="application/ogg";
            case "omc" : res ="application/x-omc";
            case "omcd" : res ="application/x-omcdatamaker";
            case "omcr" : res ="application/x-omcregerator";
            case "opus" : res ="audio/ogg";
            case "oxps" : res ="application/oxps";
            case "p10" : res ="application/pkcs10";
            case "p12" : res ="application/pkcs-12";
            case "p7a" : res ="application/x-pkcs7-signature";
            case "p7b" : res ="application/x-pkcs7-certificates";
            case "p7c" : res ="application/pkcs7-mime";
            case "p7m" : res ="application/pkcs7-mime";
            case "p7r" : res ="application/x-pkcs7-certreqresp";
            case "p7s" : res ="application/pkcs7-signature";
            case "part" : res ="application/pro_eng";
            case "pas" : res ="text/pascal";
            case "pbm" : res ="image/x-portable-bitmap";
            case "pcl" : res ="application/x-pcl";
            case "pct" : res ="image/x-pict";
            case "pcx" : res ="image/x-pcx";
            case "pdb" : res ="chemical/x-pdb";
            case "pdf" : res ="application/pdf";
            case "pfunk" : res ="audio/make";
            case "pfx" : res ="application/x-pkcs12";
            case "pgm" : res ="image/x-portable-graymap";
            case "pic" : res ="image/pict";
            case "pict" : res ="image/pict";
            case "pkg" : res ="application/x-newton-compatible-pkg";
            case "pko" : res ="application/vnd.ms-pki.pko";            
            case "plx" : res ="application/x-PiXCLscript";
            case "pm4" : res ="application/x-pagemaker";
            case "pm5" : res ="application/x-pagemaker";
            case "pma" : res ="application/x-perfmon";
            case "pmc" : res ="application/x-perfmon";
            case "pm" : res ="image/x-xpixmap";
            case "pml" : res ="application/x-perfmon";
            case "pmr" : res ="application/x-perfmon";
            case "pmw" : res ="application/x-perfmon";
            case "png" : res ="image/png";
            case "pnm" : res ="application/x-portable-anymap";
            case "pot" : res ="application/vnd.ms-powerpoint";
            case "potm" : res ="application/vnd.ms-powerpoint.template.macroEnabled.12";
            case "potx" : res ="application/vnd.openxmlformats-officedocument.presentationml.template";
            case "pov" : res ="model/x-pov";
            case "ppa" : res ="application/vnd.ms-powerpoint";
            case "ppam" : res ="application/vnd.ms-powerpoint.setin.macroEnabled.12";
            case "ppm" : res ="image/x-portable-pixmap";
            case "pps" : res ="application/vnd.ms-powerpoint";
            case "ppsm" : res ="application/vnd.ms-powerpoint.slideshow.macroEnabled.12";
            case "ppsx" : res ="application/vnd.openxmlformats-officedocument.presentationml.slideshow";
            case "ppt" : res ="application/vnd.ms-powerpoint";
            case "pptm" : res ="application/vnd.ms-powerpoint.presentation.macroEnabled.12";
            case "pptx" : res ="application/vnd.openxmlformats-officedocument.presentationml.presentation";
            case "ppz" : res ="application/mspowerpoint";
            case "pre" : res ="application/x-freelance";
            case "prf" : res ="application/pics-rules";
            case "prt" : res ="application/pro_eng";
            case "ps" : res ="application/postscript";
            case "p" : res ="text/x-pascal";
            case "pub" : res ="application/x-mspublisher";
            case "pvu" : res ="paleovu/x-pv";
            case "pwz" : res ="application/vnd.ms-powerpoint";
            case "pyc" : res ="applicaiton/x-bytecode.python";
            case "py" : res ="text/x-script.phyton";
            case "qcp" : res ="audio/vnd.qcelp";
            case "qd3d" : res ="x-world/x-3dmf";
            case "qd3" : res ="x-world/x-3dmf";
            case "qif" : res ="image/x-quicktime";
            case "qtc" : res ="video/x-qtc";
            case "qtif" : res ="image/x-quicktime";
            case "qti" : res ="image/x-quicktime";
            case "qt" : res ="video/quicktime";
            case "ra" : res ="audio/x-pn-realaudio";
            case "ram" : res ="audio/x-pn-realaudio";
            case "ras" : res ="application/x-cmu-raster";
            case "rast" : res ="image/cmu-raster";
            case "rexx" : res ="text/x-script.rexx";
            case "rf" : res ="image/vnd.rn-realflash";
            case "rgb" : res ="image/x-rgb";
            case "rm" : res ="application/vnd.rn-realmedia";
            case "rmi" : res ="audio/mid";
            case "rmm" : res ="audio/x-pn-realaudio";
            case "rmp" : res ="audio/x-pn-realaudio";
            case "rng" : res ="application/ringing-tones";
            case "rnx" : res ="application/vnd.rn-realplayer";
            case "roff" : res ="application/x-troff";
            case "rp" : res ="image/vnd.rn-realpix";
            case "rpm" : res ="audio/x-pn-realaudio-plugin";
            case "rss" : res ="application/rss+xml";
            case "rtf" : res ="text/richtext";
            case "rt" : res ="text/richtext";
            case "rtx" : res ="text/richtext";
            case "rv" : res ="video/vnd.rn-realvideo";
            case "s3m" : res ="audio/s3m";
            case "sbk" : res ="application/x-tbook";
            case "scd" : res ="application/x-msschedule";
            case "scm" : res ="application/x-lotusscreencam";
            case "sct" : res ="text/scriptlet";            
            case "sdp" : res ="application/sdp";
            case "sdr" : res ="application/sounder";
            case "sea" : res ="application/sea";
            case "set" : res ="application/set";
            case "setpay" : res ="application/set-payment-initiation";
            case "setreg" : res ="application/set-registration-initiation";
            case "sgml" : res ="text/sgml";
            case "sgm" : res ="text/sgml";
            case "shar" : res ="application/x-bsh";
            case "sh" : res ="text/x-script.sh";            
            case "sid" : res ="audio/x-psid";
            case "silo" : res ="model/mesh";
            case "sit" : res ="application/x-sit";
            case "skd" : res ="application/x-koan";
            case "skm" : res ="application/x-koan";
            case "skp" : res ="application/x-koan";
            case "skt" : res ="application/x-koan";
            case "sl" : res ="application/x-seelogo";
            case "smi" : res ="application/smil";
            case "smil" : res ="application/smil";
            case "snd" : res ="audio/basic";
            case "sol" : res ="application/solids";
            case "spc" : res ="application/x-pkcs7-certificates";
            case "spl" : res ="application/futuresplash";
            case "spr" : res ="application/x-sprite";
            case "sprite" : res ="application/x-sprite";
            case "spx" : res ="audio/ogg";
            case "src" : res ="application/x-wais-source";
            case "ssi" : res ="text/x-server-parsed-html";
            case "ssm" : res ="application/streamingmedia";
            case "sst" : res ="application/vnd.ms-pki.certstore";
            case "step" : res ="application/step";
            case "s" : res ="text/x-asm";
            case "stl" : res ="application/sla";            
            case "stp" : res ="application/step";
            case "sv4cpio" : res ="application/x-sv4cpio";
            case "sv4crc" : res ="application/x-sv4crc";
            case "svf" : res ="image/x-dwg";
            case "svg" : res ="image/svg+xml";
            case "svr" : res ="application/x-world";
            case "swf" : res ="application/x-shockwave-flash";
            case "talk" : res ="text/x-speech";
            case "t" : res ="application/x-troff";
            case "tar" : res ="application/x-tar";
            case "tbk" : res ="application/toolbook";
            case "tcl" : res ="text/x-script.tcl";
            case "tcsh" : res ="text/x-script.tcsh";
            case "tex" : res ="application/x-tex";
            case "texi" : res ="application/x-texinfo";
            case "texinfo" : res ="application/x-texinfo";            
            case "tgz" : res ="application/x-compressed";
            case "tiff" : res ="image/tiff";
            case "tif" : res ="image/tiff";
            case "tr" : res ="application/x-troff";
            case "trm" : res ="application/x-msterminal";
            case "ts" : res ="text/x-typescript";
            case "tsi" : res ="audio/tsp-audio";
            case "tsp" : res ="audio/tsplayer";
            case "tsv" : res ="text/tab-separated-values";
            case "ttf" : res ="application/x-font-ttf";
            case "turbot" : res ="image/florian";            
            case "uil" : res ="text/x-uil";
            case "uls" : res ="text/iuls";
            case "unis" : res ="text/uri-list";
            case "uni" : res ="text/uri-list";
            case "unv" : res ="application/i-deas";
            case "uris" : res ="text/uri-list";
            case "uri" : res ="text/uri-list";
            case "ustar" : res ="multipart/x-ustar";
            case "uue" : res ="text/x-uuencode";
            case "uu" : res ="text/x-uuencode";
            case "vcd" : res ="application/x-cdlink";
            case "vcf" : res ="text/vcard";
            case "vcard" : res ="text/vcard";
            case "vcs" : res ="text/x-vCalendar";
            case "vda" : res ="application/vda";
            case "vdo" : res ="video/vdo";
            case "vew" : res ="application/groupwise";
            case "vivo" : res ="video/vivo";
            case "viv" : res ="video/vivo";
            case "vmd" : res ="application/vocaltec-media-desc";
            case "vmf" : res ="application/vocaltec-media-file";
            case "voc" : res ="audio/voc";
            case "vos" : res ="video/vosaic";
            case "vox" : res ="audio/voxware";
            case "vqe" : res ="audio/x-twinvq-plugin";
            case "vqf" : res ="audio/x-twinvq";
            case "vql" : res ="audio/x-twinvq-plugin";
            case "vrml" : res ="application/x-vrml";
            case "vrt" : res ="x-world/x-vrt";
            case "vsd" : res ="application/x-visio";
            case "vst" : res ="application/x-visio";
            case "vsw" : res ="application/x-visio";
            case "w60" : res ="application/wordperfect6.0";
            case "w61" : res ="application/wordperfect6.1";
            case "w6w" : res ="application/msword";
            case "wav" : res ="audio/wav";
            case "wb1" : res ="application/x-qpro";
            case "wbmp" : res ="image/vnd.wap.wbmp";
            case "wcm" : res ="application/vnd.ms-works";
            case "wdb" : res ="application/vnd.ms-works";
            case "web" : res ="application/vnd.xara";
            case "webm" : res ="video/webm";
            case "wiz" : res ="application/msword";
            case "wk1" : res ="application/x-123";
            case "wks" : res ="application/vnd.ms-works";
            case "wmf" : res ="windows/metafile";
            case "wmlc" : res ="application/vnd.wap.wmlc";
            case "wmlsc" : res ="application/vnd.wap.wmlscriptc";
            case "wmls" : res ="text/vnd.wap.wmlscript";
            case "wml" : res ="text/vnd.wap.wml";
            case "wmp" : res ="video/x-ms-wmp";
            case "wmv" : res ="video/x-ms-wmv";
            case "wmx" : res ="video/x-ms-wmx";
            case "woff" : res ="application/x-woff";
            case "word" : res ="application/msword";
            case "wp5" : res ="application/wordperfect";
            case "wp6" : res ="application/wordperfect";
            case "wp" : res ="application/wordperfect";
            case "wpd" : res ="application/wordperfect";
            case "wps" : res ="application/vnd.ms-works";
            case "wq1" : res ="application/x-lotus";
            case "wri" : res ="application/mswrite";
            case "wrl" : res ="application/x-world";
            case "wrz" : res ="model/vrml";
            case "wsc" : res ="text/scriplet";            
            case "wsrc" : res ="application/x-wais-source";
            case "wtk" : res ="application/x-wintalk";
            case "wvx" : res ="video/x-ms-wvx";
            case "x3d" : res ="model/x3d+xml";
            case "x3db" : res ="model/x3d+fastinfoset";
            case "x3dv" : res ="model/x3d-vrml";
            case "xaf" : res ="x-world/x-vrml";
            case "xaml" : res ="application/xaml+xml";
            case "xap" : res ="application/x-silverlight-app";
            case "xbap" : res ="application/x-ms-xbap";
            case "xbm" : res ="image/x-xbitmap";
            case "xdr" : res ="video/x-amt-demorun";
            case "xgz" : res ="xgl/drawing";
            case "xht" : res ="application/xhtml+xml";
            case "xhtml" : res ="application/xhtml+xml";
            case "xif" : res ="image/vnd.xiff";
            case "xla" : res ="application/vnd.ms-excel";
            case "xlam" : res ="application/vnd.ms-excel.setin.macroEnabled.12";
            case "xl" : res ="application/excel";
            case "xlb" : res ="application/excel";
            case "xlc" : res ="application/excel";
            case "xld" : res ="application/excel";
            case "xlk" : res ="application/excel";
            case "xll" : res ="application/excel";
            case "xlm" : res ="application/excel";
            case "xls" : res ="application/vnd.ms-excel";
            case "xlsb" : res ="application/vnd.ms-excel.sheet.binary.macroEnabled.12";
            case "xlsm" : res ="application/vnd.ms-excel.sheet.macroEnabled.12";
            case "xlsx" : res ="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            case "xlt" : res ="application/vnd.ms-excel";
            case "xltm" : res ="application/vnd.ms-excel.template.macroEnabled.12";
            case "xltx" : res ="application/vnd.openxmlformats-officedocument.spreadsheetml.template";
            case "xlv" : res ="application/excel";
            case "xlw" : res ="application/excel";
            case "xm" : res ="audio/xm";            
            case "xmz" : res ="xgl/movie";
            case "xof" : res ="x-world/x-vrml";
            case "xpi" : res ="application/x-xpinstall";
            case "xpix" : res ="application/x-vnd.ls-xpix";
            case "xpm" : res ="image/xpm";
            case "xps" : res ="application/vnd.ms-xpsdocument";
            case "x-png" : res ="image/png";
            case "xsr" : res ="video/x-amt-showrun";
            case "xwd" : res ="image/x-xwd";
            case "xyz" : res ="chemical/x-pdb";
            case "z" : res ="application/x-compressed";
            case "zip" : res ="application/zip";
            case "zsh" : res ="text/x-script.zsh";
        }
        
        return res;
    }
}