bl_info = {
    "name": "Mesh Select Menu: Key: 'RIGHTMOUSE'",
    "description": "Mesh Select Modes",
    "blender": (2, 78, 0),
    "category": "Mesh"
}

import bpy
from bpy.types import (Menu, Operator)

class VIEW3D_PIE_mesh_select_of(Menu):
    bl_label = "Mesh Select Mode"
    bl_idname = "pie.mesh_select_of"

    def draw(self, context):
        layout = self.layout
        pie = layout.menu_pie()

        pie.operator_enum("mesh.select_mode", "type")


classes = [VIEW3D_PIE_mesh_select_of]
addon_keymaps = []

def register():
    addon_keymaps.clear()
    for cls in classes:
        bpy.utils.register_class(cls)
    wm = bpy.context.window_manager

    if wm.keyconfigs.addon:
        km = wm.keyconfigs.addon.keymaps.new(name = 'Mesh')
        kmi = km.keymap_items.new('wm.call_menu_pie', 'RIGHTMOUSE', 'PRESS')
        kmi.properties.name = "pie.mesh_select_of"
        addon_keymaps.append((km, kmi))

def unregister():
    for cls in classes:
        bpy.utils.unregister_class(cls)
    wm = bpy.context.window_manager

    kc = wm.keyconfigs.addon
    if kc:
        for km, kmi in addon_keymaps:
            km.keymap_items.remove(kmi)
    addon_keymaps.clear()

if __name__ == "__main__":
    register()
