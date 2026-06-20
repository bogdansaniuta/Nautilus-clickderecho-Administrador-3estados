#!/usr/bin/env python3

from gi.repository import Nautilus, GObject
import subprocess

class AdminExtension(GObject.GObject, Nautilus.MenuProvider):

    def get_file_items(self, files):
        items = []

        # Opcion: Abrir como administrador
        item_open = Nautilus.MenuItem(
            name='AdminOpen',
            label='Abrir como administrador',
            tip='Abrir este archivo con permisos de administrador'
        )
        item_open.connect('activate', self.open_as_admin, files)
        items.append(item_open)

        # Opcion: Eliminar como administrador
        item_delete = Nautilus.MenuItem(
            name='AdminDelete',
            label='Eliminar como administrador',
            tip='Eliminar este archivo con permisos de administrador'
        )
        item_delete.connect('activate', self.delete_as_admin, files)
        items.append(item_delete)

        return items

    def get_background_items(self, current_folder):
        return []

    def open_as_admin(self, menu, files):
        for file in files:
            path = file.get_location().get_path()
            subprocess.Popen(['/usr/local/bin/nautilus-admin-open.sh', path])
            break

    def delete_as_admin(self, menu, files):
        # Recoger TODOS los paths de los archivos seleccionados
        paths = []
        for file in files:
            path = file.get_location().get_path()
            paths.append(path)

        # Llamar al script con TODOS los archivos como argumentos
        if paths:
            cmd = ['/usr/local/bin/nautilus-admin-delete.sh'] + paths
            subprocess.Popen(cmd)
