/*
 * This file was generated automatically by xsubpp version 1.9508 from the
 * contents of FormalInput.xs. Do not edit this file, edit FormalInput.xs instead.
 *
 *	ANY CHANGES MADE HERE WILL BE LOST!
 *
 */

#line 1 "FormalInput.xs"
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include <parser.h>

#include "const-c.inc"

typedef struct parseError ParseError;

#line 23 "FormalInput.c"

/* INCLUDE:  Including 'const-xs.inc' from 'FormalInput.xs' */


XS(XS_FormalInput_constant); /* prototype to pass -Wmissing-prototypes */
XS(XS_FormalInput_constant)
{
    dXSARGS;
    if (items != 1)
	Perl_croak(aTHX_ "Usage: FormalInput::constant(sv)");
    SP -= items;
    {
#line 4 "const-xs.inc"
#ifdef dXSTARG
	dXSTARG; /* Faster if we have it.  */
#else
	dTARGET;
#endif
	STRLEN		len;
        int		type;
	/* IV		iv;	Uncomment this if you need to return IVs */
	/* NV		nv;	Uncomment this if you need to return NVs */
	/* const char	*pv;	Uncomment this if you need to return PVs */
#line 47 "FormalInput.c"
	SV *	sv = ST(0);
	const char *	s = SvPV(sv, len);
#line 18 "const-xs.inc"
	type = constant(aTHX_ s, len);
      /* Return 1 or 2 items. First is error message, or undef if no error.
           Second, if present, is found value */
        switch (type) {
        case PERL_constant_NOTFOUND:
          sv = sv_2mortal(newSVpvf("%s is not a valid FormalInput macro", s));
          PUSHs(sv);
          break;
        case PERL_constant_NOTDEF:
          sv = sv_2mortal(newSVpvf(
	    "Your vendor has not defined FormalInput macro %s, used", s));
          PUSHs(sv);
          break;
	/* Uncomment this if you need to return IVs
        case PERL_constant_ISIV:
          EXTEND(SP, 1);
          PUSHs(&PL_sv_undef);
          PUSHi(iv);
          break; */
	/* Uncomment this if you need to return NOs
        case PERL_constant_ISNO:
          EXTEND(SP, 1);
          PUSHs(&PL_sv_undef);
          PUSHs(&PL_sv_no);
          break; */
	/* Uncomment this if you need to return NVs
        case PERL_constant_ISNV:
          EXTEND(SP, 1);
          PUSHs(&PL_sv_undef);
          PUSHn(nv);
          break; */
	/* Uncomment this if you need to return PVs
        case PERL_constant_ISPV:
          EXTEND(SP, 1);
          PUSHs(&PL_sv_undef);
          PUSHp(pv, strlen(pv));
          break; */
	/* Uncomment this if you need to return PVNs
        case PERL_constant_ISPVN:
          EXTEND(SP, 1);
          PUSHs(&PL_sv_undef);
          PUSHp(pv, iv);
          break; */
	/* Uncomment this if you need to return SVs
        case PERL_constant_ISSV:
          EXTEND(SP, 1);
          PUSHs(&PL_sv_undef);
          PUSHs(sv);
          break; */
	/* Uncomment this if you need to return UNDEFs
        case PERL_constant_ISUNDEF:
          break; */
	/* Uncomment this if you need to return UVs
        case PERL_constant_ISUV:
          EXTEND(SP, 1);
          PUSHs(&PL_sv_undef);
          PUSHu((UV)iv);
          break; */
	/* Uncomment this if you need to return YESs
        case PERL_constant_ISYES:
          EXTEND(SP, 1);
          PUSHs(&PL_sv_undef);
          PUSHs(&PL_sv_yes);
          break; */
        default:
          sv = sv_2mortal(newSVpvf(
	    "Unexpected return type %d while processing FormalInput macro %s, used",
               type, s));
          PUSHs(sv);
        }
#line 121 "FormalInput.c"
	PUTBACK;
	return;
    }
}


/* INCLUDE: Returning to 'FormalInput.xs' from 'const-xs.inc' */


