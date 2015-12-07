package ModelicaServices
  "(version = 3.2.1, target = \"Dymola\") Models and functions used in the Modelica Standard Library requiring a tool specific implementation"

package Machine

  final constant Real eps=1.e-15 "Biggest number such that 1.0 + eps = 1.0";

  final constant Real inf=1.e+60
  "Biggest Real number such that inf and -inf are representable on the machine";
  annotation (Documentation(info="<html>
<p>
Package in which processor specific constants are defined that are needed
by numerical algorithms. Typically these constants are not directly used,
but indirectly via the alias definition in
<a href=\"modelica://Modelica.Constants\">Modelica.Constants</a>.
</p>
</html>"));
end Machine;
annotation (
  Protection(access=Access.hide),
  preferredView="info",
  version="3.2.1",
  versionDate="2013-01-17",
  versionBuild=1,
  uses(Modelica(version="3.2.1")),
  conversion(
    noneFromVersion="1.0",
    noneFromVersion="1.1",
    noneFromVersion="1.2"),
  Documentation(info="<html>
<p>
This package contains a set of functions and models to be used in the
Modelica Standard Library that requires a tool specific implementation.
These are:
</p>

<ul>
<li> <a href=\"modelica://ModelicaServices.Animation.Shape\">Shape</a>
     provides a 3-dim. visualization of elementary
     mechanical objects. It is used in
<a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape</a>
     via inheritance.</li>

<li> <a href=\"modelica://ModelicaServices.Animation.Surface\">Surface</a>
     provides a 3-dim. visualization of
     moveable parameterized surface. It is used in
<a href=\"modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Surface\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Surface</a>
     via inheritance.</li>

<li> <a href=\"modelica://ModelicaServices.ExternalReferences.loadResource\">loadResource</a>
     provides a function to return the absolute path name of an URI or a local file name. It is used in
<a href=\"modelica://Modelica.Utilities.Files.loadResource\">Modelica.Utilities.Files.loadResource</a>
     via inheritance.</li>

<li> <a href=\"modelica://ModelicaServices.Machine\">ModelicaServices.Machine</a>
     provides a package of machine constants. It is used in
<a href=\"modelica://Modelica.Constants\">Modelica.Constants</a>.</li>

<li> <a href=\"modelica://ModelicaServices.Types.SolverMethod\">Types.SolverMethod</a>
     provides a string defining the integration method to solve differential equations in
     a clocked discretized continuous-time partition (see Modelica 3.3 language specification).
     It is not yet used in the Modelica Standard Library, but in the Modelica_Synchronous library
     that provides convenience blocks for the clock operators of Modelica version &ge; 3.3.</li>
</ul>

<p>
This implementation is targeted for Dymola.
</p>

<p>
<b>Licensed by DLR and Dassault Syst&egrave;mes AB under the Modelica License 2</b><br>
Copyright &copy; 2009-2013, DLR and Dassault Syst&egrave;mes AB.
</p>

<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\"> http://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>

</html>"));
end ModelicaServices;

package Physiolibrary "Modelica library for Physiology (version 2.3.1)"
 extends Modelica.Icons.Package;

  package Hydraulic "Domain with Pressure and Volumetric Flow"
   extends Modelica.Icons.Package;

    package Components
      extends Modelica.Icons.Package;

      model Conductor "Hydraulic resistor, where conductance=1/resistance"
       extends Hydraulic.Interfaces.OnePort;
       extends Icons.HydraulicResistor;

        parameter Boolean useConductanceInput = false
        "=true, if external conductance value is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.HydraulicConductance Conductance=0
        "Hydraulic conductance if useConductanceInput=false"
          annotation (Dialog(enable=not useConductanceInput));

        Types.RealIO.HydraulicConductanceInput cond(start=Conductance)=c if useConductanceInput
                                                         annotation (Placement(
              transformation(extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,60})));
    protected
         Types.HydraulicConductance c;
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
       extends SteadyStates.Interfaces.SteadyState(
                                          state_start=volume_start, storeUnit=
            "ml");
        Interfaces.HydraulicPort_a
                             q_in
                              annotation (Placement(
              transformation(extent={{-14,-14},{14,14}})));
        parameter Types.Volume volume_start = 1e-11 "Volume start value"
           annotation (Dialog(group="Initialization"));                                //default = 1e-5 ml
        Types.Volume excessVolume "Additional volume, that generate pressure";

         parameter Boolean useV0Input = false
        "=true, if zero-pressure-volume input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

         parameter Types.Volume ZeroPressureVolume = 1e-11
        "Maximal volume, that does not generate pressure if useV0Input=false"
          annotation (Dialog(enable=not useV0Input)); //default = 1e-5 ml

          parameter Types.Volume CollapsingPressureVolume = 1e-12
        "Maximal volume, which generate negative collapsing pressure";   //default = 1e-6 ml

         Types.RealIO.VolumeInput zeroPressureVolume(start=ZeroPressureVolume)= zpv if useV0Input
                                                          annotation (Placement(transformation(
                extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,80})));
        parameter Boolean useComplianceInput = false
        "=true, if compliance input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Types.HydraulicCompliance Compliance = 1
        "Compliance if useComplianceInput=false"
          annotation (Dialog(enable=not useComplianceInput));

        Types.RealIO.HydraulicComplianceInput compliance(start=Compliance) = c if useComplianceInput
                                                              annotation (Placement(
              transformation(extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));
        parameter Boolean useExternalPressureInput = false
        "=true, if external pressure input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Types.Pressure ExternalPressure=0
        "External pressure. Set zero if internal pressure is relative to external. Valid only if useExternalPressureInput=false."
          annotation (Dialog(enable=not useExternalPressureInput));
        parameter Types.Pressure MinimalCollapsingPressure = -101325;
        Types.RealIO.PressureInput externalPressure(start=ExternalPressure) = ep if useExternalPressureInput
                                                         annotation (Placement(transformation(
                extent={{-20,-20},{20,20}},
              rotation=270,
              origin={80,80})));

        Types.RealIO.VolumeOutput volume      annotation (Placement(transformation(
                extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100})));

    protected
        Types.Volume zpv;
        Types.HydraulicCompliance c;
        Types.Pressure ep;
        parameter Types.Pressure a=MinimalCollapsingPressure/log(Modelica.Constants.eps);

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
        q_in.pressure =
        smooth(0,
          if noEvent(volume>CollapsingPressureVolume) then
            (excessVolume/c + ep)
          else
            (a*log(max(Modelica.Constants.eps,volume/CollapsingPressureVolume)) + ep));
        //then: normal physiological state
        //else: abnormal collapsing state

        //Collapsing state: the max function prevents the zero or negative input to logarithm, the logarithm brings more negative pressure for smaller volume
        //However this collapsing is limited with numerical precission, which is reached relatively soon.

        state = volume; // der(volume) =  q_in.q;
        change = q_in.q;
       // assert(volume>=-Modelica.Constants.eps,"Collapsing of vessels are not supported!");
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={Text(
                extent={{-318,-140},{160,-100}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2014 - </i>Marek Matejak, Charles University, Prague, Czech Republic</p>
<ul>
<li>initial implementation </li>
</ul>
<p>4.5.2015 - Tom&aacute;&scaron; Kulh&aacute;nek, Charles University, Prague, Czech Republic</p>
<ul>
<li>fix of external pressure</li>
</ul>
</html>",   info="<html>
<p>Pressure can be generated by an elastic tissue surrounding some accumulated volume. Typically there is a threshold volume, below which the relative pressure is equal to external pressure and the wall of the blood vessels is not stressed. But if the volume rises above this value, the pressure increases proportionally. The slope in this pressure-volume characteristic is called &ldquo;Compliance&rdquo;.</p>
<ul>
<li>Increassing volume above ZeroPressureVolume (V0) generate positive pressure (greater than external pressure) lineary dependent on excess volume.</li>
<li>Decreasing volume below CollapsingPressureVolume (V00) generate negative pressure (lower than external pressure) logarithmicaly dependent on volume.</li>
<li>Otherwise external pressure is presented as pressure inside ElasticVessel.</li>
</ul>
<p><br><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/ElasticVessel_PV.png\"/></p>
</html>"));
      end ElasticVessel;

      model IdealValve
        extends Interfaces.OnePort;
         Boolean open(start=true) "Switching state";
         Real passableVariable(start=0, final unit="1")
        "Auxiliary variable for actual position on the ideal diode characteristic";
        /*  = 0: knee point
      < 0: below knee point, diode locking
      > 0: above knee point, diode conducting */
        parameter Types.HydraulicConductance _Gon(final min=0, displayUnit="l/(mmHg.min)") = 1.2501026264094e-02
        "Forward state-on conductance (open valve conductance)"
          annotation (Dialog(enable=not useLimitationInputs)); //= the same as resistance 1e-5 mmHg/(l/min)
        parameter Types.HydraulicConductance _Goff(final min=0, displayUnit="l/(mmHg.min)") = 1.2501026264094e-12
        "Backward state-off conductance (closed valve conductance)"
          annotation (Dialog(enable=not useLimitationInputs)); //= 1e-5 (l/min)/mmHg
        parameter Types.Pressure Pknee(final min=0) = 0
        "Forward threshold pressure";
        parameter Boolean useLimitationInputs = false
        "=true, if Gon and Goff are from inputs"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        Types.RealIO.HydraulicConductanceInput Gon(start=_Gon)=gon if useLimitationInputs
        "open valve conductance = infinity for ideal case"   annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-60,100})));
        Types.RealIO.HydraulicConductanceInput Goff(start=_Goff)=goff if useLimitationInputs
        "closed valve conductance = zero for ideal case"   annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,100})));
    protected
        Types.HydraulicConductance gon,goff;
        constant Types.Pressure unitPressure=1;
        constant Types.VolumeFlowRate unitFlow=1;
      equation
        if not useLimitationInputs then
          gon = _Gon;
          goff = _Goff;
        end if;
        open = passableVariable > Modelica.Constants.eps;
        dp = (passableVariable*unitFlow)*(if open then 1/gon else 1) + Pknee;
        volumeFlowRate = (passableVariable*unitPressure)*(if open then 1 else goff) + goff*Pknee;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                               graphics={Polygon(
                points={{-76,66},{-76,-82},{34,-10},{34,12},{-66,68},{-76,74},{
                    -76,66}},
                lineColor={0,0,127},
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
        //extends Icons.FlowMeasure;
        extends Modelica.Icons.RotationalSensor;

        Types.RealIO.VolumeFlowRateOutput volumeFlow "Actual volume flow rate"
                               annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              rotation=270,
              origin={0,-60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={0,120})));
      equation
        q_out.pressure = q_in.pressure;
        volumeFlow = q_in.q;
        annotation (
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),       Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                               graphics={
              Line(
                points={{-60,80},{80,80},{62,60}},
                color={0,0,255}),
              Line(
                points={{62,100},{80,80}},
                color={0,0,255}),
              Text(
                extent={{-25,-11},{34,-70}},
                lineColor={0,0,0},
                textString="V'")}));
      end FlowMeasure;

      model PressureMeasure "Hydraulic pressure at port"
        extends Icons.PressureMeasure;
        Interfaces.HydraulicPort_a
                             q_in annotation (Placement(
              transformation(extent={{-60,-80},{-20,-40}})));
        Types.RealIO.PressureOutput pressure "Pressure"
                               annotation (Placement(transformation(extent={{40,-60},
                  {80,-20}})));
      equation
        pressure = q_in.pressure;
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
        extends Interfaces.ConditionalSolutionFlow;
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
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,0,0},
                fillColor={0,0,0},
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
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      connector HydraulicPort
      "Hydraulical connector with pressure and volumetric flow"
        Types.Pressure pressure "Pressure";
        flow Types.VolumeFlowRate q "Volume flow";
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
                fillPattern=FillPattern.Solid,
                fillColor={0,0,0},
                rotation=180)}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Polygon(
                points={{0,50},{50,0},{0,-50},{-50,0},{0,50}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,0}),Text(extent={{-112,118},{88,58}},   lineColor = {0,0,0}, textString = "%name")}),
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
                fillPattern=FillPattern.Solid,
                fillColor={200,200,200})}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Polygon(
                points={{0,50},{50,0},{0,-50},{-50,0},{0,50}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor={200,200,200}),Text(extent = {{-160,110},{40,50}}, lineColor = {0,0,0}, textString = "%name")}));
      end HydraulicPort_b;

      partial model OnePort "Hydraulical OnePort"
        HydraulicPort_a      q_in "Volume inflow" annotation (Placement(
              transformation(extent={{-114,-14},{-86,14}})));
        HydraulicPort_b      q_out "Volume outflow"
                               annotation (Placement(
              transformation(extent={{86,-14},{114,14}})));
         Types.VolumeFlowRate volumeFlowRate "Volumetric flow";
         Types.Pressure dp "Pressure gradient";
      equation
        q_in.q + q_out.q = 0;
        volumeFlowRate = q_in.q;
        dp = q_in.pressure - q_out.pressure;
      end OnePort;

      partial model ConditionalSolutionFlow
      "Input of solution volumetric flow vs. parametric solution volumetric flow"

        parameter Boolean useSolutionFlowInput = false
        "=true, if solution flow input is used instead of parameter SolutionFlow"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.VolumeFlowRate SolutionFlow=0
        "Volumetric flow of solution if useSolutionFlowInput=false"
          annotation ( HideResult=not useSolutionFlowInput, Dialog(enable=not useSolutionFlowInput));

        Types.RealIO.VolumeFlowRateInput solutionFlow(start=SolutionFlow)=q if useSolutionFlowInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,70})));

        Types.VolumeFlowRate q "Current solution flow";
      equation
        if not useSolutionFlowInput then
          q = SolutionFlow;
        end if;

      end ConditionalSolutionFlow;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>",   info="<html>
