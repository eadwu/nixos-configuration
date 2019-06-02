bl_info = {
    "name": "Sculpt Brush Menu: Key: 'F'",
    "description": "Sculpt Brushes",
    "blender": (2, 78, 0),
    "category": "Sculpt"
}

import bpy
from bpy.types import (Menu, Operator)

class VIEW3D_PIE_brushes_of(Menu):
    bl_label = "Brushes"
    bl_idname = "pie.brushes_of"

    def draw(self, context):
        layout = self.layout
        pie = layout.menu_pie()

        draw = pie.operator("paint.brush_select", icon = "BRUSH_SCULPT_DRAW", text = "Draw")
        draw.sculpt_tool = 'DRAW'
        crease = pie.operator("paint.brush_select", icon = "BRUSH_CREASE", text = "Crease")
        crease.sculpt_tool = 'CREASE'
        clay = pie.operator("paint.brush_select", icon = "BRUSH_CLAY", text = "Clay")
        clay.sculpt_tool = 'CLAY'
        clay_strips = pie.operator("paint.brush_select", icon = "BRUSH_CLAY_STRIPS", text = "Clay Strips")
        clay_strips.sculpt_tool = 'CLAY_STRIPS'
        grab = pie.operator("paint.brush_select", icon = "BRUSH_GRAB", text = "Grab")
        grab.sculpt_tool = 'GRAB'
        pinch = pie.operator("paint.brush_select", icon = "BRUSH_PINCH", text = "Pinch")
        pinch.sculpt_tool = 'PINCH'
        smooth = pie.operator("paint.brush_select", icon = "BRUSH_SMOOTH", text = "Smooth")
        smooth.sculpt_tool = 'SMOOTH'
        # pie.operator_enum("PAINT_OT_brush_select", "sculpt_tool")

classes = [VIEW3D_PIE_brushes_of]
addon_keymaps = []

def register():
    addon_keymaps.clear()
    for cls in classes:
        bpy.utils.register_class(cls)
    wm = bpy.context.window_manager

    if wm.keyconfigs.addon:
        km = wm.keyconfigs.addon.keymaps.new(name = 'Sculpt')
        kmi = km.keymap_items.new('wm.call_menu_pie', 'F', 'PRESS')
        kmi.properties.name = "pie.brushes_of"
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
