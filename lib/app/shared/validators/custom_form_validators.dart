import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/core/utils/number_utils.dart';

class CustomFormValidators {
  static FormFieldValidator checkMatch(
    GlobalKey<FormFieldState> otherFieldState, {
    String errorText,
  }) {
    return (valueCandidate) {
      if (otherFieldState == null) {
        throw 'otherFieldState is null';
      }
      if (valueCandidate != null && valueCandidate != otherFieldState.currentState.value) {
        return errorText ?? "Value doesn't match the other field";
      }
      return null;
    };
  }

  static FormFieldValidator validDomain() {
    return (valueCandidate) {
      final String domain = valueCandidate.toString().split('@')[1];
      final bool isInvalidDomain = _unauthorizedDomain.contains(domain);
      return isInvalidDomain ? translate(Keys.Forms_Error_Unauthorizedomain) : null;
    };
  }

  /// Check if the string contains space, dash or alphanum characters
  static FormFieldValidator validAlphaNum({String errorText}) {
    return FormBuilderValidators.pattern('^[a-zA-Z\-\ ]*\$', errorText: errorText);
  }

  /// Check if the string is a valid sponsor code
  static FormFieldValidator validAffiliateCode({String errorText}) {
    return FormBuilderValidators.pattern('^[a-zA-Z0-9]{6}\$', errorText: errorText);
  }

  /// Check if user is major
  static FormFieldValidator isMajor() {
    return (valueCandidate) {
      if (valueCandidate == null) {
        return null;
      }
      DateTime selected = DateTime.parse(valueCandidate.toString());
      DateTime limit = DateTime.now().subtract(Duration(days: 18 * 365));
      return selected.millisecondsSinceEpoch > limit.millisecondsSinceEpoch
          ? translate(Keys.Forms_Error_Birthdate)
          : null;
    };
  }

  //  Given a country code, apply the correct postal regexp
  static FormFieldValidator postalCode(
    String countryCode, {
    String errorText,
  }) {
    var regexp = _countryPostalCodeRegexp[countryCode];
    if (regexp == null) {
      throw 'Unknown countryCode value';
    }
    return FormBuilderValidators.pattern(regexp, errorText: errorText);
  }

  static FormFieldValidator nonNumeric() {
    return FormBuilderValidators.pattern(
      "^[a-zA-Z -]+\$",
      errorText: translate(Keys.Forms_Error_Pattern),
    );
  }

  static FormFieldValidator isIntOrDouble({String errorText}) {
    // ignore: missing_return
    return (value) {
      if (!NumberUtils.isNumeric(value)) {
        return errorText;
      }
    };
  }

  static FormFieldValidator isInt({String errorText}) {
    // ignore: missing_return
    return (value) {
      if (!NumberUtils.isInteger(value)) {
        return errorText;
      }
    };
  }
}

