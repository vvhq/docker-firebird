#!/bin/bash

if [ -n "${FIREBIRD_PASSWORD}" ]
then
  if [ -f /etc/firebird/${FIREBIRD_VERSION}/SYSDBA.password ]
  then
    source /etc/firebird/${FIREBIRD_VERSION}/SYSDBA.password
    gsec -user "${ISC_USER}" -password "${ISC_PASSWORD}" -modify sysdba -pw ${FIREBIRD_PASSWORD}
    sed -ri 's/ISC_PASSWORD="[^"]+"/ISC_PASSWORD="'${FIREBIRD_PASSWORD}'"/g' /etc/firebird/${FIREBIRD_VERSION}/SYSDBA.password
  else
    gsec -user sysdba -password masterkey -modify sysdba -pw "${FIREBIRD_PASSWORD}"
    echo "ISC_USER=sysdba" > /etc/firebird/${FIREBIRD_VERSION}/SYSDBA.password
    echo "ISC_PASSWORD=\"${FIREBIRD_PASSWORD}\"" >> /etc/firebird/${FIREBIRD_VERSION}/SYSDBA.password
  fi
fi


/usr/sbin/fbguard
