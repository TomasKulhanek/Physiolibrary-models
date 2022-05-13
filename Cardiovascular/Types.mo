within Cardiovascular;
package Types
  package Constants
    block FrequencyControl "External signal of type Frequency"
      Physiolibrary.Types.RealIO.FrequencyOutput y
        "HydraulicCompliance constant" annotation (Placement(transformation(
              extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},
                {60,10}})));
      Physiolibrary.Types.RealIO.FrequencyInput c annotation (Placement(
            transformation(extent={{-40,-20},{0,20}}), iconTransformation(
              extent={{-40,-20},{0,20}})));
      parameter Physiolibrary.Types.Frequency k;
      //ignored for this component
      //TODO add switch between constant default signal and input control signal
    equation
      y = c;
      annotation (
        defaultComponentName="hydraulicCompliance",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}})),
        Icon(coordinateSystem(extent={{-40,-40},{40,40}}, preserveAspectRatio=
               false), graphics={Rectangle(
                    extent={{-40,40},{40,-40}},
                    lineColor={0,0,0},
                    radius=10,
                    fillColor={236,236,236},
                    fillPattern=FillPattern.Solid),Text(
                    extent={{-100,-44},{100,-64}},
                    lineColor={0,0,0},
                    fillColor={236,236,236},
                    fillPattern=FillPattern.Solid,
                    textString="%name")}));
    end FrequencyControl;
  end Constants;

  type Area = Modelica.Units.SI.Area(displayUnit="cm2",nominal=1e-4)
    "Type for area";
  type Length = Modelica.Units.SI.Length(displayUnit="cm",nominal=1e-2)
    "Type for length and radius";
  type PulseShape = enumeration(
      pulseless,
      parabolic,
      square) "Reference shape of ECMO pulse";
  type CannulaPlacement = enumeration(
      ascendingAorta,
      aorticArch1,
      aorticArch2,
      thoracicAorta1,
      thoracicAorta2) "Location of inserted ECMO cannula";
  package IO "Real types as input and output connectors"
    import Physiolibrary.Types.*;

    connector HydraulicResistanceInput = input HydraulicResistance
      "Input HydraulicResistance as connector" annotation (
      defaultComponentName="resistance",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
                  fillPattern=FillPattern.Solid)}, coordinateSystem(
          extent={{-100,-100},{100,100}},
          preserveAspectRatio=true,
          initialScale=0.2)),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
                  fillPattern=FillPattern.Solid),Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
    <p>
    Connector with one input signal of type HydraulicResistance.
    </p>
    </html>"));

    connector HydraulicResistanceOutput = output HydraulicResistance
      "Output HydraulicResistance as connector" annotation (
      defaultComponentName="resistance",
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
                  fillPattern=FillPattern.Solid),Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
  <p>
  Connector with one output signal of type HydraulicResistance.
  </p>
  </html>"));

  end IO;
end Types;
