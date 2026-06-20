# 🛡️ Nautilus Clic Derecho Administrador (3-Way)

> Abrir y eliminar archivos como administrador directamente desde el menú contextual con diálogo de advertencia de seguridad.

![Ventana de Advertencia](Advertencias.png)



## 📋 Descripción

**Nautilus Clic Derecho Administrador (3-Way)** añade dos opciones al menú contextual de Nautilus:
- **"Abrir como Administrador"** — Abre archivos/carpetas con permisos de root
- **"Eliminar como Administrador"** — Elimina archivos del sistema permanentemente
- - **"Eliminar como Administrador"** - Elimina Multiples archivos del sistema permanentemente seleccionados con CTRL + Click 
- 

Al seleccionar, muestra un diálogo de advertencia visual (colores, iconos, texto en negrita) antes de ejecutar la acción.

### ✨ Características

- 📂 **Abrir como Administrador** — Abre carpetas con Nautilus o archivos con Mousepad como root
- 🗑️ **Eliminar como Administrador** — Elimina archivos protegidos directamente desde el menú contextual
- ⚠️ **Diálogo de advertencia visual** con colores e iconos de advertencia
- 🔒 **Botones de acción / CANCELAR** para confirmar
- 📁 **Funciona en cualquier archivo o carpeta** del sistema
- 🎨 **Interfaz atractiva** con texto formateado

## 🚀 Instalación Rápida

### Opción 1: Descargar ZIP
1. Descarga `Nautilus-clickderecho-Administrador-3estados.zip` desde Releases
2. Extrae el ZIP
3. Abre terminal en la carpeta extraída
4. Ejecuta:

```bash
sudo ./instalar.sh
Opción 2: Git Clone
bash
git clone https://github.com/bogdansaniuta/Nautilus-clickderecho-Administrador-3estados.git
cd Nautilus-clickderecho-Administrador-3estados
sudo ./instalar.sh
Requiere: Cerrar sesión y volver a entrar (o reiniciar Nautilus con nautilus -q) después de instalar.
📖 Cómo Usar
Abre el Explorador de Archivos (Nautilus)
Navega a cualquier carpeta con archivos protegidos
Haz clic derecho en el archivo o carpeta
Selecciona:
"Abrir como Administrador" para editar/ver con permisos de root
"Eliminar como Administrador" para eliminar permanentemente
Lee la advertencia y presiona el botón de acción o CANCELAR
Ingresa tu contraseña si se solicita
🖥️ Compatibilidad
Table
Distribución	Estado
Zorin OS	✅ Probado
Ubuntu	✅ Compatible
Linux Mint	✅ Compatible
Debian	✅ Compatible
Pop!_OS	✅ Compatible
Requisitos:
Nautilus (GNOME Files)
zenity
mousepad
python3-nautilus
🗑️ Desinstalación
bash
sudo ./desinstalar.sh
Luego cierra sesión y vuelve a entrar (o reinicia Nautilus con nautilus -q).
🎨 Personalización
Puedes modificar colores, texto y tamaño editando:
bash
sudo nano /usr/local/bin/nautilus-admin-open.sh      # Diálogo de abrir
sudo nano /usr/local/bin/nautilus-admin-delete.sh    # Diálogo de eliminar
Colores Disponibles
Table
Código	Color
#CC0000	Rojo intenso
#FF6600	Naranja
#0066CC	Azul
#990000	Rojo oscuro
#333333	Gris oscuro
🤝 Contribuir
Haz fork del repositorio
Crea una rama (git checkout -b feature/nueva-funcion)
Commit tus cambios (git commit -am 'Añadir nueva función')
Push a la rama (git push origin feature/nueva-funcion)
Abre un Pull Request
📄 Licencia
Licencia MIT — Libre para usar, modificar y distribuir.
🙏 Créditos
Autor: Bogdan
Sistema: Zorin OS
Inspiración: Función "Ejecutar como administrador" de Windows
Asistente IA: 💻 🤖 💻 KIMI - IA (Inteligencia Artificial) 👍
⚠️ ADVERTENCIA: Usa esta herramienta con precaución. Las acciones realizadas como administrador no se pueden deshacer.
