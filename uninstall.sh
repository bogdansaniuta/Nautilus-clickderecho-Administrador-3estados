#!/bin/bash
# Nautilus Admin Warning - Desinstalador

set -e

if [ "$EUID" -ne 0 ]; then 
    echo "⚠️  Necesitas permisos de administrador."
    echo "   Ejecuta: sudo ./uninstall.sh"
    exit 1
fi

echo "🗑️  Desinstalando Nautilus Admin Warning..."

# Eliminar script
rm -f /usr/local/bin/nautilus-admin-warning.sh
echo "   ✅ Script eliminado"

# Eliminar extension
rm -f /usr/share/nautilus-python/extensions/nautilus-admin-custom.py
echo "   ✅ Extension eliminada"

# Restaurar extension original si existe
if [ -f "/usr/share/nautilus-python/extensions/nautilus-admin.py.bak" ]; then
    mv /usr/share/nautilus-python/extensions/nautilus-admin.py.bak \
       /usr/share/nautilus-python/extensions/nautilus-admin.py
    echo "   ✅ Extension original restaurada"
fi

# Limpiar cache
rm -rf /usr/share/nautilus-python/extensions/__pycache__

# Reiniciar Nautilus
sudo -u "$SUDO_USER" nautilus -q 2>/dev/null || true

echo ""
echo "✅ Desinstalacion completada."
