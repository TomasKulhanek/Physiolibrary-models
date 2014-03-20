within ;
model ModelOfHaemodynamics
  package Parts "Necessary components"
    connector BloodFlowConnector "Connector for blood flow"
      flow Real Q "blood flow in ml/sec";
      Real Pressure "Pressure in torr";
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, origin={0.0,0.3056}, fillColor={255,0,0},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.0,-100.3056},{100.0,100.3056}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, extent={{-160.0,50.0},{40.0,110.0}}, textString
                =                                                                                   "%name", fontName="Arial"),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,0,0},
                fillPattern =                                                                                                   FillPattern.Solid, extent={{-40.0,-40.0},{40.0,40.0}})}));
    end BloodFlowConnector;

    connector BloodFlowInflow "Blood flow inflow"
      flow Real Q "blood inflow in ml/sec";
      Real Pressure "Pressure in torr";
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, origin={0.0,0.3056}, fillColor={255,0,0},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.0,-100.3056},{100.0,100.3056}})}), Diagram(coordinateSystem(extent={{-148.5,-105.0},{148.5,105.0}}, preserveAspectRatio=true, initialScale=0.1, grid={5,5}), graphics={Text(visible=true, lineColor={0,0,255}, extent={{-160.0,50.0},{40.0,110.0}}, textString
                =                                                                                   "%name", fontName="Arial"),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,0,0},
                fillPattern =                                                                                                   FillPattern.Solid, extent={{-40.0,-40.0},{40.0,40.0}})}));
    end BloodFlowInflow;

    connector BloodFlowOutflow "Blood flow inflow"
      flow Real Q "blood flow outflow in ml/sec";
      Real Pressure "Pressure in torr";
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, origin={0.0,0.3056}, fillColor={255,255,255},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.0,-100.3056},{100.0,100.3056}})}), Diagram(coordinateSystem(extent={{-148.5,-105.0},{148.5,105.0}}, preserveAspectRatio=true, initialScale=0.1, grid={5,5}), graphics={Text(visible=true, lineColor={0,0,255}, extent={{-140,50},{60,110}}, textString
                =                                                                                   "%name", fontName="Arial"),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255},
                fillPattern =                                                                                                   FillPattern.Solid, extent={{-40,-37.5},{40,42.5}})}));
    end BloodFlowOutflow;

    partial model BloodFlowOnePort

      Parts.BloodFlowInflow Inflow               annotation(Placement(visible=true, transformation(origin={-151.1835,-0.6039}, extent={{-14.85,-10.5},{14.85,10.5}}, rotation=0), iconTransformation(origin={-100.0,-0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Parts.BloodFlowOutflow Outflow               annotation(Placement(visible=true, transformation(origin={151.1835,-0.6039}, extent={{-14.85,-10.5},{14.85,10.5}}, rotation=0), iconTransformation(origin={100.0,-0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Real PressureDrop;
      Real BloodFlow;
    equation
      PressureDrop=Inflow.Pressure - Outflow.Pressure;
      Inflow.Q + Outflow.Q=0;
      BloodFlow=Inflow.Q;
      annotation(Diagram(coordinateSystem(extent={{-148.5,-105.0},{148.5,105.0}}, preserveAspectRatio=true, initialScale=0.1, grid={5,5})));
    end BloodFlowOnePort;

    model BloodResistor
      parameter Real BloodResistance(start=1) "resistance in torr sec/ml";
      extends BloodFlowOnePort;
    equation
      PressureDrop=BloodFlow*BloodResistance;
      annotation(Diagram(coordinateSystem(extent={{-148.5,-105.0},{148.5,105.0}}, preserveAspectRatio=true, initialScale=0.1, grid={5,5}), graphics={Rectangle(visible=true, fillColor={255,255,255}, extent={{-60.0,-20.0},{60.0,20.0}}),Rectangle(visible=true, origin={-80.0,0.0}, fillColor={255,255,255}, extent={{-20.0,0.0},{20.0,0.0}}),Rectangle(visible=true, origin={80.0,0.0}, fillColor={255,255,255}, extent={{-20.0,0.0},{20.0,0.0}})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, origin={-2.6699,181}, lineColor={0,0,255}, extent={{-197.33,-81},{202.67,-41}}, fontName="Arial", textString
                =                                                                                                    "%name"),Text(visible=true, origin={0.8419,-77.2844},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.5547,-50.2773},{99.1581,-27.9318}}, fontName="Arial", textString
                =                                                                                                    "R=%BloodResistance", lineColor={0,0,0}),Polygon(points={{-100,100},{-100,-100},{0,0},{-100,100}}, lineColor={0,0,255}, smooth=Smooth.None, fillColor={215,215,215},
                fillPattern =                                                                                                    FillPattern.Solid),Polygon(points={{100,90},{100,-100},{0,0},{100,90}}, lineColor={0,0,255}, smooth=Smooth.None, fillColor={215,215,215},
                fillPattern =                                                                                                    FillPattern.Solid),Text(extent={{-20,80},{20,40}}, lineColor={0,0,255}, textString
                =                                                                                                    "R")}));
    end BloodResistor;

    model VariableBloodResistor
      extends Parts.BloodFlowOnePort;
      Modelica.Blocks.Interfaces.RealInput BloodResistance "in torr sec/ml" annotation(Placement(visible=true, transformation(origin={-10.0,67.9735}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0), iconTransformation(origin={0.0,92.5685}, extent={{-12.5685,-12.5685},{12.5685,12.5685}}, rotation=-90)));
    equation
      PressureDrop=BloodFlow*BloodResistance;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, origin={-70.0,0.0}, points={{-20.0,0.0},{20.0,0.0}}),Line(visible=true, origin={70.0,0.0}, points={{-20.0,0.0},{20.0,0.0}}),Text(visible=true, extent={{-180,-140},{190,-110}}, fontName="Arial", textString
                =                                                                                                    "%name", lineColor={0,0,0}),Line(visible=true, origin={0.0,50.0}, points={{0.0,30.0},{0.0,-30.0}}),Polygon(points={{-100,100},{0,0},{-100,-100},{-100,100}}, lineColor={0,0,255}, smooth=Smooth.None, fillColor={215,215,215},
                fillPattern =                                                                                                    FillPattern.Solid),Polygon(points={{100,100},{100,-100},{0,0},{100,100}}, lineColor={0,0,255}, smooth=Smooth.None, fillColor={215,215,215},
                fillPattern =                                                                                                    FillPattern.Solid),Text(extent={{0,70},{40,30}}, lineColor={0,0,255}, textString
                =                                                                                                    "R")}), Diagram(coordinateSystem(extent={{-148.5,-105.0},{148.5,105.0}}, preserveAspectRatio=true, initialScale=0.1, grid={5,5}), graphics={Rectangle(visible=true, fillColor={255,255,255}, extent={{-60.0,-20.0},{60.0,20.0}}),Rectangle(visible=true, origin={-80.0,0.0}, fillColor={255,255,255}, extent={{-20.0,0.0},{20.0,0.0}}),Rectangle(visible=true, origin={80.0,0.0}, fillColor={255,255,255}, extent={{-20.0,0.0},{20.0,0.0}})}));
    end VariableBloodResistor;

    model VariableBloodConductance
      extends Parts.BloodFlowOnePort;
      Modelica.Blocks.Interfaces.RealInput BloodConductance "in torr ml/sec" annotation(Placement(visible=true, transformation(origin={-10.0,67.9735}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0), iconTransformation(origin={0.0,92.5685}, extent={{-12.5685,-12.5685},{12.5685,12.5685}}, rotation=-90)));
    equation
      PressureDrop*BloodConductance=BloodFlow;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, origin={-70.0,0.0}, points={{-20.0,0.0},{20.0,0.0}}),Line(visible=true, origin={70.0,0.0}, points={{-20.0,0.0},{20.0,0.0}}),Text(visible=true, extent={{-180,-140},{190,-110}}, fontName="Arial", textString
                =                                                                                                    "%name", lineColor={0,0,0}),Line(visible=true, origin={0.0,50.0}, points={{0.0,30.0},{0.0,-30.0}}),Polygon(points={{-100,100},{0,0},{-100,-100},{-100,100}}, lineColor={0,0,255}, smooth=Smooth.None, fillColor={215,215,215},
                fillPattern =                                                                                                    FillPattern.Solid),Polygon(points={{100,100},{100,-100},{0,0},{100,100}}, lineColor={0,0,255}, smooth=Smooth.None, fillColor={215,215,215},
                fillPattern =                                                                                                    FillPattern.Solid),Text(extent={{0,70},{40,30}}, lineColor={0,0,255}, textString
                =                                                                                                    "G")}), Diagram(coordinateSystem(extent={{-148.5,-105.0},{148.5,105.0}}, preserveAspectRatio=true, initialScale=0.1, grid={5,5}), graphics={Rectangle(visible=true, fillColor={255,255,255}, extent={{-60.0,-20.0},{60.0,20.0}}),Rectangle(visible=true, origin={-80.0,0.0}, fillColor={255,255,255}, extent={{-20.0,0.0},{20.0,0.0}}),Rectangle(visible=true, origin={80.0,0.0}, fillColor={255,255,255}, extent={{-20.0,0.0},{20.0,0.0}})}));
    end VariableBloodConductance;

    model BloodElasticCompartment "Elastic compartment with unstressed volume"

      Modelica.Blocks.Interfaces.RealInput Elastance "\"in torr/ml\"" annotation(Placement(visible=true, transformation(origin={0.0957,88.3047}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=-90), iconTransformation(origin={65.0535,86.446}, extent={{-11.8243,-11.8243},{11.8243,11.8243}}, rotation=-90)));
      Modelica.Blocks.Interfaces.RealOutput Volume(start=V0) annotation(Placement(visible=true, transformation(origin={-67.3852,-78.2262}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90), iconTransformation(origin={-70,-67.9715}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Blocks.Interfaces.RealInput ExternalPressure "\"in torr\"" annotation(Placement(visible=true, transformation(origin={0.0957,88.3047}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=-90), iconTransformation(origin={5.0535,106.446}, extent={{-11.8243,-11.8243},{11.8243,11.8243}}, rotation=-90)));
      Modelica.Blocks.Interfaces.RealInput UnstressedVolume "in ml" annotation(Placement(visible=true, transformation(origin={0.0957,88.3047}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=-90), iconTransformation(origin={-64.947,86.446}, extent={{-11.8243,-11.8243},{11.8243,11.8243}}, rotation=-90)));
      parameter Real V0=1 "initial volume in ml";
      Real StressedVolume;
      Real TransmuralPressure;
      Modelica.Blocks.Interfaces.RealOutput Pressure "Blood pressure in torr" annotation(Placement(visible=true, transformation(origin={-67.3852,-78.2262}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90), iconTransformation(origin={80,-67.9715}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Parts.BloodFlowConnector bloodFlow               annotation(Placement(transformation(extent={{-10,-110},{10,-90}}), iconTransformation(extent={{-10,-110},{10,-90}})));
    equation
      bloodFlow.Pressure=Pressure;
      TransmuralPressure=Pressure - ExternalPressure;
      der(Volume)=bloodFlow.Q;
      StressedVolume=Volume - UnstressedVolume;
      if StressedVolume > 0 then
        TransmuralPressure=Elastance*StressedVolume;
      else
        TransmuralPressure=0;
      end if;
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, origin={2.9379,0.0}, fillColor={215,215,215},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-102.9379,-100.0},{102.9379,100.0}}),Text(visible=true, origin={-0.3481,72.6447}, extent={{-148.0,-81.0},{152.0,-41.0}}, textString
                =                                                                                                    "%name", fontName="Arial"),Text(visible=true, origin={-79.158,-2.0682},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.5547,-50.2773},{99.1581,-27.9318}}, textString
                =                                                                                                    "Volume", fontName="Arial"),Text(visible=true, origin={-99.158,127.932},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.555,-50.2772},{99.1581,-27.9317}}, textString
                =                                                                                                    "UV", fontName="Arial"),Text(visible=true, origin={125.594,125.0},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-85.5943,-45.0001},{84.4058,-25.0002}}, textString
                =                                                                                                    "Elastance", fontName="Arial"),Text(visible=true, origin={0.842,127.932},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.555,-50.2772},{99.1581,-27.9317}}, textString
                =                                                                                                    "Pext", fontName="Arial"),Text(visible=true, origin={80.842,-2.0682},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.5547,-50.2773},{99.1581,-27.9318}}, textString
                =                                                                                                    "Pressure", fontName="Arial")}), Diagram(coordinateSystem(extent={{-148.5,-105},{148.5,105}}, preserveAspectRatio=true, initialScale=0.1, grid={5,5}), graphics));
    end BloodElasticCompartment;

    model Inductor
      extends Parts.BloodFlowOnePort;
      Modelica.Blocks.Interfaces.RealInput Inertance "in torr * sec^2/ml" annotation(Placement(visible=true, transformation(origin={-10.0,67.9735}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0), iconTransformation(origin={0,82.5685}, extent={{-12.5685,-12.5685},{12.5685,12.5685}}, rotation=-90)));
    equation
      PressureDrop=der(BloodFlow)*Inertance;
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, origin={-70.0,0.0}, points={{-20.0,0.0},{20.0,0.0}}),Line(visible=true, origin={70.0,0.0}, points={{-20.0,0.0},{20.0,0.0}}),Text(visible=true, extent={{-210.0,-100.0},{210.0,-70.0}}, textString
                =                                                                                                    "%name", fontName="Arial"),Line(visible=true, origin={0.0,50.0}, points={{0.0,30.0},{0.0,-30.0}}),Rectangle(visible=true,
                lineThickness =                                                                                                    1, extent={{-100.0,-55.0},{100.0,75.0}}),Rectangle(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, pattern=LinePattern.None,
                fillPattern =                                                                                                    FillPattern.Solid,
                lineThickness =                                                                                                    1, extent={{-55.0,-50.0},{65.0,70.0}}),Text(visible=true, origin={8.1183,52.9448},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-78.8574,-9.8385},{78.8574,9.8385}}, textString
                =                                                                                                    "Inertance", fontName="Arial")}), Diagram(coordinateSystem(extent={{-148.5,-105.0},{148.5,105.0}}, preserveAspectRatio=true, initialScale=0.1, grid={5,5}), graphics={Rectangle(visible=true, fillColor={255,255,255}, extent={{-60.0,-20.0},{60.0,20.0}}),Rectangle(visible=true, origin={-80.0,0.0}, fillColor={255,255,255}, extent={{-20.0,0.0},{20.0,0.0}}),Rectangle(visible=true, origin={80.0,0.0}, fillColor={255,255,255}, extent={{-20.0,0.0},{20.0,0.0}})}));
    end Inductor;

    model Valve

      Parts.BloodFlowInflow bloodFlowInflow               annotation(Placement(transformation(extent={{-106,-12},{-78,8}}), iconTransformation(extent={{-106,-10},{-78,10}})));
      Parts.BloodFlowOutflow bloodFlowOutflow               annotation(Placement(transformation(extent={{70,-6},{100,16}}), iconTransformation(extent={{70,-10},{100,12}})));
      Real q;
      Real dp;
      Boolean open(start=true);
      Real passableVariable;
    equation
      bloodFlowInflow.Q + bloodFlowOutflow.Q=0;
      q=bloodFlowInflow.Q;
      dp=bloodFlowInflow.Pressure - bloodFlowOutflow.Pressure;
      open=passableVariable > 0;
      if open then
        dp=0;
        q=passableVariable;
      else
        dp=passableVariable;
        q=0;
      end if;
      annotation(Icon(graphics={Rectangle(extent={{42,98},{66,-100}}, lineColor={0,0,255},
                fillPattern =                                                                          FillPattern.Solid, fillColor={255,170,170}),Polygon(points={{-70,98},{-72,-100},{36,-12},{36,12},{-70,98}}, lineColor={0,0,255}, smooth=Smooth.None, fillColor={255,170,170},
                fillPattern =                                                                                                    FillPattern.Solid),Text(extent={{-176,-116},{164,-142}}, lineColor={0,0,0}, textString
                =                                                                                                    "%name")}), Diagram(graphics));
    end Valve;

    connector RealDiscreteOutput =discrete output Real
      "'output Real' as connector"                                                  annotation(defaultComponentName="y", Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}), graphics={Polygon(points={{-100,100},{100,0},{-100,-100},{-100,100}}, lineColor={0,0,127}, fillColor={255,255,255},
              fillPattern =                                                                                                    FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}}, lineColor={0,0,127}, fillColor={255,255,255},
              fillPattern =                                                                                                   FillPattern.Solid),Text(extent={{30,110},{30,60}}, lineColor={0,0,127}, textString
              =                                                                                     "%name")}), Documentation(info="<html>
<p>
Connector with one output signal of type Real.
</p>
</html>"));
    model heartIntervals

      Modelica.Blocks.Interfaces.RealInput HR annotation(Placement(transformation(extent={{-134,8},{-94,48}}), iconTransformation(extent={{-134,8},{-94,48}})));
      Parts.RealDiscreteOutput Tas "duration of atrial systole"               annotation(Placement(transformation(extent={{100,36},{120,56}}), iconTransformation(extent={{100,36},{120,56}})));
      Parts.RealDiscreteOutput Tav "atrioventricular delay"               annotation(Placement(transformation(extent={{100,64},{120,84}}), iconTransformation(extent={{100,6},{120,26}})));
      Parts.RealDiscreteOutput Tvs "duration of ventricular systole"               annotation(Placement(transformation(extent={{100,4},{120,24}}), iconTransformation(extent={{100,-32},{120,-12}})));
      Parts.RealDiscreteOutput T0 "start time of cardiac cycle in sec"               annotation(Placement(transformation(extent={{100,-66},{120,-46}}), iconTransformation(extent={{100,-66},{120,-46}})));
      discrete Real HP(start=0)
        "heart period - duration of cardiac cycle in sec";
      Boolean b(start=false);
    equation
      b=time - pre(T0) >= pre(HP);
      when {initial(),b} then
        T0=time;
        HP=60/HR;
        Tas=0.03 + 0.09*HP;
        Tav=0.01;
        Tvs=0.16 + 0.2*HP;
      end when;
      annotation(Diagram(graphics), Icon(graphics={Text(visible=true, lineColor={127,0,0}, fillColor={0,0,255},
                fillPattern =                                                                                               FillPattern.Solid, extent={{34.0,30.0},{88.0,60.0}}, textString
                =                                                                                                    "Tas", fontName="Arial"),Text(visible=true, origin={6.1844,12.2128}, lineColor={0,0,255}, extent={{-122.1844,53.5603},{113.8156,82.0142}}, textString
                =                                                                                                    "Heart Intervals", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-94.0,12.0},{-30.0,48.0}}, textString
                =                                                                                                    "HR", fontName="Arial"),Line(visible=true, points={{-80.0,-6.0},{-80.0,-80.0}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{-70.0,-6.0},{-70.0,-80.0}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{-60.0,-6.0},{-60.0,-80.0}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{-32.0,-6.0},{-32.0,-80.0}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{30.0,-6.0},{30.0,-80.0}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{0.0,-6.0},{0.0,-80.0}}, color={0,0,255}, thickness=0.5),Text(visible=true, lineColor={127,0,0}, fillColor={0,0,255},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{38.0,0.0},{92.0,30.0}}, textString
                =                                                                                                    "Tav", fontName="Arial"),Text(visible=true, lineColor={127,0,0}, fillColor={0,0,255},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{38.0,-34.0},{92.0,-4.0}}, textString
                =                                                                                                    "Tvs", fontName="Arial"),Text(visible=true, lineColor={127,0,0}, fillColor={0,0,255},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{34.0,-68.0},{88.0,-38.0}}, textString
                =                                                                                                    "T0", fontName="Arial"),Rectangle(visible=true, fillColor={255,255,255}, extent={{-100.0,-100.0},{100.0,100.0}})}, coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end heartIntervals;

    model AtrialElastance
      Modelica.Blocks.Interfaces.RealInput Tas "duration of atrial systole" annotation(Placement(transformation(extent={{-120,12},{-80,52}}), iconTransformation(extent={{-126,62},{-100,88}})));
      Modelica.Blocks.Interfaces.RealOutput Et "elasticity (torr/ml)" annotation(Placement(transformation(extent={{94.0,16.0},{114.0,36.0}}, origin={-1.3229,2.3813}, rotation=0), iconTransformation(extent={{100.0,20.0},{120.0,40.0}}, origin={0.0,0.0}, rotation=0), visible=true));
      Modelica.Blocks.Interfaces.RealInput T0 "time of start of cardiac cycle "
                                                                                annotation(Placement(transformation(extent={{-120,-30},{-80,10}}), iconTransformation(extent={{-126,-54},{-100,-28}})));
      parameter Real EMIN=0.05 "Diastolic elastance (torr/ml)";
      parameter Real EMAX=0.15 "Maximum systolic elastance (tor/ml)";
    equation
      if time - T0 < Tas then
        Et=EMIN + (EMAX - EMIN)*sin(Modelica.Constants.pi*(time - T0)/Tas);
      else
        Et=EMIN;
      end if annotation(Icon(graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),Text(extent={{-134,122},{126,98}}, lineColor={0,0,255}, textString
                =                                                                                                    "%name"),Text(extent={{-122,-34},{-50,-46}}, lineColor={0,0,255}, textString
                =                                                                                                    "T0"),Text(extent={{-112,82},{-40,70}}, lineColor={0,0,255}, textString
                =                                                                                                    "Tas"),Text(extent={{56,36},{124,24}}, lineColor={0,0,255}, textString
                =                                                                                                    "Et"),Text(extent={{-52,62},{116,80}}, lineColor={0,0,255}, textString
                =                                                                                                    "Atrial elastance"),Line(points={{-62,-46},{-52,-18},{-36,8},{-16,26},{10,30},{42,2},{62,-42}}, color={0,0,255}, smooth=Smooth.Bezier),Line(points={{62,-42},{86,-42},{100,-42}}, color={0,0,255}, smooth=Smooth.Bezier)}), Diagram(graphics));
      annotation(Icon(graphics={Rectangle(visible=true, fillColor={255,255,255}, extent={{-100.0,-100.0},{100.0,100.0}}),Text(visible=true, origin={-1.1376,11.1636}, fillPattern=FillPattern.Solid, extent={{-88.8624,-11.1636},{88.8624,11.1636}}, textString="Atrial Elastance", fontName="Arial"),Text(visible=true, origin={-73.9995,75.5378}, fillPattern=FillPattern.Solid, extent={{-20.0,-10.0},{20.0,10.0}}, textString="Tas", fontName="Arial"),Text(visible=true, origin={-76.4595,-41.3045}, fillPattern=FillPattern.Solid, extent={{-16.4595,-11.3045},{16.4595,11.3045}}, textString="T0", fontName="Arial"),Text(visible=true, origin={80.0,33.5344}, fillPattern=FillPattern.Solid, extent={{-16.0792,-11.3832},{16.0792,11.3832}}, textString="Et", fontName="Arial")}, coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end AtrialElastance;

    model VentricularElastance
      Modelica.Blocks.Interfaces.RealInput Tas "duration of atrial systole" annotation(Placement(transformation(extent={{-120,12},{-80,52}}), iconTransformation(extent={{-126,62},{-100,88}})));
      Modelica.Blocks.Interfaces.RealOutput Et "elasticity (torr/ml)" annotation(Placement(transformation(extent={{94.0,16.0},{114.0,36.0}}, origin={0.0,0.0}, rotation=0), iconTransformation(extent={{100.0,20.0},{120.0,40.0}}, origin={0.0,10.0}, rotation=0), visible=true));
      Modelica.Blocks.Interfaces.RealInput T0 "time of start of cardiac cycle "
                                                                                annotation(Placement(transformation(extent={{-120,-30},{-80,10}}), iconTransformation(extent={{-126,-54},{-100,-28}})));
      Modelica.Blocks.Interfaces.RealInput Tav "atrioventricular delay" annotation(Placement(transformation(extent={{-120,12},{-80,52}}), iconTransformation(extent={{-126,24},{-100,50}})));
      Modelica.Blocks.Interfaces.RealInput Tvs
        "duration of ventricular systole"                                        annotation(Placement(transformation(extent={{-120,50},{-80,90}}), iconTransformation(extent={{-126,-14},{-100,12}})));
      Modelica.Blocks.Interfaces.RealOutput Et0 "elasticity (torr/ml)" annotation(Placement(transformation(extent={{94,-8},{114,12}}), iconTransformation(extent={{100,-18},{120,2}})));
      Modelica.Blocks.Interfaces.RealOutput HeartInterval
        "elasticity (torr/ml)"                                                   annotation(Placement(transformation(extent={{96,-30},{116,-10}}), iconTransformation(extent={{100,-50},{120,-30}})));
      constant Real Kn=0.57923032735652;
      parameter Real EMIN=0 "Diastolic elastance (torr/ml)";
      parameter Real EMAX=1 "Maximum systolic elastance (tor/ml)";
    equation
      HeartInterval=time - T0;
      Et=EMIN + (EMAX - EMIN)*Et0;
      if HeartInterval >= Tas + Tav and HeartInterval < Tas + Tav + Tvs then
        Et0=(HeartInterval - (Tas + Tav))/Tvs*sin(Modelica.Constants.pi*(HeartInterval - (Tas + Tav))/Tvs)/Kn;
      else
        Et0=0;
      end if annotation(Icon(graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),Text(extent={{-134,122},{126,98}}, lineColor={0,0,255}, textString
                =                                                                                                    "%name"),Text(extent={{-122,-34},{-50,-46}}, lineColor={0,0,255}, textString
                =                                                                                                    "T0"),Text(extent={{-110,48},{-58,34}}, lineColor={0,0,255}, textString
                =                                                                                                    "Tav"),Text(extent={{-110,82},{-58,68}}, lineColor={0,0,255}, textString
                =                                                                                                    "Tas"),Text(extent={{-112,8},{-60,-6}}, lineColor={0,0,255}, textString
                =                                                                                                    "Tvs"),Text(extent={{56,36},{124,24}}, lineColor={0,0,255}, textString
                =                                                                                                    "Et"),Text(extent={{-122,-70},{-54,-82}}, lineColor={0,0,255}, textString
                =                                                                                                    "Kn"),Text(extent={{-54,62},{114,80}}, lineColor={0,0,255}, textString
                =                                                                                                    "Ventricular elastance"),Line(points={{-66,-60},{-54,-32},{-36,0},{0,46},{28,48},{40,0},{56,-60}}, color={0,0,255}, smooth=Smooth.Bezier),Line(points={{56,-60},{90,-60},{100,-60}}, color={0,0,255}, smooth=Smooth.Bezier)}), Diagram(graphics));
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, extent={{-100.0,-100.0},{100.0,100.0}}),Text(visible=true, origin={-1.2605,16.0534}, fillPattern=FillPattern.Solid, extent={{-138.7395,-10.1077},{138.7395,10.1077}}, textString="Ventricular Elastance", fontName="Arial"),Text(visible=true, origin={-82.7938,75.0}, fillPattern=FillPattern.Solid, extent={{-15.0129,-5.0},{15.0129,5.0}}, textString="Tas", fontName="Arial"),Text(visible=true, origin={-83.2397,38.647}, fillPattern=FillPattern.Solid, extent={{-10.1077,-6.8375},{10.1077,6.8375}}, textString="Tav", fontName="Arial"),Text(visible=true, origin={-83.7547,0.0}, fillPattern=FillPattern.Solid, extent={{-11.971,-6.7837},{11.971,6.7837}}, textString="Tvs", fontName="Arial"),Text(visible=true, origin={-83.537,-41.4712}, fillPattern=FillPattern.Solid, extent={{-8.324,-5.7971},{8.324,5.7971}}, textString="T0", fontName="Arial"),Text(visible=true, origin={74.3785,40.4459}, fillPattern=FillPattern.Solid, extent={{-11.155,-6.8223},{11.155,6.8223}}, textString="Et", fontName="Arial"),Text(visible=true, origin={77.0273,-6.8223}, fillPattern=FillPattern.Solid, extent={{-11.155,-6.8223},{11.155,6.8223}}, textString="Et0", fontName="Arial"),Text(visible=true, origin={57.2941,-44.6898}, fillPattern=FillPattern.Solid, extent={{-37.2941,-22.8089},{37.2941,22.8089}}, textString="HeartInterval", fontName="Arial")}), Diagram(graphics));
    end VentricularElastance;

    block Constant "Generate constant signal of type Real"
      parameter Real k(start=1) "Constant output value";
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(transformation(extent={{100,-8},{120,12}}), iconTransformation(extent={{100,-8},{120,12}})));
    equation
      y=k;
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100.0,-100.0},{100.0,100.0}}, grid={2,2}, initialScale=0.04), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.0,-80.0},{100.0,100.0}}),Text(visible=true, fillColor={255,255,255},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.0,-32.0},{100.0,46.0}}, textString
                =                                                                                                    "%k", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-176.0,-140.0},{172.0,-106.0}}, textString
                =                                                                                                    "%name", fontName="Arial")}),
                                                                                                    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}, initialScale=0.04), graphics={Text(extent={{
                  -100,-102},{100,98}},                                                                                                    lineColor=
                  {0,0,0},
              textString="%k")}),                                                                            Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
    end Constant;

    model CardiacValve

      Parts.BloodFlowInflow bloodFlowInflow               annotation(Placement(transformation(extent={{-116,-13},{-82,12}}), iconTransformation(extent={{-114,-10},{-86,10}})));
      Parts.BloodFlowOutflow bloodFlowOutflow               annotation(Placement(transformation(extent={{84,-12},{118,12}}), iconTransformation(extent={{80,-10},{108,10}})));
      Parts.Valve outflowValve(open(fixed=true, start=true))               annotation(Placement(transformation(extent={{-40,23},{8,57}})));
      Parts.Valve backflowValve(open(fixed=true, start=
              false))                                                        annotation(Placement(transformation(extent={{10,-60},{-40,-22}})));
      Parts.VariableBloodResistor outflowBloodResistor               annotation(Placement(transformation(extent={{39,29},{61,51}})));
      Modelica.Blocks.Interfaces.RealInput outflowResistance "in torr sec / ml"
                                                                                annotation(Placement(transformation(extent={{-13,-13},{13,13}}, rotation=0, origin={15,77}), iconTransformation(extent={{-20,-20},{20,20}}, rotation=270, origin={-50,106})));
      Modelica.Blocks.Interfaces.RealInput inflowConductanceValue(start=0)
        "in ml/sec/torr"                                                                    annotation(Placement(transformation(extent={{-6,-16},{22,12}}), iconTransformation(extent={{-20,-20},{20,20}}, rotation=270, origin={40,108})));
      Parts.VariableBloodConductance variableBloodConductance               annotation(Placement(transformation(extent={{60,-52},{38,-30}})));
    equation
      connect(backflowValve.bloodFlowOutflow,bloodFlowInflow) annotation(Line(points={{-36.25,-40.81},{-80,-40.81},{-80,-0.5},{-99,-0.5}}, color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(bloodFlowInflow,outflowValve.bloodFlowInflow) annotation(Line(points={{-99,-0.5},{-80,-0.5},{-80,40},{-38.08,40}}, color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(outflowValve.bloodFlowOutflow,outflowBloodResistor.Inflow) annotation(Line(points={{4.4,
              40.17},{23.2,40.17},{23.2,40},{39,40}},                                                                                               color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(outflowBloodResistor.Outflow,bloodFlowOutflow) annotation(Line(points={{61,40},{70,40},{70,0},{101,0}}, color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(outflowResistance,outflowBloodResistor.BloodResistance) annotation(Line(points={{15,77},
              {50,77},{50,50.1825}},                                                                                         color={0,0,127}, smooth=Smooth.None));
      connect(inflowConductanceValue,variableBloodConductance.BloodConductance) annotation(Line(points={{8,-2},{
              49,-2},{49,-30.8175}},                                                                                                   color={0,0,127}, smooth=Smooth.None));
      connect(backflowValve.bloodFlowInflow,variableBloodConductance.Outflow) annotation(Line(points={{8,-41},{38,-41}}, color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(bloodFlowOutflow,variableBloodConductance.Inflow) annotation(Line(points={{101,0},
              {70,0},{70,-41},{60,-41}},                                                                                         color={255,0,0}, thickness=1, smooth=Smooth.None));
      annotation(Icon(graphics={Polygon(visible=true, fillColor={255,170,170},
                fillPattern =                                                              FillPattern.Solid, points={{-100.0,100.0},{80.0,0.0},{-100.0,-100.0},{-100.0,100.0}}),Rectangle(visible=true, fillColor={255,170,170},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{80.0,-100.0},{100.0,100.0}}),Text(visible=true, fillColor={0,0,255},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-114.0,-126.0},{108.0,-104.0}}, textString
                =                                                                                                    "%name", fontName="Arial")}, coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(graphics));
    end CardiacValve;

    model RightHeart

      Parts.BloodElasticCompartment RightAtrium(V0=40)               annotation(Placement(transformation(extent={{-78.0,-70.0},{-32.0,-24.0}}, origin={0.0,2.0}, rotation=0), visible=true));
      Parts.Constant VRAU(k=30)               annotation(Placement(transformation(extent={{-94.0,-20.0},{-86.0,-12.0}}, origin={0.0,2.0}, rotation=0), visible=true));
      Parts.BloodElasticCompartment RightVentricle(V0=130)               annotation(Placement(transformation(extent={{11.0,-66.0},{51.0,-26.0}}, origin={0.0,3.0}, rotation=0), visible=true));
      Parts.Constant VRVU(k=40)               annotation(Placement(transformation(extent={{-12.0,-22.0},{-4.0,-14.0}}, origin={4.0,4.0}, rotation=0), visible=true));
      Parts.AtrialElastance rightAtrialElastance(EMIN=0.05,
          EMAX=0.06)                                                                 annotation(Placement(transformation(extent={{-44,16},{-10,52}})));
      Parts.VentricularElastance rightVentricularElastance(EMIN=
            0.057, EMAX=0.49)                                                                   annotation(Placement(transformation(extent={{28.0,16.0},{64.0,52.0}}, origin={2.0,0.0}, rotation=0), visible=true));
      Parts.Constant RRAOUT(k=0.003)               annotation(Placement(transformation(extent={{-35.0,-80.0},{-25.0,-70.0}}, origin={1.8792,10.0}, rotation=0), visible=true));
      Parts.Constant RRV(k=0.003)               annotation(Placement(transformation(extent={{95.4865,-98.5667},{107.8073,-86.2458}}, origin={-41.6469,28.5667}, rotation=0), visible=true));
      Parts.BloodFlowInflow fromCentralVeins               annotation(Placement(transformation(extent={{-116,-90},{-88,-70}}), iconTransformation(extent={{-98,-60},{-68,-38}})));
      Parts.BloodFlowOutflow toPulmonaryArtery               annotation(Placement(transformation(extent={{94,-90},{122,-70}}), iconTransformation(extent={{76,-54},{106,-32}})));
      Modelica.Blocks.Interfaces.RealInput Tas annotation(Placement(transformation(extent={{-110,74},{-96,88}}), iconTransformation(extent={{-94,56},{-78,72}})));
      Modelica.Blocks.Interfaces.RealInput Tav annotation(Placement(transformation(extent={{0.0,38.0},{14.0,52.0}}, origin={-50.0,25.0}, rotation=0), iconTransformation(extent={{-94.0,36.0},{-78.0,52.0}}, origin={0.0,0.0}, rotation=0), visible=true));
      Modelica.Blocks.Interfaces.RealInput Tvs annotation(Placement(transformation(extent={{0.0,27.0},{14.0,41.0}}, origin={-57.0,26.0}, rotation=0), iconTransformation(extent={{-94.0,16.0},{-78.0,32.0}}, origin={0.0,0.0}, rotation=0), visible=true));
      Modelica.Blocks.Interfaces.RealInput PTH "Intrathoracic pressure (torr)" annotation(Placement(transformation(extent={{-110.0,-2.0},{-96.0,12.0}}, origin={0.0,5.0}, rotation=0), iconTransformation(extent={{-62.0,78.0},{-46.0,94.0}}, origin={0.0,0.0}, rotation=0), visible=true));
      Parts.CardiacValve tricuspidValve               annotation(Placement(transformation(extent={{-20.0,-90.0},{0.0,-70.0}}, origin={-0.0,0.0}, rotation=0), visible=true));
      Parts.CardiacValve pulmonicValve               annotation(Placement(transformation(extent={{74.0,-90.0},{94.0,-70.0}}, origin={-6.5264,0.0}, rotation=0), visible=true));
      Parts.Constant CRABackflow(k=0)               annotation(Placement(transformation(extent={{-22.0,-52.0},{-14.0,-44.0}}, origin={0.4694,2.0}, rotation=0), visible=true));
      Parts.Constant CRVBackflow(k=0)               annotation(Placement(transformation(extent={{111.0,-78.0},{123.0,-66.0}}, origin={-48.8833,23.7667}, rotation=0), visible=true));
      Modelica.Blocks.Interfaces.RealInput T0 annotation(Placement(transformation(extent={{-100.0,-10.0},{-80.0,10.0}}, origin={0.0,-0.0}, rotation=0), iconTransformation(extent={{-94.0,-4.0},{-78.0,12.0}}, origin={0.0,0.0}, rotation=0), visible=true));
    equation
      connect(RightAtrium.Elastance,rightAtrialElastance.Et) annotation(Line(visible=true, origin={1.0189,-4.7}, points={{
              -41.0566,-20.4174},{-41.0566,12.1083},{-5.2522,12.1083},{-5.2522,
              44.1},{-9.3189,44.1}},                                                                                                    color={0,0,127}));
      connect(T0,rightVentricularElastance.T0) annotation(Line(visible=true, origin={7.1437,0.0}, points={{-97.1437,-0.0},{0.0,0.0},{0.0,26.62},{20.5163,26.62}}, color={0,0,127}));
      connect(VRVU.y,RightVentricle.UnstressedVolume) annotation(Line(visible=true, origin={12.1404,-17.8503}, points={{-11.7404,3.9303},{5.8702,3.9303},{5.8702,-7.8605}}, color={0,0,127}));
      connect(VRAU.y,RightAtrium.UnstressedVolume) annotation(Line(visible=true, origin={-75.1585,-17.6525}, points={{
              -10.4415,3.7325},{5.22069,3.7325},{5.22069,-7.46492}},                                                                                                    color={0,0,127}));
      connect(Tvs,rightVentricularElastance.Tvs) annotation(Line(visible=true, origin={-8.1469,11.5813}, points={{-41.8531,48.4187},{13.7031,48.4187},{13.7031,22.2387},{35.8069,22.2387}}, color={0,0,127}));
      connect(RightVentricle.Elastance,rightVentricularElastance.Et) annotation(Line(visible=true, points={{44.0107,-25.7108},{44.0107,6.0},{74.0,6.0},{74.0,41.2},{67.8,41.2}}, color={0,0,127}));
      connect(RightVentricle.ExternalPressure,PTH) annotation(Line(visible=true, origin={-12.9929,-0.5703}, points={{45.0036,-21.1405},{45.0036,10.5703},{-90.0071,10.5703}}, color={0,0,127}));
      connect(RightAtrium.ExternalPressure,PTH) annotation(Line(visible=true, origin={-70.2251,-0.1725}, points={{16.3874,
              -20.3449},{16.3874,10.1725},{-32.7749,10.1725}},                                                                                                    color={0,0,127}));
      connect(rightAtrialElastance.T0,T0) annotation(Line(visible=true, points={{-46.21,26.62},{-78.0,26.62},{-78.0,0.0},{-90.0,0.0}}, color={0,0,127}));
      connect(rightVentricularElastance.Tav,Tav) annotation(Line(visible=true, origin={-1.0583,-1.32}, points={{28.7183,41.98},{11.0583,41.98},{11.0583,71.32},{-41.9417,71.32}}, color={0,0,127}));
      connect(Tas,rightVentricularElastance.Tas) annotation(Line(visible=true, points={{-103.0,81.0},{14.0,81.0},{14.0,47.5},{27.66,47.5}}, color={0,0,127}));
      connect(RightVentricle.bloodFlow,tricuspidValve.bloodFlowOutflow) annotation(Line(visible=true, origin={20.4667,-74.3333}, points={{10.5333,11.3333},{10.5333,-5.6667},{-21.0667,-5.6667}}, color={0,0,255}, thickness=1));
      connect(RightAtrium.bloodFlow,fromCentralVeins) annotation(Line(visible=true, origin={-70.6667,-76.0}, points={{15.6667,8.0},{15.6667,-4.0},{-31.3333,-4.0}}, color={0,0,255}, thickness=1));
      connect(CRABackflow.y,tricuspidValve.inflowConductanceValue) annotation(Line(visible=true, origin={1.3875,1.7639}, points={{-14.5181,-47.6839},{-21.3875,-47.96},{-6.0,-47.96},{-7.3875,-70.9639}}, color={0,0,255}));
      connect(RRAOUT.y,tricuspidValve.outflowResistance) annotation(Line(visible=true, points={{-22.6208,-64.9},{-20.0,-64.9},{-15.0,-64.9},{-15.0,-69.4}}, color={0,0,127}));
      connect(RRV.y,pulmonicValve.outflowResistance) annotation(Line(visible=true, points={{66.7764,
              -63.7163},{66.7764,-63.7163},{72.4736,-63.7163},{72.4736,-69.4}},                                                                                       color={0,0,127}));
      connect(CRVBackflow.y,pulmonicValve.inflowConductanceValue) annotation(Line(visible=true, points={{74.7167,
              -48.1133},{82.4,-47.96},{81.4736,-69.2}},                                                                                                    color={0,0,127}));
      connect(pulmonicValve.bloodFlowOutflow,toPulmonaryArtery) annotation(Line(visible=true, origin={97.4368,-80.0}, points={{-10.5632,0.0},{10.5632,0.0}}, color={0,0,255}, thickness=1));
      connect(tricuspidValve.bloodFlowOutflow,pulmonicValve.bloodFlowInflow) annotation(Line(visible=true, origin={33.4368,-80.0}, points={{-34.0368,0.0},{34.0368,0.0}}, color={0,0,255}, thickness=1));
      connect(fromCentralVeins,tricuspidValve.bloodFlowInflow) annotation(Line(visible=true, origin={-61.0,-80.0}, points={{-41.0,0.0},{41.0,0.0}}, color={0,0,255}, thickness=1));
      connect(Tas,rightAtrialElastance.Tas) annotation(Line(points={{-103,81},{-58,81},{-58,47.5},{-46.21,47.5}}, color={0,0,127}, smooth=Smooth.None));
      annotation(Diagram(graphics={Text(visible=true, origin={-74.8778,84.3012},
                fillPattern =                                                                FillPattern.Solid, extent={{-21.1674,-4.3012},{21.1674,4.3012}}, textString
                =                                                                                   "duration of atrial systole", fontName="Arial"),Text(visible=true, origin={-14.0515,72.3062},
                fillPattern =                                                                                                   FillPattern.Solid, extent={{-20.4464,-3.8937},{20.4464,3.8937}}, textString
                =                                                                                   "atrioventricular delay", fontName="Arial"),Text(visible=true, origin={-20.0,63.7344},
                fillPattern =                                                                                                   FillPattern.Solid, extent={{-25.4525,-3.7344},{25.4525,3.7344}}, textString
                =                                                                                   "duration of ventricular systole", fontName="Arial"),Text(visible=true, origin={-14.4903,2.6458},
                fillPattern =                                                                                                   FillPattern.Solid, extent={{-21.1674,-4.3012},{21.1674,4.3012}}, textString
                =                                                                                   "start time of cardiac cycle ", fontName="Arial"),Text(visible=true, origin={-51.1674,12.7137},
                fillPattern =                                                                                                   FillPattern.Solid, extent={{-21.1674,-4.3012},{21.1674,4.3012}}, textString
                =                                                                                   "Intrathoracic pressure", fontName="Arial")}, coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,170,170},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={255,170,170},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-50.0,8.0},{84.0,36.0}}, textString
                =                                                                                                    "Right Heart", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-94.0,56.0},{-42.0,72.0}}, textString
                =                                                                                                    "Tas", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-94.0,38.0},{-42.0,54.0}}, textString
                =                                                                                                    "Tav", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-92.0,16.0},{-40.0,32.0}}, textString
                =                                                                                                    "Tvs", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-90.0,-2.0},{-38.0,14.0}}, textString
                =                                                                                                    "T0", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={255,170,170},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-90.0,-24.0},{-38.0,-8.0}}, textString
                =                                                                                                    "Kn", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-58.0,78.0},{-6.0,94.0}}, textString
                =                                                                                                    "PTH", fontName="Arial")}, coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end RightHeart;

    model LeftHeart

      Parts.BloodElasticCompartment LeftAtrium(V0=40)               annotation(Placement(transformation(extent={{-82,-70},{-36,-24}})));
      Parts.Constant VLAU(k=30)               annotation(Placement(transformation(extent={{-94,-20},{-86,-12}})));
      Parts.BloodElasticCompartment LeftVentricle(V0=130)               annotation(Placement(transformation(extent={{16,-66},{56,-26}})));
      Parts.Constant VLVU(k=60)               annotation(Placement(transformation(extent={{-12,-22},{-4,-14}})));
      Parts.AtrialElastance leftAtrialElastance(EMIN=0.12,
          EMAX=0.28)                                                                annotation(Placement(transformation(extent={{-44,20},{-10,56}})));
      Parts.VentricularElastance leftVentricularElastance(EMIN=0.09,
          EMAX=4)                                                                          annotation(Placement(transformation(extent={{28,18},{64,54}})));
      Parts.Constant RLAOUT(k=0.003)               annotation(Placement(transformation(extent={{-26,-52},{-18,-44}})));
      Parts.Constant RLV(k=0.008)               annotation(Placement(transformation(extent={{62,-48},{70,-40}})));
      Parts.BloodFlowInflow fromPulmonaryVeins               annotation(Placement(transformation(extent={{-116,-91},{-84,-69}}), iconTransformation(extent={{-98,-60},{-68,-38}})));
      Parts.BloodFlowOutflow toAorta               annotation(Placement(transformation(extent={{94,-91},{126,-69}}), iconTransformation(extent={{76,-54},{106,-32}})));
      Modelica.Blocks.Interfaces.RealInput Tas annotation(Placement(transformation(extent={{-110,74},{-96,88}}), iconTransformation(extent={{-94,56},{-78,72}})));
      Modelica.Blocks.Interfaces.RealInput Tav annotation(Placement(transformation(extent={{0.0,38.0},{14.0,52.0}}, origin={-47.0,25.0}, rotation=0), iconTransformation(extent={{-94.0,36.0},{-78.0,52.0}}, origin={0.0,0.0}, rotation=0), visible=true));
      Modelica.Blocks.Interfaces.RealInput Tvs annotation(Placement(transformation(extent={{0.0,27.0},{14.0,41.0}}, origin={-54.0,29.0}, rotation=0), iconTransformation(extent={{-94.0,16.0},{-78.0,32.0}}, origin={0.0,0.0}, rotation=0), visible=true));
      Modelica.Blocks.Interfaces.RealInput T0 annotation(Placement(transformation(extent={{-112.0,62.0},{-98.0,76.0}}, origin={-2.0,-12.0}, rotation=0), iconTransformation(extent={{-94.0,-4.0},{-78.0,12.0}}, origin={0.0,0.0}, rotation=0), visible=true));
      Modelica.Blocks.Interfaces.RealInput PTH "Intrathoracic pressure (torr)" annotation(Placement(transformation(extent={{-110,-2},{-96,12}}), iconTransformation(extent={{-62,78},{-46,94}})));
      Parts.CardiacValve aorticValve               annotation(Placement(transformation(extent={{70,-90},{90,-70}})));
      Parts.Constant CLVBackflow(k=0)               annotation(Placement(transformation(extent={{-4,-4},{4,4}}, rotation=180, origin={90,-50})));
      Parts.CardiacValve tricuspidValve               annotation(Placement(transformation(extent={{-18,-90},{2,-70}})));
      Parts.Constant RLABackflow(k=0)               annotation(Placement(transformation(extent={{-4,-4},{4,4}}, rotation=180, origin={4,-54})));
    equation
      connect(LeftAtrium.ExternalPressure,PTH) annotation(Line(visible=true, origin={-0.1323,0.1323}, points={{
              -57.7054,-22.6497},{-57.7054,4.8677},{-102.868,4.8677}},                                                                                                color={0,0,127}));
      connect(Tvs,leftVentricularElastance.Tvs) annotation(Line(visible=true, origin={-9.1281,0.2646}, points={{-37.8719,62.7354},{15.5,62.7354},{15.5,35.82},{34.7881,35.5554}}, color={0,0,127}));
      connect(leftVentricularElastance.Tav,Tav) annotation(Line(visible=true, origin={-8.0,25.0}, points={{33.66,17.66},{18.0,17.66},{18.0,45.0},{-32.0,45.0}}, color={0,0,127}));
      connect(leftAtrialElastance.T0,T0) annotation(Line(visible=true, origin={-2.0,-10.62}, points={{-44.21,41.24},{-78.0,41.24},{-78.0,67.62},{-105.0,67.62}}, color={0,0,127}));
      connect(T0,leftVentricularElastance.T0) annotation(Line(visible=true, origin={0.0,-10.869}, points={{-107.0,67.869},{0.0,69.0},{0.0,39.489},{25.66,39.489}}, color={0,0,127}));
      connect(Tas,leftAtrialElastance.Tas) annotation(Line(visible=true, origin={2.4805,-1.0}, points={{-105.4805,82.0},{-58.0,82.0},{-58.0,52.5},{-48.6905,52.5}}, color={0,0,127}));
      connect(VLAU.y,LeftAtrium.UnstressedVolume) annotation(Line(points={{-85.6,
              -15.92},{-73.9378,-15.92},{-73.9378,-27.1174}},                                                                    color={0,0,127}, smooth=Smooth.None));
      connect(VLVU.y,LeftVentricle.UnstressedVolume) annotation(Line(points={{-3.6,-17.92},{23.0106,-17.92},{23.0106,-28.7108}}, color={0,0,127}, smooth=Smooth.None));
      connect(LeftAtrium.Elastance,leftAtrialElastance.Et) annotation(Line(points={{
              -44.0377,-27.1174},{-44.0377,10},{-2,10},{-2,43.4},{-8.3,43.4}},                                                                       color={0,0,127}, smooth=Smooth.None));
      connect(LeftVentricle.Elastance,leftVentricularElastance.Et) annotation(Line(points={{49.0107,
              -28.7108},{49.0107,10},{74,10},{74,43.2},{65.8,43.2}},                                                                                       color={0,0,127}, smooth=Smooth.None));
      connect(Tas,leftVentricularElastance.Tas) annotation(Line(points={{-103,81},{14,81},{14,49.5},{25.66,49.5}}, color={0,0,127}, smooth=Smooth.None));
      connect(LeftVentricle.ExternalPressure,PTH) annotation(Line(points={{37.0107,-24.7108},{37.0107,5},{-103,5}}, color={0,0,127}, smooth=Smooth.None));
      connect(LeftVentricle.bloodFlow,aorticValve.bloodFlowInflow) annotation(Line(points={{36,-66},{36,-80},{70,-80}}, color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(aorticValve.bloodFlowOutflow,toAorta) annotation(Line(points={{89.4,-80},{110,-80}}, color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(RLV.y,aorticValve.outflowResistance) annotation(Line(points={{70.4,-43.92},{75,-43.92},{75,-69.4}}, color={0,0,127}, smooth=Smooth.None));
      connect(CLVBackflow.y,aorticValve.inflowConductanceValue) annotation(Line(points={{85.6,-50.08},{84,-50.08},{84,-69.2}}, color={0,0,127}, smooth=Smooth.None));
      connect(tricuspidValve.bloodFlowOutflow,aorticValve.bloodFlowInflow) annotation(Line(points={{1.4,-80},{70,-80}}, color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(RLAOUT.y,tricuspidValve.outflowResistance) annotation(Line(points={{-17.6,-47.92},{-13,-47.92},{-13,-69.4}}, color={0,0,0}, smooth=Smooth.None));
      connect(RLABackflow.y,tricuspidValve.inflowConductanceValue) annotation(Line(points={{-0.4,-54.08},{-4,-54.08},{-4,-69.2}}, color={0,0,0}, smooth=Smooth.None));
      connect(fromPulmonaryVeins,tricuspidValve.bloodFlowInflow) annotation(Line(points={{-100,-80},{-18,-80}}, color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(fromPulmonaryVeins,LeftAtrium.bloodFlow) annotation(Line(points={{-100,-80},{-59,-80},{-59,-70}}, color={255,0,0}, thickness=1, smooth=Smooth.None));
      annotation(Diagram(graphics={Text(visible=true, origin={-78.8326,60.0},
                fillPattern =                                                             FillPattern.Solid, extent={{-21.1674,-4.3012},{21.1674,4.3012}}, textString
                =                                                                                   "start time of cardiac cycle ", fontName="Arial"),Text(visible=true, origin={-75.8038,84.3012},
                fillPattern =                                                                                                   FillPattern.Solid, extent={{-21.1674,-4.3012},{21.1674,4.3012}}, textString
                =                                                                                   "duration of atrial systole", fontName="Arial"),Text(visible=true, origin={-17.2738,65.0542},
                fillPattern =                                                                                                   FillPattern.Solid, extent={{-22.7262,-3.3344},{22.7262,3.3344}}, textString
                =                                                                                   "duration of ventricular systole", fontName="Arial"),Text(visible=true, origin={-18.0427,71.5462},
                fillPattern =                                                                                                   FillPattern.Solid, extent={{-16.4552,-3.1337},{16.4552,3.1337}}, textString
                =                                                                                   "atrioventricular delay", fontName="Arial"),Text(visible=true, origin={-73.2601,8.08},
                fillPattern =                                                                                                   FillPattern.Solid, extent={{-21.1674,-4.3012},{21.1674,4.3012}}, textString
                =                                                                                   "Intrathoracic pressure", fontName="Arial")}, coordinateSystem(extent={{-100,
                -100},{100,100}},                                                                                                    preserveAspectRatio=false,initialScale=0.1, grid={10,10})), Icon(graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,170,170},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={255,170,170},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-50.0,8.0},{84.0,36.0}}, textString
                =                                                                                                    "Left Heart", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-94.0,56.0},{-42.0,72.0}}, textString
                =                                                                                                    "Tas", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-94.0,38.0},{-42.0,54.0}}, textString
                =                                                                                                    "Tav", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-92.0,16.0},{-40.0,32.0}}, textString
                =                                                                                                    "Tvs", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-90.0,-2.0},{-38.0,14.0}}, textString
                =                                                                                                    "T0", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={255,170,170},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-90.0,-24.0},{-38.0,-8.0}}, textString
                =                                                                                                    "Kn", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-58.0,78.0},{-6.0,94.0}}, textString
                =                                                                                                    "PTH", fontName="Arial")}, coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end LeftHeart;

    model SystemicArteries

      Parts.BloodElasticCompartment ExtrathoracicArteries(V0=450)               annotation(Placement(transformation(extent={{-90,-40},{-42,8}})));
      Parts.BloodElasticCompartment IntrathoracicArteries(V0=300)               annotation(Placement(transformation(extent={{38,-44},{86,4}})));
      Parts.VariableBloodResistor ExtrathoracicArterialResistance               annotation(Placement(transformation(extent={{-13,-13},{13,13}}, rotation=180, origin={-21,-55})));
      Parts.Constant VITHAU(k=140) "unstressed volume in ml"               annotation(Placement(transformation(extent={{4,12},{16,24}})));
      Parts.Constant EITHA(k=1.43) "elastance (torr/ml)"               annotation(Placement(transformation(extent={{-6,-6},{6,6}}, rotation=180, origin={98,26})));
      Parts.Constant Pext(k=0) "unstressed volume in ml"               annotation(Placement(transformation(extent={{-82,36},{-70,48}})));
      Parts.Constant RETHA(k=0.06) "resistance torr sec/ml"               annotation(Placement(transformation(extent={{-68,-92},{-56,-80}})));
      Parts.Constant VETHAU(k=370) "unstressed volume in ml"               annotation(Placement(transformation(extent={{-102,28},{-90,40}})));
      Parts.Constant EETHA(k=0.556) "elastance (torr/ml)"               annotation(Placement(transformation(extent={{-6,-6},{6,6}}, rotation=180, origin={-18,18})));
      Parts.BloodFlowOutflow bloodFlowOutflow               annotation(Placement(transformation(extent={{-118,-65},{-88,-45}}), iconTransformation(extent={{-124,-17},{-94,3}})));
      Parts.BloodFlowInflow bloodFlowInflow               annotation(Placement(transformation(extent={{86,-65},{116,-45}}), iconTransformation(extent={{94,-17},{124,3}})));
      Modelica.Blocks.Interfaces.RealInput IntrathoracicPresssure "in torr" annotation(Placement(visible=true, transformation(origin={-84,75.9868}, extent={{-14,-14.0132},{14,14.0132}}, rotation=0), iconTransformation(origin={12,48}, extent={{-8,-8},{8,8}}, rotation=-90)));
      Parts.Inductor BloodFlowInertia               annotation(Placement(transformation(extent={{44,-74},{6,-36}})));
      Parts.Constant LETHA(k=0.0007) "inertance in torr sec^2/ml"               annotation(Placement(transformation(extent={{-22,-22},{-10,-10}})));
    equation
      connect(ExtrathoracicArterialResistance.Outflow,ExtrathoracicArteries.bloodFlow) annotation(Line(points={{-34,-55},{-66,-55},{-66,-40}}, color={255,0,0}, smooth=Smooth.None, thickness=1));
      connect(VITHAU.y,IntrathoracicArteries.UnstressedVolume) annotation(Line(points={{16.6,
              18.12},{32,18.12},{34,18.12},{46,18.12},{46,0.74704},{46.4127,
              0.74704}},                                                                                                    color={0,0,127}, smooth=Smooth.Bezier));
      connect(IntrathoracicArteries.Elastance,EITHA.y) annotation(Line(points={{77.6128,
              0.74704},{77.6128,25.88},{91.4,25.88}},                                                                           color={0,0,127}, smooth=Smooth.Bezier));
      connect(RETHA.y,ExtrathoracicArterialResistance.BloodResistance) annotation(Line(points={{-55.4,
              -85.88},{-22.7,-85.88},{-22.7,-67.0339},{-21,-67.0339}},                                                                                         color={0,0,127}, smooth=Smooth.Bezier));
      connect(VETHAU.y,ExtrathoracicArteries.UnstressedVolume) annotation(Line(points={{-89.4,
              34.12},{-89.4,35.06},{-81.5873,35.06},{-81.5873,4.74704}},                                                                                 color={0,0,127}, smooth=Smooth.Bezier));
      connect(EETHA.y,ExtrathoracicArteries.Elastance) annotation(Line(points={{-24.6,
              17.88},{-24.6,17.94},{-50.3872,17.94},{-50.3872,4.74704}},                                                                         color={0,0,127}, smooth=Smooth.Bezier));
      connect(IntrathoracicArteries.bloodFlow,bloodFlowInflow) annotation(Line(points={{62,-44},{62,-55},{101,-55}}, color={255,0,0}, smooth=Smooth.None, thickness=1));
      connect(ExtrathoracicArteries.bloodFlow,bloodFlowOutflow) annotation(Line(points={{-66,-40},{-66,-55},{-103,-55}}, color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(BloodFlowInertia.Inflow,IntrathoracicArteries.bloodFlow) annotation(Line(points={{44,-55},
              {62,-55},{62,-44}},                                                                                                 color={255,0,0}, smooth=Smooth.None, thickness=1));
      connect(ExtrathoracicArterialResistance.Inflow,BloodFlowInertia.Outflow) annotation(Line(points={{-8,-55},
              {-4,-55},{-4,-55},{6,-55}},                                                                                                    color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(IntrathoracicPresssure,IntrathoracicArteries.ExternalPressure) annotation(Line(points={{-84,
              75.9868},{62,75.9868},{62,5.54704},{63.2128,5.54704}},                                                                                             color={0,0,127}, smooth=Smooth.Bezier));
      connect(Pext.y,ExtrathoracicArteries.ExternalPressure) annotation(Line(points={{-69.4,
              42.12},{-69.4,42.06},{-64.7872,42.06},{-64.7872,9.54704}},                                                                               color={0,0,127}, smooth=Smooth.Bezier));
      connect(LETHA.y,BloodFlowInertia.Inertance) annotation(Line(points={{-9.4,
              -15.88},{25,-15.88},{25,-39.312}},                                                                   color={0,0,127}, smooth=Smooth.None));
      annotation(Diagram(graphics), Icon(graphics={Ellipse(extent={{92,46},{110,-44}}, lineColor={0,0,255}, fillColor={255,0,0},
                fillPattern =                                                                                                    FillPattern.Solid),Rectangle(extent={{-100,46},{102,-44}}, fillColor={255,0,0},
                fillPattern =                                                                                                    FillPattern.Solid, pattern=LinePattern.None, lineColor={0,0,0}),Ellipse(extent={{-110,46},{-92,-44}}, lineColor={0,0,255}, fillColor={0,0,255},
                fillPattern =                                                                                                    FillPattern.Solid),Text(extent={{-106,-56},{112,-86}}, lineColor={0,0,255}, fillColor={0,0,255},
                fillPattern =                                                                                                    FillPattern.Solid, textString
                =                                                                                                    "%name"),Text(extent={{110,24},{-92,34}}, lineColor={0,0,0},
                lineThickness =                                                                                                    1, textString
                =                                                                                                    "intrathoracic pressure",
                fillPattern =                                                                                                    FillPattern.Solid, fillColor={255,0,0})}));
    end SystemicArteries;

    model SystemicPeripheralVessels

      Parts.BloodFlowOutflow bloodFlowOutflow               annotation(Placement(transformation(extent={{-114,10},{-84,30}}), iconTransformation(extent={{-110,10},{-80,30}})));
      Parts.BloodFlowInflow bloodFlowInflow               annotation(Placement(transformation(extent={{82,9},{112,31}}), iconTransformation(extent={{80,8},{110,30}})));
      Parts.VariableBloodResistor SmallVenuleResistances               annotation(Placement(transformation(extent={{-24,5},{-52,34}})));
      Modelica.Blocks.Interfaces.RealInput PeripheralArteriolarResistance
        "in torr sec/ml"                                                                   annotation(Placement(visible=true, transformation(origin={109,51}, extent={{17,-17},{-17,17}}, rotation=0), iconTransformation(origin={-10,98}, extent={{-8,-8},{8,8}}, rotation=-90)));
      Parts.BloodElasticCompartment BloodTissueElasticCompartment(V0=200)               annotation(Placement(transformation(extent={{10,36},{54,80}})));
      Parts.Constant TUV(k=185) "unstressed volume in ml"               annotation(Placement(transformation(extent={{-28,86},{-16,98}})));
      Parts.Constant Pext(k=0) "unstressed volume in ml"               annotation(Placement(transformation(extent={{54,88},{44,98}})));
      Parts.Constant EET(k=0.262) "elastance (torr/ml)"               annotation(Placement(transformation(extent={{-6,-6},{6,6}}, rotation=180, origin={80,84})));
      Parts.VariableBloodResistor SystemicArteriolaResistance               annotation(Placement(transformation(extent={{74,6},{46,35}})));
      Parts.Constant RTA(k=0.2) "resistance torr sec/ml"               annotation(Placement(transformation(extent={{5,-5},{-5,5}}, rotation=180, origin={-69,47})));
    equation
      connect(SmallVenuleResistances.Outflow,bloodFlowOutflow) annotation(Line(points={{-52,19.5},{-76,19.5},{-76,20},{-99,20}}, color={0,0,255}, smooth=Smooth.None, thickness=1));
      connect(SmallVenuleResistances.Inflow,BloodTissueElasticCompartment.bloodFlow) annotation(Line(points={{-24,
              19.5},{10,19.5},{10,20},{32,20},{32,36}},                                                                                                    color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(BloodTissueElasticCompartment.UnstressedVolume,TUV.y) annotation(Line(points={{17.7117,
              77.0181},{17.7117,92.12},{-15.4,92.12}},                                                                                        color={0,0,127}, smooth=Smooth.None));
      connect(BloodTissueElasticCompartment.ExternalPressure,Pext.y) annotation(Line(points={{33.1118,
              81.4181},{33.1118,93.1},{43.5,93.1}},                                                                                         color={0,0,127}, smooth=Smooth.None));
      connect(EET.y,BloodTissueElasticCompartment.Elastance) annotation(Line(points={{73.4,
              83.88},{60,83.88},{46,83.88},{46,77.0181},{46.3118,77.0181}},                                                                        color={0,0,127}, smooth=Smooth.None));
      connect(SystemicArteriolaResistance.Inflow,bloodFlowInflow) annotation(Line(points={{74,20.5},
              {85,20.5},{85,20},{97,20}},                                                                                           color={255,0,0}, smooth=Smooth.None, thickness=1));
      connect(SystemicArteriolaResistance.Outflow,BloodTissueElasticCompartment.bloodFlow) annotation(Line(points={{46,20.5},{40,20.5},{40,20},{32,20},{32,36}}, color={255,0,0}, smooth=Smooth.None, thickness=1));
      connect(PeripheralArteriolarResistance,SystemicArteriolaResistance.BloodResistance) annotation(Line(points={{109,51},
              {60,51},{60,33.9224}},                                                                                                    color={0,0,127}, smooth=Smooth.None));
      connect(RTA.y,SmallVenuleResistances.BloodResistance) annotation(Line(points={{-63.5,
              46.9},{-38,46.9},{-38,32.9224}},                                                                              color={0,0,127}, smooth=Smooth.None));
      annotation(Icon(graphics={Line(points={{100,20},{46,58},{22,66},{-34,64},{-60,40},{-100,20},{-60,32},{-38,54},{-2,56},{36,50},{82,30},{100,20},{20,46},{-26,48},{-54,30},{-100,20},{-52,24},{-20,40},{28,36},{100,20},{34,28},{-18,28},{-54,20},{-100,20},{-54,14},{-20,16},{32,18},{100,20},{66,6},{-26,4},{-70,8},{-100,20},{-70,0},{2,-6},{60,-2},{100,20},{54,-14},{-38,-16},{-78,-6},{-100,20},{-72,-22},{30,-34},{64,-18},{100,20},{66,-30},{24,-46},{-48,-40},{-72,-34},{-100,20},{-78,-62},{-4,-76},{74,-68},{100,20},{62,-54},{0,-60},{-78,-46},{-100,20},{-58,70},{2,74},{50,68},{100,20},{56,84},{2,90},{-50,86},{-78,64},{-100,20}}, color={255,0,0}, smooth=Smooth.None, thickness=0.5),Text(extent={{-120,-78},{124,-106}}, lineColor={0,0,255}, fillColor={0,0,255},
                fillPattern =                                                                                                    FillPattern.Solid, textString
                =                                                                                                    "%name"),Text(extent={{102,76},{-100,86}}, lineColor={0,0,0},
                lineThickness =                                                                                                    1,
                fillPattern =                                                                                                    FillPattern.Solid, fillColor={255,0,0}, textString
                =                                                                                                    "peripheral resistance")}), Diagram(graphics));
    end SystemicPeripheralVessels;

    model SystemicVeins

      Parts.BloodElasticCompartment IntrathoracicVeins(V0=2000) annotation(Placement(transformation(extent={{-72,-40},{-24,8}})));
      Parts.BloodElasticCompartment ExtrathoracicVeins(V0=1900)               annotation(Placement(transformation(extent={{22,-42},{70,6}})));
      Parts.VariableBloodResistor VeinsResistance               annotation(Placement(transformation(extent={{-13,-13},{13,13}}, rotation=180, origin={-5,-55})));
      Parts.Constant VETHVU(k=1000) "unstressed volume in ml"               annotation(Placement(transformation(extent={{2,10},{14,22}})));
      Parts.Constant EETHV(k=0.0169) "elastance (torr/ml)"               annotation(Placement(transformation(extent={{-6,-6},{6,6}}, rotation=180, origin={88,26})));
      Parts.Constant Pext(k=0) "unstressed volume in ml"               annotation(Placement(transformation(extent={{26,24},{38,36}})));
      Parts.Constant RETHV(k=0.09) "resistance torr sec/ml"               annotation(Placement(transformation(extent={{-40,-92},{-28,-80}})));
      Parts.Constant VITHVU(k=1190) "unstressed volume in ml"               annotation(Placement(transformation(extent={{-96,22},{-84,34}})));
      Parts.Constant EITHV(k=0.0182) "elastance (torr/ml)"               annotation(Placement(transformation(extent={{-6,-6},{6,6}}, rotation=180, origin={-18,18})));
      Parts.BloodFlowOutflow bloodFlowOutflow               annotation(Placement(transformation(extent={{-116,-65},{-86,-45}}), iconTransformation(extent={{-124,-17},{-94,3}})));
      Parts.BloodFlowInflow bloodFlowInflow               annotation(Placement(transformation(extent={{86,-65},{116,-45}}), iconTransformation(extent={{94,-17},{124,3}})));
      Modelica.Blocks.Interfaces.RealInput IntrathoracicPresssure "in torr" annotation(Placement(visible=true, transformation(origin={-82,51.9868}, extent={{-14,-14.0132},{14,14.0132}}, rotation=0), iconTransformation(origin={12,48}, extent={{-8,-8},{8,8}}, rotation=-90)));
      Parts.Constant RRAIN(k=0.003)               annotation(Placement(transformation(extent={{-4,-4},{4,4}}, rotation=0, origin={-92,-84})));
      Parts.VariableBloodResistor centralVenousResistance               annotation(Placement(transformation(extent={{-10,-10},{10,10}}, rotation=180, origin={-76,-55})));
    equation
      connect(VeinsResistance.Inflow,ExtrathoracicVeins.bloodFlow) annotation(Line(points={{8,-55},
              {46,-55},{46,-42}},                                                                                            color={0,0,255}, smooth=Smooth.None, thickness=1));
      connect(VeinsResistance.Outflow,IntrathoracicVeins.bloodFlow) annotation(Line(points={{-18,-55},{-48,-55},{-48,-40}}, color={0,0,255}, smooth=Smooth.None, thickness=1));
      connect(ExtrathoracicVeins.Elastance,EETHV.y) annotation(Line(points={{61.6128,
              2.74704},{61.6128,25.88},{81.4,25.88}},                                                                        color={0,0,127}, smooth=Smooth.Bezier));
      connect(Pext.y,ExtrathoracicVeins.ExternalPressure) annotation(Line(points={{38.6,
              30.12},{38.6,31.06},{47.2128,31.06},{47.2128,7.54704}},                                                                           color={0,0,127}, smooth=Smooth.Bezier));
      connect(RETHV.y,VeinsResistance.BloodResistance) annotation(Line(points={{-27.4,
              -85.88},{-4.7,-85.88},{-4.7,-67.0339},{-5,-67.0339}},                                                                         color={0,0,127}, smooth=Smooth.Bezier));
      connect(EITHV.y,IntrathoracicVeins.Elastance) annotation(Line(points={{-24.6,
              17.88},{-24.6,17.94},{-32.3872,17.94},{-32.3872,4.74704}},                                                                      color={0,0,127}, smooth=Smooth.Bezier));
      connect(IntrathoracicVeins.ExternalPressure,IntrathoracicPresssure) annotation(Line(points={{
              -46.7872,9.54704},{-46.7872,40},{-46.7872,51.9868},{-82,51.9868}},                                                                            color={0,0,127}, smooth=Smooth.Bezier));
      connect(ExtrathoracicVeins.UnstressedVolume,VETHVU.y) annotation(Line(points={{30.4127,
              2.74704},{30.4127,16.12},{14.6,16.12}},                                                                                color={0,0,127}, smooth=Smooth.Bezier));
      connect(VeinsResistance.Inflow,bloodFlowInflow) annotation(Line(points={{8,-55},
              {54,-55},{54,-55},{101,-55}},                                                                               color={0,0,255}, thickness=1, smooth=Smooth.None));
      connect(RRAIN.y,centralVenousResistance.BloodResistance) annotation(Line(points={{-87.6,
              -83.92},{-76,-83.92},{-76,-64.2569}},                                                                                 color={0,0,127}, smooth=Smooth.Bezier));
      connect(VITHVU.y,IntrathoracicVeins.UnstressedVolume) annotation(Line(points={{-83.4,
              28.12},{-64,28.12},{-64,4.74704},{-63.5873,4.74704}},                                                                              color={0,0,127}, smooth=Smooth.Bezier));
      connect(bloodFlowOutflow,centralVenousResistance.Outflow) annotation(Line(points={{-101,-55},{-86,-55}}, color={0,0,255}, thickness=1, smooth=Smooth.None));
      connect(centralVenousResistance.Inflow,VeinsResistance.Outflow) annotation(Line(points={{-66,-55},
              {-18,-55}},                                                                                                    color={0,0,255}, thickness=1, smooth=Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                         graphics), Icon(graphics={Ellipse(extent={{92,46},{110,-44}}, lineColor={0,0,255}, fillColor={0,128,255},
                fillPattern =                                                                                                    FillPattern.Solid),Rectangle(extent={{-100,46},{102,-44}}, fillColor={0,128,255},
                fillPattern =                                                                                                    FillPattern.Solid, pattern=LinePattern.None),Ellipse(extent={{-110,46},{-92,-44}}, lineColor={0,0,255}, fillColor={0,0,255},
                fillPattern =                                                                                                    FillPattern.Solid),Text(extent={{-106,-56},{112,-86}}, lineColor={0,0,255}, fillColor={0,0,255},
                fillPattern =                                                                                                    FillPattern.Solid, textString
                =                                                                                                    "%name"),Text(extent={{110,24},{-92,34}}, lineColor={0,0,0},
                lineThickness =                                                                                                    1, textString
                =                                                                                                    "intrathoracic pressure")}));
    end SystemicVeins;

    model PulmonaryCirculation

      Parts.BloodElasticCompartment PulmonaryArteries(V0=100)               annotation(Placement(transformation(extent={{-90,-40},{-42,8}})));
      Parts.BloodElasticCompartment PulmonaryVeins(V0=600)               annotation(Placement(transformation(extent={{10,-44},{58,4}})));
      Parts.VariableBloodResistor PulmonaryArteriesResistance               annotation(Placement(transformation(extent={{13,-13},{-13,13}}, rotation=180, origin={-27,-60})));
      Parts.Constant VPVU(k=350) "unstressed volume in ml"               annotation(Placement(transformation(extent={{-4,16},{8,28}})));
      Parts.Constant EPV(k=0.0455) "elastance (torr/ml)"               annotation(Placement(transformation(extent={{-6,-6},{6,6}}, rotation=180, origin={78,26})));
      Parts.Constant RPP(k=0.11) "resistance torr sec/ml"               annotation(Placement(transformation(extent={{-44,-92},{-32,-80}})));
      Parts.Constant VPAU(k=50) "unstressed volume in ml"               annotation(Placement(transformation(extent={{-102,28},{-90,40}})));
      Parts.Constant EPA(k=0.233) "elastance (torr/ml)"               annotation(Placement(transformation(extent={{-6,-6},{6,6}}, rotation=180, origin={-18,18})));
      Parts.BloodFlowOutflow bloodFlowOutflow               annotation(Placement(transformation(extent={{88,-70},{118,-50}}), iconTransformation(extent={{102,-13},{132,7}})));
      Parts.BloodFlowInflow bloodFlowInflow               annotation(Placement(transformation(extent={{-116,-70},{-86,-50}}), iconTransformation(extent={{-128,-9},{-98,11}})));
      Modelica.Blocks.Interfaces.RealInput IntrathoracicPresssure "in torr" annotation(Placement(visible=true, transformation(origin={-84,75.9868}, extent={{-14,-14.0132},{14,14.0132}}, rotation=0), iconTransformation(origin={12,48}, extent={{-8,-8},{8,8}}, rotation=-90)));
      Parts.VariableBloodResistor pulmonaryVeinResistance               annotation(Placement(transformation(extent={{54,-72},{78,-48}})));
      Parts.Constant RLAIN(k=0.003)               annotation(Placement(transformation(extent={{-4,-4},{4,4}}, rotation=180, origin={88,-36})));
    equation
      connect(PulmonaryVeins.Elastance,EPV.y) annotation(Line(points={{49.6128,
              0.74704},{49.6128,25.88},{71.4,25.88}},                                                                  color={0,0,127}, smooth=Smooth.Bezier));
      connect(RPP.y,PulmonaryArteriesResistance.BloodResistance) annotation(Line(points={{-31.4,
              -85.88},{-28,-85.88},{-27,-85.88},{-27,-72.0339}},                                                                             color={0,0,127}, smooth=Smooth.Bezier));
      connect(VPAU.y,PulmonaryArteries.UnstressedVolume) annotation(Line(points={{-89.4,
              34.12},{-89.4,35.06},{-81.5873,35.06},{-81.5873,4.74704}},                                                                           color={0,0,127}, smooth=Smooth.Bezier));
      connect(EPA.y,PulmonaryArteries.Elastance) annotation(Line(points={{-24.6,
              17.88},{-24.6,17.94},{-50.3872,17.94},{-50.3872,4.74704}},                                                                   color={0,0,127}, smooth=Smooth.Bezier));
      connect(PulmonaryArteries.ExternalPressure,IntrathoracicPresssure) annotation(Line(points={{
              -64.7872,9.54704},{-64.7872,50},{-64.7872,75.9868},{-84,75.9868}},                                                                           color={0,0,127}, smooth=Smooth.Bezier));
      connect(PulmonaryArteries.bloodFlow,bloodFlowInflow) annotation(Line(points={{-66,-40},{-66,-60},{-101,-60}}, color={0,0,255}, smooth=Smooth.None, thickness=1));
      connect(bloodFlowInflow,PulmonaryArteriesResistance.Inflow) annotation(Line(points={{-101,
              -60},{-60.5,-60},{-60.5,-60},{-40,-60}},                                                                                         color={0,0,255}, thickness=1, smooth=Smooth.None));
      connect(PulmonaryVeins.ExternalPressure,IntrathoracicPresssure) annotation(Line(points={{35.2128,
              5.54704},{35.2128,75.9868},{-84,75.9868}},                                                                                          color={0,0,127}, smooth=Smooth.Bezier));
      connect(pulmonaryVeinResistance.Outflow,bloodFlowOutflow) annotation(Line(points={{78,-60},{90,-60},{103,-60}}, color={255,0,0}, thickness=1, smooth=Smooth.Bezier));
      connect(PulmonaryArteriesResistance.Outflow,PulmonaryVeins.bloodFlow) annotation(Line(points={{-14,-60},{34,-60},{34,-44}}, color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(PulmonaryArteriesResistance.Outflow,pulmonaryVeinResistance.Inflow) annotation(Line(points={{-14,-60},
              {54,-60},{54,-60}},                                                                                                    color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(pulmonaryVeinResistance.BloodResistance,RLAIN.y) annotation(Line(points={{66,
              -48.8918},{66,-48.8918},{66,-42},{66,-36.08},{83.6,-36.08}},                                                                              color={0,0,0}, smooth=Smooth.Bezier));
      connect(VPVU.y,PulmonaryVeins.UnstressedVolume) annotation(Line(points={{8.6,
              22.12},{8.6,22.06},{18.4127,22.06},{18.4127,0.74704}},                                                                      color={0,0,127}, smooth=Smooth.Bezier));
      annotation(Diagram(graphics), Icon(graphics={Ellipse(extent={{92,46},{110,-44}}, lineColor={0,0,255}, fillColor={255,170,85},
                fillPattern =                                                                                                    FillPattern.Solid),Rectangle(extent={{-100,46},{102,-44}}, fillColor={255,170,85},
                fillPattern =                                                                                                    FillPattern.Solid, pattern=LinePattern.None, lineColor={0,0,0}),Ellipse(extent={{-110,46},{-92,-44}}, lineColor={0,0,255}, fillColor={0,0,255},
                fillPattern =                                                                                                    FillPattern.Solid),Text(extent={{-106,-56},{112,-86}}, lineColor={0,0,255}, fillColor={0,0,255},
                fillPattern =                                                                                                    FillPattern.Solid, textString
                =                                                                                                    "%name"),Text(extent={{110,24},{-92,34}}, lineColor={0,0,0},
                lineThickness =                                                                                                    1, textString
                =                                                                                                    "intrathoracic pressure")}));
    end PulmonaryCirculation;

    model Haemodynamics
      RightHeart rightHeart(RightAtrium(V0=40), RightVentricle(V0=130), rightAtrialElastance(EMAX=0.15)) annotation(Placement(transformation(extent={{-42,12},{-4,50}})));
      Parts.heartIntervals heartIntervals annotation(Placement(transformation(extent={{-82.0,58.0},{-62.0,78.0}}, origin={0.0,0.0}, rotation=0), visible=true));
      Constant HeartRate(k=72) annotation(Placement(transformation(extent={{-98.0,84.0},{-90.0,92.0}}, origin={0.0,0.0}, rotation=0), visible=true));
      SystemicVeins systemicVeins(ExtrathoracicVeins(V0=1760), IntrathoracicVeins(V0=1400)) annotation(Placement(transformation(extent={{-87,-79},
                {-39,-39}})));
      Constant Pth(k=-4) annotation(Placement(transformation(extent={{-90.0,16.0},{-82.0,24.0}}, origin={0.0,-0.0}, rotation=0), visible=true));
      PulmonaryCirculation pulmonaryCirculation(PulmonaryArteries(V0=100), PulmonaryVeins(V0=600)) annotation(Placement(transformation(extent={{4,-10},{36,20}})));
      SystemicArteries systemicArteries(IntrathoracicArteries(V0=300), ExtrathoracicArteries(V0=500), LETHA(k=0.0007)) annotation(Placement(transformation(extent={{36,-78},{84,-40}})));
      Constant RSP(k=0.8) "resistance torr sec/ml" annotation(Placement(transformation(extent={{-28,-34},{-20,-26}})));
      SystemicPeripheralVessels systemicPeripheralVessels annotation(Placement(transformation(extent={{-26,-84},{16,-44}})));
      LeftHeart leftHeart annotation(Placement(transformation(extent={{46,10},{84,48}})));
    equation
      connect(heartIntervals.Tas,leftHeart.Tas) annotation(Line(visible=true, points={{-61.0,72.6},{38.0,72.6},{38.0,41.16},{48.66,41.16}}, color={0,0,127}));
      connect(heartIntervals.Tav,leftHeart.Tav) annotation(Line(visible=true, points={{-61.0,69.6},{34.0,69.6},{34.0,37.36},{48.66,37.36}}, color={0,0,127}));
      connect(heartIntervals.T0,leftHeart.T0) annotation(Line(visible=true, points={{-61.0,62.4},{24.0,62.4},{24.0,29.76},{48.66,29.76}}, color={0,0,127}));
      connect(heartIntervals.Tvs,leftHeart.Tvs) annotation(Line(visible=true, points={{-61.0,65.8},{30.0,65.8},{30.0,33.56},{48.66,33.56}}, color={0,0,127}));
      connect(HeartRate.y,heartIntervals.HR) annotation(Line(visible=true, points={{-89.6,88.08},{-88.0,88.08},{-88.0,70.8},{-83.4,70.8}}, color={0,0,127}));
      connect(heartIntervals.Tas,rightHeart.Tas) annotation(Line(visible=true, points={{-61.0,72.6},{-44.0,72.6},{-44.0,43.16},{-39.34,43.16}}, color={0,0,127}));
      connect(heartIntervals.Tav,rightHeart.Tav) annotation(Line(visible=true, points={{-61.0,69.6},{-46.0,69.6},{-46.0,39.36},{-39.34,39.36}}, color={0,0,127}));
      connect(heartIntervals.Tvs,rightHeart.Tvs) annotation(Line(visible=true, points={{-61.0,65.8},{-48.0,65.8},{-48.0,35.56},{-39.34,35.56}}, color={0,0,127}));
      connect(heartIntervals.T0,rightHeart.T0) annotation(Line(visible=true, points={{-61.0,62.4},{-52.0,62.4},{-52.0,31.76},{-39.34,31.76}}, color={0,0,127}));
      connect(Pth.y,leftHeart.PTH) annotation(Line(visible=true, points={{-81.6,20.08},{-66.0,20.08},{-66.0,54.0},{14.0,54.0},{14.0,45.34},{54.74,45.34}}, color={0,0,127}));
      connect(Pth.y,systemicVeins.IntrathoracicPresssure) annotation(Line(visible=true, points={{-81.6,
              20.08},{-66,20.08},{-66,-20},{-60.12,-20},{-60.12,-49.4}},                                                                                                  color={0,0,127}));
      connect(Pth.y,systemicArteries.IntrathoracicPresssure) annotation(Line(visible=true, points={{-81.6,
              20.08},{-66,20.08},{-66,-20},{62.88,-20},{62.88,-49.88}},                                                                                                    color={0,0,127}));
      connect(Pth.y,pulmonaryCirculation.IntrathoracicPresssure) annotation(Line(visible=true, points={{-81.6,20.08},{-66.0,20.08},{-66.0,54.0},{14.0,54.0},{14.0,18.0},{21.92,18.0},{21.92,12.2}}, color={0,0,127}));
      connect(rightHeart.PTH,Pth.y) annotation(Line(visible=true, points={{-33.26,47.34},{-66.0,47.34},{-66.0,20.08},{-81.6,20.08}}, color={0,0,127}));
      connect(systemicVeins.bloodFlowOutflow,rightHeart.fromCentralVeins) annotation(Line(points={{-89.16,
              -60.4},{-96,-60.4},{-96,6},{-38.77,6},{-38.77,21.69}},                                                                                             color={0,0,255}, smooth=Smooth.None, thickness=1));
      connect(pulmonaryCirculation.bloodFlowInflow,rightHeart.toPulmonaryArtery) annotation(Line(points={{1.92,
              5.15},{-5.71,5.15},{-5.71,22.83}},                                                                                                  color={0,0,255}, thickness=1, smooth=Smooth.None));
      connect(systemicVeins.bloodFlowInflow,systemicPeripheralVessels.bloodFlowOutflow) annotation(Line(points={{-36.84,
              -60.4},{-28,-60.4},{-28,-60},{-24.95,-60}},                                                                                                    color={0,0,255}, smooth=Smooth.None, thickness=1));
      connect(systemicArteries.bloodFlowOutflow,systemicPeripheralVessels.bloodFlowInflow) annotation(Line(points={{33.84,-60.33},{18,-60.33},{18,-60},{16,-60},{14.95,-60.2}}, color={255,0,0}, smooth=Smooth.None, thickness=1));
      connect(systemicPeripheralVessels.PeripheralArteriolarResistance,RSP.y) annotation(Line(points={{-7.1,-44.4},{-7.1,-29.92},{-19.6,-29.92}}, color={0,0,127}, smooth=Smooth.None));
      connect(pulmonaryCirculation.bloodFlowOutflow,leftHeart.fromPulmonaryVeins) annotation(Line(points={{38.72,
              4.55},{49.23,4.55},{49.23,19.69}},                                                                                                    color={255,0,0}, thickness=1, smooth=Smooth.None));
      connect(leftHeart.toAorta,systemicArteries.bloodFlowInflow) annotation(Line(points={{82.29,
              20.83},{96,20.83},{96,-60.33},{86.16,-60.33}},                                                                                    color={255,0,0}, thickness=1, smooth=Smooth.None));
      annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}),
                         graphics), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,127},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}}),Text(visible=true, origin={-5.2177,53.2399},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-48.6213,-19.0003},{48.6213,19.0003}}, textString
                =                                                                                                    "Model of", fontName="Arial"),Text(visible=true, origin={0.7994,5.879},
                fillPattern =                                                                                                    FillPattern.Solid, extent={{-99.2006,-34.121},{99.2006,34.121}}, textString
                =                                                                                                    "Hemodynamics", fontName="Arial")}), experiment(StopTime=20, NumberOfIntervals=5000));
    end Haemodynamics;

    annotation(Diagram(coordinateSystem(extent={{-148.5,-105.0},{148.5,105.0}}, preserveAspectRatio=true, initialScale=0.1, grid={5,5})));
  end Parts;

  model ModelOfHaemodynamics

    Parts.RightHeart rightHeart(
      RightAtrium(V0=40),
      RightVentricle(V0=130),
      rightAtrialElastance(EMAX=0.15))                                                                                           annotation(Placement(transformation(extent={{-42,12},{-4,50}})));
    Parts.heartIntervals heartIntervals                     annotation(Placement(transformation(extent={{-82.0,58.0},{-62.0,78.0}}, origin={0.0,0.0}, rotation=0), visible=true));
    Parts.Constant HeartRate(k=72)                     annotation(Placement(transformation(extent={{-98.0,84.0},{-90.0,92.0}}, origin={0.0,0.0}, rotation=0), visible=true));
    Parts.SystemicVeins systemicVeins(ExtrathoracicVeins(
          V0=1760), IntrathoracicVeins(V0=1400))                                                                    annotation(Placement(transformation(extent={{-87,-79},{-39,-39}})));
    Parts.Constant Pth(k=-4)                     annotation(Placement(transformation(extent={{-90.0,16.0},{-82.0,24.0}}, origin={0.0,-0.0}, rotation=0), visible=true));
    Parts.PulmonaryCirculation pulmonaryCirculation(
        PulmonaryArteries(V0=100), PulmonaryVeins(V0=600))                                                                 annotation(Placement(transformation(extent={{4,-10},{36,20}})));
    Parts.SystemicArteries systemicArteries(
      IntrathoracicArteries(V0=300),
      ExtrathoracicArteries(V0=500),
      LETHA(k=0.0007))                                                                                                     annotation(Placement(transformation(extent={{36,-78},{84,-40}})));
    Parts.Constant RSP(k=0.8) "resistance torr sec/ml"
                                                      annotation(Placement(transformation(extent={{-28,-34},{-20,-26}})));
    Parts.SystemicPeripheralVessels systemicPeripheralVessels                     annotation(Placement(transformation(extent={{-26,-84},{16,-44}})));
    Parts.LeftHeart leftHeart                     annotation(Placement(transformation(extent={{46,10},{84,48}})));
  equation
    connect(heartIntervals.Tas,leftHeart.Tas) annotation(Line(visible=true, points={{-61.0,72.6},{38.0,72.6},{38.0,41.16},{48.66,41.16}}, color={0,0,127}));
    connect(heartIntervals.Tav,leftHeart.Tav) annotation(Line(visible=true, points={{-61.0,69.6},{34.0,69.6},{34.0,37.36},{48.66,37.36}}, color={0,0,127}));
    connect(heartIntervals.T0,leftHeart.T0) annotation(Line(visible=true, points={{-61.0,62.4},{24.0,62.4},{24.0,29.76},{48.66,29.76}}, color={0,0,127}));
    connect(heartIntervals.Tvs,leftHeart.Tvs) annotation(Line(visible=true, points={{-61.0,65.8},{30.0,65.8},{30.0,33.56},{48.66,33.56}}, color={0,0,127}));
    connect(HeartRate.y,heartIntervals.HR) annotation(Line(visible=true, points={{-89.6,88.08},{-88.0,88.08},{-88.0,70.8},{-83.4,70.8}}, color={0,0,127}));
    connect(heartIntervals.Tas,rightHeart.Tas) annotation(Line(visible=true, points={{-61.0,72.6},{-44.0,72.6},{-44.0,43.16},{-39.34,43.16}}, color={0,0,127}));
    connect(heartIntervals.Tav,rightHeart.Tav) annotation(Line(visible=true, points={{-61.0,69.6},{-46.0,69.6},{-46.0,39.36},{-39.34,39.36}}, color={0,0,127}));
    connect(heartIntervals.Tvs,rightHeart.Tvs) annotation(Line(visible=true, points={{-61.0,65.8},{-48.0,65.8},{-48.0,35.56},{-39.34,35.56}}, color={0,0,127}));
    connect(heartIntervals.T0,rightHeart.T0) annotation(Line(visible=true, points={{-61.0,62.4},{-52.0,62.4},{-52.0,31.76},{-39.34,31.76}}, color={0,0,127}));
    connect(Pth.y,leftHeart.PTH) annotation(Line(visible=true, points={{-81.6,20.08},{-66.0,20.08},{-66.0,54.0},{14.0,54.0},{14.0,45.34},{54.74,45.34}}, color={0,0,127}));
    connect(Pth.y,systemicVeins.IntrathoracicPresssure) annotation(Line(visible=true, points={{-81.6,20.08},{-66.0,20.08},{-66.0,-20.0},{-60.12,-20.0},{-60.12,-49.4}}, color={0,0,127}));
    connect(Pth.y,systemicArteries.IntrathoracicPresssure) annotation(Line(visible=true, points={{-81.6,
            20.08},{-66,20.08},{-66,-20},{62.88,-20},{62.88,-49.88}},                                                                                                    color={0,0,127}));
    connect(Pth.y,pulmonaryCirculation.IntrathoracicPresssure) annotation(Line(visible=true, points={{-81.6,20.08},{-66.0,20.08},{-66.0,54.0},{14.0,54.0},{14.0,18.0},{21.92,18.0},{21.92,12.2}}, color={0,0,127}));
    connect(rightHeart.PTH,Pth.y) annotation(Line(visible=true, points={{-33.26,47.34},{-66.0,47.34},{-66.0,20.08},{-81.6,20.08}}, color={0,0,127}));
    connect(systemicVeins.bloodFlowOutflow,rightHeart.fromCentralVeins) annotation(Line(points={{-89.16,
            -60.4},{-96,-60.4},{-96,6},{-38.77,6},{-38.77,21.69}},                                                                                             color={0,0,255}, smooth=Smooth.None, thickness=1));
    connect(pulmonaryCirculation.bloodFlowInflow,rightHeart.toPulmonaryArtery) annotation(Line(points={{1.92,
            5.15},{-5.71,5.15},{-5.71,22.83}},                                                                                                  color={0,0,255}, thickness=1, smooth=Smooth.None));
    connect(systemicVeins.bloodFlowInflow,systemicPeripheralVessels.bloodFlowOutflow) annotation(Line(points={{-36.84,-60.4},{-28,-60.4},{-28,-60},{-24.95,-60}}, color={0,0,255}, smooth=Smooth.None, thickness=1));
    connect(systemicArteries.bloodFlowOutflow,systemicPeripheralVessels.bloodFlowInflow) annotation(Line(points={{33.84,-60.33},{18,-60.33},{18,-60},{16,-60},{14.95,-60.2}}, color={255,0,0}, smooth=Smooth.None, thickness=1));
    connect(systemicPeripheralVessels.PeripheralArteriolarResistance,RSP.y) annotation(Line(points={{-7.1,-44.4},{-7.1,-29.92},{-19.6,-29.92}}, color={0,0,127}, smooth=Smooth.None));
    connect(pulmonaryCirculation.bloodFlowOutflow,leftHeart.fromPulmonaryVeins) annotation(Line(points={{38.72,
            4.55},{49.23,4.55},{49.23,19.69}},                                                                                                    color={255,0,0}, thickness=1, smooth=Smooth.None));
    connect(leftHeart.toAorta,systemicArteries.bloodFlowInflow) annotation(Line(points={{82.29,
            20.83},{96,20.83},{96,-60.33},{86.16,-60.33}},                                                                                    color={255,0,0}, thickness=1, smooth=Smooth.None));
    annotation(Diagram(graphics), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,127},
              fillPattern =                                                                                                    FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}}),Text(visible=true, origin={-5.2177,53.2399},
              fillPattern =                                                                                                    FillPattern.Solid, extent={{-48.6213,-19.0003},{48.6213,19.0003}}, textString
              =                                                                                                    "Model of", fontName="Arial"),Text(visible=true, origin={0.7994,5.879},
              fillPattern =                                                                                                    FillPattern.Solid, extent={{-99.2006,-34.121},{99.2006,34.121}}, textString
              =                                                                                                    "Hemodynamics", fontName="Arial")}), experiment(StopTime=20, NumberOfIntervals=5000));
  end ModelOfHaemodynamics;

  annotation(Diagram(coordinateSystem(extent={{-160.0,-105.0},{148.5,105.0}}, preserveAspectRatio=true, initialScale=0.1, grid={5,5})), uses(Modelica(
          version="3.2.1")));
end ModelOfHaemodynamics;
