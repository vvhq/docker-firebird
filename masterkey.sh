#!/bin/bash

if [ -f /etc/firebird/${FIREBIRD_VERSION}/SYSDBA.password ]
then
  source /etc/firebird/${FIREBIRD_VERSION}/SYSDBA.password
  gsec -user "${ISC_USER}" -password "${ISC_PASSWORD}" -modify sysdba -pw masterkey
  sed -ri 's/ISC_PASSWORD="[^"]+"/ISC_PASSWORD="masterkey"/g' /etc/firebird/${FIREBIRD_VERSION}/SYSDBA.password
fi