final Map<String, String> _countryPostalCodeRegexp = {
  'AD': '^(?:AD)*(\\d{3})\$',
  'AM': '^(\\d{6})\$',
  'AR': '^([A-Z]\\d{4}[A-Z]{3})\$',
  'AT': '^(\\d{4})\$',
  'AU': '^(\\d{4})\$',
  'AX': '^(?:FI)*(\\d{5})\$',
  'AZ': '^(?:AZ)*(\\d{4})\$',
  'BA': '^(\\d{5})\$',
  'BB': '^(?:BB)*(\\d{5})\$',
  'BD': '^(\\d{4})\$',
  'BE': '^(\\d{4})\$',
  'BG': '^(\\d{4})\$',
  'BH': '^(\\d{3}\\d?)\$',
  'BM': '^([A-Z]{2}\\d{2})\$',
  'BN': '^([A-Z]{2}\\d{4})\$',
  'BR': '^(\\d{8})\$',
  'BY': '^(\\d{6})\$',
  'CA': '^([ABCEGHJKLMNPRSTVXY]\\d[ABCEGHJKLMNPRSTVWXYZ]) ?(\\d[ABCEGHJKLMNPRSTVWXYZ]\\d)\$',
  'CH': '^(\\d{4})\$',
  'CL': '^(\\d{7})\$',
  'CN': '^(\\d{6})\$',
  'CR': '^(\\d{4})\$',
  'CS': '^(\\d{5})\$',
  'CU': '^(?:CP)*(\\d{5})\$',
  'CV': '^(\\d{4})\$',
  'CX': '^(\\d{4})\$',
  'CY': '^(\\d{4})\$',
  'CZ': '^(\\d{5})\$',
  'DE': '^(\\d{5})\$',
  'DK': '^(\\d{4})\$',
  'DO': '^(\\d{5})\$',
  'DZ': '^(\\d{5})\$',
  'EC': '^([a-zA-Z]\\d{4}[a-zA-Z])\$',
  'EE': '^(\\d{5})\$',
  'EG': '^(\\d{5})\$',
  'ES': '^(\\d{5})\$',
  'ET': '^(\\d{4})\$',
  'FI': '^(?:FI)*(\\d{5})\$',
  'FM': '^(\\d{5})\$',
  'FO': '^(?:FO)*(\\d{3})\$',
  'FR': '^(\\d{5})\$',
  'GB':
      '^(([A-Z]\\d{2}[A-Z]{2})|([A-Z]\\d{3}[A-Z]{2})|([A-Z]{2}\\d{2}[A-Z]{2})|([A-Z]{2}\\d{3}[A-Z]{2})|([A-Z]\\d[A-Z]\\d[A-Z]{2})|([A-Z]{2}\\d[A-Z]\\d[A-Z]{2})|(GIR0AA))\$',
  'GE': '^(\\d{4})\$',
  'GF': '^((97|98)3\\d{2})\$',
  'GG':
      '^(([A-Z]\\d{2}[A-Z]{2})|([A-Z]\\d{3}[A-Z]{2})|([A-Z]{2}\\d{2}[A-Z]{2})|([A-Z]{2}\\d{3}[A-Z]{2})|([A-Z]\\d[A-Z]\\d[A-Z]{2})|([A-Z]{2}\\d[A-Z]\\d[A-Z]{2})|(GIR0AA))\$',
  'GL': '^(\\d{4})\$',
  'GP': '^((97|98)\\d{3})\$',
  'GR': '^(\\d{5})\$',
  'GT': '^(\\d{5})\$',
  'GU': '^(969\\d{2})\$',
  'GW': '^(\\d{4})\$',
  'HN': '^([A-Z]{2}\\d{4})\$',
  'HR': '^(?:HR)*(\\d{5})\$',
  'HT': '^(?:HT)*(\\d{4})\$',
  'HU': '^(\\d{4})\$',
  'ID': '^(\\d{5})\$',
  'IL': '^(\\d{5})\$',
  'IM':
      '^(([A-Z]\\d{2}[A-Z]{2})|([A-Z]\\d{3}[A-Z]{2})|([A-Z]{2}\\d{2}[A-Z]{2})|([A-Z]{2}\\d{3}[A-Z]{2})|([A-Z]\\d[A-Z]\\d[A-Z]{2})|([A-Z]{2}\\d[A-Z]\\d[A-Z]{2})|(GIR0AA))\$',
  'IN': '^(\\d{6})\$',
  'IQ': '^(\\d{5})\$',
  'IR': '^(\\d{10})\$',
  'IS': '^(\\d{3})\$',
  'IT': '^(\\d{5})\$',
  'JE':
      '^(([A-Z]\\d{2}[A-Z]{2})|([A-Z]\\d{3}[A-Z]{2})|([A-Z]{2}\\d{2}[A-Z]{2})|([A-Z]{2}\\d{3}[A-Z]{2})|([A-Z]\\d[A-Z]\\d[A-Z]{2})|([A-Z]{2}\\d[A-Z]\\d[A-Z]{2})|(GIR0AA))\$',
  'JO': '^(\\d{5})\$',
  'JP': '^(\\d{7})\$',
  'KE': '^(\\d{5})\$',
  'KG': '^(\\d{6})\$',
  'KH': '^(\\d{5})\$',
  'KP': '^(\\d{6})\$',
  'KR': '^(?:SEOUL)*(\\d{6})\$',
  'KW': '^(\\d{5})\$',
  'KZ': '^(\\d{6})\$',
  'LA': '^(\\d{5})\$',
  'LB': '^(\\d{4}(\\d{4})?)\$',
  'LI': '^(\\d{4})\$',
  'LK': '^(\\d{5})\$',
  'LR': '^(\\d{4})\$',
  'LS': '^(\\d{3})\$',
  'LT': '^(?:LT)*(\\d{5})\$',
  'LU': '^(\\d{4})\$',
  'LV': '^(?:LV)*(\\d{4})\$',
  'MA': '^(\\d{5})\$',
  'MC': '^(\\d{5})\$',
  'MD': '^(?:MD)*(\\d{4})\$',
  'ME': '^(\\d{5})\$',
  'MG': '^(\\d{3})\$',
  'MK': '^(\\d{4})\$',
  'MM': '^(\\d{5})\$',
  'MN': '^(\\d{6})\$',
  'MQ': '^(\\d{5})\$',
  'MT': '^([A-Z]{3}\\d{2}\\d?)\$',
  'MV': '^(\\d{5})\$',
  'MX': '^(\\d{5})\$',
  'MY': '^(\\d{5})\$',
  'MZ': '^(\\d{4})\$',
  'NC': '^(\\d{5})\$',
  'NE': '^(\\d{4})\$',
  'NF': '^(\\d{4})\$',
  'NG': '^(\\d{6})\$',
  'NI': '^(\\d{7})\$',
  'NL': '^(\\d{4}[A-Z]{2})\$',
  'NO': '^(\\d{4})\$',
  'NP': '^(\\d{5})\$',
  'NZ': '^(\\d{4})\$',
  'OM': '^(\\d{3})\$',
  'PF': '^((97|98)7\\d{2})\$',
  'PG': '^(\\d{3})\$',
  'PH': '^(\\d{4})\$',
  'PK': '^(\\d{5})\$',
  'PL': '^(\\d{5})\$',
  'PM': '^(97500)\$',
  'PR': '^(\\d{9})\$',
  'PT': '^(\\d{7})\$',
  'PW': '^(96940)\$',
  'PY': '^(\\d{4})\$',
  'RE': '^((97|98)(4|7|8)\\d{2})\$',
  'RO': '^(\\d{6})\$',
  'RS': '^(\\d{6})\$',
  'RU': '^(\\d{6})\$',
  'SA': '^(\\d{5})\$',
  'SD': '^(\\d{5})\$',
  'SE': '^(?:SE)*(\\d{5})\$',
  'SG': '^(\\d{6})\$',
  'SH': '^(STHL1ZZ)\$',
  'SI': '^(?:SI)*(\\d{4})\$',
  'SK': '^(\\d{5})\$',
  'SM': '^(4789\\d)\$',
  'SN': '^(\\d{5})\$',
  'SO': '^([A-Z]{2}\\d{5})\$',
  'SV': '^(?:CP)*(\\d{4})\$',
  'SZ': '^([A-Z]\\d{3})\$',
  'TC': '^(TKCA 1ZZ)\$',
  'TH': '^(\\d{5})\$',
  'TJ': '^(\\d{6})\$',
  'TM': '^(\\d{6})\$',
  'TN': '^(\\d{4})\$',
  'TR': '^(\\d{5})\$',
  'TW': '^(\\d{5})\$',
  'UA': '^(\\d{5})\$',
  'US': '^\\d{5}(-\\d{4})?\$',
  'UY': '^(\\d{5})\$',
  'UZ': '^(\\d{6})\$',
  'VA': '^(\\d{5})\$',
  'VE': '^(\\d{4})\$',
  'VI': '^\\d{5}(-\\d{4})?\$',
  'VN': '^(\\d{6})\$',
  'WF': '^(986\\d{2})\$',
  'YT': '^(\\d{5})\$',
  'ZA': '^(\\d{4})\$',
  'ZM': '^(\\d{5})\$'
};

