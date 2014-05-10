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
              extent={{-28,3},{20,-4}},
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
                pattern=LinePattern.None),
              Text(
                extent={{-16,30},{12,2}},
                lineColor={0,0,255},
                fillColor={255,240,234},
                fillPattern=FillPattern.Solid,
                textString="1"),
              Text(
                extent={{-22,-10},{16,-32}},
                lineColor={0,0,255},
                fillColor={255,240,234},
                fillPattern=FillPattern.Solid,
                textString="E")}));
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

    block HydraulicComplianceControl
        "Constant signal of type HydraulicCompliance"

          Physiolibrary.Types.RealIO.HydraulicComplianceOutput y
          "HydraulicCompliance constant"
                                       annotation (Placement(transformation(extent={
                {40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,10}})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput c
        annotation (Placement(transformation(extent={{-40,-20},{0,20}}),
            iconTransformation(extent={{-40,-20},{0,20}})));
      parameter Physiolibrary.Types.HydraulicCompliance k; //ignored for this component
    equation
          y=c;
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
                  textString="%name")}));
    end HydraulicComplianceControl;

    block HydraulicConductanceControl
        "External signal of type HydraulicConductance"

          Physiolibrary.Types.RealIO.HydraulicConductanceOutput y
          "HydraulicCompliance constant"
                                       annotation (Placement(transformation(extent={
                {40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,10}})));
      Physiolibrary.Types.RealIO.HydraulicConductanceInput c
        annotation (Placement(transformation(extent={{-40,-20},{0,20}}),
            iconTransformation(extent={{-40,-20},{0,20}})));
      parameter Physiolibrary.Types.HydraulicConductance k; //ignored for this component
      //TODO add switch between constant default signal and input control signal
    equation
          y=c;
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
                  textString="%name")}));
    end HydraulicConductanceControl;

    block FrequencyControl "External signal of type Frequency"

          Physiolibrary.Types.RealIO.FrequencyOutput y
          "HydraulicCompliance constant"
                                       annotation (Placement(transformation(extent={
                {40,-10},{60,10}}), iconTransformation(extent={{40,-10},{60,10}})));
      Physiolibrary.Types.RealIO.FrequencyInput c
        annotation (Placement(transformation(extent={{-40,-20},{0,20}}),
            iconTransformation(extent={{-40,-20},{0,20}})));
      parameter Physiolibrary.Types.Frequency k; //ignored for this component
      //TODO add switch between constant default signal and input control signal
    equation
          y=c;
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
                  textString="%name")}));
    end FrequencyControl;
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

      model BloodFlowMeasurement
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
      end BloodFlowMeasurement;

      model AortaFlowMeasurement
        "measures flow, diastolic, systolic and mean pressure"
        extends Physiolibrary.Hydraulic.Sensors.FlowMeasure;
        Physiolibrary.Types.RealIO.PressureOutput Ps
          "Systolic pressure during heart cycle"                                            annotation(Placement(transformation(extent = {{-72,-42},{-52,-22}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-80,-30})));
        Physiolibrary.Types.RealIO.PressureOutput Pd
          "Diastolic pressure during heart cycle"                                            annotation(Placement(transformation(extent = {{-50,-40},{-30,-20}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-60,-30})));
        Physiolibrary.Types.RealIO.PressureOutput Pmean
          "Mean pressure during heart cycle"                                               annotation(Placement(transformation(extent = {{-10,-36},{10,-16}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {-38,-30})));
        Physiolibrary.Types.RealIO.VolumeOutput SV "systolic volume" annotation(Placement(transformation(extent = {{22,-42},{42,-22}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {30,-30})));
        Physiolibrary.Types.RealIO.VolumeFlowRateOutput CO "Cardiac output" annotation(Placement(transformation(extent = {{50,-40},{70,-20}}), iconTransformation(extent = {{-10,-10},{10,10}}, rotation = 270, origin = {50,-30})));
        Real SumPressure(start = 0) "sum of pressure of cardiac cycle";
        Physiolibrary.Types.Pressure Pmin(start = 13300);
        Physiolibrary.Types.Pressure Pmax(start = 0);
        Physiolibrary.Types.Volume Volume(start = 0)
          "sum of volume through cyrdiac cycle";
        discrete Boolean b "event condition";
        Physiolibrary.Types.Time T0 "start of cardiac cycle ";
        discrete Physiolibrary.Types.Time HP "length of cardiac cycle";
      initial equation
        T0 = 0;
        HP = 1;//1/HR
        CO = 0;
        SV = 0;
        Ps = 0;
        Pd = 0;
        Pmean = 13300;
      //  Pmax=Pmean;//q_in.pressure;
      //  Pmin=Pmean;//q_in.pressure;
      equation

        Pmax = max(Pmax, q_in.pressure);
        Pmin = min(Pmin, q_in.pressure);
        b = der(q_in.pressure)>0;//time - pre(T0) >= pre(HP) "b=true when new cardiac cycle begins";
        when { b and not
                        (pre(b))} then
          T0 = time "initial time of current cardiac cycle";
           if (pre(T0)>0) then
             HP = time-pre(T0);
           else
             HP = 1;
           end if;//1 / HR "calculation of time lenght of current cardiac cycle";
          SV = Volume
            "systolic volume is equal of total volume passed through this block";
          CO = SV / HP
            "cardiac output calculation from systolic volume and heart rate (l/min)";
          Pmean = SumPressure / pre(HP)
            "mean pressure (torr) = summ pressure through cardiac cycle divided by length of previous cardiac cycle";
          Ps = Pmax "systolic pressure = maximum pressure during cardiac cycle";
          Pd = Pmin "diastolic pressure=minimal pressure during cardiac cycle";
          reinit(Volume, 0) "reinitialisation of volume";
          reinit(SumPressure, 0) "reinitialisation of sum pressure";
          reinit(Pmax, q_in.pressure)
            "reinitialisation of maximal pressure to mean pressure";
          reinit(Pmin, q_in.pressure)
            "reinitialisation minimal pressure to mean pressure";
        end when;
        der(Volume) = q_in.q;
        der(SumPressure) = q_in.pressure;
        annotation(Icon(coordinateSystem(preserveAspectRatio=false,   extent={{-100,-100},
                  {100,100}}),                                                                           graphics={                  Text(extent={{
                    -52,11},{52,-11}},                                                                                                    lineColor=
                    {0,0,0},                                                                                                    fillColor=
                    {85,170,255},
                  fillPattern=FillPattern.Solid,                                                                                                    origin={
                    -77,30},                                                                                                    rotation = 90,
                textString="Ps",
                textStyle={TextStyle.Bold}),                                                                                                    Text(extent={{
                    -53,10},{53,-10}},                                                                                                    lineColor=
                    {0,0,0},                                                                                                    fillColor=
                    {85,170,255},
                  fillPattern=FillPattern.Solid,                                                                                                    origin={
                    -56,29},                                                                                                    rotation = 90,
                textString="Pd"),                                                                                                    Text(extent={{
                    -55,12},{55,-12}},                                                                                                    lineColor=
                    {0,0,0},                                                                                                    fillColor=
                    {85,170,255},
                  fillPattern=FillPattern.Solid,                                                                                                    origin={
                    -32,35},                                                                                                    rotation = 90,
                textString="Pmean"),                                                                                                    Text(extent = {{-29,12},{29,-12}}, lineColor=
                    {255,0,0},                                                                                                    fillColor=
                    {85,170,255},
                  fillPattern=FillPattern.Solid,                                                                                                    origin = {34,7}, rotation = 90,
                textString="SV"),                                                                                                    Text(extent = {{-30,11},{30,-11}}, lineColor=
                    {255,0,0},                                                                                                    fillColor=
                    {85,170,255},
                  fillPattern=FillPattern.Solid,                                                                                                    origin = {55,8}, rotation = 90,
                textString="CO")}),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}), graphics));
      end AortaFlowMeasurement;

      partial model PulmonaryCirculation
        extends Physiolibrary.Icons.PulmonaryCirculation;

        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
            Placement(transformation(extent={{-86,68},{-66,88}}), iconTransformation(
                extent={{-108,-12},{-88,8}})));
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
            Placement(transformation(extent={{40,68},{60,88}}), iconTransformation(
                extent={{88,-16},{108,4}})));
        Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
              transformation(extent={{44,46},{64,66}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-52})));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics), Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
      end PulmonaryCirculation;

      partial model SystemicCirculation
        extends Physiolibrary.Icons.SystemicCirculation;
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a inflow annotation (
            Placement(transformation(extent={{52,-36},{72,-16}}), iconTransformation(
                extent={{90,-10},{110,10}})));
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b outflow annotation (
            Placement(transformation(extent={{-100,2},{-80,22}}), iconTransformation(
                extent={{-110,-10},{-90,10}})));
        Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
              transformation(extent={{62,-64},{82,-44}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-52})));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics));
      end SystemicCirculation;

      partial model Heart
        extends Physiolibrary.Icons.Heart;
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a rightHeartInflow
          annotation (Placement(transformation(extent={{-92,18},{-72,38}}),
              iconTransformation(extent={{-72,-26},{-52,-6}})));
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b rightHeartOutflow
          annotation (Placement(transformation(extent={{-30,54},{-10,74}}),
              iconTransformation(extent={{-66,40},{-46,60}})));
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a leftHeartInflow
          annotation (Placement(transformation(extent={{-2,54},{18,74}}),
              iconTransformation(extent={{26,38},{46,58}})));
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b leftHeartOutflow
          annotation (Placement(transformation(extent={{50,16},{70,36}}),
              iconTransformation(extent={{26,-26},{46,-6}})));
        Physiolibrary.Types.RealIO.VolumeOutput volume annotation (Placement(
              transformation(extent={{-32,-4},{-12,16}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-6,-48})));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics), Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
      end Heart;
    end Components;

    package Models
      extends Modelica.Icons.Package;
      model PulmonaryCirculation
        extends Cardiovascular.Hydraulic.Components.PulmonaryCirculation;

        Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeinsAndLeftAtrium(
          volume_start(displayUnit="l") = 0.0004,
          ZeroPressureVolume(displayUnit="l") = 0.0004,
          Compliance(displayUnit="l/mmHg") = 7.5006157584566e-08)
          annotation (Placement(transformation(extent={{12,68},{32,88}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(
          ZeroPressureVolume(displayUnit="l") = 0.00030625,
          Compliance(displayUnit="l/mmHg") = 3.6002955640592e-08,
          volume_start(displayUnit="l") = 0.00038)
          annotation (Placement(transformation(extent={{-54,68},{-34,88}})));
        Physiolibrary.Hydraulic.Components.Conductor
                 pulmonary(Conductance(displayUnit="l/(mmHg.min)") = 4.1665920538226e-08)
          annotation (Placement(transformation(extent={{-22,68},{-2,88}})));

          Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{24,52},{32,60}})));
      equation
        connect(pulmonaryArteries.q_in,pulmonary. q_in) annotation (Line(
            points={{-44,78},{-22,78}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(pulmonary.q_out,pulmonaryVeinsAndLeftAtrium. q_in) annotation (
            Line(
            points={{-2,78},{22,78}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(inflow, pulmonaryArteries.q_in) annotation (Line(
            points={{-76,78},{-44,78}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(outflow, pulmonaryVeinsAndLeftAtrium.q_in) annotation (Line(
            points={{50,78},{22,78}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(add.y, volume) annotation (Line(
            points={{32.4,56},{54,56}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pulmonaryArteries.volume, add.u2) annotation (Line(
            points={{-44,68},{-42,68},{-42,56},{23.2,56},{23.2,53.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pulmonaryVeinsAndLeftAtrium.volume, add.u1) annotation (Line(
            points={{22,68},{22,64},{22,58.4},{23.2,58.4}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics), Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
      end PulmonaryCirculation;

      model SystemicCirculation
        extends Cardiovascular.Hydraulic.Components.SystemicCirculation;
        Physiolibrary.Hydraulic.Components.ElasticVessel arteries(
          volume_start(displayUnit="l") = 0.00085,
          ZeroPressureVolume(displayUnit="l") = 0.000495,
          Compliance(displayUnit="l/mmHg") = 2.6627185942521e-08)
          annotation (Placement(transformation(extent={{24,-36},{44,-16}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel veins(
          Compliance(displayUnit="l/mmHg") = 6.1880080007267e-07,
          volume_start(displayUnit="l") = 0.00325,
          ZeroPressureVolume(displayUnit="l") = 0.00295)
          annotation (Placement(transformation(extent={{-54,-36},{-34,-16}})));
        Physiolibrary.Hydraulic.Components.Conductor
                 nonMuscle(Conductance(displayUnit="l/(mmHg.min)") = 3.5627924852669e-09)
          annotation (Placement(transformation(extent={{-14,-36},{6,-16}})));
        Physiolibrary.Hydraulic.Components.Conductor
                 kidney(Conductance(displayUnit="l/(mmHg.min)") = 1.4126159678427e-09)
          annotation (Placement(transformation(extent={{-14,-54},{6,-34}})));
        Physiolibrary.Hydraulic.Components.Conductor
                 muscle(Conductance(displayUnit="l/(mmHg.min)") = 1.3001067314658e-09)
          annotation (Placement(transformation(extent={{-14,-18},{6,2}})));
        Physiolibrary.Hydraulic.Components.Conductor
                 largeVeins(Conductance(displayUnit="l/(mmHg.min)") = 1.6888886482791e-07)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-74,2})));

        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{42,-58},{50,-50}})));
      equation
        connect(veins.q_in,nonMuscle. q_in)  annotation (Line(
            points={{-44,-26},{-14,-26}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(nonMuscle.q_out,arteries. q_in)  annotation (Line(
            points={{6,-26},{34,-26}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(muscle.q_out,arteries. q_in) annotation (Line(
            points={{6,-8},{20,-8},{20,-26},{34,-26}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(kidney.q_out,arteries. q_in) annotation (Line(
            points={{6,-44},{20,-44},{20,-26},{34,-26}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(kidney.q_in,nonMuscle. q_in) annotation (Line(
            points={{-14,-44},{-24,-44},{-24,-26},{-14,-26}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(muscle.q_in,nonMuscle. q_in) annotation (Line(
            points={{-14,-8},{-24,-8},{-24,-26},{-14,-26}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(veins.q_in,largeVeins. q_out) annotation (Line(
            points={{-44,-26},{-74,-26},{-74,-8}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(arteries.q_in, inflow) annotation (Line(
            points={{34,-26},{62,-26}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(largeVeins.q_in, outflow) annotation (Line(
            points={{-74,12},{-90,12}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(arteries.volume, add.u1) annotation (Line(
            points={{34,-36},{34,-51.6},{41.2,-51.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(veins.volume, add.u2) annotation (Line(
            points={{-44,-36},{-44,-56.4},{41.2,-56.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(add.y, volume) annotation (Line(
            points={{50.4,-54},{60,-54},{60,-54},{72,-54}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics));
      end SystemicCirculation;

      model Heart
        extends Cardiovascular.Hydraulic.Components.Heart;
        Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure
          annotation (Placement(transformation(extent={{-68,36},{-48,56}})));
        Physiolibrary.Hydraulic.Components.Pump rightHeart(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{-46,18},{-26,38}})));
        Physiolibrary.Types.Constants.VolumeFlowRateConst RNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
          annotation (Placement(transformation(extent={{-50,50},{-42,58}})));
        Physiolibrary.Hydraulic.Sensors.PressureMeasure pressureMeasure1
          annotation (Placement(transformation(extent={{2,36},{22,56}})));
        Physiolibrary.Hydraulic.Components.Pump leftHeart(useSolutionFlowInput=true)
          annotation (Placement(transformation(extent={{26,16},{46,36}})));
        Physiolibrary.Types.Constants.VolumeFlowRateConst LNormalCO(k(displayUnit="l/min") = 8.3333333333333e-05)
          annotation (Placement(transformation(extent={{22,52},{30,60}})));
        Physiolibrary.Hydraulic.Components.ElasticVessel rightAtrium(
          volume_start(displayUnit="l") = 0.0001,
          ZeroPressureVolume(displayUnit="l") = 0.0001,
          Compliance(displayUnit="l/mmHg") = 3.7503078792283e-08)
          annotation (Placement(transformation(extent={{-70,18},{-50,38}})));
        Physiolibrary.Blocks.Factors.Spline       rightStarling(data={{-6,0,0},{-3,0.15,0.104},{-1,0.52,
              0.48},{2,1.96,0.48},{4,2.42,0.123},{8,2.7,0}})
          "At filling pressure 0mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
          annotation (Placement(transformation(extent={{-46,32},{-26,52}})));
        Physiolibrary.Blocks.Factors.Spline       leftStarling(data={{-4,0,0},{-1,
              0.72,0.29},{0,1.01,0.29},{3,1.88,0.218333},{10,2.7,0}})
          "At filling pressure -0.0029mmHg (because external thorax pressure is -4mmHg) is normal cardiac output (effect=1)."
          annotation (Placement(transformation(extent={{26,32},{46,52}})));
      equation
        connect(pressureMeasure.q_in,rightHeart. q_in) annotation (Line(
            points={{-62,40},{-62,28},{-46,28}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightAtrium.q_in,rightHeart. q_in) annotation (Line(
            points={{-60,28},{-46,28}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(RNormalCO.y,rightStarling. yBase) annotation (Line(
            points={{-41,54},{-36,54},{-36,44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureMeasure.actualPressure,rightStarling. u) annotation (Line(
            points={{-52,42},{-44,42}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(LNormalCO.y,leftStarling. yBase) annotation (Line(
            points={{31,56},{36,56},{36,44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureMeasure1.actualPressure,leftStarling. u) annotation (Line(
            points={{18,42},{28,42}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pressureMeasure.q_in,rightAtrium. q_in) annotation (Line(
            points={{-62,40},{-62,28},{-60,28}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightHeart.solutionFlow,rightStarling. y) annotation (Line(
            points={{-36,32},{-36,38}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(leftStarling.y,leftHeart. solutionFlow) annotation (Line(
            points={{36,38},{36,30}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(leftHeart.q_out, leftHeartOutflow) annotation (Line(
            points={{46,26},{60,26}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightHeart.q_out, rightHeartOutflow) annotation (Line(
            points={{-26,28},{-20,28},{-20,64}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(leftHeartInflow, pressureMeasure1.q_in) annotation (Line(
            points={{8,64},{8,40}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightHeartInflow, rightAtrium.q_in) annotation (Line(
            points={{-82,28},{-60,28}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(leftHeartInflow, leftHeart.q_in) annotation (Line(
            points={{8,64},{8,26},{26,26}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.None));
        connect(rightAtrium.volume, volume) annotation (Line(
            points={{-60,18},{-60,6},{-22,6}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics), Diagram(coordinateSystem(
                preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
      end Heart;

      model CardiovascularSystem

        replaceable Heart
              heart annotation (Placement(transformation(extent={{-12,-12},{8,8}})));
        replaceable SystemicCirculation
                            systemicCirculation
          annotation (Placement(transformation(extent={{-12,-34},{8,-14}})));
        replaceable PulmonaryCirculation
                             pulmonaryCirculation
          annotation (Placement(transformation(extent={{-12,12},{8,32}})));
      equation
        connect(systemicCirculation.inflow, heart.leftHeartOutflow) annotation (Line(
            points={{8,-24},{16,-24},{16,-3.6},{1.6,-3.6}},
            color={190,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(heart.leftHeartInflow, pulmonaryCirculation.outflow)
          annotation (Line(
            points={{1.6,2.8},{16,2.8},{16,21.4},{7.8,21.4}},
            color={190,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(systemicCirculation.outflow, heart.rightHeartInflow) annotation (Line(
            points={{-12,-24},{-20,-24},{-20,-3.6},{-8.2,-3.6}},
            color={190,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(heart.rightHeartOutflow, pulmonaryCirculation.inflow) annotation (
            Line(
            points={{-7.6,3},{-18,3},{-18,21.8},{-11.8,21.8}},
            color={190,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        annotation(Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-20,-40},
                  {20,40}}),                                                                                   graphics), Icon(
              coordinateSystem(extent={{-20,-40},{20,40}},  preserveAspectRatio=false),
              graphics={Bitmap(extent={{-30,38},{30,-36}},
                                                         fileName=
                    "modelica://MeursModel/Resources/Icons/cvsconcept.png")}),
          Documentation(info="<html>
<p>Cardiovascular subsystem in famous Guyton-Coleman-Granger model from 1972. </p>
<p><br>Model, all parameters and all initial values are from article: </p>
<p>A.C. Guyton, T.G. Coleman, H.J. Granger (1972). &QUOT;Circulation: overall regulation.&QUOT; Annual review of physiology 34(1): 13-44.</p>
</html>"));
      end CardiovascularSystem;

      model CVS_Steady
        extends CardiovascularSystem(
          pulmonaryCirculation(pulmonaryArteries(Simulation=Physiolibrary.Types.SimulationType.InitSteadyState),
              pulmonaryVeinsAndLeftAtrium(Simulation=Physiolibrary.Types.SimulationType.InitSteadyState)),
          heart(rightAtrium(isDependent=true, Simulation=Physiolibrary.Types.SimulationType.InitSteadyState)),
          systemicCirculation(veins(Simulation=Physiolibrary.Types.SimulationType.InitSteadyState),
              arteries(Simulation=Physiolibrary.Types.SimulationType.InitSteadyState)));

        Physiolibrary.SteadyStates.Components.MassConservationLaw
          massConservationLaw(
          n=3,
          Simulation=Physiolibrary.Types.SimulationType.InitSteadyState,
          Total=0.005)
          annotation (Placement(transformation(extent={{26,-6},{40,10}})));
      equation
        connect(systemicCirculation.volume, massConservationLaw.fragment[1])
          annotation (Line(
            points={{-2,-29.2},{-2,-32},{26,-32},{26,-2.26667}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(heart.volume, massConservationLaw.fragment[2]) annotation (Line(
            points={{-2.6,-6.8},{-2.6,-10},{18,-10},{18,-1.2},{26,-1.2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(pulmonaryCirculation.volume, massConservationLaw.fragment[3])
          annotation (Line(
            points={{-2,16.8},{-2,10},{26,10},{26,-0.133333}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-40,
                  -60},{40,60}}), graphics), Documentation(info="<html>
<p>Steady state model extension of Cardiovascular subsystem in famous Guyton-Coleman-Granger model from 1972. </p>
</html>"));
      end CVS_Steady;
    end Models;
  end Hydraulic;
  annotation (Documentation(info="<html>
<p>Physiolibraryextension is package containing blocks which was not yet approved to be involved in Physiolibrary. It contains development  input output types as well as a new components to support modeling physiology.</p>
</html>", revisions="<html>
<p>Licensed by Tomas Kulhanek under the Modelica License 2</p>
<p>Copyright &copy; 2014, Tomas Kulhanek, Charles University in Prague.</p>
<p><br/><i>This Modelica package is&nbsp;<u>free</u>&nbsp;software and the use is completely at&nbsp;<u>your own risk</u>; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see&nbsp;<a href=\"modelica://Physiolibrary.UsersGuide.ModelicaLicense2\">Physiolibrary.UsersGuide.ModelicaLicense2</a>&nbsp;or visit&nbsp;<a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a>.</i></p>
</html>"), uses(Modelica(version="3.2.1"), Physiolibrary(version="2.1.1")));
  package Blocks
  extends Modelica.Icons.Package;
    package Interpolation
      extends Modelica.Icons.Package;
          model Curve
        "2D natural cubic interpolation spline defined with (x,y,slope) points"
            //workaround for openmodelica error: Cyclically dependent constants or parameters found in scope Physiolibrary.Blocks.Interpolation.Curve: {data,x}, {data,y}, {data,slope}.
               //Error: Error occurred while flattening model Physiolibrary.Blocks.Interpolation.Curve

               parameter Real x[:] "x coordinations of interpolating points";
               parameter Real y[:] "y coordinations of interpolating points";
               parameter Real slope[:] "slopes at interpolating points";

               Modelica.Blocks.Interfaces.RealInput u
                            annotation (Placement(transformation(extent={{-120,
                  -20},{-80,20}})));
               Modelica.Blocks.Interfaces.RealOutput val
                               annotation (Placement(transformation(extent={{80,-20},
                  {120,20}})));

      protected
              parameter Real a[:,:] = Physiolibrary.Blocks.Interpolation.SplineCoefficients(
                                                          x,y,slope)
          "cubic polynom coefficients of curve segments between interpolating points";

          equation
            val = Physiolibrary.Blocks.Interpolation.Spline(
              x,
              a,
              u);

             annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),      graphics), Icon(coordinateSystem(
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
  end Blocks;
end Cardiovascular;
