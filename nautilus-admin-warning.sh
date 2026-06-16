#!/bin/bash

zenity --question \
  --title="ATENCION - Permisos de Administrador" \
  --text=''<span foreground="#CC0000" size="xx-large" weight="bold">/!\\  ATENCION  /!\\</span>''
'
<span foreground="#CC0000" size="large" weight="bold">━━━━━━━━━━━━━━━━━━━━━━</span>'
'
<span foreground="#333333" size="large">Esta a punto de abrir el Explorador de Archivos con</span>'
<span foreground="#FF6600" size="large" weight="bold">PERMISOS DE ADMINISTRADOR</span>'
'
<span foreground="#333333">Cualquier archivo que</span> <span foreground="#CC0000" weight="bold">elimine, modifique o sobrescriba</span>'
<span foreground="#333333">podria</span> <span foreground="#CC0000" weight="bold" size="large">DANAR</span> <span foreground="#333333">el sistema o los programas instalados.</span>'
'
<span foreground="#990000" weight="bold" size="large"> ¿ Esta COMPLETAMENTE SEGURO de que desea continuar ? </span>' \
  --ok-label="ACEPTAR" \
  --cancel-label="CANCELAR" \
  --width=500 \
  --height=350

if [ $? -eq 0 ]; then
    pkexec nautilus "$@"
else
    exit 0
fi
