*** Variables ***

${URLCAVALIDE}          http://credit-auto.qsiconseil.ma/
${URLCAINVALIDE}        http://credit-auto.qsiconseil
${URLCAINDEXVALIDE}     http://credit-auto.qsiconseil.ma/index
${BROWSER_CHROME}       chrome

# Page index
${INDEX_TXT_VOUSETES}           L'Administrateur de Crédit Auto
${INDEX_TITRE}                  Crédit Auto | QSI Conseil
${BIENVENUE}           Bienvenue

# credentials Administrateur
${USERNAME_A}           acd
${PASSWORD_A}           acial!acd2018
${USERNAME_A_INV}       acdd

# credentials Responsable
${USERNAME_R}     rcd
${PASSWORD_R}     acial!rcd2018

# credentials LCD
${USERNAME_L}     lcd
${PASSWORD_L}     acial!acd2018

# credentials GCD
${USERNAME_G}     gcd
${PASSWORD_G}     acial!gcd2018


&{ident1}   user=acd    pswd=acial!acd2018
&{ident2}   user=rcd    pswd=acial!rcd2018
&{ident3}   user=lcd    pswd=acial!acd2018
&{ident4}   user=gcd    pswd=acial!gcd2018
@{list_ident_Ok}    &{ident1}   &{ident2}   &{ident3}   &{ident4}

&{ident5}   user=acd    pswd=gcd
&{ident6}   user=rcd    pswd=gcd
&{ident7}   user=lcd    pswd=gcd
&{ident8}   user=gcd    pswd=gcd
@{list_ident_Ko}    &{ident5}   &{ident6}   &{ident7}     &{ident8}

*** Keywords ***