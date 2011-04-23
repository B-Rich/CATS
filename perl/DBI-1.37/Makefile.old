# This Makefile is for the DBI extension to perl.
#
# It was generated automatically by MakeMaker version
# 6.03 (Revision: 1.63) from the contents of
# Makefile.PL. Don't edit this file, edit Makefile.PL instead.
#
#       ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker ARGV: ()
#
#   MakeMaker Parameters:

#     DIR => []
#     EXE_FILES => [q[dbiproxy], q[dbiprof]]
#     NAME => q[DBI]
#     VERSION_FROM => q[DBI.pm]
#     clean => { FILES=>q[$(DISTVNAME) Perl.xsi t/zz_*.t dbiproxy dbiprof dbi.prof ndtest.prt] }
#     dist => { DIST_DEFAULT=>q[clean distcheck disttest ci tardist], COMPRESS=>q[gzip -v9], PREOP=>q[$(MAKE) -f Makefile.old distdir], SUFFIX=>q[gz] }
#     dynamic_lib => { OTHERLDFLAGS=>q[0] }

# --- MakeMaker post_initialize section:


# --- MakeMaker const_config section:

# These definitions are from config.sh (via C:/Perl/lib/Config.pm)

# They may have been overridden via Makefile.PL or on the command line
AR = lib
CC = cl
CCCDLFLAGS =  
CCDLFLAGS =  
DLEXT = dll
DLSRC = dl_win32.xs
LD = link
LDDLFLAGS = -dll -nologo -nodefaultlib -debug -opt:ref,icf  -libpath:"C:\Perl\lib\CORE"  -machine:x86
LDFLAGS = -nologo -nodefaultlib -debug -opt:ref,icf  -libpath:"C:\Perl\lib\CORE"  -machine:x86
LIBC = msvcrt.lib
LIB_EXT = .lib
OBJ_EXT = .obj
OSNAME = MSWin32
OSVERS = 4.0
RANLIB = rem
SO = dll
EXE_EXT = .exe
FULL_AR = 