<p>The main usage of the hydraulic domain in human physiology is modeling of the cardio-vascular system. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for incompressible water, at normal liquid-water temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of hydraulic resistance, hydrostatic pressure, volumetric flow, inertia and finally the block of blood accumulation in elastic vessels.</p>
</html>"));
  end Hydraulic;

  package Population
  "Domain for populatiom models for cells, viruses, bacterias, tissues, organism etc."
    extends Modelica.Icons.Package;

    package Components
      extends Modelica.Icons.Package;

      model Population
        extends Icons.Population;
        extends SteadyStates.Interfaces.SteadyState(
        state(nominal=NominalPopulation),
        change(nominal=NominalPopulationChange),
        state_start=population_start,
        storeUnit="1");

        parameter Types.Population population_start(nominal=NominalPopulation) = 1e-8
        "Initial population size in compartment"
           annotation ( HideResult=true, Dialog(group="Initialization"));

        parameter Types.Population NominalPopulation = 1
        "Numerical scale. Default is 1, but for huge amount of cells it should be any number in the appropriate numerical order of typical amount."
            annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very huge populations"));
        parameter Types.PopulationChange NominalPopulationChange = 1/(60*60*24)
        "Numerical scale. Default change is 1 individual per day, but for much faster or much slower chnages should be different."
            annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very fast or very slow changes"));

        Interfaces.PopulationPort_b port(population(nominal=NominalPopulation),change(nominal=NominalPopulationChange)) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}}), iconTransformation(extent={{-10,-10},{10,
                  10}})));

        Types.RealIO.PopulationOutput population(nominal=NominalPopulation) annotation (Placement(transformation(
                extent={{46,-102},{66,-82}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100})));
      equation
        port.population = population;

        state = population; //der(population) = port.change;
        change = port.change;
        annotation (Icon(graphics={
                        Text(
                extent={{-112,100},{248,140}},
                lineColor={0,0,255},
                textString="%name")}), Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Population;

      model Mortality "As population change per one individual"
         extends Interfaces.ConditionalLifeTime;
        Interfaces.PopulationPort_a port_a annotation (Placement(transformation(
                extent={{-108,-10},{-88,10}}), iconTransformation(extent={{-108,-10},{
                  -88,10}})));
      equation
        port_a.change = changePerPopulationMember*port_a.population;
        annotation (Icon(graphics={
              Rectangle(
                extent={{-100,-50},{100,50}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,25},{80,0},{-80,-25},{-80,25}},
                lineColor={0,127,127},
                rotation=360),
              Text(
                extent={{-150,-20},{150,20}},
                lineColor={0,0,255},
                origin={-8,-76},
                rotation=360,
                textString="%name")}));
      end Mortality;
    end Components;

    package Sources
      extends Modelica.Icons.SourcesPackage;

      model Growth
       extends Interfaces.ConditionalChange;
        Interfaces.PopulationPort_b port_b annotation (Placement(transformation(
                extent={{90,-10},{110,10}}), iconTransformation(extent={{90,-10},{110,
                  10}})));
      equation
        port_b.change = - change;
        annotation (Icon(graphics={
              Rectangle(
                extent={{-100,-52},{100,48}},
                lineColor={0,127,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,23},{80,-2},{-80,-27},{-80,23}},
                rotation=360,
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid,
                pattern=LinePattern.None,
                lineColor={0,127,127}),
              Text(
                extent={{-150,-20},{150,20}},
                lineColor={0,0,255},
                origin={-8,-78},
                rotation=360,
                textString="%name")}));
      end Growth;

      model Loss
       extends Interfaces.ConditionalChange;
        Interfaces.PopulationPort_a port_a annotation (Placement(transformation(
                extent={{-110,-10},{-90,10}}),
                                             iconTransformation(extent={{-110,-10},{
                  -90,10}})));
      equation
        port_a.change = change;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
                         graphics={
              Rectangle(
                extent={{-100,-52},{100,48}},
                lineColor={0,127,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                rotation=360),
              Polygon(
                points={{-80,23},{80,-2},{-80,-27},{-80,23}},
                lineColor={0,127,127},
                rotation=360,
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-20},{150,20}},
                lineColor={0,0,255},
                origin={-8,-78},
                rotation=360,
                textString="%name")}));
      end Loss;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      connector PopulationPort
      "Average number of population members and their change"
        Types.Population population "Average number of population individuals";
        flow Types.PopulationChange change
        "Average population change = change of population individuals";
        annotation (Documentation(revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end PopulationPort;

      connector PopulationPort_a "Increase (or decrease) of population"
        extends PopulationPort;

      annotation (
          defaultComponentName="port_a",
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={0,127,127},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,127,127},
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
              graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={0,127,127},
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid),
          Text(extent = {{-160,110},{40,50}}, lineColor={0,127,127},
                textString="%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end PopulationPort_a;

      connector PopulationPort_b "Decrease (or increase) of population"
        extends PopulationPort;

      annotation (
          defaultComponentName="port_b",
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,
                  100}}),     graphics={Rectangle(
                extent={{-20,10},{20,-10}},
                lineColor={0,127,127},
                lineThickness=1),       Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,127,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}),
              graphics={Rectangle(
                extent={{-40,40},{40,-40}},
                lineColor={0,127,127},
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid),
          Text(extent={{-160,112},{40,52}},   lineColor={0,127,127},
                fillColor={0,127,127},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end PopulationPort_b;

      partial model ConditionalChange
      "Input of population change vs. parametric constant change"

        parameter Boolean useChangeInput = false
        "=true, if real input connector is used instead of parameter PopulationChange"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.PopulationChange PopulationChange=0
        "Population change if useChangeInput=false"
          annotation (HideResult=not useChangeInput, Dialog(enable=not useChangeInput));

        Types.RealIO.PopulationChangeInput populationChange(start=PopulationChange)=change if   useChangeInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

        Types.PopulationChange change "Current population change";
      equation
        if not useChangeInput then
          change = PopulationChange;
        end if;

      end ConditionalChange;

      partial model ConditionalLifeTime
      "Input of population change per one population member vs. parametric lifetime"

        parameter Boolean useChangePerMemberInput = false
        "=true, if real input connector is used instead of parameter LifeTime"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.Time LifeTime=1e-8
        "Mean life time for population (=1.44*halftime) if useChangePerMember=false"
          annotation (HideResult=not useChangePerMemberInput, Dialog(enable=not useChangePerMemberInput));

        Types.RealIO.PopulationChangePerMemberInput changePerMember(start=1/LifeTime)=changePerPopulationMember if useChangePerMemberInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,60}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,40})));

        Types.PopulationChangePerMember changePerPopulationMember
        "Current population change per individual";
      equation
        if not useChangePerMemberInput then
          changePerPopulationMember = 1/LifeTime;
        end if;

      end ConditionalLifeTime;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>"));
  end Population;

  package SteadyStates "Dynamic Simulation / Steady State"
    extends Modelica.Icons.Package;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      partial model SteadyState
      "Abstract class for any dynamic state calculation (for any derivation), which is driven by SimulationType option."
        //allow to switch between dynamic mode 'der(y)=x' and steady-state mode 'der(y)=0'

        replaceable package Utilities = Types.FilesUtilities(directoryName=dirName)
                                                                        constrainedby
        Types.Utilities "How to store or load the values"
                       annotation (Dialog(group="Functions to read or store",tab="IO"));

        parameter Types.SimulationType  Simulation=Types.SimulationType.NormalInit
        "Dynamic with Initialization or Steady State"
          annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

        parameter Boolean isDependent = false
        "=true, If zero flow is propagated in eqiulibrium through resistors, impedances, reactions, etc."
          annotation (Evaluate=true, HideResult=true, Dialog(group="Simulation",tab="Equilibrium"));

        parameter Real state_start "State start or init value"
         annotation (HideResult=true,Dialog(enable=false,group="Initialization", tab="IO"));

        Real state(start=if LOAD_STARTS then Utilities.readReal(stateName, storeUnit) else
       state_start, stateSelect=StateSelect.prefer)
        "This state must be connected in inherited class definition"
          annotation (HideResult=true);
        Real change "Dynamic change of state value per minute" annotation (HideResult=true);

        constant String dirName = "io" "Directory name to save and load values"
          annotation (HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter String storeUnit="" "Unit in Utilities input/output function"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter String stateName=getInstanceName()
        "Name in Utilities input/output function"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter Boolean LOAD_STARTS = false "Load start value of state"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter Boolean SAVE_RESULTS = false "Save final state values"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

        parameter Boolean SAVE_COMPARISON = false
        "Compare final state values with original values"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

    protected
        parameter Real defaultValue(fixed=false) "Default value of state.";
        parameter Real initialValue(fixed=false) "Initial value of state.";

      initial equation

        if Simulation == Types.SimulationType.NormalInit then
          state = state_start;
        elseif Simulation == Types.SimulationType.ReadInit then
          state = Utilities.readReal(stateName, storeUnit);
        elseif Simulation == Types.SimulationType.InitSteadyState and not isDependent then
          der(state)=0;  //here it have the same meaning as "change = 0", because of equation "der(state) = change"
        end if;

        initialValue = state; //in causality such as initialValue:=state
        if SAVE_COMPARISON then
          defaultValue = Utilities.readReal(stateName, storeUnit);
        else
          defaultValue = Modelica.Constants.N_A;
        end if;
      equation

        when terminal() then
          if SAVE_RESULTS then
            Utilities.writeReal(
              stateName,
              state,
              storeUnit);
          end if;
          if SAVE_COMPARISON then
            Utilities.writeComparison(
              stateName,
              defaultValue,
              initialValue,
              state,
              storeUnit);
          end if;
        end when;

        if Simulation <> Types.SimulationType.SteadyState then
          der(state) = change;
        elseif not isDependent then   /*** this test and equation exclusion could be done automatically, if the solver will be so smart that it removes all this dependent equations from the total equilibrated system. The most probable form of this dependent equation in equilibrium setting is (0 = 0). ***/
           change = 0;
        end if;

        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SteadyState;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>",   info="<html>
<p>One of the main question in clinical medicine is how to stabilize the patient. In the fact of the oscillating heart, breathing, circadian rhythm or menstruation cycle the model could be designed as non-oscillating with variables such as period times, amplitudes, frequencies, mean values and other phase space variables. This type of model has better numerical stability for longer simulation time and even more it can be &QUOT;stabilized&QUOT;. This stabilization we called steady state. </p>
<p>To be mathematically exact, we define an <i><b>steady state system</b></i> (SSS) as a non-differential system derived from a original differential system (DS) by using zero derivations and by adding <b>additional steady state equations</b> (ASSE). The number of the ASSE must be the same as the number of algebraically dependent equations in the non-differential system derived from DS by setting zero derivations. The ASSE describes the system from the top view mostly such as the equations of mass conservation laws or the boundary equation of environment sources. To define a model as an SSS the user must switch each Simulation parameter in each block to value Types.SimulationType.SteadyState and must have correctly defined all necessary ASSE. This setting caused to ignoring any start values for any state and add zero derivation equations instead. Today does not exist Modelica environment, which could automatically find and remove generated dependent equations by this way. So the correct number of states must be marked as dependent (parameter isDependent) and the same number of ASSE must be inserted. Despite the fact, that model in this steady-state setting will be not locally balanced it should be globally balanced and without any dependent equation.</p>
<p>Adding of one ASSE is possible by inserting and connecting of the energy or mass conservation law block from package SteadyState.Components. Other possibilities is in blocks of environment&nbsp; sources, where the setting of parameter isIsolatedInSteadyState&nbsp; add the equation of the zero mass/volume/energy flow from or to environment. </p>
<p>The model in steady state often changes to one big nonlinear strong component, but without solver stiff or convergence problems. Especially in quick chemical reaction kinetics is not necessary to have very rapid molar fluxes, when it always reach equilibrium. This design also approve to create steady stated parts in dynamical model without huge rebuilding. It also&nbsp; brings other benefits. To see these possibilities, one have to realize that conservation laws could be invariances in a dynamical simulation. This is really useful for debugging. </p>
<p>It is always a big challenge to nicely solve initial values of differential system. However, it should be possible to solve the SSS in initial phase. And this is the idea behind the Types.SimulationTypes.InitSteadyState option for models already extended with ASSE to support SSS. </p>
</html>"));
  end SteadyStates;

  package Icons "Icons for physiological models"
    extends Modelica.Icons.Package;

    class SystemicCirculation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/krevniRecisteSiluetacloveka.png")}));
    end SystemicCirculation;

    class PulmonaryCirculation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/krevniRecistePlice.png")}));
    end PulmonaryCirculation;

    partial class BaseFactorIcon

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

    partial class BaseFactorIcon3

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

    partial class BaseFactorIcon4

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

    class Substance

        annotation ( Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/Concentration.png")}));
    end Substance;

    class ElasticBalloon

    annotation (Icon(graphics={     Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/elastickyKompartment - Kopie.png")}));
    end ElasticBalloon;

    partial class HydraulicResistor

    annotation (Icon(graphics={    Bitmap(extent={{-120,44},{120,-42}},
                fileName="modelica://Physiolibrary/Resources/Icons/resistance.png")}));
    end HydraulicResistor;

    class Membrane

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/membrane.png")}));
    end Membrane;

    class PressureMeasure

      annotation ( Icon(graphics={Bitmap(extent={
                  {-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/pressureMeassure.png")}));
    end PressureMeasure;

    class OsmoticCell

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName=
                  "modelica://Physiolibrary/Resources/Icons/OsmothicCell.png")}));
    end OsmoticCell;

    class Population

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/Resources/Icons/Populace.png")}));
    end Population;
    annotation (Documentation(revisions=""));
  end Icons;

  package Types "Physiological units with nominals"
    extends Modelica.Icons.Package;

    package Constants
      extends Modelica.Icons.SourcesPackage;

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

    block OneConst "1"

          RealIO.FractionOutput     y "=1"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
    equation
          y=1;
      annotation (defaultComponentName="one",
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
            Text(         extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
              textString="1")}));
    end OneConst;

      block PopulationChangeConst "Constant signal of type PopulationChange"
        parameter Types.PopulationChange k
        "Constant PopulationChange output value";
          RealIO.PopulationChangeOutput y "PopulationChange constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
      equation
          y=k;
      annotation (defaultComponentName="populationChange",
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
      end PopulationChangeConst;
    end Constants;

    package RealIO
      extends Modelica.Icons.Package;

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

      connector PopulationOutput =  output Population
      "output Population as connector"
        annotation (defaultComponentName="population",
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
  Connector with one output signal of type Population.
  </p>
  </html>"));

       connector PopulationChangeInput =
                                    input PopulationChange
      "input PopulationChange as connector"
        annotation (defaultComponentName="populationChange",
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
    Connector with one input signal of type PopulationChange.
    </p>
    </html>"));

      connector PopulationChangeOutput =
                                    output PopulationChange
      "output PopulationChange as connector"
        annotation (defaultComponentName="populationChange",
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
  Connector with one output signal of type PopulationChange.
  </p>
  </html>"));

      connector PopulationChangePerMemberInput =
                                    input PopulationChangePerMember
      "input PopulationChangePerMember as connector"
        annotation (defaultComponentName="populationChangePerMember",
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
    Connector with one input signal of type PopulationChangePerMember.
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
                lineColor={0,0,255},
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
This connector defines the \"expandable connector\" that
is used as bus in the Physiomodel (www.physiomodel.org).
Note, this connector is \"empty\". When using it, the actual content is
constructed by the signals connected to this bus.
</p>
</html>"));

      end BusConnector;

    type Energy = Modelica.SIunits.Energy(displayUnit="kcal", nominal=4186.8);

    type Time = Modelica.SIunits.Time(displayUnit="min", nominal=60);

    type Frequency = Modelica.SIunits.Frequency(displayUnit="1/min");

    type Pressure =  Modelica.SIunits.Pressure(displayUnit="mmHg", nominal=133.322387415);

    type Volume =  Modelica.SIunits.Volume(displayUnit="ml", nominal=1e-6, min=0);

    type VolumeFlowRate = Modelica.SIunits.VolumeFlowRate(displayUnit="ml/min", nominal=(1e-6)/60);

    replaceable type Concentration = Modelica.SIunits.Concentration (displayUnit="mmol/l", min=0) constrainedby Real;

    replaceable type AmountOfSubstance = Modelica.SIunits.AmountOfSubstance (displayUnit="mmol", min=0) constrainedby Real;

    replaceable type MolarFlowRate = Modelica.SIunits.MolarFlowRate(displayUnit="mmol/min") constrainedby Real;

    replaceable type MolarEnergy = Modelica.SIunits.MolarEnergy(displayUnit="kcal/mol", nominal=4186.8) constrainedby Real
    "chemical internal energy, chemical enthalpy, Gibb's energy ..";

    type Temperature = Modelica.SIunits.Temperature(displayUnit="degC", nominal=1, min=0);

    type Fraction = Real(final quantity="Fraction",final unit="1", displayUnit="%", nominal=1e-2);

    type OsmoticPermeability = Real(final quantity="OsmoticPermeability",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60), min=0);

    type HydraulicConductance = Real(final quantity="HydraulicConductance",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60), min=0);

    type HydraulicResistance = Real(final quantity="HydraulicConductance",final unit="(Pa.s)/m3", displayUnit="(mmHg.min)/ml", nominal=(1e+6)*(133.322387415)*60, min=0);

    type HydraulicCompliance =  Real(final quantity="HydraulicCompliance",final unit="m3/Pa", displayUnit="ml/mmHg", nominal=(1e-6)/(133.322387415));

    type HydraulicElastance = Real(final quantity="HydraulicElastance",final unit="Pa/m3", displayUnit="mmHg/ml", nominal=(133.322387415)/(1e-6));

    type Population = Real (final quantity="Population", final unit="1", displayUnit="1", min=0)
    "Average number of population individuals";

    type PopulationChange = Real (final quantity="PopulationChange", final unit="1/s", displayUnit="1/d")
    "Average change of population individuals";

    type PopulationChangePerMember = Real (final quantity="PopulationChangePerMember", final unit="1/s", displayUnit="1/d")
    "Average change per population individual";

    package FilesUtilities "File input/output/test"
      import Physiolibrary;
      extends Types.Utilities;
      extends Modelica.Icons.VariantsPackage;

      constant String directoryName="io";

      constant String inputFileName="input.txt"
      "File to load values with (non-)SI units";
      constant String outputFileName="output.txt"
      "File to save values with (non-)SI units";
      constant String comparisonFileName="comparison.txt"
      "File to save comparison from loaded values and simulation results with (non-)SI units";

      constant String inputSIFileName="input_SI.txt"
      "File to load values in SI units";
      constant String outputSIFileName="output_SI.txt"
      "File to save values in SI units";
      constant String comparisonSIFileName="comparison_SI.txt"
      "File to save comparison in SI units from loaded values and simulation results";

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
        fn:=directoryName + "/" + inputFileName;

        if not Files.exist(fn) then
           Streams.error("readRealParameter(\""+name+"\", \""+ fn + "\")  Error: the file does not exist.\n");
        else

        typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

        //Format "<variableName>\n<value> <unit>"
        (line, endOfFile) :=Streams.readLine(fn, iline);
        while not found and not endOfFile loop
             if line == name then
                 // name found, get value of "name = value;"
                 (line, endOfFile) :=Streams.readLine(fn, iline+1);
                 lineLen := Strings.length(line);
                 nextIndex:=1;

      /*
other wariant: //Format "<variableName>=<value><unit>"
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
                     if Strings.length(unitConversions[typeDef].DisplayUnit) > 0 then
                       Streams.error("No units detected for variable '" + name +
                                      "' in file '" + fn + "'. Expected unis are '" + unitConversions[typeDef].DisplayUnit + "'!\n");
                     end if;
                     //Streams.print(" > " + name + "\t " + String(inputValue) + " (no units)");
                 else
                     str :=Strings.substring(line, Strings.Advanced.skipWhiteSpace(line,nextIndex),  Strings.length(line));
                     if str <> unitConversions[typeDef].DisplayUnit then
                        Streams.error("Units '" + str + "' not expected for variable '"
                         + name + "' in file '" + fn + "'. Expected unis are '" +
                        unitConversions[typeDef].DisplayUnit + "'!\n");
                     end if;
                     //Streams.print(" > " + name + "\t " + String(inputValue) + " " + str);
                 end if;
                 value :=inputValue*unitConversions[typeDef].Scale + unitConversions[typeDef].Offset;
                 //Streams.print("\t\t =" + String(value) + " " + unitConversions[typeDef].Unit);
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

      redeclare function extends readReal_SI
        import Modelica.Utilities.*;

    protected
        String fn;
        String line;
        Integer nextIndex;
        Integer iline=1;
        Boolean found = false;
        Boolean endOfFile=false;

      algorithm
        fn:=directoryName + "/" +inputSIFileName;

        if not Files.exist(fn) then
           Streams.error("readRealParameter(\""+name+"\", \""+ fn + "\")  Error: the file does not exist.\n");
        else

        //Format "<variableName>\n<value> <unit>"
        (line, endOfFile) :=Streams.readLine(fn, iline);
        while not found and not endOfFile loop
             if line == name then
                 // name found, get value of "name = value;"
                 (line, endOfFile) :=Streams.readLine(fn, iline+1);
                 nextIndex:=1;

                 (value,nextIndex) := Strings.scanReal(line, nextIndex);
                 found := true;

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

      end readReal_SI;

      redeclare function extends readBoolean
        import Modelica.Utilities.*;

      algorithm
        value:=(readReal(name,"")>0.005);
      end readBoolean;

      redeclare function extends writeReal "Write the value to file"
        import Modelica.Utilities.*;

    protected
        String fn;
        Integer typeDef "Variable type";

      algorithm
        fn:=directoryName + "/" +outputFileName;

        if not Files.exist(fn) then
           if not Files.exist(directoryName) then
               Files.createDirectory(directoryName);
           end if;
        end if;

        typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

        Streams.print(name + "\n" + String(((value - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale))
        + " " + unitConversions[typeDef].DisplayUnit, fn);

      end writeReal;

      redeclare function extends writeReal_SI
      "Write the value to file using SI unit"
        import Modelica.Utilities.*;

    protected
        String fn;
        Integer typeDef "Variable type";

      algorithm
        fn:=directoryName + "/" +outputSIFileName;

        if not Files.exist(fn) then
           if not Files.exist(directoryName) then
               Files.createDirectory(directoryName);
           end if;
        end if;

         Streams.print(name + "\n" + String(value), fn);

      end writeReal_SI;

      redeclare function extends writeBoolean
        import Modelica.Utilities.*;
    protected
        String fn;

      algorithm
        fn:=directoryName + "/" +outputFileName;

        if not Files.exist(fn) then
           if not Files.exist(directoryName) then
               Files.createDirectory(directoryName);
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
        fn:=directoryName + "/" +comparisonFileName;

        if not Files.exist(fn) then
           if not Files.exist("output") then
               Files.createDirectory("output");
           end if;
        end if;

        typeDef:=UnitConversions.findUnit(storeUnit,unitConversions);

      outputDefaultValue :=((defaultValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);
      outputInitialValue :=((initialValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);
      outputFinalValue :=((finalValue - unitConversions[typeDef].Offset)/unitConversions[typeDef].Scale);

        Streams.print((if (abs(outputDefaultValue) > Modelica.Constants.eps)
           then String(abs((outputFinalValue - outputDefaultValue)/
          outputDefaultValue)) else "Zero vs. " + String(outputFinalValue)) +
          " ; " + name + " : default=" + String(outputDefaultValue) + " " +
          unitConversions[typeDef].DisplayUnit
           + ", initial=" + String(outputInitialValue) + " " + unitConversions[
          typeDef].DisplayUnit + ", final=" + String(outputFinalValue) + " " +
          unitConversions[typeDef].DisplayUnit,
          fn);

      end writeComparison;

      redeclare function extends writeComparison_SI
      "Compare and write the result and the value to file using SI units"
        import Modelica.Utilities.*;

    protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;

      algorithm
        fn:=directoryName + "/" +comparisonSIFileName;

        if not Files.exist(fn) then
           if not Files.exist("output") then
               Files.createDirectory("output");
           end if;
        end if;

      outputDefaultValue := defaultValue;
      outputInitialValue := initialValue;
      outputFinalValue := finalValue;

      Streams.print((if (abs(outputDefaultValue) > Modelica.Constants.eps) then
        String(abs((outputFinalValue - outputDefaultValue)/outputDefaultValue))
         else "Zero vs. " + String(outputFinalValue)) + " ; " + name +
        " : default=" + String(outputDefaultValue) + ", initial=" + String(outputInitialValue)
         + ", final=" + String(outputFinalValue), fn);

      end writeComparison_SI;

      redeclare function extends writeBooleanComparison
      "Compare and write the result and the value to file"
        import Modelica.Utilities.*;

    protected
        String fn;
        Real outputInitialValue;
        Real outputFinalValue;
        Real outputDefaultValue;
      algorithm
        fn:=directoryName + "/" +comparisonFileName;

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

      annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2013, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",     info="<html>
<p>During the creation and debugging of huge integrated models it is necessary to easily define consistent input, output and test sets of all output variables for some subsystems. Let&apos;s imagine that we have a model composed only of subsystems that converge from some constant inputs to constant outputs. It should be possible to substitute each main subsystem for its chosen constant output values as parameters. Comparing the model with these parametric values and the original subsystem can show the wrong part of the simulation. </p>
<p>For example in the huge HumMod model it is necessary to debug smaller parts separately. These tools could be use, because HumMod is the type of constant-converged model. Each subsystem in the first level has the constant input values set for its output variables. Simulating, for example, the cardiovascular subsystem is possible by creating the high-level system with the original cardiovascular subsystem, but with a constant metabolic, constant thermoregulation, constant hormonal, constant water, constant proteins, constant gases, constant electrolytes and constant status subsystem. </p>
<p>Because the number of output variables for each subsytem changes during development, it is a good idea to have only one list for each subsystem. And generating consistent sets to store, restore, compare initial and final values is possible by the same pattern as presented in the package Types.Example. In this package it is also possible to define a customized &nbsp;way to save and load the variables that connect subsystems together. For this purpose, one has to redeclare the package Types.Utilities with simple functions for reading and writing values, such as is done in the default package FileUtilities. </p>
</html>"));
    end FilesUtilities;

    package Utilities "Value input/output/test support"
      extends Modelica.Icons.BasesPackage;
      replaceable function readReal "Read the real value of parameter from file with lines in format:
  <parameterName>
  <value> <unit>"
        extends Modelica.Icons.Function;

        input String name "Name of parameter";
        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
        "Unit conversions";

        output Real value=0 "Actual value of parameter in SI units";
      //algorithm
      end readReal;

      replaceable function readReal_SI "Read the real value in SI units of parameter from file with lines in format:
  <parameterName>\\n<value>"
        extends Modelica.Icons.Function;

        input String name "Name of parameter";

        output Real value=0 "Actual value of parameter in SI units";
      //algorithm
      end readReal_SI;

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
        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
        "Unit conversions";
      //algorithm
      end writeReal;

      replaceable function writeReal_SI
      "Write the real value using SI unit to file"
        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real value "Variable value";
      //algorithm
      end writeReal_SI;

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

        input String storeUnit "Preferred units to store variable value";
        input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
        "Unit conversions";
      //algorithm
      end writeComparison;

      replaceable function writeComparison_SI
      "Compare and write the result and the value to file using SI units"

        extends Modelica.Icons.Function;

        input String name "Variable name";
        input Real defaultValue
        "Original value[in SIunits] to compare with final value";
        input Real initialValue "Initial variable value[in SI units]";
        input Real finalValue "Final variable value[in SI units]";

      //algorithm
      end writeComparison_SI;

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

      package UnitConversions "Conversions non-SI units at input/output"

       function findUnit
         input String unitToFind "display unit to find in unitConversions";
         input UnitConversions.RealTypeRecord[:] unitConversions = UnitConversions.RealTypeDef
          "Unit conversions";
         output Integer typeDef "index in unitConversions";
       algorithm
         typeDef:=0;
         for i in 1:size(unitConversions,1) loop
           if unitConversions[i].DisplayUnit == unitToFind then
             typeDef:=i;
             break;
           end if;
         end for;
         if typeDef==0 then
            Modelica.Utilities.Streams.print("Unit \"" + unitToFind + "\" not defined. Do not hesitate to contact me. marek@matfyz.cz\n");
         end if;
       end findUnit;

       record RealTypeRecord "The Real Type definition"
         parameter String Quantity="" "Quantity";
         parameter String Unit="1" "SI unit";
         parameter String DisplayUnit="" "Display unit";

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
              Quantity="pH",
              Unit="log10(mol/l)",
              DisplayUnit="log10(mol/l)",
              Scale=1),RealTypeRecord(
              Quantity="Energy",
              Unit="J",
              DisplayUnit="kcal",
              Scale=4186.8),RealTypeRecord(
              Quantity="Time",
              Unit="s",
              DisplayUnit="min",
              Scale=60),RealTypeRecord(
              Quantity="Frequency",
              Unit="1/s",
              DisplayUnit="Hz",
              Scale=1),RealTypeRecord(
              Quantity="Frequency",
              Unit="1/s",
              DisplayUnit="1/min",
              Scale=1/60),RealTypeRecord(
              Quantity="Mass",
              Unit="kg",
              Min=0,
              DisplayUnit="g",
              Scale=1e-3),RealTypeRecord(
              Quantity="Mass",
              Unit="kg",
              Min=0,
              DisplayUnit="mg",
              Scale=1e-6),RealTypeRecord(
              Quantity="MassFlowRate",
              Unit="kg/s",
              DisplayUnit="mg/min",
              Scale=(1e-6)/60),RealTypeRecord(
              Quantity="MassFlowRate",
              Unit="kg/s",
              DisplayUnit="g/min",
              Scale=(1e-3)/60),RealTypeRecord(
              Quantity="Density",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="kg/l",
              Scale=1e3),RealTypeRecord(
              Quantity="Density",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="g/l",
              Scale=1),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="mg/l",
              Scale=1e-3),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="mg/dl",
              Scale=1e-6/1e-4),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="ng/l",
              Scale=1e-12/1e-3),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="ng/dl",
              Scale=1e-12/1e-4),RealTypeRecord(
              Quantity="MassConcentration",
              Unit="kg/m3",
              Min=0,
              DisplayUnit="ng/ml",
              Scale=1e-12/1e-6),RealTypeRecord(
              Quantity="Length",
              Unit="m",
              DisplayUnit="cm",
              Scale=1e-2),RealTypeRecord(
              Quantity="Velocity",
              Unit="m/s",
              DisplayUnit="MPH",
              Scale=0.44704),RealTypeRecord(
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
              Scale=(1e-6)/60),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="mol/l",
              Scale=1e+3),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="mmol/l",
              Scale=1),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="pmol/l",
              Scale=1e-12/1e-3),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="uU_Insulin/ml",
              Scale=6.622e-9),RealTypeRecord(
              Quantity="Concentration",
              Unit="mol/m3",
              DisplayUnit="U_EPO/l",
              Scale=0.45e-9),RealTypeRecord(
              Quantity="AmountOfSubstance",
              Unit="mol",
              DisplayUnit="mmol",
              Scale=1e-3),RealTypeRecord(
              Quantity="AmountOfSubstance",
              Unit="mol",
              DisplayUnit="osm",
              Scale=1),RealTypeRecord(
              Quantity="AmountOfSubstance",
              Unit="mol",
              DisplayUnit="mosm",
              Scale=1e-3),RealTypeRecord(
              Quantity="MolarFlowRate",
              Unit="mol/s",
              DisplayUnit="mmol/min",
              Scale=(1e-3)/60),RealTypeRecord(
              Quantity="MolarFlowRate",
              Unit="mol/s",
              DisplayUnit="ml_STP/min",
              Scale=1/1362657.193569),RealTypeRecord(
              Quantity="Energy",
              Unit="J",
              DisplayUnit="kcal",
              Scale=4186.8),RealTypeRecord(
              Quantity="ThermodynamicTemperature",
              Unit="K",
              DisplayUnit="K",
              Scale=1,
              Start=310.15),RealTypeRecord(
              Quantity="ThermodynamicTemperature",
              Unit="K",
              DisplayUnit="degC",
              Scale=1,
              Offset=273.15,
              Start=310.15),RealTypeRecord(
              Quantity="Power",
              Unit="W",
              DisplayUnit="W",
              Scale=1),RealTypeRecord(
              Quantity="Power",
              Unit="W",
              DisplayUnit="kcal/min",
              Scale=4186.8/60),RealTypeRecord(
              Quantity="Power",
              Unit="W",
              DisplayUnit="cal/min",
              Scale=4.1868/60),RealTypeRecord(
              Quantity="ThermalConductance",
              Unit="W/K",
              DisplayUnit="kcal/(min.degC)",
              Scale=4186.8/60),RealTypeRecord(
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
              DisplayUnit="meq",
              Scale=(1e-3)*(9.64853399*10^4)),RealTypeRecord(
              Quantity="VolumeDensityOfCharge",
              Unit="C/m3",
              DisplayUnit="meq/l",
              Scale=(1e-3)*(9.64853399*10^4)/1e-3),RealTypeRecord(
              Quantity="VolumeDensityOfCharge",
              Unit="C/m3",
              DisplayUnit="eq/l",
              Scale=(9.64853399*10^4)/1e-3),RealTypeRecord(
              Quantity="ElectricCurrent",
              Unit="A",
              DisplayUnit="meq/min",
              Scale=(1e-3)*(9.64853399*10^4)/60),RealTypeRecord(
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
              Scale=(1e-3)/60),RealTypeRecord(
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
              Unit="mol/m3",
              DisplayUnit="mosm/l",
              Scale=1),RealTypeRecord(
              Quantity="Osmolarity",
              Unit="mol/m3",
              DisplayUnit="osm/l",
              Scale=1000),RealTypeRecord(
              Quantity="MolarEnergy",
              Unit="J/mol",
              DisplayUnit="kcal/mol",
              Scale=4186.8),RealTypeRecord(
              Quantity="Pharmacology Concentration",
              Unit="1/m3",
              DisplayUnit="iu/l",
              Scale=1000),RealTypeRecord(
              Quantity="Pharmacology Concentration",
              Unit="1/m3",
              DisplayUnit="uiu/ml",
              Scale=1),RealTypeRecord(
              Quantity="PopulationChange",
              Unit="1/s",
              DisplayUnit="1/min",
              Scale=1/60),RealTypeRecord(
              Quantity="PopulationChange",
              Unit="1/s",
              DisplayUnit="1/d",
              Scale=1/(60*60*24))}
        "All defined Real types - units, displayUnits, conversions, nominals";

         constant String[:] Prefix =    {"","m", "u", "n", "p"};
         constant Real[:]   PrefixScale={1.0, 1e-3,1e-6,1e-9,1e-12};

         constant String[:] SuffixSI= {"","/m3","/m3","/m3","/s"};
         constant String[:] Suffix =  {"","/l", "/dl","/ml","/min"};
         constant Real[:]   SuffixScale={1, 1e+3, 1e+4, 1e+6, 1/60};

        function GenerateSubstanceUnits
           input String nonSIunit "non-SI unit";
           input Real scale "1 mol = 'scale' 'nonSIunit'";
           output RealTypeRecord[size(Prefix,1)*size(Suffix,1)] units
          "generated conversions for mili-, micro-, .. amount/concentration/flow";
      protected
         constant Integer np = size(Prefix,1);
         constant Integer ns = size(Suffix,1);
        algorithm
          units:={
              RealTypeRecord(
                Unit="mol"+SuffixSI[integer(1+mod(i,ns))],
                DisplayUnit=Prefix[integer(1+div(i,ns))] + nonSIunit + Suffix[integer(1+mod(i,ns))],
                Scale=PrefixScale[integer(1+div(i,ns))]*scale*SuffixScale[integer(1+mod(i,ns))])
              for i in 0:(np*ns-1)};
        end GenerateSubstanceUnits;

      end UnitConversions;
    end Utilities;

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
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>",   info="<html>
<p>The main problem of medical research, articles, and experiments is using obscure units from medicine, pharmacology, biology and non-physics disciplines. The Physiolibrary fulfills the Modelica ideal of using SI units as the main unit for each variable, and the previously described physiological units are also implemented as the displayUnits for each variable. Using these displayUnits the user sets and sees the &QUOT;physiological&QUOT; values. The implementation can also be joined to any unit-correct Modelica models and physical equations without crashing due to unit incompatibilities. The unit support of Physiolibrary is so strong that you even can chose the right unit-typed &ldquo;input real&rdquo;/&rdquo;output real&rdquo; from the library package Types.RealIO. As can be expected, only the non-specific packages States and Blocks in the Physiolibrary have variables without units.</p>
</html>"));
  end Types;

  package Blocks "Base Signal Blocks Library"
    extends Modelica.Icons.Package;

    package Math "Modelica.Math extension"
      extends Modelica.Icons.Package;

      model Integrator "Integrator with support of steady state calculation."
        extends SteadyStates.Interfaces.SteadyState(
                                           state_start=y_start, state(nominal=NominalValue));

        parameter Real k=1 "Integrator gain";

        parameter Real y_start=0 "Initial or guess value of output (= state)"
          annotation (Dialog(group="Initialization"));
        extends Modelica.Blocks.Interfaces.SISO(u(nominal=NominalValue/k),y(nominal=NominalValue));

        parameter Real NominalValue = 1
        "Numerical scale. For some substances such as hormones, hydronium or hydroxide ions should be set."
            annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very small concentrations"));
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
              Line(points={{-80,-80},{80,80}}, color={0,0,127})}),
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
              Line(points={{-46,0},{46,0}})}));
      end Integrator;

          block Power "b ^ u"

            parameter Boolean useBaseInput = false
        "=true, if exponential base input is used instead of parameter Base"
            annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

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
          end Power;
    end Math;

    package Interpolation "Empirical Dependence of Two Variables"
      extends Modelica.Icons.Package;

     function Spline "Cubic spline interpolation function"

          input Real[:] x "x coordinations of interpolating points"; //souradnice x souradnice uzlovych bodu
          input Real[:,4] a
        "cubic polynom coefficients of curve segments between interpolating points";                     //parametry kubiky
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
        "cubic polynom coefficients of curve segments between interpolating points";                                 //pocet hodnot ctyrech parametru kubiky je o jeden vic nez pocet bodu

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
              a[i,1]:=-(-x2*slope2 - x2*slope1 + x1*slope2 + x1*slope1 + 2*y2 - 2*y1)/((x2 - x1)^3);
              a[i,2]:=(-(x2^2)*slope2-2*(x2^2)*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*(x1^2)+3*y2*x1+2*slope2*(x1^2))/((x2-x1)^3);
              a[i,3]:=-(-slope1*(x2^3)-2*(x2^2)*slope2*x1-(x2^2)*slope1*x1+x2*slope2*(x1^2)+2*x2*slope1*(x1^2)+6*x2*x1*y2-6*x2*x1*y1+slope2*(x1^3))/((x2-x1)^3);
              a[i,4]:=(-slope1*(x2^3)*x1+y1*(x2^3)-slope2*(x1^2)*(x2^2)+slope1*(x1^2)*(x2^2)-3*y1*(x2^2)*x1+3*y2*(x1^2)*x2+slope2*(x1^3)*x2-y2*(x1^3))/((x2-x1)^3);
        end for;
        a[1,  :] := { 0, 0, slope[1], y[1] - x[1]*slope[1]}; //vypocet prvni sady parametru kubiky  - primky
        a[n+1,:] := { 0, 0, slope[n], y[n] - x[n]*slope[n]}; //vypocet posledni sady parametru kubiky - primky

            annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
     end SplineCoefficients;
    end Interpolation;

    package Factors "Multiplication Effects"
      extends Modelica.Icons.Package;

      model Normalization "effect = u/NormalValue"
       extends Icons.BaseFactorIcon;

       parameter Real NormalValue=1
        "Normal value of u, because y=(u/NormalValue)*yBase.";

       parameter Boolean enabled=true "disabled => y=yBase";

       Modelica.Blocks.Interfaces.RealInput u
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

        Types.Fraction effect;
      equation
        effect = if enabled then u/NormalValue else 1;
        y=effect*yBase;
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>", info="<html>
<p><h4>y = yBase * u</h4></p>
</html>"));
      end Normalization;

      model Spline "effect = spline(data,u)"
       extends Icons.BaseFactorIcon4;
       Modelica.Blocks.Interfaces.RealInput u(nominal=Xscale)
                    annotation (Placement(transformation(extent={{-100,-20},{-60,
                  20}})));

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Real[:,3] data "Array of interpolating points as {x,y,slope}";

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";
       parameter Real Yscale = 1 "conversion scale to SI unit of y values";

       parameter Boolean UsePositiveLog10 = false
        "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";

        Types.Fraction effect "Multiplication coeffecient for yBase to reach y";

    protected
          parameter Real a[:,:] = if enabled then Interpolation.SplineCoefficients(
                                                            data[:, 1],data[:, 2]*Yscale,data[:, 3]*Yscale) else zeros(1,1)
        "Cubic polynom coefficients of curve segments between interpolating points";

      equation
        effect = if not enabled then 1 elseif UsePositiveLog10 then Interpolation.Spline(data[:, 1],a,if u/Xscale <= 1 then 0 else log10(u/Xscale))
         else Interpolation.Spline(data[:, 1],a,u/Xscale);

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

       parameter Boolean enabled=true "disabled => y=yBase";

       parameter Types.Time HalfTime(displayUnit="d");
                                                      //Tau(unit="day");

       parameter String stateName=getInstanceName()
        "Name in Utilities input/output function"
           annotation (Evaluate=true, HideResult=true, Dialog(group="Value I/O",tab="IO"));

       parameter Real Xscale = 1 "conversion scale to SI unit of x values";

       parameter Boolean UsePositiveLog10 = false
        "x = if u/scaleX <=1 then 0 else log10(u/scaleX)";

       parameter Real[:,3] data;
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-32})));
        Blocks.Math.Integrator integrator(y_start=1, k=(
              Modelica.Math.log(2)/HalfTime),
          stateName=stateName)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,12})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,44})));
        Types.Fraction effect;
        Spline spline(
          data=data,
          Xscale=Xscale,
          UsePositiveLog10=UsePositiveLog10,
          enabled=enabled)
          annotation (Placement(transformation(extent={{-36,56},{-16,76}})));
        Types.Constants.FractionConst fraction(k(displayUnit="1") = 1)
          annotation (Placement(transformation(extent={{-44,82},{-36,90}})));
      equation
        //der(effect) = (ln(2)/HalfTime)*(spline(data,u)-effect)
        effect = integrator.y;
        connect(yBase, product.u1) annotation (Line(
            points={{0,20},{0,30},{0,-20},{6,-20}},
            color={0,0,127}));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-40}},
            color={0,0,127}));
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-26,35},{-26,24}},
            color={0,0,127}));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-50,-8},{-50,44},{-34,44}},
            color={0,0,127}));
        connect(integrator.y, product.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-6,-8},{-6,-20}},
            color={0,0,127}));
        connect(feedback.u1, spline.y) annotation (Line(
            points={{-26,52},{-26,62}},
            color={0,0,127}));
        connect(u, spline.u) annotation (Line(
            points={{-80,0},{-82,0},{-82,66},{-34,66}},
            color={0,0,127}));
        connect(fraction.y, spline.yBase) annotation (Line(
            points={{-35,86},{-26,86},{-26,68}},
            color={0,0,127}));
        annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SplineLag;
    end Factors;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>"));
  end Blocks;

  package Chemical "Please use 'Chemical' library instead!"
   extends Modelica.Icons.Package;

    package Components
      extends Modelica.Icons.Package;

      model Substance "Substance accumulation in solution"
        extends Icons.Substance;
        extends Interfaces.ConditionalVolume;

        extends SteadyStates.Interfaces.SteadyState(
        state(nominal=NominalSolute),
        change(nominal=NominalSolute/60),
        state_start=solute_start,
        storeUnit="mmol");

        parameter Types.AmountOfSubstance solute_start(nominal=NominalSolute) = 1e-8
        "Initial solute amount in compartment"
           annotation ( HideResult=true, Dialog(group="Initialization"));

        Types.RealIO.AmountOfSubstanceOutput solute(nominal=
            NominalSolute) "Current amount of solute"
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100})));

        parameter Types.AmountOfSubstance NominalSolute = 0.001
        "Numerical scale. Default is from mmol to mol, but for some substances such as hormones, hydronium or hydroxide ions can be much smaller."
            annotation ( HideResult=true, Dialog(tab="Solver",group="Numerical support of very small concentrations"));

        Interfaces.ChemicalPort_b q_out(conc(start=solute_start/NormalVolume))
        "Concentration and molar flow from/to compartment"
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

        parameter Types.MolarEnergy dH=0 "Standard Enthalpy Change"
          annotation ( HideResult=true, Dialog(tab="Energies"));

        Types.RealIO.EnergyOutput internalHeat
        "Internal heat energy = enthalpy*amountOfSubstance"   annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              origin={116,-40})));
      equation
        q_out.conc = solute/volume;

        state = solute; // der(solute)=q_out.q
        change = q_out.q;

        internalHeat = dH*solute;

                                                                                                          annotation (
          Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
              graphics={Text(
                extent={{-80,90},{280,130}},
                lineColor={0,0,255},
                textString="%name")}),
          Documentation(revisions="<html>
<p>2009-2015 by Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<h4>Solute = Concentration &middot; Volume = &int; MolarFlow</h4>
<p>The main class from &ldquo;Chemical&rdquo; package is called &QUOT;Substance&QUOT;. It has one chemical connector, where molar concentration and molar flow is presented as usually. An amount of a substance (&QUOT;solute&QUOT;) is accumulated by molar flow inside an instance of this class. In the default setting the volume is set to one liter, so in this setting the concentration at &ldquo;mol/L&rdquo; has the same value as the variable solute at &ldquo;mol&rdquo;. But in the advanced settings the default volume can be changed with external input. The molar flow at the port can be also negative, which means that the solute leaves the Substance instance.&nbsp;</p>
<p><br>Having defined amount of all particles in solution as n(solution) and mass of solvent as m(solvent). It can be expressed mole fraction x and molality b as follows:</p>
<p><b>x = Solute / n(solution) = Concentration &middot; Volume /n(solution)</b></p>
<p><b>b = Solute / m(solvent) = Concentration &middot; Volume /m(solvent)</b></p>
<p><br>The activity (mole fraction based) can be expressed using mole-fraction-based activity coefficient gamma as:</p>
<h4>a = gamma * x</h4>
</html>"));
      end Substance;

      model Clearance "Clearance with or without solvent outflow"

        parameter Types.VolumeFlowRate Clearance=0
        "Clearance of solute if useSolutionFlowInput=false"
          annotation (Dialog(enable=not useSolutionFlowInput));

        parameter Real K(unit="1")=1
        "Coefficient such that Clearance = K*solutionFlow";

        extends Hydraulic.Interfaces.ConditionalSolutionFlow(SolutionFlow=
              Clearance/K);

        Interfaces.ChemicalPort_a q_in "solute outflow"
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));

        Types.VolumeFlowRate clearance;
      equation

        clearance = q*K;

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
                lineColor={107,45,134},
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
    end Components;

    package Sensors
      extends Modelica.Icons.SensorsPackage;

      model ConcentrationMeasure "Measure of molar concentration"
        extends Modelica.Icons.RotationalSensor;

        Interfaces.ChemicalPort_a q_in "For measure only" annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}), iconTransformation(
                extent={{-10,-10},{10,10}})));
        Types.RealIO.ConcentrationOutput concentration "Concentration"
                               annotation (Placement(transformation(extent={{-20,-20},
                  {20,20}},
              rotation=90,
              origin={0,40}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-80})));
      equation

        concentration =         q_in.conc;

        q_in.q = 0;
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Text(
                extent={{-29,-3},{30,-62}},
                lineColor={0,0,0},
                textString="c")}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end ConcentrationMeasure;
    end Sensors;

    package Sources
      extends Modelica.Icons.SourcesPackage;

      model UnlimitedSolutePump "Molar pump of solute to system"
        extends Interfaces.ConditionalSoluteFlow;

        Interfaces.ChemicalPort_b q_out "Outflow"
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));

      equation
        q_out.q = - q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-100,-42},{100,40}},
                lineColor={107,45,134},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-48,20},{50,0},{-48,-21},{-48,20}},
                lineColor={107,45,134},
                fillColor={107,45,134},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-82,-82},{90,-58}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end UnlimitedSolutePump;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

      connector ChemicalPort "Concentration and Solute flow"
        Types.Concentration conc "Solute concentration";
        flow Types.MolarFlowRate q "Solute flow";
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
         Text(extent = {{-160,110},{40,50}}, lineColor = {107,45,134}, textString = "%name")}),
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
         Text(extent = {{-160,110},{40,50}}, lineColor = {107,45,134}, textString = "%name")}),
          Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>", revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));

      end ChemicalPort_b;

      partial model ConditionalVolume
      "Chemical processes can be modeled with or without(normalized to 1 liter) variable solution volume"

        constant Types.Volume NormalVolume=0.001 "1 liter" annotation(Evaluate=true, HideResult=true);

        parameter Boolean useNormalizedVolume = true
        "Normalized volume of solution is 1 liter"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        Types.Volume volume "Solution volume"; //annotation(HideResult=useNormalizedVolume);

        Types.RealIO.VolumeInput solutionVolume=volume if not useNormalizedVolume
        "Volume of solution"                                                                           annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-40,40})));
      equation
        if useNormalizedVolume then
          volume = NormalVolume;
        end if;

      end ConditionalVolume;

      partial model ConditionalSoluteFlow
      "Input of solute molar flow vs. parametric solute molar flow"

        parameter Boolean useSoluteFlowInput = false
        "=true, if solute flow input is used instead of parameter SoluteFlow"
        annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.MolarFlowRate SoluteFlow=0
        "Volumetric flow of solute if useSoluteFlowInput=false"
          annotation (HideResult=not useSoluteFlowInput, Dialog(enable=not useSoluteFlowInput));

        Types.RealIO.MolarFlowRateInput soluteFlow(start=SoluteFlow)=q if   useSoluteFlowInput annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={40,40})));

        Types.MolarFlowRate q "Current solute flow";
      equation
        if not useSoluteFlowInput then
          q = SoluteFlow;
        end if;

      end ConditionalSoluteFlow;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>",   info="<html>
<p>In physiology books, chapters about chemical substances are organized by their types. The main reason for this is that each substance in the human body is regulated in a different way. For example the regulation of sodium is different from the regulation of potassium, and from the regulation of glucose, and so on. This view leads to the idea of having separate models of each substance. The origin of different flows and regulations is the (cellular) membrane. Water and solutions can cross it in different directions at the same time. Crossings occur for different reasons: water is driven mostly by osmotic gradients, electrolytes are driven by charge to reach Donnan&apos;s equilibrium, and some solutes can even be actively transported against their concentration or electrical gradients. And all this is specifically driven from the higher levels by neural and hormonal responses.&nbsp; </p>
<p>In Physiolibrary flows and fluxes of solutes are supported mostly by the Chemical package. All parts inside this Chemical package use the connector ChemicalPort, which defines the molar concentration and molar flow/flux rate of one solute. This is the supporting infrastructure for modeling membrane diffusion, accumulations of substances, reversal chemical reactions, Henry&apos;s law of gas solubility, dilution with additional solvent flow, membrane reabsorption, chemical degradation and physiological clearance. </p>
</html>"));
  end Chemical;

  package Osmotic "Please use 'Chemical' library instead!"
   extends Modelica.Icons.Package;

    package Components
      extends Modelica.Icons.Package;

      model OsmoticCell "Solvent container"
        extends Icons.OsmoticCell;
        extends SteadyStates.Interfaces.SteadyState(
                                           state_start=volume_start, storeUnit=
            "mOsm/l");

        parameter Integer NumberOfMembraneTypes=1
        "Membrane type is determined by membrane permeabilities for substances.";

        Interfaces.OsmoticPort_a
                            q_in[NumberOfMembraneTypes]
        "Flux to/from osmotic compartment"                                                 annotation (Placement(
              transformation(extent={{-10,-10},{10,10}})));
        parameter Types.Volume volume_start = 0.001
        "Initial volume of compartment"
           annotation (Dialog(group="Initialization"));

        parameter Boolean useImpermeableSolutesInput = false
        "=true, if impermeable substance amount as an input"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

        parameter Types.AmountOfSubstance ImpermeableSolutes[NumberOfMembraneTypes]=zeros(NumberOfMembraneTypes)
        "Amount of impermeable substance if useImpermeableSolutesInput=false"
          annotation (Dialog(enable=not useImpermeableSolutesInput));

        Types.RealIO.AmountOfSubstanceInput impermeableSolutes[NumberOfMembraneTypes](start=ImpermeableSolutes)= is if useImpermeableSolutesInput
        "Amount of impermeable solutes in compartment"                                                                                      annotation (Placement(transformation(extent={{-100,40},
                  {-60,80}})));
        Types.RealIO.VolumeOutput volume "Actual volume of compartment"
          annotation (Placement(transformation(extent={{16,-64},{56,-24}}),
              iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100})));
    protected
        Types.AmountOfSubstance is[NumberOfMembraneTypes]
        "Current amount of impermeable solutes";
      equation
        if not useImpermeableSolutesInput then
          is=ImpermeableSolutes;
        end if;

        q_in.o = is / volume;

        change = ones(NumberOfMembraneTypes) * q_in.q;    //der(volume)=q_in.q
        state = volume;

        //  assert(volume>=-Modelica.Constants.eps,"Collapsed cells by osmotic pressure are not supported!");

        annotation ( Icon(coordinateSystem(
                preserveAspectRatio=false,extent={{-100,-100},{100,100}}),
                                                     graphics={
                                     Text(
                extent={{-80,100},{240,140}},
                textString="%name",
                lineColor={0,0,255})}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>The liquid volume of the penetrating solution is accumulated in &QUOT;OsmoticCell&QUOT;, where the nonpenetrating solutes are held. Instances of this class can represent both sides of the membrane, for example intracellular space, extracellular space, interstitial space, blood plasma or cerebrospinal fluid.</p>
</html>"));
      end OsmoticCell;

      model Membrane "Solvent diffusion through semipermeable membrane"
       extends Interfaces.OnePort;
       extends Icons.Membrane; //Icons.Resistor;

       parameter Boolean useConductanceInput = false
        "=true, if membrane permeability input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

       parameter Types.OsmoticPermeability cond=1e-15
        "Membrane permeability for solvent if useConductanceInput = false"
            annotation (Dialog(enable=not useConductanceInput));

        parameter Boolean useHydraulicPressureInputs = false
        "=true, if hydraulic pressure inputs is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

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
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

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

        Types.OsmoticPermeability perm;

        Types.Pressure opi "osmotic pressure at q_in", opo
        "osmotic pressure at q_out";
    protected
        Types.Pressure pi,po;
        Types.Temperature ti,to;

    public
        Types.RealIO.OsmoticPermeabilityInput conduction=perm if useConductanceInput
          annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80}),   iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));
      equation
        if not useHydraulicPressureInputs then
          pi=HydraulicPressureIn;
          po=HydraulicPressureOut;
        end if;
        if not useTemperatureInputs then
          ti=T;
          to=T;
        end if;
        if not useConductanceInput then
          cond=perm;
        end if;

        q_in.q = perm * ( (-po + q_out.o*(Modelica.Constants.R*to)) - (-pi + q_in.o*(Modelica.Constants.R*ti)));

        opi = q_in.o*(Modelica.Constants.R*ti);
        opo = q_out.o*(Modelica.Constants.R*to);
        annotation (        Documentation(revisions="<html>
<p><i>2009-2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",   info="<html>
<p>The main element of osmotic phenomena is a semipermeable membrane, which generates the flow of penetrating substances together with water. The connector on both sides is composed of molar concentration of non-penetrating solutes (osmolarity), and from penetrating volumetric flow (osmotic flux). Flow through the membrane depends on a pressure gradient, where pressure on both sides is calculated from the osmotic and hydraulic component.</p>
</html>"),   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}),      graphics={
                                     Text(
                extent={{-140,112},{140,150}},
                textString="%name",
                lineColor={0,0,255})}));
      end Membrane;

      model SolventFlux "Prescripted solvent flow"
        extends Interfaces.OnePort;
        extends Hydraulic.Interfaces.ConditionalSolutionFlow;

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
                lineColor={127,127,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-78,25},{82,0},{-78,-25},{-78,25}},
                lineColor={127,127,0},
                fillColor={127,127,0},
                fillPattern=FillPattern.Solid)}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SolventFlux;
    end Components;

    package Sources
      extends Modelica.Icons.SourcesPackage;

      model SolventInflux "Prescribed solvent inflow"
        extends Hydraulic.Interfaces.ConditionalSolutionFlow;

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
                lineColor={127,127,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-48,20},{50,0},{-48,-21},{-48,20}},
                lineColor={127,127,0},
                fillColor={127,127,0},
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
       extends Hydraulic.Interfaces.ConditionalSolutionFlow;
        Interfaces.OsmoticPort_a
                            q_in
                               annotation ( Placement(
              transformation(extent={{-70,-10},{-50,10}})));
      equation
        q_in.q = q;

       annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Rectangle(
                extent={{-60,-30},{60,30}},
                lineColor={127,127,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-46,22},{52,0},{-46,-22},{-46,22}},
                lineColor={127,127,0},
                fillColor={127,127,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-78,-58},{72,-36}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SolventOutflux;
    end Sources;

    package Interfaces
      extends Modelica.Icons.InterfacesPackage;

       connector OsmoticPort
      "Flux through semipermeable membrane by osmotic pressure gradient"
        Types.Concentration o
        "Osmolarity is the molar concentration of the impermeable solutes";
        flow Types.VolumeFlowRate q
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
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
</html>",   info="<html>
<p>One of the basic phenomenon of biological systems is the osmotically-driven flow of water. This is always connected with semipermeable membranes. The different concentrations of impermeable solutes on both sides of the membrane causes the hydrostatic pressure at the concentrated side to rise. This pressure difference is called osmotic pressure. Osmotic pressure is linearly proportional to the concentration gradient of impermeable solutes. The osmolarity (osmotic concentration) is also one of the main indexes of human body balance, called homeostasis. Its value should not significantly deviate for a long period of time from a value of 285-295 mosm/l. </p>
<p>In Physiolibrary the osmotic connector OsmoticPort is composed of the osmotic concentration and the volumetric flux of permeable liquid. The two main blocks are called Membrane and OsmoticCell. Here, inside the membrane blocks, it is of course possible to also define hydraulic pressure and temperatures effects on both sides of membrane. </p>
</html>"));
  end Osmotic;
  annotation (preferredView="info",
version="2.3.1",
versionBuild=1,
versionDate="2015-09-15",
dateModified = "2015-09-15 12:49:00Z",
revisionId="",
uses(Modelica(version="3.2.1")),
conversion(
  from(version="BioChem-1.0.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertBioChem_1.0.1_to_Physiolibrary_2.3.mos"),
  from(version="0.4980", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_0.4980_to_2.3.mos"),
  from(version="1.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.0_to_2.3.mos"),
  from(version="1.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.1_to_2.3.mos"),
  from(version="1.2", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_1.2_to_2.3.mos"),
  from(version="2.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.0_to_2.3.mos"),
  from(version="2.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_2.3.mos"),
  from(version="2.1.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_2.3.mos"),
  from(version="2.1.1", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_2.3.mos"),
  from(version="2.1.2", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.1_to_2.3.mos"),
  from(version="2.2.0", script="modelica://Physiolibrary/Resources/Scripts/Dymola/ConvertPhysiolibrary_from_2.2_to_2.3.mos")),
  Documentation(revisions="<html>
<p>Copyright (c) 2008-2015, Marek Matej&aacute;k, Charles University in Prague </p>
<p>All rights reserved. </p>
<p>Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met: </p>
<ol>
<li>Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. </li>
<li>Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. </li>
<li>Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. </li>
</ol>
<p>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS &QUOT;AS IS&QUOT; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.</p>
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

package Modelica "Modelica Standard Library - Version 3.2.1 (Build 2)"
extends Modelica.Icons.Package;

  package Blocks
  "Library of basic input/output control blocks (continuous, discrete, logical, table blocks)"
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Package;

    package Continuous
    "Library of continuous control blocks with internal states"
      import Modelica.Blocks.Interfaces;
      import Modelica.SIunits;
      extends Modelica.Icons.Package;

      block TransferFunction "Linear transfer function"
        import Modelica.Blocks.Types.Init;
        extends Interfaces.SISO;

        parameter Real b[:]={1}
        "Numerator coefficients of transfer function (e.g., 2*s+3 is specified as {2,3})";
        parameter Real a[:]={1}
        "Denominator coefficients of transfer function (e.g., 5*s+6 is specified as {5,6})";
        parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit
        "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
                                           annotation(Evaluate=true, Dialog(group=
                "Initialization"));
        parameter Real x_start[size(a, 1) - 1]=zeros(nx)
        "Initial or guess values of states"
          annotation (Dialog(group="Initialization"));
        parameter Real y_start=0
        "Initial value of output (derivatives of y are zero upto nx-1-th derivative)"
          annotation(Dialog(enable=initType == Init.InitialOutput, group=
                "Initialization"));
        output Real x[size(a, 1) - 1](start=x_start)
        "State of transfer function from controller canonical form";
    protected
        parameter Integer na=size(a, 1)
        "Size of Denominator of transfer function.";
        parameter Integer nb=size(b, 1)
        "Size of Numerator of transfer function.";
        parameter Integer nx=size(a, 1) - 1;
        parameter Real bb[:] = vector([zeros(max(0,na-nb),1);b]);
        parameter Real d = bb[1]/a[1];
        parameter Real a_end = if a[end] > 100*Modelica.Constants.eps*sqrt(a*a) then a[end] else 1.0;
        Real x_scaled[size(x,1)] "Scaled vector x";

      initial equation
        if initType == Init.SteadyState then
          der(x_scaled) = zeros(nx);
        elseif initType == Init.InitialState then
          x_scaled = x_start*a_end;
        elseif initType == Init.InitialOutput then
          y = y_start;
          der(x_scaled[2:nx]) = zeros(nx-1);
        end if;
      equation
        assert(size(b,1) <= size(a,1), "Transfer function is not proper");
        if nx == 0 then
           y = d*u;
        else
           der(x_scaled[1])    = (-a[2:na]*x_scaled + a_end*u)/a[1];
           der(x_scaled[2:nx]) = x_scaled[1:nx-1];
           y = ((bb[2:na] - d*a[2:na])*x_scaled)/a_end + d*u;
           x = x_scaled/a_end;
        end if;
        annotation (
          Documentation(info="<html>
<p>
This block defines the transfer function between the input
u and the output y
as (nb = dimension of b, na = dimension of a):
</p>
<pre>
           b[1]*s^[nb-1] + b[2]*s^[nb-2] + ... + b[nb]
   y(s) = --------------------------------------------- * u(s)
           a[1]*s^[na-1] + a[2]*s^[na-2] + ... + a[na]
</pre>
<p>
State variables <b>x</b> are defined according to <b>controller canonical</b>
form. Internally, vector <b>x</b> is scaled to improve the numerics (the states in versions before version 3.0 of the Modelica Standard Library have been not scaled). This scaling is
not visible from the outside of this block because the non-scaled vector <b>x</b>
is provided as output signal and the start value is with respect to the non-scaled
vector <b>x</b>.
Initial values of the states <b>x</b> can be set via parameter <b>x_start</b>.
</p>

<p>
Example:
</p>
<pre>
     TransferFunction g(b = {2,4}, a = {1,3});
</pre>
<p>
results in the following transfer function:
</p>
<pre>
        2*s + 4
   y = --------- * u
         s + 3
</pre>
</html>"),Icon(
              coordinateSystem(preserveAspectRatio=true,
                extent={{-100.0,-100.0},{100.0,100.0}},
                initialScale=0.1),
                graphics={
              Line(visible=true,
                points={{-80.0,0.0},{80.0,0.0}},
                color={0,0,127}),
            Text(visible=true,
              lineColor={0,0,127},
              extent={{-90.0,10.0},{90.0,90.0}},
              textString="b(s)"),
            Text(visible=true,
              lineColor={0,0,127},
              extent={{-90.0,-90.0},{90.0,-10.0}},
              textString="a(s)")}),
          Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Line(points={{40,0},{-40,0}}, color={0,0,0}),
              Text(
                extent={{-55,55},{55,5}},
                lineColor={0,0,0},
                textString="b(s)"),
              Text(
                extent={{-55,-5},{55,-55}},
                lineColor={0,0,0},
                textString="a(s)"),
              Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
              Line(points={{-100,0},{-60,0}}, color={0,0,255}),
              Line(points={{60,0},{100,0}}, color={0,0,255})}));
      end TransferFunction;
      annotation (
        Documentation(info="<html>
<p>
This package contains basic <b>continuous</b> input/output blocks
described by differential equations.
</p>

<p>
All blocks of this package can be initialized in different
ways controlled by parameter <b>initType</b>. The possible
values of initType are defined in
<a href=\"modelica://Modelica.Blocks.Types.Init\">Modelica.Blocks.Types.Init</a>:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>Name</b></td>
      <td valign=\"top\"><b>Description</b></td></tr>

  <tr><td valign=\"top\"><b>Init.NoInit</b></td>
      <td valign=\"top\">no initialization (start values are used as guess values with fixed=false)</td></tr>

  <tr><td valign=\"top\"><b>Init.SteadyState</b></td>
      <td valign=\"top\">steady state initialization (derivatives of states are zero)</td></tr>

  <tr><td valign=\"top\"><b>Init.InitialState</b></td>
      <td valign=\"top\">Initialization with initial states</td></tr>

  <tr><td valign=\"top\"><b>Init.InitialOutput</b></td>
      <td valign=\"top\">Initialization with initial outputs (and steady state of the states if possible)</td></tr>
</table>

<p>
For backward compatibility reasons the default of all blocks is
<b>Init.NoInit</b>, with the exception of Integrator and LimIntegrator
where the default is <b>Init.InitialState</b> (this was the initialization
defined in version 2.2 of the Modelica standard library).
</p>

<p>
In many cases, the most useful initial condition is
<b>Init.SteadyState</b> because initial transients are then no longer
present. The drawback is that in combination with a non-linear
plant, non-linear algebraic equations occur that might be
difficult to solve if appropriate guess values for the
iteration variables are not provided (i.e., start values with fixed=false).
However, it is often already useful to just initialize
the linear blocks from the Continuous blocks library in SteadyState.
This is uncritical, because only linear algebraic equations occur.
If Init.NoInit is set, then the start values for the states are
interpreted as <b>guess</b> values and are propagated to the
states with fixed=<b>false</b>.
</p>

<p>
Note, initialization with Init.SteadyState is usually difficult
for a block that contains an integrator
(Integrator, LimIntegrator, PI, PID, LimPID).
This is due to the basic equation of an integrator:
</p>

<pre>
  <b>initial equation</b>
     <b>der</b>(y) = 0;   // Init.SteadyState
  <b>equation</b>
     <b>der</b>(y) = k*u;
</pre>

<p>
The steady state equation leads to the condition that the input to the
integrator is zero. If the input u is already (directly or indirectly) defined
by another initial condition, then the initialization problem is <b>singular</b>
(has none or infinitely many solutions). This situation occurs often
for mechanical systems, where, e.g., u = desiredSpeed - measuredSpeed and
since speed is both a state and a derivative, it is always defined by
Init.InitialState or Init.SteadyState initialization.
</p>

<p>
In such a case, <b>Init.NoInit</b> has to be selected for the integrator
and an additional initial equation has to be added to the system
to which the integrator is connected. E.g., useful initial conditions
for a 1-dim. rotational inertia controlled by a PI controller are that
<b>angle</b>, <b>speed</b>, and <b>acceleration</b> of the inertia are zero.
</p>

</html>"),     Icon(graphics={Line(
              origin={0.061,4.184},
              points={{81.939,36.056},{65.362,36.056},{14.39,-26.199},{-29.966,
                  113.485},{-65.374,-61.217},{-78.061,-78.184}},
              color={95,95,95},
              smooth=Smooth.Bezier)}));
    end Continuous;

    package Interfaces
    "Library of connectors and partial models for input/output blocks"
      import Modelica.SIunits;
      extends Modelica.Icons.InterfacesPackage;

      connector RealInput = input Real "'input Real' as connector" annotation (
        defaultComponentName="u",
        Icon(graphics={
          Polygon(
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            points={{-100.0,100.0},{100.0,0.0},{-100.0,-100.0}})},
          coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}},
            preserveAspectRatio=true,
            initialScale=0.2)),
        Diagram(
          coordinateSystem(preserveAspectRatio=true,
            initialScale=0.2,
            extent={{-100.0,-100.0},{100.0,100.0}}),
            graphics={
          Polygon(
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid,
            points={{0.0,50.0},{100.0,0.0},{0.0,-50.0},{0.0,50.0}}),
          Text(
            lineColor={0,0,127},
            extent={{-10.0,60.0},{-10.0,85.0}},
            textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));

      connector RealOutput = output Real "'output Real' as connector" annotation (
        defaultComponentName="y",
        Icon(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1),
            graphics={
          Polygon(
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            points={{-100.0,100.0},{100.0,0.0},{-100.0,-100.0}})}),
        Diagram(
          coordinateSystem(preserveAspectRatio=true,
            extent={{-100.0,-100.0},{100.0,100.0}},
            initialScale=0.1),
            graphics={
          Polygon(
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            points={{-100.0,50.0},{0.0,0.0},{-100.0,-50.0}}),
          Text(
            lineColor={0,0,127},
            extent={{30.0,60.0},{30.0,110.0}},
            textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one output signal of type Real.
</p>
</html>"));

      connector BooleanInput = input Boolean "'input Boolean' as connector"
        annotation (
        defaultComponentName="u",
        Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid)}, coordinateSystem(
            extent={{-100,-100},{100,100}},
            preserveAspectRatio=true,
            initialScale=0.2)),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            initialScale=0.2,
            extent={{-100,-100},{100,100}}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={255,0,255},
              fillColor={255,0,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={255,0,255},
              textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one input signal of type Boolean.
</p>
</html>"));

      connector BooleanOutput = output Boolean "'output Boolean' as connector"
        annotation (
        defaultComponentName="y",
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={255,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={255,0,255},
              textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one output signal of type Boolean.
</p>
</html>"));

      partial block SISO "Single Input Single Output continuous control block"
        extends Modelica.Blocks.Icons.Block;

        RealInput u "Connector of Real input signal" annotation (Placement(
              transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
        RealOutput y "Connector of Real output signal" annotation (Placement(
              transformation(extent={{100,-10},{120,10}}, rotation=0)));
        annotation (Documentation(info="<html>
<p>
Block has one continuous Real input and one continuous Real output signal.
</p>
</html>"));
      end SISO;

      partial block SI2SO
      "2 Single Input / 1 Single Output continuous control block"
        extends Modelica.Blocks.Icons.Block;

        RealInput u1 "Connector of Real input signal 1" annotation (Placement(
              transformation(extent={{-140,40},{-100,80}}, rotation=0)));
        RealInput u2 "Connector of Real input signal 2" annotation (Placement(
              transformation(extent={{-140,-80},{-100,-40}}, rotation=0)));
        RealOutput y "Connector of Real output signal" annotation (Placement(
              transformation(extent={{100,-10},{120,10}}, rotation=0)));

        annotation (Documentation(info="<html>
<p>
Block has two continuous Real input signals u1 and u2 and one
continuous Real output signal y.
</p>
</html>"));

      end SI2SO;

      partial block MISO
      "Multiple Input Single Output continuous control block"

        extends Modelica.Blocks.Icons.Block;
        parameter Integer nin=1 "Number of inputs";
        RealInput u[nin] "Connector of Real input signals" annotation (Placement(
              transformation(extent={{-140,-20},{-100,20}}, rotation=0)));
        RealOutput y "Connector of Real output signal" annotation (Placement(
              transformation(extent={{100,-10},{120,10}}, rotation=0)));
        annotation (Documentation(info="<HTML>
<p>
Block has a vector of continuous Real input signals and
one continuous Real output signal.
</p>
</html>"));
      end MISO;

      partial block partialBooleanThresholdComparison
      "Partial block to compare the Real input u with a threshold and provide the result as 1 Boolean output signal"

        parameter Real threshold=0 "Comparison with respect to threshold";

        Blocks.Interfaces.RealInput u "Connector of Boolean input signal"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
                rotation=0)));
        Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal"
          annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));

        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                lineThickness=5.0,
                fillColor={210,210,210},
                fillPattern=FillPattern.Solid,
                borderPattern=BorderPattern.Raised),
              Text(
                extent={{-150,-140},{150,-110}},
                lineColor={0,0,0},
                textString="%threshold"),
              Ellipse(
                extent={{71,7},{85,-7}},
                lineColor=DynamicSelect({235,235,235}, if y > 0.5 then {0,255,0}
                     else {235,235,235}),
                fillColor=DynamicSelect({235,235,235}, if y > 0.5 then {0,255,0}
                     else {235,235,235}),
                fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
Block has one continuous Real input and one continuous Boolean output signal
as well as a 3D icon (e.g., used in Blocks.Logical library).
</p>
</html>"));

      end partialBooleanThresholdComparison;
      annotation (Documentation(info="<HTML>
<p>
This package contains interface definitions for
<b>continuous</b> input/output blocks with Real,
Integer and Boolean signals. Furthermore, it contains
partial models for continuous and discrete blocks.
</p>

</html>",     revisions="<html>
<ul>
<li><i>Oct. 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Added several new interfaces.
<li><i>Oct. 24, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       RealInputSignal renamed to RealInput. RealOutputSignal renamed to
       output RealOutput. GraphBlock renamed to BlockIcon. SISOreal renamed to
       SISO. SOreal renamed to SO. I2SOreal renamed to M2SO.
       SignalGenerator renamed to SignalSource. Introduced the following
       new models: MIMO, MIMOs, SVcontrol, MVcontrol, DiscreteBlockIcon,
       DiscreteBlock, DiscreteSISO, DiscreteMIMO, DiscreteMIMOs,
       BooleanBlockIcon, BooleanSISO, BooleanSignalSource, MI2BooleanMOs.</li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.</li>
</ul>
</html>"));
    end Interfaces;

    package Logical
    "Library of components with Boolean input and output signals"
      extends Modelica.Icons.Package;

      block GreaterThreshold
      "Output y is true, if input u is greater than threshold"
        extends Blocks.Interfaces.partialBooleanThresholdComparison;
      equation
        y = u > threshold;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}), graphics={Text(
                extent={{-90,-40},{60,40}},
                lineColor={0,0,0},
                textString=">")}), Documentation(info="<html>
<p>
The output is <b>true</b> if the Real input is greater than
parameter <b>threshold</b>, otherwise
the output is <b>false</b>.
</p>
</html>"));
      end GreaterThreshold;

      block Switch "Switch between two Real signals"
        extends Modelica.Blocks.Icons.PartialBooleanBlock;
        Blocks.Interfaces.RealInput u1 "Connector of first Real input signal"
          annotation (Placement(transformation(extent={{-140,60},{-100,100}},
                rotation=0)));
        Blocks.Interfaces.BooleanInput u2 "Connector of Boolean input signal"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
                rotation=0)));
        Blocks.Interfaces.RealInput u3 "Connector of second Real input signal"
          annotation (Placement(transformation(extent={{-140,-100},{-100,-60}},
                rotation=0)));
        Blocks.Interfaces.RealOutput y "Connector of Real output signal"
          annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));

      equation
        y = if u2 then u1 else u3;
        annotation (
          defaultComponentName="switch1",
          Documentation(info="<html>
<p>The Logical.Switch switches, depending on the
logical connector u2 (the middle connector)
between the two possible input signals
u1 (upper connector) and u3 (lower connector).</p>
<p>If u2 is <b>true</b>, the output signal y is set equal to
u1, else it is set equal to u3.</p>
</html>"),Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              initialScale=0.1), graphics={
              Line(points={{12.0,0.0},{100.0,0.0}},
                color={0,0,127}),
              Line(points={{-100.0,0.0},{-40.0,0.0}},
                color={255,0,255}),
              Line(points={{-100.0,-80.0},{-40.0,-80.0},{-40.0,-80.0}},
                color={0,0,127}),
              Line(points={{-40.0,12.0},{-40.0,-12.0}},
                color={255,0,255}),
              Line(points={{-100.0,80.0},{-38.0,80.0}},
                color={0,0,127}),
              Line(points={{-38.0,80.0},{6.0,2.0}},
                color={0,0,127},
                thickness=1.0),
              Ellipse(lineColor={0,0,255},
                pattern=LinePattern.None,
                fillPattern=FillPattern.Solid,
                extent={{2.0,-8.0},{18.0,8.0}})}));
      end Switch;
      annotation (Documentation(info="<html>
<p>
This package provides blocks with Boolean input and output signals
to describe logical networks. A typical example for a logical
network built with package Logical is shown in the next figure:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/LogicalNetwork1.png\"
     alt=\"LogicalNetwork1.png\">
</p>

<p>
The actual value of Boolean input and/or output signals is displayed
in the respective block icon as \"circle\", where \"white\" color means
value <b>false</b> and \"green\" color means value <b>true</b>. These
values are visualized in a diagram animation.
</p>
</html>"),     Icon(graphics={Line(
              visible=true,
              points={{-86,-22},{-50,-22},{-50,22},{48,22},{48,-22},{88,-24}},
              color={255,0,255})}));
    end Logical;

    package Math
    "Library of Real mathematical functions as input/output blocks"
      import Modelica.SIunits;
      import Modelica.Blocks.Interfaces;
      extends Modelica.Icons.Package;

          block Gain "Output the product of a gain value with the input signal"

            parameter Real k(start=1, unit="1")
        "Gain value multiplied with input signal";
    public
            Interfaces.RealInput u "Input signal connector"
              annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
                rotation=0)));
            Interfaces.RealOutput y "Output signal connector"
              annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));

          equation
            y = k*u;
            annotation (
              Documentation(info="<html>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>

</html>"),           Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-150,-140},{150,-100}},
                lineColor={0,0,0},
                textString="k=%k"),
              Text(
                extent={{-150,140},{150,100}},
                textString="%name",
                lineColor={0,0,255})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={Polygon(
                points={{-100,-100},{-100,100},{100,0},{-100,-100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-76,38},{0,-34}},
                textString="k",
                lineColor={0,0,255})}));
          end Gain;

          block Sum "Output the sum of the elements of the input vector"
            extends Interfaces.MISO;
            parameter Real k[nin]=ones(nin) "Optional: sum coefficients";
          equation
            y = k*u;
            annotation (defaultComponentName="sum1",
              Documentation(info="<html>
<p>
This blocks computes output <b>y</b> as
<i>sum</i> of the elements of the input signal vector
<b>u</b>:
</p>
<pre>
    <b>y</b> = <b>u</b>[1] + <b>u</b>[2] + ...;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   nin = 3;

  results in the following equations:

     y = u[1] + u[2] + u[3];
</pre>

</html>"),           Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={Line(
                points={{26,42},{-34,42},{6,2},{-34,-38},{26,-38}},
                color={0,0,0},
                thickness=0.25), Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Line(
                points={{26,42},{-34,42},{6,2},{-34,-38},{26,-38}},
                color={0,0,0},
                thickness=0.25)}));
          end Sum;

          block Feedback
      "Output difference between commanded and feedback input"

            Interfaces.RealInput u1 annotation (Placement(transformation(
                extent={{-100,-20},{-60,20}}, rotation=0)));
            Interfaces.RealInput u2
              annotation (Placement(transformation(
              origin={0,-80},
              extent={{-20,-20},{20,20}},
              rotation=90)));
            Interfaces.RealOutput y annotation (Placement(transformation(
                extent={{80,-10},{100,10}}, rotation=0)));

          equation
            y = u1 - u2;
            annotation (
              Documentation(info="<html>
<p>
This blocks computes output <b>y</b> as <i>difference</i> of the
commanded input <b>u1</b> and the feedback
input <b>u2</b>:
</p>
<pre>
    <b>y</b> = <b>u1</b> - <b>u2</b>;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   n = 2

  results in the following equations:

     y = u1 - u2
</pre>

</html>"),           Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, initialScale = 0.1), graphics = {
                Ellipse(
                  lineColor=  {0,0,127},
                  fillColor=  {235,235,235},
                  fillPattern=  FillPattern.Solid,
                  extent=  {{-20,-20},{20,20}}),
                Line(points=  {{-60,0},{-20,0}}, color=  {0,0,127}),
                Line(points=  {{20,0},{80,0}}, color=  {0,0,127}),
                Line(points=  {{0,-20},{0,-60}}, color=  {0,0,127}),
                Text(extent=  {{-14,-94},{82,0}}, textString=  "-"),
                Text(
                  lineColor=  {0,0,255},
                  extent=  {{-150,44},{150,94}},
                  textString=  "%name")}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Ellipse(
                extent={{-20,20},{20,-20}},
                pattern=LinePattern.Solid,
                lineThickness=0.25,
                fillColor={235,235,235},
                fillPattern=FillPattern.Solid,
                lineColor={0,0,255}),
              Line(points={{-60,0},{-20,0}}, color={0,0,255}),
              Line(points={{20,0},{80,0}}, color={0,0,255}),
              Line(points={{0,-20},{0,-60}}, color={0,0,255}),
              Text(
                extent={{-12,10},{84,-84}},
                lineColor={0,0,0},
                textString="-")}));
          end Feedback;

          block Add "Output the sum of the two inputs"
            extends Interfaces.SI2SO;

            parameter Real k1=+1 "Gain of upper input";
            parameter Real k2=+1 "Gain of lower input";

          equation
            y = k1*u1 + k2*u2;
            annotation (
              Documentation(info="<html>
<p>
This blocks computes output <b>y</b> as <i>sum</i> of the
two input signals <b>u1</b> and <b>u2</b>:
</p>
<pre>
    <b>y</b> = k1*<b>u1</b> + k2*<b>u2</b>;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   k1= +2, k2= -3

  results in the following equations:

     y = 2 * u1 - 3 * u2
</pre>

</html>"),           Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, initialScale = 0.1), graphics = {
                Text(
                  lineColor=  {0,0,255},
                  extent=  {{-150,110},{150,150}},
                  textString=  "%name"),
                Line(
                  points=  {{-100,60},{-74,24},{-44,24}},
                  color=  {0,0,127}),
                Line(
                  points=  {{-100,-60},{-74,-28},{-42,-28}},
                  color=  {0,0,127}),
                Ellipse(
                  lineColor=  {0,0,127},
                  extent=  {{-50,-50},{50,50}}),
                Line(
                  points=  {{50,0},{100,0}},
                  color=  {0,0,127}),
                Text(
                  extent=  {{-38,-34},{38,34}},
                  textString=  "+"),
                Text(
                  extent=  {{-100,52},{5,92}},
                  textString=  "%k1"),
                Text(
                  extent=  {{-100,-92},{5,-52}},
                  textString=  "%k2")}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{50,0},{100,0}}, color={0,0,255}),
              Line(points={{-100,60},{-74,24},{-44,24}}, color={0,0,127}),
              Line(points={{-100,-60},{-74,-28},{-42,-28}}, color={0,0,127}),
              Ellipse(extent={{-50,50},{50,-50}}, lineColor={0,0,127}),
              Line(points={{50,0},{100,0}}, color={0,0,127}),
              Text(
                extent={{-36,38},{40,-30}},
                lineColor={0,0,0},
                textString="+"),
              Text(
                extent={{-100,52},{5,92}},
                lineColor={0,0,0},
                textString="k1"),
              Text(
                extent={{-100,-52},{5,-92}},
                lineColor={0,0,0},
                textString="k2")}));
          end Add;

          block Add3 "Output the sum of the three inputs"
            extends Modelica.Blocks.Icons.Block;

            parameter Real k1=+1 "Gain of upper input";
            parameter Real k2=+1 "Gain of middle input";
            parameter Real k3=+1 "Gain of lower input";
            Interfaces.RealInput u1 "Connector 1 of Real input signals"
              annotation (Placement(transformation(extent={{-140,60},{-100,100}},
                rotation=0)));
            Interfaces.RealInput u2 "Connector 2 of Real input signals"
              annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
                rotation=0)));
            Interfaces.RealInput u3 "Connector 3 of Real input signals"
              annotation (Placement(transformation(extent={{-140,-100},{-100,-60}},
                rotation=0)));
            Interfaces.RealOutput y "Connector of Real output signals"
              annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));

          equation
            y = k1*u1 + k2*u2 + k3*u3;
            annotation (
              Documentation(info="<html>
<p>
This blocks computes output <b>y</b> as <i>sum</i> of the
three input signals <b>u1</b>, <b>u2</b> and <b>u3</b>:
</p>
<pre>
    <b>y</b> = k1*<b>u1</b> + k2*<b>u2</b> + k3*<b>u3</b>;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   k1= +2, k2= -3, k3=1;

  results in the following equations:

     y = 2 * u1 - 3 * u2 + u3;
</pre>

</html>"),           Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Text(
                extent={{-100,50},{5,90}},
                lineColor={0,0,0},
                textString="%k1"),
              Text(
                extent={{-100,-20},{5,20}},
                lineColor={0,0,0},
                textString="%k2"),
              Text(
                extent={{-100,-50},{5,-90}},
                lineColor={0,0,0},
                textString="%k3"),
              Text(
                extent={{2,36},{100,-44}},
                lineColor={0,0,0},
                textString="+")}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-100,50},{5,90}},
                lineColor={0,0,0},
                textString="k1"),
              Text(
                extent={{-100,-20},{5,20}},
                lineColor={0,0,0},
                textString="k2"),
              Text(
                extent={{-100,-50},{5,-90}},
                lineColor={0,0,0},
                textString="k3"),
              Text(
                extent={{2,46},{100,-34}},
                lineColor={0,0,0},
                textString="+")}));
          end Add3;

          block Product "Output product of the two inputs"
            extends Interfaces.SI2SO;

          equation
            y = u1*u2;
            annotation (
              Documentation(info="<html>
<p>
This blocks computes the output <b>y</b> (element-wise)
as <i>product</i> of the corresponding elements of
the two inputs <b>u1</b> and <b>u2</b>:
</p>
<pre>
    y = u1 * u2;
</pre>

</html>"),           Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, initialScale = 0.1), graphics={
                Line(
                  points = {{-100,60},{-40,60},{-30,40}},
                  color = {0,0,127}),
                Line(
                  points = {{-100,-60},{-40,-60},{-30,-40}},
                  color = {0,0,127}),
                Line(
                  points = {{50,0},{100,0}},
                  color = {0,0,127}),
                Line(
                  points = {{-30,0},{30,0}}),
                Line(
                  points = {{-15,25.99},{15,-25.99}}),
                Line(
                  points = {{-15,-25.99},{15,25.99}}),
                Ellipse(
                  lineColor = {0,0,127},
                  extent = {{-50,-50},{50,50}})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-100,60},{-40,60},{-30,40}}, color={0,0,255}),
              Line(points={{-100,-60},{-40,-60},{-30,-40}}, color={0,0,255}),
              Line(points={{50,0},{100,0}}, color={0,0,255}),
              Line(points={{-30,0},{30,0}}, color={0,0,0}),
              Line(points={{-15,25.99},{15,-25.99}}, color={0,0,0}),
              Line(points={{-15,-25.99},{15,25.99}}, color={0,0,0}),
              Ellipse(extent={{-50,50},{50,-50}}, lineColor={0,0,255})}));
          end Product;

          block Division "Output first input divided by second input"
            extends Interfaces.SI2SO;

          equation
            y = u1/u2;
            annotation (
              Documentation(info="<html>
<p>
This block computes the output <b>y</b> (element-wise)
by <i>dividing</i> the corresponding elements of
the two inputs <b>u1</b> and <b>u2</b>:
</p>
<pre>
    y = u1 / u2;
</pre>

</html>"),           Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100,-100},{100,100}}, initialScale = 0.1), graphics={
                Line(
                  points = {{50,0},{100,0}},
                  color = {0,0,127}),
                Line(
                  points = {{-30,0},{30,0}}),
                Ellipse(
                  fillPattern = FillPattern.Solid,
                  extent = {{-5,20},{5,30}}),
                Ellipse(
                  fillPattern = FillPattern.Solid,
                  extent = {{-5,-30},{5,-20}}),
                Ellipse(
                  lineColor = {0,0,127},
                  extent = {{-50,-50},{50,50}}),
                Text(
                  lineColor = {0,0,255},
                  extent = {{-150,110},{150,150}},
                  textString = "%name"),
                Line(
                  points = {{-100,60},{-66,60},{-40,30}},
                  color = {0,0,127}),
                Line(
                  points = {{-100,-60},{0,-60},{0,-50}},
                  color = {0,0,127})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{50,0},{100,0}}, color={0,0,255}),
              Line(points={{-30,0},{30,0}}, color={0,0,0}),
              Ellipse(
                extent={{-5,20},{5,30}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-5,-20},{5,-30}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(extent={{-50,50},{50,-50}}, lineColor={0,0,255}),
              Line(points={{-100,60},{-66,60},{-40,30}}, color={0,0,255}),
              Line(points={{-100,-60},{0,-60},{0,-50}}, color={0,0,255})}));
          end Division;
      annotation (
        Documentation(info="<html>
<p>
This package contains basic <b>mathematical operations</b>,
such as summation and multiplication, and basic <b>mathematical
functions</b>, such as <b>sqrt</b> and <b>sin</b>, as
input/output blocks. All blocks of this library can be either
connected with continuous blocks or with sampled-data blocks.
</p>
</html>",     revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New blocks added: RealToInteger, IntegerToReal, Max, Min, Edge, BooleanChange, IntegerChange.</li>
<li><i>August 7, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized (partly based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist).
</li>
</ul>
</html>"),     Icon(graphics={Line(
              points={{-80,-2},{-68.7,32.2},{-61.5,51.1},{-55.1,64.4},{-49.4,72.6},
                  {-43.8,77.1},{-38.2,77.8},{-32.6,74.6},{-26.9,67.7},{-21.3,57.4},
                  {-14.9,42.1},{-6.83,19.2},{10.1,-32.8},{17.3,-52.2},{23.7,-66.2},
                  {29.3,-75.1},{35,-80.4},{40.6,-82},{46.2,-79.6},{51.9,-73.5},{
                  57.5,-63.9},{63.9,-49.2},{72,-26.8},{80,-2}},
              color={95,95,95},
              smooth=Smooth.Bezier)}));
    end Math;

    package Nonlinear
    "Library of discontinuous or non-differentiable algebraic control blocks"
      import Modelica.Blocks.Interfaces;
      extends Modelica.Icons.Package;

          block DeadZone "Provide a region of zero output"
            parameter Real uMax(start=1) "Upper limits of dead zones";
            parameter Real uMin=-uMax "Lower limits of dead zones";
            parameter Boolean deadZoneAtInit = true
        "= false, if dead zone is ignored during initialization (i.e., y=u)";
            extends Interfaces.SISO;

          equation
            assert(uMax >= uMin, "DeadZone: Limits must be consistent. However, uMax (=" + String(uMax) +
                                 ") < uMin (=" + String(uMin) + ")");

            if initial() and not deadZoneAtInit then
               y = u;
            else
               y = smooth(0,if u > uMax then u - uMax else if u < uMin then u - uMin else 0);
            end if;
            annotation (
              Documentation(info="<html>
<p>
The DeadZone block defines a region of zero output.
</p>
<p>
If the input is within uMin ... uMax, the output
is zero. Outside of this zone, the output is a linear
function of the input with a slope of 1.
</p>
</html>"),           Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Line(points={{0,-90},{0,68}}, color={192,192,192}),
              Polygon(
                points={{0,90},{-8,68},{8,68},{0,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-90,0},{68,0}}, color={192,192,192}),
              Polygon(
                points={{90,0},{68,-8},{68,8},{90,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-80,-60},{-20,0},{20,0},{80,60}}, color={0,0,0}),
              Text(
                extent={{-150,-150},{150,-110}},
                lineColor={160,160,164},
                textString="uMax=%uMax"),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255})}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Line(points={{0,-60},{0,50}}, color={192,192,192}),
              Polygon(
                points={{0,60},{-5,50},{5,50},{0,60}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-76,0},{74,0}}, color={192,192,192}),
              Polygon(
                points={{84,0},{74,-5},{74,5},{84,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-81,-40},{-38,0},{40,0},{80,40}}, color={0,0,0}),
              Text(
                extent={{62,-7},{88,-25}},
                lineColor={128,128,128},
                textString="u"),
              Text(
                extent={{-36,72},{-5,50}},
                lineColor={128,128,128},
                textString="y"),
              Text(
                extent={{-51,1},{-28,19}},
                lineColor={128,128,128},
                textString="uMin"),
              Text(
                extent={{27,21},{52,5}},
                lineColor={128,128,128},
                textString="uMax")}));
          end DeadZone;
          annotation (
            Documentation(info="<html>
<p>
This package contains <b>discontinuous</b> and
<b>non-differentiable, algebraic</b> input/output blocks.
</p>
</html>",     revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New block VariableLimiter added.
<li><i>August 22, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.
</li>
</ul>
</html>"),     Icon(graphics={Line(points={{-80,-66},{-26,-66},{28,52},{88,52}},
                color={95,95,95})}));
    end Nonlinear;

    package Types
    "Library of constants and types with choices, especially to build menus"
      extends Modelica.Icons.TypesPackage;

      type Init = enumeration(
        NoInit
          "No initialization (start values are used as guess values with fixed=false)",

        SteadyState
          "Steady state initialization (derivatives of states are zero)",
        InitialState "Initialization with initial states",
        InitialOutput
          "Initialization with initial outputs (and steady state of the states if possible)")
      "Enumeration defining initialization of a block"   annotation (Evaluate=true,
        Documentation(info="<html>
  <p>The following initialization alternatives are available:</p>
  <dl>
    <dt><code><strong>NoInit</strong></code></dt>
      <dd>No initialization (start values are used as guess values with <code>fixed=false</code>)</dd>
    <dt><code><strong>SteadyState</strong></code></dt>
      <dd>Steady state initialization (derivatives of states are zero)</dd>
    <dt><code><strong>InitialState</strong></code></dt>
      <dd>Initialization with initial states</dd>
    <dt><code><strong>InitialOutput</strong></code></dt>
      <dd>Initialization with initial outputs (and steady state of the states if possible)</dd>
  </dl>
</html>"));
      annotation (Documentation(info="<HTML>
<p>
In this package <b>types</b>, <b>constants</b> and <b>external objects</b> are defined that are used
in library Modelica.Blocks. The types have additional annotation choices
definitions that define the menus to be built up in the graphical
user interface when the type is used as parameter in a declaration.
</p>
</HTML>"));
    end Types;

    package Icons "Icons for Blocks"
        extends Modelica.Icons.IconsPackage;

        partial block Block "Basic graphical layout of input/output block"

          annotation (
            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255})}),
          Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output
block (no declarations, no equations). Most blocks
of package Modelica.Blocks inherit directly or indirectly
from this block.
</p>
</html>"));

        end Block;

      partial block PartialBooleanBlock
      "Basic graphical layout of logical block"

        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(
                extent={{-100,100},{100,-100}},
                fillColor={210,210,210},
                lineThickness=5.0,
                fillPattern=FillPattern.Solid,
                borderPattern=BorderPattern.Raised), Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255})}),                        Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output,
Boolean block (no declarations, no equations) used especially
in the Blocks.Logical library.
</p>
</html>"));
      end PartialBooleanBlock;
    end Icons;
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100.0,-100.0},{100.0,100.0}}, initialScale=0.1), graphics={
        Rectangle(
          origin={0.0,35.1488},
          fillColor={255,255,255},
          extent={{-30.0,-20.1488},{30.0,20.1488}}),
        Rectangle(
          origin={0.0,-34.8512},
          fillColor={255,255,255},
          extent={{-30.0,-20.1488},{30.0,20.1488}}),
        Line(
          origin={-51.25,0.0},
          points={{21.25,-35.0},{-13.75,-35.0},{-13.75,35.0},{6.25,35.0}}),
        Polygon(
          origin={-40.0,35.0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{10.0,0.0},{-5.0,5.0},{-5.0,-5.0}}),
        Line(
          origin={51.25,0.0},
          points={{-21.25,35.0},{13.75,35.0},{13.75,-35.0},{-6.25,-35.0}}),
        Polygon(
          origin={40.0,-35.0},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{-10.0,0.0},{5.0,5.0},{5.0,-5.0}})}), Documentation(info="<html>
<p>
This library contains input/output blocks to build up block diagrams.
</p>

<dl>
<dt><b>Main Author:</b>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e. V. (DLR)<br>
    Oberpfaffenhofen<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br>
</dl>
<p>
Copyright &copy; 1998-2013, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</html>",   revisions="<html>
<ul>
<li><i>June 23, 2004</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Introduced new block connectors and adapted all blocks to the new connectors.
       Included subpackages Continuous, Discrete, Logical, Nonlinear from
       package ModelicaAdditions.Blocks.
       Included subpackage ModelicaAdditions.Table in Modelica.Blocks.Sources
       and in the new package Modelica.Blocks.Tables.
       Added new blocks to Blocks.Sources and Blocks.Logical.
       </li>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New subpackage Examples, additional components.
       </li>
<li><i>June 20, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and
       Michael Tiller:<br>
       Introduced a replaceable signal type into
       Blocks.Interfaces.RealInput/RealOutput:
<pre>
   replaceable type SignalType = Real
</pre>
       in order that the type of the signal of an input/output block
       can be changed to a physical type, for example:
<pre>
   Sine sin1(outPort(redeclare type SignalType=Modelica.SIunits.Torque))
</pre>
      </li>
<li><i>Sept. 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Renamed to Blocks. New subpackages Math, Nonlinear.
       Additional components in subpackages Interfaces, Continuous
       and Sources. </li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.</li>
</ul>
</html>"));
  end Blocks;

  package Math
  "Library of mathematical functions (e.g., sin, cos) and of functions operating on vectors and matrices"
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Package;

  package Icons "Icons for Math"
    extends Modelica.Icons.IconsPackage;

    partial function AxisLeft
    "Basic icon for mathematical function with y-axis on left side"

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-80},{-80,68}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Line(points={{-80,80},{-88,80}}, color={95,
              95,95}),Line(points={{-80,-80},{-88,-80}}, color={95,95,95}),Line(
              points={{-80,-90},{-80,84}}, color={95,95,95}),Text(
                  extent={{-75,104},{-55,84}},
                  lineColor={95,95,95},
                  textString="y"),Polygon(
                  points={{-80,98},{-86,82},{-74,82},{-80,98}},
                  lineColor={95,95,95},
                  fillColor={95,95,95},
                  fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
Icon for a mathematical function, consisting of an y-axis on the left side.
It is expected, that an x-axis is added and a plot of the function.
</p>
</html>"));
    end AxisLeft;

    partial function AxisCenter
    "Basic icon for mathematical function with y-axis in the center"

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{0,-80},{0,68}}, color={192,192,192}),
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255})}),
        Diagram(graphics={Line(points={{0,80},{-8,80}}, color={95,95,95}),Line(
              points={{0,-80},{-8,-80}}, color={95,95,95}),Line(points={{0,-90},{
              0,84}}, color={95,95,95}),Text(
                  extent={{5,104},{25,84}},
                  lineColor={95,95,95},
                  textString="y"),Polygon(
                  points={{0,98},{-6,82},{6,82},{0,98}},
                  lineColor={95,95,95},
                  fillColor={95,95,95},
                  fillPattern=FillPattern.Solid)}),
        Documentation(info="<html>
<p>
Icon for a mathematical function, consisting of an y-axis in the middle.
It is expected, that an x-axis is added and a plot of the function.
</p>
</html>"));
    end AxisCenter;
  end Icons;

  function asin "Inverse sine (-1 <= u <= 1)"
    extends Modelica.Math.Icons.AxisCenter;
    input Real u;
    output SI.Angle y;

  external "builtin" y=  asin(u);
    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
          Line(points={{-90,0},{68,0}}, color={192,192,192}),
          Polygon(
            points={{90,0},{68,8},{68,-8},{90,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,
                -49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,
                52.7},{75.2,62.2},{77.6,67.5},{80,80}}, color={0,0,0}),
          Text(
            extent={{-88,78},{-16,30}},
            lineColor={192,192,192},
            textString="asin")}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Text(
              extent={{-40,-72},{-15,-88}},
              textString="-pi/2",
              lineColor={0,0,255}),Text(
              extent={{-38,88},{-13,72}},
              textString=" pi/2",
              lineColor={0,0,255}),Text(
              extent={{68,-9},{88,-29}},
              textString="+1",
              lineColor={0,0,255}),Text(
              extent={{-90,21},{-70,1}},
              textString="-1",
              lineColor={0,0,255}),Line(points={{-100,0},{84,0}}, color={95,95,95}),
            Polygon(
              points={{98,0},{82,6},{82,-6},{98,0}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),Line(
              points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,
              -49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,
              52.7},{75.2,62.2},{77.6,67.5},{80,80}},
              color={0,0,255},
              thickness=0.5),Text(
              extent={{82,24},{102,4}},
              lineColor={95,95,95},
              textString="u"),Line(
              points={{0,80},{86,80}},
              color={175,175,175},
              smooth=Smooth.None),Line(
              points={{80,86},{80,-10}},
              color={175,175,175},
              smooth=Smooth.None)}),
      Documentation(info="<html>
<p>
This function returns y = asin(u), with -1 &le; u &le; +1:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/asin.png\">
</p>
</html>"));
  end asin;

  function log "Natural (base e) logarithm (u shall be > 0)"
    extends Modelica.Math.Icons.AxisLeft;
    input Real u;
    output Real y;

  external "builtin" y=  log(u);
    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
          Line(points={{-90,0},{68,0}}, color={192,192,192}),
          Polygon(
            points={{90,0},{68,8},{68,-8},{90,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,-80},{-79.2,-50.6},{-78.4,-37},{-77.6,-28},{-76.8,-21.3},
                {-75.2,-11.4},{-72.8,-1.31},{-69.5,8.08},{-64.7,17.9},{-57.5,28},
                {-47,38.1},{-31.8,48.1},{-10.1,58},{22.1,68},{68.7,78.1},{80,80}},
              color={0,0,0}),
          Text(
            extent={{-6,-24},{66,-72}},
            lineColor={192,192,192},
            textString="log")}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={Line(points={{-100,0},{84,0}}, color={95,95,95}),
            Polygon(
              points={{100,0},{84,6},{84,-6},{100,0}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),Line(
              points={{-78,-80},{-77.2,-50.6},{-76.4,-37},{-75.6,-28},{-74.8,-21.3},
              {-73.2,-11.4},{-70.8,-1.31},{-67.5,8.08},{-62.7,17.9},{-55.5,28},{-45,
              38.1},{-29.8,48.1},{-8.1,58},{24.1,68},{70.7,78.1},{82,80}},
              color={0,0,255},
              thickness=0.5),Text(
              extent={{-105,72},{-85,88}},
              textString="3",
              lineColor={0,0,255}),Text(
              extent={{60,-3},{80,-23}},
              textString="20",
              lineColor={0,0,255}),Text(
              extent={{-78,-7},{-58,-27}},
              textString="1",
              lineColor={0,0,255}),Text(
              extent={{84,26},{104,6}},
              lineColor={95,95,95},
              textString="u"),Text(
              extent={{-100,9},{-80,-11}},
              textString="0",
              lineColor={0,0,255}),Line(
              points={{-80,80},{84,80}},
              color={175,175,175},
              smooth=Smooth.None),Line(
              points={{82,82},{82,-6}},
              color={175,175,175},
              smooth=Smooth.None)}),
      Documentation(info="<html>
<p>
This function returns y = log(10) (the natural logarithm of u),
with u &gt; 0:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Math/log.png\">
</p>
</html>"));
  end log;
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},
              {-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{
              -26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,
              -50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},
              {51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={
              0,0,0}, smooth=Smooth.Bezier)}), Documentation(info="<HTML>
<p>
This package contains <b>basic mathematical functions</b> (such as sin(..)),
as well as functions operating on
<a href=\"modelica://Modelica.Math.Vectors\">vectors</a>,
<a href=\"modelica://Modelica.Math.Matrices\">matrices</a>,
<a href=\"modelica://Modelica.Math.Nonlinear\">nonlinear functions</a>, and
<a href=\"modelica://Modelica.Math.BooleanVectors\">Boolean vectors</a>.
</p>

<dl>
<dt><b>Main Authors:</b>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and
    Marcus Baur<br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e.V. (DLR)<br>
    Institut f&uuml;r Robotik und Mechatronik<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    Germany<br>
    email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br>
</dl>

<p>
Copyright &copy; 1998-2013, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</html>",   revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Function tempInterpol2 added.</li>
<li><i>Oct. 24, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Icons for icon and diagram level introduced.</li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>

</html>"));
  end Math;

  package Utilities
  "Library of utility functions dedicated to scripting (operating on files, streams, strings, system)"
    extends Modelica.Icons.Package;

    package Files "Functions to work with files and directories"
      extends Modelica.Icons.Package;

    function createDirectory
      "Create directory (if directory already exists, ignore call)"
      extends Modelica.Icons.Function;
      input String directoryName
        "Name of directory to be created (if present, ignore call)";
    //..............................................................
    protected
      function existDirectory
        "Inquire whether directory exists; if present and not a directory, trigger an error"
         extends Modelica.Icons.Function;
         input String directoryName;
         output Boolean exists "true if directory exists";
      protected
         Types.FileType fileType = Modelica.Utilities.Internal.FileSystem.stat(
                                                 directoryName);
      algorithm
         if fileType == Types.FileType.RegularFile or
            fileType == Types.FileType.SpecialFile then
            Streams.error("Directory \"" + directoryName + "\" cannot be created\n" +
                          "because this is an existing file.");
         elseif fileType == Types.FileType.Directory then
            exists :=true;
         else
            exists :=false;
         end if;
      end existDirectory;

      function assertCorrectIndex
        "Print error, if index to last essential character in directory is wrong"
         extends Modelica.Icons.Function;
         input Integer index "Index must be > 0";
         input String directoryName "Directory name for error message";
      algorithm
         if index < 1 then
            Streams.error("It is not possible to create the directory\n" +
                          "\"" + directoryName + "\"\n" +
                          "because this directory name is not valid");
         end if;
      end assertCorrectIndex;

    //..............................................................
      String fullName;
      Integer index;
      Integer oldIndex;
      Integer lastIndex;
      Boolean found;
      Boolean finished;
      Integer nDirectories = 0
        "Number of directories that need to be generated";
    algorithm
      // Ignore call, if directory exists
      if not existDirectory(directoryName) then
         fullName := Files.fullPathName(directoryName);

         // Remove a trailing "/"
            index :=Strings.length(fullName);
            if Strings.substring(fullName,index,index) == "/" then
               index :=index - 1;
               assertCorrectIndex(index,fullName);
            end if;
            lastIndex := index;
            fullName := Strings.substring(fullName,1,index);

         // Search upper directories until a directory is found that exists
         // ??? check the following while loop later, if also cases such as
         //  "c:/", "c:", "//name" are handled correctly ???
            found := false;
            while not found loop
               oldIndex := index;
               index := Strings.findLast(fullName,"/",startIndex=index);
               if index == 0 then
                  index := oldIndex;
                  found := true;
               else
                  index := index - 1;
                  assertCorrectIndex(index, fullName);
                  found := existDirectory(Strings.substring(fullName,1,index));
               end if;
            end while;
            index := oldIndex;

         // Create directories
            finished := false;
            while not finished loop
               Modelica.Utilities.Internal.FileSystem.mkdir(
                              Strings.substring(fullName,1,index));
               if index >= lastIndex then
                  finished := true;
               elseif index < lastIndex then
                  index := Strings.find(fullName, "/", startIndex=index+2);
                  if index == 0 then
                     index :=lastIndex;
                  end if;
               end if;
            end while;
      end if;

      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Files.<b>createDirectory</b>(directoryName);
</pre></blockquote>
<h4>Description</h4>
<p>
Creates directory \"directoryName\". If this directory already exists,
the function call is ignored. If several directories in \"directoryName\"
do not exist, all of them are created. For example, assume
that directory \"E:/test1\" exists and that directory
\"E:/test1/test2/test3\" shall be created. In this case
the directories \"test2\" in \"test1\" and \"test3\" in \"test2\"
are created.
</p>
<p>
This function is silent, i.e., it does not print a message.
In case of error (e.g., \"directoryName\" is an existing regular
file), an assert is triggered.
</p>
</html>"));
    end createDirectory;

    function exist "Inquire whether file or directory exists"
      extends Modelica.Icons.Function;
      input String name "Name of file or directory";
      output Boolean result "= true, if file or directory exists";
    algorithm
      result := Modelica.Utilities.Internal.FileSystem.stat(
                              name) > Types.FileType.NoFile;

      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
result = Files.<b>exist</b>(name);
</pre></blockquote>
<h4>Description</h4>
<p>
Returns true, if \"name\" is an existing file or directory.
If this is not the case, the function returns false.
</p>
</html>"));
    end exist;

    function fullPathName "Get full path name of file or directory name"
      extends Modelica.Icons.Function;
      input String name "Absolute or relative file or directory name";
      output String fullName "Full path of 'name'";
    external "C" fullName = ModelicaInternal_fullPathName(name) annotation(Library="ModelicaExternalC");

      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
fullName = Files.<b>fullPathName</b>(name);
</pre></blockquote>
<h4>Description</h4>
<p>
Returns the full path name of a file or directory \"name\".
</p>
</html>"));
    end fullPathName;
        annotation (
    Documentation(info="<HTML>
<p>
This package contains functions to work with files and directories.
As a general convention of this package, '/' is used as directory
separator both for input and output arguments of all functions.
For example:
</p>
<pre>
   exist(\"Modelica/Mechanics/Rotational.mo\");
</pre>
<p>
The functions provide the mapping to the directory separator of the
underlying operating system. Note, that on Windows system the usage
of '\\' as directory separator would be inconvenient, because this
character is also the escape character in Modelica and C Strings.
</p>
<p>
In the table below an example call to every function is given:
</p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function/type</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.list\">list</a>(name)</td>
      <td valign=\"top\"> List content of file or of directory.</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.copy\">copy</a>(oldName, newName)<br>
          <a href=\"modelica://Modelica.Utilities.Files.copy\">copy</a>(oldName, newName, replace=false)</td>
      <td valign=\"top\"> Generate a copy of a file or of a directory.</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.move\">move</a>(oldName, newName)<br>
          <a href=\"modelica://Modelica.Utilities.Files.move\">move</a>(oldName, newName, replace=false)</td>
      <td valign=\"top\"> Move a file or a directory to another place.</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.remove\">remove</a>(name)</td>
      <td valign=\"top\"> Remove file or directory (ignore call, if it does not exist).</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.removeFile\">removeFile</a>(name)</td>
      <td valign=\"top\"> Remove file (ignore call, if it does not exist)</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.createDirectory\">createDirectory</a>(name)</td>
      <td valign=\"top\"> Create directory (if directory already exists, ignore call).</td>
  </tr>
  <tr><td valign=\"top\">result = <a href=\"modelica://Modelica.Utilities.Files.exist\">exist</a>(name)</td>
      <td valign=\"top\"> Inquire whether file or directory exists.</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Files.assertNew\">assertNew</a>(name,message)</td>
      <td valign=\"top\"> Trigger an assert, if a file or directory exists.</td>
  </tr>
  <tr><td valign=\"top\">fullName = <a href=\"modelica://Modelica.Utilities.Files.fullPathName\">fullPathName</a>(name)</td>
      <td valign=\"top\"> Get full path name of file or directory name.</td>
  </tr>
  <tr><td valign=\"top\">(directory, name, extension) = <a href=\"modelica://Modelica.Utilities.Files.splitPathName\">splitPathName</a>(name)</td>
      <td valign=\"top\"> Split path name in directory, file name kernel, file name extension.</td>
  </tr>
  <tr><td valign=\"top\">fileName = <a href=\"modelica://Modelica.Utilities.Files.temporaryFileName\">temporaryFileName</a>()</td>
      <td valign=\"top\"> Return arbitrary name of a file that does not exist<br>
           and is in a directory where access rights allow to <br>
           write to this file (useful for temporary output of files).</td>
  </tr>
</table>
</HTML>"));
    end Files;

    package Streams "Read from files and write to files"
      extends Modelica.Icons.Package;

      function print "Print string to terminal or file"
        extends Modelica.Icons.Function;
        input String string="" "String to be printed";
        input String fileName=""
        "File where to print (empty string is the terminal)"
                     annotation(Dialog(saveSelector(filter="Text files (*.txt)",
                            caption="Text file to store the output of print(..)")));
      external "C" ModelicaInternal_print(string, fileName) annotation(Library="ModelicaExternalC");
        annotation (Documentation(info="<HTML>
<h4>Syntax</h4>
<blockquote><pre>
Streams.<b>print</b>(string);
Streams.<b>print</b>(string,fileName);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>print</b>(..) opens automatically the given file, if
it is not yet open. If the file does not exist, it is created.
If the file does exist, the given string is appended to the file.
If this is not desired, call \"Files.remove(fileName)\" before calling print
(\"remove(..)\" is silent, if the file does not exist).
The Modelica environment may close the file whenever appropriate.
This can be enforced by calling <b>Streams.close</b>(fileName).
After every call of \"print(..)\" a \"new line\" is printed automatically.
</p>
<h4>Example</h4>
<blockquote><pre>
  Streams.print(\"x = \" + String(x));
  Streams.print(\"y = \" + String(y));
  Streams.print(\"x = \" + String(y), \"mytestfile.txt\");
</pre></blockquote>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Utilities.Streams\">Streams</a>,
<a href=\"modelica://Modelica.Utilities.Streams.error\">Streams.error</a>,
<a href=\"modelica://ModelicaReference.Operators.'String()'\">ModelicaReference.Operators.'String()'</a>
</p>
</HTML>"));
      end print;

      function readLine
      "Reads a line of text from a file and returns it in a string"
        extends Modelica.Icons.Function;
        input String fileName "Name of the file that shall be read"
                            annotation(Dialog(loadSelector(filter="Text files (*.txt)",
                            caption="Open text file for reading")));
        input Integer lineNumber(min=1) "Number of line to read";
        output String string "Line of text";
        output Boolean endOfFile
        "If true, end-of-file was reached when trying to read line";
       external "C" string = ModelicaInternal_readLine(fileName,lineNumber,endOfFile) annotation(Library="ModelicaExternalC");
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(string, endOfFile) = Streams.<b>readLine</b>(fileName, lineNumber)
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>readLine</b>(..) opens the given file, reads enough of the
content to get the requested line, and returns the line as a string.
Lines are separated by LF or CR-LF; the returned string does not
contain the line separator. The file might remain open after
the call.
</p>
<p>
If lineNumber > countLines(fileName), an empty string is returned
and endOfFile=true. Otherwise endOfFile=false.
</p>
</html>"));
      end readLine;

      function error "Print error message and cancel all actions"
        extends Modelica.Icons.Function;
        input String string "String to be printed to error message window";
        external "C" ModelicaError(string) annotation(Library="ModelicaExternalC");
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Streams.<b>error</b>(string);
</pre></blockquote>
<h4>Description</h4>
<p>
Print the string \"string\" as error message and
cancel all actions. Line breaks are characterized
by \"\\n\" in the string.
</p>
<h4>Example</h4>
<blockquote><pre>
  Streams.error(\"x (= \" + String(x) + \")\\nhas to be in the range 0 .. 1\");
</pre></blockquote>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Utilities.Streams\">Streams</a>,
<a href=\"modelica://Modelica.Utilities.Streams.print\">Streams.print</a>,
<a href=\"modelica://ModelicaReference.Operators.'String()'\">ModelicaReference.Operators.'String()'</a>
</p>
</html>"));
      end error;
      annotation (
        Documentation(info="<HTML>
<h4>Library content</h4>
<p>
Package <b>Streams</b> contains functions to input and output strings
to a message window or on files. Note that a string is interpreted
and displayed as html text (e.g., with print(..) or error(..))
if it is enclosed with the Modelica html quotation, e.g.,
</p>
<center>
string = \"&lt;html&gt; first line &lt;br&gt; second line &lt;/html&gt;\".
</center>
<p>
It is a quality of implementation, whether (a) all tags of html are supported
or only a subset, (b) how html tags are interpreted if the output device
does not allow to display formatted text.
</p>
<p>
In the table below an example call to every function is given:
</p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function/type</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Streams.print\">print</a>(string)<br>
          <a href=\"modelica://Modelica.Utilities.Streams.print\">print</a>(string,fileName)</td>
      <td valign=\"top\"> Print string \"string\" or vector of strings to message window or on
           file \"fileName\".</td>
  </tr>
  <tr><td valign=\"top\">stringVector =
         <a href=\"modelica://Modelica.Utilities.Streams.readFile\">readFile</a>(fileName)</td>
      <td valign=\"top\"> Read complete text file and return it as a vector of strings.</td>
  </tr>
  <tr><td valign=\"top\">(string, endOfFile) =
         <a href=\"modelica://Modelica.Utilities.Streams.readLine\">readLine</a>(fileName, lineNumber)</td>
      <td valign=\"top\">Returns from the file the content of line lineNumber.</td>
  </tr>
  <tr><td valign=\"top\">lines =
         <a href=\"modelica://Modelica.Utilities.Streams.countLines\">countLines</a>(fileName)</td>
      <td valign=\"top\">Returns the number of lines in a file.</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Streams.error\">error</a>(string)</td>
      <td valign=\"top\"> Print error message \"string\" to message window
           and cancel all actions</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Streams.close\">close</a>(fileName)</td>
      <td valign=\"top\"> Close file if it is still open. Ignore call if
           file is already closed or does not exist. </td>
  </tr>
</table>
<p>
Use functions <b>scanXXX</b> from package
<a href=\"modelica://Modelica.Utilities.Strings\">Strings</a>
to parse a string.
</p>
<p>
If Real, Integer or Boolean values shall be printed
or used in an error message, they have to be first converted
to strings with the builtin operator
<a href=\"modelica://ModelicaReference.Operators.'String()'\">ModelicaReference.Operators.'String()'</a>(...).
Example:
</p>
<pre>
  <b>if</b> x &lt; 0 <b>or</b> x &gt; 1 <b>then</b>
     Streams.error(\"x (= \" + String(x) + \") has to be in the range 0 .. 1\");
  <b>end if</b>;
</pre>
</html>"));
    end Streams;

    package Strings "Operations on strings"
      extends Modelica.Icons.Package;

      function length "Returns length of string"
        extends Modelica.Icons.Function;
        input String string;
        output Integer result "Number of characters of string";
      external "C" result = ModelicaStrings_length(string) annotation(Library="ModelicaExternalC");
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Strings.<b>length</b>(string);
</pre></blockquote>
<h4>Description</h4>
<p>
Returns the number of characters of \"string\".
</p>
</html>"));
      end length;

      function substring "Returns a substring defined by start and end index"

        extends Modelica.Icons.Function;
        input String string "String from which a substring is inquired";
        input Integer startIndex(min=1)
        "Character position of substring begin (index=1 is first character in string)";
        input Integer endIndex(min=1) "Character position of substring end";
        output String result
        "String containing substring string[startIndex:endIndex]";
      external "C" result =
                          ModelicaStrings_substring(string,startIndex,endIndex) annotation(Library="ModelicaExternalC");
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
string2 = Strings.<b>substring</b>(string, startIndex, endIndex);
</pre></blockquote>
<h4>Description</h4>
<p>
This function returns
the substring from position startIndex
up to and including position endIndex of \"string\" .
</p>
<p>
If index, startIndex, or endIndex are not correct, e.g.,
if endIndex &gt; length(string), an assert is triggered.
</p>
<h4>Example</h4>
<blockquote><pre>
  string1 := \"This is line 111\";
  string2 := Strings.substring(string1,9,12); // string2 = \"line\"
</pre></blockquote>
</html>"));
      end substring;

      function repeat "Repeat a string n times"
        extends Modelica.Icons.Function;
        input Integer n(min=0) = 1 "Number of occurrences";
        input String string=" " "String that is repeated";
        output String repeatedString "String containing n concatenated strings";
      algorithm
        repeatedString :="";
        for i in 1:n loop
           repeatedString := repeatedString + string;
        end for;
        annotation (
      Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
string2 = Strings.<b>repeat</b>(n);
string2 = Strings.<b>repeat</b>(n, string=\" \");
</pre></blockquote>
<h4>Description</h4>
<p>
The first form returns a string consisting of n blanks.
</p>
<p>
The second form returns a string consisting of n substrings
defined by the optional argument \"string\".
</p>
</html>"));
      end repeat;

      function compare "Compare two strings lexicographically"
        extends Modelica.Icons.Function;
        input String string1;
        input String string2;
        input Boolean caseSensitive=true
        "= false, if case of letters is ignored";
        output Modelica.Utilities.Types.Compare result "Result of comparison";
      external "C" result = ModelicaStrings_compare(string1, string2, caseSensitive) annotation(Library="ModelicaExternalC");
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
result = Strings.<b>compare</b>(string1, string2);
result = Strings.<b>compare</b>(string1, string2, caseSensitive=true);
</pre></blockquote>
<h4>Description</h4>
<p>
Compares two strings. If the optional argument caseSensitive=false,
upper case letters are treated as if they would be lower case letters.
The result of the comparison is returned as:
</p>
<pre>
  result = Modelica.Utilities.Types.Compare.Less     // string1 &lt; string2
         = Modelica.Utilities.Types.Compare.Equal    // string1 = string2
         = Modelica.Utilities.Types.Compare.Greater  // string1 &gt; string2
</pre>
<p>
Comparison is with regards to lexicographical order,
e.g., \"a\" &lt; \"b\";
</p>
</html>"));
      end compare;

      function isEqual "Determine whether two strings are identical"
        extends Modelica.Icons.Function;
        input String string1;
        input String string2;
        input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored for the comparison";
        output Boolean identical "True, if string1 is identical to string2";
      algorithm
        identical :=compare(string1, string2, caseSensitive) == Types.Compare.Equal;
        annotation (
      Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Strings.<b>isEqual</b>(string1, string2);
Strings.<b>isEqual</b>(string1, string2, caseSensitive=true);
</pre></blockquote>
<h4>Description</h4>
<p>
Compare whether two strings are identical,
optionally ignoring case.
</p>
</html>"));
      end isEqual;

      function find "Find first occurrence of a string within another string"
        extends Modelica.Icons.Function;
        input String string "String that is analyzed";
        input String searchString "String that is searched for in string";
        input Integer startIndex(min=1)=1 "Start search at index startIndex";
        input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored for the search";
         output Integer index
        "Index of the beginning of the first occurrence of 'searchString' within 'string', or zero if not present";
    protected
        Integer lengthSearchString = length(searchString);
        Integer len = lengthSearchString-1;
        Integer i = startIndex;
        Integer i_max = length(string) - lengthSearchString + 1;
      algorithm
        index := 0;
        while i <= i_max loop
           if isEqual(substring(string,i,i+len),
                      searchString, caseSensitive) then
              index := i;
              i := i_max + 1;
           else
              i := i+1;
           end if;
        end while;
        annotation (
      Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
index = Strings.<b>find</b>(string, searchString);
index = Strings.<b>find</b>(string, searchString, startIndex=1,
                     caseSensitive=true);
</pre></blockquote>
<h4>Description</h4>
<p>
Finds first occurrence of \"searchString\" within \"string\"
and return the corresponding index.
Start search at index \"startIndex\" (default = 1).
If the optional argument \"caseSensitive\" is false, lower
and upper case are ignored for the search.
If \"searchString\" is not found, a value of \"0\" is returned.
</p>
</html>"));
      end find;

      function findLast
      "Find last occurrence of a string within another string"
        extends Modelica.Icons.Function;
        input String string "String that is analyzed";
        input String searchString "String that is searched for in string";
        input Integer startIndex(min=0)=0
        "Start search at index startIndex. If startIndex = 0, start at length(string)";
        input Boolean caseSensitive=true
        "= false, if lower and upper case are ignored for the search";
        output Integer index
        "Index of the beginning of the last occurrence of 'searchString' within 'string', or zero if not present";
    protected
        Integer lenString = length(string);
        Integer lenSearchString = length(searchString);
        Integer iMax=lenString - lenSearchString + 1;
        Integer i;
      algorithm
        i := if startIndex == 0 or startIndex > iMax then iMax else startIndex;
        index := 0;
        while i >= 1 loop
           if isEqual(substring(string,i,i+lenSearchString-1),
                      searchString, caseSensitive) then
              index := i;
              i := 0;
           else
              i := i-1;
           end if;
        end while;
        annotation (
      Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
index = Strings.<b>findLast</b>(string, searchString);
index = Strings.<b>findLast</b>(string, searchString,
                         startIndex=length(string), caseSensitive=true,
</pre></blockquote>
<h4>Description</h4>
<p>
Finds first occurrence of \"searchString\" within \"string\"
when searching from the last character of \"string\"
backwards, and return the corresponding index.
Start search at index \"startIndex\" (default = 0;
if startIndex = 0, search starts at length(string)).
If the optional argument \"caseSensitive\" is false, lower
and upper case are ignored for the search.
If \"searchString\" is not found, a value of \"0\" is returned.
</p>
</html>"));
      end findLast;

      function scanReal
      "Scan for the next Real number and trigger an assert if not present"
        extends Modelica.Icons.Function;
        input String string "String to be scanned";
        input Integer startIndex(min=1)=1
        "Start scanning of string at character startIndex";
        input Boolean unsigned=false
        "= true, if Real token shall not start with a sign";
        input String message=""
        "Message used in error message if scan is not successful";
        output Real number "Value of real number";
        output Integer nextIndex "index of character after the found number";
      algorithm
        (nextIndex, number) :=Advanced.scanReal(string, startIndex, unsigned);
        if nextIndex == startIndex then
           nextIndex :=Advanced.skipWhiteSpace(string, startIndex);
           if unsigned then
              syntaxError(string, nextIndex, "Expected a Real number without a sign " + message);
           else
              syntaxError(string, nextIndex, "Expected a Real number " + message);
           end if;
        end if;
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
             number = Strings.<b>scanReal</b>(string);
(number, nextIndex) = Strings.<b>scanReal</b>(string, startIndex=1,
                                            unsigned=false, message=\"\");
</pre></blockquote>
<h4>Description</h4>
<p>
The first form, \"scanReal(string)\", scans \"string\" for a
Real number with leading white space and returns the value.
</p>
<p>
The second form, \"scanReal(string,startIndex,unsigned)\",
scans the string starting at index
\"startIndex\", checks whether the next token is a Real literal
and returns its value as a Real number, as well as the
index directly after the Real number.
If the optional argument \"unsigned\" is <b>true</b>,
the real number shall not have a leading \"+\" or \"-\" sign.
</p>
<p>
If the required Real number with leading white space
is not present in \"string\", an assert is triggered.
</p>
</html>"));
      end scanReal;

      function syntaxError
      "Print an error message, a string and the index at which scanning detected an error"
        extends Modelica.Icons.Function;
        input String string "String that has an error at position index";
        input Integer index
        "Index of string at which scanning detected an error";
        input String message="" "String printed at end of error message";

    protected
        Integer maxIndex = 40;
        Integer maxLenString = 60;
        Integer lenString = length(string);
        String errString;
        Integer index2 = if index < 1 then 1 else if index > lenString then lenString else index;
      algorithm
      // if "string" is too long, skip part of the string when printing it
         if index2 <= maxIndex then
           errString := string;
         else
           errString := "... " + substring(string, index2-maxIndex, lenString);
           index2 := maxIndex + 5; // To mark right position
         end if;

         if length(errString) > maxLenString then
            errString := substring(errString, 1, maxLenString) + " ...";
         end if;

      // Print error message
         Streams.error("Syntax error at character " + String(index) + " of\n" +
                       errString + "\n" +
                       repeat(index2-1, " ") + "*" + "\n" +
                       message);
        annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Strings.<b>syntaxError</b>(string, index, message);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>syntaxError</b> prints an error message in the
following form:
</p>
<pre>
   Syntax error at column &lt;index&gt; of
   &lt;string&gt;
       ^       // shows character that is wrong
   &lt;message&gt;
</pre>
<p>
where the strings withing &lt;..&gt; are the actual values of the
input arguments of the function.
</p>
<p>
If the given string is too long, only a relevant
part of the string is printed.
</p>
</html>"));
      end syntaxError;

      package Advanced "Advanced scanning functions"
      extends Modelica.Icons.Package;

        function scanReal "Scans a signed real number"
          extends Modelica.Icons.Function;
          input String string;
          input Integer startIndex(min=1)=1 "Index where scanning starts";
          input Boolean unsigned=false
          "= true, if number shall not start with '+' or '-'";
          output Integer nextIndex
          "Index after the found token (success=true) or index at which scanning failed (success=false)";
          output Real number "Value of Real number";
          external "C" ModelicaStrings_scanReal(string, startIndex, unsigned, nextIndex, number) annotation(Library="ModelicaExternalC");
          annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
(nextIndex, realNumber) = <b>scanReal</b>(string, startIndex=1, unsigned=false);
</pre></blockquote>
<h4>Description</h4>
<p>
Starts scanning of \"string\" at position \"startIndex\".
First skips white space and scans afterwards a number
of type Real with an optional sign according to the Modelica grammar:
</p>
<pre>
    real     ::= [sign] unsigned [fraction] [exponent]
    sign     ::= '+' | '-'
    unsigned ::= digit [unsigned]
    fraction ::= '.' [unsigned]
    exponent ::= ('e' | 'E') [sign] unsigned
    digit    ::= '0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9'
</pre>
<p>
If successful, the function returns nextIndex = index of character
directly after the found real number, as well as the value
in the second output argument.
</p>
<p>
If not successful, on return nextIndex = startIndex and
the second output argument is zero.
</p>
<p>
If the optional argument \"unsigned\" is <b>true</b>, the number
shall not start with '+' or '-'. The default of \"unsigned\" is <b>false</b>.
</p>
<h4>See also</h4>
<a href=\"modelica://Modelica.Utilities.Strings.Advanced\">Strings.Advanced</a>.
</html>"));
        end scanReal;

        function skipWhiteSpace "Scans white space"
          extends Modelica.Icons.Function;
          input String string;
          input Integer startIndex(min=1)=1;
          output Integer nextIndex;
          external "C" nextIndex = ModelicaStrings_skipWhiteSpace(string, startIndex) annotation(Library="ModelicaExternalC");
          annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
nextIndex = <b>skipWhiteSpace</b>(string, startIndex);
</pre></blockquote>
<h4>Description</h4>
<p>
Starts scanning of \"string\" at position \"startIndex\" and
skips white space. The function returns nextIndex = index of character
of the first non white space character.
</p>
<h4>See also</h4>
<a href=\"modelica://Modelica.Utilities.Strings.Advanced\">Strings.Advanced</a>.
</html>"));
        end skipWhiteSpace;
        annotation (Documentation(info="<html>
<h4>Library content</h4>
<p>
Package <b>Strings.Advanced</b> contains basic scanning
functions. These functions should be <b>not called</b> directly, because
it is much simpler to utilize the higher level functions \"Strings.scanXXX\".
The functions of the \"Strings.Advanced\" library provide
the basic interface in order to implement the higher level
functions in package \"Strings\".
</p>
<p>
Library \"Advanced\" provides the following functions:
</p>
<pre>
  (nextIndex, realNumber)    = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanReal\">scanReal</a>        (string, startIndex, unsigned=false);
  (nextIndex, integerNumber) = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanInteger\">scanInteger</a>     (string, startIndex, unsigned=false);
  (nextIndex, string2)       = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanString\">scanString</a>      (string, startIndex);
  (nextIndex, identifier)    = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanIdentifier\">scanIdentifier</a>  (string, startIndex);
   nextIndex                 = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.skipWhiteSpace\">skipWhiteSpace</a>  (string, startIndex);
   nextIndex                 = <a href=\"modelica://Modelica.Utilities.Strings.Advanced.skipLineComments\">skipLineComments</a>(string, startIndex);
</pre>
<p>
All functions perform the following actions:
</p>
<ol>
<li> Scanning starts at character position \"startIndex\" of
     \"string\" (startIndex has a default of 1).
<li> First, white space is skipped, such as blanks (\" \"), tabs (\"\\t\"), or newline (\"\\n\")</li>
<li> Afterwards, the required token is scanned.</li>
<li> If successful, on return nextIndex = index of character
     directly after the found token and the token value is returned
     as second output argument.<br>
     If not successful, on return nextIndex = startIndex.
     </li>
</ol>
<p>
The following additional rules apply for the scanning:
</p>
<ul>
<li> Function <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanReal\">scanReal</a>:<br>
     Scans a full number including one optional leading \"+\" or \"-\" (if unsigned=false)
     according to the Modelica grammar. For example, \"+1.23e-5\", \"0.123\" are
     Real numbers, but \".1\" is not.
     Note, an Integer number, such as \"123\" is also treated as a Real number.<br>&nbsp;</li>
<li> Function <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanInteger\">scanInteger</a>:<br>
     Scans an Integer number including one optional leading \"+\"
     or \"-\" (if unsigned=false) according to the Modelica (and C/C++) grammar.
     For example, \"+123\", \"20\" are Integer numbers.
     Note, a Real number, such as \"123.4\" is not an Integer and
     scanInteger returns nextIndex = startIndex.<br>&nbsp;</li>
<li> Function <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanString\">scanString</a>:<br>
     Scans a String according to the Modelica (and C/C++) grammar, e.g.,
     \"This is a \"string\"\" is a valid string token.<br>&nbsp;</li>
<li> Function <a href=\"modelica://Modelica.Utilities.Strings.Advanced.scanIdentifier\">scanIdentifier</a>:<br>
     Scans a Modelica identifier, i.e., the identifier starts either
     with a letter, followed by letters, digits or \"_\".
     For example, \"w_rel\", \"T12\".<br>&nbsp;</li>
<li> Function <a href=\"modelica://Modelica.Utilities.Strings.Advanced.skipLineComments\">skipLineComments</a><br>
     Skips white space and Modelica (C/C++) line comments iteratively.
     A line comment starts with \"//\" and ends either with an
     end-of-line (\"\\n\") or the end of the \"string\". </li>
</ul>
</html>"));
      end Advanced;
      annotation (
        Documentation(info="<HTML>
<h4>Library content</h4>
<p>
Package <b>Strings</b> contains functions to manipulate strings.
</p>
<p>
In the table below an example
call to every function is given using the <b>default</b> options.
</p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\">len = <a href=\"modelica://Modelica.Utilities.Strings.length\">length</a>(string)</td>
      <td valign=\"top\">Returns length of string</td></tr>
  <tr><td valign=\"top\">string2 = <a href=\"modelica://Modelica.Utilities.Strings.substring\">substring</a>(string1,startIndex,endIndex)
       </td>
      <td valign=\"top\">Returns a substring defined by start and end index</td></tr>
  <tr><td valign=\"top\">result = <a href=\"modelica://Modelica.Utilities.Strings.repeat\">repeat</a>(n)<br>
 result = <a href=\"modelica://Modelica.Utilities.Strings.repeat\">repeat</a>(n,string)</td>
      <td valign=\"top\">Repeat a blank or a string n times.</td></tr>
  <tr><td valign=\"top\">result = <a href=\"modelica://Modelica.Utilities.Strings.compare\">compare</a>(string1, string2)</td>
      <td valign=\"top\">Compares two substrings with regards to alphabetical order</td></tr>
  <tr><td valign=\"top\">identical =
<a href=\"modelica://Modelica.Utilities.Strings.isEqual\">isEqual</a>(string1,string2)</td>
      <td valign=\"top\">Determine whether two strings are identical</td></tr>
  <tr><td valign=\"top\">result = <a href=\"modelica://Modelica.Utilities.Strings.count\">count</a>(string,searchString)</td>
      <td valign=\"top\">Count the number of occurrences of a string</td></tr>
  <tr>
<td valign=\"top\">index = <a href=\"modelica://Modelica.Utilities.Strings.find\">find</a>(string,searchString)</td>
      <td valign=\"top\">Find first occurrence of a string in another string</td></tr>
<tr>
<td valign=\"top\">index = <a href=\"modelica://Modelica.Utilities.Strings.findLast\">findLast</a>(string,searchString)</td>
      <td valign=\"top\">Find last occurrence of a string in another string</td></tr>
  <tr><td valign=\"top\">string2 = <a href=\"modelica://Modelica.Utilities.Strings.replace\">replace</a>(string,searchString,replaceString)</td>
      <td valign=\"top\">Replace one or all occurrences of a string</td></tr>
  <tr><td valign=\"top\">stringVector2 = <a href=\"modelica://Modelica.Utilities.Strings.sort\">sort</a>(stringVector1)</td>
      <td valign=\"top\">Sort vector of strings in alphabetic order</td></tr>
  <tr><td valign=\"top\">(token, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanToken\">scanToken</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for a token (Real/Integer/Boolean/String/Identifier/Delimiter/NoToken)</td></tr>
  <tr><td valign=\"top\">(number, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanReal\">scanReal</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for a Real constant</td></tr>
  <tr><td valign=\"top\">(number, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanInteger\">scanInteger</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for an Integer constant</td></tr>
  <tr><td valign=\"top\">(boolean, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanBoolean\">scanBoolean</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for a Boolean constant</td></tr>
  <tr><td valign=\"top\">(string2, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanString\">scanString</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for a String constant</td></tr>
  <tr><td valign=\"top\">(identifier, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanIdentifier\">scanIdentifier</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for an identifier</td></tr>
  <tr><td valign=\"top\">(delimiter, index) = <a href=\"modelica://Modelica.Utilities.Strings.scanDelimiter\">scanDelimiter</a>(string,startIndex)</td>
      <td valign=\"top\">Scan for delimiters</td></tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Strings.scanNoToken\">scanNoToken</a>(string,startIndex)</td>
      <td valign=\"top\">Check that remaining part of string consists solely of <br>
          white space or line comments (\"// ...\\n\").</td></tr>
  <tr><td valign=\"top\"><a href=\"modelica://Modelica.Utilities.Strings.syntaxError\">syntaxError</a>(string,index,message)</td>
      <td valign=\"top\"> Print a \"syntax error message\" as well as a string and the <br>
           index at which scanning detected an error</td></tr>
</table>
<p>
The functions \"compare\", \"isEqual\", \"count\", \"find\", \"findLast\", \"replace\", \"sort\"
have the optional
input argument <b>caseSensitive</b> with default <b>true</b>.
If <b>false</b>, the operation is carried out without taking
into account whether a character is upper or lower case.
</p>
</HTML>"));
    end Strings;

    package Types "Type definitions used in package Modelica.Utilities"
      extends Modelica.Icons.TypesPackage;

      type Compare = enumeration(
        Less "String 1 is lexicographically less than string 2",
        Equal "String 1 is identical to string 2",
        Greater "String 1 is lexicographically greater than string 2")
      "Enumeration defining comparison of two strings";

      type FileType = enumeration(
        NoFile "No file exists",
        RegularFile "Regular file",
        Directory "Directory",
        SpecialFile "Special file (pipe, FIFO, device, etc.)")
      "Enumeration defining the type of a file";
      annotation (Documentation(info="<html>
<p>
This package contains type definitions used in Modelica.Utilities.
</p>

</html>"));
    end Types;

    package Internal
    "Internal components that a user should usually not directly utilize"
      extends Modelica.Icons.InternalPackage;

    package FileSystem
      "Internal package with external functions as interface to the file system"
     extends Modelica.Icons.InternalPackage;

      function mkdir "Make directory (POSIX: 'mkdir')"
        extends Modelica.Icons.Function;
        input String directoryName "Make a new directory";
      external "C" ModelicaInternal_mkdir(directoryName) annotation(Library="ModelicaExternalC");
      end mkdir;

      function stat "Inquire file information (POSIX function 'stat')"
        extends Modelica.Icons.Function;
        input String name "Name of file, directory, pipe etc.";
        output Types.FileType fileType "Type of file";
      external "C" fileType = ModelicaInternal_stat(name) annotation(Library="ModelicaExternalC");
      end stat;
      annotation (
    Documentation(info="<html>
<p>
Package <b>Internal.FileSystem</b> is an internal package that contains
low level functions as interface to the file system.
These functions should not be called directly in a scripting
environment since more convenient functions are provided
in packages Files and Systems.
</p>
<p>
Note, the functions in this package are direct interfaces to
functions of POSIX and of the standard C library. Errors
occurring in these functions are treated by triggering
a Modelica assert. Therefore, the functions in this package
return only for a successful operation. Furthermore, the
representation of a string is hidden by this interface,
especially if the operating system supports Unicode characters.
</p>
</html>"));
    end FileSystem;
    end Internal;
      annotation (
  Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}), graphics={
      Polygon(
        origin={1.3835,-4.1418},
        rotation=45.0,
        fillColor={64,64,64},
        pattern=LinePattern.None,
        fillPattern=FillPattern.Solid,
        points={{-15.0,93.333},{-15.0,68.333},{0.0,58.333},{15.0,68.333},{15.0,93.333},{20.0,93.333},{25.0,83.333},{25.0,58.333},{10.0,43.333},{10.0,-41.667},{25.0,-56.667},{25.0,-76.667},{10.0,-91.667},{0.0,-91.667},{0.0,-81.667},{5.0,-81.667},{15.0,-71.667},{15.0,-61.667},{5.0,-51.667},{-5.0,-51.667},{-15.0,-61.667},{-15.0,-71.667},{-5.0,-81.667},{0.0,-81.667},{0.0,-91.667},{-10.0,-91.667},{-25.0,-76.667},{-25.0,-56.667},{-10.0,-41.667},{-10.0,43.333},{-25.0,58.333},{-25.0,83.333},{-20.0,93.333}}),
      Polygon(
        origin={10.1018,5.218},
        rotation=-45.0,
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        points={{-15.0,87.273},{15.0,87.273},{20.0,82.273},{20.0,27.273},{10.0,17.273},{10.0,7.273},{20.0,2.273},{20.0,-2.727},{5.0,-2.727},{5.0,-77.727},{10.0,-87.727},{5.0,-112.727},{-5.0,-112.727},{-10.0,-87.727},{-5.0,-77.727},{-5.0,-2.727},{-20.0,-2.727},{-20.0,2.273},{-10.0,7.273},{-10.0,17.273},{-20.0,27.273},{-20.0,82.273}})}),
  Documentation(info="<html>
<p>
This package contains Modelica <b>functions</b> that are
especially suited for <b>scripting</b>. The functions might
be used to work with strings, read data from file, write data
to file or copy, move and remove files.
</p>
<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"modelica://Modelica.Utilities.UsersGuide\">Modelica.Utilities.User's Guide</a>
     discusses the most important aspects of this library.</li>
<li> <a href=\"modelica://Modelica.Utilities.Examples\">Modelica.Utilities.Examples</a>
     contains examples that demonstrate the usage of this library.</li>
</ul>
<p>
The following main sublibraries are available:
</p>
<ul>
<li> <a href=\"modelica://Modelica.Utilities.Files\">Files</a>
     provides functions to operate on files and directories, e.g.,
     to copy, move, remove files.</li>
<li> <a href=\"modelica://Modelica.Utilities.Streams\">Streams</a>
     provides functions to read from files and write to files.</li>
<li> <a href=\"modelica://Modelica.Utilities.Strings\">Strings</a>
     provides functions to operate on strings. E.g.
     substring, find, replace, sort, scanToken.</li>
<li> <a href=\"modelica://Modelica.Utilities.System\">System</a>
     provides functions to interact with the environment.
     E.g., get or set the working directory or environment
     variables and to send a command to the default shell.</li>
</ul>

<p>
Copyright &copy; 1998-2013, Modelica Association, DLR, and Dassault Syst&egrave;mes AB.
</p>

<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>

</html>"));
  end Utilities;

  package Constants
  "Library of mathematical constants and constants of nature (e.g., pi, eps, R, sigma)"
    import SI = Modelica.SIunits;
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;
    extends Modelica.Icons.Package;

    final constant Real pi=2*Modelica.Math.asin(1.0);

    final constant Real eps=ModelicaServices.Machine.eps
    "Biggest number such that 1.0 + eps = 1.0";

    final constant Real inf=ModelicaServices.Machine.inf
    "Biggest Real number such that inf and -inf are representable on the machine";

    final constant Real R(final unit="J/(mol.K)") = 8.314472
    "Molar gas constant";

    final constant Real N_A(final unit="1/mol") = 6.0221415e23
    "Avogadro constant";
    annotation (
      Documentation(info="<html>
<p>
This package provides often needed constants from mathematics, machine
dependent constants and constants from nature. The latter constants
(name, value, description) are from the following source:
</p>

<dl>
<dt>Peter J. Mohr and Barry N. Taylor (1999):</dt>
<dd><b>CODATA Recommended Values of the Fundamental Physical Constants: 1998</b>.
    Journal of Physical and Chemical Reference Data, Vol. 28, No. 6, 1999 and
    Reviews of Modern Physics, Vol. 72, No. 2, 2000. See also <a href=
\"http://physics.nist.gov/cuu/Constants/\">http://physics.nist.gov/cuu/Constants/</a></dd>
</dl>

<p>CODATA is the Committee on Data for Science and Technology.</p>

<dl>
<dt><b>Main Author:</b></dt>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e. V. (DLR)<br>
    Oberpfaffenhofen<br>
    Postfach 11 16<br>
    D-82230 We&szlig;ling<br>
    email: <a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</a></dd>
</dl>

<p>
Copyright &copy; 1998-2013, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</html>",   revisions="<html>
<ul>
<li><i>Nov 8, 2004</i>
       by <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Constants updated according to 2002 CODATA values.</li>
<li><i>Dec 9, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Constants updated according to 1998 CODATA values. Using names, values
       and description text from this source. Included magnetic and
       electric constant.</li>
<li><i>Sep 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Constants eps, inf, small introduced.</li>
<li><i>Nov 15, 1997</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>
</html>"),
      Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}), graphics={
        Polygon(
          origin={-9.2597,25.6673},
          fillColor={102,102,102},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{48.017,11.336},{48.017,11.336},{10.766,11.336},{-25.684,10.95},{-34.944,-15.111},{-34.944,-15.111},{-32.298,-15.244},{-32.298,-15.244},{-22.112,0.168},{11.292,0.234},{48.267,-0.097},{48.267,-0.097}},
          smooth=Smooth.Bezier),
        Polygon(
          origin={-19.9923,-8.3993},
          fillColor={102,102,102},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{3.239,37.343},{3.305,37.343},{-0.399,2.683},{-16.936,-20.071},{-7.808,-28.604},{6.811,-22.519},{9.986,37.145},{9.986,37.145}},
          smooth=Smooth.Bezier),
        Polygon(
          origin={23.753,-11.5422},
          fillColor={102,102,102},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{-10.873,41.478},{-10.873,41.478},{-14.048,-4.162},{-9.352,-24.8},{7.912,-24.469},{16.247,0.27},{16.247,0.27},{13.336,0.071},{13.336,0.071},{7.515,-9.983},{-3.134,-7.271},{-2.671,41.214},{-2.671,41.214}},
          smooth=Smooth.Bezier)}));
  end Constants;

  package Icons "Library of icons"
    extends Icons.Package;

    partial package ExamplesPackage
    "Icon for packages containing runnable examples"
      extends Modelica.Icons.Package;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Polygon(
              origin={8.0,14.0},
              lineColor={78,138,73},
              fillColor={78,138,73},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{-58.0,46.0},{42.0,-14.0},{-58.0,-74.0},{-58.0,46.0}})}), Documentation(info="<html>
<p>This icon indicates a package that contains executable examples.</p>
</html>"));
    end ExamplesPackage;

    partial package Package "Icon for standard packages"

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
            Rectangle(
              lineColor={200,200,200},
              fillColor={248,248,248},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-100.0,-100.0},{100.0,100.0}},
              radius=25.0),
            Rectangle(
              lineColor={128,128,128},
              fillPattern=FillPattern.None,
              extent={{-100.0,-100.0},{100.0,100.0}},
              radius=25.0)}),   Documentation(info="<html>
<p>Standard package icon.</p>
</html>"));
    end Package;

    partial package BasesPackage "Icon for packages containing base classes"
      extends Modelica.Icons.Package;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Ellipse(
              extent={{-30.0,-30.0},{30.0,30.0}},
              lineColor={128,128,128},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
                                Documentation(info="<html>
<p>This icon shall be used for a package/library that contains base models and classes, respectively.</p>
</html>"));
    end BasesPackage;

    partial package VariantsPackage "Icon for package containing variants"
      extends Modelica.Icons.Package;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},
                {100,100}}),       graphics={
            Ellipse(
              origin={10.0,10.0},
              fillColor={76,76,76},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              extent={{-80.0,-80.0},{-20.0,-20.0}}),
            Ellipse(
              origin={10.0,10.0},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              extent={{0.0,-80.0},{60.0,-20.0}}),
            Ellipse(
              origin={10.0,10.0},
              fillColor={128,128,128},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              extent={{0.0,0.0},{60.0,60.0}}),
            Ellipse(
              origin={10.0,10.0},
              lineColor={128,128,128},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              extent={{-80.0,0.0},{-20.0,60.0}})}),
                                Documentation(info="<html>
<p>This icon shall be used for a package/library that contains several variants of one components.</p>
</html>"));
    end VariantsPackage;

    partial package InterfacesPackage "Icon for packages containing interfaces"
      extends Modelica.Icons.Package;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Polygon(origin={20.0,0.0},
              lineColor={64,64,64},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              points={{-10.0,70.0},{10.0,70.0},{40.0,20.0},{80.0,20.0},{80.0,-20.0},{40.0,-20.0},{10.0,-70.0},{-10.0,-70.0}}),
            Polygon(fillColor={102,102,102},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{-100.0,20.0},{-60.0,20.0},{-30.0,70.0},{-10.0,70.0},{-10.0,-70.0},{-30.0,-70.0},{-60.0,-20.0},{-100.0,-20.0}})}),
                                Documentation(info="<html>
<p>This icon indicates packages containing interfaces.</p>
</html>"));
    end InterfacesPackage;

    partial package SourcesPackage "Icon for packages containing sources"
      extends Modelica.Icons.Package;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Polygon(origin={23.3333,0.0},
              fillColor={128,128,128},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{-23.333,30.0},{46.667,0.0},{-23.333,-30.0}}),
            Rectangle(
              fillColor = {128,128,128},
              pattern = LinePattern.None,
              fillPattern = FillPattern.Solid,
              extent = {{-70,-4.5},{0,4.5}})}),
                                Documentation(info="<html>
<p>This icon indicates a package which contains sources.</p>
</html>"));
    end SourcesPackage;

    partial package SensorsPackage "Icon for packages containing sensors"
      extends Modelica.Icons.Package;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Ellipse(origin={0.0,-30.0},
              fillColor={255,255,255},
              extent={{-90.0,-90.0},{90.0,90.0}},
              startAngle=20.0,
              endAngle=160.0),
            Ellipse(origin={0.0,-30.0},
              fillColor={128,128,128},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              extent={{-20.0,-20.0},{20.0,20.0}}),
            Line(origin={0.0,-30.0},
              points={{0.0,60.0},{0.0,90.0}}),
            Ellipse(origin={-0.0,-30.0},
              fillColor={64,64,64},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              extent={{-10.0,-10.0},{10.0,10.0}}),
            Polygon(
              origin={-0.0,-30.0},
              rotation=-35.0,
              fillColor={64,64,64},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{-7.0,0.0},{-3.0,85.0},{0.0,90.0},{3.0,85.0},{7.0,0.0}})}),
                                Documentation(info="<html>
<p>This icon indicates a package containing sensors.</p>
</html>"));
    end SensorsPackage;

    partial package UtilitiesPackage "Icon for utility packages"
      extends Modelica.Icons.Package;
       annotation (Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}), graphics={
      Polygon(
        origin={1.3835,-4.1418},
        rotation=45.0,
        fillColor={64,64,64},
        pattern=LinePattern.None,
        fillPattern=FillPattern.Solid,
        points={{-15.0,93.333},{-15.0,68.333},{0.0,58.333},{15.0,68.333},{15.0,93.333},{20.0,93.333},{25.0,83.333},{25.0,58.333},{10.0,43.333},{10.0,-41.667},{25.0,-56.667},{25.0,-76.667},{10.0,-91.667},{0.0,-91.667},{0.0,-81.667},{5.0,-81.667},{15.0,-71.667},{15.0,-61.667},{5.0,-51.667},{-5.0,-51.667},{-15.0,-61.667},{-15.0,-71.667},{-5.0,-81.667},{0.0,-81.667},{0.0,-91.667},{-10.0,-91.667},{-25.0,-76.667},{-25.0,-56.667},{-10.0,-41.667},{-10.0,43.333},{-25.0,58.333},{-25.0,83.333},{-20.0,93.333}}),
      Polygon(
        origin={10.1018,5.218},
        rotation=-45.0,
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        points={{-15.0,87.273},{15.0,87.273},{20.0,82.273},{20.0,27.273},{10.0,17.273},{10.0,7.273},{20.0,2.273},{20.0,-2.727},{5.0,-2.727},{5.0,-77.727},{10.0,-87.727},{5.0,-112.727},{-5.0,-112.727},{-10.0,-87.727},{-5.0,-77.727},{-5.0,-2.727},{-20.0,-2.727},{-20.0,2.273},{-10.0,7.273},{-10.0,17.273},{-20.0,27.273},{-20.0,82.273}})}),
      Documentation(info="<html>
<p>This icon indicates a package containing utility classes.</p>
</html>"));
    end UtilitiesPackage;

    partial package TypesPackage
    "Icon for packages containing type definitions"
      extends Modelica.Icons.Package;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Polygon(
              origin={-12.167,-23},
              fillColor={128,128,128},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{12.167,65},{14.167,93},{36.167,89},{24.167,20},{4.167,-30},
                  {14.167,-30},{24.167,-30},{24.167,-40},{-5.833,-50},{-15.833,
                  -30},{4.167,20},{12.167,65}},
              smooth=Smooth.Bezier,
              lineColor={0,0,0}), Polygon(
              origin={2.7403,1.6673},
              fillColor={128,128,128},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{49.2597,22.3327},{31.2597,24.3327},{7.2597,18.3327},{-26.7403,
                10.3327},{-46.7403,14.3327},{-48.7403,6.3327},{-32.7403,0.3327},{-6.7403,
                4.3327},{33.2597,14.3327},{49.2597,14.3327},{49.2597,22.3327}},
              smooth=Smooth.Bezier)}));
    end TypesPackage;

    partial package IconsPackage "Icon for packages containing icons"
      extends Modelica.Icons.Package;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Polygon(
              origin={-8.167,-17},
              fillColor={128,128,128},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{
                  4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,
                  -50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
              smooth=Smooth.Bezier,
              lineColor={0,0,0}), Ellipse(
              origin={-0.5,56.5},
              fillColor={128,128,128},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              extent={{-12.5,-12.5},{12.5,12.5}},
              lineColor={0,0,0})}));
    end IconsPackage;

    partial package InternalPackage
    "Icon for an internal package (indicating that the package should not be directly utilized by user)"

    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}}), graphics={
          Rectangle(
            lineColor={215,215,215},
            fillColor={255,255,255},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-100,-100},{100,100}},
            radius=25),
          Rectangle(
            lineColor={215,215,215},
            fillPattern=FillPattern.None,
            extent={{-100,-100},{100,100}},
            radius=25),
          Ellipse(
            extent={{-80,80},{80,-80}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{-55,55},{55,-55}},
            lineColor={255,255,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-60,14},{60,-14}},
            lineColor={215,215,215},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            origin={0,0},
            rotation=45)}),
      Documentation(info="<html>

<p>
This icon shall be used for a package that contains internal classes not to be
directly utilized by a user.
</p>
</html>"));
    end InternalPackage;

    partial class RotationalSensor
    "Icon representing a round measurement device"

      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
            Ellipse(
              fillColor={245,245,245},
              fillPattern=FillPattern.Solid,
              extent={{-70.0,-70.0},{70.0,70.0}}),
            Line(points={{0.0,70.0},{0.0,40.0}}),
            Line(points={{22.9,32.8},{40.2,57.3}}),
            Line(points={{-22.9,32.8},{-40.2,57.3}}),
            Line(points={{37.6,13.7},{65.8,23.9}}),
            Line(points={{-37.6,13.7},{-65.8,23.9}}),
            Ellipse(
              lineColor={64,64,64},
              fillColor={255,255,255},
              extent={{-12.0,-12.0},{12.0,12.0}}),
            Polygon(
              origin={0,0},
              rotation=-17.5,
              fillColor={64,64,64},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{-5.0,0.0},{-2.0,60.0},{0.0,65.0},{2.0,60.0},{5.0,0.0}}),
            Ellipse(
              fillColor={64,64,64},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              extent={{-7.0,-7.0},{7.0,7.0}})}),
        Documentation(info="<html>
<p>
This icon is designed for a <b>rotational sensor</b> model.
</p>
</html>"));
    end RotationalSensor;

    partial function Function "Icon for functions"

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
            Text(
              lineColor={0,0,255},
              extent={{-150,105},{150,145}},
              textString="%name"),
            Ellipse(
              lineColor=  {108,88,49},
              fillColor=  {255,215,136},
              fillPattern=  FillPattern.Solid,
              extent=  {{-100,-100},{100,100}}),
            Text(
              lineColor={108,88,49},
              extent={{-90.0,-90.0},{90.0,90.0}},
              textString="f")}),
    Documentation(info="<html>
<p>This icon indicates Modelica functions.</p>
</html>"));
    end Function;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Polygon(
              origin={-8.167,-17},
              fillColor={128,128,128},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{
                  4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,
                  -50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
              smooth=Smooth.Bezier,
              lineColor={0,0,0}), Ellipse(
              origin={-0.5,56.5},
              fillColor={128,128,128},
              pattern=LinePattern.None,
              fillPattern=FillPattern.Solid,
              extent={{-12.5,-12.5},{12.5,12.5}},
              lineColor={0,0,0})}), Documentation(info="<html>
<p>This package contains definitions for the graphical layout of components which may be used in different libraries. The icons can be utilized by inheriting them in the desired class using &quot;extends&quot; or by directly copying the &quot;icon&quot; layer. </p>

<h4>Main Authors:</h4>

<dl>
<dt><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a></dt>
    <dd>Deutsches Zentrum fuer Luft und Raumfahrt e.V. (DLR)</dd>
    <dd>Oberpfaffenhofen</dd>
    <dd>Postfach 1116</dd>
    <dd>D-82230 Wessling</dd>
    <dd>email: <a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</a></dd>
<dt>Christian Kral</dt>
    <dd><a href=\"http://www.ait.ac.at/\">Austrian Institute of Technology, AIT</a></dd>
    <dd>Mobility Department</dd><dd>Giefinggasse 2</dd>
    <dd>1210 Vienna, Austria</dd>
    <dd>email: <a href=\"mailto:dr.christian.kral@gmail.com\">dr.christian.kral@gmail.com</a></dd>
<dt>Johan Andreasson</dt>
    <dd><a href=\"http://www.modelon.se/\">Modelon AB</a></dd>
    <dd>Ideon Science Park</dd>
    <dd>22370 Lund, Sweden</dd>
    <dd>email: <a href=\"mailto:johan.andreasson@modelon.se\">johan.andreasson@modelon.se</a></dd>
</dl>

<p>Copyright &copy; 1998-2013, Modelica Association, DLR, AIT, and Modelon AB. </p>
<p><i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified under the terms of the <b>Modelica license</b>, see the license conditions and the accompanying <b>disclaimer</b> in <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a>.</i> </p>
</html>"));
  end Icons;

  package SIunits
  "Library of type and unit definitions based on SI units according to ISO 31-1992"
    extends Modelica.Icons.Package;

    package Conversions
    "Conversion functions to/from non SI units and type definitions of non SI units"
      extends Modelica.Icons.Package;

      package NonSIunits "Type definitions of non SI units"
        extends Modelica.Icons.Package;
        annotation (Documentation(info="<HTML>
<p>
This package provides predefined types, such as <b>Angle_deg</b> (angle in
degree), <b>AngularVelocity_rpm</b> (angular velocity in revolutions per
minute) or <b>Temperature_degF</b> (temperature in degree Fahrenheit),
which are in common use but are not part of the international standard on
units according to ISO 31-1992 \"General principles concerning quantities,
units and symbols\" and ISO 1000-1992 \"SI units and recommendations for
the use of their multiples and of certain other units\".</p>
<p>If possible, the types in this package should not be used. Use instead
types of package Modelica.SIunits. For more information on units, see also
the book of Francois Cardarelli <b>Scientific Unit Conversion - A
Practical Guide to Metrication</b> (Springer 1997).</p>
<p>Some units, such as <b>Temperature_degC/Temp_C</b> are both defined in
Modelica.SIunits and in Modelica.Conversions.NonSIunits. The reason is that these
definitions have been placed erroneously in Modelica.SIunits although they
are not SIunits. For backward compatibility, these type definitions are
still kept in Modelica.SIunits.</p>
</html>"),   Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
        Text(
          origin={15.0,51.8518},
          extent={{-105.0,-86.8518},{75.0,-16.8518}},
          lineColor={0,0,0},
          textString="[km/h]")}));
      end NonSIunits;
      annotation (                              Documentation(info="<HTML>
<p>This package provides conversion functions from the non SI Units
defined in package Modelica.SIunits.Conversions.NonSIunits to the
corresponding SI Units defined in package Modelica.SIunits and vice
versa. It is recommended to use these functions in the following
way (note, that all functions have one Real input and one Real output
argument):</p>
<pre>
  <b>import</b> SI = Modelica.SIunits;
  <b>import</b> Modelica.SIunits.Conversions.*;
     ...
  <b>parameter</b> SI.Temperature     T   = from_degC(25);   // convert 25 degree Celsius to Kelvin
  <b>parameter</b> SI.Angle           phi = from_deg(180);   // convert 180 degree to radian
  <b>parameter</b> SI.AngularVelocity w   = from_rpm(3600);  // convert 3600 revolutions per minutes
                                                      // to radian per seconds
</pre>

</html>"));
    end Conversions;

    type Angle = Real (
        final quantity="Angle",
        final unit="rad",
        displayUnit="deg");

    type Volume = Real (final quantity="Volume", final unit="m3");

    type Time = Real (final quantity="Time", final unit="s");

    type Frequency = Real (final quantity="Frequency", final unit="Hz");

    type Pressure = Real (
        final quantity="Pressure",
        final unit="Pa",
        displayUnit="bar");

    type Energy = Real (final quantity="Energy", final unit="J");

    type VolumeFlowRate = Real (final quantity="VolumeFlowRate", final unit=
            "m3/s");

    type ThermodynamicTemperature = Real (
        final quantity="ThermodynamicTemperature",
        final unit="K",
        min = 0.0,
        start = 288.15,
        nominal = 300,
        displayUnit="degC")
    "Absolute temperature (use type TemperatureDifference for relative temperatures)"
                                                                                                        annotation(absoluteValue=true);

    type Temperature = ThermodynamicTemperature;

    type AmountOfSubstance = Real (
        final quantity="AmountOfSubstance",
        final unit="mol",
        min=0);

    type MolarEnergy = Real (final quantity="MolarEnergy", final unit="J/mol", nominal=2e4);

    type MolarFlowRate = Real (final quantity="MolarFlowRate", final unit=
            "mol/s");

    type Concentration = Real (final quantity="Concentration", final unit=
            "mol/m3");
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={
          Line(
            points={{-66,78},{-66,-40}},
            color={64,64,64},
            smooth=Smooth.None),
          Ellipse(
            extent={{12,36},{68,-38}},
            lineColor={64,64,64},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-74,78},{-66,-40}},
            lineColor={64,64,64},
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-66,-4},{-66,6},{-16,56},{-16,46},{-66,-4}},
            lineColor={64,64,64},
            smooth=Smooth.None,
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-46,16},{-40,22},{-2,-40},{-10,-40},{-46,16}},
            lineColor={64,64,64},
            smooth=Smooth.None,
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid),
          Ellipse(
            extent={{22,26},{58,-28}},
            lineColor={64,64,64},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{68,2},{68,-46},{64,-60},{58,-68},{48,-72},{18,-72},{18,-64},
                {46,-64},{54,-60},{58,-54},{60,-46},{60,-26},{64,-20},{68,-6},{68,
                2}},
            lineColor={64,64,64},
            smooth=Smooth.Bezier,
            fillColor={175,175,175},
            fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>This package provides predefined types, such as <i>Mass</i>,
<i>Angle</i>, <i>Time</i>, based on the international standard
on units, e.g.,
</p>

<pre>   <b>type</b> Angle = Real(<b>final</b> quantity = \"Angle\",
                     <b>final</b> unit     = \"rad\",
                     displayUnit    = \"deg\");
</pre>

<p>
as well as conversion functions from non SI-units to SI-units
and vice versa in subpackage
<a href=\"modelica://Modelica.SIunits.Conversions\">Conversions</a>.
</p>

<p>
For an introduction how units are used in the Modelica standard library
with package SIunits, have a look at:
<a href=\"modelica://Modelica.SIunits.UsersGuide.HowToUseSIunits\">How to use SIunits</a>.
</p>

<p>
Copyright &copy; 1998-2013, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>
</html>",   revisions="<html>
<ul>
<li><i>May 25, 2011</i> by Stefan Wischhusen:<br/>Added molar units for energy and enthalpy.</li>
<li><i>Jan. 27, 2010</i> by Christian Kral:<br/>Added complex units.</li>
<li><i>Dec. 14, 2005</i> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>Add User&#39;;s Guide and removed &quot;min&quot; values for Resistance and Conductance.</li>
<li><i>October 21, 2002</i> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br/>Added new package <b>Conversions</b>. Corrected typo <i>Wavelenght</i>.</li>
<li><i>June 6, 2000</i> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>Introduced the following new types<br/>type Temperature = ThermodynamicTemperature;<br/>types DerDensityByEnthalpy, DerDensityByPressure, DerDensityByTemperature, DerEnthalpyByPressure, DerEnergyByDensity, DerEnergyByPressure<br/>Attribute &quot;final&quot; removed from min and max values in order that these values can still be changed to narrow the allowed range of values.<br/>Quantity=&quot;Stress&quot; removed from type &quot;Stress&quot;, in order that a type &quot;Stress&quot; can be connected to a type &quot;Pressure&quot;.</li>
<li><i>Oct. 27, 1999</i> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>New types due to electrical library: Transconductance, InversePotential, Damping.</li>
<li><i>Sept. 18, 1999</i> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>Renamed from SIunit to SIunits. Subpackages expanded, i.e., the SIunits package, does no longer contain subpackages.</li>
<li><i>Aug 12, 1999</i> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>Type &quot;Pressure&quot; renamed to &quot;AbsolutePressure&quot; and introduced a new type &quot;Pressure&quot; which does not contain a minimum of zero in order to allow convenient handling of relative pressure. Redefined BulkModulus as an alias to AbsolutePressure instead of Stress, since needed in hydraulics.</li>
<li><i>June 29, 1999</i> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br/>Bug-fix: Double definition of &quot;Compressibility&quot; removed and appropriate &quot;extends Heat&quot; clause introduced in package SolidStatePhysics to incorporate ThermodynamicTemperature.</li>
<li><i>April 8, 1998</i> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and Astrid Jaschinski:<br/>Complete ISO 31 chapters realized.</li>
<li><i>Nov. 15, 1997</i> by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and <a href=\"http://www.control.lth.se/~hubertus/\">Hubertus Tummescheit</a>:<br/>Some chapters realized.</li>
</ul>
</html>"));
  end SIunits;
annotation (
preferredView="info",
version="3.2.1",
versionBuild=2,
versionDate="2013-08-14",
dateModified = "2013-08-14 08:44:41Z",
revisionId="$Id:: package.mo 6947 2013-08-23 07:41:37Z #$",
uses(Complex(version="3.2.1"), ModelicaServices(version="3.2.1")),
conversion(
 noneFromVersion="3.2",
 noneFromVersion="3.1",
 noneFromVersion="3.0.1",
 noneFromVersion="3.0",
 from(version="2.1", script="modelica://Modelica/Resources/Scripts/Dymola/ConvertModelica_from_2.2.2_to_3.0.mos"),
 from(version="2.2", script="modelica://Modelica/Resources/Scripts/Dymola/ConvertModelica_from_2.2.2_to_3.0.mos"),
 from(version="2.2.1", script="modelica://Modelica/Resources/Scripts/Dymola/ConvertModelica_from_2.2.2_to_3.0.mos"),
 from(version="2.2.2", script="modelica://Modelica/Resources/Scripts/Dymola/ConvertModelica_from_2.2.2_to_3.0.mos")),
Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}), graphics={
  Polygon(
    origin={-6.9888,20.048},
    fillColor={0,0,0},
    pattern=LinePattern.None,
    fillPattern=FillPattern.Solid,
    points={{-93.0112,10.3188},{-93.0112,10.3188},{-73.011,24.6},{-63.011,31.221},{-51.219,36.777},{-39.842,38.629},{-31.376,36.248},{-25.819,29.369},{-24.232,22.49},{-23.703,17.463},{-15.501,25.135},{-6.24,32.015},{3.02,36.777},{15.191,39.423},{27.097,37.306},{32.653,29.633},{35.035,20.108},{43.501,28.046},{54.085,35.19},{65.991,39.952},{77.897,39.688},{87.422,33.338},{91.126,21.696},{90.068,9.525},{86.099,-1.058},{79.749,-10.054},{71.283,-21.431},{62.816,-33.337},{60.964,-32.808},{70.489,-16.14},{77.368,-2.381},{81.072,10.054},{79.749,19.05},{72.605,24.342},{61.758,23.019},{49.587,14.817},{39.003,4.763},{29.214,-6.085},{21.012,-16.669},{13.339,-26.458},{5.401,-36.777},{-1.213,-46.037},{-6.24,-53.446},{-8.092,-52.387},{-0.684,-40.746},{5.401,-30.692},{12.81,-17.198},{19.424,-3.969},{23.658,7.938},{22.335,18.785},{16.514,23.283},{8.047,23.019},{-1.478,19.05},{-11.267,11.113},{-19.734,2.381},{-29.259,-8.202},{-38.519,-19.579},{-48.044,-31.221},{-56.511,-43.392},{-64.449,-55.298},{-72.386,-66.939},{-77.678,-74.612},{-79.53,-74.083},{-71.857,-61.383},{-62.861,-46.037},{-52.278,-28.046},{-44.869,-15.346},{-38.784,-2.117},{-35.344,8.731},{-36.403,19.844},{-42.488,23.813},{-52.013,22.49},{-60.744,16.933},{-68.947,10.054},{-76.884,2.646},{-93.0112,-12.1707},{-93.0112,-12.1707}},
    smooth=Smooth.Bezier),
  Ellipse(
    origin={40.8208,-37.7602},
    fillColor={161,0,4},
    pattern=LinePattern.None,
    fillPattern=FillPattern.Solid,
    extent={{-17.8562,-17.8563},{17.8563,17.8562}})}),
Documentation(info="<HTML>
<p>
Package <b>Modelica&reg;</b> is a <b>standardized</b> and <b>free</b> package
that is developed together with the Modelica&reg; language from the
Modelica Association, see
<a href=\"https://www.Modelica.org\">https://www.Modelica.org</a>.
It is also called <b>Modelica Standard Library</b>.
It provides model components in many domains that are based on
standardized interface definitions. Some typical examples are shown
in the next figure:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/UsersGuide/ModelicaLibraries.png\">
</p>

<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"modelica://Modelica.UsersGuide.Overview\">Overview</a>
  provides an overview of the Modelica Standard Library
  inside the <a href=\"modelica://Modelica.UsersGuide\">User's Guide</a>.</li>
<li><a href=\"modelica://Modelica.UsersGuide.ReleaseNotes\">Release Notes</a>
 summarizes the changes of new versions of this package.</li>
<li> <a href=\"modelica://Modelica.UsersGuide.Contact\">Contact</a>
  lists the contributors of the Modelica Standard Library.</li>
<li> The <b>Examples</b> packages in the various libraries, demonstrate
  how to use the components of the corresponding sublibrary.</li>
</ul>

<p>
This version of the Modelica Standard Library consists of
</p>
<ul>
<li><b>1360</b> models and blocks, and</li>
<li><b>1280</b> functions</li>
</ul>
<p>
that are directly usable (= number of public, non-partial classes). It is fully compliant
to <a href=\"https://www.modelica.org/documents/ModelicaSpec32Revision2.pdf\">Modelica Specification Version 3.2 Revision 2</a>
and it has been tested with Modelica tools from different vendors.
</p>

<p>
<b>Licensed by the Modelica Association under the Modelica License 2</b><br>
Copyright &copy; 1998-2013, ABB, AIT, T.&nbsp;B&ouml;drich, DLR, Dassault Syst&egrave;mes AB, Fraunhofer, A.Haumer, ITI, Modelon,
TU Hamburg-Harburg, Politecnico di Milano, XRG Simulation.
</p>

<p>
<i>This Modelica package is <u>free</u> software and the use is completely at <u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <a href=\"modelica://Modelica.UsersGuide.ModelicaLicense2\">Modelica.UsersGuide.ModelicaLicense2</a> or visit <a href=\"https://www.modelica.org/licenses/ModelicaLicense2\"> https://www.modelica.org/licenses/ModelicaLicense2</a>.</i>
</p>

<p>
<b>Modelica&reg;</b> is a registered trademark of the Modelica Association.
</p>
</html>"));
end Modelica;

package Cardiovascular "Extension library of Physiolibrary"

  model System
    replaceable Interfaces.Heart heart annotation(Placement(transformation(extent={{-10,-8},
              {6,8}})));
    replaceable Interfaces.SystemicCirculation systemicCirculation annotation(Placement(transformation(extent = {{-10, -36}, {10, -16}})));
    replaceable Interfaces.PulmonaryCirculation pulmonaryCirculation annotation(Placement(transformation(extent = {{-10, 12}, {10, 32}})));
  equation
    connect(systemicCirculation.q_out, heart.rightHeartInflow) annotation(Line(points={{-10,-26},
            {-14,-26},{-14,-1.6},{-9.84,-1.6}},                                                                                                   color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(systemicCirculation.q_in, heart.leftHeartOutflow) annotation(Line(points={{10,-26},
            {12,-26},{12,-1.44},{6,-1.44}},                                                                                                   color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(heart.leftHeartInflow, pulmonaryCirculation.q_out) annotation(Line(points={{6,1.6},
            {12,1.6},{12,21.4},{9.8,21.4}},                                                                                                    color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    connect(heart.rightHeartOutflow, pulmonaryCirculation.q_in) annotation(Line(points={{-10,1.6},
            {-10,2},{-14,2},{-14,21.8},{-9.8,21.8}},                                                                                                    color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
    annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-20, -40}, {20, 40}}), graphics), Icon(coordinateSystem(extent={{-20,-40},
              {20,40}},                                                                                                    preserveAspectRatio=false),   graphics={  Bitmap(extent = {{-40, 40}, {40, -40}},
              imageSource =                                                                                                    "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", fileName = "modelica://Cardiovascular/Resources/Icons/cvsconcept.png"), Text(
            extent={{-40,-40},{40,-48}},
            lineColor={0,0,255},
            textString="%name")}),                                                                                                    Documentation(info="<html>
<p>Cardiovascular subsystems</p>
</html>"));
  end System;

  package Interfaces
    extends Modelica.Icons.InterfacesPackage;

    partial model Heart
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow annotation(Placement(transformation(extent={{-110,30},
                {-90,50}}),                                                                                                    iconTransformation(extent={{-108,
                -30},{-88,-10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow annotation(Placement(transformation(extent={{90,30},
                {110,50}}),                                                                                                    iconTransformation(extent={{-110,10},
                {-90,30}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow annotation(Placement(transformation(extent={{90,-30},
                {110,-10}}),                                                                                                    iconTransformation(extent={{90,10},
                {110,30}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow annotation(Placement(transformation(extent={{-110,
                -30},{-90,-10}}),                                                                                                    iconTransformation(extent={{90,-28},
                {110,-8}})));
      annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                        graphics={Bitmap(
                extent={{-86,106},{82,-104}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/heartPict.png"),                                          Text(extent={{
                  -98,-78},{102,-112}},                                                                                                    lineColor = {190, 0, 0},
                lineThickness =                                                                                                   1, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                                                    graphics));
    end Heart;

    partial model SystemicCirculation
      extends Physiolibrary.Icons.SystemicCirculation;
      //  extends Physiolibrary.Hydraulic.Interfaces.OnePort;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b q_out annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                -100},{100,100}}),                                                                           graphics), Icon(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),                                                                                                  graphics={  Text(extent=  {{-158, -50}, {160, -82}}, lineColor=  {0, 0, 255},
                lineThickness=                                                                                                    1, textString=  "%name")}));
    end SystemicCirculation;

    partial model PulmonaryCirculation
      extends Physiolibrary.Icons.PulmonaryCirculation;
      //  extends Physiolibrary.Hydraulic.Interfaces.OnePort;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}}), iconTransformation(extent = {{-108, -12}, {-88, 8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b q_out annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{88, -16}, {108, 4}})));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent=  {{-156, -38}, {156, -64}}, lineColor=  {0, 0, 255},
                lineThickness=                                                                                                    1, textString=  "%name")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end PulmonaryCirculation;
  end Interfaces;

  package ControlInterfaces

    partial model SystemBVControl
    "Interface for cardiovascular system controlled by short-term(baroreflex), long-term(blood volume) and pathologies(stenosis)"
      extends System(
        redeclare replaceable PulmonaryControl pulmonaryCirculation
          constrainedby Cardiovascular.ControlInterfaces.PulmonaryControl,
        redeclare replaceable HeartControl heart constrainedby
        Cardiovascular.ControlInterfaces.HeartControl,
        redeclare replaceable SystemicControl systemicCirculation
          constrainedby Cardiovascular.ControlInterfaces.SystemicControl);
      replaceable BaroreflexControl
        baroreflex
        annotation (Placement(transformation(extent={{-52,16},{-36,32}})));
      replaceable BloodVolumeControl bloodVolumeControl
        annotation (Placement(transformation(extent={{-50,-12},{-30,8}})));
    equation
      connect(pulmonaryCirculation.busConnector, heart.busConnector) annotation (
          Line(
          points={{-8,25.2},{-14,25.2},{-14,26},{-18,26},{-18,-5.6},{-8.4,-5.6}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(systemicCirculation.busConnector, heart.busConnector) annotation (
          Line(
          points={{-7.6,-29},{-18,-29},{-18,-5.6},{-8.4,-5.6}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(baroreflex.busConnector, heart.busConnector) annotation (Line(
          points={{-37.6,31.2},{-18,31.2},{-18,-5.6},{-8.4,-5.6}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bloodVolumeControl.busConnector, heart.busConnector) annotation (
          Line(
          points={{-41.8,0.4},{-18,0.4},{-18,-5.6},{-8.4,-5.6}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(bloodVolumeControl.port_a, heart.rightHeartInflow) annotation (
          Line(
          points={{-30.6,-8},{-14,-8},{-14,-1.6},{-9.84,-1.6}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},
                {20,40}}), graphics));
    end SystemBVControl;

    model PulmonaryControl
      extends Interfaces.PulmonaryCirculation;
      Physiolibrary.Types.BusConnector busConnector annotation (Placement(
            transformation(extent={{-100,14},{-60,54}}),
                                                       iconTransformation(
              extent={{-100,12},{-60,52}})));
    end PulmonaryControl;

    partial model HeartControl
      extends Interfaces.Heart;
      Physiolibrary.Types.BusConnector busConnector annotation (Placement(
            transformation(extent={{-118,66},{-78,106}}),
                                                       iconTransformation(
              extent={{-100,-90},{-60,-50}})));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end HeartControl;

    model SystemicControl
      extends Interfaces.SystemicCirculation;
      Physiolibrary.Types.BusConnector busConnector annotation (Placement(
            transformation(extent={{-100,14},{-60,54}}),
                                                       iconTransformation(
              extent={{-96,-50},{-56,-10}})));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics));
    end SystemicControl;
    extends Modelica.Icons.InterfacesPackage;

    partial model BaroreflexControl
      Physiolibrary.Types.BusConnector busConnector annotation (Placement(
            transformation(extent={{-28,14},{12,54}}), iconTransformation(
              extent={{60,70},{100,110}})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent=
               {{-100,-100},{100,100}}), graphics={Bitmap(extent={{-80,80},
                  {80,-80}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/baroreflex.png"),
              Text(
              extent={{-100,-80},{100,-118}},
              lineColor={0,0,255},
              textString="%name")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end BaroreflexControl;

    partial model BloodVolumeControl
      Physiolibrary.Types.BusConnector busConnector annotation (Placement(
            transformation(extent={{0,-8},{40,32}}), iconTransformation(
              extent={{-38,4},{2,44}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a port_a
        annotation (Placement(transformation(extent={{84,-70},{104,-50}}),
            iconTransformation(extent={{84,-70},{104,-50}})));
      Model.Control.BloodVolume.VolumeRefill2 volumeRefill
        annotation (Placement(transformation(extent={{46,-38},{86,6}})));
    equation
      connect(volumeRefill.busConnector, busConnector) annotation (Line(
          points={{63.6,-7.64},{20,-7.64},{20,12}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(volumeRefill.port_b, port_a) annotation (Line(
          points={{84.4,-35.8},{94,-35.8},{94,-60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-80,80},{82,
                  -80}}, fileName=
                  "modelica://Physiolibrary/Resources/Icons/bloodProperties.png"),
              Text(
              extent={{-100,-62},{100,-100}},
              lineColor={0,0,255},
              textString="%name")}));
    end BloodVolumeControl;
  end ControlInterfaces;

  package Model
    extends Modelica.Icons.ExamplesPackage;

    package Burkhoff

      model HemodynamicsBurkhoffBVControl
        extends ControlInterfaces.SystemBVControl(
          redeclare Variants.Parts.PulmonaryControl pulmonaryCirculation,
          redeclare Variants.Parts.HeartControl heart(MV(useLimitationInputs=
                  false), AOV(useLimitationInputs=false)),
          redeclare Variants.Parts.SystemicControl systemicCirculation(Ras(
                useConductanceInput=false)),
          redeclare Control.Baroreflex baroreflex(baroreceptor(
              PAOmedia=11585.715466364,
              EV0right=50662507.2177,
              EV0left=205316476.6191,
              EV0venacava=5.2504310309196e-07,
              activationDelay=10)),
          redeclare replaceable Control.BloodVolumeControl2
                                               bloodVolumeControl);
      /*    redeclare Control.StenosisControl simulationControl(venacavastenosis(
          InitialElastance=1906510.1400345, FinalElastance=
            1906510.1400345),                                aorticstenosis(
          InitialResistance(displayUnit="(mmHg.s)/ml") = 266644.77483,
          FinalResistance(displayUnit="(mmHg.s)/ml") = 266644.77483),
      mitralvalvestenosis(InitialResistance=333305.9685375, FinalResistance=333305.9685375)));*/
        annotation (experiment(StopTime=30, Tolerance=0.001));
      end HemodynamicsBurkhoffBVControl;

      package Parts
        extends Modelica.Icons.UtilitiesPackage;

        model Pulmonary
          extends Interfaces.PulmonaryCirculation;
          Cardiovascular.Hydraulic.Components.Resistor Rcsp(Resistance(displayUnit=
                  "(mmHg.s)/ml") = 2666447.7483)                                                                annotation(Placement(transformation(extent={{-84,-10},
                    {-64,10}})));
          Physiolibrary.Hydraulic.Components.ElasticVessel      Capprox(
            volume_start=3e-05,
            ZeroPressureVolume=2e-05,
            Compliance=7.5006157584566e-09)                                                                                               annotation(Placement(transformation(extent={{-56,-10},
                    {-36,10}})));
          Cardiovascular.Hydraulic.Components.Resistor Rcp(Resistance(displayUnit=
                  "(mmHg.s)/ml") = 2666447.7483)             annotation(Placement(transformation(extent={{-32,-10},
                    {-12,10}})));
          Physiolibrary.Hydraulic.Components.ElasticVessel      Cap(
            volume_start=0.000802,
            ZeroPressureVolume=0.0006,
            Compliance=1.5001231516913e-07)                                                                                                annotation(Placement(transformation(extent={{-8,-10},
                    {12,10}})));
          Cardiovascular.Hydraulic.Components.Resistor Rap(Resistance(displayUnit=
                  "(mmHg.s)/ml") = 2666447.7483)             annotation(Placement(transformation(extent={{12,-10},
                    {32,10}})));
          Physiolibrary.Hydraulic.Components.ElasticVessel      Cvp(
            volume_start=0.000154,
            ZeroPressureVolume=0.0001,
            Compliance=5.2504310309196e-08)                                                                                                annotation(Placement(transformation(extent={{34,-10},
                    {54,10}})));
          Cardiovascular.Hydraulic.Components.Resistor Rvp(Resistance(displayUnit=
                  "(mmHg.s)/ml") = 1999835.811225)           annotation(Placement(transformation(extent={{60,-10},
                    {80,10}})));
        equation
          connect(q_in, Rcsp.q_in) annotation (Line(
              points={{-100,0},{-84,0},{-84,2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Rcsp.q_out, Capprox.q_in) annotation (Line(
              points={{-64,2.22045e-16},{-46,2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Capprox.q_in, Rcp.q_in) annotation (Line(
              points={{-46,2.22045e-16},{-32,2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Rcp.q_out, Cap.q_in) annotation (Line(
              points={{-12,2.22045e-16},{2,2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Cap.q_in, Rap.q_in) annotation (Line(
              points={{2,2.22045e-16},{12,2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Rap.q_out, Cvp.q_in) annotation (Line(
              points={{32,2.22045e-16},{44,2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Cvp.q_in, Rvp.q_in) annotation (Line(
              points={{44,2.22045e-16},{60,2.22045e-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Rvp.q_out, q_out) annotation (Line(
              points={{80,2.22045e-16},{88,2.22045e-16},{88,0},{100,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics), Icon(graphics={Text(
                  extent={{-100,60},{100,100}},
                  lineColor={0,0,0},
                  textString="Burkhoff")}));
        end Pulmonary;

        model Systemic
          extends Interfaces.SystemicCirculation;
          Cardiovascular.Hydraulic.Components.Resistor Rcprox(Resistance(displayUnit=
                  "(mmHg.s)/ml") = 2666447.7483)                annotation(Placement(transformation(extent={{86,-10},
                    {66,10}})));
          Physiolibrary.Hydraulic.Components.ElasticVessel Caprox(
            volume_start=3.8e-05,
            ZeroPressureVolume=3e-05,
            Compliance=7.5006157584566e-10)                                                                                                     annotation(Placement(transformation(extent={{44,-10},
                    {64,10}})));
          Cardiovascular.Hydraulic.Components.Resistor Rcs(Resistance(displayUnit=
                  "(mmHg.s)/ml") = 3199737.29796)            annotation(Placement(transformation(extent={{42,-10},
                    {22,10}})));
          Physiolibrary.Hydraulic.Components.ElasticVessel Cas(
            volume_start=0.000834,
            ZeroPressureVolume=0.0007,
            Compliance=1.2751046789376e-08)                                                                                                     annotation(Placement(transformation(extent={{0,-10},
                    {20,10}})));
          Cardiovascular.Hydraulic.Components.Resistor Ras(Resistance(displayUnit=
                  "(mmHg.s)/ml") = 99991790.56125)           annotation(Placement(transformation(extent={{-2,-10},
                    {-22,10}})));
          Hydraulic.Components.ElasticVesselComplianceAdd2 Cvs(
            volume_start=0.002701,
            ZeroPressureVolume=0.00223,
            useComplianceInput=false,
            Compliance=5.2504310309196e-07)
            annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
          Cardiovascular.Hydraulic.Components.Resistor Rvs(Resistance(displayUnit=
                  "(mmHg.s)/ml") = 2666447.7483)             annotation(Placement(transformation(extent={{-56,-10},
                    {-76,10}})));
        equation
          connect(Rcprox.q_in, q_in) annotation (Line(
              points={{86,0},{100,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Rcprox.q_out, Caprox.q_in) annotation (Line(
              points={{66,0},{54,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Caprox.q_in, Rcs.q_in) annotation (Line(
              points={{54,0},{42,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Rcs.q_out, Cas.q_in) annotation (Line(
              points={{22,0},{10,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Cas.q_in, Ras.q_in) annotation (Line(
              points={{10,0},{-2,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Ras.q_out, Cvs.q_in) annotation (Line(
              points={{-22,0},{-38,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Cvs.q_in, Rvs.q_in) annotation (Line(
              points={{-38,0},{-56,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Rvs.q_out, q_out) annotation (Line(
              points={{-76,0},{-100,0}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics), Icon(graphics={Text(
                  extent={{-100,60},{100,100}},
                  lineColor={0,0,0},
                  textString="Burkhoff")}));
        end Systemic;

        model ElasticVesselWithSVandP
        "elastic vessel computes aditionally stressed volume and pressure"
          extends Physiolibrary.Hydraulic.Components.ElasticVessel;
          Physiolibrary.Types.RealIO.VolumeOutput StressedVolume annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-88, -100}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {-44, 102})));
        equation
          StressedVolume = volume - zpv;

          annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                    -100},{100,100}}),                                                                                                    graphics));
        end ElasticVesselWithSVandP;

        partial model HeartElastance
        "Elastance of heart atria and ventricules by Burkhoff"
          import Physiolibrary.Types.*;
          RealIO.VolumeInput Vs "Stressed volume" annotation(Placement(visible = true, transformation(origin = {-163.397, -51.3719}, extent = {{-20.0, -20.0}, {20.0, 20.0}}, rotation = 0), iconTransformation(origin={-86,-88},    extent = {{-9.999980000000001, -10}, {10, 9.99995}}, rotation=90)));
          parameter Real Alpha( final unit="1/m3")
          "coefficient of end diastolic pressure-volume curve";
          parameter Pressure Beta
          "coefficient of end diastolic pressure-volume curve";
          parameter Boolean useEs_extInput = false
          "=true, if external elastance/compliance value is used"
            annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
          parameter HydraulicElastance Ees
          "coefficient of end-systolic elastance"
                annotation (Dialog(enable=not useEs_extInput));
          HydraulicElastance Et "Elastance";
          Time Tsyst;
          //need to define in extended model
          parameter Time Tmax "duration of systole ";
          parameter Time Tau "time constant of myocardial relaxation ";
          Real Et0
          "Relative elastance value (Elastance/End-Systolic Elastance)";
          RealIO.PressureOutput Pt "peak isovolumic pressure" annotation (Placement(
                transformation(extent={{64,-78},{84,-58}}),iconTransformation(
                  extent={{-10,-10},{10,10}},
                rotation=270,
                origin={82,-86})));
          RealIO.HydraulicComplianceOutput Ct annotation (Placement(
                transformation(extent={{52,-76},{72,-56}}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={30,-86})));
          Physiolibrary.Types.RealIO.HydraulicComplianceInput Es_ext(start=1/Ees)=1/mes if useEs_extInput annotation (
              Placement(transformation(extent={{64,56},{104,96}}), iconTransformation(
                extent={{-13,-13},{13,13}},
                rotation=180,
                origin={87,67})));
      protected
         HydraulicElastance mes;
        equation
          if not useEs_extInput then
            mes = Ees;
          end if;
          if Tsyst <= 3 / 2 * Tmax then
            Et0 = 0.5 * (sin(Modelica.Constants.pi / Tmax * Tsyst - Modelica.Constants.pi / 2) + 1);
          else
            Et0 = 0.5 * exp(-(Tsyst - 3 * Tmax / 2) / Tau);
          end if;
          //1e+6 and 133.322368 are recalculation in SI units - as the original equation comes in torr and ml.
          //  Et = (1 - Et0) * Beta * (exp(Alpha * Vs * 1e+6) - 1) / Vs * 1e+6) * 133.322368 * 1e+6 + Et0 * Ees;

          Et = Modelica.Constants.eps + Et0 * mes;
          Pt = (1 - Et0) * Beta * (exp(Alpha * Vs) - 1);
          Ct = 1 / Et;
          annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                    -100},{100,100}}),                                                                           graphics), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                    -100},{100,100}}),                                                                                                    graphics={  Rectangle(extent={{
                      -100,100},{100,-76}},                                                                                                    lineColor=  {0, 0, 127}, fillColor=  {255, 255, 170},
                    fillPattern=                                                                                                    FillPattern.Solid), Line(points={{
                      -38,94},{-38,-36},{86,-36}},                                                                                                    color=  {0, 0, 0}, smooth=  Smooth.None), Line(points={{
                      -34,-34},{30,-32},{54,-30},{70,-28},{76,-26},{82,-24},{86,-22},{90,
                      -20}},                                                                                                    color=  {0, 0, 0}, smooth=  Smooth.None), Line(points={{
                      -34,-36},{4,94}},                                                                                                    color=  {0, 0, 0}, smooth=  Smooth.None), Line(points={{
                      -34,-36},{88,80}},                                                                                                    color=  {255, 0, 0}, smooth=  Smooth.None), Polygon(points={{
                      76,72},{72,80},{80,76},{76,72}},                                                                                                    lineColor=  {255, 0, 0}, smooth=  Smooth.None, fillColor=  {255, 0, 0},
                    fillPattern=                                                                                                    FillPattern.Solid), Polygon(points=  {{0, -4}, {-4, 4}, {4, 0}, {0, -4}}, lineColor=  {255, 0, 0}, smooth=  Smooth.None, fillColor=  {255, 0, 0},
                    fillPattern=                                                                                                    FillPattern.Solid, origin={84,
                      69},                                                                                                    rotation=  180), Text(extent={{
                      -110,-52},{-64,-76}},                                                                                                    lineColor=  {0, 0, 255}, fillColor=  {255, 0, 0},
                    fillPattern=                                                                                                    FillPattern.Solid, textString=  "Vs"), Text(extent={{6,
                      -50},{52,-76}},                                                                                                    lineColor=
                      {0,0,255},                                                                                                    fillColor=
                      {255,0,0},
                    fillPattern=FillPattern.Solid,
                  textString="Ct"),                                                                                                    Text(extent={{
                      -100,120},{100,104}},                                                                                                    lineColor=  {0, 0, 255}, fillColor=  {170, 213, 255},
                    fillPattern=                                                                                                    FillPattern.Solid, textString=  "%name"),
                                                                                                    Text(extent={{
                      58,-50},{100,-78}},                                                                                                  lineColor=
                      {0,0,255},                                                                                                    fillColor=
                      {255,0,0},
                    fillPattern=FillPattern.Solid,
                  textString="Ped")}));
        end HeartElastance;

        model Heart "heart with modified elastance"
          extends Interfaces.Heart;
          ElasticVesselWithSVandP LA(
            useComplianceInput=true,
            useExternalPressureInput=true,
            volume_start=8.1e-05,
            ZeroPressureVolume=5e-06)
            annotation (Placement(transformation(extent={{30,-50},{50,-30}})));
          AtrialElastance atrialElastance1(
            Tmax(displayUnit="ms") = 0.125,
            Tau(displayUnit="ms") = 0.02,
            Alpha=40000,
            Beta(displayUnit="mmHg") = 39.9967162245,
            Ees=33330596.85375) annotation (Placement(transformation(
                extent={{-17,-13},{17,13}},
                rotation=0,
                origin={31,3})));
          Physiolibrary.Hydraulic.Components.IdealValve MV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.0002463033826e-06) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin={-6,-40})));
          VentricularElastance ventricularElastance1(
            Tmax(displayUnit="ms") = 0.2,
            Tau(displayUnit="ms") = 0.03,
            Alpha=24000,
            Beta(displayUnit="mmHg") = 45.3296117211,
            Ees=205316476.6191)
            annotation (Placement(transformation(extent={{-52,-20},{-18,6}})));
          ElasticVesselWithSVandP LV(
            useComplianceInput=true,
            volume_start=0.000125,
            ZeroPressureVolume=5e-06,
            useExternalPressureInput=true)
                                      annotation (Placement(transformation(
                  extent={{-38,-50},{-18,-30}})));
          Physiolibrary.Hydraulic.Components.IdealValve AOV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.7503078792283e-06) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin={-52,-40})));
          Physiolibrary.Hydraulic.Components.IdealValve PV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.7503078792283e-06) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={50,42})));
          ElasticVesselWithSVandP RV(
            useComplianceInput=true,
            ExternalPressure=0,
            volume_start=0.000112,
            ZeroPressureVolume=5e-06,
            useExternalPressureInput=true)
            annotation (Placement(transformation(extent={{16,32},{36,52}})));
          VentricularElastance ventricularElastance(
            Tmax(displayUnit="ms") = 0.2,
            Tau(displayUnit="ms") = 0.03,
            Alpha=24000,
            Beta(displayUnit="mmHg") = 45.3296117211,
            Ees=50662507.2177)
            annotation (Placement(transformation(extent={{16,64},{50,92}})));
          Physiolibrary.Hydraulic.Components.IdealValve TV(_Gon(displayUnit = "ml/(mmHg.s)") = 3.0002463033826e-06) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={4,42})));
          AtrialElastance atrialElastance(
            Tmax(displayUnit="ms") = 0.125,
            Tau(displayUnit="ms") = 0.02,
            Alpha=40000,
            Beta(displayUnit="mmHg") = 39.9967162245,
            Ees=26664477.483)
            annotation (Placement(transformation(extent={{-80,62},{-48,92}})));
          ElasticVesselWithSVandP RA(
            useComplianceInput=true,
            useExternalPressureInput=true,
            volume_start=7.3e-05,
            ZeroPressureVolume=5e-06)
            annotation (Placement(transformation(extent={{-60,32},{-40,52}})));
          replaceable Physiolibrary.Types.Constants.FrequencyConst
                                                       heartRate(k=
                1.3333333333333)                                                      annotation(Placement(transformation(extent={{-98,8},
                    {-84,22}})));
          Hydraulic.Components.BloodFlowMeasurement bloodFlowMeasurement
            annotation (Placement(transformation(extent={{-76,-50},{-96,-30}})));
          Modelica.Blocks.Math.Add add annotation (Placement(transformation(
                extent={{-5,-5},{5,5}},
                rotation=270,
                origin={51,-21})));
          Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
                extent={{-5,-5},{5,5}},
                rotation=270,
                origin={-41,59})));
          Modelica.Blocks.Math.Gain RAVGain(k=0.02) annotation (Placement(
                transformation(
                extent={{-6,-6},{6,6}},
                rotation=180,
                origin={-22,66})));
          Modelica.Blocks.Math.Gain LAVGain(k=0.02) annotation (Placement(
                transformation(
                extent={{-6,-6},{6,6}},
                rotation=180,
                origin={62,-8})));
          Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure
            annotation (Placement(transformation(extent={{18,52},{4,64}})));
          Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure1
            annotation (Placement(transformation(extent={{-14,-58},{0,-48}})));
        equation
          connect(rightHeartInflow, RA.q_in) annotation (Line(
              points={{-100,40},{-74,40},{-74,42},{-50,42}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(RA.q_in, TV.q_in) annotation (Line(
              points={{-50,42},{-6,42}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(TV.q_out, RV.q_in) annotation (Line(
              points={{14,42},{26,42}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(RV.q_in, PV.q_in) annotation (Line(
              points={{26,42},{40,42}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(PV.q_out, rightHeartOutflow) annotation (Line(
              points={{60,42},{82,42},{82,40},{100,40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(leftHeartInflow, LA.q_in) annotation (Line(
              points={{100,-20},{84,-20},{84,-18},{64,-18},{64,-40},{40,-40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(LA.q_in, MV.q_in) annotation (Line(
              points={{40,-40},{4,-40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(MV.q_out, LV.q_in) annotation (Line(
              points={{-16,-40},{-28,-40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(LV.q_in, AOV.q_in) annotation (Line(
              points={{-28,-40},{-42,-40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(ventricularElastance1.Ct, LV.compliance) annotation (Line(
              points={{-29.9,-18.18},{-28,-18.18},{-28,-32}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ventricularElastance.Ct, RV.compliance) annotation (Line(
              points={{38.1,65.96},{38.1,63.65},{26,63.65},{26,50}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(heartRate.y, atrialElastance.HR) annotation (Line(
              points={{-82.25,15},{-82.25,89.45},{-78.24,89.45}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(RA.StressedVolume, atrialElastance.Vs) annotation (Line(
              points={{-54.4,52.2},{-54.4,56},{-77.76,56},{-77.76,63.8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(RV.StressedVolume, ventricularElastance.Vs) annotation (Line(
              points={{21.6,52.2},{21.6,54},{18.38,54},{18.38,65.68}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(LV.StressedVolume, ventricularElastance1.Vs) annotation (Line(
              points={{-32.4,-29.8},{-32.4,-24},{-49.62,-24},{-49.62,-18.44}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(LA.StressedVolume, atrialElastance1.Vs) annotation (Line(
              points={{35.6,-29.8},{35.6,-26},{16.38,-26},{16.38,-8.44}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(heartRate.y, ventricularElastance1.HR) annotation (Line(
              points={{-82.25,15},{-82.25,3.79},{-50.13,3.79}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ventricularElastance.HR, atrialElastance.HR) annotation (Line(
              points={{17.87,89.62},{-46,89.62},{-46,96},{-82,96},{-82,89.45},{
                  -78.24,89.45}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(bloodFlowMeasurement.q_in, AOV.q_out) annotation (Line(
              points={{-76,-40},{-62,-40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(bloodFlowMeasurement.q_out, leftHeartOutflow) annotation (
              Line(
              points={{-96,-40},{-100,-40},{-100,-20}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(bloodFlowMeasurement.HR, heartRate.y) annotation (Line(
              points={{-80,-30},{-82,-30},{-82,15},{-82.25,15}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(ventricularElastance1.Pt, LV.externalPressure) annotation (
              Line(
              points={{-21.06,-18.18},{-20,-18.18},{-20,-32}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(LA.externalPressure, add.y) annotation (Line(
              points={{48,-32},{50,-32},{50,-26.5},{51,-26.5}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(atrialElastance1.HR, heartRate.y) annotation (Line(
              points={{15.87,13.79},{15.87,15},{-82.25,15}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(atrialElastance.Pt, add1.u2) annotation (Line(
              points={{-50.88,64.1},{-44,64.1},{-44,65}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add1.y, RA.externalPressure) annotation (Line(
              points={{-41,53.5},{-41,53.75},{-42,53.75},{-42,50}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add1.u1, RAVGain.y) annotation (Line(
              points={{-38,65},{-38,66},{-28.6,66}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add.u1, LAVGain.y) annotation (Line(
              points={{54,-15},{54,-12},{54,-8},{55.4,-8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(pressureMeasure1.q_in, LV.q_in) annotation (Line(
              points={{-9.8,-56},{-24,-56},{-24,-40},{-28,-40}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(pressureMeasure1.pressure, LAVGain.u) annotation (Line(
              points={{-2.8,-55},{69.2,-55},{69.2,-8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(pressureMeasure.q_in, RV.q_in) annotation (Line(
              points={{13.8,54.4},{14,54.4},{14,46},{26,46},{26,42}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(pressureMeasure.pressure, RAVGain.u) annotation (Line(
              points={{6.8,55.6},{6.8,66},{-14.8,66}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(RA.compliance, atrialElastance.Ct) annotation (Line(
              points={{-50,50},{-50,58},{-59.2,58},{-59.2,64.1}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(atrialElastance1.Pt, add.u2) annotation (Line(
              points={{44.94,-8.18},{44.94,-11.09},{48,-11.09},{48,-15}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(LA.compliance, atrialElastance1.Ct) annotation (Line(
              points={{40,-32},{38,-32},{38,-8.18},{36.1,-8.18}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(RV.externalPressure, ventricularElastance.Pt) annotation (
              Line(
              points={{34,50},{34,56},{46.94,56},{46.94,65.96}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(graphics={
                  Text(
                  extent={{-100,60},{100,100}},
                  lineColor={0,0,0},
                  textString="Burkhoff")}));
        end Heart;

        model VentricularElastance
          extends HeartIntervals;
          //produces tvsyst and tasyst
          extends HeartElastance;
          //consumes tsyst from above
        equation
          Tsyst = Tvsyst;
        end VentricularElastance;

        model HeartIntervals
          discrete Physiolibrary.Types.Time HP(start = 0)
          "heart period - duration of cardiac cycle";
          Boolean b(start = false);
          Physiolibrary.Types.RealIO.FrequencyInput HR annotation(Placement(transformation(extent = {{-134.0, 8.0}, {-94.0, 48.0}}, origin = {1.3363, -48.0}, rotation = 0), iconTransformation(extent = {{-73.7009, 4.4}, {-51.7009, 26.4}}, origin = {-26.2991, 67.6}, rotation = 0), visible = true));
          Physiolibrary.Types.Time Tasyst
          "time elapsed from the beginning of atrial systole";
          Physiolibrary.Types.Time Tvsyst
          "time elapsed from the beginning of ventricular systole";
          parameter Physiolibrary.Types.Time AVDelay(displayUnit = "s")= 0.160
          "AV interval";
          Physiolibrary.Types.Time T0 "start time of cardiac cycle";
          Physiolibrary.Types.Time EDTV "Ventricular end Diastolic Time";
        equation
          b = time - pre(T0) >= pre(HP);
          when {initial(), b} then
            T0 = time;
            HP = 1 / HR;
            EDTV = T0 + AVDelay;
          end when;
          Tasyst = time - T0;
          if time - T0 < AVDelay then
            Tvsyst = 0;
          else
            Tvsyst = time - (T0 + AVDelay);
          end if;
          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(visible=  true, origin=  {-18.5625, 68}, lineColor=  {0, 0, 255}, extent=  {{-73.4375, 6.00004}, {-23.4375, 24}}, textString=  "HR", fontName=  "Arial")}));
        end HeartIntervals;

        model AtrialElastance
          extends HeartIntervals;
          extends HeartElastance;
        equation
          Tsyst = Tasyst;
          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
        end AtrialElastance;
      end Parts;

      package Test

        model BurkhoffBleeding

          HemodynamicsBurkhoffBVControl hemodynamicsBurkhoffBVControl(
              bloodVolumeControl(plasma(transfusion(SolutionFlow=0,
                    useSolutionFlowInput=true),  hemorrhage(SolutionFlow=0,
                    useSolutionFlowInput=true)), redBloodCells(transfusion(
                    useChangeInput=true), hemorrhage(useChangeInput=true))))
            annotation (Placement(transformation(extent={{18,-6},{84,76}})));
          BleedingTransfusionScenario bleedingTransfusionScenario(
            BloodTrans=0,
          Tbd=300,
          BloodLoss=0.0005,
          Tts=1200,
          Ttd=600)
            annotation (Placement(transformation(extent={{-92,-12},{-28,48}})));
        equation

          hemodynamicsBurkhoffBVControl.bloodVolumeControl.redBloodCells.hemorrhage.populationChange=
            bleedingTransfusionScenario.bleedrate*
              hemodynamicsBurkhoffBVControl.bloodVolumeControl.bloodProperties.hematocrit.y*12e12/2.4e-3;
          hemodynamicsBurkhoffBVControl.bloodVolumeControl.plasma.hemorrhage.solutionFlow=
            bleedingTransfusionScenario.bleedrate*
              (1-hemodynamicsBurkhoffBVControl.bloodVolumeControl.bloodProperties.hematocrit.y);

          hemodynamicsBurkhoffBVControl.bloodVolumeControl.plasma.transfusion.solutionFlow=
          bleedingTransfusionScenario.transrate*(1-0.4);
          hemodynamicsBurkhoffBVControl.bloodVolumeControl.redBloodCells.transfusion.populationChange=
          bleedingTransfusionScenario.transrate*0.4*12e12/2.4e-3;

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics={
                Line(
                  points={{-70,32},{28,32}},
                  color={0,0,255},
                  smooth=Smooth.Bezier,
                  arrow={Arrow.None,Arrow.Filled}),
                Line(
                  points={{-42,22},{26,22}},
                  color={0,0,255},
                  smooth=Smooth.Bezier,
                  arrow={Arrow.None,Arrow.Filled}),
                Text(
                  extent={{-28,38},{10,34}},
                  lineColor={0,0,255},
                  textString="bleedrate"),
                Text(
                  extent={{-28,26},{10,22}},
                  lineColor={0,0,255},
                  textString="transfusionrate")}));
        end BurkhoffBleeding;

        model BleedingTransfusionScenario
          import Physiolibrary.Types.*;
          parameter Time Tbs=60,Tbd=5*60; //1 minute, 5minutes bleeding
          parameter Volume BloodLoss=0.001;
          parameter Time Tts=20*60,Ttd=10*60;//after 20 minutes, transfussion for 10 minutes
          parameter Volume BloodTrans=0.001;
          VolumeFlowRate bleedrate,transrate;
        equation
          if time>Tbs and time<Tbs+Tbd then
            bleedrate=BloodLoss/Tbd;
          else
            bleedrate=0;
          end if;

          if time>Tts and time<Tts+Ttd then
              transrate=BloodTrans/Ttd;
          else
              transrate=0;
          end if;

          annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}}), graphics={
                Line(
                  points={{-80,80},{-80,-80}},
                  color={0,0,255},
                  smooth=Smooth.None),
                Line(
                  points={{80,-80},{-80,-80}},
                  color={0,0,255},
                  smooth=Smooth.None),
                Line(
                  points={{-76,58},{-46,58},{-28,50},{-28,26},{-8,12},{4,14},{28,14},{50,
                      8},{54,20},{62,60},{80,60}},
                  color={0,0,255},
                  smooth=Smooth.Bezier),
                Text(
                  extent={{-100,-80},{100,-100}},
                  lineColor={0,0,255},
                  textString="%name")}));
        end BleedingTransfusionScenario;
      end Test;

      package Variants
        extends Modelica.Icons.VariantsPackage;

        package Parts
          extends Modelica.Icons.UtilitiesPackage;

          model PulmonaryControl
            extends ControlInterfaces.PulmonaryControl;
            extends Cardiovascular.Model.Burkhoff.Parts.Pulmonary;
            Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(
                  transformation(extent={{-36,22},{-56,42}})));
          equation
            connect(Capprox.volume, add3_1.u3) annotation (Line(
                points={{-40,-10},{-40,-16},{-34,-16},{-34,24}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(Cap.volume, add3_1.u2) annotation (Line(
                points={{8,-10},{10,-10},{10,-16},{16,-16},{16,32},{-34,32}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(Cvp.volume, add3_1.u1) annotation (Line(
                points={{50,-10},{52,-10},{52,-16},{56,-16},{56,40},{-34,40}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(add3_1.y, busConnector.pulmonaryBloodVolume) annotation (
                Line(
                points={{-57,32},{-68,32},{-68,34},{-80,34}},
                color={0,0,127},
                smooth=Smooth.None), Text(
                string="%second",
                index=1,
                extent={{6,3},{6,3}}));
            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics));
          end PulmonaryControl;

          model SystemicControl
            extends ControlInterfaces.SystemicControl;
            extends Cardiovascular.Model.Burkhoff.Parts.Systemic(
              Cvs(useComplianceInput=true),
              Caprox(useComplianceInput=false));
            Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(
                  transformation(
                  extent={{-7,-7},{7,7}},
                  rotation=180,
                  origin={-65,-23})));
            Hydraulic.Components.MeanAortaPressureMeasurement
              aortaPressureMeasurement
              annotation (Placement(transformation(extent={{32,12},{52,32}})));
          equation
            connect(add3_1.u3, Cvs.volume) annotation (Line(
                points={{-56.6,-17.4},{-32,-17.4},{-32,-10}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(add3_1.u2, Cas.volume) annotation (Line(
                points={{-56.6,-23},{16,-23},{16,-10}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(add3_1.u1, Caprox.volume) annotation (Line(
                points={{-56.6,-28.6},{60,-28.6},{60,-10}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(add3_1.y, busConnector.systemicBloodVolume) annotation (
                Line(
                points={{-72.7,-23},{-80,-23},{-80,34}},
                color={0,0,127},
                smooth=Smooth.None), Text(
                string="%second",
                index=1,
                extent={{6,3},{6,3}}));
            connect(Rcs.q_in, aortaPressureMeasurement.q_in) annotation (Line(
                points={{42,0},{42,16},{38,16}},
                color={0,0,0},
                thickness=1,
                smooth=Smooth.None));
            connect(aortaPressureMeasurement.Pmean, busConnector.aortameanpressure)
              annotation (Line(
                points={{49,25},{62,25},{62,34},{-80,34}},
                color={0,0,127},
                smooth=Smooth.None), Text(
                string="%second",
                index=1,
                extent={{6,3},{6,3}}));
            connect(Cvs.compliance, busConnector.venacavacompliance)
              annotation (Line(
                points={{-38,8},{-38,34},{-80,34}},
                color={0,0,127},
                smooth=Smooth.None), Text(
                string="%second",
                index=1,
                extent={{6,3},{6,3}}));
            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics));
          end SystemicControl;

          model HeartControl
            extends ControlInterfaces.HeartControl;
            extends Cardiovascular.Model.Burkhoff.Parts.Heart(
              redeclare Types.Constants.FrequencyControl heartRate,
              ventricularElastance(useEs_extInput=true),
              atrialElastance1(useEs_extInput=false),
              ventricularElastance1(useEs_extInput=true),
              AOV(_Goff(displayUnit="ml/(mmHg.s)"), useLimitationInputs=false),
              MV(useLimitationInputs=false));
            Modelica.Blocks.Math.Sum sum1(nin=4)
              annotation (Placement(transformation(extent={{58,6},{78,26}})));
          equation
            connect(heartRate.c, busConnector.heartrate) annotation (Line(
                points={{-94.5,15},{-94.5,49.5},{-98,49.5},{-98,86}},
                color={0,0,127},
                smooth=Smooth.None), Text(
                string="%second",
                index=1,
                extent={{6,3},{6,3}}));
            connect(ventricularElastance.Es_ext, busConnector.rvcompliance) annotation (
                Line(
                points={{47.79,87.38},{28,87.38},{28,86},{-98,86}},
                color={0,0,127},
                smooth=Smooth.None), Text(
                string="%second",
                index=1,
                extent={{6,3},{6,3}}));
            connect(ventricularElastance1.Es_ext, busConnector.lvcompliance) annotation (
                Line(
                points={{-20.21,1.71},{82,1.71},{82,86},{-98,86}},
                color={128,255,0},
                smooth=Smooth.None,
                thickness=0.5), Text(
                string="%second",
                index=1,
                extent={{6,3},{6,3}}));
            connect(RV.volume, sum1.u[1]) annotation (Line(
                points={{32,32},{32,14.5},{56,14.5}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(RA.volume, sum1.u[2]) annotation (Line(
                points={{-44,32},{-46,32},{-46,15.5},{56,15.5}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(LV.volume, sum1.u[3]) annotation (Line(
                points={{-22,-50},{-22,-72},{56,-72},{56,16.5}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(LA.volume, sum1.u[4]) annotation (Line(
                points={{46,-50},{46,-58},{56,-58},{56,17.5}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(sum1.y, busConnector.heartBloodVolume) annotation (Line(
                points={{79,16},{82,16},{82,86},{-98,86}},
                color={127,255,0},
                smooth=Smooth.None,
                thickness=0.5), Text(
                string="%second",
                index=1,
                extent={{6,3},{6,3}}));
            annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                      -100},{100,100}}), graphics));
          end HeartControl;
        end Parts;
      end Variants;
    end Burkhoff;

    package Control "models of control mechanism"
      extends Modelica.Icons.VariantsPackage;

      model Baroreflex
        extends Cardiovascular.ControlInterfaces.BaroreflexControl;
      /*  Physiolibrary.Types.BusConnector busConnector annotation (Placement(
        transformation(extent={{-28,14},{12,54}}), iconTransformation(
          extent={{60,70},{100,110}})));*/
        Baroreceptor baroreceptor(activationDelay(displayUnit="s"))
          annotation (Placement(transformation(extent={{18,-54},{80,18}})));
      equation
        connect(baroreceptor.RS, busConnector.peripheralconductance)
          annotation (Line(
            points={{25.44,-26.64},{-8,-26.64},{-8,34}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(baroreceptor.evright, busConnector.rvcompliance)
          annotation (Line(
            points={{25.44,-14.4},{-8,-14.4},{-8,34}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(baroreceptor.evleft, busConnector.lvcompliance) annotation (
           Line(
            points={{24.2,-2.88},{-8,-2.88},{-8,34}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(baroreceptor.HR, busConnector.heartrate) annotation (Line(
            points={{23.89,9},{-8,9},{-8,34}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(baroreceptor.PAo, busConnector.aortameanpressure)
          annotation (Line(
            points={{25.44,-47.52},{-8,-47.52},{-8,34}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(baroreceptor.evenacava, busConnector.venacavacompliance)
          annotation (Line(
            points={{24.82,-38.88},{-8,-38.88},{-8,34}},
            color={0,0,127},
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),       graphics),
                                       Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
              graphics));
      end Baroreflex;

      model Baroreceptor
        Modelica.Blocks.Continuous.TransferFunction H1(a = {15, 1}, b = {1});
        Modelica.Blocks.Continuous.TransferFunction H2(a = {15, 1}, b = {0.048});
        Modelica.Blocks.Continuous.TransferFunction H3(a = {15, 1}, b = {0.154});
        // from orign.mo(a={30,1}, b={0.194});
        Modelica.Blocks.Continuous.TransferFunction H4(a = {2, 1}, b = {0.1});
        Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax = 0.1, uMin = -0.1);
        parameter Physiolibrary.Types.Pressure PAOmedia = 13465.561128915;
        parameter Physiolibrary.Types.Frequency HR0Param = 1.3333333333333 annotation(Dialog(enable = not useConductanceInput));
        parameter Boolean useHRInput = false
        "=true, if external HR value is used"                                      annotation(Evaluate = true, HideResult = true, choices(__Dymola_checkBox = true), Dialog(group = "External inputs/outputs"));
        Physiolibrary.Types.RealIO.FrequencyInput cond(start = HR0Param) = HR0 if useHRInput annotation(Placement(transformation(extent = {{-62, 36}, {-22, 76}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 180, origin = {26, 76})));
        Physiolibrary.Types.RealIO.PressureInput PAo "pressure in aorta" annotation(Placement(transformation(extent = {{2, -58}, {42, -18}}), iconTransformation(extent = {{-16, -16}, {16, 16}}, rotation = 0, origin = {-76, -82})));
        Physiolibrary.Types.RealIO.FrequencyOutput HR
        "heart rate - compatible with Const block"                                               annotation(Placement(transformation(extent = {{-76, 60}, {-56, 80}}), iconTransformation(extent = {{-15, -15}, {15, 15}}, rotation = 180, origin = {-81, 75})));
        Physiolibrary.Types.RealIO.HydraulicComplianceOutput evright annotation(Placement(transformation(extent = {{80, 22}, {100, 42}}), iconTransformation(extent = {{-14, -14}, {14, 14}}, rotation = 180, origin = {-76, 10})));
        Physiolibrary.Types.RealIO.HydraulicComplianceOutput evleft annotation(Placement(transformation(extent = {{78, -18}, {98, 2}}), iconTransformation(extent = {{-16, -16}, {16, 16}}, rotation = 180, origin = {-80, 42})));
        Physiolibrary.Types.HydraulicElastance evrightref;
        Physiolibrary.Types.HydraulicElastance evleftref;
        Physiolibrary.Types.RealIO.HydraulicComplianceOutput evenacava annotation(Placement(transformation(extent = {{78, -54}, {98, -34}}), iconTransformation(extent = {{-16, -16}, {16, 16}}, rotation = 180, origin = {-78, -58})));
        Physiolibrary.Types.RealIO.HydraulicConductanceOutput RS annotation(Placement(transformation(extent = {{80, -90}, {100, -70}}), iconTransformation(extent = {{-14, -14}, {14, 14}}, rotation = 180, origin = {-76, -24})));
        parameter Physiolibrary.Types.HydraulicElastance EV0right = 103991462.1837, EV0left = 106657909.932;
        parameter Physiolibrary.Types.HydraulicCompliance EV0venacava = 1.8751539396141e-006;
        parameter Physiolibrary.Types.HydraulicResistance RS0(displayUnit = "(mmHg.s)/ml") = 81793284.67910001;
        parameter Physiolibrary.Types.Time activationDelay = 15;
        //  parameter Physiolibrary.Types.HydraulicConductance Conductance=0
    protected
        Physiolibrary.Types.Frequency HR0;
      //  parameter Physiolibrary.Types.HydraulicCompliance ECV0;
      equation
        if not useHRInput then
          HR0 = HR0Param;
        end if;
        if time > activationDelay then
          deadZone.u = (PAOmedia - PAo) / 133.322387415 / 2;
        else
          deadZone.u = 0;
        end if;
        H1.u = deadZone.y;
        HR = (HR0 * 60 + H1.y) / 60;
        //recount to SI Hz
        H2.u = deadZone.y;
        evright = 1 / (EV0right + H2.y * 1000000.0 * 133.322387415);
        evrightref = 1 / evright;
        //recount to SI
        evleft = 1 / (EV0left + H2.y * 1000000.0 * 133.322387415);
        evleftref = 1 / evleft;
        //recount to SI
        H3.u = deadZone.y;
        evenacava = H3.y * 1e-006 / 133.322387415;
        H4.u = deadZone.y;
        RS = 1 / (RS0 + H4.y * 1000000.0 * 133.322387415);
        //recount to conductance
        annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Ellipse(extent = {{28, 102}, {-68, -110}}, lineColor = {0, 0, 127}, fillColor = {255, 170, 170},
                  fillPattern =                                                                                                   FillPattern.Solid), Text(extent={{
                    -66,74},{18,58}},                                                                                                    lineColor = {0, 0, 127}, fillColor = {0, 0, 255},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "HR"), Text(extent={{
                    -58,12},{22,-2}},                                                                                                    lineColor = {0, 0, 127}, fillColor = {0, 0, 255},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "EVright"), Text(extent={{
                    -62,44},{26,30}},                                                                                                    lineColor = {0, 0, 127}, fillColor = {0, 0, 255},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "EVleft"), Text(extent={{
                    -80,-60},{34,-72}},                                                                                                    lineColor = {0, 0, 127}, fillColor = {255, 170, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "ECV"), Text(extent={{
                    -62,-20},{16,-34}},                                                                                                    lineColor = {0, 0, 127}, fillColor = {255, 170, 170},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "RPS"), Text(extent={{
                    -60,-84},{-16,-94}},                                                                                                    lineColor = {0, 0, 127}, textString = "PAo"), Text(extent = {{-98, -104}, {116, -120}}, lineColor = {0, 0, 0},
                  lineThickness =                                                                                                   1, fillColor = {255, 128, 0},
                  fillPattern =                                                                                                   FillPattern.Solid, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
      end Baroreceptor;

      package BloodVolume
        extends Modelica.Icons.UtilitiesPackage;

        model KidneyPO2Estimate

          Physiolibrary.Types.RealIO.PressureOutput pressure annotation (Placement(
                transformation(extent={{82,-10},{102,10}}), iconTransformation(extent={{82,-10},
                    {102,10}})));
        parameter Real MaxPo2 = 60;
          Physiolibrary.Types.RealIO.FractionInput hematocrit annotation (
              Placement(transformation(extent={{-100,-20},{-60,20}}),
                iconTransformation(extent={{-100,-20},{-60,20}})));
          Physiolibrary.Blocks.Factors.Spline spline(data=[0,0,0; 0.5,35,1; 1,
                60,0], Yscale=101325/760)
            annotation (Placement(transformation(extent={{-14,-10},{6,10}})));
          Physiolibrary.Types.Constants.OneConst one
            annotation (Placement(transformation(extent={{-26,8},{-18,16}})));
        equation
          connect(hematocrit, spline.u) annotation (Line(
              points={{-80,0},{-12,0}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(spline.y, pressure) annotation (Line(
              points={{-4,-4},{-4,-6},{72,-6},{72,0},{92,0}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(one.y, spline.yBase) annotation (Line(
              points={{-17,12},{-4,12},{-4,2}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics), Icon(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
                  Rectangle(
                  extent={{-80,80},{82,-60}},
                  lineColor={0,0,255},
                  fillPattern=FillPattern.Solid,
                  fillColor={255,255,167}),                                   Text(
                  extent={{-184,-58},{214,-94}},
                  lineColor={0,0,255},
                  textString="%name")}));
        end KidneyPO2Estimate;

        model Erythropoetin

          Physiolibrary.Chemical.Components.Substance erythropoetin(useNormalizedVolume = false,
              solute_start(displayUnit="mol") = 0.114888)                                                                                           annotation(Placement(transformation(extent = {{-30, 6}, {2, 40}})));
          Physiolibrary.Chemical.Sources.UnlimitedSolutePump secretion(useSoluteFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {144, 62})));
          Physiolibrary.Chemical.Sensors.ConcentrationMeasure concentrationMeasure annotation(Placement(transformation(extent={{-21,-21},
                    {21,21}},
                rotation=90,
                origin={-15,81})));
          Physiolibrary.Types.RealIO.ConcentrationOutput concentration annotation(Placement(transformation(extent={{42,72},
                    {62,92}}),                                                                                                   iconTransformation(extent = {{-21, -21}, {21, 21}}, rotation = 0, origin = {121, 3})));
          Physiolibrary.Types.RealIO.PressureInput kidney_po2 annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 180, origin = {138, -2}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {-60, -80})));
          Physiolibrary.Blocks.Factors.Spline PO2Effect(data = {{0.0, 4.0, 0}, {35.0, 0.0, -0.14}, {60.0, -1.0, 0}}, Xscale = 101325 / 760) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {102, -2})));
          Physiolibrary.Blocks.Math.Power pow annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 90, origin = {98, 16})));
          Physiolibrary.Blocks.Factors.Normalization CounEffect annotation(Placement(transformation(extent={{-10,-10},
                    {10,10}},                                                                                                    rotation = 90, origin={58,46})));
          Physiolibrary.Blocks.Factors.Normalization FunctionEffect annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {78, 46})));
          Physiolibrary.Blocks.Factors.Normalization PO2Effect1 annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {98, 46})));
          Physiolibrary.Types.Constants.FractionConst Kidney_Nefron_Count_TotalxNormal(k = 1) annotation(Placement(transformation(extent={{26,16},
                    {42,26}})));
          Physiolibrary.Types.Constants.FractionConst KidneyFunctionEffect(k = 1) annotation(Placement(transformation(extent={{60,10},
                    {76,20}})));
          Physiolibrary.Types.RealIO.VolumeInput ecf_volume annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 0, origin = {-58, 70}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -80})));
          Modelica.Blocks.Math.Gain VODIST(k = 0.4) annotation(Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 0, origin = {-58, 46})));
          Physiolibrary.Types.Constants.FractionConst hormoneFlowFraction(k=1)   annotation(Placement(transformation(extent={{72,-28},
                    {88,-20}})));
          Physiolibrary.Types.Constants.MolarFlowRateConst molarFlowRate(k(displayUnit = "mol/min") = 0.011166666666667) annotation(Placement(transformation(extent = {{30, 40}, {44, 50}})));
          Physiolibrary.Chemical.Components.Clearance clearance(
              useSolutionFlowInput=true) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=0,
                origin={-2,-30})));
          Modelica.Blocks.Math.Gain K(k=0.00555/60) annotation (Placement(
                transformation(
                extent={{-6,-6},{6,6}},
                rotation=270,
                origin={-4,-8})));
        equation
          connect(secretion.q_out, erythropoetin.q_out) annotation(Line(points = {{134, 62}, {8, 62}, {8, 23}, {-14, 23}}, color = {107, 45, 134}, thickness = 1, smooth = Smooth.None));
          connect(pow.y, PO2Effect1.u) annotation(Line(points = {{98, 22.6}, {98, 38}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(CounEffect.y, FunctionEffect.yBase) annotation(Line(points = {{62, 46}, {76, 46}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(FunctionEffect.y, PO2Effect1.yBase) annotation(Line(points = {{82, 46}, {96, 46}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(Kidney_Nefron_Count_TotalxNormal.y, CounEffect.u) annotation(Line(points={{44,21},
                  {58,21},{58,38}},                                                                                             color = {0, 0, 127}, smooth = Smooth.None));
          connect(KidneyFunctionEffect.y, FunctionEffect.u) annotation(Line(points={{78,15},
                  {78,38}},                                                                                             color = {0, 0, 127}, smooth = Smooth.None));
          connect(PO2Effect.y, pow.exponent) annotation(Line(points = {{102, 2}, {102, 10}, {101.6, 10}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(kidney_po2, PO2Effect.u) annotation(Line(points = {{138, -2}, {110, -2}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(PO2Effect.yBase, hormoneFlowFraction.y) annotation(Line(points={{102,-4},
                  {102,-24},{90,-24}},                                                                                 color = {0, 0, 127}, smooth = Smooth.None));
          connect(molarFlowRate.y, CounEffect.yBase) annotation(Line(points = {{45.75, 45}, {50.875, 45}, {50.875, 46}, {56, 46}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(erythropoetin.solutionVolume, VODIST.y) annotation(Line(points = {{-20.4, 29.8}, {-20.4, 46}, {-51.4, 46}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(PO2Effect1.y, secretion.soluteFlow) annotation(Line(points = {{102, 46}, {140, 46}, {140, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(ecf_volume, VODIST.u) annotation(Line(points = {{-58, 70}, {-68, 70}, {-68, 46}, {-65.2, 46}}, color = {0, 0, 127}, smooth = Smooth.None));
          connect(concentrationMeasure.concentration, concentration) annotation (
              Line(
              points={{1.8,81},{4,81},{4,82},{52,82}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(erythropoetin.q_out, concentrationMeasure.q_in) annotation (Line(
              points={{-14,23},{-14,81},{-15,81}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(clearance.q_in, erythropoetin.q_out) annotation (Line(
              points={{-12,-30},{-34,-30},{-34,23},{-14,23}},
              color={107,45,134},
              thickness=1,
              smooth=Smooth.None));
          connect(K.y, clearance.solutionFlow) annotation (Line(
              points={{-4,-14.6},{-4,-23},{-2,-23}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(erythropoetin.solute, K.u) annotation (Line(
              points={{-4.4,6},{-4,6},{-4,-0.8}},
              color={0,0,127},
              smooth=Smooth.None));
          annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                    -100},{160,100}}),                                                                        graphics={  Text(extent = {{-180, 98}, {200, 60}}, lineColor = {0, 0, 255}, textString = "%name"), Bitmap(
                    extent={{-88,62},{102,-80}}, fileName=
                      "modelica://Cardiovascular/Resources/Icons/320px-Erythropoietin.png")}),                                                            Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                    -100},{160,100}}),                                                                                                    graphics));
        end Erythropoetin;

        model KidneyFluidBalance

          Physiolibrary.Types.RealIO.VolumeFlowRateOutput urineoutflowrate annotation(Placement(transformation(extent = {{40, -80}, {60, -60}}), iconTransformation(extent = {{40, -80}, {60, -60}})));
          Physiolibrary.Types.RealIO.VolumeInput plasmaticVolume annotation(Placement(transformation(extent = {{46, -12}, {86, 28}}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 180, origin = {47, -7})));
          parameter Physiolibrary.Types.VolumeFlowRate Kud = 0.000000046; //dehydratation
          parameter Physiolibrary.Types.VolumeFlowRate Kuo = 0.00000034; //overhydratation
          parameter Physiolibrary.Types.VolumeFlowRate Jun = 0.000000016;
          discrete Physiolibrary.Types.Volume Vpn;
        equation
          when {initial()} then
              Vpn = plasmaticVolume;
          end when;
          if plasmaticVolume < Vpn then
            urineoutflowrate = Kud * ((plasmaticVolume - Vpn) / Vpn) + Jun;
          else
            urineoutflowrate = Kuo * ((plasmaticVolume - Vpn) / Vpn) + Jun;
          end if;
          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-82, 82}, {80, -80}}, fileName = "modelica://Cardiovascular/Resources/Icons/kidney.png")}));
        end KidneyFluidBalance;

        model RedBloodCells2

          Erythropoetin erythropoetin annotation (Placement(transformation(
                extent={{-11,-10},{11,10}},
                rotation=0,
                origin={-77,-4})));
          Physiolibrary.Population.Components.Population RBC
            annotation (Placement(transformation(extent={{-18,-26},{2,-6}})));
          Physiolibrary.Population.Sources.Growth erythropoiesis(useChangeInput=
               true) annotation (Placement(transformation(extent={{-46,-30},{
                    -26,-10}})));
          Physiolibrary.Population.Sources.Growth transfusion
            annotation (Placement(transformation(extent={{-38,14},{-18,34}})));
          Physiolibrary.Population.Components.Mortality degradation(LifeTime(
                displayUnit="d") = 10368000)
            annotation (Placement(transformation(extent={{6,-30},{26,-10}})));
          Physiolibrary.Population.Sources.Loss hemorrhage
            annotation (Placement(transformation(extent={{6,16},{26,36}})));
        Physiolibrary.Types.Constants.PopulationChangeConst RBCBaseSecretionRate(
            k=1.16e6) "13.7 ml/day (12e12 cells == 2.4 L)"
          annotation (Placement(transformation(extent={{-54,4},{-38,16}})));
          Physiolibrary.Blocks.Factors.SplineLag      EPOEffect(
            HalfTime=3*86400*Modelica.Math.log(2),
            data={{0.0,0.0,0},{1.3,1.0,1.0},{4.0,4.0,0}},
            stateName="[EPO]Delay.Effect",
          UsePositiveLog10=true,
          Xscale=1e3) "20 miu/ml = 20e3 iu/m3"
            annotation (Placement(transformation(extent={{-46,-14},{-26,6}})));
          Physiolibrary.Types.BusConnector busConnector
            annotation (Placement(transformation(extent={{-118,10},{-78,50}})));
          Modelica.Blocks.Math.Gain RBCVol(k=2.4e-3/12e12)
          "12e12 cells == 2.4 L"
          annotation (Placement(transformation(
              extent={{5,-5},{-5,5}},
              rotation=0,
              origin={-35,-41})));
          Modelica.Blocks.Math.Gain InitialPopulation(k=12e12/2.4e-3)
          "12e12 cells == 2.4 L"   annotation (Placement(transformation(
                extent={{5,-5},{-5,5}},
                rotation=90,
                origin={-7,7})));
        initial algorithm

        equation
          connect(erythropoiesis.port_b, RBC.port) annotation (Line(
              points={{-26,-20},{-16,-20},{-16,-16},{-8,-16}},
              color={0,127,127},
              thickness=1,
              smooth=Smooth.None));
          connect(transfusion.port_b, RBC.port) annotation (Line(
              points={{-18,24},{-18,-16},{-8,-16}},
              color={0,127,127},
              thickness=1,
              smooth=Smooth.None));
          connect(degradation.port_a, RBC.port) annotation (Line(
              points={{6.2,-20},{4,-20},{4,-16},{-8,-16}},
              color={0,127,127},
              thickness=1,
              smooth=Smooth.None));
          connect(hemorrhage.port_a, RBC.port) annotation (Line(
              points={{6,26},{4,26},{4,-16},{-8,-16}},
              color={0,127,127},
              thickness=1,
              smooth=Smooth.None));
          connect(erythropoiesis.populationChange, EPOEffect.y) annotation (
              Line(
              points={{-36,-16},{-36,-8}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(RBCBaseSecretionRate.y, EPOEffect.yBase) annotation (Line(
              points={{-36,10},{-36,-2}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(EPOEffect.u, erythropoetin.concentration) annotation (Line(
              points={{-44,-4},{-64,-4},{-64,-3.7},{-69.3,-3.7}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(erythropoetin.kidney_po2, busConnector.Kidney_PO2)
            annotation (Line(
              points={{-84.6154,-12},{-96,-12},{-96,-20},{-98,-20},{-98,30}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{-9,-3},{-9,-3}}));
          connect(erythropoetin.ecf_volume, busConnector.ecfvolume) annotation (
             Line(
              points={{-79.5385,-12},{-79.5385,-24},{-98,-24},{-98,30}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{2,-6},{2,-6}}));
          connect(RBC.population, RBCVol.u) annotation (Line(
              points={{-2,-26},{-2,-41},{-29,-41}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(RBCVol.y, busConnector.RBCVolume) annotation (Line(
              points={{-40.5,-41},{-98,-41},{-98,30}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(InitialPopulation.u, busConnector.initialrbcvolume)
            annotation (Line(
              points={{-7,13},{-7,30},{-98,30}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-120,
                    -100},{100,100}}),                                                                        graphics={  Bitmap(extent = {{-78, 102}, {80, -56}}, fileName = "modelica://Cardiovascular/Resources/Icons/redbloodcells3.png"), Text(extent={{
                      -162,-36},{66,-66}},                                                                                                    lineColor = {0, 0, 255}, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-120,
                    -100},{100,100}}),                                                                                                    graphics));
        end RedBloodCells2;

        model Plasma2

          Physiolibrary.Osmotic.Sources.SolventInflux transfusion(useSolutionFlowInput = false) annotation(Placement(transformation(extent={{-58,-38},
                    {-38,-18}})));
          Physiolibrary.Osmotic.Sources.SolventOutflux hemorrhage(useSolutionFlowInput = false) annotation(Placement(transformation(extent={{-10,-10},
                    {10,10}},                                                                                                    rotation = 180, origin={-48,-54})));
          Physiolibrary.Osmotic.Sources.SolventInflux IVDrip(useSolutionFlowInput = false) annotation(Placement(transformation(extent={{-58,-50},
                    {-38,-30}})));
          Physiolibrary.Osmotic.Sources.SolventInflux FoodAndDrink(useSolutionFlowInput = false, SolutionFlow(displayUnit = "ml/day") = 2.4101851851852e-08) annotation(Placement(transformation(extent={{-10,-10},
                    {10,10}},                                                                                                    rotation=0,     origin={-48,0})));
          Physiolibrary.Osmotic.Sources.SolventInflux Metabolism(useSolutionFlowInput = false, SolutionFlow(displayUnit = "ml/day") = 3.4722222222222e-09) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation=0,     origin={-48,-12})));
          Physiolibrary.Osmotic.Sources.SolventOutflux SkinAndLungsLoss(useSolutionFlowInput = false, SolutionFlow(displayUnit = "ml/day") = 1.0416666666667e-08) annotation(Placement(transformation(extent={{-11,-11},
                    {11,11}},                                                                                                    rotation = 0, origin={3,-3})));
          Physiolibrary.Osmotic.Sources.SolventOutflux Urine(SolutionFlow(displayUnit = "ml/day") = 1.7361111111111e-08, useSolutionFlowInput = true) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={-2,-30})));
          Physiolibrary.Osmotic.Sources.SolventOutflux Feces(useSolutionFlowInput = false, SolutionFlow(displayUnit = "ml/day") = 1.1574074074074e-09) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={2,-14})));
          Physiolibrary.Osmotic.Components.Membrane capillaryMembrane(
            cond=3.7503078792283e-11,
            HydraulicPressureIn=2359.8062572455,
            HydraulicPressureOut=-549.2882361498)                                                                                                     annotation(Placement(transformation(extent = {{0, -68}, {20, -48}})));
          Physiolibrary.Osmotic.Components.OsmoticCell interstitialFluid(
            NumberOfMembraneTypes=2,
            volume_start=0.01175,
            ImpermeableSolutes={0.005,3})                                                                                     annotation(Placement(transformation(extent = {{26, -68}, {46, -48}})));
          Modelica.Blocks.Math.Add add1          annotation(Placement(transformation(extent={{46,-76},
                    {56,-66}})));
          KidneyFluidBalance kidneyFluidBalance
            annotation (Placement(transformation(extent={{8,-30},{66,22}})));
          Physiolibrary.Osmotic.Components.SolventFlux lymphatic(SolutionFlow=
                3.45e-08)                                                                            annotation(Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 180, origin={11,-39})));
          Physiolibrary.Types.BusConnector busConnector
            annotation (Placement(transformation(extent={{54,-18},{94,22}})));
          Physiolibrary.Osmotic.Components.OsmoticCell
                                                plasma(Simulation=Physiolibrary.Types.SimulationType.NoInit,
            NumberOfMembraneTypes=2,
            ImpermeableSolutes={0.004,0.82})
            annotation (Placement(transformation(extent={{-26,-68},{-6,-48}})));
        equation
          connect(capillaryMembrane.q_out, interstitialFluid.q_in[1]) annotation(Line(points={{20,-58},
                  {28,-58},{28,-58.5},{36,-58.5}},                                                                     color = {127, 127, 0}, thickness = 1, smooth = Smooth.None));
          connect(interstitialFluid.volume, add1.u1) annotation(Line(points={{42,-68},
                  {45,-68}},                                                                                     color = {0, 0, 127}, smooth = Smooth.None));
          connect(interstitialFluid.q_in[1], lymphatic.q_in) annotation(Line(points={{36,
                  -58.5},{36,-38},{34,-38},{34,-39},{18,-39}},                                                           color = {127, 127, 0}, thickness = 1, smooth = Smooth.None));
          connect(kidneyFluidBalance.urineoutflowrate, Urine.solutionFlow)
            annotation (Line(
              points={{51.5,-22.2},{51.5,-23},{-2,-23}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(plasma.q_in[1], capillaryMembrane.q_in) annotation (Line(
              points={{-16,-58.5},{-8,-58.5},{-8,-58},{0,-58}},
              color={127,127,0},
              thickness=1,
              smooth=Smooth.None));
          connect(plasma.q_in[1], transfusion.q_out) annotation (Line(
              points={{-16,-58.5},{-16,-28},{-42,-28}},
              color={127,127,0},
              thickness=1,
              smooth=Smooth.None));
          connect(lymphatic.q_out, transfusion.q_out) annotation (Line(
              points={{4,-39},{-16,-39},{-16,-28},{-42,-28}},
              color={127,127,0},
              thickness=1,
              smooth=Smooth.None));
          connect(IVDrip.q_out, transfusion.q_out) annotation (Line(
              points={{-42,-40},{-30,-40},{-30,-38},{-16,-38},{-16,-28},{-42,
                  -28}},
              color={127,127,0},
              thickness=1,
              smooth=Smooth.None));
          connect(hemorrhage.q_in, transfusion.q_out) annotation (Line(
              points={{-42,-54},{-16,-54},{-16,-28},{-42,-28}},
              color={127,127,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Metabolism.q_out, transfusion.q_out) annotation (Line(
              points={{-42,-12},{-16,-12},{-16,-28},{-42,-28}},
              color={127,127,0},
              thickness=1,
              smooth=Smooth.None));
          connect(FoodAndDrink.q_out, transfusion.q_out) annotation (Line(
              points={{-42,0},{-16,0},{-16,-28},{-42,-28}},
              color={127,127,0},
              thickness=1,
              smooth=Smooth.None));
          connect(SkinAndLungsLoss.q_in, transfusion.q_out) annotation (Line(
              points={{-3.6,-3},{-16,-3},{-16,-28},{-42,-28}},
              color={127,127,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Feces.q_in, transfusion.q_out) annotation (Line(
              points={{-4,-14},{-16,-14},{-16,-28},{-42,-28}},
              color={127,127,0},
              thickness=1,
              smooth=Smooth.None));
          connect(Urine.q_in, transfusion.q_out) annotation (Line(
              points={{-8,-30},{-16,-30},{-16,-28},{-42,-28}},
              color={127,127,0},
              thickness=1,
              smooth=Smooth.None));
          connect(kidneyFluidBalance.plasmaticVolume, busConnector.plasmaVolume)
            annotation (Line(
              points={{50.63,-5.82},{62.315,-5.82},{62.315,2},{74,2}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(plasma.volume, busConnector.plasmaVolume) annotation (Line(
              points={{-10,-68},{-10,-78},{74,-78},{74,2}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(add1.u2, plasma.volume) annotation (Line(
              points={{45,-74},{-10,-74},{-10,-68}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(add1.y, busConnector.ecfvolume) annotation (Line(
              points={{56.5,-71},{56.5,-70},{56,-70},{60,-70},{74,-70},{74,2}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));

          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-72, 72}, {80, -78}}, fileName = "modelica://Cardiovascular/Resources/Icons/plazma.png"), Text(extent = {{-100, -62}, {96, -98}}, lineColor = {0, 0, 255}, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                    -100},{100,100}}),                                                                                                    graphics));
        end Plasma2;

        model VolumeRefill2
        "injects/removes volume if the pressure on connector is > 0"

          Test.Control1.VolumeControl.DesiredFlowrate desiredFlowrate(flowtime(
                displayUnit="s") = 1)
            annotation (Placement(transformation(extent={{-4,6},{16,26}})));
          Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b port_b annotation(Placement(transformation(extent={{56,-26},
                    {76,-6}}),                                                                                                    iconTransformation(extent = {{82, -100}, {102, -80}})));
          Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeRefill(useSolutionFlowInput = true) annotation(Placement(transformation(extent={{-14,-26},
                    {6,-6}})));
          Modelica.Blocks.Logical.Switch switch1
            annotation (Placement(transformation(extent={{14,-4},{0,10}})));
          Physiolibrary.Types.Constants.VolumeFlowRateConst zeroRefill(k(
                displayUnit="l/min") = 0) annotation (Placement(
                transformation(
                extent={{-8,-6},{8,6}},
                rotation=180,
                origin={38,-4})));
          Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure
            annotation (Placement(transformation(extent={{70,10},{50,30}})));
          Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=
               0)
            annotation (Placement(transformation(extent={{46,8},{30,24}})));
          Physiolibrary.Hydraulic.Components.Conductor conductor(Conductance(
                displayUnit="ml/(mmHg.s)") = 7.5006157584566e-08) annotation (
             Placement(transformation(extent={{28,-26},{48,-6}})));
          Physiolibrary.Types.BusConnector busConnector
            annotation (Placement(transformation(extent={{-32,18},{8,58}})));
        equation
        /*  if desiredFlowrate.volumeflowrate < 0 then
    volumeRefill.solutionFlow = -max(0, min(-desiredFlowrate.volumeflowrate, -maxflowrate));
  else
    volumeRefill.solutionFlow = desiredFlowrate.volumeflowrate;
  end if;*/
          connect(switch1.y, volumeRefill.solutionFlow) annotation (Line(
              points={{-0.7,3},{-4,3},{-4,-9}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(desiredFlowrate.volumeflowrate, switch1.u1) annotation (Line(
              points={{15.9,18.5},{15.4,18.5},{15.4,8.6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(zeroRefill.y, switch1.u3) annotation (Line(
              points={{28,-4},{28,-2.6},{15.4,-2.6}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(pressureMeasure.pressure, greaterThreshold.u) annotation (Line(
              points={{54,16},{47.6,16}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(greaterThreshold.y, switch1.u2) annotation (Line(
              points={{29.2,16},{26,16},{26,3},{15.4,3}},
              color={255,0,255},
              smooth=Smooth.None));
          connect(port_b, conductor.q_out) annotation (Line(
              points={{66,-16},{48,-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(volumeRefill.q_out, conductor.q_in) annotation (Line(
              points={{6,-16},{28,-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          connect(desiredFlowrate.volume, busConnector.bloodVolume) annotation (
             Line(
              points={{7.4,23.2},{7.4,38},{-12,38}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{3,6},{3,6}}));
          connect(desiredFlowrate.desiredVolume, busConnector.desiredBloodVolume)
            annotation (Line(
              points={{-0.8,23.2},{-0.8,38},{-12,38}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{1,3},{1,3}}));
          connect(pressureMeasure.q_in, conductor.q_out) annotation (Line(
              points={{64,14},{64,0},{48,0},{48,-16}},
              color={0,0,0},
              thickness=1,
              smooth=Smooth.None));
          annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                    -100},{100,100}}),                                                                        graphics={  Rectangle(extent = {{-28, 36}, {34, -30}}, lineColor = {0, 0, 0},
                    lineThickness =                                                                                                   1,
                    fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {190, 0, 0}, radius = 4), Rectangle(extent = {{-24, -28}, {-20, -62}}, lineColor = {0, 0, 0},
                    lineThickness =                                                                                                   1,
                    fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {190, 0, 0}), Rectangle(extent = {{30, -26}, {34, -62}}, lineColor = {0, 0, 0},
                    lineThickness =                                                                                                   1,
                    fillPattern =                                                                                                   FillPattern.Sphere, fillColor = {190, 0, 0}), Polygon(points = {{6, -30}, {6, -38}, {8, -40}, {12, -46}, {10, -48}, {12, -52}, {14, -54}, {16, -56}, {14, -58}, {12, -62}, {14, -64}, {18, -66}, {20, -68}, {22, -74}, {24, -76}, {28, -80}, {34, -82}, {40, -86}, {48, -90}, {54, -92}, {60, -94}, {64, -94}, {80, -96}, {88, -96}, {88, -96}, {86, -94}, {80, -92}, {74, -92}, {64, -90}, {62, -90}, {56, -86}, {46, -84}, {40, -80}, {36, -78}, {30, -76}, {26, -70}, {24, -68}, {22, -64}, {18, -60}, {22, -54}, {16, -50}, {16, -46}, {18, -44}, {12, -38}, {10, -34}, {10, -30}, {6, -30}}, lineColor = {127, 0, 0},
                    lineThickness =                                                                                                   1,
                    fillPattern =                                                                                                   FillPattern.Sphere, smooth = Smooth.None, fillColor = {190, 0, 0}), Rectangle(extent = {{-28, 62}, {34, 56}}, lineColor = {0, 0, 0},
                    fillPattern =                                                                                                   FillPattern.Solid, fillColor = {170, 255, 255}), Rectangle(extent = {{-28, 56}, {34, 32}}, lineColor = {0, 0, 0}, fillColor = {170, 255, 255},
                    fillPattern =                                                                                                   FillPattern.Sphere, radius = 2,
                    lineThickness =                                                                                                   1),
                Text(
                  extent={{-100,100},{100,62}},
                  lineColor={0,0,255},
                  textString="%name")}),                                                                                                    Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                    -100},{100,100}}),                                                                                                    graphics={Text(
                  extent={{10,38},{64,28}},
                  lineColor={0,0,255},
                  textString="Allow change only
if the pressure is 
above 0 mmHg.")}));
        end VolumeRefill2;

        model BloodProperties

          Modelica.Blocks.Math.Add DesiredBloodVolume
            annotation (Placement(transformation(extent={{8,-32},{28,-12}})));
          KidneyPO2Estimate kidneyPO2Estimate
            annotation (Placement(transformation(extent={{8,-98},{28,-78}})));
          Physiolibrary.Types.BusConnector busConnector
            annotation (Placement(transformation(extent={{-20,-8},{20,32}})));
          Modelica.Blocks.Math.Division hematocrit
            annotation (Placement(transformation(extent={{8,-64},{28,-44}})));
          Modelica.Blocks.Math.Add3 BloodVolume
            annotation (Placement(transformation(extent={{12,34},{26,48}})));
          Physiolibrary.Types.Constants.FractionConst initialHematocrit(k=0.4)
            annotation (Placement(transformation(extent={{-2,68},{6,76}})));
          Modelica.Blocks.Math.Product InitialRBCVolume
            annotation (Placement(transformation(extent={{14,64},{24,74}})));
          Modelica.Blocks.Math.Add InitialPlasmaVolume(k2=-1)
            annotation (Placement(transformation(extent={{16,82},{26,92}})));
        equation
          connect(DesiredBloodVolume.u2, busConnector.RBCVolume) annotation (Line(
              points={{6,-28},{0,-28},{0,12}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(DesiredBloodVolume.u1, busConnector.plasmaVolume) annotation (Line(
              points={{6,-16},{0,-16},{0,12}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(DesiredBloodVolume.y, busConnector.desiredBloodVolume) annotation (
              Line(
              points={{29,-22},{34,-22},{34,12},{0,12}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(hematocrit.u2, DesiredBloodVolume.y) annotation (Line(
              points={{6,-60},{0,-60},{0,-38},{32,-38},{32,-22},{29,-22}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(hematocrit.u1, DesiredBloodVolume.u2) annotation (Line(
              points={{6,-48},{6,-28}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(hematocrit.y, busConnector.hematocrit) annotation (Line(
              points={{29,-54},{34,-54},{34,12},{0,12}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(hematocrit.y, kidneyPO2Estimate.hematocrit) annotation (Line(
              points={{29,-54},{32,-54},{32,-76},{0,-76},{0,-88},{10,-88}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(kidneyPO2Estimate.pressure, busConnector.Kidney_PO2) annotation (Line(
              points={{27.2,-88},{34,-88},{34,12},{0,12}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(BloodVolume.u3, busConnector.pulmonaryBloodVolume) annotation (Line(
              points={{10.6,35.4},{0,35.4},{0,12}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(BloodVolume.u2, busConnector.systemicBloodVolume) annotation (Line(
              points={{10.6,41},{0,41},{0,12}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(BloodVolume.u1, busConnector.heartBloodVolume) annotation (Line(
              points={{10.6,46.6},{0,46.6},{0,12}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(BloodVolume.y, busConnector.bloodVolume) annotation (Line(
              points={{26.7,41},{34,41},{34,12},{0,12}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{8,0},{8,0}}));
          connect(initialHematocrit.y, InitialRBCVolume.u1) annotation (Line(
              points={{7,72},{13,72}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(BloodVolume.y, InitialRBCVolume.u2) annotation (Line(
              points={{26.7,41},{26.7,62},{13,62},{13,66}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(InitialRBCVolume.y, busConnector.initialrbcvolume)
            annotation (Line(
              points={{24.5,69},{34,69},{34,12},{0,12}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          connect(InitialRBCVolume.y, InitialPlasmaVolume.u2) annotation (Line(
              points={{24.5,69},{24.5,78},{15,78},{15,84}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(BloodVolume.y, InitialPlasmaVolume.u1) annotation (Line(
              points={{26.7,41},{26.7,60},{-8,60},{-8,90},{15,90}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(InitialPlasmaVolume.y, busConnector.initialPlasmaVolume)
            annotation (Line(
              points={{26.5,87},{34,87},{34,12},{0,12}},
              color={0,0,127},
              smooth=Smooth.None), Text(
              string="%second",
              index=1,
              extent={{6,3},{6,3}}));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                    -100},{100,100}}), graphics), Icon(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
                  Rectangle(
                  extent={{-40,40},{40,-20}},
                  lineColor={0,0,255},
                  fillPattern=FillPattern.Solid,
                  fillColor={255,127,127}), Text(
                  extent={{-100,-20},{100,-60}},
                  lineColor={0,0,255},
                  fillColor={255,170,170},
                  fillPattern=FillPattern.Solid,
                  textString="%name")}));
        end BloodProperties;
      end BloodVolume;

      model BloodVolumeControl2
        extends Cardiovascular.ControlInterfaces.BloodVolumeControl;
      /*  Physiolibrary.Types.BusConnector busConnector annotation (Placement(
        transformation(extent={{-40,2},{0,42}}), iconTransformation(
          extent={{-38,4},{2,44}})));*/
        BloodVolume.Plasma2 plasma(plasma(Simulation=Physiolibrary.Types.SimulationType.NoInit))
          annotation (Placement(transformation(extent={{-28,26},{4,58}})));
                                   //(plasma(volume_start=bloodProperties.BloodVolume.y))
        BloodVolume.RedBloodCells2 redBloodCells(RBC(population_start=2, Simulation=
                Physiolibrary.Types.SimulationType.NoInit))
          annotation (Placement(transformation(extent={{-20,-18},{14,14}})));
        BloodVolume.BloodProperties bloodProperties annotation (Placement(
              transformation(rotation=0, extent={{-18,-40},{10,-12}})));
      initial algorithm
        plasma.plasma.state:=bloodProperties.InitialPlasmaVolume.y;
        redBloodCells.RBC.state:=redBloodCells.InitialPopulation.y;
      equation

        connect(plasma.busConnector, busConnector) annotation (Line(
            points={{-0.16,42.32},{20,42.32},{20,12}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(redBloodCells.busConnector, busConnector) annotation (Line(
            points={{-16.6,2.8},{-16.6,12},{20,12}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        connect(bloodProperties.busConnector, busConnector) annotation (Line(
            points={{-4,-24.32},{-4,-22},{20,-22},{20,12}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None), Text(
            string="%second",
            index=1,
            extent={{6,3},{6,3}}));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-100,-100},{100,100}}), graphics={Text(
                extent={{-22,-38},{78,-58}},
                lineColor={0,0,255},
                horizontalAlignment=TextAlignment.Left,
                fontSize=12,
                textString="initial algorithm 
  plasma.plasma.state:=bloodProperties.InitialPlasmaVolume.y;
  redBloodCells.RBC.state:=redBloodCells.InitialPopulation.y;")}),
                                                            Icon(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics));
      end BloodVolumeControl2;
    end Control;
  end Model;
  extends Modelica.Icons.Package;

  package Hydraulic
    extends Modelica.Icons.Package;

    package Components
      extends Modelica.Icons.Package;

      model BloodFlowMeasurement
      "measures flow, diastolic, systolic and mean pressure"
        extends Physiolibrary.Hydraulic.Sensors.FlowMeasure;
        import Physiolibrary.Types.RealIO.*;
        import Physiolibrary.Types.*;
        PressureOutput Ps "Systolic pressure during heart cycle" annotation(Placement(transformation(extent = {{-72, -42}, {-52, -22}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-82, -102})));
        PressureOutput Pd "Diastolic pressure during heart cycle" annotation(Placement(transformation(extent = {{-50, -40}, {-30, -20}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-62, -102})));
        PressureOutput Pmean "Mean pressure during heart cycle" annotation(Placement(transformation(extent = {{-10, -36}, {10, -16}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-42, -102})));
        Physiolibrary.Types.RealIO.VolumeOutput SV "systolic volume" annotation(Placement(transformation(extent = {{22, -42}, {42, -22}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {32, -100})));
        Physiolibrary.Types.RealIO.VolumeFlowRateOutput CO "Cardiac output" annotation(Placement(transformation(extent = {{50, -40}, {70, -20}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {52, -100})));
        Physiolibrary.Types.Volume Volume(start = 0)
        "sum of volume through cyrdiac cycle";
        Real SumPressure(start = 0) "sum of pressure of cardiac cycle";
        Pressure Pmin(start = 133000);
        Pressure Pmax(start = 0);
        discrete Time T0(start = 0) "start of cardiac cycle ";
        discrete Time HP "length of cardiac cycle";
        Boolean b;
        Physiolibrary.Types.RealIO.FrequencyInput HR annotation(Placement(transformation(extent = {{-14, 58}, {26, 98}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-60, 100})));
      initial algorithm
        Ps := q_in.pressure;
        Pd := q_in.pressure;
        Pmean := q_in.pressure;
        HP := 1 / HR;
      equation
        Pmax = max(Pmax, q_in.pressure);
        Pmin = min(Pmin, q_in.pressure);
        b = time - pre(T0) >= pre(HP) "b=true when new cardiac cycle begins";
        when {b} then
          T0 = time "initial time of current cardiac cycle";
          HP = 1 / HR;
          Ps = Pmax "systolic pressure = maximum pressure during cardiac cycle";
          Pd = Pmin "diastolic pressure=minimal pressure during cardiac cycle";
          Pmean = if pre(HP) > 0 then SumPressure / pre(HP) else pre(Pd) * 2 / 3 + pre(Ps) * 1 / 3
          "mean pressure";
          SV = Volume
          "systolic volume is equal of total volume passed through this block";
          CO = SV / HP
          "cardiac output calculation from systolic volume and heart period";
          reinit(Volume, 0) "reinitialisation of volume";
          reinit(SumPressure, 0) "reinitialisation of sum pressure";
          reinit(Pmax, q_in.pressure) "reinitialisation of maximal pressure";
          reinit(Pmin, q_in.pressure) "reinitialisation minimal pressure";
        end when;
        der(Volume) = q_in.q;
        der(SumPressure) = q_in.pressure;
        annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent=  {{-52, 11}, {52, -11}}, lineColor=  {0, 0, 0}, fillColor=  {85, 170, 255},
                  fillPattern=                                                                                                    FillPattern.Solid, origin=  {-83, -76}, rotation=  90, textStyle=  {TextStyle.Bold}, textString=  "Ps"), Text(extent=  {{-53, 10}, {53, -10}}, lineColor=  {0, 0, 0}, fillColor=  {85, 170, 255},
                  fillPattern=                                                                                                    FillPattern.Solid, origin=  {-62, -75}, rotation=  90, textString=  "Pd"), Text(extent=  {{-55, 12}, {55, -12}}, lineColor=  {0, 0, 0}, fillColor=  {85, 170, 255},
                  fillPattern=                                                                                                    FillPattern.Solid, origin=  {-40, -55}, rotation=  90, textString=  "Pmean"), Text(extent=  {{-84, 78}, {-34, 62}}, lineColor=  {0, 0, 0}, pattern=  LinePattern.Dash,
                  lineThickness=                                                                                                    1, textString=  "HR"), Text(extent=  {{-55, 12}, {55, -12}}, lineColor=  {0, 0, 0}, fillColor=  {85, 170, 255},
                  fillPattern=                                                                                                    FillPattern.Solid, origin=  {54, -73}, rotation=  90, textString=  "CO"), Text(extent=  {{-55, 12}, {55, -12}}, lineColor=  {0, 0, 0}, fillColor=  {85, 170, 255},
                  fillPattern=                                                                                                    FillPattern.Solid, origin=  {32, -73}, rotation=  90, textString=  "SV")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
      end BloodFlowMeasurement;

      model Resistor
        extends Physiolibrary.Hydraulic.Components.Conductor(final Conductance = 1/Resistance);
        parameter Physiolibrary.Types.HydraulicResistance Resistance(displayUnit="(mmHg.s)/ml")
        "Hydraulic conductance if useConductanceInput=false";
      end Resistor;

      model MeanAortaPressureMeasurement
        extends Physiolibrary.Hydraulic.Sensors.PressureMeasure;
        import Physiolibrary.Types.RealIO.*;
        import Physiolibrary.Types.*;
        discrete PressureOutput Pmean(start=11300)
        "Mean pressure during heart cycle"                                            annotation(Placement(transformation(extent = {{-10, -36}, {10, -16}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation=0,     origin={70,30})));
        Real SumPressure(start = 6300) "sum of pressure of cardiac cycle";
        discrete Boolean b(start = false) "beat signal";
        Time T0(start = 0) "start of cardiac cycle ";
        discrete Time HP(start = 0.75) "length of cardiac cycle";
      //protected
      equation
        b = der(q_in.pressure) > 0;
        der(SumPressure) = q_in.pressure;
       when {edge(b)} then
          T0 =   time "initial time of current cardiac cycle";
          HP =   if pre(T0) > 0 then time - pre(T0) else 0.75;
          Pmean =  SumPressure / HP "mean pressure";
          reinit(SumPressure,  0) "reinitialisation of sum pressure";
                   //if (Pmean2>Pd) then Pmean1 else Pmean2;
       end when;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
                         graphics={                                                                                                    Text(extent=  {{-55, 12}, {55, -12}}, lineColor=  {0, 0, 0}, fillColor=  {85, 170, 255},
                  fillPattern=                                                                                                    FillPattern.Solid, origin={26,
                    33},                                                                                                    rotation=
                    180,                                                                                                    textString=  "Pmean")}));
      end MeanAortaPressureMeasurement;

      model ElasticVesselComplianceAdd2
      "Elastic container for blood vessels, bladder, lumens"
       extends Physiolibrary.Icons.ElasticBalloon;
       extends Physiolibrary.SteadyStates.Interfaces.SteadyState(state_start=
              volume_start, storeUnit="ml");
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in
          annotation (Placement(transformation(extent={{-14,-14},{14,14}})));
        parameter Physiolibrary.Types.Volume volume_start=1e-11
        "Volume start value"   annotation (Dialog(group="Initialization"));            //default = 1e-5 ml
        Physiolibrary.Types.Volume excessVolume
        "Additional volume, that generate pressure";

         parameter Boolean useV0Input = false
        "=true, if zero-pressure-volume input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));

         parameter Physiolibrary.Types.Volume ZeroPressureVolume=1e-11
        "Maximal volume, that does not generate pressure if useV0Input=false"
          annotation (Dialog(enable=not useV0Input)); //default = 1e-5 ml

          parameter Physiolibrary.Types.Volume CollapsingPressureVolume=1e-12
        "Maximal volume, which generate negative collapsing pressure";   //default = 1e-6 ml

         Physiolibrary.Types.RealIO.VolumeInput zeroPressureVolume(start=
              ZeroPressureVolume)=zpv if useV0Input annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,80})));
        parameter Boolean useComplianceInput = false
        "=true, if compliance input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Physiolibrary.Types.HydraulicCompliance Compliance=1
        "Compliance if useComplianceInput=false";

        Physiolibrary.Types.RealIO.HydraulicComplianceInput compliance(start=0)=
          c - Compliance if useComplianceInput annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,80})));
        parameter Boolean useExternalPressureInput = false
        "=true, if external pressure input is used"
          annotation(Evaluate=true, HideResult=true, choices(checkBox=true),Dialog(group="External inputs/outputs"));
        parameter Physiolibrary.Types.Pressure ExternalPressure=0
        "External pressure. Set zero if internal pressure is relative to external. Valid only if useExternalPressureInput=false."
          annotation (Dialog(enable=not useExternalPressureInput));
        parameter Physiolibrary.Types.Pressure MinimalCollapsingPressure=-101325;
        Physiolibrary.Types.RealIO.PressureInput externalPressure(start=
              ExternalPressure)=ep if useExternalPressureInput annotation (
            Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={80,80})));

        Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-100}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={60,-100})));

    protected
        Physiolibrary.Types.Volume zpv;
        Physiolibrary.Types.HydraulicCompliance c;
        Physiolibrary.Types.Pressure ep;
        parameter Physiolibrary.Types.Pressure a=MinimalCollapsingPressure/log(
            Modelica.Constants.eps);

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
        q_in.pressure =
        smooth(0,
          if noEvent(volume>CollapsingPressureVolume) then
            (excessVolume/c + ep)
          else
            (a*log(max(Modelica.Constants.eps,volume/CollapsingPressureVolume)) + ep));
        //then: normal physiological state
        //else: abnormal collapsing state

        //Collapsing state: the max function prevents the zero or negative input to logarithm, the logarithm brings more negative pressure for smaller volume
        //However this collapsing is limited with numerical precission, which is reached relatively soon.

        state = volume; // der(volume) =  q_in.q;
        change = q_in.q;
       // assert(volume>=-Modelica.Constants.eps,"Collapsing of vessels are not supported!");
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={Text(
                extent={{-318,-140},{160,-100}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2014 - </i>Marek Matejak, Charles University, Prague, Czech Republic</p>
<ul>
<li>initial implementation </li>
</ul>
<p>4.5.2015 - Tom&aacute;&scaron; Kulh&aacute;nek, Charles University, Prague, Czech Republic</p>
<ul>
<li>fix of external pressure</li>
</ul>
</html>",   info="<html>
<p>Pressure can be generated by an elastic tissue surrounding some accumulated volume. Typically there is a threshold volume, below which the relative pressure is equal to external pressure and the wall of the blood vessels is not stressed. But if the volume rises above this value, the pressure increases proportionally. The slope in this pressure-volume characteristic is called &ldquo;Compliance&rdquo;.</p>
<ul>
<li>Increassing volume above ZeroPressureVolume (V0) generate positive pressure (greater than external pressure) lineary dependent on excess volume.</li>
<li>Decreasing volume below CollapsingPressureVolume (V00) generate negative pressure (lower than external pressure) logarithmicaly dependent on volume.</li>
<li>Otherwise external pressure is presented as pressure inside ElasticVessel.</li>
</ul>
<p><br><img src=\"modelica://Physiolibrary/Resources/Images/UserGuide/ElasticVessel_PV.png\"/></p>
</html>"));
      end ElasticVesselComplianceAdd2;
    end Components;
  end Hydraulic;

  package Types
    extends Modelica.Icons.Package;

    package Constants
      extends Modelica.Icons.Package;

      block FrequencyControl "External signal of type Frequency"
        Physiolibrary.Types.RealIO.FrequencyOutput y
        "HydraulicCompliance constant"                                              annotation(Placement(transformation(extent = {{40, -10}, {60, 10}}), iconTransformation(extent = {{40, -10}, {60, 10}})));
        Physiolibrary.Types.RealIO.FrequencyInput c annotation(Placement(transformation(extent = {{-40, -20}, {0, 20}}), iconTransformation(extent = {{-40, -20}, {0, 20}})));
        parameter Physiolibrary.Types.Frequency k;
        //ignored for this component
        //TODO add switch between constant default signal and input control signal
      equation
        y = c;
        annotation(defaultComponentName = "hydraulicCompliance", Diagram(coordinateSystem(extent = {{-40, -40}, {40, 40}})), Icon(coordinateSystem(extent = {{-40, -40}, {40, 40}}, preserveAspectRatio = false), graphics={  Rectangle(extent=  {{-40, 40}, {40, -40}}, lineColor=  {0, 0, 0}, radius=  10, fillColor=  {236, 236, 236},
                  fillPattern=                                                                                                    FillPattern.Solid), Text(extent=  {{-100, -44}, {100, -64}}, lineColor=  {0, 0, 0}, fillColor=  {236, 236, 236},
                  fillPattern=                                                                                                    FillPattern.Solid, textString=  "%name")}));
      end FrequencyControl;
    end Constants;
  end Types;

  package Test
    extends Modelica.Icons.Package;

    package Control1

      package VolumeControl

        model DesiredFlowrate "control total blood volume"
          parameter Physiolibrary.Types.Time flowtime = 0.1;
          parameter Boolean enabled = true;
          Physiolibrary.Types.RealIO.VolumeInput volume annotation(Placement(transformation(extent = {{16, 60}, {56, 100}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {14, 72})));
          Physiolibrary.Types.RealIO.VolumeInput desiredVolume annotation(Placement(transformation(extent = {{-72, 56}, {-32, 96}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-68, 72})));
          Physiolibrary.Types.RealIO.VolumeFlowRateOutput volumeflowrate annotation(Placement(transformation(extent = {{88, 18}, {108, 38}}), iconTransformation(extent = {{82, 8}, {116, 42}})));
        equation
          volumeflowrate = if enabled then (desiredVolume - volume) / flowtime else 0;
          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent=  {{-98, 56}, {98, -8}}, lineColor=  {0, 0, 255},
                    fillPattern=                                                                                                    FillPattern.Solid, fillColor=  {170, 213, 255}), Ellipse(extent=  {{-10, 52}, {46, 0}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                    fillPattern=                                                                                                    FillPattern.Solid), Rectangle(extent=  {{-92, 46}, {-38, 8}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 170},
                    fillPattern=                                                                                                    FillPattern.Solid), Rectangle(extent=  {{-32, 30}, {-14, 24}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 0},
                    fillPattern=                                                                                                    FillPattern.Solid), Rectangle(extent=  {{56, 36}, {74, 30}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 0},
                    fillPattern=                                                                                                    FillPattern.Solid), Rectangle(extent=  {{56, 24}, {74, 18}}, lineColor=  {0, 0, 255}, fillColor=  {0, 0, 0},
                    fillPattern=                                                                                                    FillPattern.Solid)}));
        end DesiredFlowrate;
      end VolumeControl;
      extends Modelica.Icons.Package;
    end Control1;
  end Test;
  annotation(Documentation(info = "<html>
<p>Cardiovascular is package extending the Physiolibrary <a href=\"http://www.physiolibrary.org\">http://www.physiolibrary.org</a> containing blocks and models which are useful to model cardiovascular system and related parts.  The blocks are in development stage and some of them may appear in Physiolibrary in future.</p>
</html>", revisions = "<html>
  <p>Licensed by Tomas Kulhanek under the Modelica License 2</p>
  <p>Copyright &copy; 2014, Tomas Kulhanek, Charles University in Prague.</p>
  <p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
  </html>"), uses(Modelica(version = "3.2.1"),                                        CardiovascularSimple(version = "1"),
      Physiolibrary(version="2.3.0"),
      Physiomodel(version="1.0.0")),                                                                                        version = "2", conversion(from(version = "1", script = "ConvertFromCardiovascular_1.mos", version = "")));
end Cardiovascular;
model Cardiovascular_Model_Burkhoff_Test_BurkhoffBleeding
 extends Cardiovascular.Model.Burkhoff.Test.BurkhoffBleeding;
  annotation(experiment(
    StopTime=86400,
    __Dymola_NumberOfIntervals=500,
    Tolerance=1e-005,
    __Dymola_Algorithm="dassl"),uses(Cardiovascular(version="2")));
end Cardiovascular_Model_Burkhoff_Test_BurkhoffBleeding;
