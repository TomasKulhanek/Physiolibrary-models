within PhysiolibraryExtension;
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
            extent={{-24,7},{28,1}},
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
              pattern=LinePattern.None)}));
  end HydraulicResistanceToConductance;
  end RealIO;

  package Constants
    extends Modelica.Icons.Package;
  block HydraulicElastanceConst
      "Obsolete, please use HydraulicCompliance instead!"
   parameter Physiolibrary.Types.HydraulicElastance k "Hydraulic elastance";
        PhysiolibraryExtension.Types.RealIO.HydraulicElastanceOutput
                                         y( displayUnit="mmHg/ml", nominal=(133.322387415)/(1e-6))
        "HydraulicElastance constant"
      annotation (Placement(transformation(extent={{40,-10},{60,10}}),
                  iconTransformation(extent={{40,-10},{60,10}})));
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
