for %%f in (..\res\models\*.fbx) DO ( 
    "C:\Program Files\Autodesk\FBX\FBX Converter\2013.3\bin\FBXConverter.exe" %%f %%f.dae
    "C:\Program Files\Autodesk\FBX\FBX Converter\2013.3\bin\FBXConverter.exe" %%f.dae %%f
)
