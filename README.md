# 🛡️ Nautilus Clic Derecho Administrador (3 estados)

git clone https://github.com/bogdansaniuta/nautilus-rightclick-admin-3way.git
cd nautilus-rightclick-admin-3way
sudo ./install.sh
Requiere: Cerrar sesión y volver a iniciar (o reiniciar) después de instalar.
📖 Cómo usar
Abre el Administrador de archivos (Nautilus)
Navega a cualquier carpeta con archivos protegidos
Clic derecho en el archivo que quieres eliminar
Selecciona: "Eliminar como administrador"
Lee la advertencia y pulsa ELIMINAR o CANCELAR
Introduce tu contraseña si te la solicitan
¡El archivo se elimina directamente — no se abre ninguna ventana nueva!
🖥️ Compatibilidad
Table
Distribución	Estado
Zorin OS	✅ Probado
Ubuntu	✅ Compatible
Linux Mint	✅ Compatible
Debian	✅ Compatible
Pop!_OS	✅ Compatible
Requisitos:
Nautilus (Archivos de GNOME)
zenity
python3-nautilus
🗑️ Desinstalación
bash
sudo ./uninstall.sh
Luego cierra sesión y vuelve a iniciar.
🎨 Personalización
Puedes modificar colores, texto y tamaño editando:
bash
sudo nano /usr/local/bin/nautilus-admin-delete.sh
Colores disponibles
Table
Código	Color
#CC0000	Rojo intenso
#FF6600	Naranja
#990000	Rojo oscuro
#333333	Gris oscuro
🤝 Contribuir
Haz fork del repositorio
Crea una rama (git checkout -b feature/nueva-funcion)
Confirma tus cambios (git commit -am 'Añadir nueva funcion')
Sube la rama (git push origin feature/nueva-funcion)
Abre una Pull Request
📄 Licencia
Licencia MIT — Libre para usar, modificar y distribuir.
🙏 Créditos
Autor: Bogdan
Sistema: Zorin OS
Inspiración: Función "Ejecutar como administrador" de Windows
⚠️ ADVERTENCIA: Usa esta herramienta con precaución. Los archivos eliminados no se pueden recuperar.
