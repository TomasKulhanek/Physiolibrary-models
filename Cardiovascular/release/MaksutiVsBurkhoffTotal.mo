within ;
package ModelicaServices
  "(version = 3.2.1, target = \"Dymola\") Models and functions used in the Modelica Standard Library requiring a tool specific implementation"

package Machine

  final constant Real eps=1.e-15 "Biggest number such that 1.0 + eps = 1.0";

  final constant Real small=1.e-60
      "Smallest number such that small and -small are representable on the machine";

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


package Physiolibrary "Modelica library for Physiology (version 2.3.1alpha)"
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
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

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
</html>"),Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics));
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
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));

         parameter Types.Volume ZeroPressureVolume = 1e-11
          "Maximal volume, that does not generate pressure if useV0Input=false"
          annotation (Dialog(enable=not useV0Input)); //default = 1e-5 ml

          parameter Types.Volume CollapsingPressureVolume = 1e-12
          "Maximal volume, which generate negative collapsing pressure"; //default = 1e-6 ml

         Types.RealIO.VolumeInput zeroPressureVolume(start=ZeroPressureVolume)= zpv if useV0Input
                                                          annotation (Placement(transformation(
                extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-80,80})));
        parameter Boolean useComplianceInput = false
          "=true, if compliance input is used"
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
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
          annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="External inputs/outputs"));
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
            excessVolume/c + ep
          else
            a*log(max(Modelica.Constants.eps,volume/CollapsingPressureVolume)) + ep);
        //then: normal physiological state
        //else: abnormal collapsing state
        state = volume; // der(volume) =  q_in.q;
        change = q_in.q;
       // assert(volume>=-Modelica.Constants.eps,"Collapsing of vessels are not supported!");
       annotation (
          Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{
                  100,100}}), graphics={Text(
                extent={{-318,-140},{160,-100}},
                textString="%name",
                lineColor={0,0,255})}),        Documentation(revisions="<html>
<p><i>2009-2014</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
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

      model Inertia "Inertia of the volumetric flow"
        extends SteadyStates.Interfaces.SteadyState(
                                           state_start=volumeFlow_start,
          storeUnit="ml/min");
        extends Interfaces.OnePort;
        extends Icons.Inertance;
        parameter Types.VolumeFlowRate volumeFlow_start=0.3
          "Volumetric flow start value"
           annotation (Dialog(group="Initialization"));                                                          //5 l/min is normal volumetric flow in aorta

        parameter Types.HydraulicInertance I "Inertance";

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
        parameter Types.Pressure Pknee(final min=0, start=0)
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
                color={0,0,255},
                smooth=Smooth.None),
              Line(
                points={{62,100},{80,80}},
                color={0,0,255},
                smooth=Smooth.None),
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
         Types.VolumeFlowRate volumeFlowRate "Volumetric flow";
         Types.Pressure dp "Pressure gradient";
      equation
        q_in.q + q_out.q = 0;
        volumeFlowRate = q_in.q;
        dp = q_in.pressure - q_out.pressure;
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-100},{100,100}}), graphics));
      end OnePort;
    end Interfaces;
    annotation (Documentation(revisions="<html>
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",   info="<html>
<p>The main usage of the hydraulic domain in human physiology is modeling of the cardio-vascular system. And because there are no extreme thermodynamic conditions, the system can be really simple &mdash;it is only necessary to model conditions for incompressible water, at normal liquid-water temperatures and with relative pressure 5-20kPa. This boring thermodynamic state leads to the very simple blocks of hydraulic resistance, hydrostatic pressure, volumetric flow, inertia and finally the block of blood accumulation in elastic vessels.</p>
</html>"));
  end Hydraulic;

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
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
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
                  -100}},
              imageSource=
                  "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",
              fileName=
                  "modelica://Physiolibrary/Resources/Icons/krevniRecisteSiluetacloveka.png")}));

    end SystemicCirculation;

    class PulmonaryCirculation

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}},
              imageSource=
                  "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",
              fileName=
                  "modelica://Physiolibrary/Resources/Icons/krevniRecistePlice.png")}));

    end PulmonaryCirculation;

    class ElasticBalloon

    annotation (Icon(graphics={     Bitmap(extent={{-100,100},{100,-100}},
              imageSource=
                  "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",
              fileName=
                  "modelica://Physiolibrary/Resources/Icons/elastickyKompartment - Kopie.png")}));

    end ElasticBalloon;

    partial class HydraulicResistor

    annotation (Icon(graphics={    Bitmap(extent={{-120,44},{120,-42}},
              imageSource=
                  "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"
                   +
                  "llqWv1EWQqtPRFNtPFmAukVu3zS9ZgaWztDwTi0RntmchuflYbB8547vo69DP+gERtpvRr97puh8aTn+Tk34zZG56Mxw2v3gPDUGNvaCIebd3oT1Hkdg8fIWHqZ54mVBGN7WpymQlbUypLeQgdtSycDpbNMM1jqBSUMIwque4eYbO/wUcQVLHHdSXy5HVzL7N8emKOt4dAq6Hp6CsZeWqXG10yHn4ZnuiHhKlbz6WNQwKShviEUlmUwWvm2gcG9lZt8ui5jQZNtUKXcuNCtfy/KTjdR3MuyhRuOrotQ67yLeBVgi4MWUeBe2EtaSIQZrmsOWubhsPBYtwljUSO21mhcRCaDk3XxVNPm7TsIiLybvuSstJFuRFisFVAxK6aTPVxR4tz+6YmfUJSzz2YNhlqvoWdPRZe8k9GHoGHFgJiYwjJjfWov9rrtxP9oSL4v8kdWepLSQjFrXtL3ltRjSGM5K2rOVXgml4LbJ88G+uNswJQAnWW7ACDKBzoll+Jbn+/s+Mt7hGeh7ej6GX1yMlc5bsPXJLpyPPA+PbFvEV/hQoDNdJ5DqKbhl7faKlihU0SRUy/1AWTpc6tNUT6uLVNpDa60Ux19+bmbIaGS9Zb30KmqV4vY4AjOOII2jS8Uhrj0cwXXP4fbJGbcTb+LE82PYyix1+dmlmHCA4WzPAnTdT8F+cBn+fmAJvj68DDoXTDHJbhdWPDmJvQm2sPpI9mxIxLt2tkPzG9SqhWxTqXsJ9DYZmkjHx7ZExDCSOL93xdHwCzD0/BHTbczR7QQZ+sRMdDo2HR0PTkHvI7Mx4YoBjNx240DAafi/c0Fy7hOSRizaJEOuYqgrJSNVUuLQ2uuimZxFqERLiEMkkLxYQJMtkkX3rYI1I52EQgGVhENhLaWxBFiOa6YrxrKRNUhXjUBLqjtjKEUdhbakqRVMT0uZUUj6Kn8LNVaTseRVJyXMJuSlQCklz2Ebewffu+/FIusN6HlqPv5yag7+x/Hp+B/HpuFbiu9JlibY7H0IN+Ot4Z39CBmM1dmM4QXMlkqpNWoaE0i1sagqi0RZsbw2JAEvUz1w1fcctjv9jFmWq9GF5/ofh8bj30/NxFcMZV2OLkO/M/qYfGsjjDwO4nDUTVizgX1L/Qhzhk9Ju5l+C5CUJmTmKguN1ZX7ofVzJtReSp34eSv39VrL2JAUsM0MB5ItyevyRMzWk8XVixKoS2TxWElKahnK/tFClFyoosk66a0Mc7W8fjm1U0E7mZF6NJVsE1bihzspTjgWfg+mHifYNpvQw0JXrd3+70cZSo8txldMHPocWYGJRw2w+vxmWD66hsxsdniNrL31Bo2F1LpMpFob4lg3zTr3BdxmUBLI0t73GD6PJdzG6sd7Mf66EXocnoNv90xXTth3P5176xjsPK+Px5GW+FhJgU7wVBNIzWQycapGmryRTS2U+zlzVKMCMhRREwffAwa/MJY2M1QaS4YYRLzLqLu96VR1z/CywSjUxzowDFK4V75UA2zy5id5J5+EQflb0WJtGBHOEEkPL2ZFnrAS008twt82D0bHvRPpLXMw6sZqrPTYg+OJd+HGjDGiNZ5+kaayv0+sfj6PK2KHF7fI2qK8Bj2jti5KvdlCXiGS3haJ3V670WvnUPx5Sz98c3A0OjO0Dbi+GIucNuP0iyuwi7RF8Ht/vGGIKqc+qSfbNbZmkGmTmDSQgShIRRdIh4twraxjA8owCEGg1kpQSyhRc5RyK5mUvJaYIVYeyW8XEVxNQFbL0pQxbOQ41NSTmetky3JSu8ibHWT0X90IpyRQM1XVeB8ZPT8QDXnyrkI6KLOyOoYdWSS3kswmr3VrIvCryXS5PDalLBABuY9xP9Ea+31Owpz6ct6lNZh8YhWGbJuF0TvmYY/9CaU1i5n+5LdkooTtJY5fJ05OHdbGa7eLTqK2bWE92htfs4wEG0NrKjWbX14QrkTbYL3zISy+YoZxO0Zj200jeKffJ9NGss3jUElHr2HZ5FUvYjIu1kBGl1tKMmyhhhpkpi6TO1myXauxtJnhL+NYj9bNgbzSX6ZjOKkljaYRT/c1WSFRKgNpsqyz3E4Qk78lzkq8lcHM6vZYFigFUVUBMLllBt3b5tj/4izuZJM1KIAjCSZ5B04x/y8loIqamRHSIwoJyHwK7aJ6siHTWWFBuZ1RIwBjJlrcHsMjonAh+ASWX1kGE/v1sEi8hDv59nBt8OUvPJ5sUEOma6AGaiGQ5H1/at66eiyeAJH5RrKGadnntc6r6YES7lpJ/TKJUKaHSJIhpl5HTON36g2x7CQ5RrKlegJGZbYEQNUXpl6EQKtnQzdRd8gxaskjuaas1SBz55m8KJCyTC3UaaLXRLc1EGTq3milvAE2GM3yIk12bAWdTZbeTmWHhjJhkjdiXKUDnfU7A/cMR4bYJPWygQxhzPYoZm6f51+J9pHH+0t4ziICQL0wlNcuZVZYlYpm6sAanjlP7i80JiGUQLdPtoJfjj0yW15qMnVmfPnMFuW9hUW8dim3si68DDMIA4tzypqv6m24JSHwPfxrVigZoQDLXUbe5e31TzbMh7PRlF9eLWe/aTaqgu8yFLJADAdyd10tIktKFJO/5Q53C0FVQ41S0BiiRs1llbu0bG8U0GNqmtKI+nS0k5caWZGqukSUsuMqCl6gXlYBlts/smzP5xvN8gLwFnqFvN63hgwgN5PlHYPSWSW5/iigzqhmFlJHAJewAeRmbimtCEydW/xRUueH0ipfVDILkjeJat4Hw3PLdWQtBmaPLSUUqMVkDDJUTTE1EcsjbyVtafD/B2v6whrrqR9/x2SCXUN9JFmI2dtnayCwG+oI9M9WX5NIVmcyU0HnqyAbVJKtPlt1JdN4tq8soS1vMxWJUdbwkuwdisK2lwQA24BAK8QLfGp8Sif0QmWLDxrbac1ePPcj1Jc9QWOJL5qYncv7ueWuhoxXiQ6S19u1kWUb2B/lxTxnUQgKGOpLybqVrakqEZDVC+X9h6V0UnlfkICpQkBOdmpmv8i9Wbl1VEmwlVJayAiBeom7TE9iRum9X1cxloBKCyy5zdPBSW8C/DYuxCPTmeoNYNarxsFmzVTke11ix9Pb1K2cENVR6hVj3Kr7fBRvspX3A5dX+aGyzB/qprLM06lP5TEEZWEUWovoUSXMMOSN9/J2ClkLUybWySRAuRco02JkRmZpkHrfn/btqjL9RWWciknE+wkO9eb8WDZeJCpLXqGkOACVBFNdgx/a2kTPcF/SucxIlZd01+bLwxbCCPxOJt5Vy1wiWSGQ5atNZ3nJcrXyTmVfZnz/0VrquK31Udb62dpqNNZeTSNDt6uxH9aRIbeZwJfXvYlJ2BSTFZC11kDt2Ew2lbGlNgJOvU21NJif6Wgyqk0dJvdV5Z2QZdSAJZU+KK/2pV57irYm1qUtgHXzphZ0ZHvYsw7emnuE6i32rKPc0SADSsIlYVEWiKssZSgWIpApOW2sP7WwvLC9rjSEvwWrWz9llDriyNLuMhCuwrmwKQmlVebaM4K00VrknqTc4Ob5W4rowGkucP9xER7oj/1lqEHApRjLVW8i/DYsgKfxdLga8geC6z6pTd4wURZC1hJqVcMJ7DSJqyrNpFWyEiLiyGAg06hbNSyomhAma42W8HdJyWXJHrn3JIuHyUxSufsub1WvlPWs2FiylhU7QA3KCZDUWpliIg55XDsBQFC05fM68k5pGVGulQViabIUkbCRhC9hwUJev1gcgZ9lBoXMEJX5WmJsaDVLUlZ0VncH6AgCaplCLYOCWpMyaE0+S2j7QjOp0PmLsUxqujLPKSZ10xrlgzJ2rho4FlNl4DGKTbmV36hXUStlDlQPgrRLmaSdmP2CrKJe6yvpP4Wyuo9HxlFP/sj8OHEaef0vszM1KC19JX0jZZc60znVnC46rFrRWkyVi8cI2NQ9Qra1VozLrFoVxqVuPIe0J7WhCrECXnkWgZmzlFueO8h+clYt3X5Pd9QvN6ElJLrJctxupnPgvWExHPRlgtZ0eK2frVT+HYPRcP1xCbxOrIbbSRM4nTaDwxkztXU5ZcLvzPCIv3kwTX520hDeJwzwYNd8BFluh/NJYzw8YgDnU2vgelrMFB5nTOB+2ggep/XhdnoFv1sG11PL4XJEF+7MeB4dM4a3hRmenFwDbx4nb7NwO2MOh5OmeMjvnU+vg+eFzfA8uREu+03gudsYvgfX4enhdXhydD0eH1+Hxxbr4WGxjmVbAycLEzhYGMHplJiURZ/X04P7KV08OqmLxydX0vThZWGKRxbmtHVqK8d7nPx1635iLdwt1sCTW88TLNfxtTTN1uu4CZ6e0IevxQr4nliJp9w+tZDtStZDY17M8h6f1GOdVqntoxN68DyuC49jK+FOc+FxUi6P04ZqsX/vU6bqvJ6H2O77DVm3tfA/tRk+JzbBfb8p3A6awefMVjyluR4xhffJdfA6ybJImVlvdx4v7e161kwtQenM8zqz/q6sqyvL4mHB67MMXhar1IMh8hyByyF9PDlhCj+e48khI6WbnrMt5JVxvqfMWG4T1U/2h5bDg8d4sy/t9i7GdeMxsDebhPvLR6hBUSfzGbAxngrH9XPQwXvvOliZzCZLTSPSZsNZECcvMzSbDOuVw3Fff4yaY37LcIJaElu2dwzHwcpwDO4SfFqTz3c+m0yd/Y8m3/N3o9Hc0laPVFvtMXINrcn5xeQ4me8t02/FNNeewH0m4K7cMP9s8llMfhP7retqjNf7bFaGGtNeS3Ps/95WlZfnuGs48nMbjPzlvP9/TFuWL9vhn9tCW7cvTVMGrUlZfrXfr7um7f+x/rwW7S6vI3ZfX2MyLqX5W37TmHbfX48ZA2v90fAisOxWjFCLrblsWoiLy8bA42cTdAi9cRy2Owxwz3w+3Lcugrwd05UHPjaZCC/jCfCQe4nG0+AiL5M2maG28nCiuzG/5z7yt3apwP+2/3qmXXfhj5hgQHDiYjCWoXCWWjLzivFchFw9hA54HYGAC3txcdUUXFkxRoVBYSxPkwl4RPby5AkkRLqazIQLBb5sZeqpPCbmZqqZhiqvEftv+69p2gcg/qgJDmSVolurJuL8yim4vX01Pga6Elh1hdSCj+B2YD1uMyRKjHTjBT1MJikkujL8yVCEE0OlvC9axrtk8ryr0USGzfH8/Os7VP7b/uuZ9OUfNbVWg8k02K+hlFq7CLY/miHc9joFfxaB1VBGlZ/PBCoICVYW8P5xlRqJF3A9MtM8IyazTN3kaWkz+X6G+s7TdLIy2U873/m/7b+eafr3j5lgwY7Actu+EgFnfmKW6MDs9APQVIX/D5GUh/p4kkq9AAAAAElFTkSuQmCC",
              fileName=
                  "modelica://Physiolibrary/Resources/Icons/resistance.png")}));

    end HydraulicResistor;

    class PressureMeasure

      annotation ( Icon(graphics={Bitmap(extent={
                  {-100,100},{100,-100}},
              imageSource=
                  "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",
              fileName=
                  "modelica://Physiolibrary/Resources/Icons/pressureMeassure.png")}));

    end PressureMeasure;

    class Inertance

      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
              imageSource=
                  "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",
              fileName=
                  "modelica://Physiolibrary/Resources/Icons/ventilatorInertance.png")}));

    end Inertance;
    annotation (Documentation(revisions=""));
  end Icons;

  package Types "Physiological units with nominals"
    extends Modelica.Icons.Package;

    package Constants
      extends Modelica.Icons.SourcesPackage;

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
    end Constants;

    package RealIO
      extends Modelica.Icons.Package;

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
    end RealIO;

    type Time = Modelica.SIunits.Time(displayUnit="min", nominal=60);

    type Frequency = Modelica.SIunits.Frequency(displayUnit="1/min");

    type Pressure =  Modelica.SIunits.Pressure(displayUnit="mmHg", nominal=133.322387415);

    type Volume =  Modelica.SIunits.Volume(displayUnit="ml", nominal=1e-6, min=0);

    type VolumeFlowRate = Modelica.SIunits.VolumeFlowRate(displayUnit="ml/min", nominal=(1e-6)/60);

    type HydraulicConductance = Real(final quantity="HydraulicConductance",final unit="m3/(Pa.s)", displayUnit="ml/(mmHg.min)", nominal=(1e-6)/((133.322387415)*60), min=0);

    type HydraulicResistance = Real(final quantity="HydraulicConductance",final unit="(Pa.s)/m3", displayUnit="(mmHg.min)/ml", nominal=(1e+6)*(133.322387415)*60, min=0);

    type HydraulicCompliance =  Real(final quantity="HydraulicCompliance",final unit="m3/Pa", displayUnit="ml/mmHg", nominal=(1e-6)/(133.322387415));

    type HydraulicElastance = Real(final quantity="HydraulicElastance",final unit="Pa/m3", displayUnit="mmHg/ml", nominal=(133.322387415)/(1e-6));

    type HydraulicInertance =  Real(final quantity="HydraulicInertance",final unit="Pa.s2/m3", displayUnit="mmHg.min2/ml", nominal=((133.322387415)*(60^2)/(1e-6)));

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
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>",   info="<html>
<p>The main problem of medical research, articles, and experiments is using obscure units from medicine, pharmacology, biology and non-physics disciplines. The Physiolibrary fulfills the Modelica ideal of using SI units as the main unit for each variable, and the previously described physiological units are also implemented as the displayUnits for each variable. Using these displayUnits the user sets and sees the &QUOT;physiological&QUOT; values. The implementation can also be joined to any unit-correct Modelica models and physical equations without crashing due to unit incompatibilities. The unit support of Physiolibrary is so strong that you even can chose the right unit-typed &ldquo;input real&rdquo;/&rdquo;output real&rdquo; from the library package Types.RealIO. As can be expected, only the non-specific packages States and Blocks in the Physiolibrary have variables without units.</p>
</html>"));
  end Types;
  annotation (preferredView="info",
version="2.3.1alpha",
versionBuild=1,
versionDate="2015-02-16",
dateModified = "2015-02-16 15:49:00Z",
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
<p>Licensed by Marek Matejak under the Modelica License 2</p>
<p>Copyright &copy; 2008-2014, Marek Matejak, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
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

      partial block SO "Single Output continuous control block"
        extends Modelica.Blocks.Icons.Block;

        RealOutput y "Connector of Real output signal" annotation (Placement(
              transformation(extent={{100,-10},{120,10}}, rotation=0)));
        annotation (Documentation(info="<html>
<p>
Block has one continuous Real output signal.
</p>
</html>"));

      end SO;

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

    package Sources
      "Library of signal source blocks generating Real and Boolean signals"
      import Modelica.Blocks.Interfaces;
      import Modelica.SIunits;
      extends Modelica.Icons.SourcesPackage;

      block Trapezoid "Generate trapezoidal signal of type Real"
        parameter Real amplitude=1 "Amplitude of trapezoid";
        parameter SIunits.Time rising(final min=0) = 0
          "Rising duration of trapezoid";
        parameter SIunits.Time width(final min=0) = 0.5
          "Width duration of trapezoid";
        parameter SIunits.Time falling(final min=0) = 0
          "Falling duration of trapezoid";
        parameter SIunits.Time period(final min=Modelica.Constants.small, start=1)
          "Time for one period";
        parameter Integer nperiod=-1
          "Number of periods (< 0 means infinite number of periods)";
        parameter Real offset=0 "Offset of output signal";
        parameter SIunits.Time startTime=0
          "Output = offset for time < startTime";
        extends Interfaces.SO;
      protected
        parameter SIunits.Time T_rising=rising
          "End time of rising phase within one period";
        parameter SIunits.Time T_width=T_rising + width
          "End time of width phase within one period";
        parameter SIunits.Time T_falling=T_width + falling
          "End time of falling phase within one period";
        SIunits.Time T_start "Start time of current period";
        Integer count "Period count";
      initial algorithm
        count := integer((time - startTime)/period);
        T_start := startTime + count*period;
      equation
        when integer((time - startTime)/period) > pre(count) then
          count = pre(count) + 1;
          T_start = time;
        end when;
        y = offset + (if (time < startTime or nperiod == 0 or (nperiod > 0 and
          count >= nperiod)) then 0 else if (time < T_start + T_rising) then
          amplitude*(time - T_start)/rising else if (time < T_start + T_width)
           then amplitude else if (time < T_start + T_falling) then amplitude*(
          T_start + T_falling - time)/falling else 0);
        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
              Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
              Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-147,-152},{153,-112}},
                lineColor={0,0,0},
                textString="period=%period"),
              Line(points={{-81,-70},{-60,-70},{-30,40},{9,40},{39,-70},{61,-70},{
                    90,40}}, color={0,0,0})}),
          Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics={
              Polygon(
                points={{-81,90},{-87,68},{-75,68},{-81,90}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Line(points={{-81,68},{-81,-80}}, color={95,95,95}),
              Line(points={{-91,-70},{81,-70}}, color={95,95,95}),
              Polygon(
                points={{89,-70},{67,-65},{67,-76},{89,-70}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-46,-30},{-48,-41},{-44,-41},{-46,-30}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-46,-30},{-46,-70}},
                color={95,95,95},
                pattern=LinePattern.Solid,
                arrow={Arrow.None,Arrow.None}),
              Polygon(
                points={{-46,-70},{-48,-60},{-44,-60},{-46,-70},{-46,-70}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-80,-46},{-42,-55}},
                lineColor={0,0,0},
                textString="offset"),
              Text(
                extent={{-49,-71},{-6,-81}},
                lineColor={0,0,0},
                textString="startTime"),
              Text(
                extent={{-80,95},{-47,80}},
                lineColor={0,0,0},
                textString="y"),
              Text(
                extent={{66,-78},{89,-89}},
                lineColor={0,0,0},
                textString="time"),
              Line(
                points={{-31,82},{-31,-70}},
                color={95,95,95},
                pattern=LinePattern.Dash),
              Line(
                points={{-11,59},{-11,40}},
                color={95,95,95},
                pattern=LinePattern.Dash),
              Line(
                points={{19,59},{19,40}},
                color={95,95,95},
                pattern=LinePattern.Dash),
              Line(
                points={{39,59},{39,-30}},
                color={95,95,95},
                pattern=LinePattern.Dash),
              Line(points={{-31,76},{59,76}}, color={95,95,95}),
              Line(points={{-31,56},{39,56}}, color={95,95,95}),
              Text(
                extent={{-3,86},{24,77}},
                lineColor={0,0,0},
                textString="period"),
              Text(
                extent={{-11,68},{18,59}},
                lineColor={0,0,0},
                textString="width"),
              Line(
                points={{-43,40},{-11,40}},
                color={95,95,95},
                pattern=LinePattern.Dash),
              Line(
                points={{-40,40},{-40,-30}},
                color={95,95,95},
                pattern=LinePattern.Solid,
                arrow={Arrow.None,Arrow.None}),
              Text(
                extent={{-77,11},{-44,1}},
                lineColor={0,0,0},
                textString="amplitude"),
              Polygon(
                points={{-31,56},{-24,58},{-24,54},{-31,56}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-11,56},{-18,58},{-18,54},{-11,56}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-31,76},{-22,78},{-22,74},{-31,76}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{59,76},{51,78},{51,74},{59,76}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-81,-30},{-31,-30},{-11,40},{19,40},{39,-30},{59,-30},{79,
                    40},{99,40}},
                color={0,0,255},
                thickness=0.5),
              Polygon(
                points={{-40,40},{-42,29},{-38,29},{-40,40}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-40,-30},{-42,-20},{-38,-20},{-40,-30},{-40,-30}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Line(
                points={{59,84},{59,-30}},
                color={95,95,95},
                pattern=LinePattern.Dash),
              Polygon(
                points={{39,56},{32,58},{32,54},{39,56}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{19,56},{26,58},{26,54},{19,56}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{19,56},{12,58},{12,54},{19,56}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-11,56},{-4,58},{-4,54},{-11,56}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-35,68},{-6,60}},
                lineColor={0,0,0},
                textString="rising"),
              Text(
                extent={{16,68},{44,60}},
                lineColor={0,0,0},
                textString="falling")}),
          Documentation(info="<html>
<p>
The Real output y is a trapezoid signal:
</p>

<p>
<img src=\"modelica://Modelica/Resources/Images/Blocks/Sources/Trapezoid.png\"
     alt=\"Trapezoid\">
</p>
</html>"));
      end Trapezoid;
      annotation (Documentation(info="<HTML>
<p>
This package contains <b>source</b> components, i.e., blocks which
have only output signals. These blocks are used as signal generators
for Real, Integer and Boolean signals.
</p>

<p>
All Real source signals (with the exception of the Constant source)
have at least the following two parameters:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>offset</b></td>
      <td valign=\"top\">Value which is added to the signal</td>
  </tr>
  <tr><td valign=\"top\"><b>startTime</b></td>
      <td valign=\"top\">Start time of signal. For time &lt; startTime,
                the output y is set to offset.</td>
  </tr>
</table>

<p>
The <b>offset</b> parameter is especially useful in order to shift
the corresponding source, such that at initial time the system
is stationary. To determine the corresponding value of offset,
usually requires a trimming calculation.
</p>
</html>",     revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Integer sources added. Step, TimeTable and BooleanStep slightly changed.</li>
<li><i>Nov. 8, 1999</i>
       by <a href=\"mailto:clauss@eas.iis.fhg.de\">Christoph Clau&szlig;</a>,
       <a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>,
       <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       New sources: Exponentials, TimeTable. Trapezoid slightly enhanced
       (nperiod=-1 is an infinite number of periods).</li>
<li><i>Oct. 31, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       <a href=\"mailto:clauss@eas.iis.fhg.de\">Christoph Clau&szlig;</a>,
       <a href=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</a>,
       All sources vectorized. New sources: ExpSine, Trapezoid,
       BooleanConstant, BooleanStep, BooleanPulse, SampleTrigger.
       Improved documentation, especially detailed description of
       signals in diagram layer.</li>
<li><i>June 29, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.</li>
</ul>
</html>"));
    end Sources;

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

    final constant Real small=ModelicaServices.Machine.small
      "Smallest number such that small and -small are representable on the machine";

    final constant Real inf=ModelicaServices.Machine.inf
      "Biggest Real number such that inf and -inf are representable on the machine";

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
              fillColor=  {128,128,128},
              pattern=  LinePattern.None,
              fillPattern=  FillPattern.Solid,
              extent=  {{-70,-4.5},{0,4.5}})}),
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

    type Area = Real (final quantity="Area", final unit="m2");

    type Volume = Real (final quantity="Volume", final unit="m3");

    type Time = Real (final quantity="Time", final unit="s");

    type Frequency = Real (final quantity="Frequency", final unit="Hz");

    type Force = Real (final quantity="Force", final unit="N");

    type Pressure = Real (
        final quantity="Pressure",
        final unit="Pa",
        displayUnit="bar");

    type VolumeFlowRate = Real (final quantity="VolumeFlowRate", final unit=
            "m3/s");
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
            imageSource=
                "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"
                 +
                "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"
                 +
                "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"
                 +
                "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"
                 +
                "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"
                 +
                "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"
                 +
                "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"
                 +
                "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",
            fileName="modelica://Cardiovascular/Resources/Icons/cvsconcept.png"),                                                                                                    Text(
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
                extent={{-86,106},{82,-104}},
              imageSource=
                  "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",
              fileName=
                  "modelica://Cardiovascular/Resources/Icons/heartPict.png"),                                         Text(extent={{
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
                100,100}}),                                                                                                  graphics={  Text(extent = {{-158, -50}, {160, -82}}, lineColor = {0, 0, 255},
                lineThickness =                                                                                                   1, textString = "%name")}));
    end SystemicCirculation;

    partial model PulmonaryCirculation
      extends Physiolibrary.Icons.PulmonaryCirculation;
      //  extends Physiolibrary.Hydraulic.Interfaces.OnePort;
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a q_in annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}}), iconTransformation(extent = {{-108, -12}, {-88, 8}})));
      Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b q_out annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{88, -16}, {108, 4}})));
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(extent = {{-156, -38}, {156, -64}}, lineColor = {0, 0, 255},
                lineThickness =                                                                                                   1, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end PulmonaryCirculation;
  end Interfaces;

  package Model
    extends Modelica.Icons.ExamplesPackage;

    package Burkhoff

      model HemodynamicsBurkhoff
        extends System(
          redeclare Parts.Pulmonary pulmonaryCirculation,
          redeclare replaceable Parts.Heart heart,
          redeclare Parts.Systemic systemicCirculation);
      end HemodynamicsBurkhoff;

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
          Physiolibrary.Hydraulic.Components.ElasticVessel Cvs(
            volume_start=0.002701,
            ZeroPressureVolume=0.00223,
            Compliance=5.2504310309196e-07)                                                                                                     annotation(Placement(transformation(extent={{-48,-10},
                    {-28,10}})));
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
        equation
          if Tsyst <= 3 / 2 * Tmax then
            Et0 = 0.5 * (sin(Modelica.Constants.pi / Tmax * Tsyst - Modelica.Constants.pi / 2) + 1);
          else
            Et0 = 0.5 * exp(-(Tsyst - 3 * Tmax / 2) / Tau);
          end if;
          //1e+6 and 133.322368 are recalculation in SI units - as the original equation comes in torr and ml.
          //  Et = (1 - Et0) * Beta * (exp(Alpha * Vs * 1e+6) - 1) / Vs * 1e+6) * 133.322368 * 1e+6 + Et0 * Ees;

          Et = Et0 * Ees+ Modelica.Constants.eps;
          Pt = (1 - Et0) * Beta * (exp(Alpha * Vs) - 1);
          Ct = 1 / Et;
          annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                    -100},{100,100}}),                                                                           graphics), Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                    -100},{100,100}}),                                                                                                    graphics={  Rectangle(extent={{
                      -100,100},{100,-76}},                                                                                                    lineColor = {0, 0, 127}, fillColor = {255, 255, 170},
                    fillPattern =                                                                                                   FillPattern.Solid), Line(points={{
                      -38,94},{-38,-36},{86,-36}},                                                                                                    color = {0, 0, 0}, smooth = Smooth.None), Line(points={{
                      -34,-34},{30,-32},{54,-30},{70,-28},{76,-26},{82,-24},{86,-22},{90,
                      -20}},                                                                                                    color = {0, 0, 0}, smooth = Smooth.None), Line(points={{
                      -34,-36},{4,94}},                                                                                                    color = {0, 0, 0}, smooth = Smooth.None), Line(points={{
                      -34,-36},{88,80}},                                                                                                    color = {255, 0, 0}, smooth = Smooth.None), Polygon(points={{
                      76,72},{72,80},{80,76},{76,72}},                                                                                                    lineColor = {255, 0, 0}, smooth = Smooth.None, fillColor = {255, 0, 0},
                    fillPattern =                                                                                                   FillPattern.Solid), Polygon(points = {{0, -4}, {-4, 4}, {4, 0}, {0, -4}}, lineColor = {255, 0, 0}, smooth = Smooth.None, fillColor = {255, 0, 0},
                    fillPattern =                                                                                                   FillPattern.Solid, origin={84,
                      69},                                                                                                    rotation = 180), Text(extent={{
                      -110,-52},{-64,-76}},                                                                                                    lineColor = {0, 0, 255}, fillColor = {255, 0, 0},
                    fillPattern =                                                                                                   FillPattern.Solid, textString = "Vs"), Text(extent={{6,
                      -50},{52,-76}},                                                                                                    lineColor=
                      {0,0,255},                                                                                                    fillColor=
                      {255,0,0},
                    fillPattern=FillPattern.Solid,
                  textString="Ct"),                                                                                                    Text(extent={{
                      -100,120},{100,104}},                                                                                                    lineColor = {0, 0, 255}, fillColor = {170, 213, 255},
                    fillPattern =                                                                                                   FillPattern.Solid, textString = "%name"),
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
          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Text(visible = true, origin = {-18.5625, 68}, lineColor = {0, 0, 255}, extent = {{-73.4375, 6.00004}, {-23.4375, 24}}, textString = "HR", fontName = "Arial")}));
        end HeartIntervals;

        model AtrialElastance
          extends HeartIntervals;
          extends HeartElastance;
        equation
          Tsyst = Tasyst;
          annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
        end AtrialElastance;
      end Parts;
    end Burkhoff;

    package Maksuti2015 "Model of heart based on AV piston theory"

      model HemodynamicsMaksuti
        extends System(redeclare Burkhoff.Parts.Pulmonary pulmonaryCirculation,
            redeclare Burkhoff.Parts.Systemic systemicCirculation(Cvs(
                volume_start=0.002901)),
          redeclare Heart heart);
      end HemodynamicsMaksuti;

      model Heart
        extends Interfaces.Heart;
        Burkhoff.Parts.ElasticVesselWithSVandP LA(
          useComplianceInput=false,
          useExternalPressureInput=false,
        volume_start=8.1e-05,
        ZeroPressureVolume=5e-06,
        Compliance=2.250184727537e-09)
          annotation (Placement(transformation(extent={{54,-48},{74,-28}})));
        Physiolibrary.Hydraulic.Components.IdealValve MV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 9.3757696980707e-07)                                                               annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin={32,-38})));
        Burkhoff.Parts.ElasticVesselWithSVandP LV(
          useComplianceInput=false,
          useExternalPressureInput=true,
        volume_start=0.000125,
        ZeroPressureVolume=5e-06,
        Compliance=2.250184727537e-09)
          annotation (Placement(transformation(extent={{4,-48},{24,-28}})));
        Physiolibrary.Hydraulic.Components.IdealValve AOV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 1.5001231516913e-06)                                                                annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin={-64,-40})));
        Physiolibrary.Hydraulic.Components.IdealValve PV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 3.7503078792283e-07)                                                               annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={28,40})));
        Burkhoff.Parts.ElasticVesselWithSVandP RV(
          ExternalPressure=0,
          useComplianceInput=false,
          useExternalPressureInput=true,
        volume_start=0.000112,
        ZeroPressureVolume=5e-06,
        Compliance=2.250184727537e-09)
          annotation (Placement(transformation(extent={{-34,30},{-14,50}})));
        Physiolibrary.Hydraulic.Components.IdealValve TV(_Gon(displayUnit=
              "ml/(mmHg.s)") = 9.3757696980707e-07)                                                               annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={-44,40})));
        Burkhoff.Parts.ElasticVesselWithSVandP RA(
          useComplianceInput=false,
          useExternalPressureInput=false,
        volume_start=7.3e-05,
        ZeroPressureVolume=5e-06,
        Compliance=2.250184727537e-09)
          annotation (Placement(transformation(extent={{-82,30},{-62,50}})));
        replaceable Physiolibrary.Types.Constants.FrequencyConst
                                                     heartRate(k=
              1.3333333333333)                                                      annotation(Placement(transformation(extent={{-98,8},
                  {-84,22}})));
        Hydraulic.Components.BloodFlowMeasurement bloodFlowMeasurement
          annotation (Placement(transformation(extent={{-76,-50},{-96,-30}})));
        AVPiston aVPiston(A1=0.0025, A2=0.0050)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=0,
              origin={28,-12})));
        ForceProfile forceProfile(
          tv1=0.1,
          tv2=0.350,
          tv3=0.01,
          ta1=0.1,
          ta2=0.2,
          ta3=0.1,
          tv0=0.1,
          ta0=0.6,
        Fa=1500*0.0133322368,
        Fv=7350*0.0133322368,
        frequency=1.3333333333333)
          annotation (Placement(transformation(extent={{-6,-4},{14,16}})));
        Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure2
          annotation (Placement(transformation(extent={{50,-24},{36,-14}})));
        ForceProfile forceProfile1(
          tv1=0.1,
          tv2=0.350,
          tv3=0.01,
          ta1=0.1,
          ta2=0.2,
          ta3=0.1,
          tv0=0.1,
          ta0=0.6,
        Fv=0.3*7350*0.0133322368,
        Fa=0.3*1500*0.0133322368,
        frequency=1.3333333333333)
          annotation (Placement(transformation(extent={{-46,78},{-26,98}})));
        AVPiston aVPiston1(A1=0.0015, A2=0.0025)
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=0,
              origin={-28,64})));
        Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure3
          annotation (Placement(transformation(extent={{-60,50},{-46,60}})));
      Physiolibrary.Hydraulic.Components.Inertia inertia(I(displayUnit=
              "mmHg.s2/ml") = 2666.4477483, volumeFlow_start(displayUnit=
              "l/min") = 0) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-22,-40})));
      Physiolibrary.Hydraulic.Components.Inertia inertia1(I(displayUnit=
              "mmHg.s2/ml") = 2666.4477483, volumeFlow_start(displayUnit=
              "l/min") = 0) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={0,40})));
      equation
        connect(rightHeartInflow, RA.q_in) annotation (Line(
            points={{-100,40},{-72,40}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(RA.q_in, TV.q_in) annotation (Line(
            points={{-72,40},{-54,40}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(TV.q_out, RV.q_in) annotation (Line(
            points={{-34,40},{-24,40}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(PV.q_out, rightHeartOutflow) annotation (Line(
            points={{38,40},{100,40}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(leftHeartInflow, LA.q_in) annotation (Line(
            points={{100,-20},{84,-20},{84,-18},{64,-18},{64,-38}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(LA.q_in, MV.q_in) annotation (Line(
            points={{64,-38},{42,-38}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(bloodFlowMeasurement.q_in, AOV.q_out) annotation (Line(
            points={{-76,-40},{-74,-40}},
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
        connect(forceProfile.F, aVPiston.Fh) annotation (Line(
            points={{13.4,7},{28,7},{28,-2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(LV.q_in, MV.q_out) annotation (Line(
            points={{14,-38},{22,-38}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(forceProfile1.F, aVPiston1.Fh) annotation (Line(
            points={{-26.6,89},{-28,89},{-28,74}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureMeasure3.pressure, aVPiston1.pressure) annotation (Line(
            points={{-48.8,53},{-48.8,62.5},{-36,62.5},{-36,64}},
            color={0,0,127},
            smooth=Smooth.None));
      connect(AOV.q_in, inertia.q_out) annotation (Line(
          points={{-54,-40},{-32,-40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(inertia.q_in, LV.q_in) annotation (Line(
          points={{-12,-40},{-12,-38},{14,-38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pressureMeasure2.q_in, MV.q_in) annotation (Line(
          points={{45.8,-22},{46,-22},{46,-38},{42,-38}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(LV.externalPressure, aVPiston.pressure1) annotation (Line(
          points={{22,-30},{20,-30},{20,-12},{19.6,-12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(aVPiston.pressure, pressureMeasure2.pressure) annotation (Line(
          points={{36,-12},{38,-12},{38,-21},{38.8,-21}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pressureMeasure3.q_in, TV.q_in) annotation (Line(
          points={{-55.8,52},{-58,52},{-58,40},{-54,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(aVPiston1.pressure1, RV.externalPressure) annotation (Line(
          points={{-19.6,64},{-18,64},{-18,48},{-16,48}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RV.q_in, inertia1.q_in) annotation (Line(
          points={{-24,40},{-10,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(inertia1.q_out, PV.q_in) annotation (Line(
          points={{10,40},{18,40}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-100,-100},{100,100}}), graphics), Icon(graphics={
                Text(
                extent={{-100,60},{100,100}},
                lineColor={0,0,0},
                textString="Maksuti")}));
      end Heart;

      model AVPiston

        parameter Modelica.SIunits.Area A1,A2;
        ForceInput Fh annotation (Placement(transformation(extent={{-12,76},
                  {28,116}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
        Physiolibrary.Types.RealIO.PressureInput pressure annotation (Placement(
              transformation(extent={{-22,-80},{18,-40}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=180,
              origin={80,0})));
        Physiolibrary.Types.RealIO.PressureOutput pressure1 annotation (Placement(
              transformation(extent={{-100,-10},{-80,10}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=180,
              origin={-84,0})));
      equation
        Fh=A2*pressure1-A1*pressure;
      //  q_out.q=0;
      //  q_in.q=0;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={
              Rectangle(extent={{-86,66},{-64,-66}}, lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Rectangle(extent={{-62,40},{60,-40}}, lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Rectangle(extent={{62,60},{84,-60}}, lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Line(
                points={{-82,80},{68,80}},
                color={0,0,255},
                smooth=Smooth.None)}));
      end AVPiston;

      connector ForceInput =        input Modelica.SIunits.Force
        "input Force as connector"
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

      model ForceProfile
        parameter Real tv0,tv1,tv2,tv3,ta0,ta1,ta2,ta3;
        parameter Modelica.SIunits.Force Fv,Fa;

        parameter Physiolibrary.Types.Frequency frequency;
        ForceOutput F annotation (Placement(transformation(extent={{84,0},{
                  104,20}}), iconTransformation(extent={{84,0},{104,20}})));
        Modelica.Blocks.Sources.Trapezoid VentricleTrapezoid(period=1/frequency,
          amplitude=Fv,
          rising=tv1/frequency,
          width=tv2/frequency,
          falling=tv3/frequency,
          startTime=tv0)
          annotation (Placement(transformation(extent={{-12,28},{8,48}})));
        Modelica.Blocks.Sources.Trapezoid AtriaTrapezoid(              period=1/frequency,
          amplitude=-Fa,
          rising=ta1/frequency,
          width=ta2/frequency,
          falling=ta3/frequency,
          startTime=ta0)
          annotation (Placement(transformation(extent={{-14,-24},{6,-4}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{30,0},{50,20}})));
      equation
        connect(F, add.y) annotation (Line(
            points={{94,10},{51,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.u1, VentricleTrapezoid.y) annotation (Line(
            points={{28,16},{18,16},{18,38},{9,38}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.u2, AtriaTrapezoid.y) annotation (Line(
            points={{28,4},{18,4},{18,-14},{7,-14}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Line(
                points={{-80,20},{-40,20},{-20,80},{0,82},{6,20},{58,20},{64,6},{70,6},
                    {76,20},{84,20}},
                color={0,0,255},
                smooth=Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-100,-100},{100,100}}), graphics));
      end ForceProfile;

      connector ForceOutput =        output Modelica.SIunits.Force
        "output Force as connector"
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

      model MaksutiVsBurkhoff
        HemodynamicsMaksuti hemodynamicsMaksuti
          annotation (Placement(transformation(extent={{-58,-38},{-24,40}})));
        Burkhoff.HemodynamicsBurkhoff hemodynamicsBurkhoff
          annotation (Placement(transformation(extent={{24,-38},{66,34}})));
        annotation (experiment(
          StopTime=10,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-06), __Dymola_experimentSetupOutput);
      end MaksutiVsBurkhoff;
    end Maksuti2015;
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
    end Components;
  end Hydraulic;
  annotation(Documentation(info = "<html>
<p>Cardiovascular is package extending the Physiolibrary <a href=\"http://www.physiolibrary.org\">http://www.physiolibrary.org</a> containing blocks and models which are useful to model cardiovascular system and related parts.  The blocks are in development stage and some of them may appear in Physiolibrary in future.</p>
</html>", revisions = "<html>
  <p>Licensed by Tomas Kulhanek under the Modelica License 2</p>
  <p>Copyright &copy; 2014, Tomas Kulhanek, Charles University in Prague.</p>
  <p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
  </html>"), uses(Modelica(version = "3.2.1"),                                        CardiovascularSimple(version = "1"),
      Physiomodel(version="0.2.29"),
      Physiolibrary(version="2.3.0")),                                                                                      version = "2", conversion(from(version = "1", script = "ConvertFromCardiovascular_1.mos", version = "")));
end Cardiovascular;


model Cardiovascular_Model_Maksuti2015_MaksutiVsBurkhoff
 extends Cardiovascular.Model.Maksuti2015.MaksutiVsBurkhoff;
  annotation(experiment(
  StopTime=10,
  __Dymola_NumberOfIntervals=5000,
  Tolerance=1e-06),uses(Cardiovascular(version="2")));
end Cardiovascular_Model_Maksuti2015_MaksutiVsBurkhoff;
