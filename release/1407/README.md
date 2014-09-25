Physiolibrary.models/FernandezModel
===================================

Modelica models and extension libraries based on [http://www.physiolibrary.org].

Release of model based on model implementation by Fernandez de Canete et al.
J. Fernandez de Canete, J. Luque, J. Barbancho, V. Munoz, Modelling of long-term and short-term mechanisms of arterial pressure control in the cardiovascular system: An objectoriented approach., Computers in biology and medicine 47 (2014) 104{12. doi:10.1016/j.compbiomed.2014.01.006. 

Installation
============
Requires Modelica 3.2 (3.2.1) standard library. Open the Modelica files in the following order:
  * Physiolibrary.mo -- basic library to model physiology in Modelica from www.physiolibrary.org
  * Cardiovascular.mo -- extension to Physiolibrary regarding Cariovascular system 
  * FernandezModel.mo 

Usage
=====
In Modelica tool (OpenModelica or Dymola) open
FernandezModel/Models
  * Hemodynamics_pure -- the implementation of hemodynamics without any regulation
  * Hemodynamics_stenosiswithbarocontrol - hemodynamics and baroreceptor control mechanism connected with prepared scenario changing the vena cava elastance (stenosis)
  * Hemodynamics_stenosiswithoutbaro- hemodynamics without any control mechanism with prepared scenario changing the vena cava elastance (stenosis)          

Tested in OpenModelica 1.9.1+dev (r20369) (RML version) and Dymola version 2014 FD01.