final List _unauthorizedDomain = [
  '0815.ru0clickemail.com',
  '0-mail.com',
  '0wnd.net',
  '0wnd.org',
  '10minutemail.com',
  '20minutemail.com',
  '2prong.com',
  '3d-painting.com',
  '4warding.com',
  '4warding.net',
  '4warding.org',
  '9ox.net',
  'a-bc.net',
  'ag.us.to',
  'amilegit.com',
  'anonbox.net',
  'anonymbox.com',
  'antichef.com',
  'antichef.net',
  'antispam.de',
  'baxomale.ht.cx',
  'beefmilk.com',
  'binkmail.com',
  'bio-muesli.net',
  'bobmail.info',
  'bodhi.lawlita.com',
  'bofthew.com',
  'brefmail.com',
  'bsnow.net',
  'bugmenot.com',
  'bumpymail.com',
  'casualdx.com',
  'chogmail.com',
  'cool.fr.nf',
  'correo.blogos.net',
  'cosmorph.com',
  'courriel.fr.nf',
  'courrieltemporaire.com',
  'curryworld.de',
  'cust.in',
  'dacoolest.com',
  'dandikmail.com',
  'deadaddress.com',
  'despam.it',
  'despam.it',
  'devnullmail.com',
  'dfgh.net',
  'digitalsanctuary.com',
  'discardmail.com',
  'discardmail.de',
  'disposableaddress.com',
  'disposeamail.com',
  'disposemail.com',
  'dispostable.com',
  'dm.w3internet.co.ukexample.com',
  'dodgeit.com',
  'dodgit.com',
  'dodgit.org',
  'dontreg.com',
  'dontsendmespam.de',
  'dump-email.info',
  'dumpyemail.com',
  'e4ward.com',
  'email60.com',
  'emailias.com',
  'emailias.com',
  'emailinfive.com',
  'emailmiser.com',
  'emailtemporario.com.br',
  'emailwarden.com',
  'enterto.com',
  'ephemail.net',
  'explodemail.com',
  'fakeinbox.com',
  'fakeinformation.com',
  'fansworldwide.de',
  'fastacura.com',
  'filzmail.com',
  'fixmail.tk',
  'fizmail.com',
  'frapmail.com',
  'garliclife.com',
  'gelitik.in',
  'get1mail.com',
  'getonemail.com',
  'getonemail.net',
  'girlsundertheinfluence.com',
  'gishpuppy.com',
  'goemailgo.com',
  'great-host.in',
  'greensloth.com',
  'greensloth.com',
  'gsrv.co.uk',
  'guerillamail.biz',
  'guerillamail.com',
  'guerillamail.net',
  'guerillamail.org',
  'guerrillamail.biz',
  'guerrillamail.com',
  'guerrillamail.de',
  'guerrillamail.net',
  'guerrillamail.org',
  'guerrillamailblock.com',
  'haltospam.com',
  'hidzz.com',
  'hotpop.com',
  'ieatspam.eu',
  'ieatspam.info',
  'ihateyoualot.info',
  'imails.info',
  'inboxclean.com',
  'inboxclean.org',
  'incognitomail.com',
  'incognitomail.net',
  'ipoo.org',
  'irish2me.com',
  'jetable.com',
  'jetable.fr.nf',
  'jetable.net',
  'jetable.org',
  'jnxjn.com',
  'junk1e.com',
  'kasmail.com',
  'kaspop.com',
  'klzlk.com',
  'kulturbetrieb.info',
  'kurzepost.de',
  'kurzepost.de',
  'lifebyfood.com',
  'link2mail.net',
  'litedrop.com',
  'lookugly.com',
  'lopl.co.cc',
  'lr78.com',
  'maboard.com',
  'mail.by',
  'mail.mezimages.net',
  'mail4trash.com',
  'mailbidon.com',
  'mailcatch.com',
  'maileater.com',
  'mailexpire.com',
  'mailin8r.com',
  'mailinator.com',
  'mailinator.net',
  'mailinator2.com',
  'mailincubator.com',
  'mailme.lv',
  'mailmetrash.com',
  'mailmoat.com',
  'mailnator.com',
  'mailnull.com',
  'mailzilla.org',
  'mbx.cc',
  'mega.zik.dj',
  'meltmail.com',
  'mierdamail.com',
  'mintemail.com',
  'mjukglass.nu',
  'mobi.web.id',
  'moburl.com',
  'moncourrier.fr.nf',
  'monemail.fr.nf',
  'monmail.fr.nf',
  'mt2009.com',
  'mx0.wwwnew.eu',
  'mycleaninbox.net',
  'myspamless.com',
  'mytempemail.com',
  'mytrashmail.com',
  'netmails.net',
  'neverbox.com',
  'no-spam.ws',
  'nobulk.com',
  'noclickemail.com',
  'nogmailspam.info',
  'nomail.xl.cx',
  'nomail2me.com',
  'nospam.ze.tc',
  'nospam4.us',
  'nospamfor.us',
  'nowmymail.com',
  'objectmail.com',
  'obobbo.com',
  'odaymail.com',
  'onewaymail.com',
  'ordinaryamerican.net',
  'owlpic.com',
  'pookmail.com',
  'privymail.de',
  'proxymail.eu',
  'punkass.com',
  'putthisinyourspamdatabase.com',
  'quickinbox.com',
  'rcpt.at',
  'recode.me',
  'recursor.net',
  'regbypass.comsafe-mail.net',
  'safetymail.info',
  'sandelf.de',
  'saynotospams.com',
  'selfdestructingmail.com',
  'sendspamhere.com',
  'sharklasers.com',
  'shieldedmail.com',
  'shiftmail.com',
  'skeefmail.com',
  'slopsbox.com',
  'slushmail.com',
  'smaakt.naar.gravel',
  'smellfear.com',
  'snakemail.com',
  'sneakemail.com',
  'sofort-mail.de',
  'sogetthis.com',
  'soodonims.com',
  'spam.la',
  'spamavert.com',
  'spambob.net',
  'spambob.org',
  'spambog.com',
  'spambog.de',
  'spambog.ru',
  'spambox.info',
  'spambox.us',
  'spamcannon.com',
  'spamcannon.net',
  'spamcero.com',
  'spamcorptastic.com',
  'spamcowboy.com',
  'spamcowboy.net',
  'spamcowboy.org',
  'spamday.com',
  'spamex.com',
  'spamfree.eu',
  'spamfree24.com',
  'spamfree24.de',
  'spamfree24.eu',
  'spamfree24.info',
  'spamfree24.net',
  'spamfree24.org',
  'spamgourmet.com',
  'spamgourmet.net',
  'spamgourmet.org',
  'spamherelots.com',
  'spamhereplease.com',
  'spamhole.com',
  'spamify.com',
  'spaminator.de',
  'spamkill.info',
  'spaml.com',
  'spaml.de',
  'spammotel.com',
  'spamobox.com',
  'spamspot.com',
  'spamthis.co.uk',
  'spamthisplease.com',
  'speed.1s.fr',
  'suremail.info',
  'tempalias.com',
  'tempe-mail.com',
  'tempemail.biz',
  'tempemail.com',
  'tempemail.net',
  'tempinbox.co.uk',
  'tempinbox.com',
  'tempomail.fr',
  'temporaryemail.net',
  'temporaryinbox.com',
  'tempymail.com',
  'thankyou2010.com',
  'thisisnotmyrealemail.com',
  'throwawayemailaddress.com',
  'tilien.com',
  'tmailinator.com',
  'tradermail.info',
  'trash-amil.com',
  'trash-mail.at',
  'trash-mail.com',
  'trash-mail.de',
  'trash2009.com',
  'trashmail.at',
  'trashmail.com',
  'trashmail.me',
  'trashmail.net',
  'trashmailer.com',
  'trashymail.com',
  'trashymail.net',
  'trillianpro.com',
  'tyldd.com',
  'tyldd.com',
  'uggsrock.com',
  'wegwerfmail.de',
  'wegwerfmail.net',
  'wegwerfmail.org',
  'wh4f.org',
  'whyspam.me',
  'willselfdestruct.com',
  'winemaven.info',
  'wronghead.com',
  'wuzupmail.net',
  'xoxy.net',
  'yogamaven.com',
  'yopmail.com',
  'yopmail.fr',
  'yopmail.net',
  'yuurok.com',
  'zippymail.info',
  'zoemail.com'
];
