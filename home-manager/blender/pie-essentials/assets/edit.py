bl_info = {
    "name": "Edit Menu: Key: 'F'",
    "description": "Edit Modes",
    "blender": (2, 78, 0),
    "category": "Mesh"
}

import bpy
from bpy.types import (Menu, Operator)

class VIEW3D_PIE_vertex_of(Menu):
    bl_label = "Vertices"

    def draw(self, context):
        layout = self.layout
        pie = layout.menu_pie()
        pie = pie.column()

        pie.operator("mesh.merge", text = "Merge")
        pie.operator("mesh.rip_move", text = "Rip")
        pie.operator("mesh.rip_move_fill", text = "Rip Fill")
        pie.operator("mesh.rip_edge_move", text = "Extend Vertices")
        pie.operator("mesh.split", text = "Split")
        pie.operator("wm.call_menu_pie", text = "Seperate").name = "VIEW3D_PIE_separate_vertex_of"
        pie.operator("mesh.vert_connect_path", text = "Connect Vertex Path")
        pie.operator("mesh.vert_connect", text = "Connect Vertices")
        pie.operator("mesh.vert_slide", text = "Slide")

        pie = layout.menu_pie()
        pie = pie.column()

        mark_sharp = pie.operator("mesh.mark_sharp", text = "Mark Sharp Edges")
        mark_sharp.use_verts = True
        clear_sharp = pie.operator("mesh.mark_sharp", text = "Clear Sharp Edges")
        clear_sharp.clear = True
        clear_sharp.use_verts = True

        pie = layout.menu_pie()
        pie = pie.column()

        bevel = pie.operator("mesh.bevel", text = "Bevel")
        bevel.vertex_only = True
        pie.operator("mesh.convex_hull", text = "Convex Hull")
        pie.operator("mesh.vertices_smooth", text = "Smooth Vertex")
        pie.operator("mesh.remove_doubles", text = "Remove Doubles")
        pie.operator("mesh.blend_from_shape", text = "Blend From Shape")
        pie.operator("object.vertex_group_smooth", text = "Smooth Vertex Weights")
        pie.operator("mesh.shape_propagate_to_all", text = "Shade Propagate")

class VIEW3D_PIE_edge_of(Menu):
    bl_label = "Edges"

    def draw(self, context):
        layout = self.layout
        pie = layout.menu_pie()
        pie = pie.column()

        pie.operator("mesh.edge_face_add", text = "Make Edge/Face")
        pie.operator("mesh.subdivide", text = "Subdivide")
        pie.operator("subdivide_edgering", text = "Subdivide Edge-Ring")
        pie.operator("unsubdivide", text = "Un-Subdivide")

        pie = layout.menu_pie()
        pie = pie.column()

        bevel = pie.operator("mesh.bevel", text = "Bevel")
        bevel.vertex_only = False
        pie.operator("mesh.edge_split", text = "Edge Split")
        pie.operator("mesh.bridge_edge_loops", text = "Bridge Edge Loops")

        pie = layout.menu_pie()
        pie = pie.column()

        pie.operator("transform.edge_slide", text = "Edge Slide")
        loop_multi_select = pie.operator("mesh.loop_multi_select", text = "Edge Loops")
        loop_multi_select.ring = False
        ring_multi_select = pie.operator("mesh.loop_multi_select", text = "Edge Rings")
        ring_multi_select.ring = True
        pie.operator("mesh.loop_to_region", text = "Select Loop Inner-Region")
        pie.operator("mesh.region_to_loop", text = "Select Boundary Loop")

        pie = layout.menu_pie()
        pie = pie.column()

        pie.operator("transform.edge_crease", text = "Edge Crease")
        pie.operator("transform.edge_bevelweight", text = "Edge Bevel Weight")

        pie = layout.menu_pie()
        pie = pie.row()

        mark_seam = pie.operator("mesh.mark_seam", text = "Mark Seam")
        mark_seam.clear = False
        clear_seam = pie.operator("mesh.mark_seam", text = "Clear Seam")
        clear_seam.clear = True

        pie = layout.menu_pie()
        pie = pie.row()

        pie.operator("mesh.mark_sharp", text = "Mark Sharp")
        clear_sharp = pie.operator("mesh.mark_sharp", text = "Clear Sharp")
        clear_sharp.clear = True

        pie = layout.menu_pie()
        pie = pie.row()

        mark_freestyle_edge = pie.operator("mesh.mark_freestyle_edge", text = "Mark Freestyle Edge")
        mark_freestyle_edge.clear = False
        clear_freestyle_edge = pie.operator("mesh.mark_freestyle_edge", text = "Clear Freestyle Edge")
        clear_freestyle_edge.clear = True

        pie = layout.menu_pie()
        pie = pie.row()

        edge_rotate_cw = pie.operator("mesh.edge_rotate", text = "Rotate Edge CW")
        edge_rotate_cw.use_ccw = False
        edge_rotate_ccw = pie.operator("mesh.edge_rotate", text = "Rotate Edge CCW")
        edge_rotate_ccw.use_ccw = True

