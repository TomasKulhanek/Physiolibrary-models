within ;
package Physiolibrary "Physiological domains library (version v2.1)"
 extends Modelica.Icons.Package;

  package UsersGuide "User's Guide"
    extends Modelica.Icons.Information;

  class Overview "Overview of Physiolibrary"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p>ThePhysiolibrary consists of the following main sub-libraries: </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td><p align=\"center\"><h4>Library Components</h4></p></td>
<td><p align=\"center\"><h4>Description</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Chemical.png\"/></p></td>
<td valign=\"middle\"><a href=\"modelica://Physiolibrary.Chemical\">Chemical</a><p>In physiology books, chapters about chemical substances are organized by their types. The main reason for this is that each substance in the human body is regulated in a different way. For example the regulation of sodium is different from the regulation of potassium, and from the regulation of glucose, and so on. This view leads to the idea of having separate models of each substance. The origin of different flows and regulations is the (cellular) membrane. Water and solutions can cross it in different directions at the same time. Crossings occur for different reasons: water is driven mostly by osmotic gradients, electrolytes are driven by charge to reach Donnan&apos;s equilibrium, and some solutes can even be actively transported against their concentration or electrical gradients. And all this is specifically driven from the higher levels by neural and hormonal responses.&nbsp; </p><p>In Physiolibrary flows and fluxes of solutes are supported mostly by the Chemical package. All parts inside this Physiolibrary.Chemical package use the connector ChemicalPort, which defines the molar concentration and molar flow/flux rate of one solute. This is the supporting infrastructure for modeling membrane diffusion, accumulations of substances, reversal chemical reactions, Henry&apos;s law of gas solubility, dilution with additional solvent flow, membrane reabsorption, chemical degradation and physiological clearance. </p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Hydraulic.png\"/></p></td>
<td valign=\"middle\"><a href=\"modelica://Physiolibrary.Hydraulic\">Hydraulic</a><p>The main usage of the hydraulic domain in human physiology is modeling of the cardio-vascular system. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for incompressible water, at normal liquid-water temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of hydraulic resistance, hydrostatic pressure, volumetric flow, inertia and finally the block of blood accumulation in elastic vessels.</p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Thermal.png\"/></p></td>
<td valign=\"middle\"><a href=\"modelica://Physiolibrary.Thermal\">Thermal</a><p>For the human body to function optimally, it is critical to hold the core temperature at 35&ndash;39&deg;C. A fever of 41&deg;C for more than a short period of time causes brain damage. If the core temperature falls below 10&deg;C, the heart stops. As in the hydraulic domain, the thermal domain is simplified to these conditions. </p><p>In the Physiolibrary.Thermal package extends the package Modelica.Thermal.HeatTransfer from Modelica Standard Library 3.2 (MSL), where the connector is composed of temperature and heat flow. The main blocks in Physiolibrary.Thermal are: Conductor, IdealRadiator and HeatAccumulation. The heat conductor conducts the heat from the source, such us muscles or metabolically active tissue, to its surrounding. IdealRadiator delivers heat to tissues by blood circulation. HeatAccumulation plays a role in accumulating thermal energy in each tissue mass driven by its heat capacity. We recommend to use this block instead of Modelica.Thermal.HeatTransfer.HeatCapacitor to have possibility of variable mass amount or to have a support for calculation of steady state. </p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Osmotic.png\"/></p></td>
<td valign=\"middle\"><a href=\"modelica://Physiolibrary.Osmotic\">Osmotic</a><p>One of the basic phenomenon of biological systems is the osmotically-driven flow of water. This is always connected with semipermeable membranes. The different concentrations of impermeable solutes on both sides of the membrane causes the hydrostatic pressure at the concentrated side to rise. This pressure difference is called osmotic pressure. Osmotic pressure is linearly proportional to the concentration gradient of impermeable solutes. The osmolarity (osmotic concentration) is also one of the main indexes of human body balance, called homeostasis. Its value should not significantly deviate for a long period of time from a value of 285-295 mosm/l. </p><p>In Physiolibrary the osmotic connector OsmoticPort is composed of the osmotic concentration and the volumetric flux of permeable liquid. The two main blocks are called Membrane and OsmoticCell. Here, inside the membrane blocks, it is of course possible to also define hydraulic pressure and temperatures effects on both sides of membrane. </p></td>
</tr>
<tr>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/SteadyState.png\"/></p></td>
<td valign=\"middle\"><a href=\"modelica://Physiolibrary.SteadyStates\">SteadyStates</a><p>One of the main question in clinical medicine is how to stabilize the patient. In the fact of the oscillating heart, breathing, circadian rhythm or menstruation cycle the model could be designed as non-oscillating with variables such as period times, amplitudes, frequencies, mean values and other phase space variables. This type of model has better numerical stability for longer simulation time and even more it can be &QUOT;stabilized&QUOT;. This stabilization we called steady state. </p><p>To be mathematically exact, we define an <i><b>steady state system</b></i> (SSS) as a non-differential system derived from a original differential system (DS) by using zero derivations and by adding <b>additional steady state equations</b> (ASSE). The number of the ASSE must be the same as the number of algebraically dependent equations in the non-differential system derived from DS by setting zero derivations. The ASSE describes the system from the top view mostly such as the equations of mass conservation laws or the boundary equation of environment sources. To define a model as an SSS the user must switch each Simulation parameter in each block to value Types.SimulationType.SteadyState and must have correctly defined all necessary ASSE. This setting caused to ignoring any start values for any state and add zero derivation equations instead. Today does not exist Modelica environment, which could automatically find and remove generated dependent equations by this way. So the correct number of states must be marked as dependent (parameter isDependent) and the same number of ASSE must be inserted. Despite the fact, that model in this steady-state setting will be not locally balanced it should be globally balanced and without any dependent equation.</p><p>Adding of one ASSE is possible by inserting and connecting of the energy or mass conservation law block from package SteadyState.Components. Other possibilities is in blocks of environment&nbsp; sources, where the setting of parameter isIsolatedInSteadyState&nbsp; add the equation of the zero mass/volume/energy flow from or to environment. </p><p>The model in steady state often changes to one big nonlinear strong component, but without solver stiff or convergence problems. Especially in quick chemical reaction kinetics is not necessary to have very rapid molar fluxes, when it always reach equilibrium. This design also approve to create steady stated parts in dynamical model without huge rebuilding. It also&nbsp; brings other benefits. To see these possibilities, one have to realize that conservation laws could be invariances in a dynamical simulation. This is really useful for debugging. </p><p>It is always a big challenge to nicely solve initial values of differential system. However, it should be possible to solve the SSS in initial phase. And this is the idea behind the Types.SimulationTypes.InitSteadyState option for models already extended with ASSE to support SSS. </p></td>
</tr>
</table>
</html>"));
  end Overview;

  class Connectors "Connectors"
    extends Modelica.Icons.Information;

   annotation (Documentation(info="<html>
<p>The Physiolibrary defines the most important <b>elementary connectors</b> in various domains. If any possible, a user should utilize these connectors in order that components from the Physiolibrary and from other libraries can be combined without problems. The following elementary connectors are defined (the meaning of potential, flow, and stream variables is explained in section &QUOT;Connector Equations&QUOT; below): </p>
<table cellspacing=\"0\" cellpadding=\"1\" border=\"1\"><tr>
<td valign=\"top\"><p><h4>domain</h4></p></td>
<td valign=\"top\"><p><h4>potential</h4></p><p>variables</p></td>
<td valign=\"top\"><p><h4>flow</h4></p><p>variables</p></td>
<td valign=\"top\"><p><h4>stream</h4></p><p>variables</p></td>
<td valign=\"top\"><p><h4>connector definition</h4></p></td>
<td valign=\"top\"><p><h4>icons</h4></p></td>
</tr>
<tr>
<td valign=\"top\"><p><h4>chemical</h4></p></td>
<td valign=\"top\"><p>molar concentration</p></td>
<td valign=\"top\"><p>molar flow</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br/><a href=\"Physiolibrary.Chemical.Interfaces\">Physiolibrary.Chemical.Interfaces</a> </p><p>ChemicalPort, ChemicalPort_a, ChemicalPort_b</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/ChemicalPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><p><h4>hydraulic</h4></p></td>
<td valign=\"top\"><p>pressure</p></td>
<td valign=\"top\"><p>volumetric flow</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br/><a href=\"Physiolibrary.Hydraulic.Interfaces\">Physiolibrary.Hydraulic.Interfaces</a> </p><p>HydraulicPort, HydraulicPort_a, HydraulicPort_b</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/HydraulicPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><p><h4>osmotic</h4></p></td>
<td valign=\"top\"><p>osmolarity</p></td>
<td valign=\"top\"><p>permeable liquid volumetric flow </p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br/><a href=\"Physiolibrary.Osmotic.Interfaces\">Physiolibrary.Osmotic.Interfaces</a> </p><p>OsmoticPort, OsmoticPort_a, OsmoticPort_b</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/OsmoticPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><p><h4>thermal</h4></p></td>
<td valign=\"top\"><p>temperature</p></td>
<td valign=\"top\"><p>heat flow rate</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br/><a href=\"modelica://Modelica.Thermal.HeatTransfer.Interfaces\">Modelica.Thermal.HeatTransfer.Interfaces</a> </p><p>HeatPort, HeatPort_a, HeatPort_b</p><p><a href=\"Physiolibrary.Thermal.Interfaces\">Physiolibrary.Thermal.Interfaces</a> </p><p>HeatPort, HeatPort_a, HeatPort_b</p></td>
<td valign=\"top\"><p><br/><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/ThermalPorts.png\"/></p></td>
</tr>
<tr>
<td valign=\"top\"><p><h4>block</h4></p><p>diagram</p></td>
<td valign=\"top\"><p>Real unit-typed variables</p></td>
<td valign=\"top\"></td>
<td valign=\"top\"></td>
<td valign=\"top\"><p><br/><br/><a href=\"Physiolibrary.Types.RealIO\">Physiolibrary.Types.RealIO</a> </p><p>EnergyInput, EnergyOutput, TimeInput, TimeOutput, MassInput, MassOutput, MassFlowRateInput, MassFlowRateOutput, HeightInput, HeightOutput, AccelerationInput, AccelerationOutput, PressureInput, PressureOutput, VolumeInput, VolumeOutput, VolumeFlowRateInput, VolumeFlowRateOutput, ConcentrationInput, ConcentrationOutput, OsmolarityInput, OsmolarityOutput, AmountOfSubstanceInput, AmountOfSubstanceOutput, MolarFlowRateInput, MolarFlowRateOutput, DiffusionPermeabilityInput, DiffusionPermeabilityOutput, HeatInput, HeatOutput, TemperatureInput, TemperatureOutput, HeatFlowRateInput, HeatFlowRateOutput, ThermalConductanceInput, ThermalConductanceOutput, ElectricCurrentInput, ElectricCurrentOutput, ElectricChargeInput, ElectricChargeOutput, ElectricPotentialInput, ElectricPotentialOutput, FractionInput, FractionOutput, FrequencyInput, FrequencyOutput, OsmoticPermeabilityInput, OsmoticPermeabilityOutput, HydraulicConductanceInput, HydraulicConductanceOutput, HydraulicComplianceInput, HydraulicComplianceOutput, HydraulicInertanceInput, HydraulicInertanceOutput, GasSolubilityInput, GasSolubilityOutput, DensityInput, SpecificEnergyInput, SpecificEnergyOutput, SpecificHeatCapacityInput, SpecificHeatCapacityOutput</p></td>
<td valign=\"top\"><p><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/Signals.png\"/></p></td>
</tr>
</table>
<p><br/><br/><br/>In all domains, usually 2 connectors are defined. The variable declarations are <b>identical</b>, only the icons are different in order that it is easy to distinguish connectors of the same domain that are attached at the same component. </p>
</html>"));
  end Connectors;

    class ModelicaLicense2 "Modelica License 2"

      annotation (Documentation(info="<html>
<p>All files in this directory (Physiolibrary) and in all subdirectories, especially all files that build package &QUOT;Physiolibrary&QUOT; are licensed by <u><b>Marek Matejak</b></u> under the <u><b>Modelica License 2 </b></u>(with exception of files &QUOT;Resources/*&QUOT;). </p>
<p><h4>Licensor:</h4></p>
<p>Marek Matej&aacute;k,</p>
<p>Hviezdoslavova 632/41,</p>
<p>916 01 Star&aacute; Tur&aacute;, </p>
<p>Slovak Republic, </p>
<p>Charles University in Prague, Czech Republic</p>
<p><br/>email: marek@matfyz.cz</p>
<p><h4>Copyright notices of the files:</h4></p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague, First Faculty of Medicine, Institute of Pathological Physiology</p>
<p><br/><br/>This package with all of its subpackages is released under the &ldquo;Modelica License 2&rdquo; (if not explicitly noted otherwise). </p>
<p><br/><a href=\"#The_Modelica_License_2-outline\">The Modelica License 2</a></p>
<p><br/><a href=\"#How_to_Apply_the_Modelica_License_2-outline\">How to Apply the Modelica License 2</a></p>
<p><br/><a href=\"#Frequently_Asked_Questions-outline\">Frequently Asked Questions</a></p>
<p><br/><b><font style=\"color: #008000; \">The Modelica License 2</font></b> </p>
<p><b><font style=\"font-size: 10pt; \">Preamble.</b> The goal of this license is that Modelica related model libraries, software, images, documents, data files etc. can be used freely in the original or a modified form, in open source and in commercial environments (as long as the license conditions below are fulfilled, in particular sections 2c) and 2d). The Original Work is provided free of charge and the use is completely at your own risk. Developers of free Modelica packages are encouraged to utilize this license for their work. </p>
<p>The Modelica License applies to any Original Work that contains the following licensing notice adjacent to the copyright notice(s) for this Original Work: </p>
<p><b>Licensed by Marek Matejak under the Modelica License 2</b> </p>
<p><h4>1. Definitions.</h4></p>
<p>&ldquo;License&rdquo; is this Modelica License. </p>
<p>&ldquo;Original Work&rdquo; is any work of authorship, including software, images, documents, data files, that contains the above licensing notice or that is packed together with a licensing notice referencing it. </p>
<p>&ldquo;Licensor&rdquo; is the provider of the Original Work who has placed this licensing notice adjacent to the copyright notice(s) for the Original Work. The Original Work is either directly provided by the owner of the Original Work, or by a licensee of the owner. </p>
<p>&ldquo;Derivative Work&rdquo; is any modification of the Original Work which represents, as a whole, an original work of authorship. For the matter of clarity and as examples: </p>
<p>Derivative Work shall not include work that remains separable from the Original Work, as well as merely extracting a part of the Original Work without modifying it. </p>
<p>Derivative Work shall not include (a) fixing of errors and/or (b) adding vendor specific Modelica annotations and/or (c) using a subset of the classes of a Modelica package, and/or (d) using a different representation, e.g., a binary representation. </p>
<p>Derivative Work shall include classes that are copied from the Original Work where declarations, equations or the documentation are modified. </p>
<p>Derivative Work shall include executables to simulate the models that are generated by a Modelica translator based on the Original Work (of a Modelica package). </p>
<p>&ldquo;Modified Work&rdquo; is any modification of the Original Work with the following exceptions: (a) fixing of errors and/or (b) adding vendor specific Modelica annotations and/or (c) using a subset of the classes of a Modelica package, and/or (d) using a different representation, e.g., a binary representation. </p>
<p>&QUOT;Source Code&QUOT; means the preferred form of the Original Work for making modifications to it and all available documentation describing how to modify the Original Work. </p>
<p>&ldquo;You&rdquo; means an individual or a legal entity exercising rights under, and complying with all of the terms of, this License. </p>
<p>&ldquo;Modelica package&rdquo; means any Modelica library that is defined with the &ldquo;<b>package</b></font><font style=\"font-size: 9pt; \">&nbsp;&LT;Name&GT;&nbsp;...&nbsp;</font><font style=\"font-size: 10pt; \">end</font><font style=\"font-size: 9pt; \">&nbsp;&LT;Name&GT;;</font><font style=\"font-size: 10pt; \">&rdquo; Modelica language element. </p>
<p><b>2. Grant of Copyright License.</b> Licensor grants You a worldwide, royalty-free, non-exclusive, sublicensable license, for the duration of the copyright, to do the following: </p>
<p>To reproduce the Original Work in copies, either alone or as part of a collection. </p>
<p>To create Derivative Works according to Section 1d) of this License. </p>
<p>To distribute or communicate to the public copies of the <u>Original Work</u> or a <u>Derivative Work</u> under <u>this License</u>. No fee, neither as a copyright-license fee, nor as a selling fee for the copy as such may be charged under this License. Furthermore, a verbatim copy of this License must be included in any copy of the Original Work or a Derivative Work under this License.</p>
<p>For the matter of clarity, it is permitted A) to distribute or communicate such copies as part of a (possible commercial) collection where other parts are provided under different licenses and a license fee is charged for the other parts only and B) to charge for mere printing and shipping costs. </p>
<p>To distribute or communicate to the public copies of a <u>Derivative Work</u>, alternatively to Section 2c), under <u>any other license</u> of your choice, especially also under a license for commercial/proprietary software, as long as You comply with Sections 3, 4 and 8 below. </p>
<p>For the matter of clarity, no restrictions regarding fees, either as to a copyright-license fee or as to a selling fee for the copy as such apply. </p>
<p>To perform the Original Work publicly. </p>
<p>To display the Original Work publicly. </p>
<p><b>3. Acceptance.</b> Any use of the Original Work or a Derivative Work, or any action according to either Section 2a) to 2f) above constitutes Your acceptance of this License. </p>
<p><b>4. Designation of Derivative Works and of Modified Works. </b>The identifying designation of Derivative Work and of Modified Work must be different to the corresponding identifying designation of the Original Work. This means especially that the (root-level) name of a Modelica package under this license must be changed if the package is modified (besides fixing of errors, adding vendor specific Modelica annotations, using a subset of the classes of a Modelica package, or using another representation, e.g. a binary representation). </p>
<p><b>5. Grant of Patent License.</b> Licensor grants You a worldwide, royalty-free, non-exclusive, sublicensable license, under patent claims owned by the Licensor or licensed to the Licensor by the owners of the Original Work that are embodied in the Original Work as furnished by the Licensor, for the duration of the patents, to make, use, sell, offer for sale, have made, and import the Original Work and Derivative Works under the conditions as given in Section 2. For the matter of clarity, the license regarding Derivative Works covers patent claims to the extent as they are embodied in the Original Work only. </p>
<p><b>6. Provision of Source Code.</b> Licensor agrees to provide You with a copy of the Source Code of the Original Work but reserves the right to decide freely on the manner of how the Original Work is provided.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For the matter of clarity, Licensor might provide only a binary representation of the Original Work. In that case, You may (a) either reproduce the Source Code from the binary representation if this is possible (e.g., by performing a copy of an encrypted Modelica package, if encryption allows the copy operation) or (b) request the Source Code from the Licensor who will provide it to You. </p>
<p><b>7. Exclusions from License Grant.</b> Neither the names of Licensor, nor the names of any contributors to the Original Work, nor any of their trademarks or service marks, may be used to endorse or promote products derived from this Original Work without express prior permission of the Licensor. Except as otherwise expressly stated in this License and in particular in Sections 2 and 5, nothing in this License grants any license to Licensor&rsquo;s trademarks, copyrights, patents, trade secrets or any other intellectual property, and no patent license is granted to make, use, sell, offer for sale, have made, or import embodiments of any patent claims.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No license is granted to the trademarks of Licensor even if such trademarks are included in the Original Work, except as expressly stated in this License. Nothing in this License shall be interpreted to prohibit Licensor from licensing under terms different from this License any Original Work that Licensor otherwise would have a right to license. </p>
<p><b>8. Attribution Rights.</b> You must retain in the Source Code of the Original Work and of any Derivative Works that You create, all author, copyright, patent, or trademark notices, as well as any descriptive text identified therein as an &QUOT;Attribution Notice&QUOT;. The same applies to the licensing notice of this License in the Original Work. For the matter of clarity, &ldquo;author notice&rdquo; means the notice that identifies the original author(s). </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You must cause the Source Code for any Derivative Works that You create to carry a prominent Attribution Notice reasonably calculated to inform recipients that You have modified the Original Work. </p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In case the Original Work or Derivative Work is not provided in Source Code, the Attribution Notices shall be appropriately displayed, e.g., in the documentation of the Derivative Work. </p>
<p><h4>9. Disclaimer of Warranty. </h4></p>
<p><u>The Original Work is provided under this License on an &QUOT;as is&QUOT; basis and without warranty, either express or implied, including, without limitation, the warranties of non-infringement, merchantability or fitness for a particular purpose. The entire risk as to the quality of the Original Work is with You.</u> This disclaimer of warranty constitutes an essential part of this License. No license to the Original Work is granted by this License except under this disclaimer. </p>
<p><b>10. Limitation of Liability.</b> Under no circumstances and under no legal theory, whether in tort (including negligence), contract, or otherwise, shall the Licensor, the owner or a licensee of the Original Work be liable to anyone for any direct, indirect, general, special, incidental, or consequential damages of any character arising as a result of this License or the use of the Original Work including, without limitation, damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses. This limitation of liability shall not apply to the extent applicable law prohibits such limitation. </p>
<p><b>11. Termination.</b> This License conditions your rights to undertake the activities listed in Section 2 and 5, including your right to create Derivative Works based upon the Original Work, and doing so without observing these terms and conditions is prohibited by copyright law and international treaty. Nothing in this License is intended to affect copyright exceptions and limitations. This License shall terminate immediately and You may no longer exercise any of the rights granted to You by this License upon your failure to observe the conditions of this license. </p>
<p><b>12. Termination for Patent Action.</b> This License shall terminate automatically and You may no longer exercise any of the rights granted to You by this License as of the date You commence an action, including a cross-claim or counterclaim, against Licensor, any owners of the Original Work or any licensee alleging that the Original Work infringes a patent. This termination provision shall not apply for an action alleging patent infringement through combinations of the Original Work under combination with other software or hardware. </p>
<p><b>13. Jurisdiction.</b> Any action or suit relating to this License may be brought only in the courts of a jurisdiction wherein the Licensor resides and under the laws of that jurisdiction excluding its conflict-of-law provisions. The application of the United Nations Convention on Contracts for the International Sale of Goods is expressly excluded. Any use of the Original Work outside the scope of this License or after its termination shall be subject to the requirements and penalties of copyright or patent law in the appropriate jurisdiction. This section shall survive the termination of this License. </p>
<p><b>14. Attorneys&rsquo; Fees.</b> In any action to enforce the terms of this License or seeking damages relating thereto, the prevailing party shall be entitled to recover its costs and expenses, including, without limitation, reasonable attorneys&apos; fees and costs incurred in connection with such action, including any appeal of such action. This section shall survive the termination of this License. </p>
<p><b>15. Miscellaneous.</b> </p>
<p>If any provision of this License is held to be unenforceable, such provision shall be reformed only to the extent necessary to make it enforceable. </p>
<p>No verbal ancillary agreements have been made. Changes and additions to this License must appear in writing to be valid. This also applies to changing the clause pertaining to written form. </p>
<p>You may use the Original Work in all ways not otherwise restricted or conditioned by this License or by law, and Licensor promises not to interfere with or be responsible for such uses by You. </p>
<p><br/><b></font><font style=\"color: #008000; \">How to Apply the Modelica License 2</font></b> </p>
<p><font style=\"font-size: 10pt; \">At the top level of your Modelica package and at every important subpackage, add the following notices in the info layer of the package: </p>
<p>Licensed by &LT;Licensor&GT; under the Modelica License 2</p>
<p>Copyright &copy; &LT;year1&GT;-&LT;year2&GT;, &LT;name of copyright holder(s)&GT;. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
<p>Include a copy of the Modelica License 2 under <b>&LT;library&GT;.UsersGuide.ModelicaLicense2</b> (use <a href=\"http://www.modelica.org/licenses/ModelicaLicense2.mo\">http://www.modelica.org/licenses/ModelicaLicense2.mo</a>). Furthermore, add the list of authors and contributors under <b>&LT;library&GT;.UsersGuide.Contributors</b> or <b>&LT;library&GT;.UsersGuide.Contact</b>. </p>
<p>For example, sublibrary Modelica.Blocks of the Modelica Standard Library may have the following notices: </p>
<p>Licensed by Modelica Association under the Modelica License 2</p>
<p>Copyright &copy; 1998-2008, Modelica Association. </p>
<p><i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i> </p>
<p>For C-source code and documents, add similar notices in the corresponding file. </p>
<p>For images, add a &ldquo;readme.txt&rdquo; file to the directories where the images are stored and include a similar notice in this file. </p>
<p>In these cases, save a copy of the Modelica License 2 in one directory of the distribution, e.g., <a href=\"http://www.modelica.org/licenses/ModelicaLicense2.html\">http://www.modelica.org/licenses/ModelicaLicense2.html</a> in directory <b>&LT;library&GT;/Resources/Documentation/ModelicaLicense2.html</b>. </p>
<p><br/><b><font style=\"font-size: 6pt; color: #008000; \">Frequently Asked Questions</font></b></p>
<p><font style=\"font-size: 10pt; \">This section contains questions/answer to users and/or distributors of Modelica packages and/or documents under Modelica License 2. Note, the answers to the questions below are not a legal interpretation of the Modelica License 2. In case of a conflict, the language of the license shall prevail. </p>
<p><b></font><font style=\"color: #008000; \">Using or Distributing a Modelica <u>Package</u> under the Modelica License 2</font></b> </p>
<p><b><font style=\"font-size: 10pt; \">What are the main differences to the previous version of the Modelica License?</b></p>
<p><ol>
<li>Modelica License 1 is unclear whether the licensed Modelica package can be distributed under a different license. Version 2 explicitly allows that &ldquo;Derivative Work&rdquo; can be distributed under any license of Your choice, see examples in Section 1d) as to what qualifies as Derivative Work (so, version 2 is clearer). </li>
<li>If You modify a Modelica package under Modelica License 2 (besides fixing of errors, adding vendor specific Modelica annotations, using a subset of the classes of a Modelica package, or using another representation, e.g., a binary representation), you must rename the root-level name of the package for your distribution. In version 1 you could keep the name (so, version 2 is more restrictive). The reason of this restriction is to reduce the risk that Modelica packages are available that have identical names, but different functionality. </li>
<li>Modelica License 1 states that &ldquo;It is not allowed to charge a fee for the original version or a modified version of the software, besides a reasonable fee for distribution and support&rdquo;. Version 2 has a similar intention for all Original Work under <u>Modelica License 2</u> (to remain free of charge and open source) but states this more clearly as &ldquo;No fee, neither as a copyright-license fee, nor as a selling fee for the copy as such may be charged&rdquo;. Contrary to version 1, Modelica License 2 has no restrictions on fees for Derivative Work that is provided under a different license (so, version 2 is clearer and has fewer restrictions). </li>
<li>Modelica License 2 introduces several useful provisions for the licensee (articles 5, 6, 12), and for the licensor (articles 7, 12, 13, 14) that have no counter part in version 1. </li>
<li>Modelica License 2 can be applied to all type of work, including documents, images and data files, contrary to version 1 that was dedicated for software only (so, version 2 is more general). </li>
</ol></p>
<p><h4>Can I distribute a Modelica package (under Modelica License 2) as part of my commercial Modelica modeling and simulation environment?</h4></p>
<p>Yes, according to Section 2c). However, you are not allowed to charge a fee for this part of your environment. Of course, you can charge for your part of the environment. </p>
<p><h4>Can I distribute a Modelica package (under Modelica License 2) under a different license?</h4></p>
<p>No. The license of an unmodified Modelica package cannot be changed according to Sections 2c) and 2d). This means that you cannot <u>sell</u> copies of it, any distribution has to be free of charge. </p>
<p><h4>Can I distribute a Modelica package (under Modelica License 2) under a different license when I first encrypt the package?</h4></p>
<p>No. Merely encrypting a package does not qualify for Derivative Work and therefore the encrypted package has to stay under Modelica License 2. </p>
<p><h4>Can I distribute a Modelica package (under Modelica License 2) under a different license when I first add classes to the package?</h4></p>
<p>No. The package itself remains unmodified, i.e., it is Original Work, and therefore the license for this part must remain under Modelica License 2. The newly added classes can be, however, under a different license. </p>
<p><b>Can I copy a class out of a Modelica package (under Modelica License 2) and include it <u>unmodified</u> in a Modelica package under a <u>commercial/proprietary license</u>?</b></p>
<p>No, according to article 2c). However, you can include model, block, function, package, record and connector classes in your Modelica package under <u>Modelica License 2</u>. This means that your Modelica package could be under a commercial/proprietary license, but one or more classes of it are under Modelica License 2.</p>
<p>Note, a &ldquo;type&rdquo; class (e.g., type Angle = Real(unit=&rdquo;rad&rdquo;)) can be copied and included unmodified under a commercial/proprietary license (for details, see the next question). </p>
<p><b>Can I copy a type class or <u>part</u> of a model, block, function, record, connector class, out of a Modelica package (under Modelica License 2) and include it modified or unmodified in a Modelica package under a <u>commercial/proprietary</u> license</b></p>
<p>Yes, according to article 2d), since this will in the end usually qualify as Derivative Work. The reasoning is the following: A type class or part of another class (e.g., an equation, a declaration, part of a class description) cannot be utilized &ldquo;by its own&rdquo;. In order to make this &ldquo;usable&rdquo;, you have to add additional code in order that the class can be utilized. This is therefore usually Derivative Work and Derivative Work can be provided under a different license. Note, this only holds, if the additional code introduced is sufficient to qualify for Derivative Work. Merely, just copying a class and changing, say, one character in the documentation of this class would be no Derivative Work and therefore the copied code would have to stay under Modelica License 2. </p>
<p><b>Can I copy a class out of a Modelica package (under Modelica License 2) and include it in <u>modified </u>form in a <u>commercial/proprietary</u> Modelica package?</b></p>
<p>Yes. If the modification can be seen as a &ldquo;Derivative Work&rdquo;, you can place it under your commercial/proprietary license. If the modification does not qualify as &ldquo;Derivative Work&rdquo; (e.g., bug fixes, vendor specific annotations), it must remain under Modelica License 2. This means that your Modelica package could be under a commercial/proprietary license, but one or more parts of it are under Modelica License 2. </p>
<p><h4>Can I distribute a &ldquo;save total model&rdquo; under my commercial/proprietary license, even if classes under Modelica License 2 are included?</h4></p>
<p>Your classes of the &ldquo;save total model&rdquo; can be distributed under your commercial/proprietary license, but the classes under Modelica License 2 must remain under Modelica License 2. This means you can distribute a &ldquo;save total model&rdquo;, but some parts might be under Modelica License 2. </p>
<p><h4>Can I distribute a Modelica package (under Modelica License 2) in encrypted form?</h4></p>
<p>Yes. Note, if the encryption does not allow &ldquo;copying&rdquo; of classes (in to unencrypted Modelica source code), you have to send the Modelica source code of this package to your customer, if he/she wishes it, according to article&nbsp;6. </p>
<p><h4>Can I distribute an executable under my commercial/proprietary license, if the model from which the executable is generated uses models from a Modelica package under Modelica License 2?</h4></p>
<p>Yes, according to article 2d), since this is seen as Derivative Work. The reasoning is the following: An executable allows the simulation of a concrete model, whereas models from a Modelica package (without pre-processing, translation, tool run-time library) are not able to be simulated without tool support. By the processing of the tool and by its run-time libraries, significant new functionality is added (a model can be simulated whereas previously it could not be simulated) and functionality available in the package is removed (e.g., to build up a new model by dragging components of the package is no longer possible with the executable). </p>
<p><h4>Is my modification to a Modelica package (under Modelica License 2) a Derivative Work?</h4></p>
<p>It is not possible to give a general answer to it. To be regarded as &QUOT;an original work of authorship&QUOT;, a derivative work must be different enough from the original or must contain a substantial amount of new material. Making minor changes or additions of little substance to a preexisting work will not qualify the work as a new version for such purposes. </p>
<p><b></font><font style=\"color: #008000; \">Using or Distributing a Modelica <u>Document</u> under the Modelica License 2</font></b> </p>
<p><font style=\"font-size: 10pt; \">This section is devoted especially for the following applications:</p>
<p>A Modelica tool extracts information out of a Modelica package and presents the result in form of a &ldquo;manual&rdquo; for this package in, e.g., html, doc, or pdf format. </p>
<p>The Modelica language specification is a document defining the Modelica language. It will be licensed under Modelica License 2. </p>
<p>Someone writes a book about the Modelica language and/or Modelica packages and uses information which is available in the Modelica language specification and/or the corresponding Modelica package. </p>
<p><h4>Can I sell a manual that was basically derived by extracting information automatically from a Modelica package under Modelica License 2 (e.g., a &ldquo;reference guide&rdquo; of the Modelica Standard Library):</h4></p>
<p>Yes. Extracting information from a Modelica package, and providing it in a human readable, suitable format, like html, doc or pdf format, where the content is significantly modified (e.g. tables with interface information are constructed from the declarations of the public variables) qualifies as Derivative Work and there are no restrictions to charge a fee for Derivative Work under alternative 2d). </p>
<p><b>Can I copy a text passage out of a Modelica document (under Modelica License 2) and use it <u>unmodified</u> in my document (e.g. the Modelica syntax description in the Modelica Specification)?</b></p>
<p>Yes. In case you distribute your document, the copied parts are still under Modelica License 2 and you are not allowed to charge a license fee for this part. You can, of course, charge a fee for the rest of your document. </p>
<p><b>Can I copy a text passage out of a Modelica document (under Modelica License 2) and use it in <u>modified</u> form in my document?</b></p>
<p>Yes, the creation of Derivative Works is allowed. In case the content is significantly modified this qualifies as Derivative Work and there are no restrictions to charge a fee for Derivative Work under alternative 2d). </p>
<p><h4>Can I sell a printed version of a Modelica document (under Modelica License 2), e.g., the Modelica Language Specification?</h4></p>
<p>No, if you are not the copyright-holder, since article 2c) does not allow a selling fee for a (in this case physical) copy. However, mere printing and shipping costs may be recovered.</p>
</html>"));
    end ModelicaLicense2;

  package ReleaseNotes "Release notes"
    extends Modelica.Icons.ReleaseNotes;

  class Version_2_1_1 "Version 2.1.1 (May. 02, 2014)"
    extends Modelica.Icons.ReleaseNotes;

     annotation (Documentation(info="<html>
<ul>
<li><font style=\"color: #333333; \">New:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">compoment HydraulicComponents.IdealValve for modeling aortic, pulmonary, triscupid and mitral valve</font></li>
<li><font style=\"color: #333333; \">types pH, VolumeDensityOfCharge</font></li>
<li><font style=\"color: #333333; \">examples: Osmotic.Examples.CelebrospinalFluid, Hydraulic.Examples.Windkessel and Hydraulic.Example.MinimalCirculation</font></li>
</ul></li>
<li><font style=\"color: #333333; \">Fix:</font></li>
<li><ul>
<li>role of hydraulic pressure in Osmotic.Components.Membrane</li>
</ul></li>
</ul>
</html>"));
  end Version_2_1_1;

  class Version_2_1 "Version 2.1 (Feb. 28, 2014)"
    extends Modelica.Icons.ReleaseNotes;

     annotation (Documentation(info="<html>
<ul>
<li><font style=\"color: #333333; \">Upgrade to MSL 3.2.1 (still compatible with MSL 3.2)</font></li>
<li><font style=\"color: #333333; \">New:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">constants HydraulicResistanceConst, HydraulicElastanceConst and HydraulicElastanceToComplianceConst and type HydraulicElastance</font></li>
<li><font style=\"color: #333333; \">display units for hydraulic resistance/conductance/compliance/elastance, for gas solubility</font></li>
<li><font style=\"color: #333333; \">steady state component ElectricChargeConservationLaw</font></li>
</ul></li>
<li><font style=\"color: #333333; \">Rename:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">HydraulicResistanceConst to HydraulicResistanceToConductanceConst</font></li>
</ul></li>
<li><font style=\"color: #333333; \">Fix:</font></li>
<li><ul>
<li><font style=\"color: #333333; \">gas solution in liquid with corrected GasSolubility type</font></li>
<li><font style=\"color: #333333; \">bidirectional stream flows</font></li>
<li><font style=\"color: #333333; \">steady state example of dissolved oxygen</font></li>
<li><font style=\"color: #333333; \">installation batch file for Dymola in Windows</font></li>
<li><font style=\"color: #333333; \">references in overview (user&apos;s guide)</font></li>
</ul></li>
</ul>
</html>"));
  end Version_2_1;

  class Version_2_0 "Version 2.0 (Jan. 26, 2014)"
    extends Modelica.Icons.ReleaseNotes;

     annotation (Documentation(info="<html>
<p><ul>
<li><font style=\"color: #333333; \">Renamed classes</font></li>
<li>Conditional inputs to blocks</li>
<li>Removed Mixed package</li>
<li>Rebuilt steady states</li>
<li><font style=\"color: #333333; \">New icons and examples</font></li>
</ul></p>
</html>"));
  end Version_2_0;

  class Version_1_2 "Version 1.2 (Jan 15, 2014)"
    extends Modelica.Icons.ReleaseNotes;

     annotation (Documentation(info="<html>
<p><ul>
<li><font style=\"color: #333333; \">Package structure Physiolibrary.{domain}.[Examples|Components|Sources|Interfaces].{component}</font></li>
<li><font style=\"color: #333333; \">New icons</font></li>
<li><font style=\"color: #333333; \">Thermal: Relative heat energy to normal body temperature (37degC)</font></li>
<li><font style=\"color: #333333; \">New examples: Guyton-Coleman-Granger cardiovascular model, Coleman thermal energy transfers</font></li>
</ul></p>
</html>"));
  end Version_1_2;

  class Version_1_1 "Version 1.1 (Dec. 30, 2013)"
    extends Modelica.Icons.ReleaseNotes;

     annotation (Documentation(info="<html>
<p><ul>
<li><font style=\"color: #333333; \">Heat connector compatibility between Physiolibrary.Thermal package and Modelica.Thermal.HeatTransfer package (MSL 3.2)</font></li>
<li><font style=\"color: #333333; \">Some English language corrections</font></li>
<li><font style=\"color: #333333; \">Hydrostatic pressure patch</font></li>
<li><font style=\"color: #333333; \">New examples</font></li>
</ul></p>
</html>"));
  end Version_1_1;

  class Version_1_0 "Version 1.0.0 (Dec. 09, 2013)"
    extends Modelica.Icons.ReleaseNotes;

  annotation (Documentation(info="<html>
<p><ul>
<li>migration to GITHub https://github.com/MarekMatejak/Physiolibrary from http://patf-biokyb.lf1.cuni.cz/repos/Modelica/Physiolibrary svn repository, commit 4947 </li>
<li><font style=\"color: #333333; \">The library uses the Modelica Standard Libary (MSL) version 3.2.</font></li>
<li><font style=\"color: #333333; \">Contains nice physiological icons.</font></li>
<li><font style=\"color: #333333; \">Support for physiological units: min,kcal,mmHg,ml,mEq,..</font></li>
<li><font style=\"color: #333333; \">Base blocks for chemical, hydraulical, osmotic, thermal or mixed domains</font></li>
<li><font style=\"color: #333333; \">Support of equilibrated systems</font></li>
<li><font style=\"color: #333333; \">Support for expandable inputs/outputs/tests lists</font></li>
</ul></p>
</html>"));
  end Version_1_0;
   annotation (Documentation(info="<html>
<p>This section summarizes the changes that have been performed on the Physiolibrary. </p>
</html>"));
  end ReleaseNotes;

  class Contact "Contact"
    extends Modelica.Icons.Contact;

   annotation (Documentation(info="<html>
<p>Marek Matejak</p>
<p>email: marek@matfy.cz</p>
<p>skype: marek.matejak</p>
<p>tel: 00420 776 301 395</p>
<p><br/>Graphics of icons:</p>
<p>Martin Broz,</p>
<p>Veronika Sykorova</p>
<p>email: elvenfall@gmail.com</p>
</html>"));

  end Contact;

  annotation (__Dymola_DocumentationClass=true, Documentation(info="<html>
<p>Package <b>Physiolibrary</b> is a modelica package for <b>Human Physiology</b> that is developed from <b>HumMod</b> modelica implementation, see <a href=\"http://patf-biokyb.lf1.cuni.cz/wiki/hummod/hummod\">http://hummod.org</a>. It provides constants, types, connectors, partial models and model components fitted for physiological models of human body. </p>
<p>This is a short <b>User&apos;s Guide</b> for the overall library. Some of the main sublibraries have their own User&apos;s Guides that can be accessed by the following links: </p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<td valign=\"top\"><p>Types </p></td>
<td valign=\"top\"><p>Physiological types. Physiological unit vs. SI units, nominals, inputs/outputs, typed constants.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Blocks</p></td>
<td valign=\"top\"><p>Usefull blocks, that are missing in package Modelica.Blocks (MSL 3.2), cubic interpolation curves, multiplication factors.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Chemical</p></td>
<td valign=\"top\"><p>Library to chemical subsystems such as intravascular, interstitial or intracellular chemical substances in fluxes and interactions.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Hydraulic</p></td>
<td valign=\"top\"><p>Library to hydraulic subsystems such as in cardiovascular system.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Thermal</p></td>
<td valign=\"top\"><p>Library of termoregulation support.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Osmotic</p></td>
<td valign=\"top\"><p>Library to model water fluxes through semipermeable membrane caused by osmotic pressure.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Mixed</p></td>
<td valign=\"top\"><p>Library to join domains above together.</p></td>
</tr>
<tr>
<td valign=\"top\"><p>Icons</p></td>
<td valign=\"top\"><p>Icons</p></td>
</tr>
<tr>
<td valign=\"top\"><p>FileUtilities</p></td>
<td valign=\"top\"><p>Read/write values from/to file. </p></td>
</tr>
</table>
</html>"));
  end UsersGuide;

  package Chemical "Domain with Molar Concentration and Molar Flow"
   extends Modelica.Icons.Package;
    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;

      model SimpleReaction

         extends Modelica.Icons.Example;

         import Physiolibrary.Chemical.Components.*;

        Substance         A(solute_start=0.9)
          annotation (Placement(transformation(extent={{-56,-8},{-36,12}})));
        ChemicalReaction          reaction(K=1)
          annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
        Substance         B(solute_start=0.1)
          annotation (Placement(transformation(extent={{42,-8},{62,12}})));
      equation

        connect(B.q_out, reaction.products[1]) annotation (Line(
            points={{52,2},{10,2}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(A.q_out, reaction.substrates[1]) annotation (Line(
            points={{-46,2},{-10,2}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=1e-007));
      end SimpleReaction;

      model SimpleReaction2
         extends Modelica.Icons.Example;

        import Physiolibrary.Chemical.Components.*;

        Substance         A(solute_start=0.9)
          annotation (Placement(transformation(extent={{-40,-8},{-20,12}})));
        ChemicalReaction          reaction(K=1, nP=2)
          annotation (Placement(transformation(extent={{-6,-8},{14,12}})));
        Substance         B(solute_start=0.1)
          annotation (Placement(transformation(extent={{36,-8},{56,12}})));
        Substance         C(solute_start=0.1)
          annotation (Placement(transformation(extent={{36,16},{56,36}})));
      equation

        connect(A.q_out, reaction.substrates[1]) annotation (Line(
            points={{-30,2},{-6,2}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(reaction.products[1], B.q_out) annotation (Line(
            points={{14,1.5},{24,1.5},{24,2},{46,2}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(reaction.products[2], C.q_out) annotation (Line(
            points={{14,2.5},{24,2.5},{24,26},{46,26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=1e-009));
      end SimpleReaction2;

      model ExothermicReaction

         extends Modelica.Icons.Example;
        import Physiolibrary.Chemical;

        Components.Substance         A(solute_start=0.9)
          annotation (Placement(transformation(extent={{-56,-8},{-36,12}})));
        Components.ChemicalReaction
                                  reaction(K=1,
          useHeatPort=true,
          dH=-1000,
          kf=1)
          annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
        Components.Substance         B(solute_start=0.1)
          annotation (Placement(transformation(extent={{44,-8},{64,12}})));
        Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor
          annotation (Placement(transformation(extent={{12,-58},{32,-38}})));
        Physiolibrary.Thermal.Sources.UnlimitedHeat unlimitedHeat(T=310.15)
          annotation (Placement(transformation(extent={{74,-58},{54,-38}})));
      equation

        connect(B.q_out, reaction.products[1]) annotation (Line(
            points={{54,2},{10,2}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(A.q_out, reaction.substrates[1]) annotation (Line(
            points={{-46,2},{-10,2}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(reaction.heatPort, heatFlowSensor.port_a) annotation (Line(
            points={{0,2},{0,-48},{12,-48}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(unlimitedHeat.port, heatFlowSensor.port_b) annotation (Line(
            points={{54,-48},{32,-48}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=5));
      end ExothermicReaction;

      model MichaelisMenten "Basic enzyme kinetics"
        import Physiolibrary;
        extends Modelica.Icons.Example;
        extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
                                                   Simulation=Types.SimulationType.SteadyState);
         import Physiolibrary.Types.*;

        Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage
                         P(Conc=0)
          annotation (Placement(transformation(extent={{92,-12},{72,8}})));
        Physiolibrary.Chemical.Sources.UnlimitedSolutionStorage
                         S(Conc=0.1)
          annotation (Placement(transformation(extent={{-94,-12},{-74,8}})));

           parameter AmountOfSubstance tE=0.01 "total amount of enzyme";
           parameter Real k_cat(unit="1/s", displayUnit="1/min")= 1
          "forward rate of second reaction";
           parameter Physiolibrary.Types.Concentration Km = 0.1
          "Michaelis constant = substrate concentration at rate of half Vmax";

            Physiolibrary.Chemical.Components.Substance
                                ES(                       solute_start=0,
              Simulation=SimulationType.SteadyState)
              annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
            Physiolibrary.Chemical.Components.Substance
                                E(                       solute_start=tE,
              isDependent=true,
              Simulation=SimulationType.SteadyState)
              annotation (Placement(transformation(extent={{-10,38},{10,58}})));
            Components.ChemicalReaction
                             chemicalReaction(nS=2,
              K=2/Km,
              kf=2*k_cat/Km)
              annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
            Components.ChemicalReaction
                             chemicalReaction1(nP=2,
              K=Modelica.Constants.inf,
              kf=k_cat)
              annotation (Placement(transformation(extent={{24,-10},{44,10}})));

           // Real v(unit="mol/s", displayUnit="mmol/min") "test of MM equation";
      equation
            normalizedState[1]*tE = E.solute + ES.solute;

           //Michaelis-Menton: v=((E.q_out.conc + ES.q_out.conc)*k_cat)*S.concentration/(Km+S.concentration);

        connect(S.q_out, chemicalReaction.substrates[1]) annotation (Line(
            points={{-74,-2},{-60,-2},{-60,-0.5},{-42,-0.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(chemicalReaction1.products[1], P.q_out) annotation (Line(
            points={{44,-0.5},{54,-0.5},{54,-2},{72,-2}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(E.q_out, chemicalReaction.substrates[2]) annotation (Line(
            points={{0,48},{-50,48},{-50,0.5},{-42,0.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(E.q_out, chemicalReaction1.products[2]) annotation (Line(
            points={{0,48},{50,48},{50,0.5},{44,0.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(chemicalReaction.products[1], ES.q_out) annotation (Line(
            points={{-22,0},{0,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(ES.q_out, chemicalReaction1.substrates[1]) annotation (Line(
            points={{0,0},{24,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
            annotation ( Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=1));
      end MichaelisMenten;

      model HendersonHaselbalch
          extends Modelica.Icons.Example;
        Components.Substance HCO3(isDependent=true, Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{-18,46},{2,66}})));
        Components.ChemicalReaction HendersonHasselbalch(
          nP=2,
          K=10^(-6.103 + 3),
          dH=15.13)
          annotation (Placement(transformation(extent={{-58,22},{-38,42}})));
        Sources.UnlimitedGasStorage CO2_gas(PartialPressure=5332.8954966,
            Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,82})));
        Sources.UnlimitedSolutionStorage pH(
          q_out(conc(nominal=10^(-7.4 + 3))),
          Conc=10^(-7.4 + 3),
          isIsolatedInSteadyState=false,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-8,12})));
        Components.GasSolubility gasSolubility(C=2400, kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
               0.81805576878885)
          annotation (Placement(transformation(extent={{-90,46},{-70,66}})));
        Components.Substance CO2_liquid(Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{-90,22},{-70,42}})));
      equation
        connect(HendersonHasselbalch.products[1], HCO3.q_out) annotation (Line(
            points={{-38,31.5},{-26,31.5},{-26,56},{-8,56}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(pH.q_out, HendersonHasselbalch.products[2]) annotation (Line(
            points={{-18,12},{-26,12},{-26,32.5},{-38,32.5}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(CO2_liquid.q_out, HendersonHasselbalch.substrates[1]) annotation (
           Line(
            points={{-80,32},{-58,32}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(gasSolubility.q_in, CO2_liquid.q_out) annotation (Line(
            points={{-80,48},{-80,32}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(CO2_gas.q_out, gasSolubility.q_out) annotation (Line(
            points={{-80,72},{-80,66}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        annotation ( Documentation(info="<html>
<p>Henderson-Hasselbalch equation in ideal buffered solution, where pH remains constant.</p>
<p>The partial pressure of CO2 in gas are input parameter. Outputs are an amount of free disolved CO2 in liquid and an amount of HCO3-.</p>
</html>",      revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=1));
      end HendersonHaselbalch;

      package Hemoglobin "Hemoglobin blood gases binding"
        model Allosteric_Hemoglobin_MWC "Monod,Wyman,Changeux (1965)"
        extends Modelica.Icons.Example;
          import Physiolibrary.Chemical.*;
          import Physiolibrary.Types.*;

        //extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
        //                                         Simulation=SimulationType.SteadyState);

          parameter Temperature T=310.15 "Temperature";
        //  parameter GasSolubility alpha =  Modelica.Constants.R*298.15 * 0.0105 * 1e-3
        //    "oxygen solubility in plasma";
                                           // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

          parameter Fraction L = 7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Fraction c = 0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Concentration KR = 0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                    //10.500001495896 7.8756465463794e-05

          parameter Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

        //  Fraction sO2 "hemoglobin oxygen saturation";

          parameter AmountOfSubstance totalAmountOfHemoglobin=1;
        //  AmountOfSubstance totalAmountOfRforms;
        //  AmountOfSubstance totalAmountOfTforms;

          Components.Substance                       T0(stateName="T0",Simulation=SimulationType.SteadyState,
            solute_start=1)
            annotation (Placement(transformation(extent={{32,78},{52,98}})));

          Components.Substance                       T1(stateName="T1",Simulation=SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{34,36},{54,56}})));

          Components.Substance                       R1(stateName="R1",Simulation=SimulationType.SteadyState,
            solute_start=0,
            isDependent=true)
            annotation (Placement(transformation(extent={{-20,36},{0,56}})));

          Components.Substance                       T2(stateName="T2",Simulation=SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{34,-10},{54,10}})));

          Components.Substance                       R2(stateName="R2",Simulation=SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

          Components.Substance                       T3(stateName="T3",Simulation=SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{34,-54},{54,-34}})));

          Components.Substance                       R3(stateName="R3",Simulation=SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{-20,-54},{0,-34}})));

          Components.Substance                       T4(stateName="T4",Simulation=SimulationType.SteadyState,
            solute_start=0,
            isDependent=true)
            annotation (Placement(transformation(extent={{34,-92},{54,-72}})));

          Components.Substance                       R4(stateName="R4",Simulation=SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{-20,-92},{0,-72}})));

          Components.Substance                       R0(stateName="R0",Simulation=SimulationType.SteadyState,
            solute_start=0)
            annotation (Placement(transformation(extent={{-20,78},{0,98}})));

          Components.ChemicalReaction               quaternaryForm(K=L)
            annotation (Placement(transformation(extent={{4,78},{24,98}})));
          Components.ChemicalReaction                oxyR1(nP=2, K=KR/4)
                                                                    annotation (Placement(
                transformation(
                extent={{-10,10},{10,-10}},
                rotation=90,
                origin={-10,64})));
          Components.ChemicalReaction                oxyT1(nP=2, K=KT/4)
                                                                    annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={44,64})));
          Components.ChemicalReaction                oxyR2(nP=2, K=KR/(3/2))
                                                                    annotation (Placement(
                transformation(
                extent={{-10,10},{10,-10}},
                rotation=90,
                origin={-10,22})));
          Components.ChemicalReaction                oxyR3(nP=2, K=KR/(2/3))
                                                                    annotation (Placement(
                transformation(
                extent={{-10,10},{10,-10}},
                rotation=90,
                origin={-10,-24})));
          Components.ChemicalReaction                oxyR4(nP=2, K=KR*4)
                                                                    annotation (Placement(
                transformation(
                extent={{-10,10},{10,-10}},
                rotation=90,
                origin={-10,-66})));
          Components.ChemicalReaction                oxyT2(nP=2, K=KT/(3/2))
                                                                    annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={44,22})));
          Components.ChemicalReaction                oxyT3(nP=2, K=KT/(2/3))
                                                                    annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={44,-24})));
          Components.ChemicalReaction                oxyT4(nP=2, K=KT*4)
                                                                    annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={44,-66})));
          Components.ChemicalReaction               quaternaryForm1(K=c*L)
            annotation (Placement(transformation(extent={{8,36},{28,56}})));
          Components.ChemicalReaction               quaternaryForm2(K=(c^2)*L)
            annotation (Placement(transformation(extent={{8,-10},{28,10}})));
          Components.ChemicalReaction               quaternaryForm3(K=(c^3)*L)
            annotation (Placement(transformation(extent={{8,-54},{28,-34}})));
          Components.ChemicalReaction               quaternaryForm4(K=(c^4)*L)
            annotation (Placement(transformation(extent={{10,-92},{30,-72}})));

          SteadyStates.Components.MolarConservationLaw hemoglobinConservationLaw(
            n=10, Total(displayUnit="mol") = 1,
            Simulation=Physiolibrary.Types.SimulationType.SteadyState)
            annotation (Placement(transformation(extent={{72,-2},{92,18}})));
          Modelica.Blocks.Math.Sum oxygen_bound(k={1,1,2,2,3,3,4,4}, nin=8)
            annotation (Placement(transformation(extent={{72,-56},{82,-46}})));
          Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation"
            annotation (Placement(transformation(extent={{86,-60},{96,-50}})));
          Modelica.Blocks.Math.Sum tHb(nin=10, k=4*ones(10))
            annotation (Placement(transformation(extent={{72,-70},{82,-60}})));
          Components.Substance          oxygen_unbound(solute_start=0.000001*
                7.875647668393782383419689119171e-5, Simulation=SimulationType.SteadyState)
            annotation (Placement(transformation(extent={{-56,-44},{-36,-24}})));
          Modelica.Blocks.Sources.Clock clock(offset=60)
            annotation (Placement(transformation(extent={{-94,44},{-74,64}})));
          Sources.UnlimitedGasStorage          O2_in_air(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            usePartialPressureInput=true,
            T=310.15)   annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-66,24})));
          Components.GasSolubility          gasSolubility(
                                              useHeatPort=false, kH_T0=
                0.026029047188736)
            annotation (Placement(transformation(extent={{-76,-14},{-56,6}})));
        equation
         //  sO2 = (R1.solute + 2*R2.solute + 3*R3.solute + 4*R4.solute + T1.solute + 2*T2.solute + 3*T3.solute + 4*T4.solute)/(4*totalAmountOfHemoglobin);
        //   totalAmountOfRforms = R0.solute + R1.solute + R2.solute + R3.solute + R4.solute;
        //   totalAmountOfTforms = T0.solute + T1.solute + T2.solute + T3.solute + T4.solute;

        //   totalAmountOfHemoglobin*normalizedState[1] = totalAmountOfRforms + totalAmountOfTforms;

          connect(quaternaryForm.products[1],T0. q_out) annotation (Line(
              points={{24,88},{42,88}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyR1.substrates[1],R1. q_out) annotation (Line(
              points={{-10,54},{-10,46}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(R1.q_out,oxyR2. products[1]) annotation (Line(
              points={{-10,46},{-10,32},{-10.5,32}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyR2.substrates[1],R2. q_out) annotation (Line(
              points={{-10,12},{-10,0}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyR3.substrates[1],R3. q_out) annotation (Line(
              points={{-10,-34},{-10,-44}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyR3.products[1],R2. q_out) annotation (Line(
              points={{-10.5,-14},{-10.5,-7},{-10,-7},{-10,0}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(R3.q_out,oxyR4. products[1]) annotation (Line(
              points={{-10,-44},{-10,-56},{-10.5,-56}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyR4.substrates[1],R4. q_out) annotation (Line(
              points={{-10,-76},{-10,-82}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyT1.products[1],T0. q_out) annotation (Line(
              points={{44.5,74},{44.5,88},{42,88}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyT1.substrates[1],T1. q_out) annotation (Line(
              points={{44,54},{44,46}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(T1.q_out,oxyT2. products[1]) annotation (Line(
              points={{44,46},{44,32},{44.5,32}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyT2.substrates[1],T2. q_out) annotation (Line(
              points={{44,12},{44,0}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(T2.q_out,oxyT3. products[1]) annotation (Line(
              points={{44,0},{44,-14},{44.5,-14}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyT3.substrates[1],T3. q_out) annotation (Line(
              points={{44,-34},{44,-44}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(T3.q_out,oxyT4. products[1]) annotation (Line(
              points={{44,-44},{44,-56},{44.5,-56}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyT4.substrates[1],T4. q_out) annotation (Line(
              points={{44,-76},{44,-82}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(R0.q_out,quaternaryForm. substrates[1]) annotation (Line(
              points={{-10,88},{4,88}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(R0.q_out,oxyR1. products[1]) annotation (Line(
              points={{-10,88},{-10,74},{-10.5,74}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(R1.q_out,quaternaryForm1. substrates[1]) annotation (Line(
              points={{-10,46},{8,46}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(quaternaryForm1.products[1],T1. q_out) annotation (Line(
              points={{28,46},{44,46}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(R2.q_out,quaternaryForm2. substrates[1]) annotation (Line(
              points={{-10,0},{8,0}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(quaternaryForm2.products[1],T2. q_out) annotation (Line(
              points={{28,0},{44,0}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(R3.q_out,quaternaryForm3. substrates[1]) annotation (Line(
              points={{-10,-44},{8,-44}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(quaternaryForm3.products[1],T3. q_out) annotation (Line(
              points={{28,-44},{44,-44}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(R4.q_out,quaternaryForm4. substrates[1]) annotation (Line(
              points={{-10,-82},{10,-82}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(quaternaryForm4.products[1],T4. q_out) annotation (Line(
              points={{30,-82},{44,-82}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(R4.solute,hemoglobinConservationLaw. fragment[1])        annotation (
              Line(
              points={{-10,-92},{-10,-98},{64,-98},{64,2.2},{72,2.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T4.solute,hemoglobinConservationLaw. fragment[2])        annotation (
              Line(
              points={{44,-92},{44,-98},{64,-98},{64,2.6},{72,2.6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R3.solute,hemoglobinConservationLaw. fragment[3])        annotation (
              Line(
              points={{-10,-54},{64,-54},{64,3},{72,3}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T3.solute,hemoglobinConservationLaw. fragment[4])        annotation (
              Line(
              points={{44,-54},{64,-54},{64,3.4},{72,3.4}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R2.solute,hemoglobinConservationLaw. fragment[5])        annotation (
              Line(
              points={{-10,-10},{64,-10},{64,3.8},{72,3.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T2.solute,hemoglobinConservationLaw. fragment[6])        annotation (
              Line(
              points={{44,-10},{64,-10},{64,4.2},{72,4.2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R1.solute,hemoglobinConservationLaw. fragment[7])        annotation (
              Line(
              points={{-10,36},{64,36},{64,4.6},{72,4.6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T1.solute,hemoglobinConservationLaw. fragment[8])        annotation (
              Line(
              points={{44,36},{64,36},{64,5},{72,5}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R0.solute,hemoglobinConservationLaw. fragment[9])        annotation (
              Line(
              points={{-10,78},{64,78},{64,5.4},{72,5.4}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T0.solute,hemoglobinConservationLaw. fragment[10])        annotation (
             Line(
              points={{42,78},{64,78},{64,5.8},{72,5.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R1.solute,oxygen_bound. u[1]) annotation (Line(
              points={{-10,36},{64,36},{64,-51.875},{71,-51.875}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T1.solute,oxygen_bound. u[2]) annotation (Line(
              points={{44,36},{64,36},{64,-51.625},{71,-51.625}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R2.solute,oxygen_bound. u[3]) annotation (Line(
              points={{-10,-10},{64,-10},{64,-51.375},{71,-51.375}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T2.solute,oxygen_bound. u[4]) annotation (Line(
              points={{44,-10},{64,-10},{64,-51.125},{71,-51.125}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R3.solute,oxygen_bound. u[5]) annotation (Line(
              points={{-10,-54},{64,-54},{64,-50.875},{71,-50.875}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T3.solute,oxygen_bound. u[6]) annotation (Line(
              points={{44,-54},{64,-54},{64,-50.625},{71,-50.625}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R4.solute,oxygen_bound. u[7]) annotation (Line(
              points={{-10,-92},{-10,-98},{64,-98},{64,-50.375},{71,-50.375}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T4.solute,oxygen_bound. u[8]) annotation (Line(
              points={{44,-92},{44,-98},{64,-98},{64,-50.125},{71,-50.125}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(oxygen_bound.y,sO2_. u1) annotation (Line(
              points={{82.5,-51},{84,-51},{84,-52},{85,-52}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(sO2_.u2,tHb. y) annotation (Line(
              points={{85,-58},{84,-58},{84,-65},{82.5,-65}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R0.solute,tHb. u[1]) annotation (Line(
              points={{-10,78},{64,78},{64,-65.9},{71,-65.9}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T0.solute,tHb. u[2]) annotation (Line(
              points={{42,78},{64,78},{64,-65.7},{71,-65.7}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R1.solute,tHb. u[3]) annotation (Line(
              points={{-10,36},{64,36},{64,-65.5},{71,-65.5}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T1.solute,tHb. u[4]) annotation (Line(
              points={{44,36},{64,36},{64,-65.3},{71,-65.3}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R2.solute,tHb. u[5]) annotation (Line(
              points={{-10,-10},{64,-10},{64,-65.1},{71,-65.1}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T2.solute,tHb. u[6]) annotation (Line(
              points={{44,-10},{64,-10},{64,-64.9},{71,-64.9}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R3.solute,tHb. u[7]) annotation (Line(
              points={{-10,-54},{64,-54},{64,-64.7},{71,-64.7}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T3.solute,tHb. u[8]) annotation (Line(
              points={{44,-54},{64,-54},{64,-64.5},{71,-64.5}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(R4.solute,tHb. u[9]) annotation (Line(
              points={{-10,-92},{-10,-98},{64,-98},{64,-64.3},{71,-64.3}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(T4.solute,tHb. u[10]) annotation (Line(
              points={{44,-92},{44,-98},{64,-98},{64,-64.1},{71,-64.1}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(oxyR1.products[2],oxygen_unbound. q_out)
                                              annotation (Line(
              points={{-9.5,74},{-46,74},{-46,-34}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyR2.products[2],oxygen_unbound. q_out)
                                              annotation (Line(
              points={{-9.5,32},{-46,32},{-46,-34}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyR3.products[2],oxygen_unbound. q_out)
                                              annotation (Line(
              points={{-9.5,-14},{-46,-14},{-46,-34}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxyR4.products[2],oxygen_unbound. q_out)
                                              annotation (Line(
              points={{-9.5,-56},{-46,-56},{-46,-34}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygen_unbound.q_out, oxyT1.products[2])
                                              annotation (Line(
              points={{-46,-34},{-46,74},{43.5,74}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygen_unbound.q_out, oxyT2.products[2])
                                              annotation (Line(
              points={{-46,-34},{-46,32},{43.5,32}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygen_unbound.q_out, oxyT3.products[2])
                                              annotation (Line(
              points={{-46,-34},{-46,-14},{43.5,-14}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygen_unbound.q_out, oxyT4.products[2])
                                              annotation (Line(
              points={{-46,-34},{-46,-56},{43.5,-56}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygen_unbound.q_out,gasSolubility. q_in) annotation (Line(
              points={{-46,-34},{-66,-34},{-66,-12}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(O2_in_air.q_out,gasSolubility. q_out) annotation (Line(
              points={{-66,14},{-66,6}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(clock.y,O2_in_air. partialPressure) annotation (Line(
              points={{-73,54},{-66,54},{-66,34}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (          experiment(StopTime=10000), Documentation(info=
                     "<html>
<p>To understand the model is necessary to study the principles of MWC allosteric transitions first published by </p>
<p>Monod,Wyman,Changeux (1965). &QUOT;On the nature of allosteric transitions: a plausible model.&QUOT; Journal of molecular biology 12(1): 88-118.</p>
<p><br/>In short it is about binding oxygen to hemoglobin.</p>
<p>Oxgen are driven by its partial pressure using clock source - from very little pressure to pressure of 10kPa.</p>
<p>(Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air.)</p>
<p>Hemoglobin was observed (by Perutz) in two structuraly different forms R and T.</p>
<p>These forms are represented by blocks T0..T4 and R0..R4, where the suffexed index means the number of oxygen bounded to the form.</p>
<p><br/>In equilibrated model can be four chemical reactions removed and the results will be the same, but dynamics will change a lot. ;)</p>
<p>If you remove the quaternaryForm1,quaternaryForm2,quaternaryForm3,quaternaryForm4 then the model in equilibrium will be exactly the same as in MWC article.</p>
<p><br/>Parameters was fitted to data of Severinghaus article from 1979. (For example at pO2=26mmHg is oxygen saturation sO2 = 48.27 &percnt;).</p>
</html>",     revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
        end Allosteric_Hemoglobin_MWC;

        model Allosteric_Hemoglobin2_MWC
          "Monod,Wyman,Changeux (1965) - The same allosteric hemoglobin model as Allosteric_Hemoglobin_MWC implemented by Speciation blocks"
          import Physiolibrary.Types.*;

         extends Modelica.Icons.Example;

        // extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
        //                                          Simulation=SimulationType.SteadyState);

        //  parameter GasSolubility alpha =  0.0105 * 1e-3 "oxygen solubility in plasma";   // by Siggaard Andersen: 0.0105 (mmol/l)/kPa

          parameter Fraction L = 7.0529*10^6
            "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
          parameter Fraction c = 0.00431555
            "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
          parameter Concentration KR = 0.000671946
            "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                    //10.500001495896 7.8756465463794e-05

          parameter Concentration KT=KR/c
            "oxygen dissociation on tensed(T) hemoglobin subunit";

         // Fraction sO2 "hemoglobin oxygen saturation";

          parameter AmountOfSubstance totalAmountOfHemoglobin=0.001;

          Physiolibrary.Chemical.Components.ChemicalReaction
                                                    quaternaryForm(K=L)
            annotation (Placement(transformation(extent={{-4,-84},{16,-64}})));
          Components.Speciation
                             R0_in_R(NumberOfSubunitTypes=4)
            annotation (Placement(transformation(extent={{-32,-76},{-52,-56}})));
          Components.Speciation
                             T0_in_T(NumberOfSubunitTypes=4)
            annotation (Placement(transformation(extent={{68,-76},{48,-56}})));
          Physiolibrary.Chemical.Components.Substance OxyRHm[4](
            each Simulation=SimulationType.SteadyState,
            each isDependent=true,
            each solute_start=4e-19)
            "Oxygenated subunit in R structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{-98,-36},{-78,-16}})));
          Physiolibrary.Chemical.Components.ChemicalReaction oxygenation_R[4](each K=KR, each nP=2)
            annotation (Placement(transformation(extent={{-70,-36},{-50,-16}})));
          Physiolibrary.Chemical.Components.Substance DeoxyRHm[4](each Simulation=
                SimulationType.SteadyState, each solute_start=4e-11)
            "Deoxygenated subunit in R structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{-42,-36},{-22,-16}})));
          Physiolibrary.Chemical.Components.Substance OxyTHm[4](
            each Simulation=SimulationType.SteadyState,
            each isDependent=true,
            each solute_start=1e-14)
            "Oxygenated subunit in T structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{14,-36},{34,-16}})));
          Physiolibrary.Chemical.Components.ChemicalReaction oxygenation_T[4](each K=KT, each nP=2)
            annotation (Placement(transformation(extent={{42,-36},{62,-16}})));
          Physiolibrary.Chemical.Components.Substance DeoxyTHm[4](
                                                   each Simulation=SimulationType.SteadyState,
              each solute_start=0.00025)
            "Deoxygenated subunit in T structure of hemoglobin tetramer"
            annotation (Placement(transformation(extent={{70,-36},{90,-16}})));

          Physiolibrary.Chemical.Components.Substance
                              oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
                *7.875647668393782383419689119171e-5)
            annotation (Placement(transformation(extent={{-4,-2},{16,18}})));
          Modelica.Blocks.Sources.Clock clock(offset=60)
            annotation (Placement(transformation(extent={{-40,74},{-20,94}})));
          Modelica.Blocks.Math.Add add[4] annotation (Placement(transformation(
                extent={{-4,-4},{4,4}},
                rotation=270,
                origin={-66,-54})));
          Modelica.Blocks.Math.Add add1[4] annotation (Placement(transformation(
                extent={{-4,-4},{4,4}},
                rotation=270,
                origin={44,-54})));
          Sources.UnlimitedGasStorage oxygen_in_air(
            Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            usePartialPressureInput=true,
            T=310.15)                                annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={6,60})));
          Components.GasSolubility
                                partialPressure1(          kH_T0(displayUnit="(mmol/l)/kPa at 25degC")=
                 0.026029047188736, T=310.15)                             annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                origin={6,32})));
          SteadyStates.Components.MolarConservationLaw totalHb(
            Simulation=Physiolibrary.Types.SimulationType.SteadyState,
            Total(displayUnit="mol") = totalAmountOfHemoglobin,
            n=2)
            annotation (Placement(transformation(extent={{70,-92},{90,-72}})));
          Modelica.Blocks.Math.Sum sum1(nin=8, k=(1/4)*ones(8))
                                               annotation (Placement(transformation(
                extent={{-4,-4},{4,4}},
                rotation=270,
                origin={-74,-82})));
          Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation"
            annotation (Placement(transformation(extent={{-64,-96},{-54,-86}})));
        equation
        //  totalAmountOfHemoglobin*normalizedState[1] = sum(OxyRHm.solute) + sum(DeoxyRHm.solute) + sum(OxyTHm.solute) + sum(DeoxyTHm.solute);

        //  sO2 = (sum(OxyRHm.solute) + sum(OxyTHm.solute))/totalAmountOfHemoglobin;

          connect(R0_in_R.species, quaternaryForm.substrates[1])
                                                           annotation (Line(
              points={{-52,-74},{-4,-74}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(quaternaryForm.products[1], T0_in_T.species)
                                                         annotation (Line(
              points={{16,-74},{48,-74}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(OxyTHm.q_out, oxygenation_T.substrates[1])
                                                   annotation (Line(
              points={{24,-26},{42,-26}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation_T.products[1], DeoxyTHm.q_out)
                                                 annotation (Line(
              points={{62,-26.5},{72,-26.5},{72,-26},{80,-26}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));

          connect(OxyTHm.solute, add1.u2) annotation (Line(
              points={{24,-36},{24,-42},{41.6,-42},{41.6,-49.2}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(add1.u1, DeoxyTHm.solute) annotation (Line(
              points={{46.4,-49.2},{46.4,-42},{80,-42},{80,-36}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(partialPressure1.q_out, oxygen_in_air.q_out)
                                                    annotation (Line(
              points={{6,42},{6,50}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(partialPressure1.q_in, oxygen_unbound.q_out) annotation (Line(
              points={{6,24},{6,8}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(clock.y, oxygen_in_air.partialPressure) annotation (Line(
              points={{-19,84},{6,84},{6,70}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add.y, R0_in_R.totalSubunitAmount) annotation (Line(
              points={{-66,-58.4},{-66,-66},{-50,-66}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(OxyRHm.solute, add.u2) annotation (Line(
              points={{-88,-36},{-88,-44},{-68.4,-44},{-68.4,-49.2}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(DeoxyRHm.solute, add.u1) annotation (Line(
              points={{-32,-36},{-32,-36},{-32,-44},{-63.6,-44},{-63.6,-50},{
                  -63.6,-49.2}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(OxyRHm.q_out, oxygenation_R.substrates[1]) annotation (Line(
              points={{-88,-26},{-70,-26}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(DeoxyRHm.q_out, R0_in_R.subunitSpecies) annotation (Line(
              points={{-32,-26},{-42,-26},{-42,-56}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation_R.products[1], DeoxyRHm.q_out) annotation (Line(
              points={{-50,-26.5},{-42,-26.5},{-42,-26},{-32,-26}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation_R[1].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{-50,-25.5},{-36,-25.5},{-36,12},{6,12},{6,8}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation_R[2].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{-50,-25.5},{-36,-25.5},{-36,12},{6,12},{6,8}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation_R[3].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{-50,-25.5},{-36,-25.5},{-36,12},{6,12},{6,8}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation_R[4].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{-50,-25.5},{-36,-25.5},{-36,12},{6,12},{6,8}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation_T[1].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{62,-25.5},{78,-25.5},{78,8},{6,8}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(oxygenation_T[2].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{62,-25.5},{78,-25.5},{78,8},{6,8}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
         connect(oxygenation_T[3].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{62,-25.5},{78,-25.5},{78,8},{6,8}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
              connect(oxygenation_T[4].products[2], oxygen_unbound.q_out) annotation (Line(
              points={{62,-25.5},{78,-25.5},{78,8},{6,8}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(T0_in_T.subunitSpecies, DeoxyTHm.q_out)
                                                       annotation (Line(
              points={{58,-56},{84,-56},{84,-26},{80,-26}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(add1.y, T0_in_T.totalSubunitAmount)
                                                   annotation (Line(
              points={{44,-58.4},{44,-66},{50,-66}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(R0_in_R.totalSubsystemAmount, totalHb.fragment[1]) annotation (Line(
              points={{-42,-74},{-42,-87},{70,-87}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(T0_in_T.totalSubsystemAmount, totalHb.fragment[2]) annotation (Line(
              points={{58,-74},{58,-74},{58,-85},{70,-85}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(OxyRHm.solute, sum1.u[1:4]) annotation (Line(
              points={{-88,-36},{-86,-36},{-86,-72},{-74,-72},{-74,-77.2},{-74.1,
                  -77.2}},
              color={0,0,127},
              smooth=Smooth.Bezier));

          connect(OxyTHm.solute, sum1.u[5:8]) annotation (Line(
              points={{24,-36},{24,-70},{-73.3,-70},{-73.3,-77.2}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(sO2_.u1, sum1.y) annotation (Line(
              points={{-65,-88},{-74,-88},{-74,-86.4}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          connect(totalHb.totalAmountOfSubstance, sO2_.u2) annotation (Line(
              points={{90,-86},{96,-86},{96,-100},{-80,-100},{-80,-94},{-65,-94}},
              color={0,0,127},
              smooth=Smooth.Bezier));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics={Ellipse(
                  extent={{2,-6},{100,-54}},
                  fillColor={255,181,181},
                  fillPattern=FillPattern.Solid,
                  pattern=LinePattern.None), Ellipse(
                  extent={{-104,-6},{-6,-54}},
                  fillColor={255,181,181},
                  fillPattern=FillPattern.Solid,
                  pattern=LinePattern.None)}),
            experiment(StopTime=10000),
            Documentation(revisions=
                          "<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>To understand the model is necessary to study the principles of MWC allosteric transitions first published by </p>
<p>Monod,Wyman,Changeux (1965). &QUOT;On the nature of allosteric transitions: a plausible model.&QUOT; Journal of molecular biology 12(1): 88-118.</p>
<p><br>In short it is about binding oxygen to hemoglobin.</p>
<p>Oxgen are driven by its partial pressure using clock source - from very little pressure to pressure of 10kPa.</p>
<p>(Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air.)</p>
<p>Hemoglobin was observed (by Perutz) in two structuraly different forms R and T.</p>
<p>These forms are represented by blocks T0..T4 and R0..R4, where the suffexed index means the number of oxygen bounded to the form.</p>
<p><br>In equilibrated model can be four chemical reactions removed and the results will be the same, but dynamics will change a lot. ;)</p>
<p>If you remove the quaternaryForm1,quaternaryForm2,quaternaryForm3,quaternaryForm4 then the model in equilibrium will be exactly the same as in MWC article.</p>
<p><br>Parameters was fitted to data of Severinghaus article from 1979. (For example at pO2=26mmHg is oxygen saturation sO2 = 48.27 &percnt;).</p>
</html>"));
        end Allosteric_Hemoglobin2_MWC;

      end Hemoglobin;
    end Examples;

    package Components
      extends Modelica.Icons.Package;
      model Substance "Substance accumulation in solvent"
        extends Physiolibrary.Icons.Substance;
        extends Chemical.Interfaces.ConditionalSolventVolume;

        extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
        state(nominal=NominalSolute),
        change(nominal=NominalSolute/60),
        state_start=solute_start,
        storeUnit="mmol");

        parameter Physiolibrary.Types.AmountOfSubstance
                                          solute_start(nominal=NominalSolute) = 0
          "Initial solute amount in compartment"
           annotation ( HideResult=true, Dialog(group="Initialization"));

        Physiolibrary.Types.RealIO.AmountOfSubstanceOutput solute(nominal=
            NominalSolute) "Current amount of solute"
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-100})));

        parameter Physiolibrary.Types.AmountOfSubstance
                                          NominalSolute = 0.001
          "Numerical scale. Default is from mmol to mol, but for some substances such as hormones, hydronium or hydroxide ions can be much smaller."
            annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very small concentrations"));

        Physiolibrary.Chemical.Interfaces.ChemicalPort_b            q_out
          "Flux from/to compartment" annotation (Placement(transformation(extent={{-10,
                  -10},{10,10}})));

      equation
        q_out.conc = solute/volume; //TODO: solute/(solvent+solute)?

        state = solute; // der(solute)=q_out.q
        change = q_out.q;

                                                                                                          annotation (choicesAllMatching=true,
          Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={                                    Text(
                extent={{-22,-102},{220,-136}},
                lineColor={0,0,255},
                textString="%name")}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Substance;

      model ChemicalReaction "Chemical Reaction"
        import Physiolibrary;

        Real KaT "Dissociation constant at current temperature";
        Physiolibrary.Types.MolarFlowRate rr "Reaction molar flow rate";

        extends Chemical.Interfaces.ConditionalSolventVolume;

        parameter Boolean useDissociationConstantInput = false
          "=true, if external dissociation ratio is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        Modelica.Blocks.Interfaces.RealInput dissociationConstant(start=K) = KBase if useDissociationConstantInput
          "Dissociation constant [SI-unit]" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

        Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                  products[nP] "Products"
                               annotation (Placement(
              transformation(extent={{90,-10},{110,10}})));

        Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                  substrates[nS] "Substrates"
                                  annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}})));  /*s[nS]*/

        parameter Real K = 1
          "Fixed dissociation constant [SI-unit] if useDissociationConstantInput=false"
          annotation ( HideResult=true, Dialog(enable=not useDissociationConstantInput));

        parameter Real kf = 10^8 "Forward reaction rate coefficient [SI unit]"
          annotation (Dialog(group="Parameters")); //forward K*(10^rateLevel) at temperature TK

        parameter Integer nS=1 "Number of substrates types"
          annotation ( HideResult=true, Dialog(group="Substrates", tab="Reaction type"));
        parameter Integer nP=1 "Number of products types"
          annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));

        parameter Modelica.SIunits.StoichiometricNumber s[nS]=ones(nS)
          "Stoichiometric reaction coefficient for substrates"
          annotation (  HideResult=true, Dialog(group="Substrates", tab="Reaction type"));
        parameter Modelica.SIunits.ActivityCoefficient as[nS]=ones(nS)
          "Activity coefficients of substrates"
          annotation ( HideResult=true, Dialog(group="Substrates", tab="Reaction type"));

        parameter Modelica.SIunits.StoichiometricNumber p[nP]=ones(nP)
          "Stoichiometric reaction coefficients for products"
          annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));
         parameter Modelica.SIunits.ActivityCoefficient ap[nP]=ones(nP)
          "Activity coefficients of products"
          annotation ( HideResult=true, Dialog(group="Products", tab="Reaction type"));

       extends Chemical.Interfaces.ConditionalHeatPort;

        parameter Physiolibrary.Types.Temperature TK=298.15 "Base temperature"
          annotation ( HideResult=true, Dialog(tab="Temperature dependence"));

        parameter Modelica.SIunits.MolarInternalEnergy dH=0
          "Standard Enthalpy Change (negative=exothermic)"
          annotation ( HideResult=true, Dialog(tab="Temperature dependence"));

        Real KBase "dissociation constant at TK" annotation (HideResult=true);

      equation
        if not useDissociationConstantInput then
          KBase = K;
        end if;

        KaT = KBase * Modelica.Math.exp(((-dH)/Modelica.Constants.R)*(1/T_heatPort - 1/TK));  //Hoff's equation

        rr = kf*volume*(product((as.*substrates.conc).^s) - (1/KaT)*product((ap.*products.conc).^p));  //Elementary first-order rate kinetics - the main equation

        lossHeat = -dH*rr; //dH<0 => Exothermic => lossHeat>0, Endothermic otherwise

        rr*s = substrates.q;
        rr*p = -products.q;

        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                              graphics={
              Rectangle(
                extent={{-100,-30},{100,30}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-128,-66},{142,-40}},
                textString="%name",
                lineColor={0,0,255}),
              Polygon(
                points={{-60,6},{-60,4},{54,4},{54,4},{18,14},{18,6},{-60,6}},
                lineColor={0,0,0},
                smooth=Smooth.None,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{54,-8},{54,-6},{-60,-6},{-60,-6},{-24,-16},{-24,-8},{54,-8}},
                lineColor={0,0,0},
                smooth=Smooth.None,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
          Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",       info="<html>
<pre>The Chemical reaction

Schema of chemical reaction:
s[1]*S[1] + .. + s[nS]*S[nS]  &LT;-&GT;  p[1]*P[1] + .. + p[nP]*P[nP]

where
S are substrates,
s are stochiometric coefficients of substrates,
P are products,
p are stochiometric coefficients of products.

In equilibrium (at zero reaction flow) it fullfil, the dissociation constant K equation:
<p><br/><code>K = <font style=\"color: #ff0000; \">&nbsp;product</font>(P.^p) / <font style=\"color: #ff0000; \">product</font>(S.^s)</code></p>
<pre>
The dissociation constant is dependent on temperature by Hoff&apos;s equation using reaction enthalphy change parameter dH.
<p><br/><code>The forward rate is kf*volume*<font style=\"color: #ff0000; \">product</font>(S.^s), where kf is forward rate coefficient. </code></p>
<p><code>The backward rate is (kf/K)*<font style=\"color: #ff0000; \">product</font>(P.^p), where backward rate coefficient kb is kf/K.</code></p>
<pre>

It works in two modes:


1. Dynamic mode, if EQUILIBRIUM=false.

2. Equilibrium mode, if EQUILIBRIUM=true and all Substances are in STEADY mode. But some zero flows must be removed instead of additional steady-state equation. </pre>
</html>"));
      end ChemicalReaction;

      model Diffusion "Solute diffusion"
        extends Physiolibrary.Icons.Diffusion;
        extends Physiolibrary.Chemical.Interfaces.OnePort;

        parameter Boolean useConductanceInput = false
          "=true, if external conductance value is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.DiffusionPermeability Conductance=0
          "Diffusion conductance if useConductanceInput=false"
          annotation (Dialog(enable=not useConductanceInput));

      protected
        Types.DiffusionPermeability c;
      public
        Types.RealIO.DiffusionPermeabilityInput conductance = c if useConductanceInput
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));
      equation
        if not useConductanceInput then
          c=Conductance;
        end if;

         q_in.q = c * (q_in.conc - q_out.conc);

         annotation (                 Documentation(revisions="<html>
<p><i>2009-2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",       info="<html>
<p><a name=\"firstHeading\">The diffusion conductance parameter can be estimated using the F</a>ick&apos;s laws of diffusion: </p>
<p>J= -D*(dPhi)/dx</p>
<p>where</p>
<p>J is molar flow of solute per area [mol/(m2.s)]. </p>
<p>D is diffusion constant [m2/s]. </p>
<p>dPhi is concentration gradient [mol/m3].</p>
<p>dx is length of diffusion [m].</p>
<p><br/>So for example of the diffusion through membrane the parameter cond = <code>(D/membrameThicknes)*membraneArea.</code></p>
</html>"));
      end Diffusion;

      model GasSolubility "Henry's law of gas solubility in liquid."
         //q_in is dissolved in liquid and q_out is in gaseous solution"

        extends Physiolibrary.Icons.GasSolubility;
        extends Physiolibrary.Chemical.Interfaces.ConditionalHeatPort;

        parameter Physiolibrary.Types.DiffusionPermeability solubilityRateCoef=10^8
          "The rate constant of incoming gas to solution" annotation ( HideResult=true);

        Physiolibrary.Types.GasSolubility kH
          "Henry's law coefficient such as liquid-gas concentration ratio";

        parameter Physiolibrary.Types.GasSolubility kH_T0
          "Henry's law coefficient at base temperature (i.e. in (mmol/l)/kPa at 25degC: aO2=0.0105, aCO2=0.33, ..)"
                                                                                                              annotation ( HideResult=true);
        parameter Physiolibrary.Types.Temperature T0=298.15
          "Base temperature for kH_T0"
           annotation (HideResult=true,Dialog(tab="Temperature dependence"));
        parameter Physiolibrary.Types.Temperature C(displayUnit="K") = 1700
          "Gas-liquid specific constant for Van't Hoff's change of kH (i.e.: O2..1700K,CO2..2400K,N2..1300K,CO..1300K,..)"
          annotation (HideResult=true,Dialog(tab="Temperature dependence"));

        Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                  q_out "Gaseous solution"
                               annotation (Placement(
              transformation(extent={{-10,90},{10,110}})));

        Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                  q_in "Dissolved in liquid"
                                  annotation (Placement(
              transformation(extent={{-10,-90},{10,-70}})));
      equation
        q_in.q + q_out.q = 0;

        kH = kH_T0 * Modelica.Math.exp(C* (1/T_heatPort - 1/T0)); // Van't Hoff equation

        // equilibrium:  liquid.conc = kH * gas.conc;
        q_out.q = solubilityRateCoef*(kH * q_out.conc - q_in.conc); //negative because of outflow

        lossHeat = C*Modelica.Constants.R*q_out.q; //negative = heat are comsumed when change from liquid to gas

         annotation (Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p><h4><font color=\"#008000\">Henry's law of The solubility of a Gas in Liquid</font></h4></p>
<p>Henry&apos;s law at equilibrium: The concentration of a gas in a liquid is proportional to the partial pressure of the gas.</p>
<p>p=k*c</p>
<p>where<b> p</b> is the partial pressure of the gas, <b>k</b> is a Henry&apos;s law constant and<b> c</b> is a small concentration of the gas in the liquid.</p>
<p>Henry&apos;s coefficient <b>k</b> depends on temperature and on the identities of all substances present in solution! </p>
</html>"));
      end GasSolubility;

      model Degradation "Degradation of solute"
        extends Interfaces.ConditionalSolventVolume;

        Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                  q_in "Degraded solute outflow"
                                  annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}})));

        parameter Physiolibrary.Types.Time HalfTime
          "Degradation half time. The time after which will remain half of initial concentration in the defined volume when no other generation nor clearence nor degradation exist.";

      protected
        Physiolibrary.Types.VolumeFlowRate Clearance;
      equation
        Clearance = volume*Modelica.Math.log(2)/HalfTime;
        q_in.q = Clearance*q_in.conc;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                              graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,26},{62,0},{-80,-26},{-80,26}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-100},{150,-60}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-100,-30},{100,-50}},
                lineColor={0,0,0},
                textString="half-time=%HalfTime s"),
              Polygon(
                points={{-68,24},{-68,-24},{-58,-22},{-58,22},{-68,24}},
                lineColor={0,0,127},
                smooth=Smooth.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-46,20},{-46,-20},{-36,-18},{-36,18},{-46,20}},
                lineColor={0,0,127},
                smooth=Smooth.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-24,16},{-24,-16},{-14,-14},{-14,14},{-24,16}},
                lineColor={0,0,127},
                smooth=Smooth.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-2,12},{-2,-12},{8,-10},{8,10},{-2,12}},
                lineColor={0,0,127},
                smooth=Smooth.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{20,8},{20,-8},{30,-6},{30,6},{20,8}},
                lineColor={0,0,127},
                smooth=Smooth.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{40,4},{40,-4},{50,-2},{50,2},{40,4}},
                lineColor={0,0,127},
                smooth=Smooth.None,
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)}),
          Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2013</td>
</tr>
</table>
</html>"));
      end Degradation;

      model Clearance "Clearance with or without solvent outflow"

        Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                  q_in "solute outflow"
                                  annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}})));

        parameter Boolean useSolventFlow = false
          "=true, if clearence is expressed from outflow"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.VolumeFlowRate Clearance=0
          "Clearance of solute if useSolventFlow=false"
          annotation (Dialog(enable=not useSolventFlow));

        Physiolibrary.Types.RealIO.VolumeFlowRateInput solventFlow(start=Clearance/K) = clearance/K if useSolventFlow
          "solvent outflow"
         annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

        parameter Real K(unit="1")=1
          "Coefficient such that Clearance = K*solventFlow if useSolventFlow=true"
          annotation (Dialog(enable=useSolventFlow));

        Physiolibrary.Types.VolumeFlowRate clearance;
      equation
        if not useSolventFlow then
           clearance=Clearance;
        end if;  //otherwise: clearance=K*solventFlow;

        q_in.q = clearance*q_in.conc;

      //  assert(clearance>=-Modelica.Constants.eps, "Clearance can not be negative!");

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-100},{150,-60}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-100,-30},{100,-50}},
                lineColor={0,0,0},
                textString="K=%K")}),        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
</table>
</html>"));
      end Clearance;

      model Stream "Flow of whole solution"
        extends Physiolibrary.Chemical.Interfaces.OnePort;
        extends Physiolibrary.Chemical.Interfaces.ConditionalSolutionFlow;

      equation
        q_in.q = if
                   (q>0) then q*q_in.conc else q*q_out.conc;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Text(
                extent={{-150,-20},{150,20}},
                textString="%name",
                lineColor={0,0,255},
                origin={2,-74},
                rotation=180)}),
          Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
</table>
</html>",       info="<html>
<p><h4><font color=\"#008000\">Bidirectional mass flow by concentration</font></h4></p>
<p>Possible field values: </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
<td></td>
<td><p align=\"center\"><h4>forward flow</h4></p></td>
<td><p align=\"center\"><h4>backward flow</h4></p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>solutionFlow</h4></p></td>
<td><p align=\"center\">&GT;=0</p></td>
<td><p align=\"center\">&LT;=0</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_in.q</h4></p></td>
<td><p align=\"center\">=solutionFlow*q_in.conc</p></td>
<td><p align=\"center\">=-q_out.q</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_out.q</h4></p></td>
<td><p align=\"center\">=-q_in.q</p></td>
<td><p align=\"center\">=solutionFlow*q_out.conc</p></td>
</tr>
</table>
<br/>
</html>"));
      end Stream;

      model SolutePump "Prescribed solute flow"
        extends Physiolibrary.Chemical.Interfaces.OnePort;
        extends Physiolibrary.Chemical.Interfaces.ConditionalSoluteFlow;

      equation
        q_in.q = q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Text(
                extent={{-150,-20},{150,20}},
                lineColor={0,0,255},
                origin={-10,-76},
                rotation=360,
                textString="%name")}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SolutePump;

      model Speciation
        "Chemical species definition by independent binding sides of macromolecule"
        extends Physiolibrary.Icons.Speciation;

        extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
                                                 Simulation=Physiolibrary.Types.SimulationType.SteadyState, NumberOfDependentStates=NumberOfSubunitTypes-1);
        extends Physiolibrary.Chemical.Interfaces.ConditionalSolventVolume;

        import Physiolibrary.Types.*;

        parameter Integer NumberOfSubunitTypes=1
          "Number of subunit types occuring in macromolecule";

        Physiolibrary.Chemical.Interfaces.ChemicalPort_a species
          "Defined macromolecule form"                                                        annotation (Placement(
              transformation(extent={{90,-90},{110,-70}})));
        Physiolibrary.Chemical.Interfaces.ChemicalPort_a subunitSpecies[NumberOfSubunitTypes]
          "Definid species of macromolecule subunit types (in NormalSolventVolume)"
                                                                                                              annotation (Placement(
              transformation(extent={{-10,90},{10,110}})));

        parameter Real numberOfSubunit[NumberOfSubunitTypes] = ones(NumberOfSubunitTypes)
          "Number of identical subunits instances in macromolecule. First should be non-zero.";

      protected
        Real fractions[NumberOfSubunitTypes];
      public
        Physiolibrary.Types.RealIO.AmountOfSubstanceInput totalSubunitAmount[NumberOfSubunitTypes]
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=180,
              origin={80,0})));
        Physiolibrary.Types.RealIO.AmountOfSubstanceOutput totalSubsystemAmount
         annotation (Placement(
              transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-80})));                                                             //(start=1e-8)
      equation
        totalSubsystemAmount = totalSubunitAmount[1]/numberOfSubunit[1];

        fractions = if
                      (totalSubsystemAmount < Modelica.Constants.eps) then zeros(NumberOfSubunitTypes) else subunitSpecies.conc ./ (totalSubunitAmount/volume);

        species.conc = (totalSubsystemAmount/volume)*product(fractions.^numberOfSubunit);

        for i in 2:NumberOfSubunitTypes loop
               normalizedState[i-1]*totalSubsystemAmount*numberOfSubunit[i] = totalSubunitAmount[i];
        end for;

        subunitSpecies.q = -species.q * numberOfSubunit;

        annotation (defaultComponentName="macromoleculeSpecie_in_macromoleculeGroup",
          Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",       info="<html>
<p>This block identify one specific chemical form (one chosen chemical species - called <i>specie</i>) of one macromolecule defined by forms of its subunits.</p>
<p>Only main connector called <b>species </b>is designed for inflow and outflow of macromolecule to/from <i>system</i>. The concentration in this connector is the concentration of its specific <i>specie.</i></p>
<p>Connectors <b> subunitSpecies[:] </b>represent specific forms of the macromolecule subunit types. If the sununit type occures n-times in macromolecule, the inflow is n-time greater than the inflow of macromolecule.</p>
<p><br/>Initial total concentrations of subunits must must be set to be right distribution of total macromolecule concentration. So the ratios between subunit concentrations are the ratios of their occurence in macromolecule. In equilibrium are this proporties fullfiled.</p>
<p>    </p>
<p><br/>For example: If the macromolecule has four identical independent subunits and each subunit can occur in two form F1 and F2, then the concentration of macromolecule <i>specie </i>composed only from four subunits in form F1 is <b>species.conc=</b>conc*fF1^4. </p>
<p>Where:</p>
<p>conc is totat concentration of macromolecule in <i>system</i> accumulated by <b>species.q</b>,</p>
<p>fF1 = F1/(F1+F2) is fraction of form F1 in subsystem of subunit,</p>
<p>4 is number of subunits (<b>numberOfSubunit</b>).</p>
<p><br/>This block can be connected to chemical reactions such as it was the chosen species with subsystem behind. It is recommended to use this block only as an equilibrated subsystem.</p>
</html>"));
      end Speciation;

      model Dilution "Adding/removing of the solvent to/from solution"
        extends Physiolibrary.Chemical.Interfaces.OnePort;
        extends Physiolibrary.Icons.Dilution;

        parameter Boolean useDilutionInput = false
          "=true, if dilition input is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.Fraction Dilution=1
          "Concentration ratio after per before dilution (0..no solutes, 1..no dilution) if useDilutionInput=false"
          annotation (Dialog(enable=not useSolventFlow));

        Physiolibrary.Types.RealIO.FractionInput dilution(start=Dilution)= d if useDilutionInput
          "Fraction of final undilutes solution"
          annotation (Placement(transformation(extent={{-120,60},{-80,100}})));
      protected
        Types.Fraction d;
      equation
        if not useDilutionInput then
          d=Dilution;
        end if;
        q_out.conc = d * q_in.conc;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Text(
                extent={{-120,20},{120,-20}},
                textString="%name",
                lineColor={0,0,255},
                origin={0,-60},
                rotation=180)}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Dilution;

      model Reabsorption "Reabsorption as input fraction"
         extends Physiolibrary.Icons.Reabsorption;

        parameter Boolean useEffect = false
          "=true, if reabsorption fraction is BaseReabsorption^(1/Effect)"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Boolean useMaxReabInput = false
          "=true, if external maximum of reabsorption molar flow is used"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Boolean useBaseReabsorption = false
          "=false, if BaseReabsorption=1"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.MolarFlowRate MaxReabsorption = Modelica.Constants.inf
          "Maximal reabsorption molar flow if useMaxReabInput=false"
          annotation (Dialog(enable=not useMaxReabInput));

        Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                  Inflow "Tubular inflow"              annotation (Placement(
              transformation(extent={{-110,30},{-90,50}})));
        Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                  Outflow "Tubular outflow"
          annotation (Placement(transformation(extent={{90,30},{110,50}})));

        Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                  Reabsorption "Reabsorption from tubules"          annotation (Placement(
              transformation(extent={{-10,-110},{10,-90}})));
        Physiolibrary.Types.RealIO.FractionInput baseReabsorption=baseReabFract if useBaseReabsorption
          "Base fraction of molar inflow for reabsorption flow"
                                     annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              rotation=270,
              origin={40,100})));

        Physiolibrary.Types.RealIO.FractionInput Effect(displayUnit="1")=e if useEffect
          "Effects<1 decrease reabsorption, effects>1 increase reabsorption fraction by equation ReabFract=BaseReabsorption^(1/Effect)"
                                     annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              rotation=270,
              origin={0,100})));
        Physiolibrary.Types.RealIO.MolarFlowRateInput               MaxReab=mr if useMaxReabInput
          "Maximal allowed reabsorption molar flow rate"
                                     annotation (Placement(transformation(extent={{-100,
                  -80},{-60,-40}})));
        Physiolibrary.Types.RealIO.FractionOutput               ReabFract=reabFract if useEffect
          "Actual reabsorbed fraction from solute inflow rate"                                annotation (Placement(transformation(extent={{80,-100},
                  {120,-60}})));

        Physiolibrary.Types.Fraction reabFract,baseReabFract,e;
        Physiolibrary.Types.MolarFlowRate mr;
      equation
        Inflow.conc = Outflow.conc;
        0 = Inflow.q + Outflow.q + Reabsorption.q;

        Reabsorption.q=-min(mr,reabFract*Inflow.q);

        reabFract = baseReabFract^(1/e);

        if not useBaseReabsorption then
          baseReabFract=1;
        end if;

        if not useMaxReabInput then
          mr=MaxReabsorption;
        end if;

        if not useEffect then
          e=1;
        end if;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                  {100,100}}),       graphics={
              Text(
                extent={{0,-102},{154,-132}},
                lineColor={0,0,255},
                textString="%name")}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Reabsorption;

    end Components;

    package Sensors
      extends Modelica.Icons.SensorsPackage;

      model MolarFlowMeasure "Measure of molar flow"
        extends Physiolibrary.Chemical.Interfaces.OnePort;
        extends Physiolibrary.Icons.MolarFlowMeasure;

       Physiolibrary.Types.RealIO.MolarFlowRateOutput actualFlow
                               annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              rotation=270,
              origin={0,-60})));
      equation
        q_in.conc = q_out.conc;

        actualFlow = q_in.q;

       annotation (
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end MolarFlowMeasure;

      model ConcentrationMeasure "Measure of molar concentration"

        Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                  q_in "For measure only"
                                  annotation (Placement(
              transformation(extent={{-10,-30},{10,-10}})));
        Physiolibrary.Types.RealIO.ConcentrationOutput actualConc
          "Actual concentration"
                               annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              rotation=90,
              origin={0,40})));
      equation

        actualConc =         q_in.conc;

        q_in.q = 0;
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={    Rectangle(
                extent={{-20,20},{20,-20}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end ConcentrationMeasure;

      model FlowConcentrationMeasure
        "The outflow concentration from absorption (i.e. portal vein concentration)"
        extends Physiolibrary.Chemical.Interfaces.ConditionalSolutionFlow;
        Physiolibrary.Chemical.Interfaces.ChemicalPort_a
                                  q_in "Concentration before absorption source"
                               annotation (Placement(
              transformation(extent={{-110,-8},{-90,12}})));

        parameter Boolean useAdditionalSoluteFlowInput = false
          "=true, if absorbed molar flow input is chosen"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.MolarFlowRate AdditionalSoluteFlow=0
          "Additional solute molar flow if useAdditionalSoluteFlowInput=false"
          annotation (Dialog(enable=not useAdditionalSoluteFlowInput));

        Physiolibrary.Types.RealIO.MolarFlowRateInput additionalSoluteFlow(start=AdditionalSoluteFlow)=aq if useAdditionalSoluteFlowInput
          "Absorbed molar flow rate" annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              rotation=90,
              origin={0,-60})));

       Physiolibrary.Types.RealIO.ConcentrationOutput Conc
          "Concentration after absorption source"                           annotation (Placement(transformation(extent={{80,-20},
                  {120,20}})));

      protected
        Types.MolarFlowRate aq "Current additional solute molar flow";
      equation
        if not useAdditionalSoluteFlowInput then
          aq = AdditionalSoluteFlow;
        end if;
        Conc = q_in.conc + aq/q;
        q_in.q = 0;
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-88,-50},{80,50}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end FlowConcentrationMeasure;
    end Sensors;

    package Sources
      extends Modelica.Icons.SourcesPackage;

      model UnlimitedSolutePump "Molar pump of solute"
        extends Physiolibrary.Chemical.Interfaces.ConditionalSoluteFlow;

        Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                  q_out "Outflow"
                               annotation (Placement(
              transformation(extent={{90,-10},{110,10}})));

      equation
        q_out.q = - q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-42},{100,40}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-48,20},{50,0},{-48,-21},{-48,20}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-82,-82},{90,-58}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end UnlimitedSolutePump;

      model UnlimitedSolutionStorage "Constant concentration source"

        import Physiolibrary.Types.*;
        Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                  q_out
          "constant concentration with any possible flow"
                                   annotation (Placement(
              transformation(extent={{90,-10},{110,10}})));

        parameter Boolean useConcentrationInput = false
          "=true, if fixed concentration is from input instead of parameter"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

         parameter Concentration Conc = 0
          "Fixed concentration if useConcentrationInput=false"
          annotation (Dialog(enable=not useConcentrationInput));

        parameter Boolean isIsolatedInSteadyState = true
          "=true, if there is no flow at port in steady state"
          annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

        parameter SimulationType  Simulation=SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added."
          annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

         Types.RealIO.ConcentrationInput concentration(start=Conc)=c if useConcentrationInput
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

      protected
        Concentration c "Current concentration";

      initial equation
        if isIsolatedInSteadyState and (Simulation==SimulationType.InitSteadyState) then
          q_out.q = 0;
        end if;

      equation
         if not useConcentrationInput then
           c=Conc;
         end if;

        q_out.conc = c;

        if isIsolatedInSteadyState and (Simulation==SimulationType.SteadyState) then
          q_out.q = 0;
        end if;

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={107,45,134},
                fillPattern=FillPattern.Backward),
              Text(
                extent={{0,0},{-100,-100}},
                lineColor={0,0,0},
                textString="conc"),
              Line(
                points={{-62,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{38,-20},{38,20},{78,0},{38,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{140,-100},{-140,-160}},
                lineColor={0,0,0},
                textString="%Conc mmol/l")}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end UnlimitedSolutionStorage;

      model UnlimitedGasStorage "Constant ideal gas source"
        extends Interfaces.ConditionalHeatPort;
        import Physiolibrary.Types.*;
        Physiolibrary.Chemical.Interfaces.ChemicalPort_b
                                  q_out
          "constant gas concentration with any possible flow"
                                   annotation (Placement(
              transformation(extent={{90,-10},{110,10}})));

        parameter Boolean usePartialPressureInput = false
          "=true, if fixed partial pressure is from input instead of parameter"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

         parameter Pressure PartialPressure = 0
          "Fixed partial pressure if usePartialPressureInput=false"
          annotation (Dialog(enable=not usePartialPressureInput));

        RealIO.PressureInput partialPressure(start=PartialPressure) = p if usePartialPressureInput
          "Partial pressure of Gas = air pressure * gas fraction"
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

       parameter Boolean isIsolatedInSteadyState = true
          "=true, if there is no flow at port in steady state"
          annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

        parameter SimulationType  Simulation=SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added."
          annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

      protected
        Pressure p "Current partial pressure";

      initial equation
        if isIsolatedInSteadyState and (Simulation==SimulationType.InitSteadyState) then
          q_out.q = 0;
        end if;

      equation
        if not usePartialPressureInput then
          p=PartialPressure;
        end if;

        q_out.conc = p / (Modelica.Constants.R * T_heatPort);  //ideal gas equation

        if isIsolatedInSteadyState and (Simulation==SimulationType.SteadyState) then
           q_out.q = 0;
        end if;

        lossHeat=0; //only read temperature from heat port

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              pattern=LinePattern.None,
              fillColor={170,255,255},
              fillPattern=FillPattern.Backward),
              Polygon(
                points={{-100,100},{100,-100},{100,100},{-100,100}},
                smooth=Smooth.None,
                fillColor={159,159,223},
                fillPattern=FillPattern.Backward,
                pattern=LinePattern.None,
                lineColor={0,0,0}),
              Text(
                extent={{0,0},{-100,-100}},
                lineColor={0,0,0},
                textString="P,T"),
              Line(
                points={{-62,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{38,-20},{38,20},{78,0},{38,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-150,-110},{150,-140}},
                lineColor={0,0,0},
                textString="T=%T")}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end UnlimitedGasStorage;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      connector ChemicalPort "Concentration and Solute flow"
        Physiolibrary.Types.Concentration conc "Solute concentration";
        flow Physiolibrary.Types.MolarFlowRate q "Solute flow";
        annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end ChemicalPort;

      connector ChemicalPort_a
        "Concentration and expected positive Solute inflow"
        extends ChemicalPort;

      annotation (
          defaultComponentName="port_a",
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={107,45,134},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={107,45,134},
                fillColor={107,45,134},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
              graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={107,45,134},
                fillColor={107,45,134},
                fillPattern=FillPattern.Solid),
         Text(extent=  {{-160,110},{40,50}}, lineColor=  {107,45,134}, textString=  "%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end ChemicalPort_a;

      connector ChemicalPort_b
        "Concentration and expected negative Solute outflow"
        extends ChemicalPort;

      annotation (
          defaultComponentName="port_b",
          Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false),
              graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={107,45,134},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={107,45,134},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}), graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={107,45,134},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
         Text(extent=  {{-160,110},{40,50}}, lineColor=  {107,45,134}, textString=  "%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end ChemicalPort_b;

      partial model OnePort
        "Partial transfer of solute beween two ports without its accumulation"

        ChemicalPort_b            q_out
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        ChemicalPort_a            q_in
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      equation
        q_in.q + q_out.q = 0;
      end OnePort;

      partial model ConditionalHeatPort
        "Partial model to include a conditional HeatPort in order to describe the power loss via a thermal network"

        parameter Boolean useHeatPort = false "=true, if HeatPort is enabled"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true), Dialog(group="External inputs/outputs"));
        parameter Physiolibrary.Types.Temperature T=310.15
          "Fixed device temperature if useHeatPort = false"
          annotation ( HideResult=true, Dialog(enable=not useHeatPort,tab="Temperature dependence"));

        Physiolibrary.Thermal.Interfaces.HeatPort_a       heatPort(T(start=T)=T_heatPort, Q_flow=-lossHeat) if useHeatPort
          annotation (Placement(transformation(extent={{-10,-10},{10,10}}),
              iconTransformation(extent={{-10,-10},{10,10}})));

        Physiolibrary.Types.Temperature T_heatPort "Temperature of HeatPort";
        Physiolibrary.Types.HeatFlowRate lossHeat
          "Loss heat leaving component via HeatPort";
      equation
        if not useHeatPort then
           T_heatPort = T;
        end if;

        annotation (        Documentation(revisions="<html>
<ul>
<li><i> February 17, 2009   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
<li><i> January 21, 2014   </i>
       by Marek Matejak<br> integrated to Physiolibrary<br>
       </li>
</ul>
</html>",       info="<html>
<p>
This partial model provides a conditional heating port for the connection to a thermal network.
</p>
<ul>
<li> If <b>useHeatPort</b> is set to <b>false</b> (default), no heat port is available, and the thermal
     loss power flows internally to the ground. In this case, the parameter <b>T</b> specifies
     the fixed device temperature (the default for T = 20<sup>o</sup>C).</li>
<li> If <b>useHeatPort</b> is set to <b>true</b>, a heat port is available.</li>
</ul>

<p>
If this model is used, the loss power has to be provided by an equation in the model which inherits from
ConditionalHeatingPort model (<b>lossPower = ...</b>). As device temperature
<b>T_heatPort</b> can be used to describe the influence of the device temperature
on the model behaviour.
</p>
</html>"));
      end ConditionalHeatPort;

      partial model ConditionalSolventVolume
        "Chemical processes can be modeled with or without(normalized to 1 liter) variable solvent volume"

        constant Physiolibrary.Types.Volume NormalSolventVolume=0.001 "1 liter"
                                                                                annotation(Evaluate=true, HideResult=true);

        parameter Boolean useNormalizedVolume = true
          "=true, if solvent volume is 1 liter"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        Physiolibrary.Types.Volume volume "SolventVolume" annotation(HideResult=useNormalizedVolume);

        Physiolibrary.Types.RealIO.VolumeInput solventVolume=volume if not useNormalizedVolume annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-40,40})));
      equation
        if useNormalizedVolume then
          volume = NormalSolventVolume;
        end if;

      end ConditionalSolventVolume;

      partial model ConditionalSolutionFlow
        "Input of solution volumetric flow vs. parametric solution volumetric flow"

        parameter Boolean useSolutionFlowInput = false
          "=true, if solution flow input is used instead of parameter SolutionFlow"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.VolumeFlowRate SolutionFlow=0
          "Volumetric flow of solution if useSolutionFlowInput=false"
          annotation ( HideResult=not useSolutionFlowInput, Dialog(enable=not useSolutionFlowInput));

        Physiolibrary.Types.RealIO.VolumeFlowRateInput solutionFlow(start=SolutionFlow)=q if useSolutionFlowInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

        Physiolibrary.Types.VolumeFlowRate q "Current solution flow";
      equation
        if not useSolutionFlowInput then
          q = SolutionFlow;
        end if;

      end ConditionalSolutionFlow;

      partial model ConditionalSoluteFlow
        "Input of solute molar flow vs. parametric solute molar flow"

        parameter Boolean useSoluteFlowInput = false
          "=true, if solute flow input is used instead of parameter SoluteFlow"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.MolarFlowRate SoluteFlow=0
          "Volumetric flow of solute if useSoluteFlowInput=false"
          annotation (HideResult=not useSoluteFlowInput, Dialog(enable=not useSoluteFlowInput));

        Physiolibrary.Types.RealIO.MolarFlowRateInput soluteFlow(start=SoluteFlow)=q if   useSoluteFlowInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={40,40})));

        Physiolibrary.Types.MolarFlowRate q "Current solute flow";
      equation
        if not useSoluteFlowInput then
          q = SoluteFlow;
        end if;

      end ConditionalSoluteFlow;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",   info="<html>
<p>In physiology books, chapters about chemical substances are organized by their types. The main reason for this is that each substance in the human body is regulated in a different way. For example the regulation of sodium is different from the regulation of potassium, and from the regulation of glucose, and so on. This view leads to the idea of having separate models of each substance. The origin of different flows and regulations is the (cellular) membrane. Water and solutions can cross it in different directions at the same time. Crossings occur for different reasons: water is driven mostly by osmotic gradients, electrolytes are driven by charge to reach Donnan&apos;s equilibrium, and some solutes can even be actively transported against their concentration or electrical gradients. And all this is specifically driven from the higher levels by neural and hormonal responses.&nbsp; </p>
<p>In Physiolibrary flows and fluxes of solutes are supported mostly by the Chemical package. All parts inside this Physiolibrary.Chemical package use the connector ChemicalPort, which defines the molar concentration and molar flow/flux rate of one solute. This is the supporting infrastructure for modeling membrane diffusion, accumulations of substances, reversal chemical reactions, Henry&apos;s law of gas solubility, dilution with additional solvent flow, membrane reabsorption, chemical degradation and physiological clearance. </p>
</html>"));
  end Chemical;

  package Hydraulic "Domain with Pressure and Volumetric Flow"
   extends Modelica.Icons.Package;
    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;

      model Windkessel "Minimal circulation models driven by cardiac output"
         extends Modelica.Icons.Example;

        Modelica.Blocks.Sources.Pulse pulse(
          width=25,
          amplitude=3.3e-4,
          period=60/75)
          annotation (Placement(transformation(extent={{-94,74},{-74,94}})));
        Sources.UnlimitedPump heart1(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{-50,38},{-30,58}})));
        Components.ElasticVessel
                       arteries1(
          volume_start(displayUnit="l") = 0.001,
          ZeroPressureVolume(displayUnit="l") = 0.00085,
          Compliance(displayUnit="ml/mmHg") = 1.1625954425608e-08)
          annotation (Placement(transformation(extent={{-14,38},{6,58}})));
        Components.Conductor resistance1(Conductance(displayUnit="l/(mmHg.min)") = 6.2755151845753e-09)
          annotation (Placement(transformation(extent={{22,38},{42,58}})));
        Sources.UnlimitedVolume veins1 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={76,48})));
      equation
        connect(resistance1.q_out, veins1.y) annotation (Line(
            points={{42,48},{66,48}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(arteries1.q_in, resistance1.q_in) annotation (Line(
            points={{-4,48},{22,48}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(heart1.q_out, arteries1.q_in) annotation (Line(
            points={{-30,48},{-4,48}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulse.y, heart1.solutionFlow) annotation (Line(
            points={{-73,84},{-40,84},{-40,52}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                extent={{-34,74},{86,64}},
                lineColor={175,175,175},
                textString="Windkessel model driven by cardiac output")}),
            Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=10));
      end Windkessel;

      model MinimalCirculation
        "Minimal circulation models driven by cardiac output"
         extends Modelica.Icons.Example;

        Components.Pump heart(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{-6,-50},{14,-30}})));
        Components.ElasticVessel
                       arteries(
          volume_start(displayUnit="l") = 0.001,
          ZeroPressureVolume(displayUnit="l") = 0.00085,
          Compliance(displayUnit="ml/mmHg") = 1.1625954425608e-08)
          annotation (Placement(transformation(extent={{36,-84},{56,-64}})));
        Components.Conductor resistance(Conductance(displayUnit="l/(mmHg.min)") = 6.2755151845753e-09)
          annotation (Placement(transformation(extent={{-4,-84},{16,-64}})));
        Components.ElasticVessel
                       veins(
          Compliance(displayUnit="l/mmHg") = 6.1880080007267e-07,
          ZeroPressureVolume(displayUnit="l") = 0.00295,
          volume_start(displayUnit="l") = 0.0032)
          annotation (Placement(transformation(extent={{-42,-84},{-22,-64}})));
        Modelica.Blocks.Sources.Pulse pulse(
          width=25,
          amplitude=3.3e-4,
          period=60/75)
          annotation (Placement(transformation(extent={{-94,74},{-74,94}})));
      equation
        connect(heart.q_out, arteries.q_in) annotation (Line(
            points={{14,-40},{46,-40},{46,-74}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(arteries.q_in, resistance.q_out) annotation (Line(
            points={{46,-74},{16,-74}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(resistance.q_in, veins.q_in) annotation (Line(
            points={{-4,-74},{-32,-74}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(veins.q_in, heart.q_in) annotation (Line(
            points={{-32,-74},{-32,-40},{-6,-40}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulse.y, heart.solutionFlow) annotation (Line(
            points={{-73,84},{-62,84},{-62,-26},{4,-26},{4,-36}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={                          Text(
                extent={{-40,-12},{80,-22}},
                lineColor={175,175,175},
                textString="Minimal circulation driven by cardiac output")}),
            Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=10));
      end MinimalCirculation;

      model CardiovascularSystem_GCG
        "Cardiovascular part of Guyton-Coleman-Granger's model from 1972"
         extends Modelica.Icons.Example;

         import Physiolibrary.Hydraulic;

        Components.ElasticVessel pulmonaryVeinsAndLeftAtrium(
          volume_start(displayUnit="l") = 0.0004,
          ZeroPressureVolume(displayUnit="l") = 0.0004,
          Compliance(displayUnit="l/mmHg") = 7.5006157584566e-08)
          annotation (Placement(transformation(extent={{4,74},{24,94}})));
        Components.ElasticVessel
                       pulmonaryArteries(
          ZeroPressureVolume(displayUnit="l") = 0.00030625,
          Compliance(displayUnit="l/mmHg") = 3.6002955640592e-08,
          volume_start(displayUnit="l") = 0.00038)
          annotation (Placement(transformation(extent={{-62,74},{-42,94}})));
        Hydraulic.Components.Conductor
                 pulmonary(Conductance(displayUnit="l/(mmHg.min)") = 4.1665920538226e-08)
          annotation (Placement(transformation(extent={{-30,74},{-10,94}})));
        Components.ElasticVessel
                       arteries(
          volume_start(displayUnit="l") = 0.00085,
          ZeroPressureVolume(displayUnit="l") = 0.000495,
          Compliance(displayUnit="l/mmHg") = 2.6627185942521e-08)
          annotation (Placement(transformation(extent={{14,-46},{34,-26}})));
        Components.ElasticVessel
                       veins(
          Compliance(displayUnit="l/mmHg") = 6.1880080007267e-07,
          volume_start(displayUnit="l") = 0.00325,
          ZeroPressureVolume(displayUnit="l") = 0.00295)
          annotation (Placement(transformation(extent={{-64,-46},{-44,-26}})));
        Hydraulic.Components.Conductor
                 nonMuscle(Conductance(displayUnit="l/(mmHg.min)") = 3.5627924852669e-09)
          annotation (Placement(transformation(extent={{-24,-46},{-4,-26}})));
        Sensors.PressureMeasure
                        pressureMeasure
          annotation (Placement(transformation(extent={{-78,26},{-58,46}})));
        Components.Pump
             rightHeart(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{-56,8},{-36,28}})));
        Physiolibrary.Types.Constants.VolumeFlowRateConst RNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
          annotation (Placement(transformation(extent={{-60,40},{-52,48}})));
        Sensors.PressureMeasure
                        pressureMeasure1
          annotation (Placement(transformation(extent={{-8,26},{12,46}})));
        Components.Pump
             leftHeart(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{16,6},{36,26}})));
        Physiolibrary.Types.Constants.VolumeFlowRateConst LNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
          annotation (Placement(transformation(extent={{12,42},{20,50}})));
        Hydraulic.Components.Conductor
                 kidney(Conductance(displayUnit="l/(mmHg.min)") = 1.4126159678427e-09)
          annotation (Placement(transformation(extent={{-24,-64},{-4,-44}})));
        Hydraulic.Components.Conductor
                 muscle(Conductance(displayUnit="l/(mmHg.min)") = 1.3001067314658e-09)
          annotation (Placement(transformation(extent={{-24,-28},{-4,-8}})));
        Hydraulic.Components.Conductor
                 largeVeins(Conductance(displayUnit="l/(mmHg.min)") = 1.6888886482791e-07)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-84,-8})));
        Components.ElasticVessel
                       rightAtrium(
          volume_start(displayUnit="l") = 0.0001,
          ZeroPressureVolume(displayUnit="l") = 0.0001,
          Compliance(displayUnit="l/mmHg") = 3.7503078792283e-08)
          annotation (Placement(transformation(extent={{-82,8},{-62,28}})));
        Physiolibrary.Blocks.Factors.Spline       rightStarling(data={{-6,0,0},{-3,0.15,0.104},{-1,0.52,
              0.48},{2,1.96,0.48},{4,2.42,0.123},{8,2.7,0}})
          "At filling pressure 0mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
          annotation (Placement(transformation(extent={{-56,22},{-36,42}})));
        Physiolibrary.Blocks.Factors.Spline       leftStarling(data={{-4,0,0},{-1,
              0.72,0.29},{0,1.01,0.29},{3,1.88,0.218333},{10,2.7,0}})
          "At filling pressure -0.0029mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
          annotation (Placement(transformation(extent={{16,22},{36,42}})));
      equation
        connect(pulmonaryArteries.q_in,pulmonary. q_in) annotation (Line(
            points={{-52,84},{-30,84}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonary.q_out, pulmonaryVeinsAndLeftAtrium.q_in) annotation (
            Line(
            points={{-10,84},{14,84}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(veins.q_in, nonMuscle.q_in)  annotation (Line(
            points={{-54,-36},{-24,-36}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(nonMuscle.q_out, arteries.q_in)  annotation (Line(
            points={{-4,-36},{24,-36}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightHeart.q_out,pulmonaryArteries. q_in) annotation (Line(
            points={{-36,18},{-28,18},{-28,60},{-70,60},{-70,84},{-52,84}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(leftHeart.q_in, pulmonaryVeinsAndLeftAtrium.q_in) annotation (
            Line(
            points={{16,16},{-4,16},{-4,60},{32,60},{32,84},{14,84}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(leftHeart.q_out,arteries. q_in) annotation (Line(
            points={{36,16},{44,16},{44,-36},{24,-36}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pressureMeasure.q_in,rightHeart. q_in) annotation (Line(
            points={{-72,30},{-72,18},{-56,18}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pressureMeasure1.q_in, pulmonaryVeinsAndLeftAtrium.q_in)
          annotation (Line(
            points={{-2,30},{-4,30},{-4,60},{32,60},{32,84},{14,84}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(muscle.q_out, arteries.q_in) annotation (Line(
            points={{-4,-18},{10,-18},{10,-36},{24,-36}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(kidney.q_out, arteries.q_in) annotation (Line(
            points={{-4,-54},{10,-54},{10,-36},{24,-36}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(kidney.q_in, nonMuscle.q_in) annotation (Line(
            points={{-24,-54},{-34,-54},{-34,-36},{-24,-36}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(muscle.q_in, nonMuscle.q_in) annotation (Line(
            points={{-24,-18},{-34,-18},{-34,-36},{-24,-36}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(veins.q_in, largeVeins.q_out) annotation (Line(
            points={{-54,-36},{-84,-36},{-84,-18}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(largeVeins.q_in, rightAtrium.q_in) annotation (Line(
            points={{-84,2},{-84,18},{-72,18}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightAtrium.q_in, rightHeart.q_in) annotation (Line(
            points={{-72,18},{-56,18}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(RNormalCO.y, rightStarling.yBase) annotation (Line(
            points={{-51,44},{-46,44},{-46,34}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureMeasure.actualPressure, rightStarling.u) annotation (Line(
            points={{-62,32},{-54,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(LNormalCO.y, leftStarling.yBase) annotation (Line(
            points={{21,46},{26,46},{26,34}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureMeasure1.actualPressure, leftStarling.u) annotation (Line(
            points={{8,32},{18,32}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureMeasure.q_in, rightAtrium.q_in) annotation (Line(
            points={{-72,30},{-72,18}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightHeart.solutionFlow, rightStarling.y) annotation (Line(
            points={{-46,22},{-46,28}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(leftStarling.y, leftHeart.solutionFlow) annotation (Line(
            points={{26,28},{26,20}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                extent={{-82,-80},{80,-100}},
                lineColor={175,175,175},
                textString=
                    "Circulation part of Guyton-Coleman-Granger's model from 1972")}),
                                                Documentation(info="<html>
<p>Cardiovascular subsystem in famous Guyton-Coleman-Granger model from 1972. </p>
<p><br/>Model, all parameters and all initial values are from article: </p>
<p>A.C. Guyton, T.G. Coleman, H.J. Granger (1972). &QUOT;Circulation: overall regulation.&QUOT; Annual review of physiology 34(1): 13-44.</p>
</html>",   revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=300));
      end CardiovascularSystem_GCG;

    end Examples;

    package Components
      extends Modelica.Icons.Package;

      model Conductor "Hydraulic resistor, where conductance=1/resistance"
       extends Physiolibrary.Hydraulic.Interfaces.OnePort;
       extends Physiolibrary.Icons.HydraulicResistor;

        parameter Boolean useConductanceInput = false
          "=true, if external conductance value is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.HydraulicConductance Conductance=0
          "Hydraulic conductance if useConductanceInput=false"
          annotation (Dialog(enable=not useConductanceInput));

        Physiolibrary.Types.RealIO.HydraulicConductanceInput cond(start=Conductance)=c if useConductanceInput
                                                         annotation (Placement(
              transformation(extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,60})));

      protected
         Physiolibrary.Types.HydraulicConductance c;
      equation
        if not useConductanceInput then
          c=Conductance;
        end if;

        q_in.q = c * (q_in.pressure - q_out.pressure);
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-100},{100,100}}),
                         graphics={Text(
                extent={{-220,-40},{200,-80}},
                lineColor={0,0,255},
                fillColor={58,117,175},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>This hydraulic conductance (resistance) element contains two connector sides. No hydraulic medium volume is changing in this element during simulation. That means that sum of flow in both connector sides is zero. The flow through element is determined by <b>Ohm&apos;s law</b>. It is used conductance (=1/resistance) because it could be numerical zero better then infinity in resistance. </p>
</html>"));
      end Conductor;

      model ElasticVessel
        "Elastic container for blood vessels, bladder, lumens"
       extends Icons.ElasticBalloon;
       extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                          state_start=volume_start, storeUnit=
            "ml");

        Interfaces.HydraulicPort_a
                             q_in
                              annotation (Placement(
              transformation(extent={{-14,-14},{14,14}})));
        parameter Physiolibrary.Types.Volume volume_start = 0
          "Volume start value"
           annotation (Dialog(group="Initialization"));

        Physiolibrary.Types.Volume excessVolume
          "Additional volume, that generate pressure";

         parameter Boolean useV0Input = false
          "=true, if zero-pressure-volume input is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

         parameter Physiolibrary.Types.Volume ZeroPressureVolume = 0
          "Maximal volume, that does not generate pressure if useV0Input=false"
          annotation (Dialog(enable=not useV0Input));
         Physiolibrary.Types.RealIO.VolumeInput zeroPressureVolume(start=ZeroPressureVolume)= zpv if useV0Input
                                                          annotation (Placement(transformation(
                extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,80})));

        parameter Boolean useComplianceInput = false
          "=true, if compliance input is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Physiolibrary.Types.HydraulicCompliance Compliance = 1
          "Compliance if useComplianceInput=false"
          annotation (Dialog(enable=not useComplianceInput));

        Physiolibrary.Types.RealIO.HydraulicComplianceInput compliance(start=Compliance) = c if useComplianceInput
                                                              annotation (Placement(
              transformation(extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));

        parameter Boolean useExternalPressureInput = false
          "=true, if external pressure input is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Physiolibrary.Types.Pressure ExternalPressure=0
          "External pressure. Set zero if internal pressure is relative to external. Valid only if useExternalPressureInput=false."
          annotation (Dialog(enable=not useExternalPressureInput));

        Physiolibrary.Types.RealIO.PressureInput externalPressure(start=ExternalPressure) = ep if useExternalPressureInput
                                                         annotation (Placement(transformation(
                extent={{-20,-20},{20,20}},
              rotation=270,
              origin={80,80})));

        Physiolibrary.Types.RealIO.VolumeOutput volume
                                              annotation (Placement(transformation(
                extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-100})));

      protected
        Physiolibrary.Types.Volume zpv;
        Physiolibrary.Types.HydraulicCompliance c;
        Physiolibrary.Types.Pressure ep;

      equation
        if not useV0Input then
          zpv=ZeroPressureVolume;
        end if;
        if not useComplianceInput then
          c=Compliance;
        end if;
        if not useExternalPressureInput then
          ep=ExternalPressure;
        end if;

        excessVolume = max( 0, volume - zpv);
        q_in.pressure = excessVolume/c + ep;

        state = volume; // der(volume) =  q_in.q;
        change = q_in.q;

       // assert(volume>=-Modelica.Constants.eps,"Collapsing of vessels are not supported!");

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                  100}}),     graphics={Text(
                extent={{-240,-150},{238,-110}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end ElasticVessel;

      model Pump "Prescribed volumetric flow"
        extends Physiolibrary.Hydraulic.Interfaces.OnePort;
        extends Chemical.Interfaces.ConditionalSolutionFlow;

      equation
        volumeFlowRate = q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-40},{100,60}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,35},{80,10},{-80,-15},{-80,35}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-90},{150,-50}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",       info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
      end Pump;

      model HydrostaticColumn
        "Hydrostatic column pressure between two connectors (with specific muscle pump effect)"
        extends Physiolibrary.Icons.HydrostaticGradient;
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a
                             q_up "Top site"
                               annotation (extent=[-10, -110; 10, -90], Placement(
              transformation(extent={{66,26},{94,54}})));

        Interfaces.HydraulicPort_a
                             q_down "Bottom site"
                               annotation (extent=[-10, -110; 10, -90], Placement(
              transformation(extent={{66,-74},{94,-46}})));

        parameter Boolean useHeightInput = false
          "=true, if height input is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.Height H=0
          "Height of hydrostatic column if useHeightInput=false"
          annotation (Dialog(enable=not useFlowInput));

        Physiolibrary.Types.RealIO.HeightInput height(start=H)=h if useHeightInput
          "Vertical distance between top and bottom connector"
                                                     annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              origin={-60,0})));

        parameter Modelica.SIunits.Density ro=1060; //liquid density

        parameter Boolean useExternalG = false
          "=true, if external gravity acceleration is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Acceleration GravityAcceleration = 9.81
          "Gravity acceleration if useExternalG=false"
          annotation (Dialog(enable=not useExternalG));

         //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.

        Physiolibrary.Types.RealIO.AccelerationInput G(start=GravityAcceleration)=g if useExternalG
          "Gravity acceleration"                                                                           annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              rotation=90,
              origin={0,-100})));

        parameter Boolean usePumpEffect = false
          "=true, if musce pump effect is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        Physiolibrary.Types.RealIO.FractionInput
                              pumpEffect(start=PumpEffect)=pe if       usePumpEffect      annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              rotation=270,
              origin={0,100})));

      protected
        parameter Types.Fraction PumpEffect = 1
          "Pump effect if usePumpEffect=false"
          annotation (Dialog(enable=not usePumpEffect));

      protected
        Types.Acceleration g;
        Types.Fraction pe;
        Types.Height h;
      equation
        if not useHeightInput then
          h=H;
        end if;
        if not useExternalG then
          g=GravityAcceleration;
        end if;
        if not usePumpEffect then
          pe = PumpEffect;
       end if;

        q_down.pressure = q_up.pressure + g*ro*h*pe;
        q_up.q + q_down.q = 0;

       annotation (
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end HydrostaticColumn;

      model ElasticMembrane
        "Interaction between internal and external cavities"
       extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                          state_start=volume_start, storeUnit=
            "ml");
       extends Icons.InternalElasticBalloon;
        Interfaces.HydraulicPort_a
                             q_int "Internal space"
          annotation (Placement(transformation(extent={{-94,-14},{-66,14}})));
        Interfaces.HydraulicPort_b
                             q_ext "External space" annotation (Placement(transformation(extent={{26,-14},
                  {54,14}})));

       parameter Physiolibrary.Types.HydraulicCompliance Compliance
          "Compliance";
       parameter Physiolibrary.Types.Volume zeroPressureVolume=0
          "Maximal volume, that does not generate pressure";
       parameter Physiolibrary.Types.Volume volume_start=0 "Volume start value"
           annotation (Dialog(group="Initialization"));
       Physiolibrary.Types.Volume volume;
       Physiolibrary.Types.Volume stressedVolume;

       parameter Physiolibrary.Types.Volume NominalVolume=1e-6
          "Scale numerical calculation from quadratic meter to miniliters.";

      equation
        q_int.q + q_ext.q = 0;
        q_int.pressure = (stressedVolume/Compliance) + q_ext.pressure;
        stressedVolume = max(volume-zeroPressureVolume,0);

        state = volume; // der(volume) =  q_int.q;
        change = q_int.q;

        // assert(volume>=-Modelica.Constants.eps,"Totally collapsed compartments are not supported!");
        annotation (        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end ElasticMembrane;

      model Inertia "Inertia of the volumetric flow"
        extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                           state_start=volumeFlow_start,
          storeUnit="ml/min");
        extends Interfaces.OnePort;
        extends Icons.Inertance;

        parameter Physiolibrary.Types.VolumeFlowRate volumeFlow_start=0.3
          "Volumetric flow start value"
           annotation (Dialog(group="Initialization"));                                                          //5 l/min is normal volumetric flow in aorta

        parameter Physiolibrary.Types.HydraulicInertance I "Inertance";

      equation
        state = q_in.q;      // I*der(q_in.q) = (q_in.pressure - q_out.pressure);
        change = (q_in.pressure - q_out.pressure)/I;
        annotation (                Documentation(info="<html>
<p>Inertance I of the simple tube could be calculated as I=ro*l/A, where ro is fuid density, l is tube length and A is tube cross-section area.</p>
</html>",   revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Inertia;

      model Reabsorption "Divide inflow to outflow and reabsorption"
        import Physiolibrary;
        extends Physiolibrary.Icons.Reabsorption;

        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a
                             Inflow                    annotation (Placement(
              transformation(extent={{-114,26},{-86,54}})));
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b
                             Outflow
          annotation (Placement(transformation(extent={{86,26},{114,54}})));
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b
                             Reabsorption                annotation (Placement(
              transformation(extent={{-14,-114},{14,-86}})));

        Physiolibrary.Types.RealIO.FractionInput FractReab
                                     annotation (Placement(transformation(extent={{-100,
                  -60},{-60,-20}})));

        parameter Boolean useExternalOutflowMin = false
          "=true, if minimal outflow is garanted"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.VolumeFlowRate OutflowMin = 0
          "Minimal outflow if useExternalOutflowMin=false"
          annotation (Dialog(enable=not useExternalOutflowMin));

        Physiolibrary.Types.RealIO.VolumeFlowRateInput outflowMin(start=OutflowMin) = om if useExternalOutflowMin
                                                             annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              rotation=270,
              origin={40,80})));

      protected
         Physiolibrary.Types.VolumeFlowRate om;
      equation
        if not useExternalOutflowMin then
          om = OutflowMin;
        end if;

        Inflow.pressure = Outflow.pressure;
        0 = Inflow.q + Outflow.q + Reabsorption.q;

       // assert(Inflow.q>=-Modelica.Constants.eps,"Only one directional flow is supported!");

        Reabsorption.q = -min(0,FractReab*(Inflow.q-OutflowMin));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},
                  {100,100}}),       graphics={Text(
                extent={{-100,130},{100,108}},
                lineColor={0,0,255},
                textString="%name")}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",       info="<html>
<p><h4><font color=\"#008000\">Hydraulic Reabsorption</font></h4></p>
<p>If useOutflowMin=false then the next schema is used.</p>
<p><ul>
<li><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/HydraulicReabsorption.png\"/></li>
</ul></p>
<p><br/>If  useOutflowMin=true then the extended schema is used:</p>
<p><ul>
<li><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/HydraulicReabsorptionWithOutflowMin.png\"/></li>
</ul></p>
</html>"));
      end Reabsorption;

      model IdealValve
        extends Interfaces.OnePort;

         Boolean open(start=true) "Switching state";

         Real passableVariable(start=0, final unit="1")
          "Auxiliary variable for actual position on the ideal diode characteristic";
        /*  = 0: knee point
      < 0: below knee point, diode locking
      > 0: above knee point, diode conducting */

        parameter Physiolibrary.Types.HydraulicConductance _Gon(final min=0, displayUnit="l/(mmHg.min)") = 1.2501026264094e-02
          "Forward state-on conductance (open valve conductance)"
          annotation (Dialog(enable=not useLimitationInputs)); //= the same as resistance 1e-5 mmHg/(l/min)
        parameter Physiolibrary.Types.HydraulicConductance _Goff(final min=0, displayUnit="l/(mmHg.min)") = 1.2501026264094e-12
          "Backward state-off conductance (closed valve conductance)"
          annotation (Dialog(enable=not useLimitationInputs)); //= 1e-5 (l/min)/mmHg
        parameter Physiolibrary.Types.Pressure Pknee(final min=0, start=0)
          "Forward threshold pressure";

        parameter Boolean useLimitationInputs = false
          "=true, if Gon and Goff are from inputs"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        Types.RealIO.HydraulicConductanceInput Gon(start=_Gon)=gon if useLimitationInputs
          "open valve conductance = infinity for ideal case" annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-60,100})));
        Types.RealIO.HydraulicConductanceInput Goff(start=_Goff)=goff if useLimitationInputs
          "closed valve conductance = zero for ideal case" annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,100})));

      protected
        Physiolibrary.Types.HydraulicConductance gon,goff;
        constant Physiolibrary.Types.Pressure unitPressure=1;
        constant Physiolibrary.Types.VolumeFlowRate unitFlow=1;

      equation
        if not useLimitationInputs then
          gon = _Gon;
          goff = _Goff;
        end if;

        open = passableVariable > 0;

        dp = (passableVariable*unitFlow)*(if open then 1/gon else 1) + Pknee;
        volumeFlowRate = (passableVariable*unitPressure)*(if open then 1 else goff) + goff*Pknee;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                               graphics={Polygon(
                points={{-76,66},{-76,-82},{34,-10},{34,12},{-66,68},{-76,74},{
                    -76,66}},
                lineColor={0,0,127},
                smooth=Smooth.None,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid), Rectangle(
                extent={{40,96},{68,-94}},
                lineColor={0,0,127},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-188,-96},{192,-118}},
                lineColor={255,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={255,85,85},
                textString="%name")}),
          Documentation(info="<html>
<p>Ideal Valve allows a volumetric flow in one direction in case of pressure gradient is greater. </p>
</html>",   revisions="<html>
<p><i>2014</i></p>
<p>Tomas Kulhanek, Charles University, Prague, Czech Republic </p>
</html>"));
      end IdealValve;

    end Components;

    package Sensors
      extends Modelica.Icons.SensorsPackage;
      model FlowMeasure "Volumetric flow between ports"
        extends Interfaces.OnePort;
        extends Icons.FlowMeasure;

        Physiolibrary.Types.RealIO.VolumeFlowRateOutput actualFlow
          "Actual volume flow rate"
                               annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              rotation=270,
              origin={0,-60})));
      equation
        q_out.pressure = q_in.pressure;

        actualFlow = q_in.q;

       annotation (
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end FlowMeasure;

      model PressureMeasure "Hydraulic pressure at port"
        extends Icons.PressureMeasure;

        Interfaces.HydraulicPort_a
                             q_in annotation (Placement(
              transformation(extent={{-60,-80},{-20,-40}})));
        Physiolibrary.Types.RealIO.PressureOutput actualPressure
          "Actual pressure"    annotation (Placement(transformation(extent={{40,-60},
                  {80,-20}})));
      equation

        actualPressure = q_in.pressure;
        q_in.q = 0;
       annotation (
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end PressureMeasure;
    end Sensors;

    package Sources
      extends Modelica.Icons.SourcesPackage;
      model UnlimitedPump "Prescribed flow at port"
        extends Chemical.Interfaces.ConditionalSolutionFlow;

        Interfaces.HydraulicPort_b
                             q_out
                               annotation (Placement(
              transformation(extent={{86,-14},{114,14}})));
      equation
        q_out.q = - q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-94},{150,-54}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",       info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
      end UnlimitedPump;

        model UnlimitedVolume "Prescribed pressure at port"
          import Physiolibrary.Types.*;

          parameter Boolean usePressureInput = false
          "=true, if pressure input is used"
            annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

          parameter Pressure P=0 "Hydraulic pressure if usePressureInput=false"
            annotation (Dialog(enable=not usePressureInput));

          RealIO.PressureInput pressure(start=P)=p if usePressureInput
          "Pressure"
            annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

          Interfaces.HydraulicPort_a
                               y "PressureFlow output connectors"
            annotation (Placement(transformation(extent={{84,-16},{116,16}})));

         parameter Boolean isIsolatedInSteadyState = true
          "=true, if there is no flow at port in steady state"
            annotation (Dialog(group="Simulation",tab="Equilibrium"));

         parameter Physiolibrary.Types.SimulationType  Simulation=SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added."
            annotation (Dialog(group="Simulation",tab="Equilibrium"));

      protected
          Pressure p;

        initial equation
          if isIsolatedInSteadyState and (Simulation==SimulationType.InitSteadyState) then
            y.q = 0;
          end if;

        equation
          if not usePressureInput then
            p=P;
          end if;

          y.pressure = p;

          if isIsolatedInSteadyState and (Simulation==SimulationType.SteadyState) then
             y.q = 0;
          end if;

          annotation (Documentation(info="<html>
<p>Model has a vector of continuous Real input signals as pressures for vector of pressure-flow connectors. </p>
<p>Usage in tests: Set defaul volume&GT;0 and try to set STEADY in instances to &QUOT;false&QUOT;!</p>
</html>",  revisions=
             "<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
                            graphics={
                Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={170,255,255},
                fillPattern=FillPattern.Backward),
                Text(
                  extent={{0,0},{-100,-100}},
                  lineColor={0,0,0},
                textString="P"),
                Line(
                  points={{-100,0},{56,0}},
                  color={191,0,0},
                  thickness=0.5),
                Polygon(
                  points={{38,-20},{38,20},{78,0},{38,-20}},
                  lineColor={191,0,0},
                  fillColor={191,0,0},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-150,150},{150,110}},
                  textString="%name",
                  lineColor={0,0,255})}));
        end UnlimitedVolume;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;
      connector HydraulicPort
        "Hydraulical connector with pressure and volumetric flow"
        Physiolibrary.Types.Pressure pressure "Pressure";
        flow Physiolibrary.Types.VolumeFlowRate q "Volume flow";
        annotation (Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009-2013</td>
</tr>
</table>
</html>", info="<html>
<p><font style=\"font-size: 9pt; \">This connector connects hydraulic domains elements. The elements contains one equation for each his pressure-flow connector. The equation defines relation between variables in the connector. Variables are hydraulic pressure and volume flow of hydraulic medium. The pressure is the same in each connector that are connected together. The sum of flow in connectors connected together is zero (</font><b><font style=\"font-size: 9pt; \">Kirchhoff&apos;s circuit laws</font></b><font style=\"font-size: 9pt; \">).</font> </p>
</html>"));
      end HydraulicPort;

      connector HydraulicPort_a "Hydraulical inflow connector"
        extends HydraulicPort;

      annotation (
          defaultComponentName="port_a",
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={0,0,0},
                lineThickness=1), Polygon(
                points={{-1.22465e-014,100},{100,1.22465e-014},{1.22465e-014,-100},
                    {-100,-1.22465e-014},{-1.22465e-014,100}},
                lineColor={0,0,0},
                smooth=Smooth.None,
                fillPattern=FillPattern.Solid,
                fillColor={0,0,0},
                rotation=180)}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Polygon(
                points={{0,50},{50,0},{0,-50},{-50,0},{0,50}},
                lineColor={0,0,0},
                smooth=Smooth.None,
                fillPattern=FillPattern.Solid,
                fillColor={0,0,0}),Text(extent = {{-160,110},{40,50}}, lineColor = {0,0,0}, textString = "%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end HydraulicPort_a;

      connector HydraulicPort_b "Hydraulical outflow connector"
        extends HydraulicPort;

      annotation (
          defaultComponentName="port_b",
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={0,0,0},
                lineThickness=1), Polygon(
                points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},
                lineColor={0,0,0},
                smooth=Smooth.None,
                fillPattern=FillPattern.Solid,
                fillColor={200,200,200})}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Polygon(
                points={{0,50},{50,0},{0,-50},{-50,0},{0,50}},
                lineColor={0,0,0},
                smooth=Smooth.None,
                fillPattern=FillPattern.Solid,
                fillColor={200,200,200}),Text(extent = {{-160,110},{40,50}}, lineColor = {0,0,0}, textString = "%name")}));
      end HydraulicPort_b;

      partial model OnePort "Hydraulical OnePort"

        HydraulicPort_a      q_in "Volume inflow" annotation (Placement(
              transformation(extent={{-114,-14},{-86,14}})));
        HydraulicPort_b      q_out "Volume outflow"
                               annotation (Placement(
              transformation(extent={{86,-14},{114,14}})));

         Physiolibrary.Types.VolumeFlowRate volumeFlowRate "Volumetric flow";
         Physiolibrary.Types.Pressure dp "Pressure gradient";
      equation
        q_in.q + q_out.q = 0;

        volumeFlowRate = q_in.q;
        dp = q_in.pressure - q_out.pressure;
      end OnePort;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",   info="<html>
<p>The main usage of the hydraulic domain in human physiology is modeling of the cardio-vascular system. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for incompressible water, at normal liquid-water temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of hydraulic resistance, hydrostatic pressure, volumetric flow, inertia and finally the block of blood accumulation in elastic vessels.</p>
</html>"));
  end Hydraulic;

  package Thermal
    "Domain with Temperature and Heat Flow - extension of Modelica.Thermal.HeatTransfer"
   extends Modelica.Icons.Package;
    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;

      model SkinHeatFlow
      extends Modelica.Icons.Example;

        Components.IdealRadiator skinCirculation(MassFlow(displayUnit="g/min")=
            0.0028333333333333) "Blood flow through skin"
          annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
        Sources.UnlimitedHeat bodyCore(T(displayUnit="degC") = 310.15)
          annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
        Sources.UnlimitedHeat skin(T(displayUnit="degC") = 301.15)
          annotation (Placement(transformation(extent={{-8,4},{12,24}})));
      equation
        connect(skinCirculation.q_in, bodyCore.port) annotation (Line(
            points={{16,-20},{0,-20}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(skin.port, skinCirculation.q_out) annotation (Line(
            points={{12,14},{26,14},{26,-12}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        annotation (        experiment(StopTime=10000, Tolerance=1e-006),
            Documentation(revisions=
                          "<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SkinHeatFlow;

      model MuscleHeat
      extends Modelica.Icons.Example;

        Components.HeatAccumulation
                         muscle(
          relativeHeat_start=52125.66,
          SpecificHeat=3475.044,
          Weight(displayUnit="kg") = 15)
          annotation (Placement(transformation(extent={{16,22},{36,42}})));
        Components.IdealRadiator
                      muscleCirculation(MassFlow(displayUnit="g/min") = 0.0114)
          "Blood circulation in skeletal muscle"
          annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow generatedHeat(Q_flow=13.956)
          "Heat energy created by muscle"
          annotation (Placement(transformation(extent={{-32,20},{-12,40}})));
        Sources.UnlimitedHeat                                  body(T(displayUnit="degC")=
               310.15)
          annotation (Placement(transformation(extent={{-32,-30},{-12,-10}})));
      equation
        connect(muscle.q_in, generatedHeat.port)
                                              annotation (Line(
            points={{26,32},{8,32},{8,30},{-12,30}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(muscleCirculation.q_in, body.port) annotation (Line(
            points={{16,-20},{-12,-20}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(muscle.q_in, muscleCirculation.q_out) annotation (Line(
            points={{26,32},{26,-12}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        annotation (        experiment(StopTime=10000, Tolerance=1e-006),
            Documentation(revisions=
                          "<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end MuscleHeat;

      model ThermalBody_QHP
        import Physiolibrary;
        extends Modelica.Icons.Example;
        Physiolibrary.Thermal.Components.HeatAccumulation
                          core(SpecificHeat=3475.044, Weight=10.75)
          annotation (Placement(transformation(extent={{-12,-4},{8,16}})));
        Physiolibrary.Thermal.Components.HeatAccumulation
                          GILumen(Weight=1)
          annotation (Placement(transformation(extent={{40,-52},{60,-32}})));
        Physiolibrary.Thermal.Components.HeatAccumulation
                          skeletalMuscle(SpecificHeat=3475.044, Weight=7.05)
          annotation (Placement(transformation(extent={{36,42},{56,62}})));
        Physiolibrary.Thermal.Components.IdealRadiator
                      muscleBloodFlow(
          MassFlow(displayUnit="g/min") = 0.0114,
          useMassFlowInput=false,
          SpecificHeat=3851.856)      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              origin={32,30})));
        Physiolibrary.Thermal.Components.HeatOutstream
                      urination
          annotation (Placement(transformation(extent={{-28,-60},{-48,-40}})));
        Physiolibrary.Thermal.Components.HeatOutstream
                      lungsVapor(VaporizationHeat(displayUnit="kcal/g") = 2428344,
            SpecificHeat(displayUnit="kcal/(kg.K)"),
          MassFlow(displayUnit="g/min") = 4.6666666666667e-06)
          annotation (Placement(transformation(extent={{12,66},{32,86}})));
        Physiolibrary.Thermal.Components.HeatAccumulation
                          skin(
          relativeHeat_start=-8373.6,
          SpecificHeat=3475.044,
          Weight=0.56)
          annotation (Placement(transformation(extent={{-68,4},{-48,24}})));
        Physiolibrary.Thermal.Components.IdealRadiator
                      skinBloodFlow(
          MassFlow(displayUnit="g/min") = 0.0028333333333333,
          useMassFlowInput=false,
          SpecificHeat=3851.856)    annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              origin={-28,2})));
        Physiolibrary.Thermal.Components.HeatOutstream
                      insensibleVapor(VaporizationHeat(displayUnit="kcal/g") = 2428344,
            SpecificHeat(displayUnit="kcal/(kg.K)"),
          MassFlow(displayUnit="g/min") = 6.5e-06)
          annotation (Placement(transformation(extent={{-48,32},{-28,52}})));
        Physiolibrary.Thermal.Components.HeatOutstream
                      sweating(VaporizationHeat(displayUnit="kcal/g") = 2428344,
            SpecificHeat(displayUnit="kcal/(kg.K)"))
          annotation (Placement(transformation(extent={{-44,58},{-24,78}})));
        Modelica.Thermal.HeatTransfer.Components.ThermalConductor lumenVolume(G(
              displayUnit="kcal/(min.K)") = 1)
          annotation (Placement(transformation(extent={{32,-60},{12,-40}})));
        Modelica.Thermal.HeatTransfer.Components.ThermalConductor air(G(
              displayUnit="kcal/(min.K)") = 2.4423)                   annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-76,50})));
        Physiolibrary.Thermal.Sources.UnlimitedHeat            ambient(T=295.15)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-76,84})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow skinMetabolicHeat(Q_flow=
              1.95384)
          annotation (Placement(transformation(extent={{-92,2},{-72,22}})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow coreMetabolicHeat(Q_flow=
              55.824)
          annotation (Placement(transformation(extent={{86,-6},{66,14}})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow muscleMetabolicHeat(Q_flow(
              displayUnit="kcal/min") = 9.7692)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={78,60})));
        Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow foodHeatIntake(Q_flow=0)
                                                                       annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={78,-38})));
        Physiolibrary.Thermal.Components.Stream
                   foodAbsorption(SpecificHeat=4186.8)
          annotation (Placement(transformation(extent={{44,-32},{24,-12}})));
      equation

        connect(core.q_in, muscleBloodFlow.q_in) annotation (Line(
            points={{-2,6},{-2,32},{22,32}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(skeletalMuscle.q_in, muscleBloodFlow.q_out) annotation (Line(
            points={{46,52},{32,52},{32,40}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(core.q_in, urination.q_in) annotation (Line(
            points={{-2,6},{-6,6},{-6,-50},{-28,-50}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(core.q_in, lungsVapor.q_in) annotation (Line(
            points={{-2,6},{-2,76},{12,76}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(skinBloodFlow.q_in, lungsVapor.q_in) annotation (Line(
            points={{-18,4},{-2,4},{-2,76},{12,76}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(skin.q_in, skinBloodFlow.q_out) annotation (Line(
            points={{-58,14},{-28,14},{-28,12}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(skin.q_in, insensibleVapor.q_in) annotation (Line(
            points={{-58,14},{-58,42},{-48,42}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(sweating.q_in, insensibleVapor.q_in) annotation (Line(
            points={{-44,68},{-58,68},{-58,42},{-48,42}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(GILumen.q_in, lumenVolume.port_a) annotation (Line(
            points={{50,-42},{40,-42},{40,-50},{32,-50}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(core.q_in, lumenVolume.port_b) annotation (Line(
            points={{-2,6},{2,6},{2,-50},{12,-50}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(skin.q_in, air.port_b) annotation (Line(
            points={{-58,14},{-58,30},{-76,30},{-76,40}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(skin.q_in, skinMetabolicHeat.port)
                                                annotation (Line(
            points={{-58,14},{-66,14},{-66,12},{-72,12}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(GILumen.q_in, foodHeatIntake.port)
                                               annotation (Line(
            points={{50,-42},{60,-42},{60,-38},{68,-38}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(skeletalMuscle.q_in, muscleMetabolicHeat.port)
                                                            annotation (Line(
            points={{46,52},{58,52},{58,60},{68,60}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(core.q_in, coreMetabolicHeat.port)
                                                annotation (Line(
            points={{-2,6},{32,6},{32,4},{66,4}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(skinBloodFlow.q_in, core.q_in) annotation (Line(
            points={{-18,4},{-12,4},{-12,6},{-2,6}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(GILumen.q_in,foodAbsorption. q_in)
                                               annotation (Line(
            points={{50,-42},{50,-22},{44,-22}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(foodAbsorption.q_out, core.q_in)
                                             annotation (Line(
            points={{24,-22},{2,-22},{2,6},{-2,6}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(ambient.port, air.port_a) annotation (Line(
            points={{-76,74},{-76,60}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        annotation ( Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),experiment(StopTime=3600));
      end ThermalBody_QHP;

      model SkinHeatTransferOnBloodFlow
      extends Modelica.Icons.Example;

        Components.IdealRadiator skinCirculation(MassFlow(displayUnit="g/min")=
            0.0028333333333333) "Blood circulation through skin"
          annotation (Placement(transformation(extent={{16,-32},{36,-12}})));
        Sources.UnlimitedHeat                                  core(T(displayUnit="degC")=
               310.15)
          annotation (Placement(transformation(extent={{-32,-30},{-12,-10}})));
        Sources.UnlimitedHeat skin(T(displayUnit="degC") = 301.15)
          annotation (Placement(transformation(extent={{-12,2},{8,22}})));
      equation
        connect(skinCirculation.q_in, core.port) annotation (Line(
            points={{16,-20},{-12,-20}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(skin.port, skinCirculation.q_out) annotation (Line(
            points={{8,12},{26,12},{26,-12}},
            color={191,0,0},
            thickness=1,
            smooth=Smooth.None));
        annotation (        experiment(StopTime=10000, Tolerance=1e-006),
            Documentation(revisions=
                          "<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SkinHeatTransferOnBloodFlow;
    end Examples;

    package Components
      extends Modelica.Icons.Package;

      model IdealRadiator
        "Closed circiut radiator, where outflowed = ambient temperature"
        extends Interfaces.ConditionalMassFlow;
        extends Icons.Radiator;

        parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=3851.856
          "Specific heat of flow circuit medium";  //default heat capacity of blood is used as 0.92 kcal/(degC.kg)

        Physiolibrary.Thermal.Interfaces.HeatPort_a
                         q_in annotation (Placement(
              transformation(extent={{-110,10},{-90,30}})));
        Physiolibrary.Thermal.Interfaces.HeatPort_b
                         q_out annotation (Placement(
              transformation(extent={{-10,90},{10,110}})));
      equation
        q_in.Q_flow + q_out.Q_flow = 0;
      //  assert(substanceFlow>=-Modelica.Constants.eps,"In IdealRadiator must be always the forward flow direction! Not 'substanceFlow<0'!");
        q_in.Q_flow = q*(q_in.T-q_out.T)*SpecificHeat;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={
              Text(
                extent={{-144,-142},{156,-102}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",       info="<html>
<p>The real inflow to radiator can be described by substanceFlow and temperature q_in.T.</p>
<p><b>q_in.q=q_out.q is not the heat inflow to Radiator input</b>, but the heat convected from radiator to environment!</p>
<p>The environment temperature is the same as radiator output temperature q_out.T. </p>
<p>And the flow of heat from radiator to environment is driven by Fick principle.</p>
</html>"));
      end IdealRadiator;

      model HeatAccumulation "Accumulating of heat to substance"
        extends Icons.HeatAccumulation;
        extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                           state_start=relativeHeat_start, storeUnit=
            "kcal");
        Interfaces.HeatPort_a
                         q_in "Heat inflow/outflow connector"
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

        parameter Physiolibrary.Types.Heat relativeHeat_start = 0
          "Heat start value = weight*(initialTemperature - 37degC)*specificHeat"
           annotation (Dialog(group="Initialization"));

        parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat= 4186.8
          "Mass specific heat";
        Physiolibrary.Types.Temperature T "Current temperature";

        Physiolibrary.Types.RealIO.HeatOutput relativeHeat
          "Current accumulated heat = weight*(T - 37degC)*specificHeat"
                                                                    annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-100})));                                            //nominal=1
       //absoluteHeat =  weight*310.15*specificHeat + relativeHeat

        constant Types.Temperature NormalBodyTemperature = 310.15
          "Shift of absolute zero temperature to normal body values";

        parameter Boolean useMassInput = false "=true, if mass input is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Mass Weight=1 "Total mass weight if useMassInput=false"
          annotation (Dialog(enable=not useMassInput));
        Physiolibrary.Types.RealIO.MassInput weight(start=Weight)=m if useMassInput
          "Weight of mass, where the heat are accumulated"                            annotation (Placement(transformation(extent={{-120,60},
                  {-80,100}})));
      protected
        Types.Mass m;

      equation
        if not useMassInput then
          m=Weight;
        end if;

        q_in.T=NormalBodyTemperature + relativeHeat/(m*SpecificHeat);
        T = q_in.T;

        state = relativeHeat;  // der(relativeHeat)=q_in.q
        change = q_in.Q_flow;
        annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}),
               graphics={
              Text(
                extent={{-20,-140},{280,-100}},
                textString="%name",
                lineColor={0,0,255})}));
      end HeatAccumulation;

      model Conductor "Heat resistor"
       extends Interfaces.OnePort;
       extends Icons.Resistor;

        parameter Boolean useConductanceInput = false
          "=true, if external conductance value is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.ThermalConductance Conductance=0
          "Thermal conductance if useConductanceInput=false"
          annotation (Dialog(enable=not useConductanceInput));

        Physiolibrary.Types.RealIO.ThermalConductanceInput conductance(start=Conductance)=c if useConductanceInput
                                                         annotation (Placement(
              transformation(extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

      protected
         Types.ThermalConductance c;
      equation
        if not useConductanceInput then
          c=Conductance;
        end if;

        q_in.Q_flow = c * (q_in.T - q_out.T);
        annotation (Icon(graphics={Text(
                extent={{-70,-30},{70,30}},
                textString="%name",
                lineColor={0,0,255})}), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Conductor;

      model Stream "Flow of whole heated mass"
        extends Interfaces.OnePort;
        extends Interfaces.ConditionalMassFlow;

        parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat
          "Of flow circuit medium";

      equation
        q_in.Q_flow = if (q>0) then q*q_in.T*SpecificHeat else q*q_out.T*SpecificHeat;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={191,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{20,-84},{320,-44}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p><h4><font color=\"#008000\">Bidirectional heated mass flow by temperature</font></h4></p>
<p>Possible field values: </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
<td></td>
<td><p align=\"center\"><h4>forward flow</h4></p></td>
<td><p align=\"center\"><h4>backward flow</h4></p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>massFlow</h4></p></td>
<td><p align=\"center\">&GT;=0</p></td>
<td><p align=\"center\">&LT;=0</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_in.q</h4></p></td>
<td><p align=\"center\">=massFlow*q_in.T*SpecificHeat</p></td>
<td><p align=\"center\">=-q_out.q</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_out.q</h4></p></td>
<td><p align=\"center\">=-q_in.q</p></td>
<td><p align=\"center\">=massFlow*q_out.T*SpecificHeat</p></td>
</tr>
</table>
<br/>
</html>"));
      end Stream;

      model HeatOutstream
        "One-directional outflow of heated mass (with effect of vaporization)"
        extends Interfaces.ConditionalMassFlow;

        Interfaces.HeatPort_a
                         q_in "flow circuit"     annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}})));
        parameter Physiolibrary.Types.SpecificEnergy VaporizationHeat=0
          "Used for whole outflow stream";                                            // or 2428344 for water vaporization
        parameter Physiolibrary.Types.SpecificHeatCapacity SpecificHeat=4186.8
          "Of outflowing medium";  //default heat capacity of water is 1 kcal/(degC.kg)

      equation
      //  assert(liquidOutflow_>=-Modelica.Constants.eps,"HeatOutstream must have always one forward flow direction! Not 'liquidOutflow_<0'!");
        q_in.Q_flow = q*(q_in.T*SpecificHeat + VaporizationHeat);

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                              graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={191,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{20,-84},{320,-44}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end HeatOutstream;

    end Components;

    package Sources
      extends Modelica.Icons.SourcesPackage;
      model UnlimitedHeat "Prescribed temperature"
        //extends Modelica.Thermal.HeatTransfer.Sources.FixedTemperature;
        import Physiolibrary.Types.*;

        parameter Boolean useTemperatureInput = false
          "=true, if fixed temperature is from input instead of parameter"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

         parameter Temperature T = 0
          "Fixed temperature at port if useTemperatureInput=false"
          annotation (Dialog(enable=not useTemperatureInput));

        parameter Boolean isIsolatedInSteadyState = false
          "=true, if there is no flow at port in steady state"
          annotation (Dialog(group="Simulation",tab="Equilibrium"));

        parameter SimulationType  Simulation=SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added."
          annotation (Dialog(group="Simulation",tab="Equilibrium"));

        Interfaces.HeatPort_b       port annotation (Placement(transformation(extent={{90,-10},
                  {110,10}})));

      protected
        Temperature t "Current temperature";
      public
        Types.RealIO.TemperatureInput temperature(start=T)= t if useTemperatureInput
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

      initial equation
        if isIsolatedInSteadyState and (Simulation==SimulationType.InitSteadyState) then
          port.Q_flow = 0;
        end if;

      equation
        if not useTemperatureInput then
          t=T;
        end if;

        port.T = t;

        if isIsolatedInSteadyState and (Simulation==SimulationType.SteadyState) then
            port.Q_flow = 0;
        end if;

         annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                              graphics={
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-150,-110},{150,-140}},
                lineColor={0,0,0},
                textString="T=%T"),
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={159,159,223},
                fillPattern=FillPattern.Backward),
              Text(
                extent={{0,0},{-100,-100}},
                lineColor={0,0,0},
                textString="K"),
              Line(
                points={{-52,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{50,-20},{50,20},{90,0},{50,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid)}),
          Documentation(info="<HTML>
<p>
This model defines a fixed temperature T at its port in Kelvin,
i.e., it defines a fixed temperature as a boundary condition.
</p>
</HTML>
", revisions = "<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end UnlimitedHeat;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      connector HeatPort = Modelica.Thermal.HeatTransfer.Interfaces.HeatPort(T(displayUnit="degC"),Q_flow(displayUnit="kcal/min", nominal=4186.8/60));
      connector HeatPort_a "Heat inflow"
        extends HeatPort;

        annotation (
          defaultComponentName="port_a",
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={191,0,0},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid)}),
          Diagram(graphics={
                        Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
         Text(extent={{-160,110},{40,50}},   lineColor=  {191,0,0}, textString=  "%name")}));
      end HeatPort_a;

      connector HeatPort_b "Heat outflow"
        extends HeatPort;

      annotation (
          defaultComponentName="port_b",
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={191,0,0},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={191,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(graphics={
                        Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={191,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
         Text(extent={{-160,110},{40,50}},   lineColor=  {191,0,0}, textString=  "%name")}));

      end HeatPort_b;

      partial model OnePort "Heat OnePort"

        HeatPort_a       q_in annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}})));
        HeatPort_b       q_out annotation (Placement(
              transformation(extent={{90,-10},{110,10}})));
      equation
        q_in.Q_flow + q_out.Q_flow = 0;
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end OnePort;

      partial model ConditionalMassFlow
        "Input of mass flow vs. parametric mass flow"

        parameter Boolean useMassFlowInput = false
          "=true, if mass flow input is used instead of parameter MassFlow"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.MassFlowRate MassFlow=0
          "Mass flow if useMassFlowInput=false"
          annotation (Dialog(enable=not useSolventFlowInput));

        Physiolibrary.Types.RealIO.MassFlowRateInput massFlow(start=MassFlow)=q if useMassFlowInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,70})));

        Physiolibrary.Types.MassFlowRate q "Current mass flow";
      equation
        if not useMassFlowInput then
          q = MassFlow;
        end if;

      end ConditionalMassFlow;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",   info="<html>
<p>For the human body to function optimally, it is critical to hold the core temperature at 35&ndash;39&deg;C. A fever of 41&deg;C for more than a short period of time causes brain damage. If the core temperature falls below 10&deg;C, the heart stops. As in the hydraulic domain, the thermal domain is simplified to these conditions. </p>
<p>In the Physiolibrary.Thermal package extends the package Modelica.Thermal.HeatTransfer from Modelica Standard Library 3.2 (MSL), where the connector is composed of temperature and heat flow. The main blocks in Physiolibrary.Thermal are: Conductor, IdealRadiator and HeatAccumulation. The heat conductor conducts the heat from the source, such us muscles or metabolically active tissue, to its surrounding. IdealRadiator delivers heat to tissues by blood circulation. HeatAccumulation plays a role in accumulating thermal energy in each tissue mass driven by its heat capacity. We recommend to use this block instead of Modelica.Thermal.HeatTransfer.HeatCapacitor to have possibility of variable mass amount or to have a support for calculation of steady state. </p>
</html>"));
  end Thermal;

  package Osmotic "Domain with Osmorarity and Solvent Volumetric Flow"
   extends Modelica.Icons.Package;
    package Examples
      "Examples that demonstrate usage of the Osmotic flow components"
    extends Modelica.Icons.ExamplesPackage;

      model Cell
      extends Modelica.Icons.Example;

        Components.OsmoticCell
                    cells(volume_start(displayUnit="l") = 0.001,
            ImpermeableSolutes=0.285)
          annotation (Placement(transformation(extent={{-44,36},{-24,56}})));
        Components.OsmoticCell
                    interstitium(volume_start(displayUnit="l") = 0.001,
            ImpermeableSolutes=0.28)
          annotation (Placement(transformation(extent={{34,36},{54,56}})));
        Components.Membrane
                 membrane(cond=1.2501026264094e-10)
          annotation (Placement(transformation(extent={{-4,36},{16,56}})));
        Components.OsmoticCell
                    cells1(volume_start(displayUnit="l") = 0.001,
            ImpermeableSolutes=0.285)
          annotation (Placement(transformation(extent={{-44,-64},{-24,-44}})));
        Components.OsmoticCell
                    interstitium1(volume_start(displayUnit="l") = 0.001,
            ImpermeableSolutes=0.29)
          annotation (Placement(transformation(extent={{34,-64},{54,-44}})));
        Components.Membrane
                 membrane1(cond=1.2501026264094e-10)
          annotation (Placement(transformation(extent={{-4,-64},{16,-44}})));
      equation
        connect(cells.q_in, membrane.q_in) annotation (Line(
            points={{-34,46},{-4,46}},
            color={127,127,0},
            thickness=1,
            smooth=Smooth.None));
        connect(membrane.q_out, interstitium.q_in) annotation (Line(
            points={{16,46},{44,46}},
            color={127,127,0},
            thickness=1,
            smooth=Smooth.None));
        connect(cells1.q_in, membrane1.q_in) annotation (Line(
            points={{-34,-54},{-4,-54}},
            color={127,127,0},
            thickness=1,
            smooth=Smooth.None));
        connect(membrane1.q_out, interstitium1.q_in) annotation (Line(
            points={{16,-54},{44,-54}},
            color={127,127,0},
            thickness=1,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),      graphics={
              Text(
                extent={{-52,84},{42,76}},
                lineColor={135,135,135},
                textString="Cells in hypotonic environment"),
              Text(
                extent={{-52,-16},{42,-24}},
                lineColor={95,95,95},
                textString="Cells in hypertonic environment"),
              Line(
                points={{-98,8},{98,8}},
                color={135,135,135},
                smooth=Smooth.None,
                thickness=1)}),
          experiment(StopTime=60),
          Documentation(revisions=
                          "<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Cell;

      model CerebrospinalFluid
      extends Modelica.Icons.Example;

        Components.OsmoticCell CSF_osmotic(volume_start(displayUnit="ml")=
            0.00015, ImpermeableSolutes=0.286*0.15) "cerebro-spinal fluid"
          annotation (Placement(transformation(extent={{-76,-6},{-56,14}})));
        Components.Membrane choroid_plexus(useHydraulicPressureInputs=true, cond(
              displayUnit="ml/(mmHg.day)") = 1.9966916949595e-12)
          "choroid plexus"
          annotation (Placement(transformation(extent={{-16,-6},{-36,14}})));
        Hydraulic.Components.ElasticVessel CSF_hydraulic(
          volume_start=0.00015,
          ZeroPressureVolume=0.000145,
          Compliance=2.250184727537e-09) "cerebro-spinal fluid"
          annotation (Placement(transformation(extent={{-96,-32},{-76,-12}})));
        Hydraulic.Components.Pump choroid_plexus_hydraulic(useSolutionFlowInput=
              true) annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={8,-22})));
        Sensors.FlowMeasure flowMeasure annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={8,4})));
        Hydraulic.Sensors.PressureMeasure pressureMeasure
          annotation (Placement(transformation(extent={{-90,64},{-70,84}})));
        Sources.UnlimitedSolution ECF_osmotic(Osm=285)
          "extracellular (extracerebrospinal) fluid osmolarity" annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={46,32})));
        Hydraulic.Sources.UnlimitedVolume veins(P=0) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={82,86})));
        Components.Membrane arachnoid_villi(useHydraulicPressureInputs=true, cond(
              displayUnit="ml/(mmHg.day)") = 1.1285648710641e-11)
          "choroid plexus"
          annotation (Placement(transformation(extent={{-36,46},{-16,66}})));
        Hydraulic.Components.Pump arachnoid_villi_hydraulic(useSolutionFlowInput=
              true)
          annotation (Placement(transformation(extent={{-2,96},{18,76}})));
        Sensors.FlowMeasure flowMeasure1
          annotation (Placement(transformation(extent={{-2,66},{18,46}})));
        Hydraulic.Sources.UnlimitedVolume arteries(P=12665.626804425) annotation (
           Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=180,
              origin={80,26})));
        Hydraulic.Components.Conductor conductor(Conductance(displayUnit=
                "ml/(mmHg.min)") = 3.7503078792283e-11)
                                                       annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={96,0})));
        Hydraulic.Components.ElasticVessel choroidPlexusCapilaries(volume_start=
              1.4e-05, Compliance=3.7503078792283e-09)
          annotation (Placement(transformation(extent={{56,-32},{76,-12}})));
        Hydraulic.Components.Conductor conductor1(Conductance=8.750718384866e-11)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={66,50})));
        Hydraulic.Sensors.PressureMeasure pressureMeasure1
          annotation (Placement(transformation(extent={{68,64},{48,84}})));
        Hydraulic.Sensors.PressureMeasure pressureMeasure2
          annotation (Placement(transformation(extent={{62,-22},{42,-2}})));
      equation
        connect(flowMeasure.actualFlow, choroid_plexus_hydraulic.solutionFlow)
          annotation (Line(
            points={{8,-2},{8,-18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(CSF_hydraulic.q_in, pressureMeasure.q_in) annotation (Line(
            points={{-86,-22},{-86,68},{-84,68}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(CSF_hydraulic.q_in, choroid_plexus_hydraulic.q_out) annotation (
            Line(
            points={{-86,-22},{-2,-22}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(flowMeasure.q_in, ECF_osmotic.port) annotation (Line(
            points={{18,4},{32,4},{32,32},{36,32}},
            color={127,127,0},
            thickness=1,
            smooth=Smooth.None));
        connect(CSF_osmotic.q_in, arachnoid_villi.q_in) annotation (Line(
            points={{-66,4},{-66,56},{-36,56}},
            color={127,127,0},
            thickness=1,
            smooth=Smooth.None));
        connect(CSF_hydraulic.q_in, arachnoid_villi_hydraulic.q_in) annotation (
            Line(
            points={{-86,-22},{-86,86},{-2,86}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(arachnoid_villi_hydraulic.q_out, veins.y) annotation (Line(
            points={{18,86},{72,86}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pressureMeasure.actualPressure, arachnoid_villi.hydraulicPressureIn)
          annotation (Line(
            points={{-74,70},{-34,70},{-34,64}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(arachnoid_villi.q_out, flowMeasure1.q_in) annotation (Line(
            points={{-16,56},{-2,56}},
            color={127,127,0},
            thickness=1,
            smooth=Smooth.None));
        connect(flowMeasure1.q_out, ECF_osmotic.port) annotation (Line(
            points={{18,56},{32,56},{32,32},{36,32}},
            color={127,127,0},
            thickness=1,
            smooth=Smooth.None));
        connect(flowMeasure1.actualFlow, arachnoid_villi_hydraulic.solutionFlow)
          annotation (Line(
            points={{8,62},{8,82}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(conductor.q_out, choroidPlexusCapilaries.q_in) annotation (Line(
            points={{96,-10},{96,-22},{66,-22}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(choroidPlexusCapilaries.q_in, conductor1.q_in) annotation (Line(
            points={{66,-22},{66,40}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(veins.y, conductor1.q_out) annotation (Line(
            points={{72,86},{66,86},{66,60}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(arteries.y, conductor.q_in) annotation (Line(
            points={{90,26},{96,26},{96,10}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(choroid_plexus_hydraulic.q_in, choroidPlexusCapilaries.q_in)
          annotation (Line(
            points={{18,-22},{66,-22}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pressureMeasure1.q_in, veins.y) annotation (Line(
            points={{62,68},{66,68},{66,86},{72,86}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pressureMeasure1.actualPressure, arachnoid_villi.hydraulicPressureOut)
          annotation (Line(
            points={{52,70},{-18,70},{-18,64}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(choroidPlexusCapilaries.q_in, pressureMeasure2.q_in) annotation (
            Line(
            points={{66,-22},{56,-22},{56,-18}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(CSF_osmotic.q_in, choroid_plexus.q_out) annotation (Line(
            points={{-66,4},{-36,4}},
            color={127,127,0},
            thickness=1,
            smooth=Smooth.None));
        connect(choroid_plexus.q_in, flowMeasure.q_out) annotation (Line(
            points={{-16,4},{-2,4}},
            color={127,127,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pressureMeasure.actualPressure, choroid_plexus.hydraulicPressureOut)
          annotation (Line(
            points={{-74,70},{-42,70},{-42,20},{-34,20},{-34,12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureMeasure2.actualPressure, choroid_plexus.hydraulicPressureIn)
          annotation (Line(
            points={{46,-16},{28,-16},{28,20},{-18,20},{-18,12}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),      graphics={
              Text(
                extent={{-46,-64},{50,-50}},
                lineColor={215,215,215},
                textString="the same volume of CSF"),
              Line(
                points={{-50,-54},{-62,-14}},
                color={215,215,215},
                smooth=Smooth.None,
                arrow={Arrow.None,Arrow.Filled}),
              Line(
                points={{-50,-54},{-72,-30}},
                color={215,215,215},
                smooth=Smooth.None,
                arrow={Arrow.None,Arrow.Filled})}),
          experiment(StopTime=86400),
          Documentation(revisions=
                          "<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>Parameters are only manually estimated to reach steady state at 150ml CSF with CSF production and rebsorbtion 550ml/day and osmolarity 285 mosm/l.</p>
<p><br>[1] Dee Unglaub Silverthorn: Human Physiology</p>
<p>The cerebrospinal fluid (CSF) circulation: blood capilaries -&GT; choriod plexus of third and fourth ventricle -&GT; arachnoid villi -&GT; blood in venous sinus.</p>
<p><br><font style=\"color: #222222; \">[2] Hochwald, G. M., Wald, A., DiMattio, J., &AMP; Malhan, C. (1974). The effects of serum osmolarity on cerebrospinal fluid volume flow.&nbsp;<i>Life sciences</i>,&nbsp;<i>15</i>(7), 1309-1316.</font></p>
<p><br><font style=\"color: #2e2e2e; \">The effects of changes in serum osmolarity on cerebrospinal fluid (CSF) formation were studied in cats. CSF production rates were measured by ventriculocisternal perfusion both before and after intravenous infusion of glucose solutions.</font></p>
<p><font style=\"color: #2e2e2e; \">Infusion of glucose, hyperosmolar with respect to serum, increased serum osmolarity and caused a decrease in CSF formation rate; conversely, infusion of hypoosmolar solutions lowered serum osmolarity and increased CSF formation. CSF production and serum osmolarity were found to be linearly related. A 1&percnt; serum osmolarity change resulted in a 6.7&percnt; change in CSF formation. CSF formation increased by 130&percnt; with a serum osmolarity of 265 m0sm/1 and was undetectable with serum of 380 m0sm/1.</font></p>
<p><br><font style=\"color: #2e2e2e; \">[3] https://en.wikipedia.org/wiki/Cerebrospinal_fluid</font></p>
<p>The brain produces roughly 500 mL of cerebrospinal fluid per day. This fluid is constantly reabsorbed, so that only 100-160 mL is present at any one time.&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ependymal_cells\">Ependymal cells</a>&nbsp;of the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Choroid_plexus\">choroid plexus</a>&nbsp;produce more than two thirds of CSF. The&nbsp;<a href=\"https://en.wikipedia.org/wiki/Choroid_plexus\">choroid plexus</a>&nbsp;is a&nbsp;<a href=\"https://en.wikipedia.org/wiki/Venous_plexus\">venous plexus</a>&nbsp;contained within the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Ventricular_system\">four ventricles</a>&nbsp;of the brain, hollow structures inside the brain filled with CSF. The remainder of the CSF is produced by the surfaces of the ventricles and by the lining surrounding the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Subarachnoid_space\">subarachnoid space</a>.&nbsp;</p>
<p>Ependymal cells actively secrete sodium into the lateral ventricles. This creates&nbsp;<a href=\"https://en.wikipedia.org/wiki/Osmotic_pressure\">osmotic pressure</a>&nbsp;and draws water into the CSF space. Chloride, with a negative charge, maintains&nbsp;<a href=\"https://en.wikipedia.org/w/index.php?title=Electroneutrality&action=edit&redlink=1\">electroneutrality</a>&nbsp;and moves with the positively-charged sodium. As a result, CSF contains a higher concentration of sodium and chloride than blood plasma, but less potassium, calcium and glucose and protein.&nbsp;</p>
</html>"));
      end CerebrospinalFluid;
    end Examples;

    package Components
      extends Modelica.Icons.Package;
      model OsmoticCell "Solvent container"
        extends Icons.OsmoticCell;
        extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                           state_start=volume_start, storeUnit=
            "mOsm/l");

        Interfaces.OsmoticPort_a
                            q_in "Flux to/from osmotic compartment" annotation (Placement(
              transformation(extent={{-10,-10},{10,10}})));
        parameter Physiolibrary.Types.Volume volume_start = 0.001
          "Initial volume of compartment"
           annotation (Dialog(group="Initialization"));

        parameter Boolean useImpermeableSolutesInput = false
          "=true, if impermeable substance amount as an input"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.AmountOfSubstance ImpermeableSolutes=0
          "Amount of impermeable substance if useImpermeableSolutesInput=false"
          annotation (Dialog(enable=not useImpermeableSolutesInput));

        Physiolibrary.Types.RealIO.AmountOfSubstanceInput impermeableSolutes(start=ImpermeableSolutes)= is if useImpermeableSolutesInput
          "Amount of impermeable solutes in compartment"                                                                                    annotation (Placement(transformation(extent={{-100,40},
                  {-60,80}})));
        Physiolibrary.Types.RealIO.VolumeOutput volume
          "Actual volume of compartment"
          annotation (Placement(transformation(extent={{-20,-120},{20,-80}}, rotation=
                 -90)));
      protected
        Types.AmountOfSubstance is "Current amount of impermeable solutes";
      equation
        if not useImpermeableSolutesInput then
          is=ImpermeableSolutes;
        end if;

        q_in.o = is / volume;

        change = q_in.q;    //der(volume)=q_in.q
        state = volume;

        //  assert(volume>=-Modelica.Constants.eps,"Collapsed cells by osmotic pressure are not supported!");

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                                                     graphics={
                                     Text(
                extent={{-40,-138},{280,-100}},
                textString="%name",
                lineColor={0,0,255})}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end OsmoticCell;

      model Membrane "Solvent diffusion through semipermeable membrane"
       extends Interfaces.OnePort;
       extends Icons.Membrane; //Icons.Resistor;

       parameter Physiolibrary.Types.OsmoticPermeability cond
          "Membrane permeability for solvent";

        parameter Boolean useHydraulicPressureInputs = false
          "=true, if hydraulic pressure inputs is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Pressure HydraulicPressureIn=0
          "Hydraulic pressure inside if useHydraulicPressureInputs=false"
          annotation (Dialog(enable=not useHydraulicPressureInputs));
        parameter Types.Pressure HydraulicPressureOut=0
          "Hydraulic pressure outside if useHydraulicPressureInputs=false"
          annotation (Dialog(enable=not useHydraulicPressureInputs));

        Types.RealIO.PressureInput hydraulicPressureIn(start=HydraulicPressureIn)=pi if useHydraulicPressureInputs annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,80})));
        Types.RealIO.PressureInput hydraulicPressureOut(start=HydraulicPressureOut)=po if useHydraulicPressureInputs annotation (Placement(
              transformation(extent={{-20,-20},{20,20}},
              rotation=270,
              origin={80,80})));

        parameter Boolean useTemperatureInputs = false
          "=true, if temperature on both sides is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Temperature T=310.15
          "Temperature on both membrane sides if  useTemperatureInputs=false"
          annotation (Dialog(enable=not  useTemperatureInputs));

        Types.RealIO.TemperatureInput temperatureIn(start=T)=ti if useTemperatureInputs annotation (Placement(
              transformation(extent={{-20,-20},{20,20}},
              rotation=90,
              origin={-80,-80})));
        Types.RealIO.TemperatureInput temperatureOut(start=T)=to if useTemperatureInputs annotation (Placement(
              transformation(extent={{-20,-20},{20,20}},
              rotation=90,
              origin={80,-80})));

      protected
        Types.Pressure pi,po;
        Types.Temperature ti,to;
      equation
        if not useHydraulicPressureInputs then
          pi=HydraulicPressureIn;
          po=HydraulicPressureOut;
        end if;
        if not useTemperatureInputs then
          ti=T;
          to=T;
        end if;

        q_in.q = cond * ( (-po + q_out.o*(Modelica.Constants.R*to)) - (-pi + q_in.o*(Modelica.Constants.R*ti)));
        annotation (        Documentation(revisions="<html>
<p><i>2009-2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Membrane;

      model SolventFlux "Prescripted solvent flow"
        extends Interfaces.OnePort;
        extends Chemical.Interfaces.ConditionalSolutionFlow;

      equation
        q_in.q = q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Text(
                extent={{-100,-80},{100,-54}},
                textString="%name",
                lineColor={0,0,255}),
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-78,25},{82,0},{-78,-25},{-78,25}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SolventFlux;
    end Components;

    package Sensors
      extends Modelica.Icons.SensorsPackage;
      model FlowMeasure "Measurement of flux through semipermeable membrane"
        extends Interfaces.OnePort;
        extends Icons.FlowMeasure;

        Physiolibrary.Types.RealIO.VolumeFlowRateOutput actualFlow
          "Flux through membrane"
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-60})));
      equation
        q_out.o = q_in.o;

        actualFlow = q_in.q;

       annotation (
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end FlowMeasure;
    end Sensors;

    package Sources
      extends Modelica.Icons.SourcesPackage;
      model SolventInflux "Prescribed solvent inflow"
        extends Chemical.Interfaces.ConditionalSolutionFlow;

        Interfaces.OsmoticPort_b
                            q_out
                               annotation (Placement(
              transformation(extent={{50,-10},{70,10}})));

      equation
        q_out.q = - q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                              graphics={
              Rectangle(
                extent={{-60,-30},{60,30}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-48,20},{50,0},{-48,-21},{-48,20}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-92,-58},{80,-34}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SolventInflux;

      model SolventOutflux "Prescribed solvent outflow"
       extends Chemical.Interfaces.ConditionalSolutionFlow;
        Interfaces.OsmoticPort_a
                            q_in
                               annotation (extent=[-10, -110; 10, -90], Placement(
              transformation(extent={{-70,-10},{-50,10}})));
      equation
        q_in.q = q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-60,-32},{60,30}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-48,18},{50,-2},{-48,-26},{-48,18}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-78,-58},{72,-36}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SolventOutflux;

      model UnlimitedSolution "Prescribed osmolarity"
        import Physiolibrary.Types.*;

        parameter Boolean useOsmolarityInput = false
          "=true, if fixed osmolarity at port is from input instead of parameter"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

         parameter Physiolibrary.Types.Osmolarity Osm = 0
          "Fixed osmolarity at port if useOsmolarityInput=false"
          annotation (Dialog(enable=not useOsmolarityInput));

        parameter Boolean isIsolatedInSteadyState = true
          "=true, if there is no flow at port in steady state"
          annotation (Dialog(group="Simulation",tab="Equilibrium"));

        parameter SimulationType  Simulation=SimulationType.NormalInit
          "If in equilibrium, then zero-flow equation is added."
          annotation (Dialog(group="Simulation",tab="Equilibrium"));

        Interfaces.OsmoticPort_b    port annotation (Placement(transformation(extent={{90,-10},
                  {110,10}})));

      protected
        Physiolibrary.Types.Osmolarity o "Current osmolarity";
      public
        Types.RealIO.TemperatureInput osmolarity(start=Osmolarity)=o if
                                                                 useOsmolarityInput
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));

      initial equation
        if isIsolatedInSteadyState and (Simulation==SimulationType.InitSteadyState) then
          port.q = 0;
        end if;

      equation
        if not useOsmolarityInput then
          o=Osm;
        end if;

        port.o = o;

        if isIsolatedInSteadyState and (Simulation==SimulationType.SteadyState) then
            port.q = 0;
        end if;

         annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                              graphics={
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255}),
              Text(
                extent={{-150,-110},{150,-140}},
                lineColor={0,0,0},
                textString="T=%T"),
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillColor={127,127,0},
                fillPattern=FillPattern.Backward),
              Text(
                extent={{38,-34},{-100,-100}},
                lineColor={0,0,0},
                textString="Osm"),
              Line(
                points={{-52,0},{56,0}},
                color={191,0,0},
                thickness=0.5),
              Polygon(
                points={{50,-20},{50,20},{90,0},{50,-20}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid)}),
          Documentation(info="<HTML>
<p>
This model defines a fixed temperature T at its port in Kelvin,
i.e., it defines a fixed temperature as a boundary condition.
</p>
</HTML>
"));
      end UnlimitedSolution;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

       connector OsmoticPort
        "Flux through semipermeable membrane by osmotic pressure gradient"
        Physiolibrary.Types.Concentration o
          "Osmolarity is the molar concentration of the impermeable solutes";
        flow Physiolibrary.Types.VolumeFlowRate q
          "The flux of the permeable solvent (!not the impermeable solutes!)";
        annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
       end OsmoticPort;

      connector OsmoticPort_a "Influx"
        extends OsmoticPort;

      annotation (
          defaultComponentName="port_a",
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={127,127,0},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={127,127,0},
                fillColor={127,127,0},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
              graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={127,127,0},
                fillColor={127,127,0},
                fillPattern=FillPattern.Solid),
          Text(extent=  {{-160,110},{40,50}}, lineColor=  {127,127,0}, textString=  "%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end OsmoticPort_a;

      connector OsmoticPort_b "Outflux"
        extends OsmoticPort;

      annotation (
          defaultComponentName="port_b",
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={127,127,0},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={127,127,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
              graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={127,127,0},
               fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
          Text(extent=  {{-160,110},{40,50}}, lineColor=  {127,127,0}, textString=  "%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end OsmoticPort_b;

      partial model OnePort "Osmotic one port"

       OsmoticPort_a       q_in "Forward flux through membrane"
                              annotation (Placement(
              transformation(extent={{-110,-10},{-90,10}})));
        OsmoticPort_b       q_out "Backward flux through membrane"
                               annotation (Placement(
              transformation(extent={{90,-10},{110,10}})));
      equation
        q_in.q + q_out.q = 0;
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end OnePort;

      partial model ConditionalSolventFlow
        "Input of solvent volumetric flow vs. parametric solvent volumetric flow"

        parameter Boolean useSolventFlowInput = false
          "=true, if solvent flow input is used instead of parameter SolventFlow"
        annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.VolumeFlowRate SolventFlow=0
          "Volumetric flow of solvent if useSolventFlowInput=false"
          annotation (Dialog(enable=not useSolventFlowInput));

        Physiolibrary.Types.RealIO.VolumeFlowRateInput solventFlow(start=SolventFlow)=q if useSolventFlowInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

        Physiolibrary.Types.VolumeFlowRate q "Current solvent flow";
      equation
        if not useSolventFlowInput then
          q = SolventFlow;
        end if;

      end ConditionalSolventFlow;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",   info="<html>
<p>One of the basic phenomenon of biological systems is the osmotically-driven flow of water. This is always connected with semipermeable membranes. The different concentrations of impermeable solutes on both sides of the membrane causes the hydrostatic pressure at the concentrated side to rise. This pressure difference is called osmotic pressure. Osmotic pressure is linearly proportional to the concentration gradient of impermeable solutes. The osmolarity (osmotic concentration) is also one of the main indexes of human body balance, called homeostasis. Its value should not significantly deviate for a long period of time from a value of 285-295 mosm/l. </p>
<p>In Physiolibrary the osmotic connector OsmoticPort is composed of the osmotic concentration and the volumetric flux of permeable liquid. The two main blocks are called Membrane and OsmoticCell. Here, inside the membrane blocks, it is of course possible to also define hydraulic pressure and temperatures effects on both sides of membrane. </p>
</html>"));
  end Osmotic;

  package SteadyStates "Dynamic Simulation / Steady State"
    extends Modelica.Icons.Package;
    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;
      model SimpleReaction_in_Equilibrium
        extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

        SteadyStates.Components.MolarConservationLaw
          amountOfSubstanceConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{68,-44},{88,-24}})));
        Chemical.Components.Substance A(Simulation=SimulationType.SteadyState,
            solute_start=0.9)
          annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
        Chemical.Components.ChemicalReaction reaction(K=1)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Chemical.Components.Substance B(
          Simulation=SimulationType.SteadyState,
          isDependent=true,
          solute_start=0.1)
          annotation (Placement(transformation(extent={{42,-10},{62,10}})));

      equation
        connect(A.solute, amountOfSubstanceConservationLaw.fragment[1]) annotation (
            Line(
            points={{-48,-10},{-48,-39},{68,-39}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(B.solute, amountOfSubstanceConservationLaw.fragment[2]) annotation (
            Line(
            points={{52,-10},{52,-37},{68,-37}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(B.q_out,reaction. products[1]) annotation (Line(
            points={{52,0},{10,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(A.q_out,reaction. substrates[1]) annotation (Line(
            points={{-48,0},{-10,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
       experiment(StopTime=1));
      end SimpleReaction_in_Equilibrium;

      model SimpleReaction_NormalInit
        extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

        SteadyStates.Components.MolarConservationLaw
          amountOfSubstanceConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=Physiolibrary.Types.SimulationType.NormalInit)
          annotation (Placement(transformation(extent={{68,-44},{88,-24}})));
        Chemical.Components.Substance A(Simulation=Physiolibrary.Types.SimulationType.NormalInit,
            solute_start=0.9)
          annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
        Chemical.Components.ChemicalReaction reaction(K=1)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Chemical.Components.Substance B(
          isDependent=true,
          Simulation=Physiolibrary.Types.SimulationType.NormalInit,
          solute_start=0.1)
          annotation (Placement(transformation(extent={{42,-10},{62,10}})));

      equation
        connect(A.solute, amountOfSubstanceConservationLaw.fragment[1]) annotation (
            Line(
            points={{-48,-10},{-48,-39},{68,-39}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(B.solute, amountOfSubstanceConservationLaw.fragment[2]) annotation (
            Line(
            points={{52,-10},{52,-37},{68,-37}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(B.q_out,reaction. products[1]) annotation (Line(
            points={{52,0},{10,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(A.q_out,reaction. substrates[1]) annotation (Line(
            points={{-48,0},{-10,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
       experiment(StopTime=1e-008));
      end SimpleReaction_NormalInit;

      model SimpleReaction_InitSteadyState
        extends Modelica.Icons.Example;

        import Physiolibrary.Types.*;

        SteadyStates.Components.MolarConservationLaw
          amountOfSubstanceConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=Physiolibrary.Types.SimulationType.InitSteadyState)
          annotation (Placement(transformation(extent={{68,-44},{88,-24}})));
        Chemical.Components.Substance A(Simulation=Physiolibrary.Types.SimulationType.InitSteadyState,
            solute_start=0.9)
          annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
        Chemical.Components.ChemicalReaction reaction(K=1)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Chemical.Components.Substance B(
          isDependent=true,
          Simulation=Physiolibrary.Types.SimulationType.InitSteadyState,
          solute_start=0.1)
          annotation (Placement(transformation(extent={{42,-10},{62,10}})));

      equation
        connect(A.solute, amountOfSubstanceConservationLaw.fragment[1]) annotation (
            Line(
            points={{-48,-10},{-48,-39},{68,-39}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(B.solute, amountOfSubstanceConservationLaw.fragment[2]) annotation (
            Line(
            points={{52,-10},{52,-37},{68,-37}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(B.q_out,reaction. products[1]) annotation (Line(
            points={{52,0},{10,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(A.q_out,reaction. substrates[1]) annotation (Line(
            points={{-48,0},{-10,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
       experiment(StopTime=1e-008));
      end SimpleReaction_InitSteadyState;

      model SimpleReaction2_in_Equilibrium
      extends Modelica.Icons.Example;
        import Physiolibrary.Types.*;

        Chemical.Components.Substance A(Simulation=SimulationType.SteadyState,
            solute_start=0.9)
          annotation (Placement(transformation(extent={{-68,-8},{-48,12}})));
        Chemical.Components.ChemicalReaction reaction(K=1, nP=2)
          annotation (Placement(transformation(extent={{-34,-8},{-14,12}})));
        Chemical.Components.Substance B(
          Simulation=SimulationType.SteadyState,
          isDependent=true,
          solute_start=0.1)
          annotation (Placement(transformation(extent={{2,-10},{22,10}})));

        Chemical.Components.Substance C(
          Simulation=SimulationType.SteadyState,
          isDependent=true,
          solute_start=0.1)
          annotation (Placement(transformation(extent={{2,18},{22,38}})));

        Components.MolarConservationLaw totalB_ConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{34,-10},{54,10}})));
        Components.MolarConservationLaw totalC_ConservationLaw(
          n=2,
          Total(displayUnit="mol") = 1,
          Simulation=SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{34,18},{54,38}})));
      equation
        connect(A.q_out,reaction. substrates[1]) annotation (Line(
            points={{-58,2},{-34,2}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(reaction.products[1],B. q_out) annotation (Line(
            points={{-14,1.5},{-4,1.5},{-4,0},{12,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(reaction.products[2],C. q_out) annotation (Line(
            points={{-14,2.5},{-4,2.5},{-4,28},{12,28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(A.solute, totalB_ConservationLaw.fragment[1])           annotation (
            Line(
            points={{-58,-8},{-58,-16},{26,-16},{26,-5},{34,-5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(B.solute, totalB_ConservationLaw.fragment[2])           annotation (
            Line(
            points={{12,-10},{12,-14},{24,-14},{24,-3},{34,-3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(C.solute, totalC_ConservationLaw.fragment[1]) annotation (Line(
            points={{12,18},{12,14},{26,14},{26,23},{34,23}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(A.solute, totalC_ConservationLaw.fragment[2]) annotation (Line(
            points={{-58,-8},{-58,-16},{-70,-16},{-70,40},{26,40},{26,25},{34,25}},
            color={0,0,127},
            smooth=Smooth.None));

        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),   experiment(StopTime=1));
      end SimpleReaction2_in_Equilibrium;

      model O2_in_water
      extends Modelica.Icons.Example;
        import Physiolibrary.Types.*;

      public
        Chemical.Components.Substance oxygen_dissolved(
                                                      Simulation=SimulationType.SteadyState,
            solute_start=0.000001*7.875647668393782383419689119171e-5,
          isDependent=true)
          annotation (Placement(transformation(extent={{-12,-56},{8,-36}})));
        Modelica.Blocks.Sources.Clock oxygenPartialPressure(offset=1e-06)
          annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
        Modelica.Blocks.Sources.Sine temperature(
          amplitude=10,
          freqHz=1/60,
          offset=310.15)
          annotation (Placement(transformation(extent={{-94,-28},{-74,-8}})));
        Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
          prescribedTemperature
          annotation (Placement(transformation(extent={{-56,-28},{-36,-8}})));
        Chemical.Components.GasSolubility gasSolubility(useHeatPort=true, kH_T0(
              displayUnit="(mmol/l)/kPa at 25degC") = 0.026029047188736)
          annotation (Placement(transformation(extent={{-12,-28},{8,-8}})));
        Chemical.Sources.UnlimitedGasStorage unlimitedGasStorage(
            Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          usePartialPressureInput=true,
          useHeatPort=true,
          T=295.15)
          annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
      equation

        connect(temperature.y, prescribedTemperature.T) annotation (Line(
            points={{-73,-18},{-58,-18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(oxygen_dissolved.q_out, gasSolubility.q_in) annotation (Line(
            points={{-2,-46},{-2,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(prescribedTemperature.port, gasSolubility.heatPort) annotation (
            Line(
            points={{-36,-18},{-2,-18}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(oxygenPartialPressure.y, unlimitedGasStorage.partialPressure)
          annotation (Line(
            points={{-59,70},{-40,70}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(unlimitedGasStorage.q_out, gasSolubility.q_out) annotation (Line(
            points={{-20,70},{-2,70},{-2,-8}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(prescribedTemperature.port, unlimitedGasStorage.heatPort)
          annotation (Line(
            points={{-36,-18},{-30,-18},{-30,70}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (        experiment(StopTime=100), Documentation(info=
                     "<html>
<p>Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air. Oxygen solubility</p>
</html>",   revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end O2_in_water;

      model Allosteric_Hemoglobin_MWC
      extends Modelica.Icons.Example;
        import Physiolibrary.Chemical;
        import Physiolibrary.Types.*;

      //extends Physiolibrary.SteadyStates.Interfaces.SteadyStateSystem(
      //                                         Simulation=SteadyStates.SimulationType.SteadyState);
      //=States.SimulationType.NoInit); for dynamic simulation
      protected
        parameter Physiolibrary.Types.GasSolubility alpha =  0.0105 * 1e-3
          "oxygen solubility in plasma"; // by Siggaard Andersen: 0.0105 (mmol/l)/kPa
        parameter Physiolibrary.Types.Fraction L = 7.0529*10^6
          "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
        parameter Physiolibrary.Types.Fraction c = 0.00431555
          "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
        parameter Physiolibrary.Types.Concentration KR = 0.000671946
          "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                  //10.500001495896 7.8756465463794e-05

        parameter Physiolibrary.Types.Concentration KT=KR/c
          "oxygen dissociation on tensed(T) hemoglobin subunit";
      //  Physiolibrary.Types.Fraction sO2 "hemoglobin oxygen saturation";

      //  parameter Physiolibrary.Types.AmountOfSubstance totalAmountOfHemoglobin=1;
      //  Physiolibrary.Types.AmountOfSubstance totalAmountOfRforms;
      //  Physiolibrary.Types.AmountOfSubstance totalAmountOfTforms;

      public
        Chemical.Components.Substance T0(
          stateName="T0",
          Simulation=SimulationType.SteadyState,
          solute_start=1)
          annotation (Placement(transformation(extent={{32,78},{52,98}})));

        Chemical.Components.Substance T1(
          stateName="T1",
          Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{34,36},{54,56}})));

        Chemical.Components.Substance R1(
          stateName="R1",
          Simulation=SimulationType.SteadyState,
          solute_start=0,
          isDependent=true)
          annotation (Placement(transformation(extent={{-20,36},{0,56}})));

        Chemical.Components.Substance T2(
          stateName="T2",
          Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{34,-10},{54,10}})));

        Chemical.Components.Substance R2(
          stateName="R2",
          Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

        Chemical.Components.Substance T3(
          stateName="T3",
          Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{34,-54},{54,-34}})));

        Chemical.Components.Substance R3(
          stateName="R3",
          Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-20,-54},{0,-34}})));

        Chemical.Components.Substance T4(
          stateName="T4",
          Simulation=SimulationType.SteadyState,
          solute_start=0,
          isDependent=true)
          annotation (Placement(transformation(extent={{34,-92},{54,-72}})));

        Chemical.Components.Substance R4(
          stateName="R4",
          Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-20,-92},{0,-72}})));

        Chemical.Components.Substance R0(
          stateName="R0",
          Simulation=SimulationType.SteadyState,
          solute_start=0)
          annotation (Placement(transformation(extent={{-20,78},{0,98}})));

        Chemical.Components.ChemicalReaction quaternaryForm(K=L)
          annotation (Placement(transformation(extent={{4,78},{24,98}})));
        Chemical.Components.ChemicalReaction oxyR1(nP=2, K=KR/4)  annotation (Placement(
              transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-10,64})));
        Chemical.Components.ChemicalReaction oxyT1(nP=2, K=KT/4)  annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={44,64})));
        Chemical.Components.ChemicalReaction oxyR2(nP=2, K=KR/(3/2))
                                                                  annotation (Placement(
              transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-10,22})));
        Chemical.Components.ChemicalReaction oxyR3(nP=2, K=KR/(2/3))
                                                                  annotation (Placement(
              transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-10,-24})));
        Chemical.Components.ChemicalReaction oxyR4(nP=2, K=KR*4)  annotation (Placement(
              transformation(
              extent={{-10,10},{10,-10}},
              rotation=90,
              origin={-10,-66})));
        Chemical.Components.ChemicalReaction oxyT2(nP=2, K=KT/(3/2))
                                                                  annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={44,22})));
        Chemical.Components.ChemicalReaction oxyT3(nP=2, K=KT/(2/3))
                                                                  annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={44,-24})));
        Chemical.Components.ChemicalReaction oxyT4(nP=2, K=KT*4)  annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={44,-66})));
        Chemical.Components.ChemicalReaction quaternaryForm1(K=c*L)
          annotation (Placement(transformation(extent={{8,36},{28,56}})));
        Chemical.Components.ChemicalReaction quaternaryForm2(K=(c^2)*L)
          annotation (Placement(transformation(extent={{8,-10},{28,10}})));
        Chemical.Components.ChemicalReaction quaternaryForm3(K=(c^3)*L)
          annotation (Placement(transformation(extent={{8,-54},{28,-34}})));
        Chemical.Components.ChemicalReaction quaternaryForm4(K=(c^4)*L)
          annotation (Placement(transformation(extent={{10,-92},{30,-72}})));

        Chemical.Components.Substance oxygen_unbound(solute_start=0.000001*
              7.875647668393782383419689119171e-5, Simulation=SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{-56,-36},{-36,-16}})));
        Modelica.Blocks.Sources.Clock clock(offset=60)
          annotation (Placement(transformation(extent={{-94,52},{-74,72}})));
        SteadyStates.Components.MolarConservationLaw hemoglobinConservationLaw(
          n=10, Total(displayUnit="mol") = 1,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState)
          annotation (Placement(transformation(extent={{72,-2},{92,18}})));

        Chemical.Sources.UnlimitedGasStorage O2_in_air(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          T=295.15,
          usePartialPressureInput=true)
                      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-66,32})));
        Chemical.Components.GasSolubility gasSolubility(
                                            useHeatPort=false, kH_T0=
              0.026029047188736)
          annotation (Placement(transformation(extent={{-76,-6},{-56,14}})));
        Modelica.Blocks.Math.Sum oxygen_bound(k={1,1,2,2,3,3,4,4}, nin=8)
          annotation (Placement(transformation(extent={{72,-56},{82,-46}})));
        Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation"
          annotation (Placement(transformation(extent={{86,-60},{96,-50}})));
        Modelica.Blocks.Math.Sum tHb(nin=10, k=4*ones(10))
          annotation (Placement(transformation(extent={{72,-70},{82,-60}})));
      equation
       // sO2 = (R1.solute + 2*R2.solute + 3*R3.solute + 4*R4.solute + T1.solute + 2*T2.solute + 3*T3.solute + 4*T4.solute)/(4*hemoglobinConservationLaw.Total);
       // totalAmountOfRforms = R0.solute + R1.solute + R2.solute + R3.solute + R4.solute;
       //  totalAmountOfTforms = T0.solute + T1.solute + T2.solute + T3.solute + T4.solute;

       //  totalAmountOfHemoglobin*normalizedState[1] = totalAmountOfRforms + totalAmountOfTforms;

        connect(quaternaryForm.products[1],T0. q_out) annotation (Line(
            points={{24,88},{42,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR1.products[2], oxygen_unbound.q_out)
                                            annotation (Line(
            points={{-9.5,74},{-46,74},{-46,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR2.products[2], oxygen_unbound.q_out)
                                            annotation (Line(
            points={{-9.5,32},{-46,32},{-46,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR3.products[2], oxygen_unbound.q_out)
                                            annotation (Line(
            points={{-9.5,-14},{-46,-14},{-46,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR4.products[2], oxygen_unbound.q_out)
                                            annotation (Line(
            points={{-9.5,-56},{-46,-56},{-46,-26}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR1.substrates[1],R1. q_out) annotation (Line(
            points={{-10,54},{-10,46}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R1.q_out,oxyR2. products[1]) annotation (Line(
            points={{-10,46},{-10,32},{-10.5,32}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR2.substrates[1],R2. q_out) annotation (Line(
            points={{-10,12},{-10,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR3.substrates[1],R3. q_out) annotation (Line(
            points={{-10,-34},{-10,-44}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR3.products[1],R2. q_out) annotation (Line(
            points={{-10.5,-14},{-10.5,-7},{-10,-7},{-10,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R3.q_out,oxyR4. products[1]) annotation (Line(
            points={{-10,-44},{-10,-56},{-10.5,-56}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyR4.substrates[1],R4. q_out) annotation (Line(
            points={{-10,-76},{-10,-82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyT1.products[1],T0. q_out) annotation (Line(
            points={{44.5,74},{44.5,88},{42,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyT1.substrates[1],T1. q_out) annotation (Line(
            points={{44,54},{44,46}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT1.products[2])
                                            annotation (Line(
            points={{-46,-26},{-46,74},{43.5,74}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT2.products[2])
                                            annotation (Line(
            points={{-46,-26},{-46,32},{43.5,32}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT3.products[2])
                                            annotation (Line(
            points={{-46,-26},{-46,-14},{43.5,-14}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, oxyT4.products[2])
                                            annotation (Line(
            points={{-46,-26},{-46,-56},{43.5,-56}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T1.q_out,oxyT2. products[1]) annotation (Line(
            points={{44,46},{44,32},{44.5,32}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyT2.substrates[1],T2. q_out) annotation (Line(
            points={{44,12},{44,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T2.q_out,oxyT3. products[1]) annotation (Line(
            points={{44,0},{44,-14},{44.5,-14}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyT3.substrates[1],T3. q_out) annotation (Line(
            points={{44,-34},{44,-44}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T3.q_out,oxyT4. products[1]) annotation (Line(
            points={{44,-44},{44,-56},{44.5,-56}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxyT4.substrates[1],T4. q_out) annotation (Line(
            points={{44,-76},{44,-82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R0.q_out,quaternaryForm. substrates[1]) annotation (Line(
            points={{-10,88},{4,88}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R0.q_out,oxyR1. products[1]) annotation (Line(
            points={{-10,88},{-10,74},{-10.5,74}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R1.q_out,quaternaryForm1. substrates[1]) annotation (Line(
            points={{-10,46},{8,46}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm1.products[1],T1. q_out) annotation (Line(
            points={{28,46},{44,46}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R2.q_out,quaternaryForm2. substrates[1]) annotation (Line(
            points={{-10,0},{8,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm2.products[1],T2. q_out) annotation (Line(
            points={{28,0},{44,0}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R3.q_out,quaternaryForm3. substrates[1]) annotation (Line(
            points={{-10,-44},{8,-44}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm3.products[1],T3. q_out) annotation (Line(
            points={{28,-44},{44,-44}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R4.q_out,quaternaryForm4. substrates[1]) annotation (Line(
            points={{-10,-82},{10,-82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm4.products[1],T4. q_out) annotation (Line(
            points={{30,-82},{44,-82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(R4.solute, hemoglobinConservationLaw.fragment[1])        annotation (
            Line(
            points={{-10,-92},{-10,-98},{64,-98},{64,2.2},{72,2.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T4.solute, hemoglobinConservationLaw.fragment[2])        annotation (
            Line(
            points={{44,-92},{44,-98},{64,-98},{64,2.6},{72,2.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R3.solute, hemoglobinConservationLaw.fragment[3])        annotation (
            Line(
            points={{-10,-54},{64,-54},{64,3},{72,3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T3.solute, hemoglobinConservationLaw.fragment[4])        annotation (
            Line(
            points={{44,-54},{64,-54},{64,3.4},{72,3.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R2.solute, hemoglobinConservationLaw.fragment[5])        annotation (
            Line(
            points={{-10,-10},{64,-10},{64,3.8},{72,3.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T2.solute, hemoglobinConservationLaw.fragment[6])        annotation (
            Line(
            points={{44,-10},{64,-10},{64,4.2},{72,4.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R1.solute, hemoglobinConservationLaw.fragment[7])        annotation (
            Line(
            points={{-10,36},{64,36},{64,4.6},{72,4.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T1.solute, hemoglobinConservationLaw.fragment[8])        annotation (
            Line(
            points={{44,36},{64,36},{64,5},{72,5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R0.solute, hemoglobinConservationLaw.fragment[9])        annotation (
            Line(
            points={{-10,78},{64,78},{64,5.4},{72,5.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T0.solute, hemoglobinConservationLaw.fragment[10])        annotation (
           Line(
            points={{42,78},{64,78},{64,5.8},{72,5.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out, gasSolubility.q_in) annotation (Line(
            points={{-46,-26},{-66,-26},{-66,-4}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(O2_in_air.q_out, gasSolubility.q_out) annotation (Line(
            points={{-66,22},{-66,14}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(clock.y, O2_in_air.partialPressure) annotation (Line(
            points={{-73,62},{-66,62},{-66,42}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R1.solute, oxygen_bound.u[1]) annotation (Line(
            points={{-10,36},{64,36},{64,-51.875},{71,-51.875}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T1.solute, oxygen_bound.u[2]) annotation (Line(
            points={{44,36},{64,36},{64,-51.625},{71,-51.625}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R2.solute, oxygen_bound.u[3]) annotation (Line(
            points={{-10,-10},{64,-10},{64,-51.375},{71,-51.375}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T2.solute, oxygen_bound.u[4]) annotation (Line(
            points={{44,-10},{64,-10},{64,-51.125},{71,-51.125}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R3.solute, oxygen_bound.u[5]) annotation (Line(
            points={{-10,-54},{64,-54},{64,-50.875},{71,-50.875}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T3.solute, oxygen_bound.u[6]) annotation (Line(
            points={{44,-54},{64,-54},{64,-50.625},{71,-50.625}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R4.solute, oxygen_bound.u[7]) annotation (Line(
            points={{-10,-92},{-10,-98},{64,-98},{64,-50.375},{71,-50.375}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T4.solute, oxygen_bound.u[8]) annotation (Line(
            points={{44,-92},{44,-98},{64,-98},{64,-50.125},{71,-50.125}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(oxygen_bound.y, sO2_.u1) annotation (Line(
            points={{82.5,-51},{84,-51},{84,-52},{85,-52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sO2_.u2, tHb.y) annotation (Line(
            points={{85,-58},{84,-58},{84,-65},{82.5,-65}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R0.solute, tHb.u[1]) annotation (Line(
            points={{-10,78},{64,78},{64,-65.9},{71,-65.9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T0.solute, tHb.u[2]) annotation (Line(
            points={{42,78},{64,78},{64,-65.7},{71,-65.7}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R1.solute, tHb.u[3]) annotation (Line(
            points={{-10,36},{64,36},{64,-65.5},{71,-65.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T1.solute, tHb.u[4]) annotation (Line(
            points={{44,36},{64,36},{64,-65.3},{71,-65.3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R2.solute, tHb.u[5]) annotation (Line(
            points={{-10,-10},{64,-10},{64,-65.1},{71,-65.1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T2.solute, tHb.u[6]) annotation (Line(
            points={{44,-10},{64,-10},{64,-64.9},{71,-64.9}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R3.solute, tHb.u[7]) annotation (Line(
            points={{-10,-54},{64,-54},{64,-64.7},{71,-64.7}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T3.solute, tHb.u[8]) annotation (Line(
            points={{44,-54},{64,-54},{64,-64.5},{71,-64.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(R4.solute, tHb.u[9]) annotation (Line(
            points={{-10,-92},{-10,-98},{64,-98},{64,-64.3},{71,-64.3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(T4.solute, tHb.u[10]) annotation (Line(
            points={{44,-92},{44,-98},{64,-98},{64,-64.1},{71,-64.1}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (        experiment(StopTime=10000), Documentation(info=
                     "<html>
<p>To understand the model is necessary to study the principles of MWC allosteric transitions first published by </p>
<p>Monod,Wyman,Changeux (1965). &QUOT;On the nature of allosteric transitions: a plausible model.&QUOT; Journal of molecular biology 12(1): 88-118.</p>
<p><br/>In short it is about binding oxygen to hemoglobin.</p>
<p>Oxgen are driven by its partial pressure using clock source - from very little pressure to pressure of 10kPa.</p>
<p>(Partial pressure of oxygen in air is the air pressure multiplied by the fraction of the oxygen in air.)</p>
<p>Hemoglobin was observed (by Perutz) in two structuraly different forms R and T.</p>
<p>These forms are represented by blocks T0..T4 and R0..R4, where the suffexed index means the number of oxygen bounded to the form.</p>
<p><br/>In equilibrated model can be four chemical reactions removed and the results will be the same, but dynamics will change a lot. ;)</p>
<p>If you remove the quaternaryForm1,quaternaryForm2,quaternaryForm3,quaternaryForm4 then the model in equilibrium will be exactly the same as in MWC article.</p>
<p><br/>Parameters was fitted to data of Severinghaus article from 1979. (For example at pO2=26mmHg is oxygen saturation sO2 = 48.27 &percnt;).</p>
</html>",   revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Allosteric_Hemoglobin_MWC;

      model Allosteric_Hemoglobin2_MWC
        "Allosteric hemoglobin model implemented by Speciation blocks"
        import Physiolibrary.Types.*;
       extends Modelica.Icons.Example;

        parameter Physiolibrary.Types.GasSolubility alpha =  0.0105 * 1e-3
          "oxygen solubility in plasma"; // by Siggaard Andersen: 0.0105 (mmol/l)/kPa
        parameter Physiolibrary.Types.Fraction L = 7.0529*10^6
          "=[T0]/[R0] .. dissociation constant of relaxed <-> tensed change of deoxyhemoglobin tetramer";
        parameter Physiolibrary.Types.Fraction c = 0.00431555
          "=KR/KT .. ration between oxygen affinities of relaxed vs. tensed subunit";
        parameter Physiolibrary.Types.Concentration KR = 0.000671946
          "oxygen dissociation on relaxed(R) hemoglobin subunit";   //*7.875647668393782383419689119171e-5
                                                                  //10.500001495896 7.8756465463794e-05

        parameter Physiolibrary.Types.Concentration KT=KR/c
          "oxygen dissociation on tensed(T) hemoglobin subunit";

        parameter Physiolibrary.Types.AmountOfSubstance totalAmountOfHemoglobin=0.001;

        Physiolibrary.Chemical.Components.ChemicalReaction
                                                  quaternaryForm(K=L)
          annotation (Placement(transformation(extent={{-2,-56},{18,-36}})));
        Physiolibrary.Chemical.Components.Speciation
                           R0_in_R(numberOfSubunit={4})
          annotation (Placement(transformation(extent={{-38,-48},{-58,-28}})));
        Physiolibrary.Chemical.Components.Speciation
                           T0_in_T(numberOfSubunit={4})
          annotation (Placement(transformation(extent={{78,-48},{58,-28}})));
        Physiolibrary.Chemical.Components.Substance
                            OxyRHm(solute_start=0, Simulation=SimulationType.SteadyState,
          isDependent=true)
          "Oxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-96,6},{-76,26}})));
        Physiolibrary.Chemical.Components.ChemicalReaction
                         oxygenation_R(K=KR, nP=2)
          annotation (Placement(transformation(extent={{-68,6},{-48,26}})));
        Physiolibrary.Chemical.Components.Substance
                            DeoxyRHm(Simulation=SimulationType.SteadyState,
            solute_start=1e-08)
          "Deoxygenated subunit in R structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{-38,6},{-18,26}})));
        Physiolibrary.Chemical.Components.Substance
                            OxyTHm(solute_start=0, Simulation=SimulationType.SteadyState,
          isDependent=true)
          "Oxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{26,6},{46,26}})));
        Physiolibrary.Chemical.Components.ChemicalReaction
                         oxygenation_T(K=KT, nP=2)
          annotation (Placement(transformation(extent={{52,6},{72,26}})));
        Physiolibrary.Chemical.Components.Substance
                            DeoxyTHm(solute_start=totalAmountOfHemoglobin - 0.00001,
            Simulation=SimulationType.SteadyState)
          "Deoxygenated subunit in T structure of hemoglobin tetramer"
          annotation (Placement(transformation(extent={{80,6},{100,26}})));

        Physiolibrary.Chemical.Components.Substance
                            oxygen_unbound(Simulation=SimulationType.SteadyState, solute_start=0.000001
              *7.875647668393782383419689119171e-5)
          annotation (Placement(transformation(extent={{-2,40},{18,60}})));
        Modelica.Blocks.Sources.Clock clock(offset=1e-06)
          annotation (Placement(transformation(extent={{-96,74},{-76,94}})));
        Modelica.Blocks.Math.Add add annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={-64,-10})));
        Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=270,
              origin={52,-12})));
        Physiolibrary.SteadyStates.Components.MolarConservationLaw
          hemoglobinConservationLaw(                              n=2,
          Simulation=SimulationType.SteadyState,
          Total(displayUnit="mol") = totalAmountOfHemoglobin)
          annotation (Placement(transformation(extent={{74,-72},{94,-52}})));
        Chemical.Sources.UnlimitedGasStorage O2_in_air(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          usePartialPressureInput=true,
          T=295.15)   annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              origin={-58,84})));
        Chemical.Components.GasSolubility gasSolubility(
                                            useHeatPort=false, kH_T0=
              0.026029047188736)
          annotation (Placement(transformation(extent={{-2,62},{18,82}})));
        Modelica.Blocks.Math.Sum oxygen_bound(nin=2)
          annotation (Placement(transformation(extent={{56,-90},{66,-80}})));
        Modelica.Blocks.Math.Division sO2_ "hemoglobin oxygen saturation"
          annotation (Placement(transformation(extent={{88,-94},{98,-84}})));
        Modelica.Blocks.Math.Sum tHb(nin=2)
          annotation (Placement(transformation(extent={{72,-98},{82,-88}})));
      equation

        connect(R0_in_R.species, quaternaryForm.substrates[1])
                                                         annotation (Line(
            points={{-58,-46},{-2,-46}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(quaternaryForm.products[1], T0_in_T.species)
                                                       annotation (Line(
            points={{18,-46},{58,-46}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(OxyRHm.q_out, oxygenation_R.substrates[1])
                                                 annotation (Line(
            points={{-86,16},{-68,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R.products[1], DeoxyRHm.q_out)
                                               annotation (Line(
            points={{-48,15.5},{-40,15.5},{-40,16},{-28,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(OxyTHm.q_out, oxygenation_T.substrates[1])
                                                 annotation (Line(
            points={{36,16},{52,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T.products[1], DeoxyTHm.q_out)
                                               annotation (Line(
            points={{72,15.5},{82,15.5},{82,16},{90,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(DeoxyRHm.q_out, R0_in_R.subunitSpecies[1])
                                                     annotation (Line(
            points={{-28,16},{-48,16},{-48,-28}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(T0_in_T.subunitSpecies[1], DeoxyTHm.q_out)
                                                     annotation (Line(
            points={{68,-28},{84,-28},{84,16},{90,16}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_R.products[2], oxygen_unbound.q_out) annotation (Line(
            points={{-48,16.5},{-42,16.5},{-42,50},{8,50}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(oxygenation_T.products[2], oxygen_unbound.q_out) annotation (Line(
            points={{72,16.5},{78,16.5},{78,50},{8,50}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(add.y, R0_in_R.totalSubunitAmount[1])
                                                annotation (Line(
            points={{-64,-14.4},{-64,-38},{-56,-38}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(add1.y, T0_in_T.totalSubunitAmount[1])
                                                 annotation (Line(
            points={{52,-16.4},{52,-38},{60,-38}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyTHm.solute, add1.u2) annotation (Line(
            points={{36,6},{36,0},{49.6,0},{49.6,-7.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add1.u1, DeoxyTHm.solute) annotation (Line(
            points={{54.4,-7.2},{54.4,0},{90,0},{90,6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(DeoxyRHm.solute, add.u1) annotation (Line(
            points={{-28,6},{-28,-2},{-61.6,-2},{-61.6,-5.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyRHm.solute, add.u2) annotation (Line(
            points={{-86,6},{-86,-2},{-66.4,-2},{-66.4,-5.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.y, hemoglobinConservationLaw.fragment[1]) annotation (Line(
            points={{-64,-14.4},{-64,-18},{34,-18},{34,-67},{74,-67}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add1.y, hemoglobinConservationLaw.fragment[2]) annotation (Line(
            points={{52,-16.4},{52,-20},{38,-20},{38,-65},{74,-65}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(oxygen_unbound.q_out,gasSolubility. q_in) annotation (Line(
            points={{8,50},{8,64}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(O2_in_air.q_out,gasSolubility. q_out) annotation (Line(
            points={{-48,84},{8,84},{8,82}},
            color={107,45,134},
            thickness=1,
            smooth=Smooth.None));
        connect(clock.y, O2_in_air.partialPressure) annotation (Line(
            points={{-75,84},{-68,84}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(oxygen_bound.y,sO2_. u1) annotation (Line(
            points={{66.5,-85},{84,-85},{84,-86},{87,-86}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sO2_.u2,tHb. y) annotation (Line(
            points={{87,-92},{84,-92},{84,-93},{82.5,-93}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyTHm.solute, oxygen_bound.u[2]) annotation (Line(
            points={{36,6},{36,-84.5},{55,-84.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.y, tHb.u[1]) annotation (Line(
            points={{-64,-14.4},{-64,-18},{34,-18},{34,-93.5},{71,-93.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(OxyRHm.solute, oxygen_bound.u[1]) annotation (Line(
            points={{-86,6},{-86,-85.5},{55,-85.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add1.y, tHb.u[2]) annotation (Line(
            points={{52,-16.4},{52,-20},{38,-20},{38,-92.5},{71,-92.5}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (        experiment(StopTime=10000), Documentation(revisions
              =           "<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Allosteric_Hemoglobin2_MWC;

      model CardiovascularSystem_GCG_SteadyState
        "Cardiovascular part of Guyton-Coleman-Granger's model from 1972"
         //extends Modelica.Icons.Example;
         extends Hydraulic.Examples.CardiovascularSystem_GCG(
          pulmonaryArteries(Simulation=Physiolibrary.Types.SimulationType.SteadyState),
          pulmonaryVeinsAndLeftAtrium(Simulation=Physiolibrary.Types.SimulationType.SteadyState),
          rightAtrium(Simulation=Physiolibrary.Types.SimulationType.SteadyState),
          arteries(Simulation=Physiolibrary.Types.SimulationType.SteadyState),
          veins(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
              isDependent=true));

         import Physiolibrary.Types.*;

         Components.MassConservationLaw bloodVolume(
          n=5,
          Simulation=Types.SimulationType.SteadyState,
          Total=0.005)
          annotation (Placement(transformation(extent={{68,-14},{88,6}})));
      equation
         connect(pulmonaryArteries.volume, bloodVolume.fragment[4]) annotation (
            Line(
            points={{-52,74},{-52,68},{54,68},{54,-7.2},{68,-7.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pulmonaryVeinsAndLeftAtrium.volume, bloodVolume.fragment[5]) annotation (Line(
            points={{14,74},{14,70},{56,70},{56,-6.4},{68,-6.4}},
            color={0,0,127},
            smooth=Smooth.None));
         connect(rightAtrium.volume, bloodVolume.fragment[1]) annotation (Line(
            points={{-72,8},{-72,-72},{56,-72},{56,-9.6},{68,-9.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(veins.volume, bloodVolume.fragment[2]) annotation (Line(
            points={{-54,-46},{-54,-70},{54,-70},{54,-8.8},{68,-8.8}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(arteries.volume, bloodVolume.fragment[3]) annotation (Line(
            points={{24,-46},{24,-68},{52,-68},{52,-8},{68,-8}},
            color={0,0,127},
            smooth=Smooth.None));
         annotation (     experiment(StopTime=1),
       Documentation(info="<html>
<p>Cardiovascular subsystem in famous Guyton-Coleman-Granger model from 1972. </p>
<p><br/>Model, all parameters and all initial values are from article: </p>
<p>A.C. Guyton, T.G. Coleman, H.J. Granger (1972). &QUOT;Circulation: overall regulation.&QUOT; Annual review of physiology 34(1): 13-44.</p>
</html>",   revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end CardiovascularSystem_GCG_SteadyState;

      model ThermalBody_QHP_STeadyState
        extends Thermal.Examples.ThermalBody_QHP(
          skin(Simulation=Physiolibrary.Types.SimulationType.SteadyState),
          skeletalMuscle(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
              isDependent=true),
          core(Simulation=Physiolibrary.Types.SimulationType.SteadyState),
          GILumen(Simulation=Physiolibrary.Types.SimulationType.SteadyState));

        Components.EnergyConservationLaw energyConservationLaw(
          n=4,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          useTotalInput=false,
          Total=-8373.6)
          annotation (Placement(transformation(extent={{70,-90},{90,-70}})));
      equation
        connect(core.relativeHeat, energyConservationLaw.fragment[1])
                                                                annotation (Line(
            points={{-2,-4},{-2,-85.5},{70,-85.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(skin.relativeHeat, energyConservationLaw.fragment[2])
                                                                annotation (Line(
            points={{-58,4},{-58,-84.5},{70,-84.5}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(skeletalMuscle.relativeHeat, energyConservationLaw.fragment[3])
                                                                          annotation (
           Line(
            points={{46,42},{46,-12},{94,-12},{94,-64},{58,-64},{58,-83.5},{70,-83.5}},
            color={0,0,127},
            smooth=Smooth.None));

        connect(GILumen.relativeHeat, energyConservationLaw.fragment[4])
                                                                   annotation (Line(
            points={{50,-52},{52,-52},{52,-82.5},{70,-82.5}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (experiment(StopTime=1));
      end ThermalBody_QHP_STeadyState;

      model Cells_SteadyState
       extends Osmotic.Examples.Cell(
          cells(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
              isDependent=true),
          interstitium(Simulation=Physiolibrary.Types.SimulationType.SteadyState),
          interstitium1(Simulation=Physiolibrary.Types.SimulationType.SteadyState),
          cells1(Simulation=Physiolibrary.Types.SimulationType.SteadyState,
              isDependent=true));
        Components.MassConservationLaw waterConservationLaw(
          n=2,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          Total(displayUnit="l") = 0.002)
          annotation (Placement(transformation(extent={{72,14},{92,34}})));
        Components.MassConservationLaw waterConservationLaw1(
          n=2,
          Simulation=Physiolibrary.Types.SimulationType.SteadyState,
          Total(displayUnit="l") = 0.002)
          annotation (Placement(transformation(extent={{70,-92},{90,-72}})));
      equation

        connect(cells.volume, waterConservationLaw.fragment[1])
                                                           annotation (Line(
            points={{-34,36},{-34,19},{72,19}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(interstitium.volume, waterConservationLaw.fragment[2])
                                                                  annotation (Line(
            points={{44,36},{44,21},{72,21}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(cells1.volume, waterConservationLaw1.fragment[1])
                                                             annotation (Line(
            points={{-34,-64},{-34,-87},{70,-87}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(interstitium1.volume, waterConservationLaw1.fragment[2])
                                                                    annotation (Line(
            points={{44,-64},{44,-85},{70,-85}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (experiment(StopTime=1));
      end Cells_SteadyState;
    end Examples;

    package Components
      extends Modelica.Icons.Package;

      model EnergyConservationLaw "System Energy conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=Types.SimulationType.SteadyState);
        extends Physiolibrary.Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Physiolibrary.Types.RealIO.EnergyInput fragment[n]
          "Mass/Energy fragment"
          annotation (Placement(transformation(extent={{-120,-60},{-80,-20}}),
              iconTransformation(extent={{-120,-60},{-80,-20}})));

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.Energy Total = 1
          "Total mass/energy if useTotalAsInput=false"
          annotation (Dialog(enable=not useTotalInput));

        Types.RealIO.EnergyInput total(start=Total) = t if useTotalInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));

        Physiolibrary.Types.Energy t "Current Mass/Energy";

      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(fragment);

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                extent={{-160,-110},{160,-140}},
                lineColor={0,0,255},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Text(
                extent={{-100,50},{100,24}},
                lineColor={0,0,0},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid,
                textString="Total(%Total)")}),
          Documentation(info="<html>
</html>"));
      end EnergyConservationLaw;

      model MassConservationLaw
        "System Mass (incompresible volume) conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=Types.SimulationType.SteadyState);
        extends Physiolibrary.Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Physiolibrary.Types.RealIO.VolumeInput fragment[n]
          "Mass/Energy fragment"
          annotation (Placement(transformation(extent={{-120,-60},{-80,-20}}),
              iconTransformation(extent={{-120,-60},{-80,-20}})));

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.Volume Total = 1
          "Total mass/energy if useTotalAsInput=false"
          annotation (Dialog(enable=not useTotalInput));

        Types.RealIO.VolumeInput total(start=Total) = t if useTotalInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));

        Physiolibrary.Types.Volume t "Current Mass/Energy";
      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(fragment);

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                extent={{-160,-110},{160,-140}},
                lineColor={0,0,255},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Text(
                extent={{-100,50},{100,24}},
                lineColor={0,0,0},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid,
                textString="Total(%Total)")}),
          Documentation(info="<html>
</html>"));
      end MassConservationLaw;

      model MolarConservationLaw
        "System Amount of substance (=number of molecules) conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=Types.SimulationType.SteadyState);
        extends Physiolibrary.Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Physiolibrary.Types.RealIO.AmountOfSubstanceInput fragment[n]
          "Mass/Energy fragment"
          annotation (Placement(transformation(extent={{-120,-60},{-80,-20}}),
              iconTransformation(extent={{-120,-60},{-80,-20}})));

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.AmountOfSubstance Total = 1
          "Total mass/energy if useTotalAsInput=false"
          annotation (Dialog(enable=not useTotalInput));

        Types.RealIO.AmountOfSubstanceInput total(start=Total) = t if useTotalInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));

        Physiolibrary.Types.AmountOfSubstance t "Current Mass/Energy";
        Types.RealIO.AmountOfSubstanceOutput totalAmountOfSubstance
          annotation (Placement(transformation(extent={{90,-50},{110,-30}})));
      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(fragment);

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);
        totalAmountOfSubstance = t;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                extent={{-160,-110},{160,-140}},
                lineColor={0,0,255},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Text(
                extent={{-100,50},{100,24}},
                lineColor={0,0,0},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid,
                textString="Total(%Total)")}),
          Documentation(info="<html>
</html>"));
      end MolarConservationLaw;

      model ElectricChargeConservationLaw
        "System amount of electric charge (=number of elementary charges) conservation law"
        extends Interfaces.SteadyStateSystem; //(Simulation=Types.SimulationType.SteadyState);
        extends Physiolibrary.Icons.ConservationLaw;

        parameter Integer n "Number of mass/energy fragments";

        Physiolibrary.Types.RealIO.ElectricChargeInput fragment[n]
          "Mass/Energy fragment"
          annotation (Placement(transformation(extent={{-120,-60},{-80,-20}}),
              iconTransformation(extent={{-120,-60},{-80,-20}})));

        parameter Boolean useTotalInput = false
          "=true, if total mass/energy is used as an input"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Physiolibrary.Types.ElectricCharge Total = 1
          "Total mass/energy if useTotalAsInput=false"
          annotation (Dialog(enable=not useTotalInput));

        Types.RealIO.ElectricChargeInput total(start=Total) = t if useTotalInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));

        Physiolibrary.Types.ElectricCharge t "Current Mass/Energy";
      equation
        if not useTotalInput then
          t=Total;
        end if;

        t*normalizedState[1] = sum(fragment);

        //fragment[1] = homotopy( actual=Total*normalizedState[1] - sum(fragment[i] for i in 2:n), simplified=Total*normalizedState[1]*firstFragmentFraction);

        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                extent={{-160,-110},{160,-140}},
                lineColor={0,0,255},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Text(
                extent={{-100,50},{100,24}},
                lineColor={0,0,0},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid,
                textString="Total(%Total)")}),
          Documentation(info="<html>
</html>"));
      end ElectricChargeConservationLaw;
    end Components;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      partial model SteadyState
        "Abstract class for any dynamic state calculation (for any derivation), which is driven by SimulationType option."
        //allow to switch between dynamic mode 'der(y)=x' and steady-state mode 'der(y)=0'
        import Physiolibrary.Types.*;

        replaceable package Utilities = Physiolibrary.Types.FilesUtilities
                                                                        constrainedby
          Physiolibrary.Types.Utilities
                       annotation (Dialog(group="Functions to read or store",tab="IO"));

        parameter SimulationType  Simulation=SimulationType.NormalInit
          "Dynamic with Initialization or Steady State"
          annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

        parameter Boolean isDependent = false
          "=true, If zero flow is propagated in eqiulibrium through resistors, impedances, reactions, etc."
          annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

        Real state(start=state_start, stateSelect=StateSelect.prefer)
          "This state must be connected in inherited class definition"
          annotation (HideResult=true);

        Real change "Dynamic change of state value per minute" annotation (HideResult=true);

        parameter Real state_start "State start or init value"
         annotation (HideResult=true,Dialog(enable=false,group="Initialization", tab="IO"));

        parameter Boolean SAVE_RESULTS = false
          "save and test final state values with original values"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter String storeUnit="" "Unit in Utilities input/output function"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter String stateName="" "Name in Utilities input/output function"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));
                                      //getInstanceName()
      protected
        parameter Real defaultValue(fixed=false) "Default value of state.";
        parameter Real initialValue(fixed=false) "Initial value of state.";

      initial equation

        if Simulation == SimulationType.NormalInit then
          state = state_start;
        elseif Simulation == SimulationType.ReadInit then
          state = Utilities.readReal(stateName, storeUnit);
        elseif Simulation == SimulationType.InitSteadyState and not isDependent then
          der(state)=0;  //here it have the same meaning as "change = 0", because of equation "der(state) = change"
        end if;

        initialValue = state; //in causality such as initialValue:=state
        if SAVE_RESULTS then
          defaultValue = Utilities.readReal(stateName, storeUnit);
        else
          defaultValue = Modelica.Constants.N_A;
        end if;
      equation

        when SAVE_RESULTS and terminal() then
          Utilities.writeReal(
              stateName,
              state,
              storeUnit);
          Utilities.writeComparison(
              stateName,
              defaultValue,
              initialValue,
              state,
              storeUnit);
        end when;

        if Simulation <> SimulationType.SteadyState then
          der(state) = change;
        elseif not isDependent then   /*** this test and equation exclusion could be done automatically, if the solver will be so smart that it removes all this dependend equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0). ***/
           change = 0;
        end if;

        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SteadyState;

      partial model SteadyStates
        "Abstract class for any dynamic states calculation (for any derivations), which is driven by SimulationType option."
        //allow to switch between dynamic mode 'der(y)=x' and steady-state mode 'der(y)=0'
        import Physiolibrary.Types.*;

        replaceable package Utilities = Physiolibrary.Types.FilesUtilities
                                                                        constrainedby
          Physiolibrary.Types.Utilities
                       annotation (Dialog(group="Functions to read or store",tab="IO"));

        parameter Integer n "Number of states"
          annotation (Dialog(group="Simulation"));

        Real state[n](start=state_start, stateSelect=StateSelect.prefer)
          "This state must be connected in inherited class definition";

        Real change[n] "Dynamic change of state value per minute";

        parameter Real state_start[n] "State start or init value"
         annotation (Dialog(enable=false,group="Initialization", tab="IO"));

        parameter SimulationType  Simulation=SimulationType.NormalInit
          "Dynamic with Initialization or Steady State"
          annotation (Dialog(group="Simulation",tab="Equilibrium"));

        parameter Boolean SAVE_RESULTS = false
          "save and test final state values with original values"
           annotation (Dialog(group="Value I/O",tab="IO"));

        parameter String storeUnit[n]=fill("",n)
          "Unit in Utilities input/output function"
           annotation (Dialog(group="Value I/O",tab="IO"));

        parameter String stateName[n]=fill("",n)
          "Name in Utilities input/output function"
           annotation (Dialog(group="Value I/O",tab="IO"));
                                      //getInstanceName()

        parameter Boolean isDependent[n]= fill(false,n)
          "=true, If zero flow is propagated in eqiulibrium through resistors, impedances, reactions, etc."
          annotation (Dialog(group="Simulation",tab="Equilibrium"));

      protected
        parameter Real defaultValue[n](fixed=false) "Default value of state.";
        parameter Real initialValue[n](fixed=false) "Initial value of state.";

      initial equation
        for i in 1:n loop
        if Simulation == SimulationType.NormalInit then
          state[i] = state_start[i];
        elseif Simulation == SimulationType.ReadInit then
            state[i] = Utilities.readReal(stateName[i], storeUnit[i]);
        elseif Simulation == SimulationType.InitSteadyState and not isDependent[i] then
          der(state[i])=0;  //here it have the same meaning as "change = 0", because of equation "der(state) = change"
        end if;

        initialValue = state; //in causality such as initialValue:=state
        if SAVE_RESULTS then
          defaultValue[i] = Utilities.readReal(stateName[i], storeUnit[i]);
        else
          defaultValue[i] = Modelica.Constants.N_A;
        end if;
        end for;
      equation

        when SAVE_RESULTS and terminal() then
          for i in 1:n loop
          Utilities.writeReal(
              stateName[i],
              state[i],
              storeUnit[i]);
          Utilities.writeComparison(
              stateName[i],
              defaultValue[i],
              initialValue[i],
              state[i],
              storeUnit[i]);
          end for;
        end when;

        if Simulation <> SimulationType.SteadyState then
          der(state) = change;
        else
          for i in 1:n loop
            if not isDependent[n] then   /*** this test and equation exclusion could be done automatically, if the solver will be so smart that it removes all this dependend equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0). ***/
              change[i] = 0;
            end if;
          end for;
        end if;

        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SteadyStates;

      partial class SteadyStateSystem
        "Global abstract class, for additional global state equations"

        import Physiolibrary.Types.*;

        parameter SimulationType  Simulation(start=SimulationType.NormalInit)
          "Dynamic with Initialization or Steady State"
          annotation (Dialog(group="Simulation type", tab="Simulation"));

        parameter Integer NumberOfDependentStates=1
          "Number of additional steady state equation of the system"
        annotation (Dialog(enable=false,group="Equilibrium", tab="Simulation"));

        Real normalizedState[NumberOfDependentStates]
          "Normalized independent masses of the system/Normalized independent energies of the system/... This variables must always equals to ones.";

      protected
        Real state[NumberOfDependentStates](each start=1)
          "In differential systems has the same meaning as the normalizedState. In steady state has no meaning.";

      initial equation
        if (Simulation == SimulationType.SteadyState) or
                                                       (Simulation == SimulationType.InitSteadyState) then
          state=ones(NumberOfDependentStates);
        end if;
      equation

        if Simulation == SimulationType.SteadyState then
          normalizedState = ones(NumberOfDependentStates); //add additional global steady-state equations
          der(state)=zeros(NumberOfDependentStates);       //remove 'state' from system calculations
        else
          normalizedState = state; //nothing special, just definition of 'state' variable

          //Correct definition of normalizedState should fulfill the equation 'normalizedState=ones(NumberOfDependentStates)' during simulation.
          //The difference from vector 'ones(NumberOfDependentStates)' could be used as the solver calculation error vector.
        end if;

        annotation ( Documentation(revisions="<html>
<p><i>2013-2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SteadyStateSystem;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",   info="<html>
<p>One of the main question in clinical medicine is how to stabilize the patient. In the fact of the oscillating heart, breathing, circadian rhythm or menstruation cycle the model could be designed as non-oscillating with variables such as period times, amplitudes, frequencies, mean values and other phase space variables. This type of model has better numerical stability for longer simulation time and even more it can be &QUOT;stabilized&QUOT;. This stabilization we called steady state. </p>
<p>To be mathematically exact, we define an <i><b>steady state system</b></i> (SSS) as a non-differential system derived from a original differential system (DS) by using zero derivations and by adding <b>additional steady state equations</b> (ASSE). The number of the ASSE must be the same as the number of algebraically dependent equations in the non-differential system derived from DS by setting zero derivations. The ASSE describes the system from the top view mostly such as the equations of mass conservation laws or the boundary equation of environment sources. To define a model as an SSS the user must switch each Simulation parameter in each block to value Types.SimulationType.SteadyState and must have correctly defined all necessary ASSE. This setting caused to ignoring any start values for any state and add zero derivation equations instead. Today does not exist Modelica environment, which could automatically find and remove generated dependent equations by this way. So the correct number of states must be marked as dependent (parameter isDependent) and the same number of ASSE must be inserted. Despite the fact, that model in this steady-state setting will be not locally balanced it should be globally balanced and without any dependent equation.</p>
<p>Adding of one ASSE is possible by inserting and connecting of the energy or mass conservation law block from package SteadyState.Components. Other possibilities is in blocks of environment&nbsp; sources, where the setting of parameter isIsolatedInSteadyState&nbsp; add the equation of the zero mass/volume/energy flow from or to environment. </p>
<p>The model in steady state often changes to one big nonlinear strong component, but without solver stiff or convergence problems. Especially in quick chemical reaction kinetics is not necessary to have very rapid molar fluxes, when it always reach equilibrium. This design also approve to create steady stated parts in dynamical model without huge rebuilding. It also&nbsp; brings other benefits. To see these possibilities, one have to realize that conservation laws could be invariances in a dynamical simulation. This is really useful for debugging. </p>
<p>It is always a big challenge to nicely solve initial values of differential system. However, it should be possible to solve the SSS in initial phase. And this is the idea behind the Types.SimulationTypes.InitSteadyState option for models already extended with ASSE to support SSS. </p>
</html>"));
  end SteadyStates;

  package Icons "Icons for physiological models"
    //extends Modelica.Icons.IconsPackage;
    extends Modelica.Icons.Package;
    package Library
        extends Modelica.Icons.Package;
    end Library;

    model Golem

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,98},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/golem.png")}));
    end Golem;

    model CardioVascular

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/csv.png")}));
    end CardioVascular;

    model Water

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/indexVoda.png")}));
    end Water;

    model Electrolytes

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/electrolytes.png")}));
    end Electrolytes;

    model Proteins

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/protein.png")}));
    end Proteins;

    model Gases

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/gases.png")}));
    end Gases;

    model NutrientsMetabolism

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/vyziva.png")}));
    end NutrientsMetabolism;

    model Heat

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/ohen.png")}));
    end Heat;

    model Hormones

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/hormony.png")}));
    end Hormones;

    model Nerves

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/nervyNeuron.png")}));
    end Nerves;

    model Setup

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/setup.png")}));
    end Setup;

    model Status

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,-100},{100,
                  100}}, fileName="modelica://Physiolibrary/Resources/Icons/tissueFitness.png")}));
    end Status;

    model SkeletalMuscle

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
                fileName="modelica://Physiolibrary/Resources/Icons/sval.png")}));
    end SkeletalMuscle;

    model Bone

      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Bitmap(extent={{-88,96},{52,-84}},
                fileName="modelica://Physiolibrary/Resources/Icons/bone.png")}));
    end Bone;

    model OtherTissue

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-74,60},{48,-94}},
                fileName="modelica://Physiolibrary/Resources/Icons/pojivovaTkan.png")}));
    end OtherTissue;

    model RespiratoryMuscle

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-66,86},{44,-86}},
                fileName="modelica://Physiolibrary/Resources/Icons/respiracniSvaly.png")}));
    end RespiratoryMuscle;

    model Fat

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-84,86},{38,-68}},
                fileName="modelica://Physiolibrary/Resources/Icons/tukovaBunka.png")}));
    end Fat;

    model Skin

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-74,56},{48,-84}},
                fileName="modelica://Physiolibrary/Resources/Icons/skin.png")}));
    end Skin;

    model Brain

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-78,62},{44,-92}},
                fileName="modelica://Physiolibrary/Resources/Icons/brain.png")}));
    end Brain;

    model GITract

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-80,74},{42,-80}},
                fileName="modelica://Physiolibrary/Resources/Icons/traviciTrakt.png")}));
    end GITract;

    model LeftHeart

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),        graphics={Bitmap(extent={{-96,100},{24,-100}},
              imageSource=
                  "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",

              fileName="modelica://Physiolibrary/Resources/Icons/srdceLeva.png")}),   Diagram(
            coordinateSystem(extent={{-100,-100},{100,100}})));
    end LeftHeart;

    model RightHeart

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),       graphics={Bitmap(extent={{-26,66},{92,-100}},
              imageSource=
                  "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",

              fileName=
                  "modelica://Physiolibrary/Resources/Icons/srdceprava.png")}),        Diagram(
            coordinateSystem(extent={{-100,-100},{100,100}})));
    end RightHeart;

    model Liver

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-84,34},{86,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/jatra.png")}));
    end Liver;

    model Kidney

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-92,86},{40,-88}},
                fileName="modelica://Physiolibrary/Resources/Icons/kidney.png")}));
    end Kidney;

    model Bladder

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Bitmap(extent={{-92,86},{40,-88}},
                fileName="modelica://Physiolibrary/Resources/Icons/mocovyMechyr.png")}));
    end Bladder;

    model GILumen

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/traviciTrakt2.png")}));
    end GILumen;

    model ThyroidGland

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-92,86},{40,-88}},
                fileName="modelica://Physiolibrary/Resources/Icons/stitnaZlaza.png")}));
    end ThyroidGland;

    model Pancreas

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/pankreas.png")}));
    end Pancreas;

    model AdrenalGland

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/nadledviny.png")}));
    end AdrenalGland;

    model Lungs

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
                fileName="modelica://Physiolibrary/Resources/Icons/plice.png")}));
    end Lungs;

    model Tissues

      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}), graphics={
            Bitmap(extent={{-46,98},{32,26}}, fileName="modelica://Physiolibrary/Resources/Icons/bone.png"),
            Bitmap(extent={{-62,-10},{50,-92}}, fileName="modelica://Physiolibrary/Resources/Icons/skin.png"),
            Bitmap(extent={{-38,90},{64,-20}}, fileName="modelica://Physiolibrary/Resources/Icons/sval.png"),
            Bitmap(extent={{-10,36},{102,-56}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/traviciTrakt.png"),
            Text(
              extent={{64,-66},{94,-96}},
              lineColor={0,0,0},
              textString="..."),
            Bitmap(extent={{-98,36},{-24,-30}}, fileName="modelica://Physiolibrary/Resources/Icons/brain.png")}));

    end Tissues;

    model Peritoneum

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
                fileName="modelica://Physiolibrary/Resources/Icons/peritoneum.png")}));
    end Peritoneum;

    model Plasma

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
                fileName="modelica://Physiolibrary/Resources/Icons/plazma.png")}));
    end Plasma;

    model Hypophysis

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/hypofyza.png")}));
    end Hypophysis;

    model Heart

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              imageSource=
                  "iVBORw0KGgoAAAANSUhEUgAAAGYAAABoCAYAAAAD1YUSAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAASdAAAEnQB3mYfeAAAAk9JREFUeF7t0cFNA0EQRFEC4UgeXAmeVIjBqA8rWVDgnZnunlrrP6kSqP9ygyXCmCKMKcKYIowpwpgijCnCmCKMKcKYIowpwpgijCnCmCKMKcKYIowpwpgijCnCmCKMKcKYIowpwpgijCnCmCKMqS1h3j8+f63T1+vbr7lpCaNCPFomFeLRdisNow4f3Qp1+Oh2KQujTl7ZCHXwynYoCaOOzdgZ6tiMdUsPow7N3H/UoZnrlBpGHVkxRR1ZsS5pYdSBHVPnVa8DYSbWISWMOqxr6riOVSPM5Koth1FndU6d1rFqhFlYJcIsrBJhFlaJMAurRJiFVSLMwioRZmGVlsMEdVjX1GEdq0aYyVUjzOSqEWZy1VLCBHVax9Rp1etAmIl1SAsT1HHVU8dVrgthBtclNUxQ51VOnVe1ToQZWKf0MEEdWDV1YMW6lYQJ6sSKqROztwNhTmyHsjBBHZk9dWTmdikNE9SZmVNnZm2n8jBBHZo1dWjGdmsJE9SpGVOnrs5BW5igjl2dOnZlLlrDBHXuytS5s3PSHiaog2enDp6dky1hgjp5Zurg0TnaFuagzh6ZOnpkrraHCerws1Nnn5k7izBBnX5m6vRHuwKbMAd1/n9Tx/+1K7ELc1AR1FSAn7si2zBBhfg5FeJ+V2Ud5qCCHFMxYld3iTCHM2GexaXC3LsP84wuG+bZEcYUYUwRxhRhTBHGFGFMEcYUYUwRxhRhTBHGFGFMEcYUYUwRxhRhTBHGFGFMEcYUYUwRxhRhTBHGFGFMEcYUYUwRxtLt9g2En+QckQcQ9wAAAABJRU5ErkJggg==",

              fileName="modelica://Physiolibrary/Resources/Icons/heart.png")}));
    end Heart;

    model SweatGland

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/potniZlaza.png")}));
    end SweatGland;

    model Cell

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/OsmothicCell.png")}));
    end Cell;

    package HeatLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,44},{76,-82}},
                fileName="modelica://Physiolibrary/Resources/Icons/ohen.png")}));

    end HeatLib;

    package StatusLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,-96},{72,40}},
                fileName="modelica://Physiolibrary/Resources/Icons/tissueFitness.png")}));

    end StatusLib;

     package NervesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{72,-96}},
                fileName="modelica://Physiolibrary/Resources/Icons/nervyNeuron.png")}));

     end NervesLib;

    package NutrientsMetabolismLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,40},{80,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/vyziva.png")}));

    end NutrientsMetabolismLib;

    package OxygenLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{78,-98}},
                fileName="modelica://Physiolibrary/Resources/Icons/O2.png")}));
    end OxygenLib;

    package ProteinsLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,42},{76,-98}},
                fileName="modelica://Physiolibrary/Resources/Icons/protein.png")}));

    end ProteinsLib;

    package SetupLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-94,44},{72,-98}},
                fileName="modelica://Physiolibrary/Resources/Icons/setup.png")}));

    end SetupLib;

    package CardioVascularLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{76,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/csv.png")}));

    end CardioVascularLib;

    package WaterLib
     extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-90,42},{72,-84}},
                fileName="modelica://Physiolibrary/Resources/Icons/indexVoda.png")}));

    end WaterLib;

     package KidneyLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{72,-96}},
                fileName="modelica://Physiolibrary/Resources/Icons/Kidney.png")}));

     end KidneyLib;

    package ElectrolytesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-78,38},{64,-94}},
                fileName="modelica://Physiolibrary/Resources/Icons/electrolytes.png")}));

    end ElectrolytesLib;

    package GasesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-88,34},{66,-82}},
                fileName="modelica://Physiolibrary/Resources/Icons/gases.png")}));

    end GasesLib;

    package GolemLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{78,-98}},
                fileName="modelica://Physiolibrary/Resources/Icons/golem.png")}));
    end GolemLib;

    package BaseLib
      extends Modelica.Icons.Package;
    end BaseLib;

    package HormonesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-88,30},{74,-88}},
                fileName="modelica://Physiolibrary/Resources/Icons/hormony.png")}));

    end HormonesLib;

     package AutonomicControlLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{72,-96}},
                fileName="modelica://Physiolibrary/Resources/Icons/sympatetickeNervy.png")}));

     end AutonomicControlLib;

    partial model Resistor

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,0},
              fillColor={241,241,241},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-70,0}}, color={0,0,0}),
            Line(points={{70,0},{90,0}}, color={0,0,0})}));
    end Resistor;

    model Lymph

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/Lymph.png")}));
    end Lymph;

    model RespiratoryCenter

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/respiracniCentrum.png")}));
    end RespiratoryCenter;

    model Oxygen

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/O2.png")}));
    end Oxygen;

    model CarbonDioxide

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/prvkyCO2.png")}));
    end CarbonDioxide;

    model AcidBase

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/acidobaze.png")}));
    end AcidBase;

    model Ventilation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/dychani.png")}));
    end Ventilation;

    model PeripheralChemoreceptors

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/baroreflex.png")}));
    end PeripheralChemoreceptors;

    model HeatCore

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Bitmap(extent={{-100,100},{
                  100,-100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/torzo2.png")}));
    end HeatCore;

    model Glycogen

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                                 Rectangle(
              extent={{-100,100},{100,-100}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),     Bitmap(extent={{-100,100},{100,-100}},
                          fileName=
                  "modelica://Physiolibrary/Resources/Icons/glykogen.png")}));
    end Glycogen;

    model Lipids

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/FattyAcid.png")}));
    end Lipids;

    model KetoAcids

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/KetoAcid.png")}));
    end KetoAcids;

    model Glucose

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/glucose.png")}));
    end Glucose;

    model Lactate

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/Lactate.png")}));
    end Lactate;

    model AminoAcids

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/AminoAcid.png")}));
    end AminoAcids;

    model Urea

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/Urea.png")}));
    end Urea;

    model MetabolismPart

      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,120}}),
            graphics={             Bitmap(extent={{28,120},{98,44}}, fileName=
                 "modelica://Physiolibrary/Resources/Icons/ohen.png")}));
    end MetabolismPart;

    model CellularMetabolism

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/cellularMetabolism.png")}));
    end CellularMetabolism;

    model FemaleSex

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/hormonesFemaleSex.png")}));
    end FemaleSex;

    model Barroreceptor

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/baroreflex.png")}));
    end Barroreceptor;

    model NervusVagus

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/vagus.png")}));
    end NervusVagus;

    model SympatheticNerves

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/sympatetickeNervy.png")}));
    end SympatheticNerves;

    model PhysicalExercise

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/cviceni.png")}));
    end PhysicalExercise;

    model SinoatrialNode

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/SANode.png")}));
    end SinoatrialNode;

    block StatusNormal

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/siluetaNormal.png")}));
    end StatusNormal;

    block StatusConfused

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/siluetaZmateni.png")}));
    end StatusConfused;

    block StatusImpaired

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/siluetaVaznejsiStav.png")}));
    end StatusImpaired;

    block StatusNotBreathing

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/siluetaNedychaSam.png")}));
    end StatusNotBreathing;

    block StatusComatose

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/siluetaKoma.png")}));
    end StatusComatose;

    block StatusMayBeDead

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/siluetaSkoroMrtvy.png")}));
    end StatusMayBeDead;

    block StatusIsReallyDead

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/siluetaMrtvy.png")}));
    end StatusIsReallyDead;

    model SkeletalMuscleAcidity

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/kyselostVeSvalech.png")}));
    end SkeletalMuscleAcidity;

    model Sodium

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/Na.png")}));
    end Sodium;

    model Potassium

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/K.png")}));
    end Potassium;

    model Phosphate

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/fosfat.png")}));
    end Phosphate;

    model Sulphate

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/sulfat02.png")}));
    end Sulphate;

    model Amonium

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/NH4.png")}));
    end Amonium;

    model Chloride

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/Cl.png")}));
    end Chloride;

    model LungShunt

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/lungBloodFlow.png")}));
    end LungShunt;

    model Hydrostatics

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/pressureMeassure.png")}));
    end Hydrostatics;

    model UpperTorso

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/torzo1.png")}));
    end UpperTorso;

    model MiddleTorso

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/torzo2.png")}));
    end MiddleTorso;

    model LowerTorso

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/Resources/Icons/torzo3.png")}));
    end LowerTorso;

    model RedCells

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/cervenaKrvinka.png")}));
    end RedCells;

    model SystemicCirculation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}},
              imageSource=
                  "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",

              fileName=
                  "modelica://Physiolibrary/Resources/Icons/krevniRecisteSiluetacloveka.png")}));
    end SystemicCirculation;

    model PulmonaryCirculation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}},
              imageSource=
                  "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",

              fileName=
                  "modelica://Physiolibrary/Resources/Icons/krevniRecistePlice.png")}));
    end PulmonaryCirculation;

    model Blood

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/bloodProperties.png")}));
    end Blood;

    model BaseFactorIcon0

      annotation (Icon(graphics={  Rectangle(
              extent={{-100,60},{100,-40}},
              lineColor={0,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-76,44},{64,-22}},
              lineColor={0,0,0},
              textString="%name")}));
    end BaseFactorIcon0;

    partial model BaseFactorIcon

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,20})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-40})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}));
    end BaseFactorIcon;

    partial model BaseFactorIcon2

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,60})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-60})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,50},{100,-50}},
              lineColor={0,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-86,-36},{100,40}},
              textString="%name",
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere)}));
    end BaseFactorIcon2;

    partial model BaseFactorIcon3

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,20})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-40})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}));
    end BaseFactorIcon3;

    partial model BaseFactorIcon4

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,20})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-40})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={127,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}));
    end BaseFactorIcon4;

    partial model BaseFactorIcon5

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,20})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-40})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}));
    end BaseFactorIcon5;

    partial model BaseFactorIcon6

      Modelica.Blocks.Interfaces.RealInput yBase
                       annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={0,20})));
      Modelica.Blocks.Interfaces.RealOutput y
                    annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-40})));

     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
            extent={{-100,20},{100,-20}},
            lineColor={0,87,87},
            fillColor={255,255,255},
            fillPattern=FillPattern.Sphere)}));
    end BaseFactorIcon6;

    partial class ConversionIcon "Base icon for conversion functions"

      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={191,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-74,0},{30,0}}, color={191,0,0}),
            Polygon(
              points={{80,0},{20,20},{20,-20},{80,0}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid)}));

    end ConversionIcon;

    partial model Diffusion

      annotation (Icon(graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/diffusion.png")}));

    end Diffusion;

    model Substance

        annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/Concentration.png"), Text(
              extent={{-22,-102},{220,-136}},
              lineColor={0,0,255},
              textString="%name")}));
    end Substance;

    model Speciation

      annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/Speciation.png"), Text(
              extent={{-182,-84},{60,-118}},
              lineColor={0,0,255},
              textString="%name")}));
    end Speciation;

    model MolarFlowMeasure

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/molarFlowMeassure.png")}));
    end MolarFlowMeasure;

    model GasSolubility

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName=
                  "modelica://Physiolibrary/Resources/Icons/GasSolubility.png")}));
    end GasSolubility;

    model Reabsorption

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName=
                  "modelica://Physiolibrary/Resources/Icons/reabsorption.png")}));
    end Reabsorption;

    model Reabsorption2

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName=
                  "modelica://Physiolibrary/Resources/Icons/reabsorption.png")}));
    end Reabsorption2;

    model Dilution

      annotation (Icon(graphics={     Bitmap(extent={{-100,101},{100,-101}},
                fileName="modelica://Physiolibrary/Resources/Icons/dilution.png",
              origin={0,33},
              rotation=270)}));
    end Dilution;

    model ElasticBalloon

    annotation (Icon(graphics={     Bitmap(extent={{-100,100},{100,-100}},
              imageSource=
                  "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",

              fileName=
                  "modelica://Physiolibrary/Resources/Icons/elastickyKompartment - Kopie.png")}));
    end ElasticBalloon;

    model BloodElasticCompartment

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/elastickyKompartment.png")}));
    end BloodElasticCompartment;

    model BloodSequesteredCompartment

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/sequerestedVolume.png")}));
    end BloodSequesteredCompartment;

    partial model HydraulicResistor

    annotation (Icon(graphics={    Bitmap(extent={{-120,44},{120,-42}},
              imageSource=
                  "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"
                   +
                  "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",

              fileName=
                  "modelica://Physiolibrary/Resources/Icons/resistance.png")}));
    end HydraulicResistor;

    model FlowMeasure

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                                      Bitmap(extent={{-100,100},{100,-100}},
              imageSource=
                  "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",

              fileName=
                  "modelica://Physiolibrary/Resources/Icons/flowMeassure.png")}));
    end FlowMeasure;

    model Membrane

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/membrane.png")}));
    end Membrane;

    model PressureMeasure

      annotation ( Icon(graphics={Bitmap(extent={
                  {-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/pressureMeassure.png")}));
    end PressureMeasure;

    model InternalElasticBalloon

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName=
                  "modelica://Physiolibrary/Resources/Icons/ventilatorCapacitance.png")}));
    end InternalElasticBalloon;

    model Inertance

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName=
                  "modelica://Physiolibrary/Resources/Icons/ventilatorInertance.png")}));
    end Inertance;

    model HydrostaticGradient

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Bitmap(extent={{-100,100},{102,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/hydrostaticGradient.png")}));

    end HydrostaticGradient;

    model Radiator

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/Radiator.png")}));
    end Radiator;

    model MichaelisMenten

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-80,84},{86,-26}},
                fileName=
                  "modelica://Physiolibrary/Resources/Icons/MichaelisMenten.png")}));
    end MichaelisMenten;

    model HeatAccumulation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName=
                  "modelica://Physiolibrary/Resources/Icons/HeatAccumulation.png")}));
    end HeatAccumulation;

    model OsmoticCell

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName=
                  "modelica://Physiolibrary/Resources/Icons/OsmothicCell.png")}));
    end OsmoticCell;

    model IdealGas

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/IdealGas.png")}));
    end IdealGas;

    model PartialPressure

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName=
                  "modelica://Physiolibrary/Resources/Icons/PartialPressure.png")}));
    end PartialPressure;

    model ConservationLaw

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              fillColor={170,255,213},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None),
            Polygon(
              points={{-40,-60},{-40,-20},{-80,-40},{-40,-60}},
              pattern=LinePattern.None,
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,0}),
            Line(
              points={{-80,10},{-80,-80},{-80,-80}},
              color={0,0,0},
              smooth=Smooth.None)}));
    end ConservationLaw;
    annotation (Documentation(revisions=""));
  end Icons;

  package Types "Physiological units with nominals"
    //extends Modelica.Icons.TypesPackage;
    extends Modelica.Icons.Package;
  //If you have an idea to add the next physiological type to the next version, please write me at marek@matfyz.cz. Thank you

    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;
      model Units
      extends Modelica.Icons.Example;
       model ParametricClass

        parameter Temperature temperature;
        parameter Heat heat;
        parameter Pressure pressure;
        parameter Volume volume;
        parameter AmountOfSubstance amountOfSubstance;
        parameter ElectricCharge electricCharge;
        parameter ElectricCurrent electricCurrent;

        parameter Time time_;
        parameter Energy energy;
        parameter Mass mass;
        parameter ElectricPotential electricalPotential;
        parameter MassFlowRate massFlowRate;
        parameter Density density;
        parameter Height height;
        parameter Acceleration acceleration;

        parameter VolumeFlowRate volumeFlowRate;
        parameter Concentration concentration;
        parameter Osmolarity osmolarity;

        parameter MolarFlowRate molarFlowRate;
         parameter HeatFlowRate heatFlowRate;
        parameter ThermalConductance thermalConductance;
        parameter SpecificHeatCapacity specificHeatCapacity;
        parameter SpecificEnergy specificEnergy(displayUnit="cal/g");

        parameter Fraction fraction;
        parameter OsmoticPermeability osmoticPermeability;
        parameter DiffusionPermeability diffusionPermeability;
        parameter HydraulicConductance hydraulicConductance;
        parameter HydraulicInertance hydraulicInertance;
        parameter GasSolubility gasSolubility;

        parameter AmountOfSubstance gasSTP(displayUnit="litre_STP");
        parameter AmountOfSubstance gasSATP(displayUnit="litre_SATP");
        parameter AmountOfSubstance gasNIST(displayUnit="litre_NIST");

       end ParametricClass;

        ParametricClass parametricClass(
          acceleration=1,
          concentration=1,
          osmolarity=1,
          gasSTP(displayUnit="litre_STP") = 0.0440316172572,
          mass(displayUnit="ug") = 1e-09,
          temperature=274.15,
          heat=4186.8,
          pressure=133.322387415,
          volume=1e-06,
          amountOfSubstance=0.001,
          electricCharge=96.4853399,
          electricCurrent=1.6080889983333,
          time_=60,
          energy=4186.8,
          electricalPotential=0.001,
          massFlowRate=1.6666666666667e-08,
          density=1000,
          height=0.01,
          volumeFlowRate=1.6666666666667e-08,
          molarFlowRate=1.6666666666667e-05,
          heatFlowRate=69.78,
          thermalConductance=69.78,
          specificHeatCapacity=4186.8,
          specificEnergy=4186.8,
          fraction=0.01,
          osmoticPermeability=1.2501026264094e-10,
          diffusionPermeability=1.6666666666667e-08,
          hydraulicConductance=1.2501026264094e-10,
          hydraulicInertance=479960594694,
          gasSolubility=0.0075006157584566,
          gasSATP=0.040339548059044,
          gasNIST=0.041571199502531)
          annotation (Placement(transformation(extent={{-14,8},{6,28}})));
        annotation (experiment(StopTime=1),
       Documentation(info="<html>
<p>If your environment fully support the physiological units, then the user dialog of setting parameters should display only values &QUOT;1&QUOT; of physiological unit.</p>
</html>"));
      end Units;

      model ParameterSet
      extends Modelica.Icons.Example;

        package T=Physiolibrary.Types.RealTypes;

        T.Pressure Bone_PO2(varName="Bone-Flow.PO2")
          "Partial oxygen pressure in bone blood venules."
        annotation (Placement(transformation(extent={{-80,24},{2,106}})));
        T.VolumeFlowRate BoneBloodFlow(varName="Bone-Flow.BloodFlow")
          "Blood flow through bones"
        annotation (Placement(transformation(extent={{-80,-10},{2,72}})));
        T.MolarFlowRate BoneO2Need(varName="Bone-Metabolism.O2-Need")
          "Current desired delivery flow of oxygen to bone metabolism"
        annotation (Placement(transformation(extent={{-80,-50},{2,32}})));
        T.Volume BoneLiquidVol(varName="Bone-Tissue.LiquidVol")
          "The extravascular water in bones. "
        annotation (Placement(transformation(extent={{-80,-92},{2,-10}})));
        BusConnector busConnector annotation (Placement(transformation(extent={{52,-20},
                  {90,18}}), iconTransformation(extent={{-12,-18},{28,22}})));
      equation
        connect(Bone_PO2.y, busConnector.Bone_PO2) annotation (Line(
            points={{6.1,65},{70.05,65},{70.05,-1},{71,-1}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(BoneBloodFlow.y, busConnector.Bone_BloodFlow)
                                                         annotation (Line(
            points={{6.1,31},{71.05,31},{71.05,-1},{71,-1}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(BoneO2Need.y, busConnector.Bone_O2Need)
                                                      annotation (Line(
            points={{6.1,-9},{71.05,-9},{71.05,-1},{71,-1}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(BoneLiquidVol.y, busConnector.Bone_LiquidVol)
                                                         annotation (Line(
            points={{6.1,-51},{71.05,-51},{71.05,-1},{71,-1}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        annotation (experiment(StopTime=1));
      end ParameterSet;

      model InputParameterSet
      extends ParameterSet( T(redeclare block Variable =
                RealExtension.InputParameter (                                       redeclare
                  package Utilities = Physiolibrary.Types.ZeroUtilities)));

      end InputParameterSet;

      model OutputFinalSet
      extends ParameterSet( T(redeclare block Variable =
              RealExtension.OutputFinal (
                redeclare package Utilities = Physiolibrary.Types.ZeroUtilities)));
      end OutputFinalSet;

      model OutputComparisonSet
      extends ParameterSet( T(redeclare block Variable =
                RealExtension.OutputComparison (
                redeclare package Utilities = Physiolibrary.Types.ZeroUtilities)));
      end OutputComparisonSet;
    end Examples;

    package Constants
      extends Modelica.Icons.SourcesPackage;

    block AccelerationConst "Constant signal of type Acceleration"
     parameter Types.Acceleration k "Constant Acceleration output value";
          RealIO.AccelerationOutput y "Acceleration constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="acceleration",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end AccelerationConst;

    block AmountOfSubstanceConst "Constant signal of type AmountOfSubstance"
     parameter Types.AmountOfSubstance k
          "Constant AmountOfSubstance output value";
          RealIO.AmountOfSubstanceOutput y "AmountOfSubstance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="amountOfSubstance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end AmountOfSubstanceConst;

    block ConcentrationConst "Constant signal of type Concentration"
     parameter Types.Concentration k "Constant Concentration output value";
          RealIO.ConcentrationOutput y "Concentration constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="concentration",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end ConcentrationConst;

    block DensityConst "Constant signal of type Density"
     parameter Types.Density k "Constant Density output value";
          RealIO.DensityOutput y "Density constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="density",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end DensityConst;

    block DiffusionPermeabilityConst
        "Constant signal of type DiffusionPermeability"
     parameter Types.DiffusionPermeability k
          "Constant DiffusionPermeability output value";
          RealIO.DiffusionPermeabilityOutput y "DiffusionPermeability constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="diffusionPermeability",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end DiffusionPermeabilityConst;

    block ElectricChargeConst "Constant signal of type ElectricCharge"
     parameter Types.ElectricCharge k "Constant ElectricCharge output value";
          RealIO.ElectricChargeOutput y "ElectricCharge constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="electricCharge",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end ElectricChargeConst;

    block ElectricCurrentConst "Constant signal of type ElectricCurrent"
     parameter Types.ElectricCurrent k "Constant ElectricCurrent output value";
          RealIO.ElectricCurrentOutput y "ElectricCurrent constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="electricCurrent",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end ElectricCurrentConst;

    block ElectricPotentialConst "Constant signal of type ElectricPotential"
     parameter Types.ElectricPotential k
          "Constant ElectricPotential output value";
          RealIO.ElectricPotentialOutput y "ElectricPotential constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="electricPotential",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end ElectricPotentialConst;

      block EnergyConst "Constant signal of type Energy"
        parameter Types.Energy k "Constant Energy output value";
          RealIO.EnergyOutput y "Energy constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
      equation
          y=k;
      annotation (defaultComponentName="energy",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
      end EnergyConst;

    block FractionConst "Constant signal of type Fraction"
     parameter Types.Fraction k "Constant Fraction output value";
          RealIO.FractionOutput y "Fraction constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="fraction",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end FractionConst;

    block FrequencyConst "Constant signal of type Frequency"
     parameter Types.Frequency k "Constant Frequency output value";
          RealIO.FrequencyOutput y "Frequency constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="frequency",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end FrequencyConst;

    block GasSolubilityConst "Constant signal of type GasSolubility"
     parameter Types.GasSolubility k "Constant GasSolubility output value";
          RealIO.GasSolubilityOutput y "GasSolubility constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="gasSolubility",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end GasSolubilityConst;

    block HeatConst "Constant signal of type Heat"
     parameter Types.Heat k "Constant Heat output value";
          RealIO.HeatOutput y "Heat constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="heat",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HeatConst;

    block HeightConst "Constant signal of type Height"
     parameter Types.Height k "Constant Height output value";
          RealIO.HeightOutput y "Height constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="height",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HeightConst;

    block HeatFlowRateConst "Constant signal of type HeatFlowRate"
     parameter Types.HeatFlowRate k "Constant HeatFlowRate output value";
          RealIO.HeatFlowRateOutput y "HeatFlowRate constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="heatFlowRate",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HeatFlowRateConst;

    block HydraulicComplianceConst
        "Constant signal of type HydraulicCompliance"
     parameter Types.HydraulicCompliance k
          "Constant HydraulicCompliance output value";
          RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicCompliance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HydraulicComplianceConst;

    block HydraulicElastanceConst
        "Obsolete, please use HydraulicCompliance instead!"
      extends Modelica.Icons.ObsoleteModel;
     parameter Types.HydraulicElastance k "Hydraulic elastance";
          Modelica.Blocks.Interfaces.RealOutput
                                           y(final quantity="HydraulicCompliance",final unit="Pa/m3", displayUnit="mmHg/ml", nominal=(133.322387415)/(1e-6))
          "HydraulicElastance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicElastance",
                      Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}),
          Documentation(info="<html>
<p>Please use the reciprocal value of hydraulic elastance, wich is called hydraulic compliance for the compatibility with other blocks and models!</p>
<p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Physiolibrary.Blocks.Math.Reciprocal) before connecting to library components!</p>
</html>"));
    end HydraulicElastanceConst;

    block HydraulicElastanceToComplianceConst
        "Constant signal of type HydraulicCompliance from HydraulicElastance constant"
     parameter Types.HydraulicElastance k
          "Reciprocal constant value of hydraulic compliance";
          RealIO.HydraulicComplianceOutput y "HydraulicCompliance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=1/k;
      annotation (defaultComponentName="hydraulicElastance2Compliance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HydraulicElastanceToComplianceConst;

    block HydraulicConductanceConst
        "Constant signal of type HydraulicConductance"
     parameter Types.HydraulicConductance k
          "Constant HydraulicConductance output value";
          RealIO.HydraulicConductanceOutput y "HydraulicConductance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicConductance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HydraulicConductanceConst;

    block HydraulicResistanceConst
        "Obsolete, please use HydraulicConductance instead!"

     parameter Types.HydraulicResistance k "Hydraulic resistance";
          Modelica.Blocks.Interfaces.RealOutput
                                            y(final quantity="HydraulicConductance",final unit="(Pa.s)/m3", displayUnit="(mmHg.min)/ml", nominal=(1e+6)*(133.322387415)*60)
          "HydraulicResistance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicResistance",
                      Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}),
          Documentation(info="<html>
<p>Please use the reciprocal value of hydraulic resistance, wich is called hydraulic conductance for the compatibility with other blocks and models!</p>
<p>Because zero hydraulic conductance means zero volumetric flow, it is much better to use this reciprocal value of hydraulic resistance.</p>
<p>Even it is not recommended, you can use this block, but do not forget to make reciprocal value (in example using Physiolibrary.Blocks.Math.Reciprocal) before connecting to library components!</p>
</html>"));
    end HydraulicResistanceConst;

    block HydraulicResistanceToConductanceConst
        "Constant signal of type HydraulicConductance from HydraulicResistance parameter"
     parameter Types.HydraulicResistance k
          "Reciprocal constant value of hydraulic conductance";
          RealIO.HydraulicConductanceOutput y "HydraulicConductance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=1/k;
      annotation (defaultComponentName="hydraulicResistance2conductance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HydraulicResistanceToConductanceConst;

    block HydraulicInertanceConst "Constant signal of type HydraulicInertance"
     parameter Types.HydraulicInertance k
          "Constant HydraulicInertance output value";
          RealIO.HydraulicInertanceOutput y "HydraulicInertance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicInertance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end HydraulicInertanceConst;

    block MassConst "Constant signal of type Mass"
     parameter Types.Mass k "Constant Mass output value";
          RealIO.MassOutput y "Mass constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="mass",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end MassConst;

    block MassFlowRateConst "Constant signal of type MassFlowRate"
     parameter Types.MassFlowRate k "Constant MassFlowRate output value";
          RealIO.MassFlowRateOutput y "MassFlowRate constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="massFlowRate",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end MassFlowRateConst;

    block MolarFlowRateConst "Constant signal of type MolarFlowRate"
     parameter Types.MolarFlowRate k "Constant MolarFlowRate output value";
          RealIO.MolarFlowRateOutput y "MolarFlowRate constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="molarFlowRate",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end MolarFlowRateConst;

    block OsmolarityConst "Constant signal of type Osmolarity"
     parameter Types.Osmolarity k "Constant Osmolarity output value";
          RealIO.OsmolarityOutput y "Osmolarity constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="osmolarity",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end OsmolarityConst;

    block OsmoticPermeabilityConst
        "Constant signal of type OsmoticPermeability"
     parameter Types.OsmoticPermeability k
          "Constant OsmoticPermeability output value";
          RealIO.OsmoticPermeabilityOutput y "OsmoticPermeability constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="osmoticPermeability",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end OsmoticPermeabilityConst;

    block PressureConst "Constant signal of type Pressure"
     parameter Types.Pressure k "Constant Pressure output value";
          RealIO.PressureOutput y "Pressure constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="pressure",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end PressureConst;

    block SpecificEnergyConst "Constant signal of type SpecificEnergy"
     parameter Types.SpecificEnergy k "Constant SpecificEnergy output value";
          RealIO.SpecificEnergyOutput y "SpecificEnergy constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="specificEnergy",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end SpecificEnergyConst;

    block SpecificHeatCapacityConst
        "Constant signal of type SpecificHeatCapacity"
     parameter Types.SpecificHeatCapacity k
          "Constant SpecificHeatCapacity output value";
          RealIO.SpecificHeatCapacityOutput y "SpecificHeatCapacity constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="specificHeatCapacity",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end SpecificHeatCapacityConst;

    block TemperatureConst "Constant signal of type Temperature"
     parameter Types.Temperature k "Constant Temperature output value";
          RealIO.TemperatureOutput y "Temperature constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="temperature",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end TemperatureConst;

    block ThermalConductanceConst "Constant signal of type ThermalConductance"
     parameter Types.ThermalConductance k
          "Constant ThermalConductance output value";
          RealIO.ThermalConductanceOutput y "ThermalConductance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="thermalConductance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end ThermalConductanceConst;

    block TimeConst "Constant signal of type Time"
     parameter Types.Time k "Constant Time output value";
          RealIO.TimeOutput y "Time constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="time",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end TimeConst;

    block VolumeFlowRateConst "Constant signal of type VolumeFlowRate"
     parameter Types.VolumeFlowRate k "Constant VolumeFlowRate output value";
          RealIO.VolumeFlowRateOutput y "VolumeFlowRate constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="volumeFlowRate",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end VolumeFlowRateConst;

    block VolumeConst "Constant signal of type Volume"
     parameter Types.Volume k "Constant Volume output value";
          RealIO.VolumeOutput y "Volume constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="volume",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end VolumeConst;

    block DeprecatedUntypedConstant
        "Deprecated Untyped Constant for automatic conversion from initial versions of Physiolibrary"
      extends Modelica.Icons.ObsoleteModel;
     parameter Real k "Untyped constant output value";
     parameter String varName="";
     parameter String units="1";

          Modelica.Blocks.Interfaces.RealOutput
                                    y "Untyped constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="acceleration",
                      Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text( extent={{-100,-44},{100,-64}},
              lineColor={0,0,0},
                      fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                  textString="%name"),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
                      textString="Const")}));
    end DeprecatedUntypedConstant;
    end Constants;

    package RealIO
      extends Modelica.Icons.Package;

      connector AccelerationInput = input Acceleration
        "input Acceleration as connector"
        annotation (defaultComponentName="acceleration",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Acceleration.
    </p>
    </html>"));
      connector AccelerationOutput = output Acceleration
        "output Acceleration as connector"
        annotation (defaultComponentName="acceleration",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector AmountOfSubstanceInput = input AmountOfSubstance
        "input AmountOfSubstance as connector"
        annotation (defaultComponentName="amountofsubstance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type AmountOfSubstance.
    </p>
    </html>"));
      connector AmountOfSubstanceOutput = output AmountOfSubstance
        "output AmountOfSubstance as connector"
        annotation (defaultComponentName="amountofsubstance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector ConcentrationInput = input Concentration
        "input Concentration as connector"
        annotation (defaultComponentName="concentration",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Concentration.
    </p>
    </html>"));
      connector ConcentrationOutput = output Concentration
        "output Concentration as connector"
        annotation (defaultComponentName="concentration",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector DiffusionPermeabilityInput = input DiffusionPermeability
        "input DiffusionPermeability as connector"
        annotation (defaultComponentName="diffusionmembranepermeability",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type DiffusionMembranePermeability.
    </p>
    </html>"));
      connector DiffusionPermeabilityOutput = output DiffusionPermeability
        "output DiffusionPermeability as connector"
        annotation (defaultComponentName="diffusionmembranepermeability",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector ElectricCurrentInput = input ElectricCurrent
        "input ElectricCurrent as connector"
        annotation (defaultComponentName="electriccurrent",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type ElectricCurrent.
    </p>
    </html>"));
      connector ElectricCurrentOutput = output ElectricCurrent
        "output ElectricCurrent as connector"
        annotation (defaultComponentName="electriccurrent",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector ElectricChargeInput = input ElectricCharge
        "input ElectricCharge as connector"
        annotation (defaultComponentName="electriccharge",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type ElectricCharge.
    </p>
    </html>"));
      connector ElectricChargeOutput = output ElectricCharge
        "output ElectricCharge as connector"
        annotation (defaultComponentName="electriccharge",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector EnergyInput = input Energy "input Energy as connector"
        annotation (defaultComponentName="energy",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Energy.
    </p>
    </html>"));

      connector EnergyOutput = output Energy "output Energy as connector"
        annotation (defaultComponentName="energy",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector HeatInput = input Heat "input Heat as connector"
        annotation (defaultComponentName="heat",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Heat.
    </p>
    </html>"));
      connector HeatOutput = output Heat "output Heat as connector"
        annotation (defaultComponentName="heat",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector HeatFlowRateInput = input HeatFlowRate
        "input HeatFlowRate as connector"
        annotation (defaultComponentName="heatflowrate",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type HeatFlowRate.
    </p>
    </html>"));
      connector HeatFlowRateOutput = output HeatFlowRate
        "output HeatFlowRate as connector"
        annotation (defaultComponentName="heatflowrate",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector HeightInput = input Height "input Height as connector"
        annotation (defaultComponentName="height",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Height.
    </p>
    </html>"));
      connector HeightOutput = output Height "output Height as connector"
        annotation (defaultComponentName="height",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector MassInput = input Mass "input Mass as connector"
        annotation (defaultComponentName="mass",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Mass.
    </p>
    </html>"));

      connector MassOutput = output Mass "output Mass as connector"
        annotation (defaultComponentName="mass",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector MassFlowRateInput = input MassFlowRate
        "input MassFlowRate as connector"
        annotation (defaultComponentName="massflowrate",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type MassFlowRate.
    </p>
    </html>"));

      connector MassFlowRateOutput = output MassFlowRate
        "output MassFlowRate as connector"
        annotation (defaultComponentName="massflowrate",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector MolarFlowRateInput = input MolarFlowRate
        "input MolarFlowRate as connector"
        annotation (defaultComponentName="molarflowrate",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type MolarFlowRate.
    </p>
    </html>"));
      connector MolarFlowRateOutput = output MolarFlowRate
        "output MolarFlowRate as connector"
        annotation (defaultComponentName="molarflowrate",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector OsmolarityInput = input Osmolarity
        "input Concentration as connector"
        annotation (defaultComponentName="osmolarity",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Concentration.
    </p>
    </html>"));
      connector OsmolarityOutput = output Osmolarity
        "output Concentration as connector"
        annotation (defaultComponentName="osmolarity",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector PressureInput = input Pressure "input Pressure as connector"
        annotation (defaultComponentName="pressure",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Pressure.
    </p>
    </html>"));

      connector PressureOutput = output Pressure "output Pressure as connector"
        annotation (defaultComponentName="pressure",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector VolumeInput = input Volume "input Volume as connector"
        annotation (defaultComponentName="volume",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));

      connector VolumeOutput = output Volume "output Volume as connector"
        annotation (defaultComponentName="volume",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector VolumeFlowRateInput = input VolumeFlowRate
        "input VolumeFlowRate as connector"
        annotation (defaultComponentName="volumeflowrate",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type VolumeFlowRate.
    </p>
    </html>"));

      connector VolumeFlowRateOutput = output VolumeFlowRate
        "output VolumeFlowRate as connector"
        annotation (defaultComponentName="volumeflowrate",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector TemperatureInput = input Temperature
        "input Temperature as connector"
        annotation (defaultComponentName="temperature",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Temperature.
    </p>
    </html>"));

      connector TemperatureOutput = output Temperature
        "output Temperature as connector"
        annotation (defaultComponentName="temperature",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector TimeInput = input Time "input Time as connector"
        annotation (defaultComponentName="time",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Time.
    </p>
    </html>"));
      connector TimeOutput = output Time "output Time as connector"
        annotation (defaultComponentName="time",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector ThermalConductanceInput = input ThermalConductance
        "input ThermalConductance as connector"
        annotation (defaultComponentName="thermalconductance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type ThermalConductance.
    </p>
    </html>"));

      connector ThermalConductanceOutput = output ThermalConductance
        "output ThermalConductance as connector"
        annotation (defaultComponentName="thermalconductance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector ElectricPotentialInput = input ElectricPotential
        "input ElectricPotential as connector"
        annotation (defaultComponentName="electricpotential",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type ElectricPotential.
    </p>
    </html>"));

      connector ElectricPotentialOutput = output ElectricPotential
        "output ElectricPotential as connector"
        annotation (defaultComponentName="electricpotential",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector FractionInput = input Fraction "input Fraction as connector"
        annotation (defaultComponentName="fraction",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Fraction.
    </p>
    </html>"));

      connector FractionOutput = output Fraction "output Fraction as connector"
        annotation (defaultComponentName="fraction",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector FrequencyInput = input Frequency "input Frequency as connector"
        annotation (defaultComponentName="frequency",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Frequency.
    </p>
    </html>"));

      connector FrequencyOutput = output Frequency
        "output Frequency as connector"
        annotation (defaultComponentName="frequency",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Frequency.
  </p>
  </html>"));

      connector OsmoticPermeabilityInput = input OsmoticPermeability
        "input OsmoticPermeability as connector"
        annotation (defaultComponentName="osmoticmembranepermeability",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type OsmoticMembranePermeability.
    </p>
    </html>"));

      connector OsmoticPermeabilityOutput = output OsmoticPermeability
        "output OsmoticPermeability as connector"
        annotation (defaultComponentName="osmoticmembranepermeability",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector HydraulicConductanceInput = input HydraulicConductance
        "input HydraulicConductance as connector"
        annotation (defaultComponentName="hydraulicconductance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicConductance.
    </p>
    </html>"));

      connector HydraulicConductanceOutput = output HydraulicConductance
        "output HydraulicConductance as connector"
        annotation (defaultComponentName="hydraulicconductance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector HydraulicComplianceInput = input HydraulicCompliance
        "input HydraulicCompliance as connector"
        annotation (defaultComponentName="hydrauliccompliance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicCompliance.
    </p>
    </html>"));

      connector HydraulicComplianceOutput = output HydraulicCompliance
        "output HydraulicCompliance as connector"
        annotation (defaultComponentName="hydrauliccompliance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector DensityInput =input Density "input Density as connector"
        annotation (defaultComponentName="density",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));
      connector DensityOutput =output Density "output Density as connector"
        annotation (defaultComponentName="density",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector HydraulicInertanceInput = input HydraulicInertance
        "input HydraulicInertance as connector"
        annotation (defaultComponentName="hydraulicinertance",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicInertance.
    </p>
    </html>"));

      connector HydraulicInertanceOutput = output HydraulicInertance
        "output HydraulicInertance as connector"
        annotation (defaultComponentName="hydraulicinertance",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector GasSolubilityInput = input GasSolubility
        "input GasSolubility as connector"
        annotation (defaultComponentName="gassolubility",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type GasSolubility.
    </p>
    </html>"));

      connector GasSolubilityOutput = output GasSolubility
        "output GasSolubility as connector"
        annotation (defaultComponentName="gassolubility",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

      connector SpecificEnergyInput =
                              input SpecificEnergy
        "input SpecificEnergy as connector"
        annotation (defaultComponentName="specificEnergy",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));
      connector SpecificEnergyOutput =
                               output SpecificEnergy
        "output SpecificEnergy as connector"
        annotation (defaultComponentName="specificEnergy",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      connector SpecificHeatCapacityInput =
                              input SpecificHeatCapacity
        "input SpecificHeatCapacity as connector"
        annotation (defaultComponentName="specificHeatCapacity",
        Icon(graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)},
             coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
        Diagram(coordinateSystem(
              preserveAspectRatio=true, initialScale=0.2,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{0,50},{100,0},{0,-50},{0,50}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid), Text(
                extent={{-10,85},{-10,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
    <p>
    Connector with one input signal of type Volume.
    </p>
    </html>"));
      connector SpecificHeatCapacityOutput =
                               output SpecificHeatCapacity
        "output SpecificHeatCapacity as connector"
        annotation (defaultComponentName="specificHeatCapacity",
        Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,100},{100,0},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={Polygon(
                points={{-100,50},{0,0},{-100,-50},{-100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{30,110},{30,60}},
                lineColor={0,0,127},
                textString="%name")}),
          Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));

    end RealIO;

      expandable connector BusConnector
      "Empty control bus that is adapted to the signals connected to it"

      annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.2), graphics={
              Rectangle(
                extent={{-20,2},{20,-2}},
                lineColor={255,204,51},
                lineThickness=0.5),
              Polygon(
                points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{
                    -80,-40},{-100,30},{-80,50}},
                lineColor={0,0,0},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-65,25},{-55,15}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-5,25},{5,15}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{55,25},{65,15}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-35,-15},{-25,-25}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{25,-15},{35,-25}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.2), graphics={
              Polygon(
                points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,
                    -20},{-50,15},{-40,25}},
                lineColor={0,0,0},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-32.5,7.5},{-27.5,12.5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-2.5,12.5},{2.5,7.5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{27.5,12.5},{32.5,7.5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-17.5,-7.5},{-12.5,-12.5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{12.5,-7.5},{17.5,-12.5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,70},{150,40}},
                lineColor={0,0,0},
                textString="%name")}),
          Documentation(info="<html>
<p>
This connector defines the \"expandable connector\" ControlBus that
is used as bus in the HuMod model.
Note, this connector is \"empty\". When using it, the actual content is
constructed by the signals connected to this bus.
</p>
</html>"));
      /*
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
          {100,100}}), graphics={Rectangle(
        extent={{-20,2},{22,-2}},
        lineColor={0,0,255},
        lineThickness=0.5)}),
    ));
*/
      end BusConnector;

    type Energy = Modelica.SIunits.Energy(displayUnit="kcal", nominal=4186.8);
    type Time = Modelica.SIunits.Time(displayUnit="min", nominal=60);
    type Frequency = Modelica.SIunits.Frequency(displayUnit="1/min");

    type Mass = Modelica.SIunits.Mass(displayUnit="g", nominal=1e-3);
    type MassFlowRate = Modelica.SIunits.MassFlowRate(displayUnit="mg/min", nominal=(1e-6)/60);
    type Density = Modelica.SIunits.Density(displayUnit="kg/l", nominal=1e3);

    type Height = Modelica.SIunits.Height(displayUnit="cm", nominal=1e-2);
    type Acceleration = Modelica.SIunits.Acceleration(displayUnit="m/s2", nominal=1);

    type Pressure =  Modelica.SIunits.Pressure(displayUnit="mmHg", nominal=133.322387415);
    type Volume =  Modelica.SIunits.Volume(displayUnit="ml", nominal=1e-6);
    type VolumeFlowRate = Modelica.SIunits.VolumeFlowRate(displayUnit="ml/min", nominal=(1e-6)/60);

    type Concentration = Modelica.SIunits.Concentration (displayUnit="mmol/l");
    type AmountOfSubstance = Modelica.SIunits.AmountOfSubstance (displayUnit="mmol");
    type MolarFlowRate = Modelica.SIunits.MolarFlowRate(displayUnit="mmol/min");

    type Osmolarity = Modelica.SIunits.Concentration (displayUnit="mosm/l", nominal=1);

    type Heat = Modelica.SIunits.Heat(displayUnit="kcal", nominal=4186800); //needed to heat 1 liter of water by 1 degC
    type Temperature = Modelica.SIunits.Temperature(displayUnit="degC", nominal=1);
    type HeatFlowRate = Modelica.SIunits.HeatFlowRate(displayUnit="kcal/min", nominal=4186.8/60);
    type ThermalConductance = Modelica.SIunits.ThermalConductance(displayUnit="kcal/(min.K)", nominal=4186.8/60);
    type SpecificHeatCapacity = Modelica.SIunits.SpecificHeatCapacity(displayUnit="kcal/(kg.K)", nominal=4186.8);
    type SpecificEnergy = Modelica.SIunits.SpecificEnergy(displayUnit="kcal/kg", nominal=4186.8)
      "vaporization, ..";

    type ElectricPotential = Modelica.SIunits.ElectricPotential(displayUnit="mV", nominal=1e-3);
    type ElectricCharge = Modelica.SIunits.ElectricCharge(displayUnit="meq", nominal=96.4853365);
    type VolumeDensityOfCharge =
                          Modelica.SIunits.VolumeDensityOfCharge(displayUnit="meq/l", nominal=0.0964853365);
    type ElectricCurrent = Modelica.SIunits.ElectricCurrent(displayUnit="meq/min", nominal=1.60808894);

  //unknown units in Standard Modelica Library 3.2
    type Fraction = Real(final quantity="Fraction",final unit="1", displayUnit="%", nominal=1e-2);

    type pH =       Real(final quantity="pH",final unit="1",final displayUnit="1", nominal=7);
    type OsmoticPermeability = Real(final quantity="OsmoticPermeability",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60));
    type DiffusionPermeability = Real(final quantity="DiffusionPermeability", final unit="m3/s", displayUnit="ml/min", nominal=(1e-6)/60);

    type HydraulicConductance = Real(final quantity="HydraulicConductance",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60));
    type HydraulicResistance = Real(final quantity="HydraulicConductance",final unit="(Pa.s)/m3", displayUnit="(mmHg.min)/ml", nominal=(1e+6)*(133.322387415)*60);

    type HydraulicCompliance =  Real(final quantity="HydraulicCompliance",final unit="m3/Pa", displayUnit="ml/mmHg", nominal=(1e-6)/(133.322387415));
    type HydraulicElastance = Real(final quantity="HydraulicElastance",final unit="Pa/m3", displayUnit="mmHg/ml", nominal=(133.322387415)/(1e-6));

    type HydraulicInertance =  Real(final quantity="HydraulicInertance",final unit="Pa.s2/m3", displayUnit="mmHg.min2/ml", nominal=((133.322387415)*(60^2)/(1e-6)));

    type GasSolubility = Real(final quantity="GasSolubility", final unit="(mol/m3)/(mol/m3)", displayUnit="(mmol/l)/kPa at 25degC", nominal=1e-2)
      "Gas solubility in liquid";

    partial block AbstractReal
      "Abstract parameter or the value at defined time (final) of the model - can be input or output parameter"

      replaceable type T=Real
       constrainedby Real "Real type with units"
       annotation (Dialog(group="Simple type",tab="Types"));

      parameter T k(fixed=true) = 0 "Value"
      annotation (Dialog(group="Parameters"));

      parameter String varName=
      "Stored name"
      annotation (Dialog(group="Value I/O",tab="IO"));
                               //getInstanceName()
      parameter String storeUnit="" "Stored units"
      annotation (Dialog(group="Value I/O",tab="IO"));
    end AbstractReal;

    package RealExtension
      extends Modelica.Icons.VariantsPackage;
          block Parameter "Generate constant signal in SI units from file"
            extends AbstractReal;

            replaceable package IO = Physiolibrary.Types.RealExtension.IO (
              redeclare type Type = T) "Real type with units"
               annotation (Dialog(group="Packages",tab="Types"));

            IO.Output y "Connector of Real output signal"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = k;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end Parameter;

          block InputParameter "Generate constant signal in SI units from file"
            extends AbstractReal(                   k = Utilities.readReal( varName, storeUnit));

            replaceable package IO = Physiolibrary.Types.RealExtension.IO (
              redeclare type Type = T)
                           annotation (Dialog(group="Real type with units",tab="Types"));
            replaceable package Utilities = Physiolibrary.Types.FilesUtilities
          constrainedby Physiolibrary.Types.Utilities
                           annotation (Dialog(group="Functions to read or store",tab="Types"));

            IO.Output y "Connector of Real output signal"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = k;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end InputParameter;

          block OutputFinal "Save variable to Output"
        import Physiolibrary;
            extends Physiolibrary.Types.AbstractReal;
            replaceable package IO = Physiolibrary.Types.RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = Physiolibrary.Types.FilesUtilities
                                                           constrainedby
          Physiolibrary.Types.Utilities;
            IO.Input              y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

          equation
            when terminal() then
              Utilities.writeReal(
                varName,
                y,
                storeUnit);
            end when;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputFinal;

          block OutputComparison "Save variable comparison to file"
        import Physiolibrary;
            extends Physiolibrary.Types.AbstractReal(
                                                    k=Utilities.readReal(varName,storeUnit));
            replaceable package IO = Physiolibrary.Types.RealExtension.IO (
                                              redeclare type Type=T);
            replaceable package Utilities = Physiolibrary.Types.FilesUtilities
                                                           constrainedby
          Physiolibrary.Types.Utilities
             annotation (Dialog(group="Functions to read or store",tab="Types"));

            Modelica.Blocks.Interfaces.RealInput
                                  y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

      protected
            parameter T initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when terminal() then
             Utilities.writeComparison(
              varName,
              k,
              initialValue,
              y,
              storeUnit);
            end when;

              annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputComparison;

      package IO
        extends Modelica.Icons.BasesPackage;

        replaceable type Type=Real;
        connector Input = input Type "input connector"
          annotation (defaultComponentName="i",
          Icon(graphics={Polygon(
                  points={{-100,100},{100,0},{-100,-100},{-100,100}},
                  lineColor={0,0,127},
                  fillColor={0,0,127},
                  fillPattern=FillPattern.Solid)},
               coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
          Diagram(coordinateSystem(
                preserveAspectRatio=true, initialScale=0.2,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={Polygon(
                  points={{0,50},{100,0},{0,-50},{0,50}},
                  lineColor={0,0,127},
                  fillColor={0,0,127},
                  fillPattern=FillPattern.Solid), Text(
                  extent={{-10,85},{-10,60}},
                  lineColor={0,0,127},
                  textString="%name")}),
            Documentation(info="<html>
    <p>
    Connector with one input signal of type Energy.
    </p>
    </html>"));

        connector Output = output Type "output connector"
          annotation (defaultComponentName="o",
          Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={Polygon(
                  points={{-100,100},{100,0},{-100,-100},{-100,100}},
                  lineColor={0,0,127},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={Polygon(
                  points={{-100,50},{0,0},{-100,-50},{-100,50}},
                  lineColor={0,0,127},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid), Text(
                  extent={{30,110},{30,60}},
                  lineColor={0,0,127},
                  textString="%name")}),
            Documentation(info="<html>
  <p>
  Connector with one output signal of type Real.
  </p>
  </html>"));
      end IO;
    end RealExtension;

    package RealTypes
      extends Modelica.Icons.BasesPackage;
      import Physiolibrary;

        replaceable block Variable = RealExtension.Parameter constrainedby
        AbstractReal;

        block Energy = Variable(redeclare type T=Physiolibrary.Types.Energy, storeUnit="kcal");
        block Time = Variable(redeclare type T=Physiolibrary.Types.Time, storeUnit="min");
        block Frequency = Variable(redeclare type T=
              Physiolibrary.Types.Frequency,                                       storeUnit="1/min");

        block Mass = Variable(redeclare type T=Physiolibrary.Types.Mass, storeUnit="g");
        block MassFlowRate = Variable(redeclare type T =
              Physiolibrary.Types.MassFlowRate, storeUnit="g/min");
        block Density = Variable(redeclare type T=Physiolibrary.Types.Density, storeUnit="kg/l");

        block Height = Variable(redeclare type T=Physiolibrary.Types.Height, storeUnit="cm");
        block Acceleration = Variable(redeclare type T =
              Physiolibrary.Types.Acceleration, storeUnit="m/s");

        block Pressure = Variable(redeclare type T=Physiolibrary.Types.Pressure,storeUnit="mmHg");
        block Volume = Variable(redeclare type T=Physiolibrary.Types.Volume,storeUnit="ml");
        block VolumeFlowRate = Variable(redeclare type T =
              Physiolibrary.Types.VolumeFlowRate,storeUnit="ml/min");

        block Concentration = Variable(redeclare type T =
              Physiolibrary.Types.Concentration, storeUnit="mmol/l");
        block AmountOfSubstance = Variable(redeclare type T =
              Physiolibrary.Types.AmountOfSubstance,storeUnit="mmol");
        block MolarFlowRate = Variable(redeclare type T =
              Physiolibrary.Types.MolarFlowRate,storeUnit="mmol/min");

        block Heat = Variable(redeclare type T=Physiolibrary.Types.Heat,storeUnit="kcal");
        block Temperature = Variable(redeclare type T =
            Physiolibrary.Types.Temperature,                             k=310.15, storeUnit="degC");
        block HeatFlowRate = Variable(redeclare type T =
              Physiolibrary.Types.HeatFlowRate,storeUnit="kcal/min");
        block ThermalConductance = Variable(redeclare type T =
              Physiolibrary.Types.ThermalConductance, storeUnit="kcal/(min.K)");
        block SpecificHeatCapacity = Variable(redeclare type T =
              Physiolibrary.Types.SpecificHeatCapacity,storeUnit="kcal/(kg.K)");
        block SpecificEnergy = Variable(redeclare type T =
              Physiolibrary.Types.SpecificEnergy,storeUnit="kcal/kg");

        block ElectricPotential = Variable(redeclare type T =
              Physiolibrary.Types.ElectricPotential,storeUnit="mV");
        block ElectricCharge = Variable(redeclare type T =
              Physiolibrary.Types.ElectricCharge,storeUnit="meq");
        block VolumeDensityOfCharge =
                               Variable(redeclare type T =
              Physiolibrary.Types.VolumeDensityOfCharge,storeUnit="meq/l");
        block ElectricCurrent = Variable(redeclare type T =
              Physiolibrary.Types.ElectricCurrent,storeUnit="meq/min");

        block Fraction = Variable(redeclare type T=Physiolibrary.Types.Fraction,storeUnit="1");

        block pH =       Variable(redeclare type T=Physiolibrary.Types.pH,storeUnit="1");
        block OsmoticPermeability = Variable(redeclare type T =
              Physiolibrary.Types.OsmoticPermeability,storeUnit="ml/(mmHg.min)");
        block DiffusionPermeability =         Variable(redeclare type T =
              Physiolibrary.Types.DiffusionPermeability,storeUnit="ml/min");

        block HydraulicConductance = Variable(redeclare type T =
              Physiolibrary.Types.HydraulicConductance,storeUnit="ml/(mmHg.min)");
        block HydraulicCompliance = Variable(redeclare type T =
              Physiolibrary.Types.HydraulicCompliance,storeUnit="ml/mmHg");
        block HydraulicInertance = Variable(redeclare type T =
              Physiolibrary.Types.HydraulicInertance,storeUnit="mmHg.min2/ml");

        block GasSolubility = Variable(redeclare type T =
              Physiolibrary.Types.GasSolubility,storeUnit="(mmol/l)/kPa at 25degC");

        block Osmolarity =    Variable(redeclare type T =
              Physiolibrary.Types.Osmolarity,storeUnit="mosm/l");
    end RealTypes;

    partial block AbstractBoolean
      "Abstract parameter or the value at defined time of the model - can be input or output parameter"

      parameter String varName="" "Name of stored variable"
      annotation (Dialog(group="Value I/O",tab="IO"));
                                  //getInstanceName()
       parameter Boolean k(fixed=true)=false "Value"
        annotation (Dialog(group="Parameters"));

    end AbstractBoolean;

    package BooleanExtension
      extends Modelica.Icons.VariantsPackage;
          block Parameter "Read constant boolean signal"
            extends Physiolibrary.Types.AbstractBoolean;

            Modelica.Blocks.Interfaces.BooleanOutput y
          "Connector of Real output signal"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = k;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end Parameter;

          block InputParameter "Read constant boolean signal"
            extends Physiolibrary.Types.AbstractBoolean(k=
              Utilities.readBoolean(varName));

            Modelica.Blocks.Interfaces.BooleanOutput y
          "Connector of Real output signal"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));
            replaceable package Utilities = Physiolibrary.Types.Utilities;

          equation
            y = k;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end InputParameter;

          block OutputFinal "Save boolean value to file"
           extends Physiolibrary.Types.AbstractBoolean;

            replaceable package Utilities = Physiolibrary.Types.Utilities;

            Modelica.Blocks.Interfaces.BooleanInput
                                                  y
          "Connector of Real output signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-100,-10},{-80,10}})));

          equation
            when terminal() then
               Utilities.writeBoolean(varName,y);
            end when;

            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputFinal;

          block OutputComparison "Save variable comparison to file"
        import Physiolibrary;
            extends Physiolibrary.Types.AbstractBoolean(
                                                    k=Utilities.readBoolean(varName));
            replaceable package Utilities = Physiolibrary.Types.Utilities
             annotation (Dialog(group="Functions to read or store",tab="Types"));

            Modelica.Blocks.Interfaces.BooleanInput
                                  y "Connector of Real input signal"
              annotation (Placement(transformation(extent={{-100,-10},{-80,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));

      protected
            parameter Boolean initialValue(fixed=false);
          initial equation
            initialValue = y;
          equation
            when terminal() then
             Utilities.writeBooleanComparison(
              varName,
              k,
              initialValue,
              y);
            end when;

              annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
              initialScale=0.04), graphics={Rectangle(
                extent={{-100,20},{100,-20}},
                lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}), Text(
                extent={{-100,-10},{100,10}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%varName")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
          end OutputComparison;
    end BooleanExtension;

    package Utilities "Value input/output/test support"
      extends Modelica.Icons.BasesPackage;
      replaceable function readReal "Read the real value of parameter from file with lines in format:
  <parameterName>
  <value> <unit>"
        extends Modelica.Icons.Function;

        input String name "Name of parameter";
        input String storeUnit "Prefered units to store variable value";

        output Real value=0 "Actual value of parameter in SI units";
      //algorithm
      end readReal;

      replaceable function readBoolean "Read the boolean value of parameter from file with lines in format:
  <parameterName>
  <value> <unit>"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        output Boolean value "Variable value";
      //algorithm
      end readBoolean;

      replaceable function writeReal "Write the real value to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real value "Variable value";
        input String storeUnit "Prefered units to store variable value";
      //algorithm
      end writeReal;

      replaceable function writeBoolean "Write the boolean value to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Boolean value "Variable value";
      //algorithm
      end writeBoolean;

      replaceable function writeComparison
        "Compare and write the result and the value to file"

        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real defaultValue
          "Original value[in SIunits] to compare with final value";
        input Real initialValue "Initial variable value[in SI units]";
        input Real finalValue "Final variable value[in SI units]";

        input String storeUnit "Prefered units to store variable value";
      //algorithm
      end writeComparison;

      replaceable function writeBooleanComparison
        "Compare and write the result and the value to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Boolean defaultValue
          "Original value[in SIunits] to compare with final value";
        input Boolean initialValue "Initial variable value[in SI units]";
        input Boolean finalValue "Final variable value[in SI units]";
      //algorithm
      end writeBooleanComparison;
    end Utilities;

    package ZeroUtilities "No input/output/test"
      import Physiolibrary;
      extends Physiolibrary.Types.Utilities;
      extends Modelica.Icons.VariantsPackage;

      redeclare function extends readReal
      algorithm
      end readReal;

      redeclare function extends readBoolean
      algorithm
      end readBoolean;

      redeclare function extends writeReal
      algorithm
      end writeReal;

      redeclare function extends writeBoolean
      algorithm
      end writeBoolean;

      redeclare function extends writeComparison
      algorithm
      end writeComparison;

      redeclare function extends writeBooleanComparison
      algorithm
      end writeBooleanComparison;

    end ZeroUtilities;

    package FilesUtilities "File input/output/test"
      import Physiolibrary;
      extends Physiolibrary.Types.Utilities;
      extends Modelica.Icons.VariantsPackage;

      redeclare function extends readReal
        import Modelica.Utilities.*;

      protected
        String fn;
        String line;
        Integer nextIndex;
        Integer lineLen;
        Integer iline=1;
        Boolean found = false;
        Boolean endOfFile=false;
        String str;
        Real inputValue;
        Integer typeDef;
      algorithm
        fn:="io/input.txt";

        if not Files.exist(fn) then
           Streams.error("readRealParameter(\""+name+"\", \""+ fn + "\")  Error: the file does not exist.\n");
        else

        typeDef:=UnitDerivations.findUnit(storeUnit);

        //Format "<variableName>\n<value><unit>"
        (line, endOfFile) :=Streams.readLine(fn, iline);
        while not found and not endOfFile loop
             if line == name then
                 // name found, get value of "name = value;"
                 (line, endOfFile) :=Streams.readLine(fn, iline+1);
                 lineLen := Strings.length(line);
                 nextIndex:=1;

                 /*
  //Format "<variableName>=<value><unit>"
  while not found and not endOfFile loop
       iline:=iline+1;
       (line, endOfFile) :=Streams.readLine(fn, iline);
       lineLen := Strings.length(line);

       if lineLen>3 then

         nextIndex:=1; //because Coleman does not use the right identifiers, scanIdentifier can not be used :(
         str:=Strings.substring(line,nextIndex,nextIndex);
         while ((nextIndex+1)<lineLen and (not Strings.isEqual(str," ")) and (not Strings.isEqual(str,"=")) and (not Strings.isEqual(str,"\t"))) loop
            nextIndex:=nextIndex+1;
            str:=Strings.substring(line,nextIndex,nextIndex);
         end while;
         str := Strings.substring(line,1,nextIndex-1);

         if str==name then

           nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex);
           nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex+1); //skip '=' and white-spaces before/after
*/

                 (inputValue,nextIndex) := Strings.scanReal(line, nextIndex);
                 nextIndex:=Strings.Advanced.skipWhiteSpace(line,nextIndex);
                 if nextIndex>lineLen then
              if Strings.length(Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
                    typeDef].DisplayUnit)
                                        > 0 then
                Streams.error("No units detected for variable '" + name +
                  "' in file '" + fn + "'. Expected unis are '" +Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
                    typeDef].DisplayUnit
                                       + "'!\n");
                   end if;
                 else
                   str :=Strings.substring(line, Strings.Advanced.skipWhiteSpace(line,nextIndex),  Strings.length(line));
              if str <>Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
                    typeDef].DisplayUnit then
                Streams.error("Units '" + str + "' not expected for variable '"
                   + name + "' in file '" + fn + "'. Expected unis are '" +
                    Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
                    typeDef].DisplayUnit
                                       + "'!\n");
                   end if;
                 end if;
            value := inputValue*Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
                typeDef].Scale
                             +Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
                typeDef].Offset;
                 found := true;
              // end if;  //Format "<variableName>=<value><unit>"

               //Format "<variableName>\n<value><unit>"
               else
               // wrong name, skip lines
                 iline := iline + 2;
                 // read next variable name
                 (line, endOfFile) :=Streams.readLine(fn, iline);

               end if;
           end while;

           if not found then
              Streams.error("Parameter \"" + name + "\" not found in file \"" + fn + "\"\n");
           end if;
         end if;

      end readReal;

      redeclare function extends readBoolean

      algorithm
        value:=(readReal(name,"")>0.005);
      end readBoolean;

      redeclare function extends writeReal "Write the value to file"
        import Modelica.Utilities.*;

      protected
        String fn;
        Integer typeDef "Variable type";

      algorithm
        fn:="io/output.txt";

        if not Files.exist(fn) then
           if not Files.exist("io") then
               Files.createDirectory("io");
           end if;
        end if;

        typeDef:=UnitDerivations.findUnit(storeUnit);

      Streams.print(name + "\n" + String(((value -Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
          typeDef].Offset)
                        /Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
          typeDef].Scale))
                         + " " +Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
          typeDef].DisplayUnit,
                              fn);

      end writeReal;

      redeclare function extends writeBoolean
        import Modelica.Utilities.*;
      protected
        String fn;

      algorithm
        fn:="io/output.txt";

        if not Files.exist(fn) then
           if not Files.exist("io") then
               Files.createDirectory("io");
           end if;
        end if;

        Streams.print( name + "\n" + String(if value then 1 else 0),      fn);

      end writeBoolean;

      redeclare function extends writeComparison
        "Compare and write the result and the value to file"
        import Modelica.Utilities.*;

      protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;
        Integer typeDef "Variable output units";

      algorithm
        fn:="io/comparison.txt";

        if not Files.exist(fn) then
           if not Files.exist("output") then
               Files.createDirectory("output");
           end if;
        end if;

        typeDef:=UnitDerivations.findUnit(storeUnit);

      outputDefaultValue := ((defaultValue -Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
          typeDef].Offset)
                        /Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
          typeDef].Scale);
      outputInitialValue := ((initialValue -Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
          typeDef].Offset)
                        /Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
          typeDef].Scale);
      outputFinalValue := ((finalValue -Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
          typeDef].Offset)
                        /Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
          typeDef].Scale);

      Streams.print((if (abs(outputDefaultValue) > Modelica.Constants.eps) then
        String(abs((outputFinalValue - outputDefaultValue)/outputDefaultValue))
         else "Zero vs. " + String(outputFinalValue)) + " ; " + name +
        " : default=" + String(outputDefaultValue) + " " +Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
          typeDef].DisplayUnit
                             + ", initial=" + String(outputInitialValue) + " " +
          Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[typeDef].DisplayUnit
         + ", final=" + String(outputFinalValue) + " " +Physiolibrary.Types.FilesUtilities.UnitDerivations.RealTypeDef[
          typeDef].DisplayUnit,
                              fn);

      end writeComparison;

      redeclare function extends writeBooleanComparison
        "Compare and write the result and the value to file"
        import Modelica.Utilities.*;

      protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;
      algorithm
        fn:="io/comparison.txt";

        if not Files.exist(fn) then
           if not Files.exist("output") then
               Files.createDirectory("output");
           end if;
        end if;
         if (defaultValue==finalValue) then

             Streams.print("0 ; "+ name + " : default=" + String(if defaultValue then 1 else 0) +", initial=" + String(if initialValue then 1 else 0) + ", final=" + String(if finalValue then 1 else 0), "differences.txt");
           else
             Streams.print("! ; " + name + " : default=" + String(if defaultValue then 1 else 0) +", initial=" + String(if initialValue then 1 else 0)+ ", final=" + String(if finalValue then 1 else 0), "differences.txt");
         end if;

      end writeBooleanComparison;

      package UnitDerivations

       function findUnit
         input String unitToFind "display unit to find in RealTypeDef";
         output Integer typeDef "index in RealTypeDef";
       algorithm
         typeDef:=0;
         for i in 1:size(RealTypeDef,1) loop
           if RealTypeDef[i].DisplayUnit == unitToFind then
             typeDef:=i;
             break;
           end if;
         end for;
         if typeDef==0 then
            Modelica.Utilities.Streams.error("Unit \"" + unitToFind + "\" not defined in FileUtilities.UnitDerivations.RealTypeRecord.\n");
         end if;
       end findUnit;

       record RealTypeRecord "The Real Type definition"
         parameter String Quantity="" "Quantity";
         parameter String Unit="1" "SI unit";
         parameter String DisplayUnit="1" "Display unit";

         parameter Real Scale=1
            "Scale from display unit to SI unit such that x <d> = x*s+o <u>";
         parameter Real Offset=0
            "Offset from display unit to SI unit such that x <d> = x*s+o <u>";

         parameter Real Min=-Modelica.Constants.inf "minimal value";
         parameter Real Max=+Modelica.Constants.inf; // Inf denotes a large value
         parameter Real Start = Offset; // Initial value
         parameter Real Nominal = Scale; // Nominal value
         parameter StateSelect StateSelection = StateSelect.default;
       end RealTypeRecord;

        constant RealTypeRecord RealTypeDef[:]={RealTypeRecord(),
            RealTypeRecord(),RealTypeRecord(
              Quantity="Energy",
              Unit="J",
              DisplayUnit="kcal",
              Scale=4186.8),RealTypeRecord(
              Quantity="Time",
              Unit="s",
              DisplayUnit="min",
              Scale=1/60),RealTypeRecord(
              Quantity="Mass",
              Unit="kg",
              Min=0,
              DisplayUnit="g",
              Scale=1e-3),RealTypeRecord(
              Quantity="MassFlowRate",
              Unit="kg/s",
              DisplayUnit="mg/min",
              Scale=(1e-6)*60),RealTypeRecord(
              Quantity="Density",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="kg/l",
              Scale=1e3),RealTypeRecord(
              Quantity="Length",
              Unit="m",
              DisplayUnit="cm",
              Scale=1e-2),RealTypeRecord(
              Quantity="Acceleration",
              Unit="m/s2",
              DisplayUnit="m/s2",
              Scale=1),RealTypeRecord(
              Quantity="Pressure",
              Unit="Pa",
              DisplayUnit="mmHg",
              Scale=101325/760),RealTypeRecord(
              Quantity="Volume",
              Unit="m3",
              DisplayUnit="ml",
              Scale=1e-6),RealTypeRecord(
              Quantity="VolumeFlowRate",
              Unit="m3/s",
              DisplayUnit="ml/min",
              Scale=(1e-6)*60),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="mmol/l",
              Scale=1,
              Start=1),RealTypeRecord(
              Quantity="AmountOfSubstance",
              Unit="mol",
              DisplayUnit="mmol",
              Scale=1e-3),RealTypeRecord(
              Quantity="MolarFlowRate",
              Unit="mol/s",
              DisplayUnit="mmol/min",
              Scale=(1e-3)/60),RealTypeRecord(
              Quantity="Energy",
              Unit="J",
              DisplayUnit="kcal",
              Scale=4186.8),RealTypeRecord(
              Quantity="ThermodynamicTemperature",
              Unit="K",
              DisplayUnit="degC",
              Scale=1,
              Offset=273.15,
              Start=310.15),RealTypeRecord(
              Quantity="Power",
              Unit="W",
              DisplayUnit="kcal/min",
              Scale=4186.8*60),RealTypeRecord(
              Quantity="ThermalConductance",
              Unit="W/K",
              DisplayUnit="kcal/(min.degC)",
              Scale=4186.8*60),RealTypeRecord(
              Quantity="SpecificHeatCapacity",
              Unit="J/(kg.K)",
              DisplayUnit="kcal/(degC.kg)",
              Scale=4186.8),RealTypeRecord(
              Quantity="SpecificEnergy",
              Unit="J/kg",
              DisplayUnit="kcal/kg",
              Scale=4186.8),RealTypeRecord(
              Quantity="ElectricPotential",
              Unit="V",
              DisplayUnit="mV",
              Scale=1e-3),RealTypeRecord(
              Quantity="ElectricCharge",
              Unit="C",
              DisplayUnit="mEq",
              Scale=(1e-3)*(9.64853399*10^4)),RealTypeRecord(
              Quantity="ElectricCurrent",
              Unit="A",
              DisplayUnit="mEq/min",
              Scale=(1e-3)*(9.64853399*10^4)*60),RealTypeRecord(
              Quantity="Fraction",
              Unit="1",
              DisplayUnit="%",
              Scale=1e-2),RealTypeRecord(
              Quantity="OsmoticMembramePermeability",
              Unit="m6/(mol.s)",
              DisplayUnit="ml/(mOsmol.min)",
              Scale=(1e-6)/((1e-3)*60)),RealTypeRecord(
              Quantity="DiffusionMembranePermeability",
              Unit="m3/s",
              DisplayUnit="ml/min",
              Scale=(1e-3)*60),RealTypeRecord(
              Quantity="HydraulicConductance",
              Unit="m3/(Pa.s)",
              DisplayUnit="ml/(mmHg.min)",
              Scale=(1e-6)/((101325/760)*60)),RealTypeRecord(
              Quantity="HydraulicCompliance",
              Unit="m3/Pa",
              DisplayUnit="ml/mmHg",
              Scale=(1e-6)/(101325/760)),RealTypeRecord(
              Quantity="HydraulicInertance",
              Unit="Pa.s2/m3",
              DisplayUnit="mmHg.min2/ml",
              Scale=((101325/760)*(60^2)/(1e-6))),RealTypeRecord(
              Quantity="GasSolubility",
              Unit="mol/(m3.Pa)",
              DisplayUnit="mmol/(l.mmHg)",
              Scale=(1e-3)/((1e-3)*(101325/760))),RealTypeRecord(
              Quantity="Osmolarity",
              Unit="mol",
              DisplayUnit="mOsm",
              Scale=(1e-3))}
          "All defined Real types - units, displayUnits, conversions, nominals";

      end UnitDerivations;
      annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",     info="<html>
<p>During the creation and debugging of huge integrated models it is necessary to easily define consistent input, output and test sets of all output variables for some subsystems. Let&apos;s imagine that we have a model composed only of subsystems that converge from some constant inputs to constant outputs. It should be possible to substitute each main subsystem for its chosen constant output values as parameters. Comparing the model with these parametric values and the original subsystem can show the wrong part of the simulation. </p>
<p>For example in the huge HumMod model it is necessary to debug smaller parts separately. These tools could be use, because HumMod is the type of constant-converged model. Each subsystem in the first level has the constant input values set for its output variables. Simulating, for example, the cardiovascular subsystem is possible by creating the high-level system with the original cardiovascular subsystem, but with a constant metabolic, constant thermoregulation, constant hormonal, constant water, constant proteins, constant gases, constant electrolytes and constant status subsystem. </p>
<p>Because the number of output variables for each subsytem changes during development, it is a good idea to have only one list for each subsystem. And generating consistent sets to store, restore, compare initial and final values is possible by the same pattern as presented in the package Types.Example. In this package it is also possible to define a customized &nbsp;way to save and load the variables that connect subsystems together. For this purpose, one has to redeclare the package Types.Utilities with simple functions for reading and writing values, such as is done in the default package FileUtilities. </p>
</html>"));
    end FilesUtilities;

    type SimulationType = enumeration(
        NoInit "Use start values only as a guess of state values",
        NormalInit "Initialization by start values",
        ReadInit "Initialization by function Utilities.readReal('state name')",

        InitSteadyState
          "Initialization in Steady State (initial derivations are zeros)",
        SteadyState "Steady State = Derivations are zeros during simulation")
      "Initialization or Steady state options (to determine model type before simulating)"
        annotation (Evaluate=true);
    annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",   info="<html>
<p>The main problem of medical research, articles, and experiments is using obscure units from medicine, pharmacology, biology and non-physics disciplines. The Physiolibrary fulfills the Modelica ideal of using SI units as the main unit for each variable, and the previously described physiological units are also implemented as the displayUnits for each variable. Using these displayUnits the user sets and sees the &QUOT;physiological&QUOT; values. The implementation can also be joined to any unit-correct Modelica models and physical equations without crashing due to unit incompatibilities. The unit support of Physiolibrary is so strong that you even can chose the right unit-typed &ldquo;input real&rdquo;/&rdquo;output real&rdquo; from the library package Types.RealIO. As can be expected, only the non-specific packages States and Blocks in the Physiolibrary have variables without units.</p>
</html>"));
  end Types;

  package Blocks "Base Signal Blocks Library"
    extends Modelica.Icons.Package;
    package Math "Modelica.Math extension"
      extends Modelica.Icons.Package;
      model Integrator "Integrator with support of steady state calculation."
        extends Physiolibrary.SteadyStates.Interfaces.SteadyState(
                                           state_start=y_start);

        parameter Real k=1 "Integrator gain";

        parameter Real y_start=0 "Initial or guess value of output (= state)"
          annotation (Dialog(group="Initialization"));
        extends Modelica.Blocks.Interfaces.SISO;

      equation
        state = y;  //der(y) = k*u
        change = k*u;

        annotation (defaultComponentName="int",
          Documentation(info="<html>
<p>
This blocks computes output <b>y</b> (element-wise) as
<i>integral</i> of the input <b>u</b> multiplied with
the gain <i>k</i>:
</p>
<pre>
         k
     y = - u
         s
</pre>

<p>
It might be difficult to initialize the integrator in steady state.
This is discussed in the description of package
<a href=\"Modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
</p>

</html>
"),       Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
              Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
              Polygon(
                points={{90,-80},{68,-72},{68,-88},{90,-80}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{0,-10},{60,-70}},
                lineColor={192,192,192},
                textString="I"),
              Text(
                extent={{-150,-150},{150,-110}},
                lineColor={0,0,0},
                textString="k=%k"),
              Line(points={{-80,-80},{80,80}}, color={0,0,127}),
              Text(
                extent={{-150,106},{150,146}},
                lineColor={0,0,0},
                textString="%stateName")}),
          Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
              Line(points={{-100,0},{-60,0}}, color={0,0,255}),
              Line(points={{60,0},{100,0}}, color={0,0,255}),
              Text(
                extent={{-36,60},{32,2}},
                lineColor={0,0,0},
                textString="k"),
              Text(
                extent={{-32,0},{36,-58}},
                lineColor={0,0,0},
                textString="s"),
              Line(points={{-46,0},{46,0}}, color={0,0,0})}));
      end Integrator;

          block Add "u + parameter"

            parameter Real k(start=1) "value added to input signal";
      public
            Modelica.Blocks.Interfaces.RealInput u "Input signal connector"
              annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
            Modelica.Blocks.Interfaces.RealOutput y "Output signal connector"
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));

          equation
            y = k+u;
            annotation (defaultComponentName="add",
              Documentation(info="<html>
<p>This block computes output <i>y</i> as <i>sum</i> of offset <i>k</i> with the input <i>u</i>: </p>
<p><code>    y = k + u;</code> </p>
</html>"),    Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Polygon(
                points={{-100,100},{100,40},{100,-40},{-100,-100},{-100,100}},
                lineColor={0,0,127},
                smooth=Smooth.None,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-100,-42},{100,40}},
                lineColor={0,0,0},
                textString="u+%k"),
              Text(
                extent={{-150,140},{150,100}},
                textString="%name",
                lineColor={0,0,255})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-76,38},{0,-34}},
                lineColor={0,0,255},
                textString="k")}));
          end Add;

          block Reciprocal "1 / u"
            extends Modelica.Blocks.Interfaces.SISO;
          equation
            y = 1/u;
            annotation (defaultComponentName="rec",
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Text(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                textString="1/u")}),
              Documentation(info="<html>
<p>This blocks computes the output <b>y</b> as <i>reciprocal value</i> of the input <b>u</b>: </p>
<p><code>    y = 1 / u ;</code> </p>
</html>"));
          end Reciprocal;

          block Exponentiation "b ^ u"

            parameter Boolean useBaseInput = false
          "=true, if exponential base input is used instead of parameter Base"
            annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

            parameter Real Base=10 "exponential base if useBaseInput=false"
              annotation (Dialog(enable=not useBaseInput));

            Modelica.Blocks.Interfaces.RealOutput y
              annotation (Placement(transformation(extent={{100,-10},{120,10}})));
            Modelica.Blocks.Interfaces.RealInput base(start=Base) = b if useBaseInput annotation (Placement(
                  transformation(extent={{-120,40},{-80,80}})));
            Modelica.Blocks.Interfaces.RealInput exponent annotation (Placement(
                  transformation(extent={{-120,-80},{-80,-40}})));

      protected
            Real b "Current exponential base";
          equation
            if not useBaseInput then
              b = Base;
            end if;

            y = b^exponent;
             annotation (defaultComponentName="pow",
              Documentation(info="<html>
<p>y = base^exponent</p>
</html>"),    Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
                  initialScale=0.04), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-100,-40},{100,40}},
                lineColor={0,0,0},
                    textString="b^u")}));
          end Exponentiation;

      block Min "Pass through the smallest signal"
        extends Modelica.Blocks.Interfaces.MISO;
      equation
         y = min(u);
        annotation (defaultComponentName="min", Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                extent={{-90,36},{90,-36}},
                lineColor={160,160,164},
                textString="min()")}),
                                Documentation(info="<html>
<p>
This block computes the output <b>y</b> as <i>minimum</i> of
the Real inputs <b>u[1]</b>,<b>u[2]</b> .. <b>u[nin]</b>:
</p>
<pre>    y = <b>min</b> ( u );
</pre>
</html>
"));
      end Min;

          block Log10AsEffect "min( 0, log10(u) )"

            extends Modelica.Blocks.Interfaces.SISO;
          equation
            y = if u>1 then Modelica.Math.log10(u) else 0;
            annotation (defaultComponentName="logEffect",
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Polygon(
                points={{90,0},{68,8},{68,-8},{90,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-90,0},{68,0}}, color={192,192,192}),
              Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-80,-80},{-80,68}}, color={192,192,192}),
              Text(
                extent={{-44,-56},{94,-80}},
                lineColor={192,192,192},
                textString="max(log10,0)"),
              Line(points={{-100,0},{-80,0},{-78,0},{-74,0},{-76,0},{-74,0},{-72,
                    0},{-69.5,6.08},{-64.7,15.9},{-57.5,26},{-47,36.1},{-31.8,
                    46.1},{-10.1,56},{22.1,66},{68.7,76.1},{80,78}}, color={0,0,
                    0})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Line(points={{-80,80},{-88,80}}, color={192,192,192}),
              Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
              Line(points={{-80,-90},{-80,84}}, color={192,192,192}),
              Text(
                extent={{-65,96},{-38,78}},
                lineColor={160,160,164},
                textString="y"),
              Polygon(
                points={{-80,100},{-86,84},{-74,84},{-80,100}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-100,0},{84,0}}, color={192,192,192}),
              Polygon(
                points={{100,0},{84,6},{84,-6},{100,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-100,0},{-80,0},{-78,0},{-74,0},{-76,0},{-74,0},{-72,
                    0},{-69.5,6.08},{-64.7,15.9},{-57.5,26},{-47,36.1},{-31.8,
                    46.1},{-10.1,56},{22.1,66},{68.7,76.1},{80,78}}, color={0,0,
                    0}),
              Text(
                extent={{70,-3},{90,-23}},
                textString="20",
                lineColor={0,0,255}),
              Text(
                extent={{-78,-1},{-58,-21}},
                textString="1",
                lineColor={0,0,255}),
              Text(
                extent={{-109,72},{-89,88}},
                textString=" 1.3",
                lineColor={0,0,255}),
              Text(
                extent={{-109,-88},{-89,-72}},
                textString="-1.3",
                lineColor={0,0,255}),
              Text(
                extent={{62,30},{90,10}},
                lineColor={160,160,164},
                textString="u")}),
              Documentation(info="<html>
<p>This blocks computes the output <b>y</b> as the <i>base 10 logarithm</i> of the input <b>u </b>if <b>u&GT;1</b> or 0 otherwise </p>
<p><code>    y = if(u&GT;1) <b>log10</b>( u ) else 0;</code></p>
</html>"));
          end Log10AsEffect;

          block Parts "Divide the input value by weights"
            extends Modelica.Blocks.Interfaces.SIMO;
            parameter Real w[nout]=ones(nout) "Optional: weight coefficients";
      protected
           Real coef;
           Real weight[nout];
          equation
            ones(nout)*weight = 1;
            for i in 1:nout loop
                weight[i] = w[i] * coef;
                y[i] = u * weight[i];
            end for;
            annotation (defaultComponentName="parts",
              Documentation(info="<html>
<p>This blocks divide input value u to output array y by weights. The sum of output values is equal to input value <b>u</b>: </p>
<p><code>    u = (w[1]*y[1] + w[2]*y[2] + ... + w[n]*y[n]) / (w[1] + w[2] + ... + w[n]);</code></p>
<p>Example: </p>
<pre>     parameter:   nin = 3;  w=ones(3);

  results in the following equations:

<p><code>     y[1]=u/3,  y[2]=u/3,  y[3]=u/3;</code> </p>
</html>"),    Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={Text(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,0},
                textString="Parts")}));
          end Parts;

          block HomotopyStrongComponentBreaker
        "Break the strong component in normalized signal with independent default constant value"
            extends Modelica.Blocks.Interfaces.SISO;
            parameter Real defaultValue=1;
            parameter Real defaultSlope=0;
          equation
            y = homotopy(u,defaultValue + defaultSlope*(u-defaultValue));
            //y = homotopy(u,defaultValue);
             annotation (defaultComponentName="homotopy",
              Documentation(info="<html>
<p>This blocks should solve the initial strong component problem. In the non-linear-strong-component-cycled place, where the default or mean value of variable is known.</p>
<p>For example the regulation loop L driven by loop-dependent effect E with default value 1:</p>
<p> </p>
<p>E=f(L(E)) can be rewritten to E=f(L( H )), where H is output from this block with input E. </p>
</html>"),    Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
                  initialScale=0.04), graphics={Text(
                extent={{-100,-24},{96,20}},
                lineColor={0,0,255},
                    textString="Homotopy")}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2},
                  initialScale=0.04), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-98,-18},{98,26}},
                lineColor={0,0,255},
                    textString="Homotopy")}));
          end HomotopyStrongComponentBreaker;

    end Math;

    package Interpolation "Empirical Dependence of Two Variables"
      extends Modelica.Icons.Package;
     function Spline "Cubic spline interpolation function"

          input Real[:] x "x coordinations of interpolating points"; //souradnice x souradnice uzlovych bodu
          input Real[:,4] a
          "cubic polynom coefficients of curve segments between interpolating points";                   //parametry kubiky
          input Real xVal "input value of x to calculate y value"; //vstupni hodnota

          output Real yVal "y value at xVal";
     //     output Real outExtra;
      protected
        Integer index "index of segment";
        Integer n "number of interpolating points";

     algorithm
            // Najdi interval, ve kterem se nachazi xVal

            if (xVal <= x[1]) then //kdyz je hodnota xVal pred prvnim uzlovym bodem

              yVal := xVal * a[1,3] + a[1,4]; //pocitam primku

            else
              n := size(x,1); //pocet uzlovych bodu
              if (xVal>=x[n]) then //kdyz je hodnota xVal za poslednim uzlovym bodem

                 yVal := xVal * a[n+1,3] + a[n+1,4];  //pocitam primku

            else
              index := 2;
              while  xVal > x[index] and index < n loop
                index:=index+1;
              end while;
              yVal := ((a[index,1]*xVal + a[index,2])*xVal + a[index,3])*xVal + a[index,4];

              /*
         x1:=x[index-1];
         x2:=x[index];
         y1:=y[index-1];
         y2:=y[index];
         slope1:=slope[index-1];
         slope2:=slope[index];

         a1:=-(-x2*slope2 - x2*slope1 + slope2*x1 + slope1*x1 + 2*y2 - 2*y1)/(x2 - x1)^3;
         a2:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
         a3:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
         a4:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;

         yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
         */
              end if;
           end if;
       //    outExtra := xVal + yVal;
            annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
     end Spline;

     function SplineCoefficients "Cubic spline interpolation coefficients"

          input Real[:] x "x coordinations of interpolating points";
          input Real[:] y "y coordinations of interpolating points";
          input Real[:] slope "slopes at interpolating points";

          output Real[size(x,1)+1,4] a
          "cubic polynom coefficients of curve segments between interpolating points";                               //pocet hodnot ctyrech parametru kubiky je o jeden vic nez pocet bodu

      protected
        Integer n "number of interpolating points";
        Integer i "index of segment";

        Real x1 "previos point";
        Real x2 "current point";

        Real y1 "previous point";
        Real y2 "current point";
        Real slope1 "previous point";
        Real slope2 "current point";

     algorithm
        n := size(x,1);//pocet uzlovych bodu
        for i in 2:n loop //cyklus od 2 do n
              x1:=x[i-1]; //predchozi bod
              x2:=x[i];  //soucasny bod
              y1:=y[i-1]; //predchozi bod
              y2:=y[i]; //soucasny bod
              slope1:=slope[i-1]; //predchozi bod
              slope2:=slope[i]; //soucasny bod
              //vypocty parametru kubiky (od 2 do n) podle souradnic a smernic dvou bodu : y=a[i,4]+a[i,3]*x+a[i,2]*x^2+a[i,1]*x^3
              a[i,1]:=-(-x2*slope2 - x2*slope1 + x1*slope2 + x1*slope1 + 2*y2 - 2*y1)/(x2 - x1)^3;
              a[i,2]:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
              a[i,3]:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
              a[i,4]:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;
        end for;
        a[1,  :] := { 0, 0, slope[1], y[1] - x[1]*slope[1]}; //vypocet prvni sady parametru kubiky  - primky
        a[n+1,:] := { 0, 0, slope[n], y[n] - x[n]*slope[n]}; //vypocet posledni sady parametru kubiky - primky

            annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
     end SplineCoefficients;

          model Curve
        "2D natural cubic interpolation spline defined with (x,y,slope) points"

               parameter Real x[:] "x coordinations of interpolating points";// = data[:, 1] "x coordinations of interpolating points";
               //workaround for openmodelica error: Cyclically dependent constants or parameters found in scope Physiolibrary.Blocks.Interpolation.Curve: {data,x}, {data,y}, {data,slope}.
               //Error: Error occurred while flattening model Physiolibrary.Blocks.Interpolation.Curve
               parameter Real y[:] "y coordinations of interpolating points";// = data[:, 2] "y coordinations of interpolating points";
               parameter Real slope[:] "slopes at interpolating points";// = data[:, 3] "slopes at interpolating points";

               parameter Real[:,3] data = transpose({x,y,slope})
          "Array of interpolating points as {x,y,slope}";

               Modelica.Blocks.Interfaces.RealInput u
                            annotation (Placement(transformation(extent={{-120,
                  -20},{-80,20}})));
               Modelica.Blocks.Interfaces.RealOutput val
                               annotation (Placement(transformation(extent={{80,-20},
                  {120,20}})));

      protected
              parameter Real a[:,:] = SplineCoefficients( data[:, 1],data[:, 2],data[:, 3])
          "cubic polynom coefficients of curve segments between interpolating points";

          equation
            val = Spline(
                  data[:, 1],
                  a,
                  u);

             annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
              graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-70,-76},{-20,-48},{0,12},{34,62},{76,72}},
                color={0,0,127},
                smooth=Smooth.Bezier),
              Line(
                points={{-48,-82},{-48,90},{-48,90}},
                color={0,0,127},
                smooth=Smooth.Bezier,
                arrow={Arrow.None,Arrow.Filled}),
              Line(
                points={{-72,-74},{68,-74},{68,-74}},
                color={0,0,127},
                smooth=Smooth.Bezier,
                arrow={Arrow.None,Arrow.Filled})}));
          end Curve;
    end Interpolation;

    package Factors "Multiplication Effects"
      extends Modelica.Icons.Package;
      model Normalization "effect = u/NormalValue"
       extends Icons.BaseFactorIcon;

       parameter Real NormalValue=1
          "Normal value of u, because y=(u/NormalValue)*yBase.";
       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

        Physiolibrary.Types.Fraction effect;
      equation
        effect = u/NormalValue;
        y=effect*yBase;
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p><h4>y = yBase * u</h4></p>
</html>"));
      end Normalization;

      model DamagedFraction "effect = 1 - DamagedAreaFraction"
       extends Icons.BaseFactorIcon;

       parameter Physiolibrary.Types.Fraction DamagedAreaFraction = 0;

        Physiolibrary.Types.Fraction effect;
      equation
        effect = 1-DamagedAreaFraction;
        y=yBase*effect;
      end DamagedFraction;

      model Spline "effect = spline(data,u)"
       extends Icons.BaseFactorIcon4;
       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

       parameter Real[:,3] data "Array of interpolating points as {x,y,slope}";

        Physiolibrary.Types.Fraction effect
          "Multiplication coeffecient for yBase to reach y";

      protected
          parameter Real a[:,:] = Interpolation.SplineCoefficients(
                                                            data[:, 1],data[:, 2],data[:, 3])
          "Cubic polynom coefficients of curve segments between interpolating points";

      equation
        effect = Interpolation.Spline(
                               data[:, 1],a,u);
        y=effect*yBase;
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Spline;

      model SplineLag "Adapt the effect after interpolation"
       extends Icons.BaseFactorIcon3;
       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));
       parameter Physiolibrary.Types.Time HalfTime(displayUnit="d");
                                                      //Tau(unit="day");
       parameter Real[:,3] data;
        Interpolation.Curve
                     curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
          annotation (Placement(transformation(extent={{-68,58},{-48,78}})));
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-32})));
        Physiolibrary.Blocks.Math.Integrator integrator(y_start=1, k=(
              Modelica.Math.log(2)/HalfTime))
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,12})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,44})));
        Physiolibrary.Types.Fraction effect;
      equation
        //der(effect) = (ln(2)/HalfTime)*(spline(data,u)-effect)
        effect = integrator.y;
        connect(curve.u, u) annotation (Line(
            points={{-68,68},{-83,68},{-83,0},{-80,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(yBase, product.u1) annotation (Line(
            points={{0,20},{0,30},{0,-20},{6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-40}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(curve.val, feedback.u1) annotation (Line(
            points={{-48,68},{-26,68},{-26,52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-26,35},{-26,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-50,-8},{-50,44},{-34,44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, product.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-6,-8},{-6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SplineLag;

      model LagSpline "Adapt the input signal before interpolation"
       extends Icons.BaseFactorIcon5;
       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));
       parameter Physiolibrary.Types.Time HalfTime(displayUnit="min")=3462.468;
                                                                   //40*60/Modelica.Math.log(2);
       parameter Real initialValue = 1; //40;
       parameter Real[:,3] data;
        Interpolation.Curve
                     curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
          annotation (Placement(transformation(extent={{-28,18},{-8,38}})));
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-32})));
        Physiolibrary.Blocks.Math.Integrator integrator(k=(Modelica.Math.log(2)/
              HalfTime), y_start=initialValue)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-50,50})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-50,80})));
        Physiolibrary.Types.Fraction effect;
      equation
        effect = curve.val;
        connect(yBase, product.u1) annotation (Line(
            points={{0,20},{0,30},{0,-20},{6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-40}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-50,71},{-50,62}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-50,39},{-50,28},{-74,28},{-74,80},{-58,80}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.u1, u) annotation (Line(
            points={{-50,88},{-50,94},{-88,94},{-88,0},{-80,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, curve.u) annotation (Line(
            points={{-50,39},{-50,28},{-28,28}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(curve.val, product.u2) annotation (Line(
            points={{-8,28},{-6,28},{-6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>If the input signal u is constant and it is different from starting delayed input d, the middle value between u and d will be reached after HalfTime.</p>
<p>The mathematical background:</p>
<p>d&apos;(t) = k*(u(t) - d(t))       =&GT;       The solution of d(t) in special case, if u(t) is constant at each time t:  d(t)=u+(d(0)-u)*e^(-k*t),  where the definition of HalfTime is  d(HalfTime) = d(0) + (d(0)-u)/2.</p>
</html>"));
      end LagSpline;

      model SplineLagOrZero "LagSpline if not Failed"
       extends Icons.BaseFactorIcon2;
       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
       parameter Physiolibrary.Types.Time HalfTime(displayUnit="d");
       parameter Real[:,3] data;
        Interpolation.Curve
                     curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
          annotation (Placement(transformation(extent={{-76,20},{-56,40}})));
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-50})));
        Physiolibrary.Blocks.Math.Integrator integrator(y_start=1, k=(
              Modelica.Math.log(2)/HalfTime))
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,-6})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,26})));
        Modelica.Blocks.Logical.Switch switch1
          annotation (Placement(transformation(extent={{-36,40},{-16,60}})));
        Modelica.Blocks.Sources.Constant      Constant1(k=0)
          annotation (Placement(transformation(extent={{-82,62},{-62,82}})));
        Modelica.Blocks.Interfaces.BooleanInput
                                              Failed
                            annotation (Placement(transformation(extent={{-120,20},{-80,
                  60}})));
         Physiolibrary.Types.Fraction effect;
      equation
        effect = integrator.y;
        connect(curve.u, u) annotation (Line(
            points={{-76,30},{-87,30},{-87,0},{-100,0}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(yBase, product.u1) annotation (Line(
            points={{0,60},{0,31},{0,-38},{6,-38}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-61},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-14,17},{-14,14.25},{-14,14.25},{-14,11.5},{-14,6},{-14,6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-14,-17},{-14,-26},{-38,-26},{-38,26},{-22,26}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, product.u2) annotation (Line(
            points={{-14,-17},{-14,-26},{-6,-26},{-6,-38}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(switch1.y, feedback.u1) annotation (Line(
            points={{-15,50},{-14,50},{-14,34}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(curve.val, switch1.u3) annotation (Line(
            points={{-56,30},{-54,30},{-54,42},{-38,42}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Constant1.y, switch1.u1) annotation (Line(
            points={{-61,72},{-58,72},{-58,58},{-38,58}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(switch1.u2, Failed) annotation (Line(
            points={{-38,50},{-78,50},{-78,40},{-100,40}},
            color={255,0,255},
            smooth=Smooth.None));
        annotation (        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SplineLagOrZero;
    end Factors;

    annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"));
  end Blocks;
  annotation (preferredView="info",
version="2.1.1",
versionBuild=1,
versionDate="2014-05-02",
dateModified = "2014-05-02 12:30:00Z",
revisionId="",
uses(Modelica(version="3.2.1")),
conversion(
  from(version="BioChem-1.0.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertBioChem_1.0.1_to_Physiolibrary_2.1.mos"),
  from(version="0.4980", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_0.4980_to_2.1.mos"),
  from(version="1.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.0_to_2.1.mos"),
  from(version="1.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.1_to_2.1.mos"),
  from(version="1.2", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.2_to_2.1.mos"),
  from(version="2.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.0_to_2.1.mos")),
  Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>", info="<html>
<ul>
<li>Web pages: <a href=\"http://www.physiolibrary.org\">www.physiolibrary.org</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Overview\">Overview</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Connectors\">Connectors</a></li>
<li><a href=\"modelica://Physiolibrary.UsersGuide.Contact\">Contact</a></li>
</ul>

<p><br/>The origin of this Modelica Physiolibrary was in the first version of our HumMod Golem Edition model implementation, where it was called HumMod.Library. As the successors of Guyton&apos;s Medical Physiology School write, the original HumMod model is &ldquo;The best, most complete, mathematical model of human physiology ever created&rdquo;.</p>
<p>We are also developing many types of smaller physiological models for use in medical education, so it was essential to separate this library from our HumMod Modelica implementation. This separation improves the quality of the next HumMod release and provides a useful Modelica library to modelers in this bioscience.</p>
<p>The library contains only carefully-chosen elementary physiological laws, which are the basis of more complex physiological processes. For example from only two type of blocks (Chemical.ChemicalReaction and Chemical.Substance) it is possible to compose the allosteric transitions or the Michaelis-Menten equation.</p>
<p><br/>Physiology is a very progressive discipline, that examines how the living body works. And it is no surprise that all processes in the human body are driven by physical laws of nature. The great challenge is to marry old empirical experiments with the &ldquo;new&rdquo; physical principles. Many teams and projects in the word deal with this formalization of physiology, for example: Physiome, SBML, EuroPhysiome, VPH, CellML etc. It is our hope that this library helps this unflagging effort of physiologists to exactly describe the processes.</p>
</html>"));
end Physiolibrary;
