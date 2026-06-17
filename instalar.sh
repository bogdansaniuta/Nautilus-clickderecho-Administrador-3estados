#!/bin/bash
# Nautilus Admin Warning - Instalador automatico
# Autor: Bogdan (Zorin OS)
# Descripcion: Eliminar archivos como administrador con advertencia de seguridad

set -e

echo "=========================================="
echo "  Nautilus Admin Warning - Instalador"
echo "=========================================="
echo ""

if [ "$EUID" -ne 0 ]; then 
    echo "⚠️  Este script necesita permisos de administrador."
    echo "   Ejecuta: sudo ./install.sh"
    exit 1
fi

echo "📦 Verificando dependencias..."

if ! command -v zenity &> /dev/null; then
    echo "   Instalando zenity..."
    apt-get update && apt-get install -y zenity
fi

if ! dpkg -l | grep -q python3-nautilus; then
    echo "   Instalando python3-nautilus..."
    apt-get update && apt-get install -y python3-nautilus
fi

echo "✅ Dependencias listas."
echo ""

echo "📁 Instalando script de eliminacion..."
cp nautilus-admin-delete-ES.sh /usr/local/bin/nautilus-admin-delete.sh
chmod +x /usr/local/bin/nautilus-admin-delete.sh
echo "   ✅ /usr/local/bin/nautilus-admin-delete.sh"

echo "📁 Instalando extension de Nautilus..."
cp nautilus-admin-custom.py /usr/share/nautilus-python/extensions/
chmod 644 /usr/share/nautilus-python/extensions/nautilus-admin-custom.py
echo "   ✅ /usr/share/nautilus-python/extensions/nautilus-admin-custom.py"

if [ -f "/usr/share/nautilus-python/extensions/nautilus-admin.py" ]; then
    echo "🗑️  Desactivando extension original de nautilus-admin..."
    mv /usr/share/nautilus-python/extensions/nautilus-admin.py \
       /usr/share/nautilus-python/extensions/nautilus-admin.py.bak
fi

echo "🔄 Reiniciando Nautilus..."
rm -rf /usr/share/nautilus-python/extensions/__pycache__
sudo -u "$SUDO_USER" nautilus -q 2>/dev/null || true

echo ""
echo "=========================================="
echo "  ✅ Instalacion completada!"
echo "=========================================="
echo ""
echo "📋 Instrucciones de uso:"
echo "   1. Abre el Explorador de Archivos (Nautilus)"
echo "   2. Haz clic derecho en cualquier archivo"
echo "   3. Selecciona: 'Eliminar como administrador'"
echo "   4. Lee la advertencia y decide: ELIMINAR o CANCELAR"
echo "   5. Ingresa tu contraseña si se solicita"
echo ""
echo "⚠️  ADVERTENCIA: Use esta herramienta con precaucion."
echo "   Los archivos eliminados no se pueden recuperar."
echo ""