class VIEW3D_PIE_face_of(Menu):
    bl_label = "Faces"

    def draw(self, context):
        layout = self.layout
        pie = layout.menu_pie()
        pie = pie.column()

        pie.operator("mesh.flip_normals", text = "Flip Normals")
        pie.operator("mesh.edge_face_add", text = "Make Edge/Face")
        pie.operator("mesh.fill", text = "Fill")
        pie.operator("mesh.fill_grid", text = "Grid Fill")
        pie.operator("mesh.beautify_fill", text = "Beautify Faces")
        pie.operator("mesh.inset", text = "Inset Faces")
        bevel = pie.operator("mesh.bevel", text = "Bevel")
        bevel.vertex_only = False
        pie.operator("mesh.solidify", text = "Solidify")
        pie.operator("mesh.intersect", text = "Intersect (Knife)")
        pie.operator("mesh.intersect_boolean", text = "Intersect (Boolean)")
        pie.operator("mesh.wireframe", text = "Wire Frame")

        pie = layout.menu_pie()
        pie = pie.column()

        pie.operator("mesh.poke", text = "Poke Faces")
        quads_convert_to_tris = pie.operator("mesh.quads_convert_to_tris", text = "Triangulate Faces")
        quads_convert_to_tris.quad_method = 'BEAUTY'
        pie.operator("mesh.tris_convert_to_quads", text = "Tris to Quads")
        pie.operator("mesh.face_split_by_edges", text = "Weld Edges into Faces")

        pie = layout.menu_pie()
        pie = pie.column()

        pie.operator("mesh.faces_shade_smooth", text = "Shade Smooth")
        pie.operator("mesh.faces_shade_flat", text = "Shade Flat")
        normals_make_consisent = pie.operator("mesh.normals_make_consistent", text = "Recalculate Normals")
        normals_make_consisent.inside = False

        pie = layout.menu_pie()
        pie = pie.column()

        pie.operator("mesh.uvs_rotate", text = "Rotate UVs")
        pie.operator("mesh.uvs_reverse", text = "Reverse UVs")
        pie.operator("mesh.colors_rotate", text = "Rotate Colors")
        pie.operator("mesh.colors_reverse", text = "Reverse Colors")

        pie = layout.menu_pie()
        pie = pie.row()

        pie.operator("")

        pie = layout.menu_pie()
        pie = pie.row()

        edge_rotate = pie.operator("mesh.edge_rotate", text = "Rotate Edge CW")
        edge_rotate.use_ccw = False

        pie = layout.menu_pie()
        pie = pie.row()

        pie.operator("")

        pie = layout.menu_pie()
        pie = pie.row()

        mark_freestyle_face = pie.operator("mesh.mark_freestyle_face", text = "Mark Freestyle Face")
        mark_freestyle_face.clear = False
        clear_freestyle_face = pie.operator("mesh.mark_freestyle_face", text = "Clear Freestyle Face")
        clear_freestyle_face.clear = True

