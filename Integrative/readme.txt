HumMod 14.03 - Open Modelica release

This is the version of HumMod with some fixes and hacks to be translated 
and simulated by OpenModelica tool.

Usage:

1) Load the library and model in the following order:
Physiolibrary.mo
HumMod.mo
HumModTest.mo

2) Configure simulation and simulate the HumModTest
  * copy hummod.ini file to working directory of OM
  * add additional simulation flag: -overrideFile=hummod.ini
  * optionally configure StopTime and Interval (default StopTime = 86400,Interval=1)  

Issues:

* OM fails on initialization - OM doesn't find solution for initial condition of all
components. 
  * workaround: solution of initial condition taken from Dymola simulation and 
  * converted to hummod.ini file  
  * use additional flag: -overrideFile=hummod.ini

* OM fails on assertion in BloodO2Base during initialization 
  * workaround: assertion commented out in model

Publications:
www.physiome.cz/hummod

   