bl_info = {
    "name": "Retopoflow: Key: 'Shift S'",
    "description": "Retopoflow options",
    "blender": (2, 78, 0),
    "category": "3d View"
}

import bpy
from bpy.types import (Menu, Operator)

class VIEW3D_PIE_retopoflow_of(Menu):
    bl_label = "Retopoflow"
    bl_idname = "pie.retopoflow_of"

    def draw(self, context):
        layout = self.layout
        pie = layout.menu_pie()

        pie.operator("cgcookie.contours", text = "Contours")
        pie.operator("cgcookie.polystrips", text = "Polystrips")
        pie.operator("cgcookie.polypen", text = "Polypen")
        if bpy.context.active_object.mode == "EDIT":
            pie.operator("cgcookie.tweak", text = "Tweak")
            pie.operator("cgcookie.loop_cut", text = "Loop Cut")
            pie.operator("cgcookie.loop_slide", text = "Loop Slide")


classes = [VIEW3D_PIE_retopoflow_of]
addon_keymaps = []

def register():
    for cls in classes:
        bpy.utils.register_class(cls)
    wm = bpy.context.window_manager

    if wm.keyconfigs.addon:
        km = wm.keyconfigs.addon.keymaps.new(name = 'Object Non-modal')
        kmi = km.keymap_items.new('wm.call_menu_pie', 'S', 'PRESS', shift = True)
        kmi.properties.name = "pie.retopoflow_of"
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