class VIEW3D_PIE_special_of(Menu):
    bl_label = "Special"

    def draw(self, context):
        layout = self.layout
        pie = layout.menu_pie()
        pie = pie.column()

        hide = pie.operator("mesh.hide", text = "Hide")
        hide.unselected = False
        pie.operator("mesh.reveal", text = "Reveal")
        select_inverse = pie.operator("mesh.select_all", text = "Select Inverse")
        select_inverse.action = 'INVERT'

        pie = layout.menu_pie()
        pie = pie.column()

        pie.operator("mesh.flip_normals", text = "Flip Normals")
        pie.operator("mesh.vertices_smooth", text = "Smooth")
        pie.operator("mesh.vertices_smooth_laplacian", text = "Laplacian Smooth")

        pie = layout.menu_pie()
        pie = pie.column()

        pie.operator("mesh.inset", text = "Inset Faces")
        pie.operator("mesh.bevel", text = "Bevel")
        pie.operator("mesh.bridge_edge_loops", text = "Bridge Edge Loops")

        pie = layout.menu_pie()
        pie = pie.row()

        pie.operator("mesh.blend_from_shape", text = "Blend From Shape")
        pie.operator("mesh.shape_propagate_to_all", text = "Shape Propagate")
        pie.operator("mesh.shortest_path_select", text = "Select Shortest Path")
        pie.operator("mesh.sort_elements", text = "Sort Mesh Elements")
        pie.operator("mesh.symmetrize", text = "Symmetrize")
        pie.operator("mesh.symmetry_snap", text = "Snap to Symmetry")

        pie = layout.menu_pie()
        pie = pie.row()

        subdivide = pie.operator("mesh.subdivide", text = "Subdivide")
        subdivide.smoothness = 0
        subdivide_smooth = pie.operator("mesh.subdivide", text = "Subdivide Smooth")
        subdivide_smooth.smoothness = 1

        pie = layout.menu_pie()
        pie = pie.row()

        pie.operator("mesh.merge", text = "Merge...")
        pie.operator("mesh.remove_doubles", text = "Remove Doubles")

        pie = layout.menu_pie()
        pie = pie.row()

        pie.operator("mesh.faces_shade_smooth", text = "Shade Smooth")
        pie.operator("mesh.faces_shade_flat", text = "Shade Flat")

class VIEW3D_PIE_edit_of(Menu):
    bl_label = "Modes"
    bl_idname = "pie.edit_of"

    def draw(self, context):
        layout = self.layout
        pie = layout.menu_pie()

        pie.operator("wm.call_menu_pie", text = "Vertex").name = "VIEW3D_PIE_vertex_of"
        pie.operator("wm.call_menu_pie", text = "Edge").name = "VIEW3D_PIE_edge_of"
        pie.operator("wm.call_menu_pie", text = "Face").name = "VIEW3D_PIE_face_of"
        pie.operator("wm.call_menu_pie", text = "Special").name = "VIEW3D_PIE_special_of"

classes = [VIEW3D_PIE_vertex_of, VIEW3D_PIE_edge_of, VIEW3D_PIE_face_of, VIEW3D_PIE_special_of, VIEW3D_PIE_edit_of]
addon_keymaps = []

def register():
    addon_keymaps.clear()
    for cls in classes:
        bpy.utils.register_class(cls)
    wm = bpy.context.window_manager

    if wm.keyconfigs.addon:
        km = wm.keyconfigs.addon.keymaps.new(name = 'Mesh')
        kmi = km.keymap_items.new('wm.call_menu_pie', 'F', 'PRESS')
        kmi.properties.name = "pie.edit_of"
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