XS(XS_FormalInput_parserValidate); /* prototype to pass -Wmissing-prototypes */
XS(XS_FormalInput_parserValidate)
{
    dXSARGS;
    if (items != 1)
	Perl_croak(aTHX_ "Usage: FormalInput::parserValidate(buf)");
    {
	const char*	buf = (const char *)SvPV_nolen(ST(0));
	ParseError *	RETVAL;

	RETVAL = parserValidate(buf);
	ST(0) = sv_newmortal();
	sv_setref_pv(ST(0), "ParseErrorPtr", (void*)RETVAL);
    }
    XSRETURN(1);
}


XS(XS_FormalInput_errorMessageByCode); /* prototype to pass -Wmissing-prototypes */
XS(XS_FormalInput_errorMessageByCode)
{
    dXSARGS;
    if (items != 1)
	Perl_croak(aTHX_ "Usage: FormalInput::errorMessageByCode(errCode)");
    {
	int	errCode = (int)SvIV(ST(0));
	const char *	RETVAL;
	dXSTARG;

	RETVAL = errorMessageByCode(errCode);
	sv_setpv(TARG, RETVAL); XSprePUSH; PUSHTARG;
    }
    XSRETURN(1);
}


XS(XS_FormalInput_getErrCode); /* prototype to pass -Wmissing-prototypes */
XS(XS_FormalInput_getErrCode)
{
    dXSARGS;
    if (items != 1)
	Perl_croak(aTHX_ "Usage: FormalInput::getErrCode(a)");
    {
	ParseError*	a;
	int	RETVAL;
	dXSTARG;

	if (sv_derived_from(ST(0), "ParseErrorPtr")) {
	    IV tmp = SvIV((SV*)SvRV(ST(0)));
	    a = INT2PTR(ParseError *,tmp);
	}
	else
	    Perl_croak(aTHX_ "a is not of type ParseErrorPtr");

	RETVAL = getErrCode(a);
	XSprePUSH; PUSHi((IV)RETVAL);
    }
    XSRETURN(1);
}


XS(XS_FormalInput_getErrLine); /* prototype to pass -Wmissing-prototypes */
XS(XS_FormalInput_getErrLine)
{
    dXSARGS;
    if (items != 1)
	Perl_croak(aTHX_ "Usage: FormalInput::getErrLine(a)");
    {
	ParseError*	a;
	size_t	RETVAL;
	dXSTARG;

	if (sv_derived_from(ST(0), "ParseErrorPtr")) {
	    IV tmp = SvIV((SV*)SvRV(ST(0)));
	    a = INT2PTR(ParseError *,tmp);
	}
	else
	    Perl_croak(aTHX_ "a is not of type ParseErrorPtr");

	RETVAL = getErrLine(a);
	XSprePUSH; PUSHu((UV)RETVAL);
    }
    XSRETURN(1);
}


XS(XS_FormalInput_getErrPos); /* prototype to pass -Wmissing-prototypes */
XS(XS_FormalInput_getErrPos)
{
    dXSARGS;
    if (items != 1)
	Perl_croak(aTHX_ "Usage: FormalInput::getErrPos(a)");
    {
	ParseError*	a;
	size_t	RETVAL;
	dXSTARG;

	if (sv_derived_from(ST(0), "ParseErrorPtr")) {
	    IV tmp = SvIV((SV*)SvRV(ST(0)));
	    a = INT2PTR(ParseError *,tmp);
	}
	else
	    Perl_croak(aTHX_ "a is not of type ParseErrorPtr");

	RETVAL = getErrPos(a);
	XSprePUSH; PUSHu((UV)RETVAL);
    }
    XSRETURN(1);
}

#ifdef __cplusplus
extern "C"
#endif
XS(boot_FormalInput); /* prototype to pass -Wmissing-prototypes */
XS(boot_FormalInput)
{
    dXSARGS;
    char* file = __FILE__;

    XS_VERSION_BOOTCHECK ;

        newXS("FormalInput::constant", XS_FormalInput_constant, file);
        newXS("FormalInput::parserValidate", XS_FormalInput_parserValidate, file);
        newXS("FormalInput::errorMessageByCode", XS_FormalInput_errorMessageByCode, file);
        newXS("FormalInput::getErrCode", XS_FormalInput_getErrCode, file);
        newXS("FormalInput::getErrLine", XS_FormalInput_getErrLine, file);
        newXS("FormalInput::getErrPos", XS_FormalInput_getErrPos, file);
    XSRETURN_YES;
}
