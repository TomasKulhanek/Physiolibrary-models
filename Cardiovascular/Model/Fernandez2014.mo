within Cardiovascular.Model;
package Fernandez2014
  extends Modelica.Icons.ExamplesPackage;
  model Hemodynamics_shallow
        extends Cardiovascular.Icons.Runnable_Shallow;

    Physiolibrary.Hydraulic.Components.Inertia Ltc(I(displayUnit=
            "mmHg.s2/ml") = 10678.18997523, volumeFlow_start(displayUnit=
            "m3/s") = 0.0001372)
      annotation (Placement(transformation(extent={{-94,42},{-74,62}})));
    Physiolibrary.Hydraulic.Components.IdealValveResistance tricuspidValve(
        Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 3159740.5817355)
      annotation (Placement(transformation(extent={{-52,42},{-32,62}})));
    Physiolibrary.Hydraulic.Components.Inertia Lpv(I(displayUnit=
            "mmHg.s2/ml") = 19822.372560862, volumeFlow_start(displayUnit=
            "m3/s") = -1.9e-9)
      annotation (Placement(transformation(extent={{38,42},{58,62}})));
    Physiolibrary.Hydraulic.Components.IdealValveResistance pulmonaryValve(
        Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 733273.1307825)
      annotation (Placement(transformation(extent={{62,42},{82,62}})));
    Physiolibrary.Hydraulic.Components.Inertia Lmt(I(displayUnit=
            "mmHg.s2/ml") = 10261.557514558, volumeFlow_start(displayUnit=
            "m3/s") = 0.0001141) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={74,-22})));
    Physiolibrary.Hydraulic.Components.IdealValveResistance mitralValve(
        Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 2106493.721157)
      annotation (Placement(transformation(extent={{56,-32},{36,-12}})));
    Physiolibrary.Hydraulic.Components.Inertia Lav(I(displayUnit=
            "mmHg.s2/ml") = 16250.665802014, volumeFlow_start(displayUnit=
            "m3/s") = -1.4e-8) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-44,-22})));
      Physiolibrary.Hydraulic.Components.IdealValveResistance  aorticValve(
        Pknee=0, _Ron(displayUnit="(mmHg.s)/ml") = 2399802.97347)
      annotation (Placement(transformation(extent={{-62,-32},{-82,-12}})));
    replaceable Physiolibrary.Types.Constants.FrequencyConst HR(k=1.2)
      annotation (Placement(transformation(extent={{-56,20},{-40,34}})));
    replaceable Smith2004.Parts.VentricularInteraction
                             ventricularInteraction
      annotation (Placement(transformation(extent={{-28,-14},{32,40}})));
    Physiolibrary.Types.Constants.PressureConst Pth(k=-533.28954966)
      annotation (Placement(transformation(extent={{38,32},{48,42}})));
    Physiolibrary.Hydraulic.Components.ElasticVesselElastance
      pulmonaryArteries(
      ZeroPressureVolume=0,
      useExternalPressureInput=true,
      volume_start=3.904e-05,
      Elastance=49195960.956135) annotation (Placement(transformation(
          extent={{-19,-18},{19,18}},
          rotation=0,
          origin={-175,-30})));
    Physiolibrary.Hydraulic.Components.Resistor Rpul(Resistance(displayUnit=
           "(mmHg.s)/ml") = 20691634.526808) annotation (Placement(
          transformation(
          extent={{-15,-16},{15,16}},
          rotation=90,
          origin={-177,10})));
    Physiolibrary.Hydraulic.Components.ElasticVesselElastance
      pulmonaryVeins(
      ZeroPressureVolume=0,
      useExternalPressureInput=true,
      volume_start=0.0008269,
      Elastance=973253.4281295) annotation (Placement(transformation(
          extent={{-18,-18},{18,18}},
          rotation=0,
          origin={-178,50})));
    Physiolibrary.Types.Constants.PressureConst Pth1(k=-533.28954966)
      annotation (Placement(transformation(
          extent={{-6,-6},{6,6}},
          rotation=0,
          origin={-226,44})));
    Physiolibrary.Hydraulic.Components.ElasticVesselElastance aorta(
      ZeroPressureVolume=0,
      volume_start=0.0001241,
      Elastance=92165766.41999)
      annotation (Placement(transformation(extent={{186,34},{218,66}})));
    Physiolibrary.Hydraulic.Components.Resistor Rsys(Resistance(displayUnit=
           "(mmHg.s)/ml") = 145054757.50752) annotation (Placement(
          transformation(
          extent={{-16,-16},{16,16}},
          rotation=270,
          origin={202,6})));
    Physiolibrary.Hydraulic.Components.ElasticVesselElastance venaCava(
      ZeroPressureVolume=0,
      volume_start=0.0002952,
      Elastance=786602.0857485)
      annotation (Placement(transformation(extent={{186,-44},{218,-12}})));
  equation
    connect(Ltc.q_out, tricuspidValve.q_in) annotation (Line(
        points={{-74,52},{-52,52}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(tricuspidValve.q_out, ventricularInteraction.rvflow)
      annotation (Line(
        points={{-32,52},{4,52},{4,40},{2,40}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(ventricularInteraction.rvflow, Lpv.q_in) annotation (Line(
        points={{2,40},{20,40},{20,52},{38,52}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Lpv.q_out, pulmonaryValve.q_in) annotation (Line(
        points={{58,52},{62,52}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Pth.y, ventricularInteraction.Pth) annotation (Line(
        points={{49.25,37},{52,37},{52,15.16},{26,15.16}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(ventricularInteraction.frequency, HR.y) annotation (Line(
        points={{-22,15.16},{-30,15.16},{-30,27},{-38,27}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Lmt.q_out, mitralValve.q_in) annotation (Line(
        points={{64,-22},{56,-22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(mitralValve.q_out, ventricularInteraction.lvflow) annotation (
       Line(
        points={{36,-22},{2,-22},{2,-14}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Lav.q_in, ventricularInteraction.lvflow) annotation (Line(
        points={{-34,-22},{0,-22},{0,-14},{2,-14}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(aorticValve.q_in, Lav.q_out) annotation (Line(
        points={{-62,-22},{-54,-22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryArteries.q_in, Rpul.q_in) annotation (Line(
        points={{-175,-30},{-176,-30},{-176,-5},{-177,-5}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rpul.q_out, pulmonaryVeins.q_in) annotation (Line(
        points={{-177,25},{-176,25},{-176,50},{-178,50}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Pth1.y, pulmonaryArteries.externalPressure) annotation (Line(
        points={{-218.5,44},{-198,44},{-198,-15.6},{-159.8,-15.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(pulmonaryArteries.externalPressure, pulmonaryVeins.externalPressure)
      annotation (Line(
        points={{-159.8,-15.6},{-198,-15.6},{-198,64.4},{-163.6,64.4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(aorta.q_in, Rsys.q_in) annotation (Line(
        points={{202,50},{202,22}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(Rsys.q_out, venaCava.q_in) annotation (Line(
        points={{202,-10},{202,-28}},
        color={0,0,0},
        thickness=1,
        smooth=Smooth.None));
    connect(pulmonaryVeins.q_in, Ltc.q_in) annotation (Line(
        points={{-178,50},{-136,50},{-136,52},{-94,52}},
        color={0,0,0},
        thickness=1));
    connect(pulmonaryArteries.q_in, aorticValve.q_out) annotation (Line(
        points={{-175,-30},{-128,-30},{-128,-22},{-82,-22}},
        color={0,0,0},
        thickness=1));
    connect(Lmt.q_in, venaCava.q_in) annotation (Line(
        points={{84,-22},{144,-22},{144,-28},{202,-28}},
        color={0,0,0},
        thickness=1));
    connect(aorta.q_in, pulmonaryValve.q_out) annotation (Line(
        points={{202,50},{142,50},{142,52},{82,52}},
        color={0,0,0},
        thickness=1));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-340,-80},
              {360,80}})),
      Icon(coordinateSystem(extent={{-340,-80},{360,80}},
            preserveAspectRatio=false)),
      experiment(
        StartTime=0,
        StopTime=100,
        Tolerance=1e-006,
        Interval=0.2));
  end Hemodynamics_shallow;

  model HemodynamicsFernandez
    extends Cardiovascular.System(
      redeclare Parts.PulmonaryCirculation pulmonaryCirculation,
      redeclare Parts.Heart heart,
      redeclare Parts.SystemicCirculation systemicCirculation);
      extends Cardiovascular.Icons.Runnable_System;
    annotation (experiment(StopTime=5, __Dymola_NumberOfIntervals=5000),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-40},
              {20,40}})));
  end HemodynamicsFernandez;

  package Parts
    extends Modelica.Icons.UtilitiesPackage;
      connector HydraulicElastanceInput = input
        Physiolibrary.Types.HydraulicElastance
      "input HydraulicElastance as connector" annotation (
      defaultComponentName="hydraulicelastance",
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
             Connector with one input signal of type HydraulicElastance.
             </p>
             </html>"));
    connector HydraulicElastanceOutput = output
        Physiolibrary.Types.HydraulicElastance
      "output HydraulicElastance as connector" annotation (
      defaultComponentName="hydraulicelastance",
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
           Connector with one output signal of type HydraulicElastance.
           </p>
           </html>"));
    connector HydraulicResistanceInput = input
        Physiolibrary.Types.HydraulicResistance
      "input HydraulicResistance as connector" annotation (
      defaultComponentName="hydraulicresistance",
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
    connector HydraulicResistanceOutput = output
        Physiolibrary.Types.HydraulicResistance
      "output HydraulicResistance as connector" annotation (
      defaultComponentName="hydraulicresistance",
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

    model pulsos "generates relative position in heart period from 0 to 1"
      discrete Physiolibrary.Types.Time HP(start=0)
        "heart period - duration of cardiac cycle";
      Boolean b(start=false);
      Physiolibrary.Types.RealIO.TimeOutput T0
        "start time of cardiac cycle";
      Physiolibrary.Types.RealIO.FrequencyInput HR annotation (Placement(
            transformation(extent={{-158,20},{-118,60}}),
            iconTransformation(extent={{-88,-32},{-48,8}})));
      Modelica.Blocks.Interfaces.RealOutput heartphase annotation (
          Placement(transformation(extent={{-162,64},{-142,84}}),
            iconTransformation(extent={{72,-24},{92,-4}})));
    equation
      b = time - pre(T0) >= pre(HP);
      when {initial(),b} then
        T0 = time;
        HP = 1/HR;
      end when;
      heartphase = (time - pre(T0))/pre(HP);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Ellipse(
                      extent={{-46,52},{68,-78}},
                      lineColor={0,0,255},
                      fillPattern=FillPattern.Solid,
                      fillColor={255,170,170})}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end pulsos;

    model VariableElasticityGenerator

      pulsos pulsos1(HP(displayUnit="s", start=1))
        annotation (Placement(transformation(extent={{-62,42},{-42,62}})));
      Modelica.Blocks.Math.Product product1 annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=270,
            origin={11,23})));
      Modelica.Blocks.Sources.Constant const(k=0.87) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={30,56})));
      Modelica.Blocks.Math.Product product2 annotation (Placement(
            transformation(
            extent={{-5,-5},{5,5}},
            rotation=0,
            origin={-9,31})));
      Physiolibrary.Types.RealIO.HydraulicComplianceInput maxelastance
        annotation (Placement(transformation(extent={{-104,2},{-64,42}}),
            iconTransformation(
            extent={{-14,-14},{14,14}},
            rotation=270,
            origin={-4,76})));
      Physiolibrary.Types.RealIO.FrequencyInput heartRate annotation (
          Placement(transformation(extent={{-106,32},{-66,72}}),
            iconTransformation(
            extent={{-13,-13},{13,13}},
            rotation=270,
            origin={-37,77})));
      Physiolibrary.Types.RealIO.HydraulicComplianceOutput
        hydrauliccompliance annotation (Placement(transformation(extent={{
                30,4},{50,24}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-14,-14})));
      Curve curve(
        x={0,0.0625,0.125,0.1875,0.25,0.3125,0.375,0.4375,1},
        y={0.0066,0.16,0.32,0.45,0.625,0.78,0.27,0.0066,0.0066},
        slope={0,0,2.32,2.44,2.64,-2.84,-6.1872,0,0})
        annotation (Placement(transformation(extent={{-30,48},{-10,68}})));
      HydraulicElastanceToCompliance hydrauliccompliance1
        annotation (Placement(transformation(extent={{0,54},{8,62}})));
    equation
      connect(heartRate, pulsos1.HR) annotation (Line(
          points={{-86,52},{-76,52},{-76,50.8},{-58.8,50.8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(maxelastance, product2.u2) annotation (Line(
          points={{-84,22},{-48,22},{-48,28},{-15,28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.y, product1.u2) annotation (Line(
          points={{-3.5,31},{0.25,31},{0.25,29},{8,29}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product1.y, hydrauliccompliance) annotation (Line(
          points={{11,17.5},{11,14},{40,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, product1.u1) annotation (Line(
          points={{41,56},{42,56},{42,29},{14,29}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulsos1.heartphase, curve.u) annotation (Line(
          points={{-43.8,50.6},{-36.9,50.6},{-36.9,58},{-30,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product2.u1, hydrauliccompliance1.y) annotation (Line(
          points={{-15,34},{-20,34},{-20,42},{14,42},{14,58},{9,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, hydrauliccompliance1.hydraulicelastance)
        annotation (Line(
          points={{-10,58},{-6,58},{-6,57.9},{-0.1,57.9}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Rectangle(
                      extent={{-58,62},{20,0}},
                      lineColor={0,0,255},
                      fillColor={255,240,234},
                      fillPattern=FillPattern.Solid),Text(
                      extent={{-56,64},{-20,46}},
                      lineColor={0,0,255},
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid,
                      textString="HR"),Text(
                      extent={{-26,64},{26,46}},
                      lineColor={0,0,255},
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid,
                      textString="Emax"),Line(
                      points={{-52,4},{-44,22},{-36,48},{-30,48},{-28,36},{
                -26,6},{-20,6},{0,6}},
                      color={0,0,255},
                      smooth=Smooth.Bezier)}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end VariableElasticityGenerator;

    model Heart
      extends Cardiovascular.Interfaces.Heart;
      //  extends Physiolibrary.Icons.RightHeart;
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        ERMAX(k=103991462.1837)
        annotation (Placement(transformation(extent={{-16,38},{-34,52}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        ELMAX(k=106657909.932)
        annotation (Placement(transformation(extent={{96,44},{80,60}})));
      replaceable Physiolibrary.Types.Constants.FrequencyConst heartRate(k=
            1.3333333333333)
        annotation (Placement(transformation(extent={{-86,48},{-68,62}})));
      Physiolibrary.Hydraulic.Components.IdealValve tricuspidValve(
          useLimitationInputs=true) annotation (Placement(transformation(
              extent={{-74,-42},{-54,-22}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel rightVentricle(
        useComplianceInput=true,
        ZeroPressureVolume=0,
        volume_start=0.00015)
        annotation (Placement(transformation(extent={{-52,-12},{-32,8}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst
        backflowConductance(k=0)
        annotation (Placement(transformation(extent={{-78,2},{-60,16}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
        RRV(k(displayUnit="(mmHg.s)/ml") = 1706526.558912)
        annotation (Placement(transformation(extent={{-88,-20},{-72,-4}})));
      Physiolibrary.Hydraulic.Components.IdealValve mitralValve(
          useLimitationInputs=true)
        annotation (Placement(transformation(extent={{40,-38},{60,-18}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel leftVentricle(
        useComplianceInput=true,
        ZeroPressureVolume=0,
        volume_start=0.00015)
        annotation (Placement(transformation(extent={{68,-10},{88,10}})));
      Physiolibrary.Types.Constants.HydraulicConductanceConst
        backflowConductance1(k=0)
        annotation (Placement(transformation(extent={{36,8},{54,22}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
        RLV(k(displayUnit="(mmHg.s)/ml") = 7839356.380002)
        annotation (Placement(transformation(extent={{24,-12},{40,4}})));
      VariableElasticityGenerator variableElasticityGenerator(const(k=0.87))
        annotation (Placement(transformation(extent={{-70,4},{-22,46}})));
      VariableElasticityGenerator variableElasticityGenerator1(const(k=0.8),
          curve(y={0.0033,0.41,0.63,0.73,0.8,0.76,0.25,0.0033,0.0033},
            slope={0,5.0136,2.56,1.36,0.24,-4.4,-6.0536,0,0}))
        annotation (Placement(transformation(extent={{48,2},{96,44}})));
      Physiolibrary.Hydraulic.Components.IdealValve aorticValve annotation (
         Placement(transformation(
            extent={{10,-11},{-10,11}},
            rotation=180,
            origin={98,1})));
      Physiolibrary.Hydraulic.Components.IdealValve pulmonaryValve
        annotation (Placement(transformation(extent={{-28,4},{-8,24}})));
    equation
      connect(variableElasticityGenerator.hydrauliccompliance,
        rightVentricle.compliance) annotation (Line(
          points={{-49.36,22.06},{-49.36,15.45},{-42,15.45},{-42,6}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartRate.y, variableElasticityGenerator.heartRate)
        annotation (Line(
          points={{-65.75,55},{-55.875,55},{-55.875,41.17},{-54.88,41.17}},
          color={0,0,127},
          smooth=Smooth.Bezier));

      connect(ERMAX.y, variableElasticityGenerator.maxelastance)
        annotation (Line(
          points={{-36.25,45},{-46.96,45},{-46.96,40.96}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(variableElasticityGenerator1.hydrauliccompliance,
        leftVentricle.compliance) annotation (Line(
          points={{68.64,20.06},{68.64,15.45},{78,15.45},{78,8}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(heartRate.y, variableElasticityGenerator1.heartRate)
        annotation (Line(
          points={{-65.75,55},{63.12,55},{63.12,39.17}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(ELMAX.y, variableElasticityGenerator1.maxelastance)
        annotation (Line(
          points={{78,52},{78,52.5},{71.04000000000001,52.5},{
              71.04000000000001,38.96}},
          color={0,0,127},
          smooth=Smooth.Bezier));
      connect(RRV.y, tricuspidValve.Gon) annotation (Line(
          points={{-70,-12},{-70,-22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(backflowConductance.y, tricuspidValve.Goff) annotation (Line(
          points={{-57.75,9},{-57.75,-6.5},{-58,-6.5},{-58,-22}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RLV.y, mitralValve.Gon) annotation (Line(
          points={{42,-4},{44,-4},{44,-18},{44,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(backflowConductance1.y, mitralValve.Goff) annotation (Line(
          points={{56.25,15},{56.25,-1.5},{56,-1.5},{56,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tricuspidValve.q_out, rightVentricle.q_in) annotation (Line(
          points={{-54,-32},{-52,-32},{-52,-2},{-42,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(rightVentricle.q_in, pulmonaryValve.q_in) annotation (Line(
          points={{-42,-2},{-28,-2},{-28,14}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(mitralValve.q_out, leftVentricle.q_in) annotation (Line(
          points={{60,-28},{68,-28},{68,0},{78,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(leftVentricle.q_in, aorticValve.q_in) annotation (Line(
          points={{78,0},{84,0},{84,1},{88,1}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryValve.q_out, rightHeartOutflow) annotation (Line(
          points={{-8,14},{12,14},{12,76},{100,76},{100,40}},
          color={0,0,0},
          thickness=1));
      connect(leftHeartInflow, mitralValve.q_in) annotation (Line(
          points={{100,-20},{100,-20},{100,-46},{36,-46},{36,-28},{40,-28}},
          color={0,0,0},
          thickness=1));

      connect(aorticValve.q_out, leftHeartOutflow) annotation (Line(
          points={{108,1},{112,1},{112,0},{112,-54},{-112,-54},{-112,-20},{
              -100,-20}},
          color={0,0,0},
          thickness=1));
      connect(rightHeartInflow, tricuspidValve.q_in) annotation (Line(
          points={{-100,40},{-100,40},{-100,4},{-100,0},{-90,0},{-90,-32},{
              -74,-32}},
          color={0,0,0},
          thickness=1));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-120,-60},{120,80}})), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-120,-60},{120,80}}),
            graphics={Text(
              extent={{-98,48},{102,88}},
              lineColor={0,0,0},
              textString="Fernandez")}));
    end Heart;

    model SystemicCirculation
      extends Cardiovascular.Interfaces.Systemic;
      Physiolibrary.Hydraulic.Components.ElasticVessel aorta(
        useComplianceInput=true,
        ZeroPressureVolume=0,
        volume_start=0.0001)
        annotation (Placement(transformation(extent={{44,-10},{64,10}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EAO(
          k=106657909.932)
        annotation (Placement(transformation(extent={{32,14},{48,28}})));
      Physiolibrary.Hydraulic.Components.Conductor peripheralResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{18,-12},{-2,12}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel peripheralVessels(
          useComplianceInput=true, volume_start=0.00334)
        annotation (Placement(transformation(extent={{-32,-12},{-12,8}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
        RPS(k(displayUnit="(mmHg.s)/ml") = 81793284.679103)
        annotation (Placement(transformation(extent={{-10,16},{8,34}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPS(
          k=2039832.5274495)
        annotation (Placement(transformation(extent={{-38,18},{-22,32}})));
      Physiolibrary.Hydraulic.Components.Conductor venacavaResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-40,-14},{-60,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel venacava(
          useComplianceInput=true, volume_start=0.0005)
        annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
      replaceable
        Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst
        ECV(k(displayUnit="mmHg/ml") = 533289.54966)
        annotation (Placement(transformation(extent={{-100,22},{-84,36}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
        RCV(k(displayUnit="(mmHg.s)/ml") = 80793366.77349)
        annotation (Placement(transformation(extent={{-70,18},{-52,36}})));
      AortaFlowMeasurement bloodFlowMeasurement
        annotation (Placement(transformation(extent={{44,-12},{24,8}})));
      Physiolibrary.Hydraulic.Components.Conductor aortaResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{90,-12},{70,12}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
        RAO(k(displayUnit="(mmHg.s)/ml") = 1666529.8426875)
        annotation (Placement(transformation(extent={{60,18},{78,36}})));
    equation
      connect(EAO.y, aorta.compliance) annotation (Line(
          points={{50,21},{50,8},{54,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(peripheralVessels.q_in, peripheralResistance.q_out)
        annotation (Line(
          points={{-22,-2},{-12,-2},{-12,0},{-2,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RPS.y, peripheralResistance.cond) annotation (Line(
          points={{10.25,25},{10.25,25.5},{8,25.5},{8,7.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(EPS.y, peripheralVessels.compliance) annotation (Line(
          points={{-20,25},{-20,6},{-22,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(peripheralVessels.q_in, venacavaResistance.q_in) annotation (
          Line(
          points={{-22,-2},{-40,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(venacavaResistance.q_out, venacava.q_in) annotation (Line(
          points={{-60,-2},{-72,-2},{-72,0},{-82,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(ECV.y, venacava.compliance) annotation (Line(
          points={{-82,29},{-82,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RCV.y, venacavaResistance.cond) annotation (Line(
          points={{-49.75,27},{-49.75,17.5},{-50,17.5},{-50,5.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(peripheralResistance.q_in, bloodFlowMeasurement.q_out)
        annotation (Line(
          points={{18,0},{22,0},{22,-2},{24,-2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(bloodFlowMeasurement.q_in, aorta.q_in) annotation (Line(
          points={{44,-2},{50,-2},{50,0},{54,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(aorta.q_in, aortaResistance.q_out) annotation (Line(
          points={{54,0},{70,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RAO.y, aortaResistance.cond) annotation (Line(
          points={{80.25,27},{80.25,26.5},{80,26.5},{80,7.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(venacava.q_in, q_out) annotation (Line(
          points={{-82,0},{-91,0},{-100,0}},
          color={0,0,0},
          thickness=1));
      connect(q_in, aortaResistance.q_in) annotation (Line(
          points={{100,0},{95,0},{90,0}},
          color={0,0,0},
          thickness=1));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-120,-60},{120,60}})), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-120,-60},{120,60}}),
            graphics={Text(
              extent={{-106,34},{94,74}},
              lineColor={0,0,0},
              textString="Fernandez")}));
    end SystemicCirculation;

    model PulmonaryCirculation
      extends Cardiovascular.Interfaces.Pulmonary;
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryArteries(
        useComplianceInput=true,
        ZeroPressureVolume=0,
        volume_start=0.00012)
        annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPA(
          k=17771874.242419)
        annotation (Placement(transformation(extent={{-28,18},{-12,32}})));
      Physiolibrary.Hydraulic.Components.Conductor pulmonaryResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{18,-10},{38,10}})));
      Physiolibrary.Hydraulic.Components.ElasticVessel pulmonaryVeins(
          useComplianceInput=true, volume_start=0.00024)
        annotation (Placement(transformation(extent={{52,-10},{72,10}})));
      Physiolibrary.Types.Constants.HydraulicElastanceToComplianceConst EPV(
          k=4399638.784695)
        annotation (Placement(transformation(extent={{42,18},{60,32}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
        RPV(k(displayUnit="(mmHg.s)/ml") = 19051769.161603)
        annotation (Placement(transformation(extent={{10,18},{24,30}})));
      Physiolibrary.Hydraulic.Components.Conductor arteryResistance(
          useConductanceInput=true)
        annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
      Physiolibrary.Types.Constants.HydraulicResistanceToConductanceConst
        RPA(k(displayUnit="(mmHg.s)/ml") = 1479878.5003065)
        annotation (Placement(transformation(extent={{-66,18},{-52,30}})));
    equation
      connect(EPA.y, pulmonaryArteries.compliance) annotation (Line(
          points={{-10,25},{-10,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(EPV.y, pulmonaryVeins.compliance) annotation (Line(
          points={{62.25,25},{62.25,25.5},{62,25.5},{62,8}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pulmonaryVeins.q_in, pulmonaryResistance.q_out) annotation (
          Line(
          points={{62,0},{38,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(pulmonaryArteries.q_in, pulmonaryResistance.q_in) annotation (
         Line(
          points={{-10,0},{18,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RPV.y, pulmonaryResistance.cond) annotation (Line(
          points={{25.75,24},{26,24},{26,6},{28,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(arteryResistance.q_out, pulmonaryArteries.q_in) annotation (
          Line(
          points={{-40,0},{-10,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RPA.y, arteryResistance.cond) annotation (Line(
          points={{-50.25,24},{-48,24},{-48,6},{-50,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(q_out, pulmonaryVeins.q_in) annotation (Line(
          points={{100,0},{82,0},{62,0}},
          color={0,0,0},
          thickness=1));
      connect(arteryResistance.q_in, q_in) annotation (Line(
          points={{-60,0},{-100,0},{-100,0}},
          color={0,0,0},
          thickness=1));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-40},{100,40}})), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-40},{100,40}}),
            graphics={Text(
              extent={{-98,10},{102,50}},
              lineColor={0,0,0},
              textString="Fernandez")}));
    end PulmonaryCirculation;

  model Curve
      "2D natural cubic interpolation spline defined with (x,y,slope) points"
    //workaround for openmodelica error: Cyclically dependent constants or parameters found in scope Physiolibrary.Blocks.Interpolation.Curve: {data,x}, {data,y}, {data,slope}.
    //Error: Error occurred while flattening model Physiolibrary.Blocks.Interpolation.Curve
    parameter Real x[:] "x coordinations of interpolating points";
    parameter Real y[:] "y coordinations of interpolating points";
    parameter Real slope[:] "slopes at interpolating points";
      Modelica.Blocks.Interfaces.RealInput u annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}})));
      Modelica.Blocks.Interfaces.RealOutput val
        annotation (Placement(transformation(extent={{80,-20},{120,20}})));
    protected
      parameter Real a[:, :]=
          Physiolibrary.Blocks.Interpolation.SplineCoefficients(
                  x,
                  y,
                  slope)
        "cubic polynom coefficients of curve segments between interpolating points";
  equation
      val = Physiolibrary.Blocks.Interpolation.Spline(
                x,
                a,
                u);
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics), Icon(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
                      extent={{-100,100},{100,-100}},
                      lineColor={0,0,127},
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid),Line(
                      points={{-70,-76},{-20,-48},{0,12},{34,62},{76,72}},
                      color={0,0,127},
                      smooth=Smooth.Bezier),Line(
                      points={{-48,-82},{-48,90},{-48,90}},
                      color={0,0,127},
                      smooth=Smooth.Bezier,
                      arrow={Arrow.None,Arrow.Filled}),Line(
                      points={{-72,-74},{68,-74},{68,-74}},
                      color={0,0,127},
                      smooth=Smooth.Bezier,
                      arrow={Arrow.None,Arrow.Filled})}));
  end Curve;

    block HydraulicElastanceToCompliance
      "Reciprocal value of hydraulic compliance"

      Physiolibrary.Types.RealIO.HydraulicComplianceOutput y
        "HydraulicCompliance output" annotation (Placement(transformation(
              extent={{40,-10},{60,10}}), iconTransformation(extent={{40,-10},
                {60,10}})));
      HydraulicElastanceInput hydraulicelastance "HydraulicElastance input"
        annotation (Placement(transformation(extent={{-68,-28},{-28,12}}),
            iconTransformation(extent={{-54,-14},{-28,12}})));
    equation
      y = 1/hydraulicelastance;
      annotation (
        defaultComponentName="hydrauliccompliance",
        Diagram(coordinateSystem(extent={{-40,-40},{40,40}},
              preserveAspectRatio=false), graphics),
        Icon(coordinateSystem(extent={{-40,-40},{40,40}},
              preserveAspectRatio=false), graphics={Rectangle(
                      extent={{-40,40},{40,-40}},
                      lineColor={0,0,0},
                      radius=10,
                      fillColor={236,236,236},
                      fillPattern=FillPattern.Solid),Rectangle(
                      extent={{-28,3},{20,-4}},
                      lineThickness=1,
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid,
                      pattern=LinePattern.None),Polygon(
                      points={{24,10},{24,-10},{36,0},{36,0},{24,10}},
                      lineThickness=1,
                      smooth=Smooth.None,
                      fillColor={0,0,255},
                      fillPattern=FillPattern.Solid,
                      pattern=LinePattern.None),Text(
                      extent={{-16,30},{12,2}},
                      lineColor={0,0,255},
                      fillColor={255,240,234},
                      fillPattern=FillPattern.Solid,
                      textString="1"),Text(
                      extent={{-22,-10},{16,-32}},
                      lineColor={0,0,255},
                      fillColor={255,240,234},
                      fillPattern=FillPattern.Solid,
                      textString="E")}));
    end HydraulicElastanceToCompliance;

    model AortaFlowMeasurement
      "measures flow, diastolic, systolic and mean pressure"
      extends Physiolibrary.Hydraulic.Sensors.FlowMeasure;
      import Physiolibrary.Types.RealIO.*;
      import Physiolibrary.Types.*;
      PressureOutput Ps "Systolic pressure during heart cycle" annotation (
          Placement(transformation(extent={{-72,-42},{-52,-22}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-80,-30})));
      PressureOutput Pd "Diastolic pressure during heart cycle" annotation (
         Placement(transformation(extent={{-50,-40},{-30,-20}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-30})));
      PressureOutput Pmean "Mean pressure during heart cycle" annotation (
          Placement(transformation(extent={{-10,-36},{10,-16}}),
            iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-38,-30})));
      Real SumPressure(start=0) "sum of pressure of cardiac cycle";
      Pressure Pmin(start=13300);
      Pressure Pmax;
      discrete Boolean b(start=false) "beat signal";
      Time T0(start=0) "start of cardiac cycle ";
      discrete Time HP(start=1) "length of cardiac cycle";
    initial algorithm
      Ps := q_in.pressure;
      Pd := q_in.pressure;
    equation
      Pmax = max(Pmax, q_in.pressure);
      Pmin = min(Pmin, q_in.pressure);
      b = der(q_in.pressure) > 0;
      when {b and not pre(b)} then
        T0 = time "initial time of current cardiac cycle";
        HP = if (pre(T0) > 0) then time - pre(T0) else 1;
        Pmean = SumPressure/pre(HP) "mean pressure";
        Ps = Pmax
          "systolic pressure = maximum pressure during cardiac cycle";
        Pd = Pmin
          "diastolic pressure=minimal pressure during cardiac cycle";
        reinit(SumPressure, 0) "reinitialisation of sum pressure";
        reinit(Pmax, q_in.pressure) "reinitialisation of maximal pressure";
        reinit(Pmin, q_in.pressure) "reinitialisation minimal pressure";
      end when;
      der(SumPressure) = q_in.pressure;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
                {-100,-100},{100,100}}), graphics={Text(
                      extent={{-52,11},{52,-11}},
                      lineColor={0,0,0},
                      fillColor={85,170,255},
                      fillPattern=FillPattern.Solid,
                      origin={-77,30},
                      rotation=90,
                      textString="Ps",
                      textStyle={TextStyle.Bold}),Text(
                      extent={{-53,10},{53,-10}},
                      lineColor={0,0,0},
                      fillColor={85,170,255},
                      fillPattern=FillPattern.Solid,
                      origin={-56,29},
                      rotation=90,
                      textString="Pd"),Text(
                      extent={{-55,12},{55,-12}},
                      lineColor={0,0,0},
                      fillColor={85,170,255},
                      fillPattern=FillPattern.Solid,
                      origin={-32,35},
                      rotation=90,
                      textString="Pmean"),Text(
                      extent={{-29,12},{29,-12}},
                      lineColor={0,0,255},
                      fillColor={85,170,255},
                      fillPattern=FillPattern.Solid,
                      origin={34,7},
                      rotation=90,
                      textString="SV"),Text(
                      extent={{-30,11},{30,-11}},
                      lineColor={0,0,255},
                      fillColor={85,170,255},
                      fillPattern=FillPattern.Solid,
                      origin={55,8},
                      rotation=90,
                      textString="CO")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics));
    end AortaFlowMeasurement;

  end Parts;

  annotation (conversion(from(
        version="1",
        script="ConvertFromFernandezModel_1.mos",
        version="")), Documentation(info="<html>
<p>Model as presented in [1], reimplemented an extended.</p>
<p><br>[1] Fernandez de Canete J, Luque J, Barbancho J, Munoz V. Modelling of long-term and short-term mechanisms of arterial pressure control in the cardiovascular system: An object-oriented approach. Comput Biol Med 2014;47:104&ndash;12.</p>
</html>"));
end Fernandez2014;