# --- MakeMaker constants section:
AR_STATIC_ARGS = cr
NAME = DBI
DISTNAME = DBI
NAME_SYM = DBI
VERSION = 1.37
VERSION_SYM = 1_37
XS_VERSION = 1.37
INST_BIN = blib\bin
INST_LIB = blib\lib
INST_ARCHLIB = blib\arch
INST_SCRIPT = blib\script
INSTALLDIRS = site
PREFIX = C:\Perl
SITEPREFIX = C:\Perl\site
VENDORPREFIX = 
INSTALLPRIVLIB = C:\Perl\lib
INSTALLSITELIB = C:\Perl\site\lib
INSTALLVENDORLIB = 
INSTALLARCHLIB = C:\Perl\lib
INSTALLSITEARCH = C:\Perl\site\lib
INSTALLVENDORARCH = 
INSTALLBIN = C:\Perl\bin
INSTALLSITEBIN = C:\Perl\bin
INSTALLVENDORBIN = 
INSTALLSCRIPT = C:\Perl\bin
PERL_LIB = C:\Perl\lib
PERL_ARCHLIB = C:\Perl\lib
SITELIBEXP = C:\Perl\site\lib
SITEARCHEXP = C:\Perl\site\lib
LIBPERL_A = libperl.lib
FIRST_MAKEFILE = Makefile
MAKE_APERL_FILE = Makefile.aperl
PERLMAINCC = $(CC)
PERL_INC = C:\Perl\lib\CORE
PERL = C:\Perl\bin\perl.exe
FULLPERL = C:\Perl\bin\perl.exe
PERLRUN = $(PERL)
FULLPERLRUN = $(FULLPERL)
PERLRUNINST = $(PERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
FULLPERLRUNINST = $(FULLPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
ABSPERL = $(PERL)
ABSPERLRUN = $(ABSPERL)
ABSPERLRUNINST = $(ABSPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"
FULL_AR = 
PERL_CORE = 0

VERSION_MACRO = VERSION
DEFINE_VERSION = -D$(VERSION_MACRO)=\"$(VERSION)\"
XS_VERSION_MACRO = XS_VERSION
XS_DEFINE_VERSION = -D$(XS_VERSION_MACRO)=\"$(XS_VERSION)\"

MAKEMAKER = C:/Perl/lib/ExtUtils/MakeMaker.pm
MM_VERSION = 6.03

# FULLEXT = Pathname for extension directory (eg Foo/Bar/Oracle).
# BASEEXT = Basename part of FULLEXT. May be just equal FULLEXT. (eg Oracle)
# PARENT_NAME = NAME without BASEEXT and no trailing :: (eg Foo::Bar)
# DLBASE  = Basename part of dynamic library. May be just equal BASEEXT.
FULLEXT = DBI
BASEEXT = DBI
PARENT_NAME = 
DLBASE = $(BASEEXT)
VERSION_FROM = DBI.pm
OBJECT = $(BASEEXT)$(OBJ_EXT)
LDFROM = $(OBJECT)
LINKTYPE = dynamic

# Handy lists of source code files:
XS_FILES= DBI.xs \
	Perl.xs
C_FILES = DBI.c \
	Perl.c
O_FILES = DBI.obj \
	Perl.obj
H_FILES = DBIXS.h \
	Driver_xst.h \
	dbd_xsh.h \
	dbi_sql.h \
	dbipport.h
MAN1PODS = 
MAN3PODS = 
INST_MAN1DIR = blib\man1
MAN1EXT = 1
INSTALLMAN1DIR = none
INSTALLSITEMAN1DIR = C:\Perl\site\man\man$(MAN1EXT)
INST_MAN3DIR = blib\man3
MAN3EXT = 3
INSTALLMAN3DIR = none
INSTALLSITEMAN3DIR = C:\Perl\site\man\man$(MAN3EXT)

# work around a famous dec-osf make(1) feature(?):
makemakerdflt: all

.SUFFIXES: .xs .c .C .cpp .cxx .cc $(OBJ_EXT)

# Nick wanted to get rid of .PRECIOUS. I don't remember why. I seem to 
# recall, that some make implementations will delete the Makefile when we 
# rebuild it. Because we call false(1) when we rebuild it. So make(1) is 
# not completely wrong when it does so. Our milage may vary.
# .PRECIOUS: Makefile    # seems to be not necessary anymore

.PHONY: all config static dynamic test linkext manifest

# Where is the Config information that we are using/depend on
CONFIGDEP = $(PERL_ARCHLIB)\Config.pm $(PERL_INC)\config.h

# Where to put things:
INST_LIBDIR      = $(INST_LIB)
INST_ARCHLIBDIR  = $(INST_ARCHLIB)

INST_AUTODIR     = $(INST_LIB)\auto\$(FULLEXT)
INST_ARCHAUTODIR = $(INST_ARCHLIB)\auto\$(FULLEXT)

INST_STATIC  = $(INST_ARCHAUTODIR)\$(BASEEXT)$(LIB_EXT)
INST_DYNAMIC = $(INST_ARCHAUTODIR)\$(DLBASE).$(DLEXT)
INST_BOOT    = $(INST_ARCHAUTODIR)\$(BASEEXT).bs

EXPORT_LIST = DBI.def

PERL_ARCHIVE = $(PERL_INC)\perl58.lib

TO_INST_PM = DBI.pm \
	DBIXS.h \
	Driver.xst \
	Driver_xst.h \
	dbd_xsh.h \
	dbi_sql.h \
	dbipport.h \
	lib/Bundle/DBI.pm \
	lib/DBD/ExampleP.pm \
	lib/DBD/NullP.pm \
	lib/DBD/Proxy.pm \
	lib/DBD/Sponge.pm \
	lib/DBI/Const/GetInfo/ANSI.pm \
	lib/DBI/Const/GetInfo/ODBC.pm \
	lib/DBI/Const/GetInfoReturn.pm \
	lib/DBI/Const/GetInfoType.pm \
	lib/DBI/DBD.pm \
	lib/DBI/DBD/Metadata.pm \
	lib/DBI/FAQ.pm \
	lib/DBI/Profile.pm \
	lib/DBI/ProfileData.pm \
	lib/DBI/ProfileDumper.pm \
	lib/DBI/ProfileDumper/Apache.pm \
	lib/DBI/ProxyServer.pm \
	lib/DBI/PurePerl.pm \
	lib/DBI/W32ODBC.pm \
	lib/Win32/DBIODBC.pm

PM_TO_BLIB = dbd_xsh.h \
	blib\arch\auto\DBI\dbd_xsh.h \
	lib/DBI/FAQ.pm \
	blib\lib\DBI/FAQ.pm \
	Driver_xst.h \
	blib\arch\auto\DBI\Driver_xst.h \
	lib/DBD/Proxy.pm \
	blib\lib\DBD/Proxy.pm \
	lib/DBI/Const/GetInfo/ANSI.pm \
	blib\lib\DBI/Const/GetInfo/ANSI.pm \
	DBIXS.h \
	blib\arch\auto\DBI\DBIXS.h \
	lib/DBI/Const/GetInfoReturn.pm \
	blib\lib\DBI/Const/GetInfoReturn.pm \
	DBI.pm \
	blib\lib\DBI.pm \
	lib/DBD/Sponge.pm \
	blib\lib\DBD/Sponge.pm \
	lib/DBI/Const/GetInfoType.pm \
	blib\lib\DBI/Const/GetInfoType.pm \
	lib/DBI/DBD/Metadata.pm \
	blib\lib\DBI/DBD/Metadata.pm \
	lib/DBI/W32ODBC.pm \
	blib\lib\DBI/W32ODBC.pm \
	lib/DBI/Const/GetInfo/ODBC.pm \
	blib\lib\DBI/Const/GetInfo/ODBC.pm \
	lib/DBI/ProfileDumper/Apache.pm \
	blib\lib\DBI/ProfileDumper/Apache.pm \
	lib/Bundle/DBI.pm \
	blib\lib\Bundle/DBI.pm \
	lib/DBI/Profile.pm \
	blib\lib\DBI/Profile.pm \
	Driver.xst \
	blib\arch\auto\DBI\Driver.xst \
	lib/DBI/ProfileDumper.pm \
	blib\lib\DBI/ProfileDumper.pm \
	lib/DBI/ProxyServer.pm \
	blib\lib\DBI/ProxyServer.pm \
	dbipport.h \
	blib\arch\auto\DBI\dbipport.h \
	lib/DBD/NullP.pm \
	blib\lib\DBD/NullP.pm \
	lib/DBI/DBD.pm \
	blib\lib\DBI/DBD.pm \
	lib/Win32/DBIODBC.pm \
	blib\lib\Win32/DBIODBC.pm \
	dbi_sql.h \
	blib\arch\auto\DBI\dbi_sql.h \
	lib/DBD/ExampleP.pm \
	blib\lib\DBD/ExampleP.pm \
	lib/DBI/PurePerl.pm \
	blib\lib\DBI/PurePerl.pm \
	lib/DBI/ProfileData.pm \
	blib\lib\DBI/ProfileData.pm


# --- MakeMaker tool_autosplit section:

# Usage: $(AUTOSPLITFILE) FileToSplit AutoDirToSplitInto
AUTOSPLITFILE = $(PERLRUN) -MAutoSplit  -e "autosplit($$ARGV[0], $$ARGV[1], 0, 1, 1);"


# --- MakeMaker tool_xsubpp section:

XSUBPPDIR = C:\Perl\lib\ExtUtils
XSUBPP = $(XSUBPPDIR)/xsubpp
XSPROTOARG = 
XSUBPPDEPS = $(XSUBPPDIR)\typemap typemap $(XSUBPP)
XSUBPPARGS = -typemap $(XSUBPPDIR)\typemap -typemap typemap
XSUBPP_EXTRA_ARGS = 


# --- MakeMaker tools_other section:

SHELL = cmd /x /c
CHMOD = $(PERLRUN) -MExtUtils::Command -e chmod
CP = $(PERLRUN) -MExtUtils::Command -e cp
LD = link
MV = $(PERLRUN) -MExtUtils::Command -e mv
NOOP = rem
RM_F = $(PERLRUN) -MExtUtils::Command -e rm_f
RM_RF = $(PERLRUN) -MExtUtils::Command -e rm_rf
TEST_F = $(PERLRUN) -MExtUtils::Command -e test_f
TOUCH = $(PERLRUN) -MExtUtils::Command -e touch
UMASK_NULL = umask 0
DEV_NULL = > NUL

# The following is a portable way to say mkdir -p
# To see which directories are created, change the if 0 to if 1
MKPATH = $(PERLRUN) -MExtUtils::Command -e mkpath

# This helps us to minimize the effect of the .exists files A yet
# better solution would be to have a stable file in the perl
# distribution with a timestamp of zero. But this solution doesn't
# need any changes to the core distribution and works with older perls
EQUALIZE_TIMESTAMP = $(PERLRUN) -MExtUtils::Command -e eqtime

# Here we warn users that an old packlist file was found somewhere,
# and that they should call some uninstall routine
WARN_IF_OLD_PACKLIST = $(PERL) -lwe "exit unless -f $$ARGV[0];" \
-e "print 'WARNING: I have found an old package in';" \
-e "print '	', $$ARGV[0], '.';" \
-e "print 'Please make sure the two installations are not conflicting';"

UNINST=0
VERBINST=1

MOD_INSTALL = $(PERL) -I$(INST_LIB) -I$(PERL_LIB) -MExtUtils::Install \
-e "install({ @ARGV },'$(VERBINST)',0,'$(UNINST)');"

DOC_INSTALL = $(PERL) -e "$$\=\"\n\n\";" \
-e "print '=head2 ', scalar(localtime), ': C<', shift, '>', ' L<', $$arg=shift, '|', $$arg, '>';" \
-e "print '=over 4';" \
-e "while (defined($$key = shift) and defined($$val = shift)) { print '=item *';print 'C<', \"$$key: $$val\", '>'; }" \
-e "print '=back';"

UNINSTALL =   $(PERL) -MExtUtils::Install \
-e "uninstall($$ARGV[0],1,1); print \"\nUninstall is deprecated. Please check the";" \
-e "print \" packlist above carefully.\n  There may be errors. Remove the\";" \
-e "print \" appropriate files manually.\n  Sorry for the inconveniences.\n\""


# --- MakeMaker dist section:
ZIPFLAGS = -r
TO_UNIX = @$(NOOP)
TAR = tar
POSTOP = @$(NOOP)
ZIP = zip
CI = ci -u
SHAR = shar
DIST_DEFAULT = clean distcheck disttest ci tardist
COMPRESS = gzip -v9
DIST_CP = best
PREOP = $(MAKE) -f Makefile.old distdir
TARFLAGS = cvf
DISTVNAME = $(DISTNAME)-$(VERSION)
SUFFIX = gz
RCS_LABEL = rcs -Nv$(VERSION_SYM): -q


# --- MakeMaker macro section:


# --- MakeMaker depend section:


# --- MakeMaker cflags section:

CCFLAGS = -nologo -Gf -W3 -MD -Zi -DNDEBUG -O1 -DWIN32 -D_CONSOLE -DNO_STRICT -DHAVE_DES_FCRYPT -DPERL_IMPLICIT_CONTEXT -DPERL_IMPLICIT_SYS -DUSE_PERLIO -DPERL_MSVCRT_READFIX
OPTIMIZE = -MD -Zi -DNDEBUG -O1
PERLTYPE = 
MPOLLUTE = 


# --- MakeMaker const_loadlibs section:

# DBI might depend on some other libraries:
# See ExtUtils::Liblist for details
#
LDLOADLIBS =   oldnames.lib kernel32.lib user32.lib gdi32.lib winspool.lib  comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib  netapi32.lib uuid.lib wsock32.lib mpr.lib winmm.lib  version.lib odbc32.lib odbccp32.lib msvcrt.lib
LD_RUN_PATH = 


# --- MakeMaker const_cccmd section:
CCCMD = $(CC) -c $(PASTHRU_INC) $(INC) \
	$(CCFLAGS) $(OPTIMIZE) \
	$(PERLTYPE) $(MPOLLUTE) $(DEFINE_VERSION) \
	$(XS_DEFINE_VERSION)

# --- MakeMaker post_constants section:

# --- This section was generated by DBI::DBD::dbd_postamble()
DBI_INST_DIR=.
DBI_INSTARCH_DIR=$(INST_ARCHAUTODIR)
DBI_DRIVER_XST=$(DBI_INSTARCH_DIR)/Driver.xst

# The main dependancy (technically correct but probably not used)
Perl.c: Perl.xsi

# This dependancy is needed since MakeMaker uses the .xs.o rule
Perl$(OBJ_EXT): Perl.xsi

Perl.xsi: $(DBI_DRIVER_XST) $(DBI_INSTARCH_DIR)/Driver_xst.h
	$(PERL) -p -e "s/~DRIVER~/Perl/g" < $(DBI_DRIVER_XST) > Perl.xsi

# these two keep make -j4 working
$(DBI_DRIVER_XST) :: pm_to_blib
	$(NOECHO) $(NOOP)

$(DBI_INSTARCH_DIR)/Driver_xst.h :: pm_to_blib
	$(NOECHO) $(NOOP)

# ---

DBI.c: Perl$(OBJ_EXT)

# make Changes file available as installed pod docs "perldoc DBI::Changes"
inst_libdbi = blib\lib\DBI
changes_pm = blib\lib\DBI\Changes.pm

config :: $(changes_pm)
	$(NOECHO) $(NOOP)

$(changes_pm): Changes
	$(NOECHO) $(MKPATH) $(inst_libdbi)
	$(NOECHO) $(RM_F) $(changes_pm)
	$(CP) Changes $(changes_pm)


# --- MakeMaker pasthru section:
PASTHRU = -nologo

# --- MakeMaker c_o section:

.c.i:
	cl -nologo -E -c $(PASTHRU_INC) $(INC) \
	$(CCFLAGS) $(OPTIMIZE) \
	$(PERLTYPE) $(MPOLLUTE) $(DEFINE_VERSION) \
	$(XS_DEFINE_VERSION) $(CCCDLFLAGS) "-I$(PERL_INC)" $(PASTHRU_DEFINE) $(DEFINE) $*.c > $*.i

.c.s:
	$(CCCMD) -S $(CCCDLFLAGS) "-I$(PERL_INC)" $(PASTHRU_DEFINE) $(DEFINE) $*.c

.c$(OBJ_EXT):
	$(CCCMD) $(CCCDLFLAGS) "-I$(PERL_INC)" $(PASTHRU_DEFINE) $(DEFINE) $*.c

.cpp$(OBJ_EXT):
	$(CCCMD) $(CCCDLFLAGS) "-I$(PERL_INC)" $(PASTHRU_DEFINE) $(DEFINE) $*.cpp

.cxx$(OBJ_EXT):
	$(CCCMD) $(CCCDLFLAGS) "-I$(PERL_INC)" $(PASTHRU_DEFINE) $(DEFINE) $*.cxx

.cc$(OBJ_EXT):
	$(CCCMD) $(CCCDLFLAGS) "-I$(PERL_INC)" $(PASTHRU_DEFINE) $(DEFINE) $*.cc


# --- MakeMaker xs_c section:

.xs.c:
	$(PERLRUN) $(XSUBPP) $(XSPROTOARG) $(XSUBPPARGS) $(XSUBPP_EXTRA_ARGS) $*.xs > $*.xsc && $(MV) $*.xsc $*.c


# --- MakeMaker xs_o section:


# --- MakeMaker top_targets section:

all :: pure_all manifypods
	@$(NOOP)

pure_all :: config pm_to_blib subdirs linkext
	@$(NOOP)

subdirs :: $(MYEXTLIB)
	@$(NOOP)

config :: Makefile $(INST_LIBDIR)\.exists
	@$(NOOP)

config :: $(INST_ARCHAUTODIR)\.exists
	@$(NOOP)

config :: $(INST_AUTODIR)\.exists
	@$(NOOP)

$(INST_AUTODIR)\.exists :: C:\Perl\lib\CORE\perl.h
	@$(MKPATH) $(INST_AUTODIR)
	@$(EQUALIZE_TIMESTAMP) C:\Perl\lib\CORE\perl.h $(INST_AUTODIR)\.exists

	-@$(CHMOD) $(PERM_RWX) $(INST_AUTODIR)

$(INST_LIBDIR)\.exists :: C:\Perl\lib\CORE\perl.h
	@$(MKPATH) $(INST_LIBDIR)
	@$(EQUALIZE_TIMESTAMP) C:\Perl\lib\CORE\perl.h $(INST_LIBDIR)\.exists

	-@$(CHMOD) $(PERM_RWX) $(INST_LIBDIR)

$(INST_ARCHAUTODIR)\.exists :: C:\Perl\lib\CORE\perl.h
	@$(MKPATH) $(INST_ARCHAUTODIR)
	@$(EQUALIZE_TIMESTAMP) C:\Perl\lib\CORE\perl.h $(INST_ARCHAUTODIR)\.exists

	-@$(CHMOD) $(PERM_RWX) $(INST_ARCHAUTODIR)

$(O_FILES): $(H_FILES)

help:
	perldoc ExtUtils::MakeMaker


# --- MakeMaker linkext section:

linkext :: $(LINKTYPE)
	@$(NOOP)


# --- MakeMaker dlsyms section:

DBI.def: Makefile.PL
	$(PERLRUN) -MExtUtils::Mksymlists \
     -e "Mksymlists('NAME'=>\"DBI\", 'DLBASE' => '$(BASEEXT)', 'DL_FUNCS' => {  }, 'FUNCLIST' => [], 'IMPORTS' => {  }, 'DL_VARS' => []);"


# --- MakeMaker dynamic section:

## $(INST_PM) has been moved to the all: target.
## It remains here for awhile to allow for old usage: "make dynamic"
#dynamic :: Makefile $(INST_DYNAMIC) $(INST_BOOT) $(INST_PM)
dynamic :: Makefile $(INST_DYNAMIC) $(INST_BOOT)
	@$(NOOP)


# --- MakeMaker dynamic_bs section:

BOOTSTRAP = DBI.bs

# As Mkbootstrap might not write a file (if none is required)
# we use touch to prevent make continually trying to remake it.
# The DynaLoader only reads a non-empty file.
$(BOOTSTRAP): Makefile  $(INST_ARCHAUTODIR)\.exists
	@echo "Running Mkbootstrap for $(NAME) ($(BSLOADLIBS))"
	@$(PERLRUN) \
		-MExtUtils::Mkbootstrap \
		-e "Mkbootstrap('$(BASEEXT)','$(BSLOADLIBS)');"
	@$(TOUCH) $(BOOTSTRAP)
	$(CHMOD) 644 $@

$(INST_BOOT): $(BOOTSTRAP) $(INST_ARCHAUTODIR)\.exists
	@$(PERLRUN) -MExtUtils::Command -e rm_rf $(INST_BOOT)
	-$(PERLRUN) -MExtUtils::Command -e cp $(BOOTSTRAP) $(INST_BOOT)
	$(CHMOD) 644 $@


# --- MakeMaker dynamic_lib section:

# This section creates the dynamically loadable $(INST_DYNAMIC)
# from $(OBJECT) and possibly $(MYEXTLIB).
OTHERLDFLAGS = 
INST_DYNAMIC_DEP = 

$(INST_DYNAMIC): $(OBJECT) $(MYEXTLIB) $(BOOTSTRAP) $(INST_ARCHAUTODIR)\.exists $(EXPORT_LIST) $(PERL_ARCHIVE) $(INST_DYNAMIC_DEP)
	$(LD) -out:$@ $(LDDLFLAGS) $(LDFROM) $(OTHERLDFLAGS) $(MYEXTLIB) $(PERL_ARCHIVE) $(LDLOADLIBS) -def:$(EXPORT_LIST)
	$(CHMOD) 755 $@


# --- MakeMaker static section:

## $(INST_PM) has been moved to the all: target.
## It remains here for awhile to allow for old usage: "make static"
#static :: Makefile $(INST_STATIC) $(INST_PM)
static :: Makefile $(INST_STATIC)
	@$(NOOP)


# --- MakeMaker static_lib section:

$(INST_STATIC): $(OBJECT) $(MYEXTLIB) $(INST_ARCHAUTODIR)\.exists
	$(RM_RF) $@
	$(AR) -out:$@ $(OBJECT)
	@echo "$(EXTRALIBS)" > $(INST_ARCHAUTODIR)\extralibs.ld
	$(CHMOD) 755 $@


# --- MakeMaker manifypods section:

manifypods :
	@$(NOOP)


# --- MakeMaker processPL section:

all :: dbiprof
	@$(NOOP)

dbiprof :: dbiprof.PL
	$(PERLRUNINST) dbiprof.PL dbiprof

all :: dbiproxy
	@$(NOOP)

dbiproxy :: dbiproxy.PL
	$(PERLRUNINST) dbiproxy.PL dbiproxy


# --- MakeMaker installbin section:

$(INST_SCRIPT)\.exists :: C:\Perl\lib\CORE\perl.h
	@$(MKPATH) $(INST_SCRIPT)
	@$(EQUALIZE_TIMESTAMP) C:\Perl\lib\CORE\perl.h $(INST_SCRIPT)\.exists

	-@$(CHMOD) $(PERM_RWX) $(INST_SCRIPT)

EXE_FILES = dbiproxy dbiprof

FIXIN = pl2bat.bat

pure_all :: $(INST_SCRIPT)\dbiprof $(INST_SCRIPT)\dbiproxy
	@$(NOOP)

realclean ::
	$(PERLRUN) -MExtUtils::Command -e rm_f $(INST_SCRIPT)\dbiprof $(INST_SCRIPT)\dbiproxy

$(INST_SCRIPT)\dbiprof: dbiprof Makefile $(INST_SCRIPT)\.exists
	@$(PERLRUN) -MExtUtils::Command -e rm_f $(INST_SCRIPT)\dbiprof
	$(PERLRUN) -MExtUtils::Command -e cp dbiprof $(INST_SCRIPT)\dbiprof
	$(FIXIN) $(INST_SCRIPT)\dbiprof
	-@$(CHMOD) $(PERM_RWX) $(INST_SCRIPT)\dbiprof

$(INST_SCRIPT)\dbiproxy: dbiproxy Makefile $(INST_SCRIPT)\.exists
	@$(PERLRUN) -MExtUtils::Command -e rm_f $(INST_SCRIPT)\dbiproxy
	$(PERLRUN) -MExtUtils::Command -e cp dbiproxy $(INST_SCRIPT)\dbiproxy
	$(FIXIN) $(INST_SCRIPT)\dbiproxy
	-@$(CHMOD) $(PERM_RWX) $(INST_SCRIPT)\dbiproxy


# --- MakeMaker subdirs section:

# none

# --- MakeMaker clean section:

# Delete temporary files but do not touch installed files. We don't delete
# the Makefile here so a later make realclean still has a makefile to use.

clean ::
	-$(PERLRUN) -MExtUtils::Command -e rm_rf Perl.c DBI.c $(DISTVNAME) Perl.xsi t/zz_*.t dbiproxy dbiprof dbi.prof ndtest.prt ./blib $(MAKE_APERL_FILE) $(INST_ARCHAUTODIR)/extralibs.all perlmain.c tmon.out mon.out so_locations pm_to_blib *$(OBJ_EXT) *$(LIB_EXT) perl.exe perl perl$(EXE_EXT) $(BOOTSTRAP) $(BASEEXT).bso $(BASEEXT).def lib$(BASEEXT).def $(BASEEXT).exp $(BASEEXT).x core core.*perl.*.? *perl.core
	-$(PERLRUN) -MExtUtils::Command -e mv Makefile Makefile.old $(DEV_NULL)
clean ::
	-$(RM_F) *.pdb



# --- MakeMaker realclean section:

# Delete temporary files (via clean) and also delete installed files
realclean purge ::  clean
	$(PERLRUN) -MExtUtils::Command -e rm_rf $(INST_AUTODIR) $(INST_ARCHAUTODIR)
	$(PERLRUN) -MExtUtils::Command -e rm_rf $(DISTVNAME)
	$(PERLRUN) -MExtUtils::Command -e rm_f $(INST_DYNAMIC) $(INST_BOOT)
	$(PERLRUN) -MExtUtils::Command -e rm_f $(INST_STATIC)
	$(PERLRUN) -MExtUtils::Command -e rm_f  blib\arch\auto\DBI\dbd_xsh.h blib\lib\DBI/FAQ.pm blib\arch\auto\DBI\Driver_xst.h
	$(PERLRUN) -MExtUtils::Command -e rm_f blib\lib\DBD/Proxy.pm blib\lib\DBI/Const/GetInfo/ANSI.pm
	$(PERLRUN) -MExtUtils::Command -e rm_f blib\arch\auto\DBI\DBIXS.h blib\lib\DBI/Const/GetInfoReturn.pm blib\lib\DBI.pm
	$(PERLRUN) -MExtUtils::Command -e rm_f blib\lib\DBD/Sponge.pm blib\lib\DBI/Const/GetInfoType.pm
	$(PERLRUN) -MExtUtils::Command -e rm_f blib\lib\DBI/DBD/Metadata.pm blib\lib\DBI/W32ODBC.pm
	$(PERLRUN) -MExtUtils::Command -e rm_f blib\lib\DBI/Const/GetInfo/ODBC.pm blib\lib\DBI/ProfileDumper/Apache.pm
	$(PERLRUN) -MExtUtils::Command -e rm_f blib\lib\Bundle/DBI.pm blib\lib\DBI/Profile.pm blib\arch\auto\DBI\Driver.xst
	$(PERLRUN) -MExtUtils::Command -e rm_f blib\lib\DBI/ProfileDumper.pm blib\lib\DBI/ProxyServer.pm
	$(PERLRUN) -MExtUtils::Command -e rm_f blib\arch\auto\DBI\dbipport.h blib\lib\DBD/NullP.pm blib\lib\DBI/DBD.pm
	$(PERLRUN) -MExtUtils::Command -e rm_f blib\lib\Win32/DBIODBC.pm blib\arch\auto\DBI\dbi_sql.h blib\lib\DBD/ExampleP.pm
	$(PERLRUN) -MExtUtils::Command -e rm_f blib\lib\DBI/PurePerl.pm blib\lib\DBI/ProfileData.pm
	$(PERLRUN) -MExtUtils::Command -e rm_rf Makefile Makefile.old


# --- MakeMaker dist_basics section:
distclean :: realclean distcheck
	$(NOECHO) $(NOOP)

distcheck :
	$(PERLRUN) "-MExtUtils::Manifest=fullcheck" -e fullcheck

skipcheck :
	$(PERLRUN) "-MExtUtils::Manifest=skipcheck" -e skipcheck

manifest :
	$(PERLRUN) "-MExtUtils::Manifest=mkmanifest" -e mkmanifest

veryclean : realclean
	$(RM_F) *~ *.orig */*~ */*.orig



# --- MakeMaker dist_core section:

dist : $(DIST_DEFAULT)
	@$(PERL) -le "print \"Warning: Makefile possibly out of date with $$vf\" if " \
	    -e "-e ($$vf=\"$(VERSION_FROM)\") and -M $$vf < -M \"Makefile\";"

tardist : $(DISTVNAME).tar$(SUFFIX)

zipdist : $(DISTVNAME).zip

$(DISTVNAME).tar$(SUFFIX) : distdir
	$(PREOP)
	$(TO_UNIX)
	$(TAR) $(TARFLAGS) $(DISTVNAME).tar $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(COMPRESS) $(DISTVNAME).tar
	$(POSTOP)

$(DISTVNAME).zip : distdir
	$(PREOP)
	$(ZIP) $(ZIPFLAGS) $(DISTVNAME).zip $(DISTVNAME)
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)

uutardist : $(DISTVNAME).tar$(SUFFIX)
	uuencode $(DISTVNAME).tar$(SUFFIX) \
		$(DISTVNAME).tar$(SUFFIX) > \
		$(DISTVNAME).tar$(SUFFIX)_uu

shdist : distdir
	$(PREOP)
	$(SHAR) $(DISTVNAME) > $(DISTVNAME).shar
	$(RM_RF) $(DISTVNAME)
	$(POSTOP)


# --- MakeMaker dist_dir section:
distdir :
	$(RM_RF) $(DISTVNAME)
	$(PERLRUN) "-MExtUtils::Manifest=manicopy,maniread" \
		-e "manicopy(maniread(),'$(DISTVNAME)', '$(DIST_CP)');"



# --- MakeMaker dist_test section:

disttest : distdir
	cd $(DISTVNAME) && $(ABSPERLRUN) Makefile.PL
	cd $(DISTVNAME) && $(MAKE) $(PASTHRU)
	cd $(DISTVNAME) && $(MAKE) test $(PASTHRU)


# --- MakeMaker dist_ci section:

ci :
	$(PERLRUN) -MExtUtils::Manifest=maniread \
		-e "@all = keys %{ maniread() };" \
		-e "print(\"Executing $(CI) @all\n\"); system(\"$(CI) @all\");" \
		-e "print(\"Executing $(RCS_LABEL) ...\n\"); system(\"$(RCS_LABEL) @all\");"


# --- MakeMaker install section:

install :: all pure_install doc_install

install_perl :: all pure_perl_install doc_perl_install

install_site :: all pure_site_install doc_site_install

install_vendor :: all pure_vendor_install doc_vendor_install

pure_install :: pure_$(INSTALLDIRS)_install

doc_install :: doc_$(INSTALLDIRS)_install
	@echo Appending installation info to $(INSTALLARCHLIB)/perllocal.pod

pure__install : pure_site_install
	@echo INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

doc__install : doc_site_install
	@echo INSTALLDIRS not defined, defaulting to INSTALLDIRS=site

pure_perl_install ::
	@$(MOD_INSTALL) \
		read $(PERL_ARCHLIB)\auto\$(FULLEXT)\.packlist \
		write $(INSTALLARCHLIB)\auto\$(FULLEXT)\.packlist \
		$(INST_LIB) $(INSTALLPRIVLIB) \
		$(INST_ARCHLIB) $(INSTALLARCHLIB) \
		$(INST_BIN) $(INSTALLBIN) \
		$(INST_SCRIPT) $(INSTALLSCRIPT) \
		$(INST_MAN1DIR) $(INSTALLMAN1DIR) \
		$(INST_MAN3DIR) $(INSTALLMAN3DIR)
	@$(WARN_IF_OLD_PACKLIST) \
		$(SITEARCHEXP)\auto\$(FULLEXT)


pure_site_install ::
	@$(MOD_INSTALL) \
		read $(SITEARCHEXP)\auto\$(FULLEXT)\.packlist \
		write $(INSTALLSITEARCH)\auto\$(FULLEXT)\.packlist \
		$(INST_LIB) $(INSTALLSITELIB) \
		$(INST_ARCHLIB) $(INSTALLSITEARCH) \
		$(INST_BIN) $(INSTALLSITEBIN) \
		$(INST_SCRIPT) $(INSTALLSCRIPT) \
		$(INST_MAN1DIR) $(INSTALLSITEMAN1DIR) \
		$(INST_MAN3DIR) $(INSTALLSITEMAN3DIR)
	@$(WARN_IF_OLD_PACKLIST) \
		$(PERL_ARCHLIB)\auto\$(FULLEXT)

pure_vendor_install ::
	@$(MOD_INSTALL) \
		$(INST_LIB) $(INSTALLVENDORLIB) \
		$(INST_ARCHLIB) $(INSTALLVENDORARCH) \
		$(INST_BIN) $(INSTALLVENDORBIN) \
		$(INST_SCRIPT) $(INSTALLSCRIPT) \
		$(INST_MAN1DIR) $(INSTALLVENDORMAN1DIR) \
		$(INST_MAN3DIR) $(INSTALLVENDORMAN3DIR)

doc_perl_install ::
	-@$(MKPATH) $(INSTALLARCHLIB)
	-@$(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLPRIVLIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(INSTALLARCHLIB)\perllocal.pod

doc_site_install ::
	-@$(MKPATH) $(INSTALLARCHLIB)
	-@$(DOC_INSTALL) \
		"Module" "$(NAME)" \
		"installed into" "$(INSTALLSITELIB)" \
		LINKTYPE "$(LINKTYPE)" \
		VERSION "$(VERSION)" \
		EXE_FILES "$(EXE_FILES)" \
		>> $(INSTALLSITEARCH)\perllocal.pod

doc_vendor_install ::


uninstall :: uninstall_from_$(INSTALLDIRS)dirs

uninstall_from_perldirs ::
	@$(UNINSTALL) $(PERL_ARCHLIB)\auto\$(FULLEXT)\.packlist

uninstall_from_sitedirs ::
	@$(UNINSTALL) $(SITEARCHEXP)\auto\$(FULLEXT)\.packlist


# --- MakeMaker force section:
# Phony target to force checking subdirectories.
FORCE:
	@$(NOOP)


# --- MakeMaker perldepend section:

PERL_HDRS = \
	$(PERL_INC)/EXTERN.h		\
	$(PERL_INC)/INTERN.h		\
	$(PERL_INC)/XSUB.h		\
	$(PERL_INC)/av.h		\
	$(PERL_INC)/cc_runtime.h	\
	$(PERL_INC)/config.h		\
	$(PERL_INC)/cop.h		\
	$(PERL_INC)/cv.h		\
	$(PERL_INC)/dosish.h		\
	$(PERL_INC)/embed.h		\
	$(PERL_INC)/embedvar.h		\
	$(PERL_INC)/fakethr.h		\
	$(PERL_INC)/form.h		\
	$(PERL_INC)/gv.h		\
	$(PERL_INC)/handy.h		\
	$(PERL_INC)/hv.h		\
	$(PERL_INC)/intrpvar.h		\
	$(PERL_INC)/iperlsys.h		\
	$(PERL_INC)/keywords.h		\
	$(PERL_INC)/mg.h		\
	$(PERL_INC)/nostdio.h		\
	$(PERL_INC)/op.h		\
	$(PERL_INC)/opcode.h		\
	$(PERL_INC)/opnames.h		\
	$(PERL_INC)/patchlevel.h	\
	$(PERL_INC)/perl.h		\
	$(PERL_INC)/perlapi.h		\
	$(PERL_INC)/perlio.h		\
	$(PERL_INC)/perlsdio.h		\
	$(PERL_INC)/perlsfio.h		\
	$(PERL_INC)/perlvars.h		\
	$(PERL_INC)/perly.h		\
	$(PERL_INC)/pp.h		\
	$(PERL_INC)/pp_proto.h		\
	$(PERL_INC)/proto.h		\
	$(PERL_INC)/regcomp.h		\
	$(PERL_INC)/regexp.h		\
	$(PERL_INC)/regnodes.h		\
	$(PERL_INC)/scope.h		\
	$(PERL_INC)/sv.h		\
	$(PERL_INC)/thrdvar.h		\
	$(PERL_INC)/thread.h		\
	$(PERL_INC)/unixish.h		\
	$(PERL_INC)/utf8.h		\
	$(PERL_INC)/util.h		\
	$(PERL_INC)/warnings.h

$(OBJECT) : $(PERL_HDRS)

Perl.c DBI.c : $(XSUBPPDEPS)


# --- MakeMaker makefile section:

$(OBJECT) : $(FIRST_MAKEFILE)

# We take a very conservative approach here, but it\'s worth it.
# We move Makefile to Makefile.old here to avoid gnu make looping.
Makefile : Makefile.PL $(CONFIGDEP)
	@echo "Makefile out-of-date with respect to $?"
	@echo "Cleaning current config before rebuilding Makefile..."
	-@$(RM_F) Makefile.old
	-@$(MV) Makefile Makefile.old
	-$(MAKE) -f Makefile.old clean $(DEV_NULL) || $(NOOP)
	$(PERLRUN) Makefile.PL 
	@echo "==> Your Makefile has been rebuilt. <=="
	@echo "==> Please rerun the make command.  <=="
	false



# --- MakeMaker staticmake section:

# --- MakeMaker makeaperl section ---
MAP_TARGET    = perl
FULLPERL      = C:\Perl\bin\perl.exe

$(MAP_TARGET) :: static $(MAKE_APERL_FILE)
	$(MAKE) -f $(MAKE_APERL_FILE) $@

$(MAKE_APERL_FILE) : $(FIRST_MAKEFILE)
	@echo Writing \"$(MAKE_APERL_FILE)\" for this $(MAP_TARGET)
	@$(PERLRUNINST) \
		Makefile.PL DIR= \
		MAKEFILE=$(MAKE_APERL_FILE) LINKTYPE=static \
		MAKEAPERL=1 NORECURS=1 CCCDLFLAGS=


# --- MakeMaker test section:

TEST_VERBOSE=0
TEST_TYPE=test_$(LINKTYPE)
TEST_FILE = test.pl
TEST_FILES = t\01basics.t t\02dbidrv.t t\03handle.t t\04mods.t t\05thrclone.t t\06attrs.t t\07kids.t t\08keeperr.t t\10examp.t t\15array.t t\20meta.t t\30subclass.t t\40profile.t t\41prof_dump.t t\42prof_data.t t\60preparse.t t\80proxy.t t\zz_01basics_pp.t t\zz_02dbidrv_pp.t t\zz_03handle_pp.t t\zz_04mods_pp.t t\zz_05thrclone_pp.t t\zz_06attrs_pp.t t\zz_07kids_pp.t t\zz_08keeperr_pp.t t\zz_10examp_pp.t t\zz_15array_pp.t t\zz_20meta_pp.t t\zz_30subclass_pp.t t\zz_40profile_pp.t t\zz_41prof_dump_pp.t t\zz_42prof_data_pp.t t\zz_60preparse_pp.t t\zz_80proxy_pp.t
TESTDB_SW = -d

testdb :: testdb_$(LINKTYPE)

test :: $(TEST_TYPE)

test_dynamic :: pure_all
	$(FULLPERLRUN) "-MExtUtils::Command::MM" "-e" "test_harness($(TEST_VERBOSE), '$(INST_LIB)', '$(INST_ARCHLIB)')" $(TEST_FILES)
	$(FULLPERLRUN) "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)

testdb_dynamic :: pure_all
	$(FULLPERLRUN) $(TESTDB_SW) "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)

test_ : test_dynamic

test_static :: pure_all $(MAP_TARGET)
	./$(MAP_TARGET) "-MExtUtils::Command::MM" "-e" "test_harness($(TEST_VERBOSE), '$(INST_LIB)', '$(INST_ARCHLIB)')" $(TEST_FILES)
	./$(MAP_TARGET) "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)

testdb_static :: pure_all $(MAP_TARGET)
	./$(MAP_TARGET) $(TESTDB_SW) "-I$(INST_LIB)" "-I$(INST_ARCHLIB)" $(TEST_FILE)



# --- MakeMaker ppd section:
# Creates a PPD (Perl Package Description) for a binary distribution.
ppd:
	@$(PERL) -e "print qq{<SOFTPKG NAME=\"$(DISTNAME)\" VERSION=\"1,37,0,0\">\n\t<TITLE>$(DISTNAME)</TITLE>\n\t<ABSTRACT></ABSTRACT>\n\t<AUTHOR></AUTHOR>\n}" > $(DISTNAME).ppd
	@$(PERL) -e "print qq{\t<IMPLEMENTATION>\n}" >> $(DISTNAME).ppd
	@$(PERL) -e "print qq{\t\t<OS NAME=\"$(OSNAME)\" />\n\t\t<ARCHITECTURE NAME=\"MSWin32-x86-multi-thread-5.8\" />\n\t\t<CODEBASE HREF=\"\" />\n\t</IMPLEMENTATION>\n</SOFTPKG>\n}" >> $(DISTNAME).ppd

# --- MakeMaker pm_to_blib section:

pm_to_blib: $(TO_INST_PM)
	@$(PERLRUNINST) -MExtUtils::Install \
        -e "pm_to_blib(qw[ <<pmfiles.dat ],'$(INST_LIB)\auto','$(PM_FILTER)')"

$(PM_TO_BLIB)
<<
		@$(TOUCH) $@


# --- MakeMaker selfdocument section:


# --- MakeMaker postamble section:


# End.
