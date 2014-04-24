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

        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_a bloodFlowInflow
          annotation (Placement(transformation(extent={{-110,-12},{-90,8}}),
              iconTransformation(extent={{-108,-12},{-88,8}})));
        Physiolibrary.Hydraulic.Interfaces.HydraulicPort_b bloodFlowOutflow
          annotation (Placement(transformation(extent={{90,-10},{110,10}}),
              iconTransformation(extent={{90,-10},{110,10}})));
        Physiolibrary.Types.RealIO.HydraulicConductanceInput backflowConductance
          "conductance of backflow in case of insufficiency" annotation (Placement(
              transformation(extent={{-26,-18},{14,22}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-74,76})));
        Physiolibrary.Hydraulic.Components.IdealValve outflowValve
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
        connect(outflowBloodResistor.q_out, bloodFlowOutflow) annotation (Line(
            points={{46,38},{72,38},{72,0},{100,0}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(bloodFlowOutflow, variableBloodConductor.q_in) annotation (Line(
            points={{100,0},{78,0},{78,-45},{54,-45}},
            color={0,0,0},
            thickness=1,
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
        connect(bloodFlowInflow, outflowValve.inflow) annotation (Line(
            points={{-100,-2},{-72,-2},{-72,42},{-44,42}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(bloodFlowInflow, inflowValve.outflow) annotation (Line(
            points={{-100,-2},{-73,-2},{-73,-38},{-46,-38}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(inflowValve.inflow, variableBloodConductor.q_out) annotation (
            Line(
            points={{-26,-38},{-4,-38},{-4,-45},{18,-45}},
            color={0,0,0},
            thickness=1,
            smooth=Smooth.Bezier));
        connect(outflowBloodResistor.q_in, outflowValve.outflow) annotation (
            Line(
            points={{26,38},{2,38},{2,42},{-24,42}},
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
