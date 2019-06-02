bl_info = {
    "name": "Object Modes: Key: 'Tab'",
    "description": "Object Modes",
    "blender": (2, 78, 0),
    "category": "3d View"
}

import bpy
from bpy.types import (Menu, Operator)

class VIEW3D_PIE_object_modes_of(Menu):
    bl_idname = "pie.object_modes_of"
    bl_label = "Modes"

    def draw(self, context):
        layout = self.layout

        pie = layout.menu_pie()
        pie.operator_enum("OBJECT_OT_mode_set", "mode")

classes = [VIEW3D_PIE_object_modes_of]
addon_keymaps = []

def register():

    for cls in classes:
        bpy.utils.register_class(cls)
    wm = bpy.context.window_manager

    if wm.keyconfigs.addon:
        km = wm.keyconfigs.addon.keymaps.new(name = 'Object Non-modal')
        kmi = km.keymap_items.new('wm.call_menu_pie', 'TAB', 'PRESS')
        kmi.properties.name = "pie.object_modes_of"
        addon_keymaps.append((km, kmi))

        km = wm.keyconfigs.addon.keymaps.new(name = 'Grease Pencil Stroke Edit Mode')
        kmi = km.keymap_items.new('wm.call_menu_pie', 'TAB', 'PRESS')
        kmi.properties.name = "pie.transformations_of"
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
