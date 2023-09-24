
### `bpy`

In Blender add-on development, `import bpy` is your gateway to the Blender Python API. Anything that you can do via Blender's UI, you can usually achieve via calls to `bpy`.

```python
import bpy

bpy.data                        # Access all of the data blocks inside of Blender
bpy.data.objects                # access all of the objects in the scene by name

cube = bpy.data.objects['Cube'] # get the data block for an object in Blender
cube.data                       # the data associated with the cube, such as edges, vertices, faces
cube.data.attributes
cube.data.vertices

bpy.ops                         # all of the pre-defined operators inside of Blender

bpy.context                     # all of the global context values, i.e. different properties set in the UI
bpy.types                       # the different pre-defined types used through bpy
```

`bpy` exposes a wide range of classes and functions, enabling you to perform tasks like creating objects, applying materials, setting animations, and much more, all programmatically.

For example, `bpy.data` grants access to the data blocks within Blender, such as meshes, materials, and textures, while `bpy.ops` allows you to call operators to perform specific actions, like rendering an image or duplicating an object.

Until earlier this year, `bpy` was only available when running scripts from inside of Blender, but it is now a `pip` installable package, which helps us with running test suites and for potential integrations with Jupyter Notebooks and other scripting environments.

### Creating a Basic Operator:

In Blender, operators are actions that can be triggered by the user or other parts of the code. They can range from simple tasks like moving an object to complex operations like rendering an animation.

Operators can execute code of any arbitrary length. They can provide additional _context_ in the form of the `context` argument, which is given by Blender depending on where the operator is invoked. If you press a button in one window of Blender, it might do something different compared to a different window of Blender. Most of the operators inside of Molecular Nodes do not change their behaviour. 

The design of Molecular Nodes is mostly to expose all of the functionality inside individual function calls. To download a protein from the PDB, import it to Blender and create starting style, you can use the `mn.load.molecular_rcsb()` function. Inside of the UI for Blender, when the user clicks the <kbd>Download from PDB</kbd> button, the operator just calls this function with the inputs taken from the local context, such as starting style and PDB code to download. The operators themselves should not be doing any kind of complex operations, as that functionality won't then be available for use via scripts.

Below is the minimum required to create an add-on for Blender. We define a custom function, create an operator that executes code (calling the function), we create some UI that displays a button to execute the operator, and we create `register()` and `unregister()` functions to install and uninstall the add-on.

```python
import bpy

def my_function():
    print("hello world!")

class SimpleOperator(bpy.types.Operator):
    bl_idname = "wm.simple_operator"
    bl_label = "Simple Operator"

    def execute(self, context):
        #code to be executed by the operator goes in the `execute()` function
        my_function()

        # operators inside of Blender return `{'FINISHED'}` to signal they have completed
        # correctly and Blender can return control of the program back to the user.
        # This is why they are useful for UI operations, but less useful for scripting
        # other potential returns are 'CANCELLED', 'RUNNING_MODAL', 'PASS_THROUGH'
        return {'FINISHED'}

# define a menu that will appear inside of the Blender's UI
# the layout function `layout.operator()` will take a string name of the operator, 
# and create a button in the UI which will execute the operator when the buttons is pressed
def menu_func(self, context):
    # you can input either the string for the operator name, or take that 
    # name from the class itself
    self.layout.operator(SimpleOperator.bl_idname)
    self.layout.operator("wm.simple_operator")


# The `register()` and `unregister()` functions are run whenever Blender loads the 
# addon. This occurs the first time the add-on is installed and enabled, and then whenever
# Blender is started while the add-on is enabled. For Blender to be aware of the operator's
# existence, it has to be registered (and unregistered when uninstalled). The same has to 
# happen for the UI components
def register():
    bpy.utils.register_class(SimpleOperator)
    bpy.types.VIEW3D_MT_mesh.append(menu_func)

def unregister():
    bpy.utils.unregister_class(SimpleOperator)
    bpy.types.VIEW3D_MT_mesh.remove(menu_func)

```

##### Returning Signals from Operators in bpy

In Blender's Python API (`bpy`), operators primarily return a dictionary to signal their execution status. The common keys used in this dictionary are:

1. `'FINISHED'`: Indicates that the operator completed successfully.

2. `'CANCELLED'`: Indicates that the operator was canceled by the user or encountered an error.

3. `'RUNNING_MODAL'`: Typically used for modal operators that run continuously until they are explicitly ended by the user.

4. `'PASS_THROUGH'`: Used in certain cases to indicate that the operator does not consume events.

Additionally, some operators may use custom status strings, but these are less common and specific to certain situations.

It's worth noting that operators in Blender are designed to execute synchronously, meaning they perform their action immediately when called. For operations that require asynchronous behavior (e.g., long-running tasks), you may need to consider threading or other mechanisms to achieve the desired effect.
