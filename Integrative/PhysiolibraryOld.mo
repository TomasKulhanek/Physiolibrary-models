within ;
package PhysiolibraryOld "Physiological domains library"
  extends PhysiolibraryOld.Icons.GolemLib;

  package Interfaces "Abstract Interfaces"
    partial model BaseModel
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 127, 0}, fillColor=  {215, 215, 215}, fillPattern=  FillPattern.Sphere), Text(extent=  {{-100, -74}, {100, -52}}, lineColor=  {0, 0, 177}, fillPattern=  FillPattern.VerticalCylinder, fillColor=  {215, 215, 215}, textString=  "%name")}), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end BaseModel;

    partial model BaseFactorIcon
      RealInput_ yBase annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {6, 80}), iconTransformation(extent = {{-10, 10}, {10, 30}}, rotation = -90)));
      RealOutput_ y annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, -60}), iconTransformation(extent = {{-10, -30}, {10, -10}}, rotation = -90)));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 20}, {100, -20}}, lineColor=  {95, 95, 95}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Sphere), Text(extent=  {{-90, -10}, {92, 10}}, textString=  "%name", lineColor=  {0, 0, 0})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end BaseFactorIcon;

    partial model BaseFactorIcon2
      RealInput_ yBase annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {6, 100}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, 50})));
      RealOutput_ y annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, -80}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -52})));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 50}, {100, -50}}, lineColor=  {0, 127, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Sphere), Text(extent=  {{-86, -36}, {100, 40}}, textString=  "%name", lineColor=  {0, 0, 0}, fillPattern=  FillPattern.Sphere)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end BaseFactorIcon2;

    partial model BaseFactorIcon3
      RealInput_ yBase annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {6, 80}), iconTransformation(extent = {{-10, 10}, {10, 30}}, rotation = -90)));
      RealOutput_ y annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, -60}), iconTransformation(extent = {{-10, -30}, {10, -10}}, rotation = -90)));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 20}, {100, -20}}, lineColor=  {0, 127, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Sphere), Text(extent=  {{-90, -10}, {92, 10}}, textString=  "%name", lineColor=  {0, 0, 0})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end BaseFactorIcon3;

    partial model BaseFactorIcon4
      RealInput_ yBase annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {6, 80}), iconTransformation(extent = {{-10, 10}, {10, 30}}, rotation = -90)));
      RealOutput_ y annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, -60}), iconTransformation(extent = {{-10, -30}, {10, -10}}, rotation = -90)));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 20}, {100, -20}}, lineColor=  {127, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Sphere), Text(extent=  {{-90, -10}, {92, 10}}, textString=  "%name", lineColor=  {0, 0, 0})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end BaseFactorIcon4;

    partial model BaseFactorIcon5
      RealInput_ yBase annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {6, 80}), iconTransformation(extent = {{-10, 10}, {10, 30}}, rotation = -90)));
      RealOutput_ y annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, -60}), iconTransformation(extent = {{-10, -30}, {10, -10}}, rotation = -90)));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 20}, {100, -20}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Sphere), Text(extent=  {{-90, -10}, {92, 10}}, textString=  "%name", lineColor=  {0, 0, 0})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end BaseFactorIcon5;

    partial connector SignalBusBlue "Icon for signal bus"
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.2), graphics = {Rectangle(extent=  {{-20, 2}, {20, -2}}, lineColor=  {255, 204, 51}, lineThickness=  0.5), Polygon(points=  {{-80, 50}, {80, 50}, {100, 30}, {80, -40}, {60, -50}, {-60, -50}, {-80, -40}, {-100, 30}, {-80, 50}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid), Ellipse(extent=  {{-65, 25}, {-55, 15}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid), Ellipse(extent=  {{-5, 25}, {5, 15}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid), Ellipse(extent=  {{55, 25}, {65, 15}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid), Ellipse(extent=  {{-35, -15}, {-25, -25}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid), Ellipse(extent=  {{25, -15}, {35, -25}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.2), graphics = {Polygon(points=  {{-40, 25}, {40, 25}, {50, 15}, {40, -20}, {30, -25}, {-30, -25}, {-40, -20}, {-50, 15}, {-40, 25}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid), Ellipse(extent=  {{-32.5, 7.5}, {-27.5, 12.5}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid), Ellipse(extent=  {{-2.5, 12.5}, {2.5, 7.5}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid), Ellipse(extent=  {{27.5, 12.5}, {32.5, 7.5}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid), Ellipse(extent=  {{-17.5, -7.5}, {-12.5, -12.5}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid), Ellipse(extent=  {{12.5, -7.5}, {17.5, -12.5}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid), Text(extent=  {{-150, 70}, {150, 40}}, lineColor=  {0, 0, 0}, textString=  "%name")}), Documentation(info = "<html>
      <p>
      This icon is designed for a <b>signal bus</b> connector.
      </p>
      </html>"));
    end SignalBusBlue;

    connector RealInput = input Real "'input Real' as connector" annotation(defaultComponentName = "u", Icon(graphics = {Polygon(points=  {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid), Text(extent=  {{98, -50}, {724, 58}}, lineColor=  {0, 0, 127}, textString=  "%name")}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)), Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points=  {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid), Text(extent=  {{-10, 85}, {-10, 60}}, lineColor=  {0, 0, 127}, textString=  "%name")}), Documentation(info = "<html>
                                          <p>
                                          Connector with one input signal of type Real.
                                          </p>
                                          </html>"));
    connector RealInput_ = input Real "'input Real' as connector" annotation(defaultComponentName = "u", Icon(graphics = {Polygon(points=  {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)), Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points=  {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid), Text(extent=  {{-10, 85}, {-10, 60}}, lineColor=  {0, 0, 127}, textString=  "%name")}), Documentation(info = "<html>
                                          <p>
                                          Connector with one input signal of type Real.
                                          </p>
                                          </html>"));
    connector RealOutput = output Real "'output Real' as connector" annotation(defaultComponentName = "u", Icon(graphics = {Polygon(points=  {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-690, -58}, {-100, 60}}, lineColor=  {0, 0, 127}, textString=  "%name")}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)), Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points=  {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-10, 85}, {-10, 60}}, lineColor=  {0, 0, 127}, textString=  "%name")}), Documentation(info = "<html>
                                          <p>
                                          Connector with one input signal of type Real.
                                          </p>
                                          </html>"));
    connector RealOutput_ = output Real "'output Real' as connector" annotation(defaultComponentName = "u", Icon(graphics = {Polygon(points=  {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)), Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points=  {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-100, -50}, {358, -92}}, lineColor=  {0, 0, 255}, textString=  "%name")}), Documentation(info = "<html>
                                          <p>
                                          Connector with one input signal of type Real.
                                          </p>
                                          </html>"));
    connector BooleanInput = input Boolean "'input Boolean' as connector" annotation(defaultComponentName = "u", Icon(graphics = {Polygon(points=  {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor=  {255, 0, 255}, fillColor=  {255, 0, 255}, fillPattern=  FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)), Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points=  {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor=  {255, 0, 255}, fillColor=  {255, 0, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-10, 85}, {-10, 60}}, lineColor=  {255, 0, 255}, textString=  "%name")}), Documentation(info = "<html>
                                          <p>
                                          Connector with one input signal of type Boolean.
                                          </p>
                                          </html>"));
    connector BooleanOutput = output Boolean "'output Boolean' as connector" annotation(defaultComponentName = "u", Icon(graphics = {Polygon(points=  {{-100, 100}, {100, 0}, {-100, -100}, {-100, 100}}, lineColor=  {255, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid)}, coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.2)), Diagram(coordinateSystem(preserveAspectRatio = true, initialScale = 0.2, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points=  {{0, 50}, {100, 0}, {0, -50}, {0, 50}}, lineColor=  {255, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-10, 85}, {-10, 60}}, lineColor=  {255, 0, 255}, textString=  "%name")}), Documentation(info = "<html>
                                          <p>
                                          Connector with one input signal of type Boolean.
                                          </p>
                                          </html>"));

    partial block SIMO "Single Input Multiple Output continuous control block"
      parameter Integer nout = 1 "Number of outputs";
      Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal" annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y[nout]
        "Connector of Real output signals"                                             annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
      annotation(Documentation(info = "<HTML>
      <p> Block has one continuous Real input signal and a
          vector of continuous Real output signals.</p>
       
      </HTML>
      "), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid)}));
    end SIMO;

    partial block SISO "Single Input Single Output continuous control block"
      Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signals" annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
                                                                                annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
      annotation(Documentation(info = "<HTML>
      <p>
      Block has a vector of continuous Real input signals and
      one continuous Real output signal.
      </p>
      </HTML>
      "), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid)}));
    end SISO;

    partial class ConversionIcon "Base icon for conversion functions"
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {191, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Line(points=  {{-74, 0}, {30, 0}}, color=  {191, 0, 0}), Polygon(points=  {{80, 0}, {20, 20}, {20, -20}, {80, 0}}, lineColor=  {191, 0, 0}, fillColor=  {191, 0, 0}, fillPattern=  FillPattern.Solid)}));
    end ConversionIcon;

    expandable connector BusConnector
      "Empty control bus that is adapted to the signals connected to it"
      extends PhysiolibraryOld.Interfaces.SignalBusBlue;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-20, 2}, {22, -2}}, lineColor=  {0, 0, 255}, lineThickness=  0.5)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(info = "<html>
      <p>
      This connector defines the \"expandable connector\" ControlBus that
      is used as bus in the
      <a href=\"Modelica://Modelica.Blocks.Examples.BusUsage\">BusUsage</a> example.
      Note, this connector is \"empty\". When using it, the actual content is
      constructed by the signals connected to this bus.
      </p>
      </html>"));
    end BusConnector;
  end Interfaces;

  package Blocks "Base Signal Blocks Library"
    block BooleanConstant "Generate constant signal of type Boolean"
      parameter Boolean k = true "Constant output value";
      extends Modelica.Blocks.Interfaces.partialBooleanSource;
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Line(points=  {{-80, 0}, {80, 0}}, color=  {0, 0, 0}), Text(extent=  {{-150, -140}, {150, -110}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Line(points=  {{-70, 0}, {80, 0}}, color=  {0, 0, 255}, thickness=  0.5), Text(extent=  {{-69, 20}, {-49, 0}}, lineColor=  {0, 0, 0}, fillColor=  {95, 95, 95}, fillPattern=  FillPattern.Solid, textString=  "k"), Text(extent=  {{-96, 6}, {-76, -4}}, lineColor=  {0, 0, 0}, fillColor=  {95, 95, 95}, fillPattern=  FillPattern.Solid, textString=  "true"), Text(extent=  {{-98, -58}, {-72, -68}}, lineColor=  {0, 0, 0}, fillColor=  {95, 95, 95}, fillPattern=  FillPattern.Solid, textString=  "false")}), Documentation(info = "<html>
      <p>
      The Boolean output y is a constant signal:
      </p>
       
      <p>
      <img src=\"../Images/Blocks/Sources/BooleanConstant.png\">
      </p>
      </html>"));
    end BooleanConstant;

    block Parts "Divide the input value by weights"
      extends PhysiolibraryOld.Interfaces.SIMO;
      parameter Real w[nout] = ones(nout) "Optional: weight coeficients";
    protected
      Real coef;
      Real weight[nout];
    equation
      ones(nout) * weight = 1;
      for i in 1:nout loop
        weight[i] = w[i] * coef;
        y[i] = u * weight[i];
      end for;
      annotation(defaultComponentName = "parts1", Documentation(info = "
      <HTML>
      <p>
      This blocks divide input value <b>y</b> to
      <i>outputs</i> by weights. The sum of output values is equal to input value.
      <b>u</b>:
      </p>
      <pre>
          <b>y</b> = (<b>u</b>[1] + <b>u</b>[2] + ... + <b>u</b>[n]) / n;
      </pre>
      <p>
      Example:
      </p>
      <pre>
           parameter:   nin = 3;
       
        results in the following equations:
       
           y = (u[1] + u[2] + u[3]) / 3;
      </pre>
       
      </HTML>
      "), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "Parts")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 255}, textString=  "AVG")}));
    end Parts;

    block Add "Output the addition of a value with the input signal"
      parameter Real k(start = 1) "value added to input signal";
    public
      Modelica.Blocks.Interfaces.RealInput u "Input signal connector" annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y "Output signal connector" annotation(Placement(transformation(extent = {{100, -10}, {120, 10}}, rotation = 0)));
    equation
      y = k + u;
      annotation(Documentation(info = "
      <HTML>
      <p>
      This block computes output <i>y</i> as
      <i>product</i> of gain <i>k</i> with the
      input <i>u</i>:
      </p>
      <pre>
          y = k * u;
      </pre>
       
      </HTML>
      "), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Polygon(points=  {{-100, -100}, {-100, 100}, {100, 0}, {-100, -100}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-98, -52}, {30, 34}}, lineColor=  {0, 0, 0}, textString=  "%k+u"), Text(extent=  {{-150, 140}, {150, 100}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Polygon(points=  {{-100, -100}, {-100, 100}, {100, 0}, {-100, -100}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-76, 38}, {0, -34}}, lineColor=  {0, 0, 255}, textString=  "k")}));
    end Add;

    block Pow "the power of parameter"
      extends PhysiolibraryOld.Interfaces.SISO;
      parameter Real power_base = 10 "base";
    equation
      y = power_base ^ u;
      annotation(defaultComponentName = "avg1", Documentation(info = "
      <HTML>
      <p>
      This blocks computes output <b>y</b> as
      <i>average value</i> of the elements of the input signal vector
      <b>u</b>:
      </p>
      <pre>
          <b>y</b> = (<b>u</b>[1] + <b>u</b>[2] + ... + <b>u</b>[n]) / n;
      </pre>
      <p>
      Example:
      </p>
      <pre>
           parameter:   nin = 3;
       
        results in the following equations:
       
           y = (u[1] + u[2] + u[3]) / 3;
      </pre>
       
      </HTML>
      "), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Text(extent=  {{-100, -40}, {100, 40}}, lineColor=  {0, 0, 0}, textString=  "%power_base^u")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Rectangle(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-100, -46}, {100, 52}}, lineColor=  {0, 0, 255}, textString=  "Pow")}));
    end Pow;

    block Inv "Output the inverse value of the input"
      extends Modelica.Blocks.Interfaces.SISO;
    equation
      y = 1 / u;
      annotation(defaultComponentName = "inv1", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 0}, textString=  "1/u")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics), Documentation(info = "<HTML>
      <p>
      This blocks computes the output <b>y</b>
      as <i>inverse value</i> of the input <b>u</b>:
      </p>
      <pre>
          y = 1 / u ;
      </pre>
       
      </HTML>
      "));
    end Inv;

    block MultiProduct "Output the product of the elements of the input vector"
      extends Modelica.Blocks.Interfaces.MISO;
    equation
      y = product(u);
      annotation(defaultComponentName = "product1", Documentation(info = "
      <HTML>
      <p>
      This blocks computes output <b>y</b> as
      <i>product</i> of the elements of the input signal vector
      <b>u</b>:
      </p>
      <pre>
          <b>y</b> = <b>u</b>[1] * <b>u</b>[2] * ...;
      </pre>
      <p>
      Example:
      </p>
      <pre>
           parameter:   nin = 3;

        results in the following equations:

           y = u[1] * u[2] * u[3];
      </pre>

      </HTML>
      "), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-150, 150}, {150, 110}}, textString=  "%name", lineColor=  {0, 0, 255}), Line(points=  {{56, 38}, {-48, 38}, {-10, 38}, {-10, -42}, {-10, -42}}, color=  {0, 0, 0}, thickness=  0.25), Line(points=  {{16, 38}, {16, -44}}, color=  {0, 0, 0}, smooth=  Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Line(points=  {{26, 42}, {-34, 42}, {-10, 42}, {-10, -38}, {-10, -38}}, color=  {0, 0, 0}, thickness=  0.25), Line(points=  {{0, 42}, {0, -38}}, color=  {0, 0, 0}, smooth=  Smooth.None)}));
    end MultiProduct;

    block Log10AsEffect
      "Output the base 10 logarithm of the input > 1, or 0 otherwise"
      extends Modelica.Blocks.Interfaces.SISO;
    equation
      y = if u > 1 then Modelica.Math.log10(u) else 0;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Polygon(points=  {{90, 0}, {68, 8}, {68, -8}, {90, 0}}, lineColor=  {192, 192, 192}, fillColor=  {192, 192, 192}, fillPattern=  FillPattern.Solid), Line(points=  {{-90, 0}, {68, 0}}, color=  {192, 192, 192}), Polygon(points=  {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}, lineColor=  {192, 192, 192}, fillColor=  {192, 192, 192}, fillPattern=  FillPattern.Solid), Line(points=  {{-80, -80}, {-80, 68}}, color=  {192, 192, 192}), Text(extent=  {{-44, -56}, {94, -80}}, lineColor=  {192, 192, 192}, textString=  "max(log10,0)"), Line(points=  {{-100, 0}, {-80, 0}, {-78, 0}, {-74, 0}, {-76, 0}, {-74, 0}, {-72, 0}, {-69.5, 6.08}, {-64.7, 15.9}, {-57.5, 26}, {-47, 36.1}, {-31.8, 46.1}, {-10.1, 56}, {22.1, 66}, {68.7, 76.09999999999999}, {80, 78}}, color=  {0, 0, 0})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Line(points=  {{-80, 80}, {-88, 80}}, color=  {192, 192, 192}), Line(points=  {{-80, -80}, {-88, -80}}, color=  {192, 192, 192}), Line(points=  {{-80, -90}, {-80, 84}}, color=  {192, 192, 192}), Text(extent=  {{-65, 96}, {-38, 78}}, lineColor=  {160, 160, 164}, textString=  "y"), Polygon(points=  {{-80, 100}, {-86, 84}, {-74, 84}, {-80, 100}}, lineColor=  {192, 192, 192}, fillColor=  {192, 192, 192}, fillPattern=  FillPattern.Solid), Line(points=  {{-100, 0}, {84, 0}}, color=  {192, 192, 192}), Polygon(points=  {{100, 0}, {84, 6}, {84, -6}, {100, 0}}, lineColor=  {192, 192, 192}, fillColor=  {192, 192, 192}, fillPattern=  FillPattern.Solid), Line(points=  {{-100, 0}, {-80, 0}, {-78, 0}, {-74, 0}, {-76, 0}, {-74, 0}, {-72, 0}, {-69.5, 6.08}, {-64.7, 15.9}, {-57.5, 26}, {-47, 36.1}, {-31.8, 46.1}, {-10.1, 56}, {22.1, 66}, {68.7, 76.09999999999999}, {80, 78}}, color=  {0, 0, 0}), Text(extent=  {{70, -3}, {90, -23}}, textString=  "20", lineColor=  {0, 0, 255}), Text(extent=  {{-78, -1}, {-58, -21}}, textString=  "1", lineColor=  {0, 0, 255}), Text(extent=  {{-109, 72}, {-89, 88}}, textString=  " 1.3", lineColor=  {0, 0, 255}), Text(extent=  {{-109, -88}, {-89, -72}}, textString=  "-1.3", lineColor=  {0, 0, 255}), Text(extent=  {{62, 30}, {90, 10}}, lineColor=  {160, 160, 164}, textString=  "u")}), Documentation(info = "<HTML>
      <p>
      This blocks computes the output <b>y</b> as the
      <i>base 10 logarithm</i> of the input <b>u</b>:
      </p>
      <pre>
          y = <b>log10</b>( u );
      </pre>
      <p>
      An error occurs if the elements of the input <b>u</b> are
      zero or negative.
      </p>

      <p>
      <img src=\"../Images/Math/log10.png\">
      </p>

      </HTML>
      "));
    end Log10AsEffect;

    block Constant "Generate constant signal of type Real"
      parameter Real k(start = 1) "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Rectangle(extent=  {{-100, 100}, {100, -80}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, -32}, {100, 46}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-168, -96}, {180, -130}}, lineColor=  {0, 0, 255}, textString=  "%name")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end Constant;

    block FractConstant "Generate constant signal in part from 1"
      parameter Real k(start = 1, final unit = "%") "Part in percent";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final unit="1")
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k / 100;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-94, -50}, {94, 56}}, lineColor=  {0, 0, 0}, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid, textString=  "%k%%")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end FractConstant;

    block Fract2Constant
      "Generate constant signal y as part on interval <0,1> and signal 1-y"
      parameter Real k(start = 1, final unit = "%") "Part in percent";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final unit="1")
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0), iconTransformation(
              extent={{100,48},{120,68}})));
      PhysiolibraryOld.Interfaces.RealOutput_ y2(final unit="1")
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0), iconTransformation(
              extent={{100,-62},{120,-42}})));
    equation
      y = k / 100;
      y2 = 1 - y;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 2}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k %%"), Text(extent=  {{-100, -100}, {100, -2}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "100-%k %%")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end Fract2Constant;

    block PressureConstant "Generate constant signal of type Pressure_mmHg"
      parameter Real k(start = 1, final quantity = "Pressure", final unit = "mmHg")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Pressure",
          final unit="mmHg") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      /*connect(y, y) annotation (Line(
                                              points={{110,0},{110,0}},
                                              color={0,0,127},
                                              smooth=Smooth.None)); */
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, -6}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-98, -82}, {98, -20}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "mmHg")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end PressureConstant;

    block VolumeConstant "Generate constant signal of type Volume_ml"
      parameter Real k(start = 1, final quantity = "Volume", final unit = "ml")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Volume", final
          unit="ml") "Connector of Real output signal" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k ml")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end VolumeConstant;

    block OsmolarityConstant "Generate constant signal of type mOsm"
      parameter Real k(start = 1, final quantity = "Osmolarity", final unit = "mOsm")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Osmolarity",
          final unit="mOsm") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-98, 6}, {100, 86}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -80}, {100, -18}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "mOsm")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end OsmolarityConstant;

    block TemperatureConstant
      "Generate constant signal of type temperature in Celsius degrees"
      parameter Real k(start = 1, final quantity = "Temperature", final unit = "degC")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Temperature",
          final unit="degC") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k °C")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end TemperatureConstant;

    block FlowConstant "Generate constant signal in units ml/min"
      parameter Real k(start = 1, final quantity = "Flow", final unit = "ml/min")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Flow", final
          unit="ml/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "min"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "ml")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end FlowConstant;

    block ElectrolytesMassConstant "Generate constant signal of type Mass_mEq"
      parameter Real k(start = 1, final quantity = "Mass", final unit = "mEq")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Mass", final
          unit="mEq") "Connector of Real output signal" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k mEq")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end ElectrolytesMassConstant;

    block ComplianceConstant "Generate constant signal in units ml/mmHg"
      parameter Real k(start = 1, final quantity = "Compliance", final unit = "ml/mmHg")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Compliance",
          final unit="ml/mmHg") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "mmHg"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "ml")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end ComplianceConstant;

    block CondConstant "Generate constant signal in units (ml/min)/mmHg"
      parameter Real k(start = 1, final quantity = "Conductance", final unit = "ml/(min.mmHg)")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Conductance",
          final unit="ml/(min.mmHg)") "Connector of Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -86}, {98, -50}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "min.mmHg"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-98, -40}, {94, 0}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "ml")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end CondConstant;

    block ElectrolytesConcentrationConstant_per_l
      "Generate constant signal of type mEq/L"
      parameter Real k(start = 1, final quantity = "Concentration", final unit = "mEq/l")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Concentration",
          final unit="mEq/l") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "mEq"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "l")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end ElectrolytesConcentrationConstant_per_l;

    block ConcentrationConstant_pg_per_ml
      "Generate constant signal in units pg/ml"
      parameter Real k(start = 1, final quantity = "Concentration", final unit = "pg/ml")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Concentration",
          final unit="pg/ml") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "ml"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "pG")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end ConcentrationConstant_pg_per_ml;

    block ConcentrationConstant_uU_per_ml
      "Generate constant signal in units uU/ml"
      parameter Real k(start = 1, final quantity = "Concentration", final unit = "uU/ml")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Concentration",
          final unit="uU/ml") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "ml"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "uU")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end ConcentrationConstant_uU_per_ml;

    block MassFlowConstant "Generate constant signal in units mg/min"
      parameter Real k(start = 1, final quantity = "Flow", final unit = "mg/min")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Flow", final
          unit="mg/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "min"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "mg")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end MassFlowConstant;

    block ElectrolytesFlowConstant
      "Generate constant signal of type Mass_mEq_per_min"
      parameter Real k(start = 1, final quantity = "Flow", final unit = "mEq/min")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Flow", final
          unit="mEq/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, -6}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "min"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "mEq")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end ElectrolytesFlowConstant;

    block HormoneFlowConstant_nG "Generate constant signal in units nG/min"
      parameter Real k(start = 1, final quantity = "Flow", final unit = "ng/min")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Flow", final
          unit="ng/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "min"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "nG")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end HormoneFlowConstant_nG;

    block HormoneFlowConstant_pmol "Generate constant signal in units pmol/min"
      parameter Real k(start = 1, final quantity = "Flow", final unit = "pmol/min")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Flow", final
          unit="pmol/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "min"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "pmol")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end HormoneFlowConstant_pmol;

    block HormoneFlowConstant_uG "Generate constant signal in units uG/min"
      parameter Real k(start = 1, final quantity = "Flow", final unit = "ug/min")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Flow", final
          unit="ug/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "min"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "uG")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end HormoneFlowConstant_uG;

    block HormoneFlowConstant_GU "Generate constant signal in units U/min"
      parameter Real k(start = 1, final quantity = "Flow", final unit = "GU/min")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Flow", final
          unit="GU/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "min"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "GU")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end HormoneFlowConstant_GU;

    block CaloriesFlowConstant
      "Generate constant signal of type Energy Flow in calories per minute"
      parameter Real k(start = 1, final quantity = "Flow", final unit = "cal/min")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Flow", final
          unit="Cal/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 2}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -52}, {100, 24}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "min"), Text(extent=  {{-100, -44}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "cal")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end CaloriesFlowConstant;

    block MassFlowConstant_kg "Generate constant signal in units kg/min"
      parameter Real k(start = 1, final quantity = "Flow", final unit = "kg/min")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Flow", final
          unit="kg/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 20}, {100, 92}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "min"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "kg")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end MassFlowConstant_kg;

    block Min "Pass through the smallest signal"
      extends Modelica.Blocks.Interfaces.MISO;
    equation
      y = min(u);
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent=  {{-90, 36}, {90, -36}}, lineColor=  {160, 160, 164}, textString=  "min()")}), Documentation(info = "<html>
      <p>
      This block computes the output <b>y</b> as <i>minimum</i> of
      the Real inputs <b>u[1]</b>,<b>u[2]</b> .. <b>u[nin]</b>:
      </p>
      <pre>    y = <b>min</b> ( u );
      </pre>
      </html>
      "));
    end Min;

    block HormoneFlowConstant_U "Generate constant signal in units U/min"
      parameter Real k(start = 1, final quantity = "Flow", final unit = "U/min")
        "Constant output value";
      PhysiolibraryOld.Interfaces.RealOutput_ y(final quantity="Flow", final
          unit="U/min") "Connector of Real output signal" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, 0}, {100, 100}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%k"), Text(extent=  {{-100, -100}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "min"), Text(extent=  {{-100, -46}, {100, 30}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "____"), Text(extent=  {{-100, -38}, {100, 16}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "U")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 0}, textString=  "%k")}), Documentation(info = "<html>
      <p>
      The Real output y is a constant signal:
      </p>
      </html>"));
    end HormoneFlowConstant_U;

    model Integrator
      extends Utilities.DynamicState;
      parameter Real k = 1 "Integrator gain";
      parameter Real y_start = 0 "Initial or guess value of output (= state)" annotation(Dialog(group = "Initialization"));
      extends Interfaces.SISO(y(start = y_start));
    equation
      stateValue = y;
      changePerMin = k * u * SecPerMin;
      annotation(Documentation(info = "<html>
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
      "), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Line(points=  {{-80, 78}, {-80, -90}}, color=  {192, 192, 192}), Polygon(points=  {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}, lineColor=  {192, 192, 192}, fillColor=  {192, 192, 192}, fillPattern=  FillPattern.Solid), Line(points=  {{-90, -80}, {82, -80}}, color=  {192, 192, 192}), Polygon(points=  {{90, -80}, {68, -72}, {68, -88}, {90, -80}}, lineColor=  {192, 192, 192}, fillColor=  {192, 192, 192}, fillPattern=  FillPattern.Solid), Text(extent=  {{0, -10}, {60, -70}}, lineColor=  {192, 192, 192}, textString=  "I"), Text(extent=  {{-150, -150}, {150, -110}}, lineColor=  {0, 0, 0}, textString=  "k=%k"), Line(points=  {{-80, -80}, {80, 80}}, color=  {0, 0, 127}), Text(extent=  {{-150, 106}, {150, 146}}, lineColor=  {0, 0, 0}, textString=  "%stateName")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-60, 60}, {60, -60}}, lineColor=  {0, 0, 255}), Line(points=  {{-100, 0}, {-60, 0}}, color=  {0, 0, 255}), Line(points=  {{60, 0}, {100, 0}}, color=  {0, 0, 255}), Text(extent=  {{-36, 60}, {32, 2}}, lineColor=  {0, 0, 0}, textString=  "k"), Text(extent=  {{-32, 0}, {36, -58}}, lineColor=  {0, 0, 0}, textString=  "s"), Line(points=  {{-46, 0}, {46, 0}}, color=  {0, 0, 0})}));
    end Integrator;

    block deprecated_HomotopyStrongComponentBreaker
      "break the strong component in normalized signal with default value"
      extends PhysiolibraryOld.Interfaces.SISO;
      parameter Real defaultValue = 1;
      parameter Real defaultSlope = 0;
    equation
      y = homotopy(u, defaultValue + defaultSlope * (u - defaultValue));
      annotation(defaultComponentName = "homotopyOperator", Documentation(info = "
      <HTML>
      <p>
      This blocks computes output <b>y</b> as
      <i>average value</i> of the elements of the input signal vector
      <b>u</b>:
      </p>
      <pre>
          <b>y</b> = (<b>u</b>[1] + <b>u</b>[2] + ... + <b>u</b>[n]) / n;
      </pre>
      <p>
      Example:
      </p>
      <pre>
           parameter:   nin = 3;
       
        results in the following equations:
       
           y = (u[1] + u[2] + u[3]) / 3;
      </pre>
       
      </HTML>
      "), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Text(extent=  {{-100, -24}, {96, 20}}, lineColor=  {0, 0, 255}, textString=  "Homotopy")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.04), graphics = {Rectangle(extent=  {{-100, -100}, {100, 100}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-98, -18}, {98, 26}}, lineColor=  {0, 0, 255}, textString=  "Homotopy")}));
    end deprecated_HomotopyStrongComponentBreaker;
  end Blocks;

  package Curves "Empirical Dependence of Two Variables"
    model Curve
      extends pavol_version.Curve;
      parameter Boolean INVERSION = false "only for compatibility";
    end Curve;

    package pavol_version
      function Spline
        input Real[:] x;
        //souradnice x souradnice uzlovych bodu
        input Real[:, 4] a;
        //parametry kubiky
        input Real xVal;
        //vstupni hodnota
        output Real yVal;
        //     output Real outExtra;
      protected
        Integer index;
        Integer n;
      algorithm
        // Najdi interval, ve kterem se nachazi xVal
        if xVal <= x[1] then
          yVal := xVal * a[1, 3] + a[1, 4];
        else
          n := size(x, 1);
          if xVal >= x[n] then
            yVal := xVal * a[n + 1, 3] + a[n + 1, 4];
          else
            index := 2;
            while xVal > x[index] and index < n loop
              index := index + 1;
            end while;
            yVal := ((a[index, 1] * xVal + a[index, 2]) * xVal + a[index, 3]) * xVal + a[index, 4];
          end if;
        end if;
        //kdyz je hodnota xVal pred prvnim uzlovym bodem
        //pocitam primku
        //pocet uzlovych bodu
        //kdyz je hodnota xVal za poslednim uzlovym bodem
        //pocitam primku
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
        //    outExtra := xVal + yVal;
        annotation(Documentation(revisions = "<html>
      <p>author: Ondrej Vacek</p>
      </html>"));
      end Spline;

      function SplineCoeficients
        input Real[:] x;
        input Real[:] y;
        input Real[:] slope;
        output Real[size(x, 1) + 1, 4] a;
        //poset hodnot ctyrech parametru kubiky je o jeden vic nez pocet bodu
      protected
        Integer n;
        Integer i;
        //Real a1; //parametry kubiky
        //Real a2; //parametry kubiky
        //Real a3; //parametry kubiky
        //Real a4; //parametry kubiky
        Real x1;
        Real x2;
        Real y1;
        Real y2;
        Real slope1;
        Real slope2;
      algorithm
        // Najdi interval, ve kterem se nachazi xVal
        /*
                                                  if (xVal<= x[1]) then

                                                         yVal :=(xVal)*slope[1] + y[1]- x[1]*slope[1];
                                                         
                                                         yVal :=0 *(xVal)^3 + 0*(xVal)^2 + slope[1]*(xVal) + (y[1]- x[1]*slope[1]);
                                                         
                                                         yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
                                                 
                                                       elseif (xVal>=x[size(x,1)]) then

                                                        yVal :=(xVal)*slope[size(slope,1)] + y[size(y,1)]-(x[size(x,1)]*slope[size(slope,1)]);
                                                        
                                                        yVal :=0 *(xVal)^3 + 0 *(xVal)^2 + slope[size(slope,1)]*(xVal) + (y[size(y,1)]-(x[size(x,1)]*slope[size(slope,1)]));
                                                        
                                                        yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
                                                        yVal := ((a1*xVal + a2)*xVal + a3)*xVal + a4;

                                                else
                                                 
                                                 yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;

                                                  */
        n := size(x, 1);
        //pocet uzlovych bodu
        for i in 2:n loop
          x1 := x[i - 1];
          x2 := x[i];
          y1 := y[i - 1];
          y2 := y[i];
          slope1 := slope[i - 1];
          slope2 := slope[i];
          a[i, 1] := -((-x2 * slope2) - x2 * slope1 + x1 * slope2 + x1 * slope1 + 2 * y2 - 2 * y1) / (x2 - x1) ^ 3;
          a[i, 2] := ((-x2 ^ 2 * slope2) - 2 * x2 ^ 2 * slope1 - 3 * x2 * y1 + x2 * slope1 * x1 + 3 * x2 * y2 - x2 * slope2 * x1 - 3 * y1 * x1 + slope1 * x1 ^ 2 + 3 * y2 * x1 + 2 * slope2 * x1 ^ 2) / (x2 - x1) ^ 3;
          a[i, 3] := -((-slope1 * x2 ^ 3) - 2 * x2 ^ 2 * slope2 * x1 - x2 ^ 2 * slope1 * x1 + x2 * slope2 * x1 ^ 2 + 2 * x2 * slope1 * x1 ^ 2 + 6 * x2 * x1 * y2 - 6 * x2 * x1 * y1 + slope2 * x1 ^ 3) / (x2 - x1) ^ 3;
          a[i, 4] := ((-slope1 * x2 ^ 3 * x1) + y1 * x2 ^ 3 - slope2 * x1 ^ 2 * x2 ^ 2 + slope1 * x1 ^ 2 * x2 ^ 2 - 3 * y1 * x2 ^ 2 * x1 + 3 * y2 * x1 ^ 2 * x2 + slope2 * x1 ^ 3 * x2 - y2 * x1 ^ 3) / (x2 - x1) ^ 3;
        end for;
        //cyklus od 2 do n
        //predchozi bod
        //soucasny bod
        //predchozi bod
        //soucasny bod
        //predchozi bod
        //soucasny bod
        //vypocty parametru kubiky (od 2 do n) podle souradnic a smernic dvou bodu : y=a[i,4]+a[i,3]*x+a[i,2]*x^2+a[i,1]*x^3
        a[1, :] := {0, 0, slope[1], y[1] - x[1] * slope[1]};
        //vypocet prvni sady parametru kubiky  - primky
        a[n + 1, :] := {0, 0, slope[n], y[n] - x[n] * slope[n]};
        //vypocet posledni sady parametru kubiky - primky
        annotation(Documentation(revisions = "<html>
      <p>author: Ondrej Vacek</p>
      </html>"));
      end SplineCoeficients;

      model Curve
        "2D natural cubic interpolation spline defined with (x,y,slope) points"
        // import QHP = HumMod;
        parameter Real x[:];
        parameter Real y[:];
        parameter Real slope[:];
        parameter Integer iFrom = 0;
        PhysiolibraryOld.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-100,-60},{-60,-20}}), iconTransformation(
                extent={{-120,-20},{-80,20}})));
        PhysiolibraryOld.Interfaces.RealOutput_ val annotation (Placement(
              transformation(extent={{60,-20},{100,20}}), iconTransformation(
                extent={{82,-20},{122,20}})));
      protected
        parameter Real a[:, :] = PhysiolibraryOld.Curves.pavol_version.SplineCoeficients(
                                                                                      x, y, slope);
      equation
        val = PhysiolibraryOld.Curves.pavol_version.Spline(
                x,
                a,
                u);
        annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
      end Curve;
    end pavol_version;
  end Curves;

  package Factors "Multiplication Effect Types"
    model SimpleMultiply "multiplication"
      extends PhysiolibraryOld.Interfaces.BaseFactorIcon;
      PhysiolibraryOld.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-102,-24},{-62,16}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -32})));
      Real effect;
    equation
      effect = u;
      connect(yBase, product.u1) annotation(Line(points = {{6, 80}, {6, 30}, {6, -20}, {6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(product.y, y) annotation(Line(points = {{-2.02067e-015, -43}, {-2.02067e-015, -55.5}, {0, -55.5}, {0, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(u, product.u2) annotation(Line(points = {{-82, -4}, {-6, -4}, {-6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>", info = "<html>
      <p><h4>y = yBase * u</h4></p>
      </html>"), Icon(graphics = {Ellipse(extent=  {{-102, 28}, {-82, 8}}, lineColor=  {255, 255, 170}, fillColor=  {255, 255, 170}, fillPattern=  FillPattern.Solid), Text(extent=  {{-114, 32}, {-70, -14}}, lineColor=  {0, 0, 0}, textString=  "*")}));
    end SimpleMultiply;

    model CurveValue
      "calculate multiplication factor from function defined by curve"
      extends PhysiolibraryOld.Interfaces.BaseFactorIcon4;
      PhysiolibraryOld.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-102,-24},{-62,16}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
      parameter Real[:, 3] data;
      PhysiolibraryOld.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -32})));
      Real effect;
    equation
      effect = curve.val;
      connect(curve.u, u) annotation(Line(points = {{-46, 0}, {-64, 0}, {-64, -4}, {-82, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(yBase, product.u1) annotation(Line(points = {{6, 80}, {6, 30}, {6, -20}, {6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(curve.val, product.u2) annotation(Line(points = {{-25.8, 0}, {-6, 0}, {-6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(product.y, y) annotation(Line(points = {{-2.02067e-015, -43}, {-2.02067e-015, -55.5}, {0, -55.5}, {0, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end CurveValue;

    model DelayedToSpline
      "adapt the signal, from which is by curve multiplication coeficient calculated"
      extends PhysiolibraryOld.Interfaces.BaseFactorIcon5;
      PhysiolibraryOld.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-118,44},{-78,84}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
      parameter Real Tau = 40;
      parameter Real initialValue = 1;
      //40;
      parameter Real[:, 3] data;
      parameter String adaptationSignalName;
      PhysiolibraryOld.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-38,-16},{-18,4}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -32})));
      Blocks.Integrator integrator(k = 1 / Tau / SecPerMin, y_start = initialValue, stateName = adaptationSignalName) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-60, 14})));
      Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-60, 46})));
      Real effect;
    equation
      effect = curve.val;
      connect(yBase, product.u1) annotation(Line(points = {{6, 80}, {6, 30}, {6, -20}, {6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(product.y, y) annotation(Line(points = {{-2.02067e-015, -43}, {-2.02067e-015, -55.5}, {0, -55.5}, {0, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(feedback.y, integrator.u) annotation(Line(points = {{-60, 37}, {-60, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(integrator.y, feedback.u2) annotation(Line(points = {{-60, 3}, {-60, -6}, {-84, -6}, {-84, 46}, {-68, 46}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(feedback.u1, u) annotation(Line(points = {{-60, 54}, {-60, 64}, {-98, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(integrator.y, curve.u) annotation(Line(points = {{-60, 3}, {-60, -6}, {-38, -6}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(curve.val, product.u2) annotation(Line(points = {{-17.8, -6}, {-6, -6}, {-6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end DelayedToSpline;

    model SplineDelayByDay
      "adapt the value of multiplication coeficient calculated from curve"
      extends PhysiolibraryOld.Interfaces.BaseFactorIcon3;
      PhysiolibraryOld.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-118,44},{-78,84}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
      parameter Real Tau;
      parameter Real[:, 3] data;
      parameter String stateName;
      PhysiolibraryOld.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-68,58},{-48,78}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -32})));
      Blocks.Integrator integrator(y_start = 1, k = 1 / (Tau * 1440) / SecPerMin, stateName = stateName) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-26, 12})));
      Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-26, 44})));
      Real effect;
    equation
      effect = integrator.y;
      connect(curve.u, u) annotation(Line(points = {{-68, 68}, {-83, 68}, {-83, 64}, {-98, 64}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(yBase, product.u1) annotation(Line(points = {{6, 80}, {6, 30}, {6, -20}, {6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(product.y, y) annotation(Line(points = {{-2.02067e-015, -43}, {-2.02067e-015, -55.5}, {0, -55.5}, {0, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(curve.val, feedback.u1) annotation(Line(points = {{-47.8, 68}, {-26, 68}, {-26, 52}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(feedback.y, integrator.u) annotation(Line(points = {{-26, 35}, {-26, 29.5}, {-26, 24}, {-26, 24}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(integrator.y, feedback.u2) annotation(Line(points = {{-26, 1}, {-26, -8}, {-50, -8}, {-50, 44}, {-34, 44}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(integrator.y, product.u2) annotation(Line(points = {{-26, 1}, {-26, -8}, {-6, -8}, {-6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end SplineDelayByDay;

    model SplineDelayFactorByDayWithFailture
      "combination of SplineDelayByDay and ZeroIfFalse"
      extends PhysiolibraryOld.Interfaces.BaseFactorIcon2;
      PhysiolibraryOld.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-118,6},{-78,46}}), iconTransformation(
              extent={{-108,-30},{-88,-10}})));
      parameter Real Tau;
      parameter Real[:, 3] data;
      parameter String stateName;
      PhysiolibraryOld.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-76,20},{-56,40}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -50})));
      Blocks.Integrator integrator(y_start = 1, k = 1 / (Tau * 1440) / SecPerMin, stateName = stateName) annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-14, -6})));
      Modelica.Blocks.Math.Feedback feedback annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-14, 26})));
      Modelica.Blocks.Logical.Switch switch1 annotation(Placement(transformation(extent = {{-36, 40}, {-16, 60}})));
      PhysiolibraryOld.Blocks.Constant Constant1(k=0)
        annotation (Placement(transformation(extent={{-82,62},{-62,82}})));
      PhysiolibraryOld.Interfaces.BooleanInput Failed annotation (Placement(
            transformation(extent={{-118,30},{-78,70}}), iconTransformation(
              extent={{-108,30},{-88,50}})));
      Real effect;
    equation
      effect = integrator.y;
      connect(curve.u, u) annotation(Line(points = {{-76, 30}, {-87, 30}, {-87, 26}, {-98, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(yBase, product.u1) annotation(Line(points = {{6, 100}, {6, 31}, {6, -38}, {6, -38}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(product.y, y) annotation(Line(points = {{-2.02067e-015, -61}, {-2.02067e-015, -55.5}, {0, -55.5}, {0, -80}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(feedback.y, integrator.u) annotation(Line(points = {{-14, 17}, {-14, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(integrator.y, feedback.u2) annotation(Line(points = {{-14, -17}, {-14, -26}, {-38, -26}, {-38, 26}, {-22, 26}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(integrator.y, product.u2) annotation(Line(points = {{-14, -17}, {-14, -26}, {-6, -26}, {-6, -38}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(switch1.y, feedback.u1) annotation(Line(points = {{-15, 50}, {-14, 50}, {-14, 34}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(curve.val, switch1.u3) annotation(Line(points = {{-55.8, 30}, {-54, 30}, {-54, 42}, {-38, 42}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(Constant1.y, switch1.u1) annotation(Line(points = {{-61, 72}, {-58, 72}, {-58, 58}, {-38, 58}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(switch1.u2, Failed) annotation(Line(points = {{-38, 50}, {-98, 50}}, color = {255, 0, 255}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end SplineDelayFactorByDayWithFailture;

    model SplineValue2 "calculate multiplication factor from spline value"
      extends PhysiolibraryOld.Interfaces.BaseFactorIcon4;
      PhysiolibraryOld.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-102,-24},{-62,16}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
      parameter Boolean INVERSE = false;
      parameter Real[:, 3] data;
      PhysiolibraryOld.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
      //    ,INVERSION=INVERSE)
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -32})));
      Real effect;
    equation
      effect = curve.val;
      connect(curve.u, u) annotation(Line(points = {{-46, 0}, {-64, 0}, {-64, -4}, {-82, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(yBase, product.u1) annotation(Line(points = {{6, 80}, {6, 30}, {6, -20}, {6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(curve.val, product.u2) annotation(Line(points = {{-25.8, 0}, {-6, 0}, {-6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(product.y, y) annotation(Line(points = {{-2.02067e-015, -43}, {-2.02067e-015, -55.5}, {0, -55.5}, {0, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end SplineValue2;

    model CurveValueWithLinearSimplificationByHomotopy
      "calculate multiplication factor from function defined by curve"
      extends PhysiolibraryOld.Interfaces.BaseFactorIcon4;
      PhysiolibraryOld.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-102,-24},{-62,16}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
      parameter Real defaultU = 0;
      parameter Real defaultSlope = 0;
      parameter Real defaultValue = 1;
      parameter Real[:, 3] data;
      PhysiolibraryOld.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
      Modelica.Blocks.Math.Product product annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {0, -32})));
      Real effect;
    equation
      effect = homotopy(curve.val, defaultSlope * (u - defaultU) + defaultValue);
      product.u2 = effect;
      connect(curve.u, u) annotation(Line(points = {{-46, 0}, {-64, 0}, {-64, -4}, {-82, -4}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(yBase, product.u1) annotation(Line(points = {{6, 80}, {6, 30}, {6, -20}, {6, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(product.y, y) annotation(Line(points = {{-2.02067e-015, -43}, {-2.02067e-015, -55.5}, {0, -55.5}, {0, -60}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end CurveValueWithLinearSimplificationByHomotopy;
  end Factors;

  package ConcentrationFlow "Concentration Physical Domain"
    replaceable type Concentration = Real(final quantity = "Concentration");
    replaceable type SoluteFlow = Real(final quantity = "Flow");
    replaceable type SoluteMass = Real(final quantity = "Mass");

    connector ConcentrationFlow "Concentration and Solute flow"
      Concentration conc;
      flow SoluteFlow q;
      annotation(Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end ConcentrationFlow;

    connector PositiveConcentrationFlow "Concentration and Solute inflow"
      extends PhysiolibraryOld.ConcentrationFlow.ConcentrationFlow;
      annotation(defaultComponentName = "q_in", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-20, 10}, {20, -10}}, lineColor=  {200, 0, 0}, lineThickness=  1), Polygon(points=  {{0, 100}, {100, 0}, {0, -100}, {-100, 0}, {0, 100}}, lineColor=  {200, 0, 0}, smooth=  Smooth.None, fillPattern=  FillPattern.Solid, fillColor=  {200, 0, 0})}), Diagram(Polygon(points = [-21, -3; 5, 23; 31, -3; 5, -29; -21, -3], style(color = 74, rgbcolor = {0, 0, 0}, fillColor = 0, rgbfillColor = {0, 0, 0})), Text(extent = [-105, -38; 115, -83], string = "%name", style(color = 0, rgbcolor = {0, 0, 0}))), Documentation(info = "<html>
      <p>
      Connector with one flow signal of type Real.
      </p>
      </html>", revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end PositiveConcentrationFlow;

    connector NegativeConcentrationFlow
      "Concentration and negative Solute outflow"
      extends PhysiolibraryOld.ConcentrationFlow.ConcentrationFlow;
      annotation(defaultComponentName = "q_out", Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false), graphics = {Rectangle(extent=  {{-20, 10}, {20, -10}}, lineColor=  {200, 0, 0}, lineThickness=  1), Polygon(points=  {{-100, 0}, {0, 100}, {100, 0}, {0, -100}, {-100, 0}}, lineColor=  {200, 0, 0}, smooth=  Smooth.None, fillPattern=  FillPattern.Solid, fillColor=  {255, 240, 240})}), Diagram(Polygon(points = [-21, -3; 5, 23; 31, -3; 5, -29; -21, -3], style(color = 74, rgbcolor = {0, 0, 0}, fillColor = 0, rgbfillColor = {255, 255, 255})), Text(extent = [-105, -38; 115, -83], string = "%name", style(color = 0, rgbcolor = {0, 0, 0}))), Documentation(info = "<html>
      <p>
      Connector with one flow signal of type Real.
      </p>
      </html>", revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end NegativeConcentrationFlow;

    model FlowMeasure
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{18,-10},{38,10}}), iconTransformation(extent={{30,-10},{50,10}})));
      PhysiolibraryOld.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-50,-10},{-30,10}})));
      PhysiolibraryOld.Interfaces.RealOutput_ actualFlow annotation (Placement(
            transformation(extent={{-20,30},{20,70}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,50})));
    equation
      q_in.q + q_out.q = 0;
      q_out.conc = q_in.conc;
      actualFlow = q_in.q;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-40, 30}, {40, -30}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end FlowMeasure;

    model ConcentrationMeasure
      parameter String unitsString = "";
      parameter Real toAnotherUnitCoef = 1;
      PhysiolibraryOld.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-10,-10},{10,10}})));
      PhysiolibraryOld.Interfaces.RealOutput_ actualConc annotation (Placement(
            transformation(extent={{-20,30},{20,70}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,40})));
    equation
      actualConc = toAnotherUnitCoef * q_in.conc;
      q_in.q = 0;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent=  {{-48, -24}, {48, -40}}, lineColor=  {0, 0, 0}, textString=  "%unitsString"), Rectangle(extent=  {{-20, 20}, {20, -20}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end ConcentrationMeasure;

    partial model ResistorBase
      extends PhysiolibraryOld.Icons.Resistor;
      PhysiolibraryOld.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{-96,-10},{-76,10}}), iconTransformation(extent={{-96,-10},{-76,
                10}})));
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}}), iconTransformation(extent={{76,-10},{96,
                10}})));
      annotation(Icon(graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/diffusion.png")}), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end ResistorBase;

    partial model Resistor
      extends ResistorBase;
    equation
      q_in.q + q_out.q = 0;
      annotation(Icon(graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end Resistor;

    model ResistorWithCondParam
      extends Resistor;
      parameter Real cond
        "speed of solute in dependence on concentration gradient";
    equation
      q_in.q = cond * (q_in.conc - q_out.conc);
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Text(extent=  {{-70, 38}, {70, 80}}, lineColor=  {0, 0, 0}, textString=  "%cond"), Text(extent=  {{-142, -90}, {142, -40}}, textString=  "%name", lineColor=  {0, 0, 255})}), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end ResistorWithCondParam;

    model SolventFlowPump
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        "second side connector with value of q (solute mass flow) and conc (concentration)"
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}})));
      Interfaces.RealInput_ solventFlow
        "solvent flow (solution volume flow = solventFlow + solute volume flow)"
                                                                                                            annotation(extent = [-10, 50; 10, 70], rotation = -90);
      PhysiolibraryOld.ConcentrationFlow.PositiveConcentrationFlow q_in
        "first side connector with value of q (solute mass flow) and conc (concentration)"
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = if initial() or solventFlow >= 0 then solventFlow * q_in.conc else solventFlow * q_out.conc;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -50}, {100, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-150, -100}, {150, -60}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
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
      </html>", info = "<html>
      <p><h4><font color=\"#008000\">Bidirectional mass flow by concentration</font></h4></p>
      <p>Possible field values: </p>
      <table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
      <td></td>
      <td><p align=\"center\">forward flow</p></td>
      <td><p align=\"center\">backward flow</p></td>
      </tr>
      <tr>
      <td><p align=\"center\"><h4>solventFlow</h4></p></td>
      <td><p align=\"center\">&GT;=0</p></td>
      <td><p align=\"center\">&LT;0</p></td>
      </tr>
      <tr>
      <td><p align=\"center\"><h4>q_in.q</h4></p></td>
      <td><p align=\"center\">=solventFlow*q_in.conc</p></td>
      <td><p align=\"center\">=solventFlow*q_out.conc</p></td>
      </tr>
      <tr>
      <td><p align=\"center\"><h4>q_out.q</h4></p></td>
      <td><p align=\"center\">=-q_in.q</p></td>
      <td><p align=\"center\">=-q_in.q</p></td>
      </tr>
      </table>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end SolventFlowPump;

    model SolventOutflowPump
      PhysiolibraryOld.Interfaces.RealInput solventFlow "solvent outflow"
        annotation (extent=[-10,50; 10,70], rotation=-90);
      PhysiolibraryOld.ConcentrationFlow.PositiveConcentrationFlow q_in
        "solute outflow" annotation (Placement(transformation(extent={{-120,-20},
                {-80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
      parameter Real K = 1 "part of real mass flow in solution outflow";
    equation
      q_in.q = K * solventFlow * q_in.conc;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -50}, {100, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-150, -100}, {150, -60}}, textString=  "%name", lineColor=  {0, 0, 255}), Text(extent=  {{-100, -30}, {100, -50}}, lineColor=  {0, 0, 0}, textString=  "K=%K")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
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
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end SolventOutflowPump;

    model Synthesis
      parameter SoluteFlow SynthesisBasic = 0.01;
      parameter Real[:, 3] data = {{20.0, 3.0, 0.0}, {28.0, 1.0, -0.2}, {40.0, 0.0, 0.0}}
        "COPEffect";
      PhysiolibraryOld.Curves.Curve c(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3]);
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}})));
      Real COP;
      SoluteMass synthetized(start = 0);
    protected
      parameter Real C1 = 320.0;
      parameter Real C2 = 1160.0;
    equation
      COP = if q_out.conc > 0.0 then C1 * q_out.conc + C2 * q_out.conc * q_out.conc else 0.0;
      c.u = COP;
      q_out.q = -SynthesisBasic * c.val;
      der(synthetized) = -q_out.q / SecPerMin;
      annotation(defaultComponentName = "synthesis", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -50}, {100, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-100, -50}, {90, 50}}, lineColor=  {0, 0, 255}, textString=  "%name")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end Synthesis;

    model Degradation
      parameter SoluteFlow DegradationBasic = 0.01;
      parameter Real[:, 3] data = {{0.0, 0.0, 0.0}, {0.07000000000000001, 1.0, 40.0}, {0.09, 6.0, 0.0}}
        "ProteinEffect";
      PhysiolibraryOld.Curves.Curve c(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3]);
      PositiveConcentrationFlow q_in annotation(Placement(transformation(extent = {{-100, 0}, {-60, 40}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      SoluteMass degraded(start = 0);
    equation
      c.u = q_in.conc;
      q_in.q = DegradationBasic * c.val;
      der(degraded) = q_in.q / SecPerMin;
      annotation(defaultComponentName = "degradation", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -50}, {100, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-88, -50}, {100, 50}}, lineColor=  {0, 0, 255}, textString=  "%name")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end Degradation;

    model InputPump
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}}), iconTransformation(extent={{50,-10},{70,
                10}})));
      PhysiolibraryOld.Interfaces.RealInput_ desiredFlow "speed of solute flow"
        annotation (extent=[-10,30; 10,50], rotation=-90);
    equation
      q_out.q = -desiredFlow;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-60, -30}, {60, 30}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-48, 20}, {50, 0}, {-48, -21}, {-48, 20}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid), Text(extent=  {{-92, -54}, {80, -30}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end InputPump;

    model OutputPump
      PhysiolibraryOld.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{-110,-8},{-90,12}}), iconTransformation(extent={{-70,-10},{-50,
                10}})));
      PhysiolibraryOld.Interfaces.RealInput_ desiredFlow
        annotation (extent=[-10,30; 10,50], rotation=-90);
    equation
      q_in.q = desiredFlow;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-60, -32}, {60, 30}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-48, 18}, {50, -2}, {-48, -26}, {-48, 18}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid), Text(extent=  {{-78, -54}, {72, -32}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end OutputPump;

    model SoluteFlowPump
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}})));
      PhysiolibraryOld.Interfaces.RealInput soluteFlow
        annotation (extent=[-10,50; 10,70], rotation=-90);
      PhysiolibraryOld.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = soluteFlow;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -50}, {100, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid), Text(extent=  {{-150, -100}, {150, -60}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end SoluteFlowPump;

    model PartialPressure
      "partial gas concentration in ml/ml multiplied by ambient pressure"
      PressureFlow.NegativePressureFlow outflow annotation(Placement(transformation(extent = {{-20, -120}, {20, -80}}), iconTransformation(extent = {{-10, -110}, {10, -90}})));
      PositiveConcentrationFlow q_in annotation(Placement(transformation(extent = {{-20, 80}, {20, 120}}), iconTransformation(extent = {{-10, 90}, {10, 110}})));
      Interfaces.RealInput_ ambientPressure(final unit = "mmHg") annotation(Placement(transformation(extent = {{-60, -20}, {-20, 20}}), iconTransformation(extent = {{-60, -20}, {-20, 20}})));
    equation
      q_in.q + outflow.q = 0;
      outflow.pressure = q_in.conc * ambientPressure;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-40, 100}, {40, -100}}, lineColor=  {0, 0, 255}, fillColor=  {215, 215, 215}, fillPattern=  FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end PartialPressure;

    model Dilution
      // parameter Real DilutionCoef=1-47/760;
      NegativeConcentrationFlow q_diluted annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, 10}, {110, 30}}), iconTransformation(extent = {{90, 50}, {110, 70}})));
      PositiveConcentrationFlow q_concentrated annotation(Placement(transformation(extent = {{-130, -28}, {-90, 12}}), iconTransformation(extent = {{-110, 50}, {-90, 70}})));
      Interfaces.RealInput_ dilution
        "dilution = one minus (part of added solvent volume(not containing solute) normalized to whole summed volume)"
                                                                                                            annotation(Placement(transformation(extent = {{-16, 8}, {24, 48}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 0, origin = {-92, -68})));
    equation
      q_diluted.q + q_concentrated.q = 0;
      q_diluted.conc = dilution * q_concentrated.conc;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -102}}, fileName=  "icons/dilution.png")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end Dilution;

    model Reabsorbtion
      PositiveConcentrationFlow Inflow annotation(Placement(transformation(extent = {{-120, -18}, {-80, 22}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      NegativeConcentrationFlow Outflow annotation(Placement(transformation(extent = {{0, -100}, {40, -60}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      NegativeConcentrationFlow Reabsorbtion annotation(Placement(transformation(extent = {{-20, -100}, {20, -60}}), iconTransformation(extent = {{-10, -50}, {10, -30}})));
      PhysiolibraryOld.Interfaces.RealInput_ ReabsorbedFract(final unit="1")
        annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={0,40})));
    equation
      Outflow.q + Inflow.q + Reabsorbtion.q = 0;
      Outflow.conc = Inflow.conc;
      Reabsorbtion.q = -ReabsorbedFract * Inflow.q;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 40}, {100, -40}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Line(points=  {{-70, 14}, {-70, -18}, {-52, -12}, {-36, -14}, {-18, -20}, {-2, -28}, {6, -36}, {8, -40}, {6, -22}, {0, -12}, {-8, -6}, {-22, 2}, {-40, 8}, {-58, 12}, {-70, 14}}, color=  {0, 0, 255}, smooth=  Smooth.None), Text(extent=  {{12, -54}, {166, -84}}, lineColor=  {0, 0, 255}, textString=  "%name")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end Reabsorbtion;

    model FractReabsorbtion
      PositiveConcentrationFlow Inflow annotation(Placement(transformation(extent = {{-120, -18}, {-80, 22}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      NegativeConcentrationFlow Outflow annotation(Placement(transformation(extent = {{0, -100}, {40, -60}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      NegativeConcentrationFlow Reabsorbtion annotation(Placement(transformation(extent = {{-20, -100}, {20, -60}}), iconTransformation(extent = {{-10, -50}, {10, -30}})));
      PhysiolibraryOld.Interfaces.RealInput_ Normal(final unit="1") annotation
        (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={-60,40})));
      PhysiolibraryOld.Interfaces.RealInput_ Effects(final unit="1")
        annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(extent={{60,20},{100,60}}, rotation=-90)));
      parameter SoluteFlow MaxReab = 14 "maximum reabsorbtion solute flow";
      Interfaces.RealOutput_ ReabFract(final unit = "1") annotation(Placement(transformation(extent = {{80, -60}, {120, -20}}), iconTransformation(extent = {{80, -60}, {120, -20}})));
    equation
      Outflow.q + Inflow.q + Reabsorbtion.q = 0;
      Outflow.conc = Inflow.conc;
      Reabsorbtion.q = -min(ReabFract * Inflow.q, MaxReab);
      ReabFract = if Normal <= 0 or Effects <= 0 then 0 else if Normal > 1 then 1 else Normal ^ (1 / Effects);
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 40}, {100, -40}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Line(points=  {{-70, 14}, {-70, -18}, {-52, -12}, {-36, -14}, {-18, -20}, {-2, -28}, {6, -36}, {8, -40}, {6, -22}, {0, -12}, {-8, -6}, {-22, 2}, {-40, 8}, {-58, 12}, {-70, 14}}, color=  {0, 0, 255}, smooth=  Smooth.None), Text(extent=  {{12, -54}, {166, -84}}, lineColor=  {0, 0, 255}, textString=  "%name"), Text(extent=  {{-100, -40}, {-4, -62}}, lineColor=  {0, 0, 255}, textString=  "%MaxReab = MaxReab")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end FractReabsorbtion;

    model FractReabsorbtion2
      PositiveConcentrationFlow Inflow annotation(Placement(transformation(extent = {{-120, -18}, {-80, 22}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      NegativeConcentrationFlow Outflow annotation(Placement(transformation(extent = {{0, -100}, {40, -60}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      NegativeConcentrationFlow Reabsorbtion annotation(Placement(transformation(extent = {{-20, -100}, {20, -60}}), iconTransformation(extent = {{-10, -50}, {10, -30}})));
      PhysiolibraryOld.Interfaces.RealInput_ Normal(final unit="1") annotation
        (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={-60,40})));
      PhysiolibraryOld.Interfaces.RealInput_ Effects(final unit="1")
        annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={80,40})));
      Real ReabFract(final unit = "1");
      PhysiolibraryOld.Interfaces.RealInput_ MaxReab annotation (Placement(
            transformation(extent={{-20,20},{20,60}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-60,-42})));
    equation
      Outflow.q + Inflow.q + Reabsorbtion.q = 0;
      Outflow.conc = Inflow.conc;
      Reabsorbtion.q = -min(ReabFract * Inflow.q, MaxReab);
      ReabFract = if Normal <= 0 or Effects <= 0 then 0 else if Normal > 1 then 1 else Normal ^ (1 / Effects);
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 40}, {100, -40}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Line(points=  {{-70, 14}, {-70, -18}, {-52, -12}, {-36, -14}, {-18, -20}, {-2, -28}, {6, -36}, {8, -40}, {6, -22}, {0, -12}, {-8, -6}, {-22, 2}, {-40, 8}, {-58, 12}, {-70, 14}}, color=  {0, 0, 255}, smooth=  Smooth.None), Text(extent=  {{12, -42}, {166, -72}}, lineColor=  {0, 0, 255}, textString=  "%name")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end FractReabsorbtion2;

    model ConstLimitedReabsorbtion
      PositiveConcentrationFlow Inflow annotation(Placement(transformation(extent = {{-120, -18}, {-80, 22}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      NegativeConcentrationFlow Outflow annotation(Placement(transformation(extent = {{0, -100}, {40, -60}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      NegativeConcentrationFlow Reabsorbtion annotation(Placement(transformation(extent = {{-20, -100}, {20, -60}}), iconTransformation(extent = {{-10, -50}, {10, -30}})));
      parameter SoluteFlow MaxReab = 250 "maximum reabsorbtion solute flow";
    equation
      Outflow.q + Inflow.q + Reabsorbtion.q = 0;
      Outflow.conc = Inflow.conc;
      Reabsorbtion.q = -min(Inflow.q, MaxReab);
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 40}, {100, -40}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Line(points=  {{-70, 14}, {-70, -18}, {-52, -12}, {-36, -14}, {-18, -20}, {-2, -28}, {6, -36}, {8, -40}, {6, -22}, {0, -12}, {-8, -6}, {-22, 2}, {-40, 8}, {-58, 12}, {-70, 14}}, color=  {0, 0, 255}, smooth=  Smooth.None), Text(extent=  {{12, -42}, {166, -72}}, lineColor=  {0, 0, 255}, textString=  "%name"), Text(extent=  {{-100, -40}, {-4, -62}}, lineColor=  {0, 0, 255}, textString=  "%MaxReab = MaxReab")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end ConstLimitedReabsorbtion;

    model FlowConcentrationMeasure
      PositiveConcentrationFlow q_in annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -8}, {-90, 12}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      PhysiolibraryOld.Interfaces.RealInput_ SolventFlow(final quantity="Flow",
          final unit="ml/min") annotation (extent=[-10,50; 10,70], rotation=-90);
      Interfaces.RealInput_ AdditionalSoluteFlow annotation(Placement(transformation(extent = {{-60, 60}, {-20, 100}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, -60})));
      Interfaces.RealOutput_ Conc annotation(Placement(transformation(extent = {{82, -20}, {122, 20}}), iconTransformation(extent = {{82, -20}, {122, 20}})));
    equation
      Conc = q_in.conc + AdditionalSoluteFlow / SolventFlow;
      q_in.q = 0;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -50}, {100, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-88, -50}, {80, 50}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end FlowConcentrationMeasure;

    model SimpleReaction
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}})));
      PhysiolibraryOld.Interfaces.RealInput_ coef
        "who much units of q_out produce one unit of q_in"
        annotation (extent=[-10,30; 10,50], rotation=-90);
      PhysiolibraryOld.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
    equation
      q_out.q + coef * q_in.q = 0;
      q_out.conc = coef * q_in.conc;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -28}, {100, 30}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-128, -60}, {142, -34}}, textString=  "%name", lineColor=  {0, 0, 255}), Polygon(points=  {{-60, 4}, {-60, 2}, {54, 2}, {54, 2}, {18, 12}, {18, 4}, {-60, 4}}, lineColor=  {0, 0, 0}, smooth=  Smooth.None, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end SimpleReaction;

    model SimpleReaction2
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,20},{110,40}}), iconTransformation(extent={{90,20},{110,40}})));
      PhysiolibraryOld.Interfaces.RealInput_ coef
        "who much units of q_out produce one unit of q_in"
        annotation (extent=[-10,30; 10,50], rotation=-90);
      PhysiolibraryOld.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out2
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}}), iconTransformation(extent={{90,-40},{110,
                -20}})));
      Interfaces.RealInput_ coef2
        "who much units of q_out2 produce one unit of q_in"                           annotation(Placement(transformation(extent = {{-54, 20}, {-14, 60}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {60, 40})));
    equation
      q_out.q + coef * q_in.q = 0;
      q_out2.q + coef2 * q_in.q = 0;
      q_out.conc = coef * q_in.conc;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -30}, {100, 30}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-128, -66}, {142, -40}}, textString=  "%name", lineColor=  {0, 0, 255}), Polygon(points=  {{-60, 4}, {-60, 2}, {54, 2}, {54, 2}, {18, 12}, {18, 4}, {-60, 4}}, lineColor=  {0, 0, 0}, smooth=  Smooth.None, fillColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end SimpleReaction2;

    model UnlimitedStorage
      //extends HumMod.Library.Interfaces.BaseModel;
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (Placement(transformation(extent={{62,-32},{102,8}}),
            iconTransformation(extent={{-8,-10},{12,10}})));
      parameter Real concentration(final unit = "%");
    equation
      q_out.conc = 0.01 * concentration;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent=  {{-100, 102}, {100, 124}}, lineColor=  {0, 0, 0}, fillPattern=  FillPattern.VerticalCylinder, fillColor=  {215, 215, 215}, textString=  "(%concentration%%)"), Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/massStorage.png")}), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end UnlimitedStorage;

    model ConcentrationCompartment
      extends PhysiolibraryOld.Utilities.DynamicState;
      //extends QHP.Library.Interfaces.BaseModel;
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (Placement(transformation(extent={{62,-32},{102,8}}),
            iconTransformation(extent={{-10,-10},{10,10}})));
      parameter Real initialSoluteMass;
      PhysiolibraryOld.Interfaces.RealInput_ SolventVolume(final quantity=
            "Volume", final unit="ml") annotation (Placement(transformation(
              extent={{-120,68},{-80,108}}), iconTransformation(extent={{-100,
                40},{-60,80}})));
      PhysiolibraryOld.Interfaces.RealOutput_ soluteMass(start=
            initialSoluteMass) annotation (Placement(transformation(
            extent={{-20,-120},{20,-80}},
            rotation=-90,
            origin={102,-102}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-78})));
      //, min=0)
      //initial equation
      //  soluteMass = initialSoluteMass;
    equation
      //assert(soluteMass>=0,"Solute mass has to be positive value!");
      q_out.conc = if SolventVolume > 0 then soluteMass / SolventVolume else 0;
      //  q_out.conc = if initial() or (SolventVolume>0) then soluteMass / SolventVolume else 0;
      //  der(soluteMass) = q_out.q / Library.SecPerMin;
      stateValue = soluteMass;
      changePerMin = q_out.q;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/concentrationCompartement.png"), Text(extent=  {{-22, -102}, {220, -136}}, lineColor=  {0, 0, 255}, textString=  "%name")}), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end ConcentrationCompartment;

    model MassStorageCompartment
      //extends QHP.Library.Interfaces.BaseModel;
      extends PhysiolibraryOld.Utilities.DynamicState;
      parameter Real MINUTE_FLOW_TO_MASS_CONVERSION = 1
        "this constant will multiply the flow inside integration to mass";
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (Placement(transformation(extent={{62,-32},{102,8}}),
            iconTransformation(extent={{-10,-10},{10,10}})));
      parameter SoluteMass initialSoluteMass;
      PhysiolibraryOld.Interfaces.RealOutput_ soluteMass(start=
            initialSoluteMass) annotation (Placement(transformation(
            extent={{-14,-120},{26,-80}},
            rotation=-90,
            origin={0,2}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-74})));
      //initial equation
      //  soluteMass = initialSoluteMass;
    equation
      q_out.conc = soluteMass;
      //der(soluteMass) = q_out.q / Library.SecPerMin;
      stateValue = soluteMass;
      changePerMin = q_out.q * MINUTE_FLOW_TO_MASS_CONVERSION;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/massStorage.png"), Text(extent=  {{-94, 134}, {98, 106}}, lineColor=  {0, 0, 255}, textString=  "%name")}), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end MassStorageCompartment;

    model SolventFlowPump_InitialPatch
      PhysiolibraryOld.ConcentrationFlow.NegativeConcentrationFlow q_out
        "second side connector with value of q (solute mass flow) and conc (concentration)"
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}})));
      Interfaces.RealInput_ solventFlow
        "solvent flow (solution volume flow = solventFlow + solute volume flow)"
                                                                                                            annotation(extent = [-10, 50; 10, 70], rotation = -90);
      PhysiolibraryOld.ConcentrationFlow.PositiveConcentrationFlow q_in
        "first side connector with value of q (solute mass flow) and conc (concentration)"
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = solventFlow * q_in.conc;
      // assert(solventFlow < 0, "BAD FLOW DIRECTION !!!");
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -50}, {100, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-150, -100}, {150, -60}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
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
      </html>", info = "<html>
      <p><h4><font color=\"#008000\">Bidirectional mass flow by concentration</font></h4></p>
      <p>Possible field values: </p>
      <table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
      <td></td>
      <td><p align=\"center\">forward flow</p></td>
      <td><p align=\"center\">backward flow</p></td>
      </tr>
      <tr>
      <td><p align=\"center\"><h4>solventFlow</h4></p></td>
      <td><p align=\"center\">&GT;=0</p></td>
      <td><p align=\"center\">&LT;0</p></td>
      </tr>
      <tr>
      <td><p align=\"center\"><h4>q_in.q</h4></p></td>
      <td><p align=\"center\">=solventFlow*q_in.conc</p></td>
      <td><p align=\"center\">=solventFlow*q_out.conc</p></td>
      </tr>
      <tr>
      <td><p align=\"center\"><h4>q_out.q</h4></p></td>
      <td><p align=\"center\">=-q_in.q</p></td>
      <td><p align=\"center\">=-q_in.q</p></td>
      </tr>
      </table>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end SolventFlowPump_InitialPatch;
  end ConcentrationFlow;

  package HeatFlow "Temperature Physical Domain"
    connector HeatFlowConnector "Heat flow connector"
      Real T(final unit = "K") "temperature";
      flow Real q(final unit = "kCal/min") "heat flow";
      annotation(Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end HeatFlowConnector;

    connector PositiveHeatFlow "Heat inflow"
      extends PhysiolibraryOld.HeatFlow.HeatFlowConnector;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-18, 10}, {22, -10}}, lineColor=  {255, 128, 0}, lineThickness=  1), Ellipse(extent=  {{-100, 100}, {100, -100}}, lineColor=  {176, 88, 0}, fillColor=  {255, 128, 0}, fillPattern=  FillPattern.Solid)}), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end PositiveHeatFlow;

    connector NegativeHeatFlow "Heat outflow"
      extends PhysiolibraryOld.HeatFlow.HeatFlowConnector;
      annotation(defaultComponentName = "q_out", Coordsys(extent = [-100, -100; 100, 100], grid = [1, 1], component = [20, 20], scale = 0.2), Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true), Polygon(points = [-100, 0; 0, 100; 100, 0; 0, -100; -100, 0], style(color = 74, rgbcolor = {200, 200, 0}, fillColor = 0, rgbfillColor = {255, 240, 240})), graphics = {Rectangle(extent=  {{-20, 10}, {20, -10}}, lineColor=  {255, 128, 0}, lineThickness=  1), Ellipse(extent=  {{-100, 100}, {100, -100}}, lineColor=  {176, 88, 0}, fillColor=  {255, 170, 85}, fillPattern=  FillPattern.Solid)}), Diagram(Polygon(points = [-21, -3; 5, 23; 31, -3; 5, -29; -21, -3], style(color = 74, rgbcolor = {0, 0, 0}, fillColor = 0, rgbfillColor = {255, 255, 255})), Text(extent = [-105, -38; 115, -83], string = "%name", style(color = 0, rgbcolor = {0, 0, 0}))), Documentation(info = "<html>
      <p>
      Connector with one flow signal of type Real.
      </p>
      </html>", revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end NegativeHeatFlow;

    partial model ResistorBase
      extends PhysiolibraryOld.Icons.Resistor;
      PositiveHeatFlow q_in annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      NegativeHeatFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, -10}, {110, 10}})));
      //Real ActualConductance;
    equation
      //  ActualConductance = if (q_in.T == q_out.T) then 0 else q_in.q/(q_in.T - q_out.T);
      annotation(Icon(graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end ResistorBase;

    partial model Resistor
      extends ResistorBase;
    equation
      q_in.q + q_out.q = 0;
      annotation(Icon(graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end Resistor;

    model ResistorWithCond
      extends Resistor;
      PhysiolibraryOld.Interfaces.RealInput_ cond(final quantity="Conductance",
          final unit="kCal/(min.K)")
        annotation (extent=[-5,30; 5,50], rotation=-90);
    equation
      q_in.q = cond * (q_in.T - q_out.T);
      annotation(Icon(graphics = {Text(extent=  {{-70, -30}, {70, 30}}, textString=  "%name", lineColor=  {0, 0, 255})}), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end ResistorWithCond;

    model ResistorWithCondParam
      extends Resistor;
      parameter Real cond;
    equation
      q_in.q = cond * (q_in.T - q_out.T);
      annotation(Icon(graphics = {Text(extent=  {{-70, -8}, {70, 10}}, lineColor=  {0, 0, 0}, textString=  "%cond (kcal/min)/K")}), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end ResistorWithCondParam;

    model HeatFlux "flow circuit through mass with different temperature"
      NegativeHeatFlow q_out "surrounding mass" annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-10, -60}, {10, -40}}), iconTransformation(extent = {{-10, -60}, {10, -40}})));
      Interfaces.RealInput_ substanceFlow(final unit = "kg/min")
        "flowing speed in circuit"                                                          annotation(extent = [-10, 50; 10, 70], rotation = -90);
      PositiveHeatFlow q_in "flow circuit" annotation(Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      parameter Real specificHeat(unit = "kCal/kg/K") "of flow circuit medium";
    equation
      q_in.q + q_out.q = 0;
      q_in.q = substanceFlow * (q_in.T - q_out.T) * specificHeat;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -50}, {100, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{20, -84}, {320, -44}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end HeatFlux;

    model HeatOutflow
      "heat outflow through vaporization and outflowing heatted steam"
      Interfaces.RealInput_ liquidOutflow(final unit = "kg/min")
        "speed of vaporization"                                                          annotation(extent = [-10, 50; 10, 70], rotation = -90);
      PositiveHeatFlow q_in "flow circuit" annotation(Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      parameter Real TempToolsVapor(final unit = "kCal/kg") = 580.0
        "needed heat to vaporization";
      parameter Real specificHeat(final unit = "kCal/kg/K") = 1 "of liquid";
    equation
      q_in.q = liquidOutflow * (q_in.T * specificHeat + TempToolsVapor);
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -50}, {100, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{20, -84}, {320, -44}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end HeatOutflow;

    model InputPump
      NegativeHeatFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{50, -10}, {70, 10}})));
      PhysiolibraryOld.Interfaces.RealInput_ desiredFlow "speed of heat flow"
        annotation (extent=[-10,30; 10,50], rotation=-90);
    equation
      q_out.q = -desiredFlow;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-60, -30}, {60, 30}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-48, 20}, {50, 0}, {-48, -21}, {-48, 20}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid), Text(extent=  {{-92, -54}, {80, -30}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end InputPump;

    model HeatAccumulation
      "accumulating heat to substance mass with specific heat constant"
      extends PhysiolibraryOld.Utilities.DynamicState;
      extends Interfaces.BaseModel;
      PositiveHeatFlow q_in "heat inflow/outflow connector" annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}})));
      //(T(start=initialTemperature))
      parameter Real initialHeatMass
        "=weight[kg]*initialTemperature[K]*(specificHeat[kCal/kg/K])";
      //  parameter Real initialTemperature(final unit="K")=310.15
      //    "to calculate initial heat";                                                        //==37 degC
      parameter Real specificHeat(final unit = "kCal/kg/K") = 1
        "of the mass, where the heat are accumulated";
      //  Real heatMass(start=weight*specificHeat*initialTemperature, final unit="kCal")
      Real heatMass(start = initialHeatMass, final unit = "kCal")
        "accumulated heat";
      Real T_degC(final unit = "degC") "temperature in celsius degrees";
      Interfaces.RealInput_ weight(final unit = "kg")
        "weight of mass, where the heat are accumulated"                                               annotation(Placement(transformation(extent = {{-122, 60}, {-82, 100}}), iconTransformation(extent = {{-120, 60}, {-80, 100}})));
      Interfaces.RealOutput_ T(unit = "degC") annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, -100})));
      //initial equation
      //  heatMass=weight*specificHeat*initialTemperature;
    equation
      //  der(heatMass)=q_in.q/Library.SecPerMin;
      q_in.T = heatMass / (weight * specificHeat);
      T_degC = q_in.T - 273.15;
      T = T_degC;
      stateValue = heatMass;
      changePerMin = q_in.q;
      annotation(Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end HeatAccumulation;

    model AmbientTemperature "constant temperature, undefinned heat flow"
      extends Interfaces.BaseModel;
      PositiveHeatFlow q_in "heat inflow/outflow connector" annotation(Placement(transformation(extent = {{-20, -20}, {20, 20}})));
      parameter Real Temperature(final unit = "K") = 295.37
        "to calculate initial heat";
      //==22 degC
      Real T_degC(final unit = "degC") "temperature in celsius degrees";
    equation
      q_in.T = Temperature;
      T_degC = q_in.T - 273.15;
      annotation(Icon(graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end AmbientTemperature;

    model Pump
      NegativeHeatFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{50, -10}, {70, 10}})));
      PhysiolibraryOld.Interfaces.RealInput_ desiredFlow(unit="ml/min")
        "speed of liquid flow" annotation (extent=[-10,30; 10,50], rotation=-90);
      PositiveHeatFlow q_in annotation(Placement(transformation(extent = {{-70, -10}, {-50, 10}})));
      parameter Real specificHeat(unit = "kCal/ml/K") "of flow circuit medium";
    equation
      q_in.q + q_out.q = 0;
      q_in.q = specificHeat * q_in.T * desiredFlow;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-60, -30}, {60, 30}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-48, 20}, {50, 0}, {-48, -21}, {-48, 20}}, lineColor=  {255, 0, 0}, fillColor=  {255, 0, 0}, fillPattern=  FillPattern.Solid), Text(extent=  {{-92, -54}, {80, -30}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end Pump;

    model OutputPump
      PhysiolibraryOld.Interfaces.RealInput_ desiredFlow(unit="ml/min")
        "speed of liquid flow" annotation (extent=[-10,30; 10,50], rotation=-90);
      PositiveHeatFlow q_in annotation(Placement(transformation(extent = {{-70, -10}, {-50, 10}})));
      parameter Real specificHeat(unit = "kCal/ml/K") "of flow circuit medium";
    equation
      q_in.q = specificHeat * q_in.T * desiredFlow;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-60, -30}, {60, 30}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-48, 20}, {50, 0}, {-48, -21}, {-48, 20}}, lineColor=  {255, 0, 0}, fillColor=  {255, 0, 0}, fillPattern=  FillPattern.Solid), Text(extent=  {{-92, -54}, {80, -30}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end OutputPump;
  end HeatFlow;

  package PressureFlow "Hydraulic Physical Domain"
    connector PressureFlow "Pressure[mmHg] and Flow[ml/min]"
      Real pressure(final quantity = "Pressure", final unit = "mmHg");
      flow Real q(final quantity = "Flow", final unit = "ml/min") "flow";
      annotation(Documentation(revisions = "<html>
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
      </html>", info = "<html>
      <p><font style=\"font-size: 9pt; \">This connector connects hydraulic domains elements. The elements contains one equation for each his pressure-flow connector. The equation defines relation between variables in the connector. Variables are hydraulic pressure and volume flow of hydraulic medium. The pressure is the same in each connector that are connected together. The sum of flow in connectors connected together is zero (</font><b><font style=\"font-size: 9pt; \">Kirchhoff&apos;s circuit laws</font></b><font style=\"font-size: 9pt; \">).</font> </p>
      </html>"));
    end PressureFlow;

    connector PositivePressureFlow "Pressure[mmHg] and Inflow[ml/min]"
      extends PressureFlow;
      annotation(defaultComponentName = "q_in", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-20, 10}, {20, -10}}, lineColor=  {0, 0, 0}, lineThickness=  1), Polygon(points=  {{0, 100}, {100, 0}, {0, -100}, {-100, 0}, {0, 100}}, lineColor=  {0, 0, 0}, smooth=  Smooth.None, fillPattern=  FillPattern.Solid, fillColor=  {0, 0, 0})}), Diagram(Polygon(points = [-21, -3; 5, 23; 31, -3; 5, -29; -21, -3], style(color = 74, rgbcolor = {0, 0, 0}, fillColor = 0, rgbfillColor = {0, 0, 0})), Text(extent = [-105, -38; 115, -83], string = "%name", style(color = 0, rgbcolor = {0, 0, 0}))));
    end PositivePressureFlow;

    connector NegativePressureFlow
      "Pressure[mmHg] and negative Outflow[ml/min]"
      extends PressureFlow;
      annotation(defaultComponentName = "q_out", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-20, 10}, {20, -10}}, lineColor=  {0, 0, 0}, lineThickness=  1), Polygon(points=  {{0, 100}, {100, 0}, {0, -100}, {-100, 0}, {0, 100}}, lineColor=  {0, 0, 0}, smooth=  Smooth.None, fillPattern=  FillPattern.Solid, fillColor=  {200, 200, 200})}), Diagram(Polygon(points = [-21, -3; 5, 23; 31, -3; 5, -29; -21, -3], style(color = 74, rgbcolor = {0, 0, 0}, fillColor = 0, rgbfillColor = {0, 0, 0})), Text(extent = [-105, -38; 115, -83], string = "%name", style(color = 0, rgbcolor = {0, 0, 0}))));
    end NegativePressureFlow;

    model FlowMeasure
      "Convert connector volume flow value to signal flow value"
      NegativePressureFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{18, -10}, {38, 10}}), iconTransformation(extent = {{50, -10}, {70, 10}})));
      PositivePressureFlow q_in annotation(Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(extent = {{-70, -10}, {-50, 10}})));
      PhysiolibraryOld.Interfaces.RealOutput_ actualFlow(final quantity="Flow",
          final unit="ml/min") annotation (Placement(transformation(extent={{-20,
                30},{20,70}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,54})));
    equation
      q_in.q + q_out.q = 0;
      q_out.pressure = q_in.pressure;
      actualFlow = q_in.q;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-60, 60}, {60, -60}}, fileName=  "icons/flowMeassure.png")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end FlowMeasure;

    model PressureMeasure
      "Convert connector hydraulic pressure value to signal flow value"
      PhysiolibraryOld.PressureFlow.PositivePressureFlow q_in annotation (
          Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-30,-50},{-10,-30}})));
      PhysiolibraryOld.Interfaces.RealOutput_ actualPressure annotation (
          Placement(transformation(extent={{-20,30},{20,70}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={52,-20})));
    equation
      actualPressure = q_in.pressure;
      q_in.q = 0;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-56, 60}, {64, -60}}, fileName=  "icons/pressureMeassure.png")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end PressureMeasure;

    partial model ResistorBase "Hydraulic Volume Flow Resistance"
      extends PhysiolibraryOld.Icons.Resistor;
      PositivePressureFlow q_in annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      NegativePressureFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, -10}, {110, 10}})));
      //Real ActualConductance;
    equation
      //  ActualConductance = if (- Modelica.Constants.eps < (q_in.pressure - q_out.pressure)) and ( Modelica.Constants.eps > (q_in.pressure - q_out.pressure)) then
      //                         0 else
      //  q_in.q/(q_in.pressure - q_out.pressure);
      annotation(Documentation(revisions = "<html>
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
      </html>", info = "<html>
      <p>This hydraulic conductance (resistance) element contains two connector sides. No hydraulic medium volume is changing in this element during simulation. That means that sum of flow in both connector sides is zero. The flow through element is determined by <b>Ohm&apos;s law</b>. It is used conductance (=1/resistance) because it could be numerical zero better then infinity in resistance. </p>
      </html>"), Icon(graphics), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end ResistorBase;

    partial model ResistorBase2 "Hydraulic Volume Flow Resistance"
      extends PhysiolibraryOld.Icons.Resistor;
      PositivePressureFlow q_in annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      NegativePressureFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -10}, {-90, 10}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      Real ActualConductance;
    equation
      ActualConductance = if abs(q_in.pressure - q_out.pressure) < Modelica.Constants.small then 0 else q_in.q / (q_in.pressure - q_out.pressure);
      annotation(Documentation(revisions = "<html>
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
      </html>", info = "<html>
      <p>This hydraulic conductance (resistance) element contains two connector sides. No hydraulic medium volume is changing in this element during simulation. That means that sum of flow in both connector sides is zero. The flow through element is determined by <b>Ohm&apos;s law</b>. It is used conductance (=1/resistance) because it could be numerical zero better then infinity in resistance. </p>
      </html>"), Icon(graphics), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end ResistorBase2;

    partial model Resistor
      extends ResistorBase;
    equation
      q_in.q + q_out.q = 0;
      annotation(Icon(graphics));
    end Resistor;

    model ResistorWithCond
      extends Resistor;
      PhysiolibraryOld.Interfaces.RealInput_ cond(final quantity="Conductance",
          final unit="ml/(min.mmHg)")
        annotation (extent=[-5,30; 5,50], rotation=-90);
    equation
      q_in.q = cond * (q_in.pressure - q_out.pressure);
      annotation(Icon(graphics = {Text(extent=  {{-70, -30}, {70, 30}}, textString=  "%name", lineColor=  {0, 0, 255})}));
    end ResistorWithCond;

    model ResistorWithCondParam
      extends Resistor;
      parameter Real cond(final quantity = "Conductance", final unit = "ml/(min.mmHg)");
    equation
      q_in.q = cond * (q_in.pressure - q_out.pressure);
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Text(extent=  {{-70, 0}, {70, 30}}, lineColor=  {0, 0, 0}, textString=  "%cond"), Text(extent=  {{-134, -90}, {154, -30}}, textString=  "%name", lineColor=  {0, 0, 255}), Text(extent=  {{-70, -20}, {70, 0}}, lineColor=  {0, 0, 0}, textString=  "ml/min/mmHg")}));
    end ResistorWithCondParam;

    model PumpBase "Defined flow to/from/in system by real signal"
      Interfaces.RealInput_ desiredFlow(quantity = "Flow", unit = "ml/min")
        "desired volume flow value"                                                                     annotation(Placement(transformation(extent = {{-66, 50}, {-26, 90}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 60})));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -40}, {100, 60}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-80, 35}, {80, 10}, {-80, -15}, {-80, 35}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid), Text(extent=  {{-150, -90}, {150, -50}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
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
      </html>", info = "<html>
      <p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
      </html>"));
    end PumpBase;

    model InputPump
      extends PumpBase;
      NegativePressureFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, 0}, {110, 20}}), iconTransformation(extent = {{90, 0}, {110, 20}})));
    equation
      q_out.q = -desiredFlow;
      annotation(Icon(graphics));
    end InputPump;

    model OutputPump
      extends PumpBase;
      PositivePressureFlow q_in annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -8}, {-90, 12}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
    equation
      q_in.q = desiredFlow;
    end OutputPump;

    model Pump
      extends PumpBase;
      NegativePressureFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{92, -10}, {112, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      PositivePressureFlow q_in annotation(Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = desiredFlow;
      annotation(Icon(graphics));
    end Pump;

    model PressurePumpBase "Defined pressure to/from/in system by real signal"
      Interfaces.RealInput_ desiredPressure(quantity = "Pressure", unit = "mmHg")
        "desired pressure flow value"                                                                           annotation(Placement(transformation(extent = {{-66, 50}, {-26, 90}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 60})));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-80, 60}, {80, -60}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor=  {255, 170, 170}, fillColor=  {255, 170, 170}, fillPattern=  FillPattern.Solid), Text(extent=  {{-150, -94}, {150, -54}}, textString=  "%name", lineColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid, fillColor=  {255, 170, 170}), Text(extent=  {{-36, -72}, {-152, 98}}, lineColor=  {255, 170, 170}, fillColor=  {255, 170, 170}, fillPattern=  FillPattern.Solid, textString=  "")}));
    end PressurePumpBase;

    model InputPressurePump
      extends PressurePumpBase;
      NegativePressureFlow p_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, 0}, {110, 20}}), iconTransformation(extent = {{70, -10}, {90, 10}})));
    equation
      p_out.pressure = desiredPressure;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end InputPressurePump;

    model OutputPressurePump
      extends PressurePumpBase;
      PositivePressureFlow p_in annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, 0}, {110, 20}}), iconTransformation(extent = {{-90, -10}, {-70, 10}})));
    equation
      p_in.pressure = desiredPressure;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics));
    end OutputPressurePump;

    model ReabsorbtionWithMinimalOutflow
      "Divide inflow to outflow and reabsorbtion if it is under defined treshold"
      PositivePressureFlow Inflow annotation(Placement(transformation(extent = {{-100, 40}, {-60, 80}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      NegativePressureFlow Outflow annotation(Placement(transformation(extent = {{58, 40}, {98, 80}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      NegativePressureFlow Reabsorbtion annotation(Placement(transformation(extent = {{-12, -98}, {28, -58}}), iconTransformation(extent = {{-10, -110}, {10, -90}})));
      PhysiolibraryOld.Interfaces.RealInput_ FractReab annotation (Placement(
            transformation(extent={{-60,-26},{-48,-14}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={94,-56})));
      PhysiolibraryOld.Interfaces.RealInput_ OutflowMin(final quantity="Flow",
          final unit="ml/min") annotation (Placement(transformation(extent={{-44,
                84},{-32,96}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={34,50})));
      FlowMeasure flowMeasure annotation(Placement(transformation(extent = {{-38, 22}, {-18, 2}})));
      Factors.SimpleMultiply simpleMultiply annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-28, -20})));
      Pump reabsorbtion annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {10, -34})));
      Pump MinimalFlow annotation(Placement(transformation(extent = {{10, 10}, {-10, -10}}, rotation = 180, origin = {-2, 60})));
      FlowMeasure flowMeasure1 annotation(Placement(transformation(extent = {{-66, 50}, {-46, 70}})));
      Modelica.Blocks.Math.Min min annotation(Placement(transformation(extent = {{-24, 82}, {-14, 92}})));
    equation
      connect(flowMeasure.actualFlow, simpleMultiply.yBase) annotation(Line(points = {{-28, 6.6}, {-28, -18}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(simpleMultiply.u, FractReab) annotation(Line(points = {{-37.8, -20}, {-54, -20}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(reabsorbtion.q_out, Reabsorbtion) annotation(Line(points = {{10, -44}, {10, -78}, {8, -78}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(simpleMultiply.y, reabsorbtion.desiredFlow) annotation(Line(points = {{-28, -22}, {-28, -34}, {4, -34}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(flowMeasure.q_out, Outflow) annotation(Line(points = {{-22, 12}, {43, 12}, {43, 60}, {78, 60}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(flowMeasure.q_out, reabsorbtion.q_in) annotation(Line(points = {{-22, 12}, {10, 12}, {10, -24}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(Inflow, flowMeasure1.q_in) annotation(Line(points = {{-80, 60}, {-62, 60}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(flowMeasure1.q_out, flowMeasure.q_in) annotation(Line(points = {{-50, 60}, {-42, 60}, {-42, 12}, {-34, 12}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(flowMeasure1.q_out, MinimalFlow.q_in) annotation(Line(points = {{-50, 60}, {-12, 60}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(MinimalFlow.q_out, Outflow) annotation(Line(points = {{8, 60}, {78, 60}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(OutflowMin, min.u1) annotation(Line(points = {{-38, 90}, {-25, 90}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(flowMeasure1.actualFlow, min.u2) annotation(Line(points = {{-56, 65.40000000000001}, {-56, 84}, {-25, 84}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(min.y, MinimalFlow.desiredFlow) annotation(Line(points = {{-13.5, 87}, {-2, 87}, {-2, 66}}, color = {0, 0, 127}, smooth = Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent=  {{-100, 134}, {100, 106}}, lineColor=  {0, 0, 255}, textString=  "%name"), Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/reabsorbtion2.jpg")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end ReabsorbtionWithMinimalOutflow;

    model Reabsorbtion "Divide inflow to outflow and reabsorbtion"
      PositivePressureFlow Inflow annotation(Placement(transformation(extent = {{-106, -18}, {-66, 22}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      NegativePressureFlow Outflow annotation(Placement(transformation(extent = {{50, -18}, {90, 22}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      NegativePressureFlow Reabsorbtion annotation(Placement(transformation(extent = {{-20, -100}, {20, -60}}), iconTransformation(extent = {{-10, -110}, {10, -90}})));
      PhysiolibraryOld.Interfaces.RealInput_ FractReab annotation (Placement(
            transformation(extent={{-74,-38},{-58,-22}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={104,-46})));
      FlowMeasure flowMeasure annotation(Placement(transformation(extent = {{-48, 12}, {-28, -8}})));
      Factors.SimpleMultiply simpleMultiply annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-38, -30})));
      Pump pump annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270, origin = {0, -44})));
    equation
      connect(Inflow, flowMeasure.q_in) annotation(Line(points = {{-86, 2}, {-44, 2}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(flowMeasure.actualFlow, simpleMultiply.yBase) annotation(Line(points = {{-38, -3.4}, {-38, -28}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(simpleMultiply.u, FractReab) annotation(Line(points = {{-47.8, -30}, {-66, -30}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(pump.q_out, Reabsorbtion) annotation(Line(points = {{-1.83697e-015, -54}, {0, -54}, {0, -80}, {0, -80}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(simpleMultiply.y, pump.desiredFlow) annotation(Line(points = {{-38, -32}, {-38, -44}, {-6, -44}}, color = {0, 0, 127}, smooth = Smooth.None));
      connect(flowMeasure.q_out, Outflow) annotation(Line(points = {{-32, 2}, {70, 2}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      connect(flowMeasure.q_out, pump.q_in) annotation(Line(points = {{-32, 2}, {1.83697e-015, 2}, {1.83697e-015, -34}}, color = {0, 0, 0}, thickness = 1, smooth = Smooth.None));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent=  {{-100, 130}, {100, 108}}, lineColor=  {0, 0, 255}, textString=  "%name"), Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/reabsorbtion.png")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end Reabsorbtion;

    model GravityHydrostaticDifferenceWithPumpEffect
      "Create hydrostatic pressure between connectors in different altitude with specific pressure pump effect"
      PositivePressureFlow q_up annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -8}, {-90, 12}}), iconTransformation(extent = {{62, 38}, {82, 58}})));
      PositivePressureFlow q_down annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -8}, {-90, 12}}), iconTransformation(extent = {{60, -64}, {80, -44}})));
      Interfaces.RealInput_ height(final unit = "cm") annotation(Placement(transformation(extent = {{22, -18}, {62, 22}}), iconTransformation(extent = {{15, -15}, {-15, 15}}, rotation = 180, origin = {-61, -3})));
      // constant Real g(final unit="m/s2")=9.81; //gravity acceleration constant
      parameter Real ro(final unit = "kg/m3") = 1060;
      //liquid density
      //TorsoArtyGradient  =  TorsoCM * Gravity_Gz * ArtyFractGz;  //Hydrostatic pressure: P=ro.g.h
      //cm *  0.01 m/cm * 9.81 m/s² * 1060 kg/m3 * 1/133.322 mmHg/Pa
      //= height[cm] * 0.77996129671022036873134216408395 [mmHg]
      //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.
      //bloodDensity = 1060 kg/m3
      //gravityAcceleration = 9.81 m/s2
      //Pa2mmHg = 1/133.322 mmHg/Pa
      //cm2m = 0.01 m/cm
      //averageHydrostaticHeight = TorsoCM * postureCoef[Status_Posture]
      //hydrostaticPressure = averageHydrostaticHeight * cm2m * bloodDensity * gravityAcceleration * Pa2mmHg
      //                    = 0.77996 * averageHydrostaticHeight
      Interfaces.RealInput_ pumpEffect annotation(Placement(transformation(extent = {{22, -18}, {62, 22}}), iconTransformation(extent = {{15, -15}, {-15, 15}}, rotation = 90, origin = {-15, 95})));
      Interfaces.RealInput_ G(final unit = "m/(s.s)") annotation(Placement(transformation(extent = {{22, -18}, {62, 22}}), iconTransformation(extent = {{15, -15}, {-15, 15}}, rotation = 270, origin = {15, -85})));
    equation
      q_down.pressure = q_up.pressure + G * ro * height / 100 * 760 / 101325 * pumpEffect;
      //Library.NonSIunits.to_mmHg(
      q_up.q + q_down.q = 0;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-30, -58}, {30, 72}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-62, -21}, {62, 21}}, textString=  "%name", lineColor=  {0, 0, 255}, origin=  {0, 5}, rotation=  90), Line(points=  {{-28, 44}, {0, 72}, {28, 44}}, color=  {0, 0, 255}, smooth=  Smooth.None, thickness=  0.5), Bitmap(extent=  {{-100, 102}, {100, -98}}, fileName=  "icons/hydrostaticGradient.png")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end GravityHydrostaticDifferenceWithPumpEffect;

    model GravityHydrostaticDifference
      "Create hydrostatic pressure between connectors in different altitude"
      PositivePressureFlow q_up annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -8}, {-90, 12}}), iconTransformation(extent = {{62, 38}, {82, 58}})));
      PositivePressureFlow q_down annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -8}, {-90, 12}}), iconTransformation(extent = {{60, -66}, {80, -46}})));
      Interfaces.RealInput_ height(final unit = "cm") annotation(Placement(transformation(extent = {{22, -18}, {62, 22}}), iconTransformation(extent = {{15, -15}, {-15, 15}}, rotation = 180, origin = {-61, -5})));
      //  constant Real g(final unit="m/s2")=9.81; //gravity acceleration constant
      parameter Real ro(final unit = "kg/m3") = 1060;
      //liquid density
      //TorsoArtyGradient  =  TorsoCM * Gravity_Gz * ArtyFractGz;  //Hydrostatic pressure: P=ro.g.h
      //cm *  0.01 m/cm * 9.81 m/s² * 1060 kg/m3 * 1/133.322 mmHg/Pa
      //= height[cm] * 0.77996129671022036873134216408395 [mmHg]
      //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.
      //bloodDensity = 1060 kg/m3
      //gravityAcceleration = 9.81 m/s2
      //Pa2mmHg = 1/133.322 mmHg/Pa
      //cm2m = 0.01 m/cm
      //averageHydrostaticHeight = TorsoCM * postureCoef[Status_Posture]
      //hydrostaticPressure = averageHydrostaticHeight * cm2m * bloodDensity * gravityAcceleration * Pa2mmHg
      //                    = 0.77996 * averageHydrostaticHeight
      Interfaces.RealInput_ G(final unit = "m/(s.s)") annotation(Placement(transformation(extent = {{22, -18}, {62, 22}}), iconTransformation(extent = {{15, -15}, {-15, 15}}, rotation = 270, origin = {15, -85})));
    equation
      q_down.pressure = q_up.pressure + G * ro * height / 100 * 760 / 101325;
      q_up.q + q_down.q = 0;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-30, -58}, {30, 72}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-62, -21}, {62, 21}}, textString=  "%name", lineColor=  {0, 0, 255}, origin=  {0, 5}, rotation=  90), Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/hydrostaticGradient.png")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end GravityHydrostaticDifference;

    model VolumeCompartement
      "Generate constant pressure independ on inflow or outflow"
      //extends Library.Interfaces.BaseModel;
      extends PhysiolibraryOld.Utilities.DynamicState;
      parameter Real pressure = 0;
      PositivePressureFlow con annotation(Placement(transformation(extent = {{100, -20}, {140, 20}}, rotation = 0), iconTransformation(extent = {{-120, -20}, {-80, 20}})));
      parameter Real initialVolume;
      Interfaces.RealOutput_ Volume(start = initialVolume) annotation(Placement(transformation(extent = {{-8, -120}, {32, -80}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {12, -100})));
      //initial equation
      //  Volume = initialVolume;
    equation
      /*if STEADY then
                                        der(Volume) = 0;
                                      else
                                        der(Volume) = con.q/Library.SecPerMin;
                                      end if;
                                    */
      /*if Volume<=0 and con.q<=0 then
                                        der(Volume) = 0;
                                      else
                                        con.pressure = pressure;
                                      end if;
                                     */
      if Volume > 0 or con.q > 0 then
        con.pressure = pressure;
      else
        con.q = 0;
      end if;
      stateValue = Volume;
      changePerMin = con.q;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics, lineColor = {0, 0, 0}), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid));
    end VolumeCompartement;

    model PressureControledCompartment
      "Multiple PressureFlow connector with pressures from multiple inputs"
      extends Interfaces.BaseModel;
      extends PhysiolibraryOld.Utilities.DynamicState;
      Interfaces.RealInput_ pressure(final quantity = "Pressure", final unit = "mmHg")
        "Pressure value input signal"                                                                                annotation(Placement(transformation(extent = {{-140, -20}, {-100, 20}}, rotation = 0), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 100})));
      PositivePressureFlow y "PressureFlow output connectors" annotation(Placement(transformation(extent = {{100, -20}, {140, 20}}, rotation = 0), iconTransformation(extent = {{-120, -20}, {-80, 20}})));
      parameter Real initialVolume;
      Interfaces.RealOutput_ Volume(start = initialVolume, final quantity = "Volume", final unit = "ml") annotation(Placement(transformation(extent = {{-20, -120}, {20, -80}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, -100})));
      //initial equation
      //  Volume = initialVolume;
      // der(Volume) = 0;
    equation
      /*  if STEADY then
                                          der(Volume) = 0;
                                      else
                                          der(Volume) = (ones(ncon)*y.q)/Library.SecPerMin;
                                      end if;
                                    */
      y.pressure = pressure;
      stateValue = Volume;
      changePerMin = y.q;
      annotation(Documentation(info = "<html>
      <p>Model has a vector of continuous Real input signals as pressures for vector of pressure-flow connectors. </p>
      <p>Usage in tests: Set defaul volume&GT;0 and try to set STEADY in instances to &QUOT;false&QUOT;!</p>
      </html>", revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end PressureControledCompartment;

    model Gas_FromMLtoMMOL
      "ideal gas conversion of flow units from ml to mmol, in connector should be absolute partial pressure of calculated gas"
      //  extends Modelica.SIunits.Conversions.ConversionIcon;
      PositivePressureFlow q_ML "flow in ml" annotation(Placement(transformation(extent = {{-110, -12}, {-90, 8}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      NegativePressureFlow q_MMOL "flow in mmol" annotation(Placement(transformation(extent = {{-110, -12}, {-90, 8}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      //  parameter Real gasConstant(unit="l.mmHg/(K.mol)") = 62.36367 "gas constant"; //= Modelica.Constants.R*760/101.325;
      parameter Real Temp(unit = "K") = 273.15;
      parameter Real P(unit = "mmHg") = 760;
      //  parameter Real mmolPerML(final unit="mmol/ml") = (P/T)/gasConstant
      //    "this density depends on substance";
      Interfaces.RealInput_ T annotation(Placement(transformation(extent = {{22, -18}, {62, 22}}), iconTransformation(extent = {{15, -15}, {-15, 15}}, rotation = 90, origin = {-3, 99})));
    equation
      q_ML.q * P * 101.325 / 760 / Temp / Modelica.Constants.R + q_MMOL.q = 0;
      q_ML.pressure = q_MMOL.pressure;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {191, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Line(points=  {{-90, 0}, {30, 0}}, color=  {191, 0, 0}), Polygon(points=  {{90, 0}, {30, 20}, {30, -20}, {90, 0}}, lineColor=  {191, 0, 0}, fillColor=  {191, 0, 0}, fillPattern=  FillPattern.Solid), Text(extent=  {{-115, 155}, {115, 105}}, textString=  "%name", lineColor=  {0, 0, 255}), Text(extent=  {{-20, 100}, {-100, 38}}, lineColor=  {0, 0, 0}, textString=  "Pa"), Text(extent=  {{100, -50}, {-40, -100}}, lineColor=  {0, 0, 0}, textString=  "mmHg"), Text(extent=  {{-56, 60}, {-94, 8}}, lineColor=  {0, 0, 0}, textString=  "ml"), Text(extent=  {{96, -20}, {-28, -70}}, lineColor=  {0, 0, 0}, textString=  "mmol"), Text(extent=  {{100, -108}, {-102, -130}}, lineColor=  {0, 0, 0}, textString=  "%mmolPerML mmol/ml")}), Documentation(revisions = "<html>
      <p><i>2009-2012</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end Gas_FromMLtoMMOL;

    model ResistorWith2Cond
      //extends Resistor;
      Interfaces.RealInput_ cond1(quantity = "Flow", unit = "ml/min")
        "desired volume flow value"                                                               annotation(Placement(transformation(extent = {{-66, 50}, {-26, 90}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {200, 40})));
      Interfaces.RealInput_ cond2(quantity = "Flow", unit = "ml/min")
        "desired volume flow value"                                                               annotation(Placement(transformation(extent = {{-66, 50}, {-26, 90}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 40})));
      PositivePressureFlow q_in annotation(Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      NegativePressureFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{92, -10}, {112, 10}}), iconTransformation(extent = {{290, -10}, {310, 10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = cond1 * cond2 / (cond1 + cond2) * (q_in.pressure - q_out.pressure);
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {300, 100}}), graphics = {Text(extent=  {{-100, -100}, {300, -40}}, textString=  "%name", lineColor=  {0, 0, 255}), Rectangle(extent=  {{130, 30}, {270, -30}}, lineColor=  {0, 0, 0}, fillColor=  {241, 241, 241}, fillPattern=  FillPattern.Solid), Line(points=  {{110, 0}, {130, 0}}, color=  {0, 0, 0}), Line(points=  {{270, 0}, {290, 0}}, color=  {0, 0, 0}), Rectangle(extent=  {{-70, 30}, {70, -30}}, lineColor=  {0, 0, 0}, fillColor=  {241, 241, 241}, fillPattern=  FillPattern.Solid), Line(points=  {{-90, 0}, {-70, 0}}, color=  {0, 0, 0}), Line(points=  {{70, 0}, {130, 0}}, color=  {0, 0, 0})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {300, 100}})));
    end ResistorWith2Cond;
    annotation(Documentation(revisions = "<html>
      </html>"));
  end PressureFlow;

  package Semipermeable "Osmotic Physical Domain"
    connector OsmoticFlow
      "H2O flow throught semipermeable membrane by osmotic pressure gradient"
      Real o(quantity = "Osmolarity", unit = "mOsm");
      flow Real q(quantity = "Flow", unit = "ml/min");
      annotation(Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end OsmoticFlow;

    connector PositiveOsmoticFlow "H2O inflow"
      extends OsmoticFlow;
      annotation(defaultComponentName = "q_in", Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-20, 10}, {20, -10}}, lineColor=  {127, 127, 0}, lineThickness=  1), Polygon(points=  {{0, 100}, {100, 0}, {0, -100}, {-100, 0}, {0, 100}}, lineColor=  {0, 0, 0}, smooth=  Smooth.None, fillPattern=  FillPattern.Solid, fillColor=  {127, 127, 0})}), Diagram(Polygon(points = [-21, -3; 5, 23; 31, -3; 5, -29; -21, -3], style(color = 74, rgbcolor = {0, 0, 0}, fillColor = 0, rgbfillColor = {0, 0, 0})), Text(extent = [-105, -38; 115, -83], string = "%name", style(color = 0, rgbcolor = {0, 0, 0}))), Documentation(info = "<html>
      <p>
      Connector with one flow signal of type Real.
      </p>
      </html>", revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end PositiveOsmoticFlow;

    connector NegativeOsmoticFlow "H2O outflow"
      extends OsmoticFlow;
      annotation(defaultComponentName = "q_out", Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false), graphics = {Rectangle(extent=  {{-20, 10}, {20, -10}}, lineColor=  {127, 127, 0}, lineThickness=  1), Polygon(points=  {{-100, 0}, {0, 100}, {100, 0}, {0, -100}, {-100, 0}}, smooth=  Smooth.None, fillPattern=  FillPattern.Solid, fillColor=  {225, 235, 129}, pattern=  LinePattern.None)}), Diagram(Polygon(points = [-21, -3; 5, 23; 31, -3; 5, -29; -21, -3], style(color = 74, rgbcolor = {0, 0, 0}, fillColor = 0, rgbfillColor = {255, 255, 255})), Text(extent = [-105, -38; 115, -83], string = "%name", style(color = 0, rgbcolor = {0, 0, 0}))), Documentation(info = "<html>
      <p>
      Connector with one flow signal of type Real.
      </p>
      </html>", revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end NegativeOsmoticFlow;

    model FlowMeasure
      NegativeOsmoticFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{18, -10}, {38, 10}}), iconTransformation(extent = {{78, -42}, {98, -22}})));
      PositiveOsmoticFlow q_in annotation(Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(extent = {{-100, -44}, {-80, -24}})));
      PhysiolibraryOld.Interfaces.RealOutput_ actualFlow(final quantity="Flow",
          final unit="ml/min") annotation (Placement(transformation(extent={{-20,
                30},{20,70}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-2,82})));
    equation
      q_in.q + q_out.q = 0;
      q_out.o = q_in.o;
      actualFlow = q_in.q;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 102}, {100, -102}}, fileName=  "icons/flowMeassure.png")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end FlowMeasure;

    partial model ResistorBase "semipermeable membrane"
      extends PhysiolibraryOld.Icons.Resistor;
      PositiveOsmoticFlow q_in annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      NegativeOsmoticFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, -10}, {110, 10}})));
      annotation(Icon(graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end ResistorBase;

    partial model Resistor
      extends ResistorBase;
    equation
      q_in.q + q_out.q = 0;
      annotation(Icon(graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end Resistor;

    model ResistorWithCondParam
      extends Resistor;
      parameter Real cond "H2O membrane permeability";
    equation
      q_in.q = cond * (q_out.o - q_in.o);
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(graphics = {Text(extent=  {{-70, -30}, {70, 30}}, lineColor=  {0, 0, 0}, textString=  "%cond"), Text(extent=  {{-134, -90}, {154, -30}}, textString=  "%name", lineColor=  {0, 0, 255})}), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end ResistorWithCondParam;

    model InputPump
      NegativeOsmoticFlow q_out annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{50, -10}, {70, 10}})));
      PhysiolibraryOld.Interfaces.RealInput_ desiredFlow "pure H2O inflow"
        annotation (extent=[-10,30; 10,50], rotation=-90);
    equation
      q_out.q = -desiredFlow;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-60, -30}, {60, 30}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-48, 20}, {50, 0}, {-48, -21}, {-48, 20}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid), Text(extent=  {{-92, -54}, {80, -30}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end InputPump;

    model OutputPump
      PositiveOsmoticFlow q_in annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -8}, {-90, 12}}), iconTransformation(extent = {{-70, -10}, {-50, 10}})));
      PhysiolibraryOld.Interfaces.RealInput_ desiredFlow
        annotation (extent=[-10,30; 10,50], rotation=-90);
    equation
      q_in.q = desiredFlow;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-60, -32}, {60, 30}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-48, 18}, {50, -2}, {-48, -26}, {-48, 18}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid), Text(extent=  {{-78, -54}, {72, -32}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end OutputPump;

    model ColloidOsmolarity "set osmolarity from protein mass flow"
      extends Interfaces.ConversionIcon;
      Interfaces.RealInput_ proteinMassFlow(unit = "g/min") annotation(Placement(transformation(extent = {{-20, 80}, {20, 120}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {48, 116})));
      PressureFlow.PositivePressureFlow q_in "hydraulic pressure" annotation(Placement(transformation(extent = {{-110, -110}, {-90, -90}}), iconTransformation(extent = {{-110, -110}, {-90, -90}})));
      NegativeOsmoticFlow q_out(o(final unit = "g/ml"))
        "colloid osmotic pressure"                                                 annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      parameter Real C1 = 320.0;
      parameter Real C2 = 1160.0;
      Interfaces.RealOutput_ P annotation(Placement(transformation(extent = {{42, 86}, {82, 126}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {-60, -120})));
    equation
      q_in.q + q_out.q = 0;
      q_out.o = abs(proteinMassFlow / q_in.q);
      P = q_in.pressure;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.04), graphics = {Text(extent=  {{22, 92}, {84, 18}}, lineColor=  {0, 0, 0}, textString=  "O"), Text(extent=  {{-94, -12}, {-10, -90}}, lineColor=  {0, 0, 0}, textString=  "P")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.04), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 40}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid)}));
    end ColloidOsmolarity;

    model ColloidHydraulicPressure
      "set pressure as sum of osmotic pressure(from osmoles) and hydrostatic/hydrodynamic pressure(from signal)"
      extends Interfaces.ConversionIcon;
      Interfaces.RealInput_ hydraulicPressure(unit = "mmHg") annotation(Placement(transformation(extent = {{-20, 80}, {20, 120}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {40, 120})));
      PressureFlow.NegativePressureFlow q_out
        "pressure on semipermeable membrane wall = osmotic + hydrostatic"                                       annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
      PositiveOsmoticFlow q_in(o(unit = "g")) "osmoles" annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      parameter Real C1 = 320.0;
      parameter Real C2 = 1160.0;
    equation
      q_in.q + q_out.q = 0;
      q_out.pressure = hydraulicPressure - (C1 * q_in.o + C2 * q_in.o ^ 2);
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.04), graphics = {Text(extent=  {{-94, -10}, {-32, -84}}, lineColor=  {0, 0, 0}, textString=  "O"), Text(extent=  {{8, 92}, {92, 14}}, lineColor=  {0, 0, 0}, textString=  "P")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.04), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 40}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid)}));
    end ColloidHydraulicPressure;

    model ColloidHydraulicPressure0
      extends Interfaces.ConversionIcon;
      Interfaces.RealInput_ hydraulicPressure(unit = "mmHg") annotation(Placement(transformation(extent = {{-20, 80}, {20, 120}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {40, 120})));
      PositiveOsmoticFlow q_in(o(unit = "g")) "osmoles" annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}})));
      parameter Real C1 = 320.0;
      parameter Real C2 = 1160.0;
      PressureFlow.NegativePressureFlow withoutCOP
        "only hydrostatic pressure without colloid osmotic pressure"                                            annotation(Placement(transformation(extent = {{90, 90}, {110, 110}}), iconTransformation(extent = {{90, 90}, {110, 110}})));
    equation
      q_in.q + withoutCOP.q = 0;
      withoutCOP.pressure = hydraulicPressure;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.04), graphics = {Text(extent=  {{-94, -10}, {-32, -84}}, lineColor=  {0, 0, 0}, textString=  "O"), Text(extent=  {{8, 92}, {92, 14}}, lineColor=  {0, 0, 0}, textString=  "P")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.04), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 40}, {100, -40}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid)}));
    end ColloidHydraulicPressure0;

    model WaterColloidOsmoticCompartment
      //  extends HumMod.Library.Interfaces.BaseModel;
      extends PhysiolibraryOld.Utilities.DynamicState;
      NegativeOsmoticFlow q_out(o(final unit = "g/ml")) annotation(Placement(transformation(extent = {{62, -32}, {102, 8}}), iconTransformation(extent = {{-10, -10}, {10, 10}})));
      parameter Real initialWaterVolume(final quantity = "Volume", unit = "ml");
      PhysiolibraryOld.Interfaces.RealInput_ NotpermeableSolutes(quantity=
            "Mass", unit="g") annotation (Placement(transformation(extent={{-120,
                60},{-80,100}}), iconTransformation(extent={{-120,60},{-80,100}})));
      PhysiolibraryOld.Interfaces.RealOutput_ WaterVolume(
        start=initialWaterVolume,
        final quantity="Volume",
        unit="ml") annotation (Placement(transformation(extent={{-20,-120},{20,
                -80}}, rotation=-90)));
      //initial equation
      //  WaterVolume = initialWaterVolume;
    equation
      q_out.o = if WaterVolume > 0 then NotpermeableSolutes / WaterVolume else 0;
      changePerMin = q_out.q;
      stateValue = WaterVolume;
      //  der(WaterVolume) = q_out.q / Library.SecPerMin;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"));
    end WaterColloidOsmoticCompartment;

    model OsmoticPump
      extends OsmoticPumpBase;
      PositiveOsmoticFlow q_in annotation(Placement(transformation(extent = {{-90, -10}, {-70, 10}})));
      NegativeOsmoticFlow q_out annotation(Placement(transformation(extent = {{70, -10}, {90, 10}}), iconTransformation(extent = {{70, -10}, {90, 10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.o = desiredOsmoles;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
    end OsmoticPump;

    model OsmoticPumpBase "Defined osmoles to/from/in system by real signal"
      Interfaces.RealInput_ desiredOsmoles(quantity = "Osmolarity", unit = "mOsm")
        "desired pressure flow value"                                                                            annotation(Placement(transformation(extent = {{-66, 50}, {-26, 90}}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 270, origin = {0, 60})));
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-80, 60}, {80, -60}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor=  {255, 170, 170}, fillColor=  {255, 170, 170}, fillPattern=  FillPattern.Solid), Text(extent=  {{-150, -94}, {150, -54}}, textString=  "%name", lineColor=  {0, 0, 0}, fillPattern=  FillPattern.Solid, fillColor=  {255, 170, 170}), Text(extent=  {{-36, -72}, {-152, 98}}, lineColor=  {255, 170, 170}, fillColor=  {255, 170, 170}, fillPattern=  FillPattern.Solid, textString=  "")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end OsmoticPumpBase;

    model Pump
      PositiveOsmoticFlow q_in annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{-110, -8}, {-90, 12}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      PhysiolibraryOld.Interfaces.RealInput_ desiredFlow
        annotation (extent=[-10,30; 10,50], rotation=-90);
      NegativeOsmoticFlow q_out annotation(Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{90, -10}, {110, 10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = desiredFlow;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent=  {{-100, -80}, {100, -54}}, textString=  "%name", lineColor=  {0, 0, 255}), Rectangle(extent=  {{-100, -50}, {100, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-78, 25}, {82, 0}, {-78, -25}, {-78, 25}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Documentation(revisions = "<html>
      <p><i>2009-2010</i></p>
      <p>Marek Matejak, Charles University, Prague, Czech Republic </p>
      </html>"), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end Pump;
  end Semipermeable;

  package VolumeFlow "Volume and Volume Flow domains"
    connector VolumeFlow
      Real volume(final quantity = "Volume", final unit = "ml");
      flow Real q(final quantity = "Flow", final unit = "ml/min");
    end VolumeFlow;

    connector PositiveVolumeFlow
      extends VolumeFlow;
      annotation(defaultComponentName = "q_in", Coordsys(extent = [-100, -100; 100, 100], grid = [1, 1], component = [20, 20], scale = 0.2), Icon(coordinateSystem(extent = [-100, -100; 100, 100]), Polygon(points = [-50, -5; 0, 40; 50, -5; 0, -51; -50, -5], style(color = 74, rgbcolor = {0, 0, 0}, fillColor = 0, rgbfillColor = {0, 0, 0}))), Diagram(Polygon(points = [-21, -3; 5, 23; 31, -3; 5, -29; -21, -3], style(color = 74, rgbcolor = {0, 0, 0}, fillColor = 0, rgbfillColor = {0, 0, 0})), Text(extent = [-105, -38; 115, -83], string = "%name", style(color = 0, rgbcolor = {0, 0, 0}))), Documentation(info = "<html>
      <p>
      Connector with one flow signal of type Real.
      </p>
      </html>"));
    end PositiveVolumeFlow;

    connector NegativeVolumeFlow
      extends VolumeFlow;
      annotation(defaultComponentName = "q_out", Coordsys(extent = [-100, -100; 100, 100], grid = [1, 1], component = [20, 20], scale = 0.2), Icon(coordinateSystem(extent = [-100, -100; 100, 100]), Polygon(points = [-50, -5; 0, 40; 50, -5; 0, -51; -50, -5], style(color = 74, rgbcolor = {0, 0, 0}, fillColor = 0, rgbfillColor = {255, 255, 255}))), Diagram(Polygon(points = [-21, -3; 5, 23; 31, -3; 5, -29; -21, -3], style(color = 74, rgbcolor = {0, 0, 0}, fillColor = 0, rgbfillColor = {255, 255, 255})), Text(extent = [-105, -38; 115, -83], string = "%name", style(color = 0, rgbcolor = {0, 0, 0}))), Documentation(info = "<html>
      <p>
      Connector with one flow signal of type Real.
      </p>
      </html>"));
    end NegativeVolumeFlow;

    model VolumeMeasure
      PositiveVolumeFlow q_in annotation(Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(extent = {{-20, -60}, {20, -20}})));
      PhysiolibraryOld.Interfaces.RealOutput_ actualVolume annotation (
          Placement(transformation(extent={{-20,30},{20,70}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,40})));
    equation
      q_in.q = 0;
      actualVolume = q_in.volume;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-40, -40}, {40, 40}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Text(extent=  {{-28, 18}, {30, -40}}, lineColor=  {0, 0, 0}, fillPattern=  FillPattern.VerticalCylinder, fillColor=  {215, 215, 215}, textString=  "Vol")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end VolumeMeasure;

    model OutputPump
      PositiveVolumeFlow q_in annotation(extent = [-10, -110; 10, -90], Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{-110, -10}, {-90, 10}})));
      PhysiolibraryOld.Interfaces.RealInput desiredFlow(final quantity="Flow",
          final unit="ml/min") annotation (extent=[-10,50; 10,70], rotation=-90);
    equation
      q_in.q = desiredFlow;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, -50}, {100, 50}}, lineColor=  {0, 0, 127}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Polygon(points=  {{-80, 25}, {80, 0}, {-80, -25}, {-80, 25}}, lineColor=  {0, 0, 127}, fillColor=  {0, 0, 127}, fillPattern=  FillPattern.Solid), Text(extent=  {{-150, -100}, {150, -60}}, textString=  "%name", lineColor=  {0, 0, 255})}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics));
    end OutputPump;
  end VolumeFlow;

  constant Real SecPerMin(unit = "s/min") = 60
    "Conversion coeficient from minutes to seconds";

  package NonSIunits "Non SI-units Support"
    constant Real PaTOmmHg(final unit = "mmHg/Pa") = 760 / 101325;

    model degC_to_degF "Convert from Celsius degrees to Farenhein degrees"
      //  extends Modelica.SIunits.Conversions.ConversionIcon;
      //  input Real degC "Celsiuc value";
      //  output Real degF "Farenheit value";
      Interfaces.RealInput_ degC annotation(Placement(transformation(extent = {{-120, -20}, {-80, 20}}), iconTransformation(extent = {{-140, -20}, {-100, 20}})));
      Interfaces.RealOutput_ degF annotation(Placement(transformation(extent = {{50, -20}, {90, 20}}), iconTransformation(extent = {{100, -20}, {140, 20}})));
      //algorithm
    equation
      degF = degC * 9.0 / 5.0 + 32.0;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {191, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Line(points=  {{-90, 0}, {30, 0}}, color=  {191, 0, 0}), Polygon(points=  {{90, 0}, {30, 20}, {30, -20}, {90, 0}}, lineColor=  {191, 0, 0}, fillColor=  {191, 0, 0}, fillPattern=  FillPattern.Solid), Text(extent=  {{-115, 155}, {115, 105}}, textString=  "%name", lineColor=  {0, 0, 255}), Text(extent=  {{-20, 100}, {-100, 20}}, lineColor=  {0, 0, 0}, textString=  "°C"), Text(extent=  {{100, -20}, {20, -100}}, lineColor=  {0, 0, 0}, textString=  "°F")}));
    end degC_to_degF;
  end NonSIunits;

  package Utilities
    constant String ORIGINAL_DATA_FILE = "setup/default.txt";
    constant String DATA_FILE = "setup/default.txt";
    constant String OUTPUT_FILE = "setup/output2_s.txt";
    constant String OUTPUT_DIF_FILE = "setup/dif3_s.txt";

    function readRealParameter "Read the value of a Real parameter from file"
      import Modelica.Utilities.*;
      extends Modelica.Icons.Function;
      //parameter String PARAMETERS_FILE = "parameters/default.txt";
      input String fileName "Name of file" annotation(Dialog(__Dymola_loadSelector(filter = "Text files (*.txt)", caption = "Open file in which Real parameters are present")));
      input String name "Name of parameter";
      input Real varValue = 0 "default value of parameter";
      input Init initType = Init.NoInit "input type settings";
      output Real result "Actual value of parameter on file";
    protected
      String line;
      Integer nextIndex;
      Integer iline = 1;
      Boolean found = false;
      Boolean endOfFile = false;
    algorithm
      if initType == Init.FromFile then
        if not Files.exist(fileName) then
          Streams.error("readRealParameter(\"" + name + "\", \"" + fileName + "\")  Error: the file does not exist.\n");
        else
          (line, endOfFile) := Streams.readLine(fileName, iline);
          while not found and not endOfFile loop
            if line == name then
              (line, endOfFile) := Streams.readLine(fileName, iline + 1);
              result := Strings.scanReal(line, 1);
              found := true;
            else
              iline := iline + 2;
              (line, endOfFile) := Streams.readLine(fileName, iline);
            end if;
          end while;
          if not found then
            Streams.error("Parameter \"" + name + "\" not found in file \"" + fileName + "\"\n");
          end if;
        end if;
      else
        result := varValue;
      end if;
      annotation(Documentation(info = "<html>
         <h4>Syntax</h4>
         <blockquote><pre>
         result = <b>readRealParameter</b>(fileName, name);
         </pre></blockquote>
         <h4>Description</h4>
         <p>
         This function demonstrates how a function can be implemented
         that reads the value of a parameter from file. The function
         performs the following actions:
         </p>
         <ol>
         <li> It opens file \"fileName\" and reads the lines of the file.</li>
         <li> In every line, Modelica line comments (\"// ... end-of-line\")
              are skipped </li>
         <li> If a line consists of \"name = expression\" and the \"name\"
              in this line is identical to the second argument \"name\"
              of the function call, the expression calculator Examples.expression
              is used to evaluate the expression after the \"=\" character.
              The expression can optionally be terminated with a \";\".</li>
         <li> The result of the expression evaluation is returned as
              the value of the parameter \"name\". </li>
         </ol>
         <h4>Example</h4>
         <p>
         On file \"test.txt\" the following lines might be present:
         </p>
         <blockquote><pre>
         // Motor data
         J        = 2.3     // inertia
         w_rel0   = 1.5*2;  // relative angular velocity
         phi_rel0 = pi/3
         </pre></blockquote>
         <p>
         The function returns the value \"3.0\" when called as:
         </p>
         <blockquote><pre>
         readRealParameter(\"test.txt\", \"w_rel0\")
         </pre></blockquote>
         </html>"));
    end readRealParameter;

    type Init = enumeration(
        NoInit
          "No abstract initialization (start values are used as guess values with fixed=false or from start=value in instances)",

        CalculateInitialSteadyState
          "Steady state initialization (derivatives of states are zero)",
        FromFile "Initialization from file");

    partial model DynamicState
      //  extends DynamicStateSteady;
      //  extends DynamicStateDynamic;
      extends DynamicStateDynamicNoInit;
      import Modelica.Utilities.*;
      parameter String stateName "state name must be unique for each instance";
      Real stateValue(stateSelect = StateSelect.prefer)
        "state must be connected in inherited class definition";
      Real changePerMin "dynamic change of state value per minute";
      //#if not OMC
      //use the modification syntax instead ... leads to better code in OMC (maybe in Dymola, too??)
      //-> the readRealParameter() is called only once when the originalValue is bounded
      //which avoids calling the funcion repeatedly during the initialization step
      //parameter Real originalValue(fixed=false);
      parameter Real originalValue = readRealParameter(ORIGINAL_DATA_FILE, stateName);
      //#endif not OMC
      parameter Real initialValue(fixed = false);
    initial equation
      if initType == Init.CalculateInitialSteadyState then
        der(stateValue) = 0;
      elseif initType == Init.FromFile then
        stateValue = readRealParameter(DATA_FILE, stateName);
      end if;
      initialValue = stateValue;
      //originalValue = readRealParameter(ORIGINAL_DATA_FILE, stateName);
    equation
      //#if not OMC
      when SAVE_VALUES and terminal() then
        // and  then //initial()
        Streams.print(stateName + "\n" + String(stateValue), OUTPUT_FILE);
        //     Streams.print( String(stateValue), OUTPUT_FILE);
        Streams.print((if abs(originalValue) > Modelica.Constants.eps then String(abs((stateValue - originalValue) / originalValue)) else "Zero vs. " + String(stateValue)) + ";" + stateName + ";" + String(initialValue) + ";" + String(stateValue) + ";" + String(originalValue), OUTPUT_DIF_FILE);
      end when;
      //#endif not OMC
      if STEADY then
        changePerMin = 0;
        //    der(stateValue) = 0;
      else
        der(stateValue) = changePerMin / SecPerMin;
        //derivation time in Modelica is in seconds
      end if;
    end DynamicState;

    partial model DynamicStateDynamicNoInit
      parameter Boolean STEADY = false;
      parameter Boolean SAVE_VALUES = false;
      parameter Init initType = Init.NoInit;
      //for test use Init.FromFile
      //Init.NoInit;
    end DynamicStateDynamicNoInit;

    block ConstantFromFile
      "Generate constant signal of type Real with value from file"
      extends ModelVariable(k = readRealParameter(DATA_FILE, varName, varValue, initType));
      //  parameter Real k(fixed=false) "Constant output value";
      //  parameter String varName;
      //   parameter String units="1";
      PhysiolibraryOld.Interfaces.RealOutput_ y
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
      //use the modification syntax instead ... leads to better code in OMC (maybe in Dymola, too??)
      //-> the readRealParameter() is called only once when the k is bounded
      //which avoids calling the funcion repeatedly during the initialization step
      //initial equation
      //k = readRealParameter(DATA_FILE, varName);
    equation
      y = k;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.1), graphics = {Rectangle(extent=  {{-100, 20}, {100, -20}}, lineColor=  {0, 0, 255}, fillPattern=  FillPattern.Solid, fillColor=  {255, 255, 255}), Text(extent=  {{-100, -10}, {100, 10}}, lineColor=  {0, 0, 0}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, textString=  "%varName")}), Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}, initialScale = 0.1), graphics), Documentation(info = "<html>
       <p>
       The Real output y is a constant signal:
       </p>
       </html>"));
    end ConstantFromFile;

    partial block ModelVariable
      "abstract variable of the model - could be input or output"
      //the k must be fixed to enable its initialization directly through extends modification
      //it also means, it MUST be initialized before the initialization equations solver starts
      //which is kind of a "safe" approach as it is most likely expected this variable to be initialized from file or directly
      parameter Real k(fixed = true) = 1e-007 "Constant output value";
      parameter String varName;
      parameter Real varValue(fixed = true) = 1e-007;
      parameter String units = "1";
      parameter Init initType = Init.FromFile;
    end ModelVariable;
  end Utilities;

  package Icons
    model Golem
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 98}, {100, -100}}, fileName=  "icons/golem.png")}));
    end Golem;

    model CardioVascular
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/csv.png")}));
    end CardioVascular;

    model Water
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/indexVoda.png")}));
    end Water;

    model Electrolytes
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/electrolytes.png")}));
    end Electrolytes;

    model Proteins
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-98, 100}, {100, -100}}, fileName=  "icons/protein.png")}));
    end Proteins;

    model Gases
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/gases.png")}));
    end Gases;

    model NutrientsMetabolism
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/vyziva.png")}));
    end NutrientsMetabolism;

    model Heat
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/ohen.png")}));
    end Heat;

    model Hormones
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/hormony.png")}));
    end Hormones;

    model Nerves
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 102}, {100, -98}}, fileName=  "icons/nervyNeuron.png")}));
    end Nerves;

    model Setup
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/setup.png")}));
    end Setup;

    model Status
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-98, -100}, {100, 100}}, fileName=  "icons/tissueFitness.png")}));
    end Status;

    model SkeletalMuscle
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-70, 92}, {40, -80}}, fileName=  "icons/sval.png")}));
    end SkeletalMuscle;

    model Bone
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, pattern=  LinePattern.None), Bitmap(extent=  {{-88, 96}, {52, -84}}, fileName=  "icons/bone.jpg")}));
    end Bone;

    model OtherTissue
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-74, 60}, {48, -94}}, fileName=  "icons/pojivovaTkan.png")}));
    end OtherTissue;

    model RespiratoryMuscle
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-66, 86}, {44, -86}}, fileName=  "icons/respiracniSvaly.png")}));
    end RespiratoryMuscle;

    model Fat
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-84, 86}, {38, -68}}, fileName=  "icons/tukovaBunka.png")}));
    end Fat;

    model Skin
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-74, 56}, {48, -84}}, fileName=  "icons/skin.jpg")}));
    end Skin;

    model Brain
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-78, 62}, {44, -92}}, fileName=  "icons/brain.jpg")}));
    end Brain;

    model GITract
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-80, 74}, {42, -80}}, fileName=  "icons/traviciTrakt.png")}));
    end GITract;

    model LeftHeart
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-80, 100}, {44, -84}}, fileName=  "icons/srdceLeva.png")}));
    end LeftHeart;

    model RightHeart
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-78, 70}, {44, -84}}, fileName=  "icons/srdceprava.png")}));
    end RightHeart;

    model Liver
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-84, 34}, {86, -100}}, fileName=  "icons/jatra.png")}));
    end Liver;

    model Kidney
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-92, 86}, {40, -88}}, fileName=  "icons/kidney.jpg")}));
    end Kidney;

    model Bladder
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid, pattern=  LinePattern.None), Bitmap(extent=  {{-92, 86}, {40, -88}}, fileName=  "icons/mocovyMechyr.png")}));
    end Bladder;

    model GILumen
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/traviciTrakt2.png")}));
    end GILumen;

    model ThyroidGland
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-92, 86}, {40, -88}}, fileName=  "icons/stitnaZlaza.png")}));
    end ThyroidGland;

    model Pancreas
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/pankreas.png")}));
    end Pancreas;

    model AdrenalGland
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/nadledviny.png")}));
    end AdrenalGland;

    model Lungs
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-70, 92}, {40, -80}}, fileName=  "icons/plice.png")}));
    end Lungs;

    model Tissues
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-46, 98}, {32, 26}}, fileName=  "icons/bone.jpg"), Bitmap(extent=  {{-62, -10}, {50, -92}}, fileName=  "icons/skin.jpg"), Bitmap(extent=  {{-38, 90}, {64, -20}}, fileName=  "icons/sval.png"), Bitmap(extent=  {{-10, 36}, {102, -56}}, fileName=  "icons/traviciTrakt.png"), Text(extent=  {{64, -66}, {94, -96}}, lineColor=  {0, 0, 0}, textString=  "..."), Bitmap(extent=  {{-98, 36}, {-24, -30}}, fileName=  "icons/brain.jpg")}));
    end Tissues;

    model Peritoneum
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-70, 92}, {40, -80}}, fileName=  "icons/peritoneum.png")}));
    end Peritoneum;

    model Plasma
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-70, 92}, {40, -80}}, fileName=  "icons/plazma.png")}));
    end Plasma;

    model Hypophysis
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/hypofyza.png")}));
    end Hypophysis;

    model Heart
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/heart.png")}));
    end Heart;

    model SweatGland
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/potniZlaza.png")}));
    end SweatGland;

    model Cell
    end Cell;

    package BaseLib
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-100, -100}, {80, 50}}, fillColor = {235, 235, 235},
                fillPattern =                                                                                                    FillPattern.Solid, lineColor = {0, 0, 255}), Polygon(points = {{-100, 50}, {-80, 70}, {100, 70}, {80, 50}, {-100, 50}}, fillColor = {235, 235, 235},
                fillPattern =                                                                                                    FillPattern.Solid, lineColor = {0, 0, 255}), Polygon(points = {{100, 70}, {100, -80}, {80, -100}, {80, 50}, {100, 70}}, fillColor = {235, 235, 235},
                fillPattern =                                                                                                    FillPattern.Solid, lineColor = {0, 0, 255}), Text(extent = {{-120, 122}, {120, 73}}, lineColor = {255, 0, 0}, textString = "%name")}));
    end BaseLib;

    package CardioVascularLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-96, 42}, {76, -100}}, fileName = "icons/csv.png")}));
    end CardioVascularLib;

    package ElectrolytesLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-78, 38}, {64, -94}}, fileName = "icons/electrolytes.png")}));
    end ElectrolytesLib;

    package GasesLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-88, 34}, {66, -82}}, fileName = "icons/gases.png")}));
    end GasesLib;

    package GolemLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-96, 42}, {78, -98}}, fileName = "icons/golem.png")}));
    end GolemLib;

    package HeatLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-100, 44}, {76, -82}}, fileName = "icons/ohen.png")}));
    end HeatLib;

    package HormonesLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-88, 30}, {74, -88}}, fileName = "icons/hormony.png")}));
    end HormonesLib;

    package NervesLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-96, 42}, {72, -96}}, fileName = "icons/nervyNeuron.png")}));
    end NervesLib;

    package NutrientsMetabolismLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-98, 40}, {80, -100}}, fileName = "icons/vyziva.png")}));
    end NutrientsMetabolismLib;

    package ProteinsLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-98, 42}, {76, -98}}, fileName = "icons/protein.png")}));
    end ProteinsLib;

    package SetupLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-94, 44}, {72, -98}}, fileName = "icons/setup.png")}));
    end SetupLib;

    package StatusLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-96, -96}, {72, 40}}, fileName = "icons/tissueFitness.png")}));
    end StatusLib;

    package WaterLib
      extends BaseLib;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Bitmap(extent = {{-90, 42}, {72, -84}}, fileName = "icons/indexVoda.png")}));
    end WaterLib;

    partial model Resistor
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent=  {{-70, 30}, {70, -30}}, lineColor=  {0, 0, 0}, fillColor=  {241, 241, 241}, fillPattern=  FillPattern.Solid), Line(points=  {{-90, 0}, {-70, 0}}, color=  {0, 0, 0}), Line(points=  {{70, 0}, {90, 0}}, color=  {0, 0, 0})}));
    end Resistor;

    model Lymph
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/Lymph.png")}));
    end Lymph;

    model RespiratoryCenter
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/respiracniCentrum.png")}));
    end RespiratoryCenter;

    model Oxygen
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/O2.jpg")}));
    end Oxygen;

    model Carbondioxyd
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/prvkyCO2.png")}));
    end Carbondioxyd;

    model AcidBase
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/acidobaze.png")}));
    end AcidBase;

    model Ventilation
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/dychani.png")}));
    end Ventilation;

    model PeripheralChemoreceptors
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/baroreflex.png")}));
    end PeripheralChemoreceptors;

    model HeatCore
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/torzo2.png")}));
    end HeatCore;

    model Glycogen
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent=  {{-100, 100}, {100, -100}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/glykogen.png")}));
    end Glycogen;

    model Lipids
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/FattyAcid.jpg")}));
    end Lipids;

    model KetoAcids
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/KetoAcid.jpg")}));
    end KetoAcids;

    model Glucose
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/glucose.jpg")}));
    end Glucose;

    model Lactate
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/Lactate.jpg")}));
    end Lactate;

    model AminoAcids
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/AminoAcid.jpg")}));
    end AminoAcids;

    model Urea
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/Urea.jpg")}));
    end Urea;

    model MetabolismPart
      annotation(Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 120}}), graphics), Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 120}}), graphics = {Rectangle(extent=  {{-100, 120}, {100, -100}}, lineColor=  {0, 0, 255}, fillColor=  {255, 255, 255}, fillPattern=  FillPattern.Solid), Bitmap(extent=  {{28, 120}, {98, 44}}, fileName=  "icons/ohen.png")}));
    end MetabolismPart;

    model CellularMetabolism
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/cellularMetabolism.png")}));
    end CellularMetabolism;

    model Barroreceptor
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/baroreflex.png")}));
    end Barroreceptor;

    model NervusVagus
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/vagus.png")}));
    end NervusVagus;

    model SympatheticNerves
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/sympatetickeNervy.png")}));
    end SympatheticNerves;

    model PhysicalExercise
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/cviceni.png")}));
    end PhysicalExercise;

    model SinoatrialNode
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/SANode.png")}));
    end SinoatrialNode;

    block StatusNormal
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/siluetaNormal.png")}));
    end StatusNormal;

    block StatusConfused
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/siluetaZmateni.png")}));
    end StatusConfused;

    block StatusImpaired
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/siluetaVaznejsiStav.png")}));
    end StatusImpaired;

    block StatusNotBreathing
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/siluetaNedychaSam.png")}));
    end StatusNotBreathing;

    block StatusComatose
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/siluetaKoma.png")}));
    end StatusComatose;

    block StatusMayBeDead
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/siluetaSkoroMrtvy.png")}));
    end StatusMayBeDead;

    block StatusIsReallyDead
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/siluetaMrtvy.png")}));
    end StatusIsReallyDead;

    model SkeletalMuscleAcidity
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/kyselostVeSvalech.png")}));
    end SkeletalMuscleAcidity;

    model Sodium
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/Na.jpg")}));
    end Sodium;

    model Potassium
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/K.jpg")}));
    end Potassium;

    model Phosphate
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/fosfat.png")}));
    end Phosphate;

    model Sulphate
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/sulfat02.png")}));
    end Sulphate;

    model Amonium
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/NH4.jpg")}));
    end Amonium;

    model Chloride
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/Cl.jpg")}));
    end Chloride;

    model LungShunt
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/lungBloodFlow.jpg")}));
    end LungShunt;

    model Hydrostatics
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/pressureMeassure.png")}));
    end Hydrostatics;

    model UpperTorso
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/torzo1.png")}));
    end UpperTorso;

    model MidleTorso
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/torzo2.png")}));
    end MidleTorso;

    model LowerTorso
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/torzo3.png")}));
    end LowerTorso;

    model RedCells
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/cervenaKrvinka.png")}));
    end RedCells;

    model SystemicCirculation
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/krevniRecisteSiluetacloveka.png")}));
    end SystemicCirculation;

    model PulmonaryCirculation
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/circulationLungs.png")}));
    end PulmonaryCirculation;

    model Blood
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/bloodProperties.jpg")}));
    end Blood;

    model BloodElasticCompartment
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/elastickyKompartment.png")}));
    end BloodElasticCompartment;

    model BloodSequesteredCompartment
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Bitmap(extent=  {{-100, 100}, {100, -100}}, fileName=  "icons/sequerestedVolume.png")}));
    end BloodSequesteredCompartment;
  end Icons;
  annotation(Documentation(revisions = "<html>
      <table cellspacing=\"2\" cellpadding=\"0\" border=\"0\"><tr>
      <td><p>Author:</p></td>
      <td><p>Marek Matejak</p></td>
      </tr>
      <tr>
      <td><p>Copyright:</p></td>
      <td><p>In public domains</p></td>
      </tr>
      <tr>
      <td><p>By:</p></td>
      <td><p>Charles University, Prague</p></td>
      </tr>
      <tr>
      <td><p>Date of:</p></td>
      <td><p>2008-2013</p></td>
      </tr>
      </table>
      </html>"), uses(Modelica(version="3.2.1")));
end PhysiolibraryOld;
