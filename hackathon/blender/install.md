Below I will show you how to install MolecularNodes as an editable module and how to install Blender as a jupyter kernal.

- Preparation
  - Download [VS code](https://code.visualstudio.com/)
    - Download Blender Development Addon in VSCode 
  - Download [Blender 3.6](https://www.blender.org/download/)
  - clone [MolecularNodes](https://github.com/BradyAJohnston/MolecularNodes)
  - Download [BNotebooks](https://github.com/BradyAJohnston/BNotebooks/) latest release

- Installation
  - open MolecularNodes folder in VS Code
  - open terminal
    - locate where you have unzip your Blender folder
    - install jupyter
      - e.g. for M1 Mac,`/Applications/Blender.app/Contents/Resources/3.6/python/bin/python3.10 -m pip install jupyter`
      - for Linux it would be `/path/to/blender/3.6/python/bin/python3.10 -m pip install jupyter`
  - **ctlr-shift-p** -> Blender Build and Start
  - select executive:
    - for M1 Mac, it would be `/Applications/Blender.app/Contents/MacOS/blender`
    - for Linux it would be `/path/to/blender/blender`
  - MolecularNodes should be available in **Scene** but not functional yet because we have not installed MDAnalysis yet.
  - Install BNotebooks
    - Edit-Preferences-Add-ons-Install
    - select BNotebooks.zip
    - click on the box
    - no need to install jupyter and the others because we have already installed them
    - click Append Kernel
  - open terminal and install softwares
    - cd MolecularNodes
    - for M1 Mac `/Applications/Blender.app/Contents/Resources/3.6/python/bin/python3.10 -m pip install -e .`
    - for Linux it would be `/path/to/blender/3.6/python/bin/python3.10 -m pip install -e .`
  - reopen Blender and check if MN works

- Create a working branch of MolecularNodes
  - `cd MolecularNodes`
  - `git remote -v`
  - `git remote add ugm_origin git@github.com:username/MolecularNodes.git`
  - `git checkout -b branch_name`
    
Volia!
