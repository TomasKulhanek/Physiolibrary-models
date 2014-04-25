within ;
package Cardiovascular "Extension library of Physiolibrary v 2.1"
   extends Modelica.Icons.Package;

  package Types
                 extends Modelica.Icons.Package;
    package RealIO
                    extends Modelica.Icons.Package;
      connector HydraulicElastanceInput =  input
          Physiolibrary.Types.HydraulicElastance
        "input HydraulicElastance as connector"
        annotation (defaultComponentName="hydraulicelastance",
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
    Connector with one input signal of type HydraulicElastance. 
    </p> 
    </html>"));
      connector HydraulicElastanceOutput =  output
          Physiolibrary.Types.HydraulicElastance
        "output HydraulicElastance as connector"
        annotation (defaultComponentName="hydraulicelastance",
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
  Connector with one output signal of type HydraulicElastance.
  </p>
  </html>"));
      connector HydraulicResistanceInput = input
          Physiolibrary.Types.HydraulicResistance
        "input HydraulicResistance as connector"
        annotation (defaultComponentName="hydraulicresistance",
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
    Connector with one input signal of type HydraulicResistance. 
    </p> 
    </html>"));
      connector HydraulicResistanceOutput = output
          Physiolibrary.Types.HydraulicResistance
        "output HydraulicResistance as connector"
        annotation (defaultComponentName="hydraulicresistance",
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
  Connector with one output signal of type HydraulicResistance.
  </p>
  </html>"));
    block HydraulicElastanceToCompliance
        "Reciprocal value of hydraulic compliance"

          Physiolibrary.Types.RealIO.HydraulicComplianceOutput y
          "HydraulicCompliance output"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));
      Types.RealIO.HydraulicElastanceInput
                              hydraulicelastance "HydraulicElastance input"
                                                 annotation (Placement(
            transformation(extent={{-68,-28},{-28,12}}), iconTransformation(extent={
                {-54,-14},{-28,12}})));
    equation
          y=1/hydraulicelastance;
      annotation (defaultComponentName="hydrauliccompliance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}},
              preserveAspectRatio=false), graphics),                    Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-28,3},{24,-3}},
              lineThickness=1,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
                pattern=LinePattern.None),
            Polygon(
              points={{24,10},{24,-10},{36,0},{36,0},{24,10}},
              lineThickness=1,
              smooth=Smooth.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
                pattern=LinePattern.None)}));
    end HydraulicElastanceToCompliance;

    block HydraulicResistanceToConductance

          Physiolibrary.Types.RealIO.HydraulicConductanceOutput y
          "HydraulicConductance constant"
        annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                    iconTransformation(extent={{40,-10},{60,10}})));

      Types.RealIO.HydraulicResistanceInput
                               hydraulicresistance annotation (Placement(
            transformation(extent={{-68,-16},{-28,24}}), iconTransformation(extent={
                {-68,-16},{-28,24}})));
    equation
          y=1/hydraulicresistance;   //"signal from HydraulicResistance to HydraulicConductance parameter"
      annotation (defaultComponentName="hydraulicresistancetoconductance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}})), Icon(
            coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=false),
                graphics={
            Rectangle(extent={{-40,40},{40,-40}},
              lineColor={0,0,0},
                  radius=10,
              fillColor={236,236,236},
                              fillPattern=FillPattern.Solid),
            Text(         extent={{-40,10},{40,-10}},
              lineColor={0,0,0},
                  fillColor={236,236,236},
              fillPattern=FillPattern.Solid,
              textString=""),
            Rectangle(
              extent={{-24,7},{2,2}},
              lineThickness=1,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
                pattern=LinePattern.None),
            Polygon(
              points={{28,14},{28,-6},{40,4},{40,4},{28,14}},
              lineThickness=1,
              smooth=Smooth.None,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
                pattern=LinePattern.None),
              Text(
                extent={{-26,34},{4,8}},
                lineColor={0,0,127},
                textString="1"),
              Text(
                extent={{-26,-10},{8,-40}},
                lineColor={0,0,127},
                textString="R"),
              Rectangle(
                extent={{6,14},{20,10}},
                lineColor={0,0,127},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Rectangle(
                extent={{6,-2},{20,-6}},
                lineColor={0,0,127},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid)}));
    end HydraulicResistanceToConductance;
    end RealIO;

    package Constants
      extends Modelica.Icons.Package;
    block HydraulicElastanceConst
     parameter Physiolibrary.Types.HydraulicElastance k "Hydraulic elastance";
          Cardiovascular.Types.RealIO.HydraulicElastanceOutput y(displayUnit=
              "mmHg/ml", nominal=(133.322387415)/(1e-6))
          "HydraulicElastance constant" annotation (Placement(transformation(
                extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},
                  {60,10}})));
    equation
          y=k;
      annotation (defaultComponentName="hydraulicElastance",
                 Diagram(coordinateSystem(extent={{-40,-40},{40,40}},
              preserveAspectRatio=false), graphics),                    Icon(
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
    end Constants;
  end Types;

  package Hydraulic
                     extends Modelica.Icons.Package;
    package Components
                        extends Modelica.Icons.Package;

      model CardiacValve

        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
            Placement(transformation(extent={{-110,-12},{-90,8}}),
              iconTransformation(extent={{-108,-12},{-88,8}})));
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
            Placement(transformation(extent={{90,-10},{110,10}}),
              iconTransformation(extent={{90,-10},{110,10}})));
        Physiolibrary.Types.RealIO.HydraulicConductanceInput backflowConductance
          "conductance of backflow in case of insufficiency" annotation (Placement(
              transformation(extent={{-26,-18},{14,22}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-74,76})));
        Physiolibrary.Hydraulic.Components.IdealValve outflowValve(_Gon(
              displayUnit="ml/(mmHg.min)") = 0.012501026264094, _Goff(
              displayUnit="ml/(mmHg.min)") = 1.2501026264094e-12)
          annotation (Placement(transformation(extent={{-44,32},{-24,52}})));
        Physiolibrary.Hydraulic.Components.IdealValve inflowValve(open(start=
                false)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-36,-38})));
        Physiolibrary.Hydraulic.Components.Conductor outflowBloodResistor(
            useConductanceInput=true) "from Conductor"
          annotation (Placement(transformation(extent={{26,28},{46,48}})));
        Physiolibrary.Hydraulic.Components.Conductor variableBloodConductor(
            useConductanceInput=true)
          annotation (Placement(transformation(extent={{54,-56},{18,-34}})));
        Types.RealIO.HydraulicResistanceInput outflowResistance
          "resistance of flow in normal direction" annotation (Placement(
              transformation(extent={{-38,54},{2,94}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={52,88})));
        Types.RealIO.HydraulicResistanceToConductance
          hydraulicresistancetoconductance
          annotation (Placement(transformation(extent={{16,70},{24,78}})));
      equation
        connect(variableBloodConductor.cond, backflowConductance) annotation (Line(
            points={{36,-38.4},{36,-38.4},{36,2},{-6,2}},
            color={0,0,127},
            smooth=Smooth.Bezier));

        connect(outflowResistance, hydraulicresistancetoconductance.hydraulicresistance)
          annotation (Line(
            points={{-18,74},{6,74},{6,74.4},{15.2,74.4}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(hydraulicresistancetoconductance.y, outflowBloodResistor.cond)
          annotation (Line(
            points={{25,74},{36,74},{36,44}},
            color={0,0,127},
            smooth=Smooth.Bezier));
        connect(outflowValve.q_in, inflow) annotation (Line(
            points={{-44,42},{-72,42},{-72,-2},{-100,-2}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(outflowValve.q_out, outflowBloodResistor.q_in) annotation (Line(
            points={{-24,42},{2,42},{2,38},{26,38}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(outflowBloodResistor.q_out, outflow) annotation (Line(
            points={{46,38},{74,38},{74,0},{100,0}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(outflow, variableBloodConductor.q_in) annotation (Line(
            points={{100,0},{78,0},{78,-45},{54,-45}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(variableBloodConductor.q_out, inflowValve.q_in) annotation (
            Line(
            points={{18,-45},{-4,-45},{-4,-38},{-26,-38}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(inflowValve.q_out, inflow) annotation (Line(
            points={{-46,-38},{-74,-38},{-74,-2},{-100,-2}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),            graphics={
                                         Polygon(
                points={{-72,66},{-72,-82},{38,-10},{38,12},{-62,68},{-72,82},{
                    -72,66}},
                lineColor={0,0,127},
                smooth=Smooth.None,
                fillColor={255,85,85},
                fillPattern=FillPattern.Sphere),Rectangle(
                extent={{44,96},{72,-94}},
                lineColor={0,0,127},
                fillColor={255,85,85},
                fillPattern=FillPattern.Sphere),
              Text(
                extent={{-194,-106},{206,-136}},
                lineColor={0,0,127},
                textString="%name"),
              Rectangle(
                extent={{-64,50},{-14,42}},
                lineColor={0,0,127},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{4,1},{-4,7},{-4,-7},{4,1}},
                lineColor={0,0,127},
                smooth=Smooth.None,
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid,
                origin={-70,47},
                rotation=180),
              Polygon(
                points={{-4,1},{4,7},{4,-7},{-4,1}},
                lineColor={0,0,127},
                smooth=Smooth.None,
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid,
                origin={68,63},
                rotation=180),
              Rectangle(
                extent={{10,68},{60,60}},
                lineColor={0,0,127},
                fillColor={255,255,170},
                fillPattern=FillPattern.Solid)}),  Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
              graphics));
      end CardiacValve;

      model FlowPressureMeasurement
        extends Physiolibrary.Hydraulic.Sensors.FlowMeasure;
          Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
              transformation(extent={{-170,-64},{-130,-24}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,66})));
      //  Physiolibrary.Types.RealIO.FrequencyInput HR "Heart rate " annotation(Placement(transformation(extent = {{-36,28},{4,68}}), iconTransformation(extent = {{-20,-20},{20,20}}, rotation = 270, origin = {0,68})));
        Physiolibrary.Types.RealIO.PressureOutput Ps
          "Systolic pressure during heart cycle"                                            annotation(Placement(transformation(extent = {{-72,-42},{-52,-22}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-80,-30})));
        Physiolibrary.Types.RealIO.PressureOutput Pd
          "Diastolic pressure during heart cycle"                                            annotation(Placement(transformation(extent = {{-50,-40},{-30,-20}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-60,-30})));
        Physiolibrary.Types.RealIO.PressureOutput Pmean
          "Mean pressure during heart cycle"                                               annotation(Placement(transformation(extent = {{-10,-36},{10,-16}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-38,-30})));
        Physiolibrary.Types.RealIO.VolumeOutput SV "systolic volume" annotation(Placement(transformation(extent = {{22,-42},{42,-22}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {30,-30})));
        Physiolibrary.Types.RealIO.VolumeFlowRateOutput CO "Cardiac output" annotation(Placement(transformation(extent = {{50,-40},{70,-20}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {50,-30})));
        Real SumPressure(start = 0) "sum of pressure of cardiac cycle";
        Physiolibrary.Types.Pressure Pmin(start = 200);
        Physiolibrary.Types.Pressure Pmax(start = 0);
        Physiolibrary.Types.Volume Volume(start = 0)
          "sum of volume through cyrdiac cycle";
        Boolean b "event condition";
        Physiolibrary.Types.Time T0 "start of cardiac cycle ";
        discrete Physiolibrary.Types.Time HP "length of cardiac cycle";
      initial equation
        T0 = 0;
        HP = 1 / HR;
        CO = 0;
        SV = 0;
        Ps = 0;
        Pd = 0;
        Pmean = 13300;
      equation
      //    q_out.pressure = q_in.pressure;
      //  actualFlow = q_in.q;
      //  Inflow.q + Outflow.q = 0;
      //  Inflow.pressure = 0;//Outflow.pressure;
        Pmax = max(Pmax, q_in.pressure);
        Pmin = min(Pmin, q_in.pressure);
        b = time - pre(T0) >= pre(HP) "b=true when new cardiac cycle begins";
        when {b} then
          T0 = time "initial time of current cardiac cycle";
          HP = 1 / HR "calculation od time lenght of current cardiac cycle";
          SV = Volume
            "systolic volume is equal of total volume passed through this block";
          CO = SV * HR
            "cardiac output calculation from systolic volume and heart rate (l/min)";
          Pmean = SumPressure / pre(HP)
            "mean pressure (torr) = summ pressure through cardiac cycle divided by length of previous cardiac cycle";
          Ps = Pmax "systolic pressure = maximum pressure during cardiac cycle";
          Pd = Pmin "diastolic pressure=minimal pressure during cardiac cycle";
          reinit(Volume, 0) "reinitialisation of volume";
          reinit(SumPressure, 0) "reinitialisation of sum pressure";
          reinit(Pmax, Pmean)
            "reinitialisation of maximal pressure to mean pressure";
          reinit(Pmin, Pmean)
            "reinitialisation minimal pressure to mean pressure";
        end when;
        der(Volume) = q_in.q;
        der(SumPressure) = q_in.pressure;
        annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,
                  -100},{100,100}}),                                                                     graphics={                                   Text(extent = {{-32,46},{26,32}}, lineColor=
                    {0,128,0},                                                                                                    fillColor=
                    {85,170,255},
                  fillPattern=FillPattern.Solid,
                textString="HR"),                                                                                                    Text(extent={{
                    -52,11},{52,-11}},                                                                                                    lineColor = {0,0,255}, fillColor = {85,170,255},
                  fillPattern =                                                                                                    FillPattern.Solid, origin={
                    -77,30},                                                                                                    rotation = 90, textString = "Ps"),Text(extent={{
                    -53,10},{53,-10}},                                                                                                    lineColor = {0,0,255}, fillColor = {85,170,255},
                  fillPattern =                                                                                                    FillPattern.Solid, origin={
                    -56,31},                                                                                                    rotation = 90, textString = "Pd"),Text(extent={{
                    -55,12},{55,-12}},                                                                                                    lineColor = {0,0,255}, fillColor = {85,170,255},
                  fillPattern =                                                                                                    FillPattern.Solid, origin={
                    -32,35},                                                                                                    rotation = 90, textString = "Pmean"),Text(extent = {{-29,12},{29,-12}}, lineColor = {0,0,255}, fillColor = {85,170,255},
                  fillPattern =                                                                                                    FillPattern.Solid, origin = {34,7}, rotation = 90, textString = "SV"),Text(extent = {{-30,11},{30,-11}}, lineColor = {0,0,255}, fillColor = {85,170,255},
                  fillPattern =                                                                                                    FillPattern.Solid, origin = {55,8}, rotation = 90, textString = "CO")}),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}), graphics));
      end FlowPressureMeasurement;
    end Components;
  end Hydraulic;
  annotation (Documentation(info="<html>
<p>Physiolibraryextension is package containing blocks which was not yet approved to be involved in Physiolibrary. It contains development  input output types as well as a new components to support modeling physiology.</p>
</html>", revisions="<html>
<p>Licensed by Tomas Kulhanek under the Modelica License 2</p>
<p>Copyright &copy; 2014, Tomas Kulhanek, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"), uses(Modelica(version="3.2.1"), Physiolibrary(version="2.1")));
end Cardiovascular;
