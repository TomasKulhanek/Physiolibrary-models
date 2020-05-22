## Physiolibrary-models

A set of different models of human physiology in Modelica language using [Physiolibrary](http://www.physiolibrary.org). Includes supporting scripts for generating list of initial values.

Currently the circulation hemodynamic models are included based on description and literature made by 
- Burkhoff et al., 
- Meurs et al., 
- Smith et al.,
- Fernandez et al.,
- Avolio,
- example of complex combined model by Kalecky.

This model set is a supplementary material to an article [*Lumped Models of the Cardiovascular System of Various Complexity* by Filip Ježek, Tomáš Kulhánek, Karel Kalecký and Jiří Kofránek. DOI: 10.1016/j.bbe.2017.08.001](https://doi.org/10.1016/j.bbe.2017.08.001)

### Installation

Download the library and open in the following order:
  * Physiolibrary/...   from www.physiolibrary.org
  * Cardiovascular/package.mo
  
### Run an example
Run any model with a green Play triangle, e.g. Cardiovascular.Model.Meurs.HemodynamicsMeurs or Cardiovascular.Model.Complex.Cardio. With decomposed models, you can redeclare the submodels wby any other compatible submodel of same subsystem (in Dymola use right context menu - change class - all matching choices - select you choice).

You can watch an instructional video at [https://youtu.be/wcipWB1Ngnw]

### Model compatibility
The model library is available to the public use. Although the model library is implemented in the universal Modelica language, minor differences in interpretation persist among the various tools. The models has been developed and tested in the Dassault Systémes Dymola 2018 tool only. Other tools (Wolfram SystemModeler, OpenModelica etc) might be used as well, but we do not guarantee proper functionality.

Citable DOI https://doi.org/10.5281/zenodo.1098407
